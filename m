Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D454FC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 00:33:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A43222086A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 00:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uOhE/7+A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hxr9KTSH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A43222086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NeG6JR2tCDpD6vcVXW7CS7JApxYbRVGR4mpekywdns0=; b=uOhE/7+AinUWrbN+W4rtramd6
	4APOM6AH0IlpVh+i2bfocIJqwZvoD7rnahqV/A5wLTi2l3rO1rildDvL59iSZ2C0Q/pjSJcnC5x6o
	5lkvi7KataTQ3jZpNBuZLltiLLx3v4eAZCvF5+bgMR9/MR1ndoIIHSWn1B9sk1QPlbVemBYP03ict
	IA2mva3WDMw3Ifz2a1kud3G+kuJ3ciq5cIXUAVNMfqp6reYcaKDf6P+cUu2KEyATKVLcW1CP2efF2
	4do/ERA/vGLyk93+cyFGVfkBG1b2wFG+vdFhn561tgcqU+nEmt5IWzg1bJm4Fn91UVy5UHfa2w/YM
	S9IqBIQ8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKBmf-0008Bv-Ur; Wed, 07 Nov 2018 00:33:25 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKBmW-00082j-Rq
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 00:33:18 +0000
Received: by mail-pf1-x432.google.com with SMTP id g7-v6so4636229pfo.10
 for <linux-riscv@lists.infradead.org>; Tue, 06 Nov 2018 16:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LO16PbJ/K3AArKyoRoeZEi/U/eQfkTbEnqcKbY4deoI=;
 b=hxr9KTSH9XsaL4QSDJGSeq2D7gYeQ+gSc4OSBVALcwhj1kftBwqw0NuBZf6oh4+f7j
 u0S1oRB43INpUzkiy3mRcIY/yixQlNtXhTLJj+LNBDXNWXKGRDxdn5Hczr8QqEu8sqWv
 WaaDhV7OVsHaF6fY9FqksrxQBJgPrXE2+ywbKzE20DcHB1CK5Gh2TOhERzmafogf4sGl
 +CWg7W4DCmA9oGdk1tGRhkZDGGYRpfxUZkG4kFZm5DAVUJFYcRh+f83SuHTETu6tYhXX
 +XAi3OAQeRPOUBy/7ccJ+K8cyPFKnUCloH5soKs9yr5YeOWUnO+vIagHXE7nQbgN3xBG
 sSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LO16PbJ/K3AArKyoRoeZEi/U/eQfkTbEnqcKbY4deoI=;
 b=UkNHBXZ+2yKhIM0T5AZwNib6goql/8/+yqfnuLENoNcdNoNfjLXGCCoxZ5idVuqgBG
 8qI8Ja/r9CHNQ9pwkkE9/6tn1Pq9s3zekVekdsfJcxm9uksi8lpP4IPdcB/y5RsBM81D
 QYuavOBc7pJW55cG90y0copsqIMtOBl23IkiPFzoFxpEXJMPdpwspuSWOO6quwvr2p+R
 PIF7/412SHtyJQCKH0FFmqoE8wTOkEKWvsWxAh29nOWWzFg4KqcXNPtGbumRT5LWc3X1
 qEeA5zZsPCwbPDD/WTlCryyjOpqQchVtGp/zEbrZqsiz/XhtaA0As0FvaxHcEjJb68+5
 jg6w==
X-Gm-Message-State: AGRZ1gL11Y/04x2e/K9uEot1DRjl4YOOZGZVPRmIQk79ARU+KBzfUX+e
 /qpfF4Rj8sqhRAWQYTSuHEeosQ==
X-Google-Smtp-Source: AJdET5dyHGeCv6RCjsenhZR5NuSHHIaU6jMEuIQVky6pOPd7PghxNCXIIOOnW/D1PirSlaAtmucgEg==
X-Received: by 2002:a62:60c6:: with SMTP id
 u189-v6mr20707613pfb.191.1541550785551; 
 Tue, 06 Nov 2018 16:33:05 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d126-v6sm68107654pgc.32.2018.11.06.16.33.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Nov 2018 16:33:04 -0800 (PST)
Date: Tue, 06 Nov 2018 16:33:04 -0800 (PST)
X-Google-Original-Date: Tue, 06 Nov 2018 16:30:16 PST (-0800)
Subject: Re: [PATCH] riscv: add missing vdso_install target
In-Reply-To: <20181105143537.27396-1-david.abdurachmanov@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-a44df3fe-5958-4566-a057-5e028be53203@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_163316_893989_4EBF074A 
X-CRM114-Status: GOOD (  13.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, david.abdurachmanov@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107003304.kp7KndhD2mepYOtFRG7teJqRyf6NB-6966s0WNC2JE0@z>

On Mon, 05 Nov 2018 06:35:37 PST (-0800), david.abdurachmanov@gmail.com wrote:
> Building kernel 4.20 for Fedora as RPM fails, because riscv is missing
> vdso_install target in arch/riscv/Makefile.
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index d10146197533..4af153a182b0 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -77,4 +77,8 @@ core-y += arch/riscv/kernel/ arch/riscv/mm/
>
>  libs-y += arch/riscv/lib/
>
> +PHONY += vdso_install
> +vdso_install:
> +	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
> +
>  all: vmlinux

While this doesn't smell like it should be an arch-specific thing, it looks 
like everyone else has a copy and they're all slightly different so it'd 
probably be more complexity to merge them than duplicate them.

I'll take this into my PR for next week.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
