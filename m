Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1529CCC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kq3URl2eJRYvo3LWoTyl8OHSA7c8nshTYjpqxFj9agI=; b=4VeSgVmpC5MGHM
	iAvPILMp17pxjQ/qAE5u0nzlDG+zgPKzFF77sYC9IfdqrklY5cxSUL1lmUWtpGwqZcC47fdNBjqkw
	RU0QkWENZTOZKWhj6ke+tcRKSTdkwvALzVjJ6KXIPypweMZvF7qRdMSJ8k/HdJj5AEllCwClDa69S
	eHRi8BWShwpT668MW+h7RkRvfRkjiE/izi7lWk/nSmjyBqU7BzFKm40YZdp53pn4HHIJAzbgdAIPw
	ePOVuU8TItbUigoPE3zNXYwg0YOsCdtUZ4f3GszO5hzGVygohMBSCE0Nax7W04u3e+ww5RoYba+Lv
	8t44Gid6w6nNTOabN4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHNA-0000000HDEp-1FR6;
	Thu, 15 Oct 2026 09:03:36 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHN8-0000000HDEJ-238C
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 09:03:35 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso2028508a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055013; x=1792659813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUIkGkj6B9Tv+hZUqi/sJY1ZKDxkj40BHrOHpN+3Sz0=;
        b=dZgMs6HCC74B06kbl7CrAAA0/78iaCIpbKXNZlhfDtArsJO75lguFcL1VxAnkAb4U2
         j+UEZGzBT9N3kONzcAyn6MnB+tZUonAMDMyJ2y2V6/tbu0+D67G4+mpn6QT9c4aN1J4w
         mHXAf63RfKTEkrDgMpvooMUpOti8P7+LRdljYBZojybxOEgX+SO0AGsCLoN4AH0Hd48R
         YB3oZUtchoTHELEZ9rKBb3/5pgLJNVdYiSWPgR5XLx/HYR/7G9iudJh7Zb1AgwtXtjd/
         Dc7rEydlT18+u84oZIMajKt7OWTIF2rm1hw+k6lYPJIwz2uWij7odij27n9CdR92vGRR
         RlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055013; x=1792659813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUIkGkj6B9Tv+hZUqi/sJY1ZKDxkj40BHrOHpN+3Sz0=;
        b=lTwESUEtd/7OMrYzPMEF7lX7l/AOLtgEUkG5vSccEGktmoPniYVfGf/n5OLvO/AfUM
         fVeJpuU8rr5Ri2X4npbwDya2jgISWYYucfgmNh+qRw+4c/JOaDnZjHAziyUFDlXo1JCU
         ydTZCj4P0vcccO1vsfQ+8bnb2f58SVM18qodfU394ahachGyze2YANaRvZPtoXuCoTh4
         SCl8tZl0KncKKVF33hUEpKX46lC2t1OT2B7SrLlFfJaE43Mep4d3FimSd73EaDccbJwu
         8B2QjGfCMAGOx3a39B4wfukjE+u9cxPrg7r4UBTKNzVUKi5ce2sghXSYacq+18spwRIk
         sMfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz59wAVg5fmoQh7bzNGE3qQHO8XPmxHF6n/n/lh2jOGX6FxNqcD3ahRQNl28YyuaTCM8NHF+RL7TdSyKA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL+Bz/jnauoRnJaIaEtXher5xHKxYoSoqBPNYzNm2PJjMxRr96O
	cp6gzaKxIKErG0Aotppgwk0cXnH5qrMp4auGYU1kZw4bXco52E8UDuYT
X-Gm-Gg: AYBFou1s/nvhuNdyTDFfCFEFzvbDowOPDuNqR1EpQjwO+3R7E+jEuv6l7uBoD+9+S2O
	9rj1mFVWPsOpRouNKq1/dAcXIsQMWoOCNbCcgUgU3X8v9qobGv0HhJbFF8msPFFyNXh+nw5EVEp
	j4MgNdlt3CeKJILaRuZG8Y1d1kUFSrrz2TNf9wzFJ0rGPvU3PwZS2BuR3ox5dilbf2io2GgnM3/
	a8zlrHgHVC8J6HIDCgnlUDzD4qMQ3J1UiOnAKLACGMUsxhUaoq3W+tpXFaYivOh2c6HGdoy0rpc
	eci5O97zgGyq2hmYlmVwSY9bDHyocUlMSGT3l9IsOqlFrwhn+KSiIusq/18yZn6nRKiQB8ddZVo
	xWQ/Uqpxe5uOhVf/cRBM18y9kKjJi/eKJtSU4C+LDv1DMJbYhSe1Xt532y5XP7wR81ZW9XKKdFm
	7o8W7Vzzl0lQ2yrkTCMvfh1BV22YSLKJM5zWqRXALBQ7eE4JhErf2mLIr0TCeJnOoY+EG/
X-Received: by 2002:a05:6a21:3944:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3e16bef498emr14329973637.65.1792055013262;
        Thu, 15 Oct 2026 02:03:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635cd3b34sm962553a12.28.2026.10.15.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:03:32 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:03:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atCV8NsJc5Oatoo0@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_020334_563622_525BE680 
X-CRM114-Status: GOOD (  23.65  )
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

On Thu, Oct 15, 2026 at 02:43:40PM +0800, Chen Wang wrote:
> Hello,
> 
> On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
> > Sophgo SoCs such as SG2044 contain eFuses used to store
> > factory-programmed data.
> > 
> > As for SG2044, HW automatically loads the eFuse content
> > into shadow registers which are organized as 32bit values
> > exposed as MMIO.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/nvmem/Kconfig        |  12 +++
> >   drivers/nvmem/Makefile       |   2 +
> >   drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
> >   3 files changed, 190 insertions(+)
> >   create mode 100644 drivers/nvmem/sophgo-efuse.c
> > 
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index c36c2a4c2a0b..a7936dd65bdd 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
> >   	  This driver can also be built as a module. If so, the module
> >   	  will be called nvmem-snvs-lpgpr.
> > +config NVMEM_SOPHGO_EFUSE
> > +	tristate "Sophgo eFuse support"
> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	default ARCH_SOPHGO
> > +	help
> > +	  Say y here to enable support for reading eFuses on Sophgo SoCs
> > +	  such as the CV1800B. These are e.g. used to store factory programmed
> 
> Why is "CV1800B"?
> 

This is an old mistake, this patch follows Jishengs's patch in the first
design. But then almost everything changed and only thing for SG2044 left.
This is the thing that is left to change.

I am not sure whether it should keep this generic name as I see it should
be compatible for most sophgo SoCs (at least it should be for CV1800X, 
by just change offset). Feel free to give if you have some suggestion for
a better name

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
