Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B59C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DFE260F57
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 07:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DFE260F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tHLGrFp/wMrWsqrZJN4z+GmtnXmgB/30HMHC+Vl0ygQ=; b=ZvcJGAlTLdPJJVpgdd/hqPlLuU
	9Iguf+ajZ9Tr2r8/LJP/gRFqTA0c+GUnh73rIGniaxashj3O4QWWUHpbd0BGyhXVvYqw3f0dEJNJ3
	pPo0rTV3lkmj2ucACFknRStGXMgyzoGzvPHUnUnGFFTKvEFyn0gbUxaF7WuJBQVjDpZqB7lQytYpa
	5Lap9w3+2j6F/AlpqPcyh58hnbV5usKeK/53RnqNmYszy1bBa58RF9RAFRXNjd69O3paiXvAOjgEB
	IDa+CksdqYIYu9vl55rlb8sDmQLQ49kz63JBw9sxddmusb77qLsTmplGRUBIAPEDE3huu87+9s494
	uzwmfS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE5D7-008v1R-6e; Thu, 12 Aug 2021 07:33:05 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4z7-008se8-IW
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 07:18:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso9308808pjb.1
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 00:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bVBs890c5u5oz2MryX7OZ1h4zgixesuI0BRji18LRrg=;
 b=u7eMUjdjPwPQXq3gIFrxl1G8er1+Y2Lx0FYqO3H+OgBSy9P2xRmFPFju6UOjfaCN2L
 iDv+1BANF3WXQNAKoOOnflqUHL4iJ3xQZpJE3vevBp58tZtmR7ZbzeaTgeJOVZzOnGgy
 uoq8edt5FyeM1TeKedIFmDRtEsh8Of6zAYFfCp/khql4eXd2Dq/ZY9WyZh7iq6cs64Ee
 9iSctiDNW0Y0pyFkKb+CT58B8fQCee+hsTUcXhTy8iCjpw0jqH87J+23zt6QIFe/xkJw
 KJ/XozuwYQZ4RD/nNZx35t0u5jEKXpIKEvuoFmLP6ZbyyGT3iGs+dDIQpBdNDI5QG92w
 41Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bVBs890c5u5oz2MryX7OZ1h4zgixesuI0BRji18LRrg=;
 b=O6tSN+/x3Zj7bkfPKR+4AC6yv4kSbMatdvGgsPUIjm2LySj7gOWnC3gnKjG7+O6EUx
 ewGOIXCiEXLSHbHc4nA1E1kun5A3enbYQTyYmHYhF7Nq8Ah7jw8Ug3CwZCyi8rIdrFFQ
 lFGkAX9bw1DZcLPAVVQmlImOEZ+3AKa+j8Ev6NPCEYKItOWiZojz8Lp+rlKmx9OatfCx
 ZaU4yOQCDGt4/3pYhVFqwEDC1X9MhKKTzdO0FRy45Uq4z3FJK2LFzXoNjZyJ2IDn42Qy
 4z515w8rZp7TZYHimZBzaMO4cwZBHKwwjJXch6av4pzzaDRu4A2xejAxltQi33ARSiZ7
 WX7A==
X-Gm-Message-State: AOAM532hzAqg6ogLcOWuM+NeeBF7LRI0WlsF/Bbgxdxg5W/31zgNl4cH
 mil487N42DF9NFL6YX2RDjO6XA==
X-Google-Smtp-Source: ABdhPJw0QuQAsmx19Nk18vjri8KXE+GeQaTUIMg9VZ1xbOe4RYWCcjEjKISkAvKBWV6lohHzwfOh9w==
X-Received: by 2002:aa7:9f06:0:b029:3c6:c469:9135 with SMTP id
 g6-20020aa79f060000b02903c6c4699135mr2826167pfr.27.1628752716609; 
 Thu, 12 Aug 2021 00:18:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o1sm2113173pfd.129.2021.08.12.00.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:18:35 -0700 (PDT)
Date: Thu, 12 Aug 2021 00:18:35 -0700 (PDT)
X-Google-Original-Date: Wed, 11 Aug 2021 23:54:16 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: defconfig: enable NLS_CODEPAGE_437,
 NLS_ISO8859_1
In-Reply-To: <20210726112647.78561-1-xypron.glpk@gmx.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 heinrich.schuchardt@canonical.com, Atish Patra <Atish.Patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, 
 kernel@esmil.dk, sagar.kadam@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, xypron.glpk@gmx.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: xypron.glpk@gmx.de
Message-ID: <mhng-16eb6b79-280a-46ef-813f-cc2924793d50@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_001837_702945_F25A286A 
X-CRM114-Status: GOOD (  20.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 26 Jul 2021 04:26:47 PDT (-0700), xypron.glpk@gmx.de wrote:
> The EFI system partition uses the FAT file system. Many distributions add
> an entry in /etc/fstab for the ESP. We must ensure that mounting does not
> fail.
>
> The default code page for FAT is 437 (cf. CONFIG_FAT_DEFAULT_CODEPAGE).
> The default IO character set is "iso8859-1" (cf. CONFIG_NLS_ISO8859_1).
>
> So let's enable NLS_CODEPAGE_437 and NLS_ISO8859_1 in defconfig.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 393bf3843e5c..1a3170d5f203 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -110,6 +110,8 @@ CONFIG_NFS_V4_1=y
>  CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_9P_FS=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_1=m
>  CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y

These both look fine, but I'm getting checkpatch warnings about the 
Signed-off-by address not matching the From address.  Not sure if it's 
just something wrong on my end, but when I send from a different address 
then I want as the Author field I generally end up with a "From: " line 
at the top of my patch.

I know it's a bit pedantic, but IIUC I'm not supposed to take things 
like tihs.  Do you mind re-sending these as patches that are internally 
consistent?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
