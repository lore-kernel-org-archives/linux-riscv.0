Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966B8C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 05:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0G7gdmjJjGHLib+S7AGH/6DYKfVac7KTf4q5NB6n+DU=; b=WUXdtMwHIyvgM5
	VI1M0xAJqyX8/SOAWJfTQnmMGUFYGONs1tjROec48iJa6gNS4pCA8iFD6IctGA+kTuCxW8t00ctnk
	C/gYFYgypvk1lu9epD8/W3KysJoZs3KaNASxTXCllgTvVBNYWEHHE6Y3DAk7BoQtmOVpYBe9vINPY
	a19het9wKbewPLiQ56MEvp9BsBZ9UB9L+d3e0YUXFo2w83mPbI5/SEVBZ2xUojHOe2K/PBJYrUAqJ
	TA6k++4VOO/j2s3kUFxk2xe6XcN0vSc+qJVwptZW5Lf74OX6gId+Z8mKq95bp+9QHXNrZThIV9F3a
	YHFiNo0FkXLNxIy+PZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt3d-006Nj5-5t; Tue, 29 Nov 2022 05:21:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt3a-006NfY-F9
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 05:21:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id v7so10060196wmn.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 21:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LARk8O4PCz3ZLBwlQfBi5BEmv4wZ+Sw+Xo5oGP3B1CE=;
        b=goRbF1RTZ30DicmEQhLpcdVlHHqVOyr753UogRWZ8PxG3ze7LOpEYnqde452O+Id9u
         z0tGgGSHs0Nyy7CnbBISewpFn6dWB0zKSFtwCo2NGRVTUCLTwFA1n/EbJI9zlhG9cCkN
         laH7imHPRRgitkA6HaJKcJfZk9qgkcuf7/HkNwsfndFWgVe68SpVr4q2Tfs44JMMaIvb
         mlsKzhpBk7OpX0QOroseEtg+SlwTqP2YZPmM8qftmKeIcNZmBy5KTLtd/unrgbsakiyI
         J3wfWeu2zMGk/CdOgZPkLwp+zYDO1GXfz6cLFD1PmRUN0Lv3FSo3ErosAOMQuGV4p+hw
         z05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LARk8O4PCz3ZLBwlQfBi5BEmv4wZ+Sw+Xo5oGP3B1CE=;
        b=AdoqaILv8aj/9XQiKHttwGkEtysTptMUx0yzP0DDiZOqSTQAw8txBntKYSrd2xeG+c
         tsH2c42KuRecOi2SiTt5hv/WU/bKmg4cDJawhnJDmsQE/mTi1umge/GnTC0TKFqur4eq
         vGf5HIgouE3WaEYeRCkTO4DJwnU6jFHaksaIBsuivCHX9/r9l22LJ7zeL/SaAfLjMZyb
         TJQWb+dAJGhsD4dYcnxnOjSLS7nF3gq1ih0OdnS74EsLly+BGr+/QvVzpBATnRdsffWb
         2dXZL2icNQIkCncIXoAB3zTOfR0SFLrSBH/dT21eXeXH30aBUkxU06HRoUT3kc2WNyVZ
         Pj0A==
X-Gm-Message-State: ANoB5pm9RkqdNe8X0Rb5fPeJofwrNaO7i8bJFrang39Hu4Zku+QOAgwV
	waP74KkTFUveGznEPpxLvk1USg==
X-Google-Smtp-Source: AA0mqf4b+5BQU3/xN1wFpJu0JTT5Wj0V8fyYcPgx9oKbFzXVQAzV7OTyAHLMTttBrnXjTgoB71lTmA==
X-Received: by 2002:a05:600c:3507:b0:3cf:8e62:f907 with SMTP id h7-20020a05600c350700b003cf8e62f907mr31303586wmq.7.1669699278949;
        Mon, 28 Nov 2022 21:21:18 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r18-20020a056000015200b002421ce6a275sm2816994wrx.114.2022.11.28.21.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 21:21:18 -0800 (PST)
Date: Tue, 29 Nov 2022 06:21:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] RISC-V: KVM: Move sbi related struct and functions
 to kvm_vcpu_sbi.h
Message-ID: <20221129052117.d2o4zadk2z43jgoy@kamzik>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128161424.608889-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_212122_524000_1183C848 
X-CRM114-Status: GOOD (  10.29  )
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

On Mon, Nov 28, 2022 at 09:44:20PM +0530, Anup Patel wrote:
> Just like asm/kvm_vcpu_timer.h, we should have all sbi related struct
> and functions in asm/kvm_vcpu_sbi.h.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h     | 10 ++--------
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  6 ++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
