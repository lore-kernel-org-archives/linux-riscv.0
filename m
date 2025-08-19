Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC54CA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 00:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNoXRBdqvF1HzyTWBUCSrYkqUhwaGlNLlJxzkGXuU88=; b=BB+36dWMkCNGkF
	ua2i+IEZHrSfGSd1kZB4fljtp2hgErOXNiCZoumWP41DkjBmpkNTpNZK9aSwyEosDGxx4D9b/EE35
	Q/zcK+BgtBE6bx7vux1eanZXhbrbex1bJP2AD+KtRg72cudKkYODQr6zLb7PGCOpHh61yPlTVlKPT
	qyySHSBdokQGi7sDps2ieVduA8SzE2dG43Hw5x+CU3ek9SagThNvc++2I3zMP6sqNx7oTO0XJGNf4
	zaIV8juSP6dAnN0/sLfcCt2HAS1npSS3cXd7zpGjaytAy2HY5JqQOZjEsfnYcE5XAHYrHBbaQTmQC
	Epuyur37K9LfSVtNTy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoA9r-00000008zt3-1Elw;
	Tue, 19 Aug 2025 00:24:59 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoA5u-00000008zcm-39VE
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 00:20:56 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-70a9f5d4d97so50603816d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 17:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755562853; x=1756167653; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwm+TVO3IE31QnUKkVxKkaPevhmZdZk1VLFBsWnyn6o=;
        b=O4e2Ynrex0LzKJXL4E8hUDBw4bJRW4bjlKSmph9fKZXbHl+2WNrTVg2Na0BSAxm339
         gSQuvZVYCMFbVcE+cUCorRxzd+5P5tAX9ASN/ST01cbaJOGeSNG+pFoVOUt/4c1YNW+i
         rtTOO1D+GoPBcLCXaZf9Fp07IIFG6UfzX3QKC/MFqtguUOphnyx/FQqE+jdMfscwASlr
         /DfOZAsRYYcEo5DCincwQ2d0xWTbhLaGDheRZYWlxJ5Y7PU7NUzPEP/Yqc/uTFVLQMNV
         ACXaI09Owjl96ptO/1dy007g7XPu1/R9tQcuPbso7hqW2TmWU0bJV2qJdh+Jb2xM1VAt
         ulJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755562853; x=1756167653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwm+TVO3IE31QnUKkVxKkaPevhmZdZk1VLFBsWnyn6o=;
        b=InXedPcfMY9IqctzNLhzw+0cAJch8I2NEBqQzXWBb+Zt+xTNLgRifseVBbr+GxfH93
         kVkgyu/YOCj+eAJAJISrq3SXP++C8g8eUQSwFtAei/1F4hHY2n95KbZy/5/29VFBQhl+
         5Au1E9lhimjHITV+6pU9PecrT+/jRTb7I7gbDtgore1AFtnu9GXMQh1/v15CHsEsp2LX
         xk0eaF9FWN7Ejc1bz4vjB4FVuHmTtxmwsP8l8ynj0KcLrgW8hI8qCzhEl7DdRvFebI+A
         hbJpM+aWpdbwn/Hx0zJ6iBzvj7vnwwlLesus5Fa9kfXQsE0Uu5Tnp39CK6xJNlmcwJ96
         eTXg==
X-Forwarded-Encrypted: i=1; AJvYcCX8kHg9vn+ug5lsdizMbd87hwCKv7ip5jHaKDET9VvczhsIaf5DUpHOfcN5RMJpAETg4tsHCGn4wjMSJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlCDkQtymFoiD6N6jYuJZ3bKJjh5oV+7E1HZJdmsZqeUYsNr0f
	QLn7Sk3ekXZ1RWJ12bkZNHbgf4+3A9+z3SYHeji99GngMXpAjgiNrgoGmZQt9fHCYb0=
X-Gm-Gg: ASbGnctmwIDEVlIcag+pKYD41YAqktGbAK2x4GUGrvoZ7OBSQSRp4kcAfhHIySkVc4O
	JaKoGHKQIIsy6MGsX6ST3xhk8iYsJ6Bkd6yLCkjOr1cI0FVNSuHxd6AOCooQ2Jkkk1flyzHQOYs
	zclXQ0IjP9zIfofjNJwVc4Ja0gV1Us5iU5iNQL9uHv8dkRrxueJttSgISdJ3Z/HZXqqOoFI9fQe
	cReJZB8SZ26fs/4wQ583MhdgNhsAK1DuAXsnfQhn2WeAwdcvYM7GOUTXxtxdnKCbwNAcsJ3xjr5
	NdE2QADgCtxqetnF2sd3KaS5tduFv2iA6kwJrfRDj/2EmMjG9EZ+XaGNdNQGOKJEWpgV75eZxUT
	6zRAN7T9n5SWlSUO8U9fD6NI=
X-Google-Smtp-Source: AGHT+IGUgrllTL7Y8fMaxyBiG7OjFs5eQq62OO4Qg66bHPzC0RUUqBKv3WgzNhUUD2BQ4eiTpGJ75A==
X-Received: by 2002:a05:6214:2b0f:b0:707:7694:4604 with SMTP id 6a1803df08f44-70c2b6f4f67mr8160386d6.30.1755562853487;
        Mon, 18 Aug 2025 17:20:53 -0700 (PDT)
Received: from localhost ([173.23.183.85])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba92f89e7sm60632856d6.45.2025.08.18.17.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 17:20:53 -0700 (PDT)
Date: Mon, 18 Aug 2025 19:20:52 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: dayss1224@gmail.com
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v2 0/3] KVM: riscv: selftests: Enable supported test cases
Message-ID: <20250818-be8ccd84eebf62dafa95caa3@orel>
References: <cover.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1754308799.git.dayss1224@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_172054_800284_E975377D 
X-CRM114-Status: GOOD (  15.58  )
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

On Thu, Aug 07, 2025 at 10:59:27PM +0800, dayss1224@gmail.com wrote:
> From: Dong Yang <dayss1224@gmail.com>
> 
> Add supported KVM test cases and fix the compilation dependencies.
> ---
> Changes in v2:
> - Delete some repeat KVM test cases on riscv
> - Add missing headers to fix the build for new RISC-V KVM selftests
> 
> Dong Yang (1):
>   KVM: riscv: selftests: Add missing headers for new testcases
> 
> Quan Zhou (2):
>   KVM: riscv: selftests: Add common supported test cases
>   KVM: riscv: selftests: Use the existing RISCV_FENCE macro in
>     `rseq-riscv.h`
> 
>  tools/testing/selftests/kvm/Makefile.kvm              | 6 ++++++
>  tools/testing/selftests/kvm/include/riscv/processor.h | 2 ++
>  tools/testing/selftests/rseq/rseq-riscv.h             | 3 +--
>  3 files changed, 9 insertions(+), 2 deletions(-)
>

The two fix patches need to come before the Makefile patch in order to
avoid breaking the build.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
