Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB0BC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Co17hpAo/yFwAN4NbXIbMNipj5bzop6Qp2ut1Z+gbvg=; b=zMsjLUzFe2FICx
	vkbF9vOBg3xLlilHMVlC+nxAv8KQ4ApDcCwakP8qpE8V03HuAOtNopazIiax5h9rnfccc2RW/3a2k
	Ak096WmhIjIbQV6PEy0apC3ww6aHo79sYLNAx5wyOuwX2hJBC0yV9P/bw/hFJ0LXbpkH2NUxiSBo1
	Yjdw62BaeHiSz3yrVEe3hkLVYPsdTiOVzuKG9pX+ODAZKe/dzpbM0JWgNh2LNSwqnFPnuAyVAWkZz
	Z5t0slc/JXWhdfGpWMFKjGuB6GGRXvLzX1YbJDTPXAew1khCstug+rCvMlzCME8rhKNRQKQOZddYg
	YfkQmP3YWPgzx3DTzsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMVO-00000008VZS-2F68;
	Mon, 15 Apr 2024 13:36:18 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMVH-00000008VVo-0FeQ
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:36:17 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso5065825a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713188164; x=1713792964; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik1rd9kTZT4cDzsiZg8RCbbgRc5INy51wGM0TkC03wk=;
        b=V2TmHbhdwvqFMMj4LvOQCAaVeOYe97HSlRi7PsFcVBb20ilx4BBk0HdDt/YVq5/3Q7
         uOnb+hLPrqaUsMMnIvzBXBzOaA58h42SgbHybGX+oRm/1iAuoNHCvBAwAAqSbx+iD5EY
         qk2n9b2ZtulXfg4gylko4XUfTv9wCUdtvTfjgsMU7M6gLpXV9q9c/mDhHgeUBboGe017
         qIsM94AkiPMmbOKDdb4mEaFzcE4mSwx2KhgYFcrxG7rvCt7BtDgVWFhDqeEY8km2AZ3r
         JIV/lRLA/aNnwKa+bmjJ9ciLSxEsgkOvMYieRMVlXmuv0n1sEysHXNIolvqU/Czr+oSJ
         HgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188164; x=1713792964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ik1rd9kTZT4cDzsiZg8RCbbgRc5INy51wGM0TkC03wk=;
        b=Q9AygBLAdbJWkixdpJTkQCTphQ9OrglTyBoj/E1KS2XiEcFA/sLIpX9RE/OEaKlv+l
         kDMXsS6WUrejz5ACHLyvMFx4Fs3K9dgYkgGeHiuLUgnGZX3kuiZPvhNjX3FkrW91+Zpy
         YRidXCsZb7/VPLZiZDjaT5rIZcWhROsmq8lb2kppuAsPY29vvUxVbKFb4FtHmXbiuOMT
         ctJm1ZBRC51zHi7Nsfkzs1zm88qt3Y6sA1ucPhg6uV4E91ZJ5qfwH+0AOKWRECpxi8O6
         UlpemlXwQIocNCp+emoEdBVdqA9owRpGGw5tLRUdcaX9L1/koOsL4lcudPl/MsZHALWb
         VXqA==
X-Forwarded-Encrypted: i=1; AJvYcCUz4f8fXvqZEhVEK3FCpmoZIOXd7sojihFitEZAhYl7iNEczlr41ABWDCl61m2DoqwcgvYrVgW/9uVOM1spt/9tz4bAnHlxoJja8CmWIU3x
X-Gm-Message-State: AOJu0YzhY++z/4JSi9rYu+b521cTwLaBM+lMiMxBDr1kWzs6lJgzWHAT
	oMVLFHK25WP2vZEA8ZnUl0MP50/TLlo90K7av2j2mJRrdQ6YwN0mXE7gVAgwdME=
X-Google-Smtp-Source: AGHT+IEBkh8/VlmJkVNcbXTlR7xWxfl1Gb/HA9GDVYEQgXUvmj0tPoU+uxzOFA/Tf9vaZXoxYUtgyw==
X-Received: by 2002:a50:8a92:0:b0:56c:3dfb:a1f5 with SMTP id j18-20020a508a92000000b0056c3dfba1f5mr7405106edj.22.1713188163639;
        Mon, 15 Apr 2024 06:36:03 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id fd23-20020a056402389700b0057021b811eesm1735813edb.67.2024.04.15.06.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:36:03 -0700 (PDT)
Date: Mon, 15 Apr 2024 15:36:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 23/24] KVM: riscv: selftests: Add a test for counter
 overflow
Message-ID: <20240415-418eb2e18cfeb613d252fff0@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-24-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411000752.955910-24-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_063611_112456_060FC017 
X-CRM114-Status: GOOD (  13.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2024 at 05:07:51PM -0700, Atish Patra wrote:
> Add a test for verifying overflow interrupt. Currently, it relies on
> overflow support on cycle/instret events. This test works for cycle/
> instret events which support sampling via hpmcounters on the platform.
> There are no ISA extensions to detect if a platform supports that. Thus,
> this test will fail on platform with virtualization but doesn't
> support overflow on these two events.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
