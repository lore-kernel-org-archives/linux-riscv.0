Return-Path: <SRS0=HaOg=QW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17659C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 08:04:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD168214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 08:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JTMhkVNk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="2xQN4FpO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD168214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTxbHCwnqHuJMNT/hb9d1h+x97Ku8Gp5LpRUn54MC34=; b=JTMhkVNkf3g9Xn
	9RBnoM5BYLm/CxUA7BFSLquBLY/y07dcXFXm7VSfAbKBwZSoK2Q+jmEMzyDKxeVdou1KA+K1CZ26g
	cbDBGM501L6EvSM1GzCqnJYplqtjw8OVQBX1NDCVYDZdGtR/SIpK595cn3ZNuRiMA4IhaYfYxBkF1
	C5LlUebYzRzaMrrqOOtSlPrx/Xv1FCfo7gO8Em0pgGW8y43Hme2YA/5gM/tNQnmbLDS3pPV9FDCkn
	2WWg6ZnpwPj3sje9hrmhRfHeEOJhJ/aZn3lRm1NkOOQ/Tx3pqmsm19yC4YD0m7vZc2T26tdDX/JSD
	EGHWsg/FgpiWII8dXHWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guYTl-00052V-QG; Fri, 15 Feb 2019 08:04:13 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guYTi-000527-EI
 for linux-riscv@lists.infradead.org; Fri, 15 Feb 2019 08:04:12 +0000
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x1F83tVm013872
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 17:03:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x1F83tVm013872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1550217836;
 bh=kHKbz0gOv35Ah/QQhnBmrwbYc/guOMnBm5JbWFvPQrQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2xQN4FpOTqwbGcbGEAXjXa1e5FmcwxC1oMXIrbgyonBS8oOg+OxMYYj+BopMRwQT2
 mfw1/xYm6D1zg3Jl1C31m+Ty3OMt76hWZWvEgERXHeIj2NcKWorfDmF3TsCMkG+kmV
 D5lmyddj5bl8AR/fmRgqcJkGu+rHpx8disQoPAG7PIQGDTjlmxhrWBR6qn0Lrj/zSj
 xZFb5vpuG14b/GJNk7w1iGxO3LypxIGQ7iBEYW4S7j6HXSq57Eeha0stlVVn3CI20y
 J3tnZLR9VoaZxOcVYKN52ouG3lFuy0066/ATAokp1APUpVobxNlfeXM8t5yX8v+jL2
 8DfVCzOym/fsw==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id z18so5287934vso.7
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 00:03:56 -0800 (PST)
X-Gm-Message-State: AHQUAuY0crSHQkVTHdjGqVoWliazGGpsgMuS+W+xBlkk5RrUCRlGbKM9
 nRRXsHVblcQmHBNrDxjrEaNlS6rrMpCLNLVGQxc=
X-Google-Smtp-Source: AHgI3Iahfm5Xcwy0sIHWy0ApJ/yAOiV7JONTiN2xT2/kKwRTRvgfCpC9tfWmVJeNXL9iAgxPRe2CjirFE+7P4rhB788=
X-Received: by 2002:a67:7f43:: with SMTP id a64mr4278793vsd.155.1550217835117; 
 Fri, 15 Feb 2019 00:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-10-hch@lst.de>
In-Reply-To: <20190213174005.28785-10-hch@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Feb 2019 17:03:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQL-7fMadH1R2SrmwJyDBRoCiECJ-WSJrztO2o+wkV06w@mail.gmail.com>
Message-ID: <CAK7LNAQL-7fMadH1R2SrmwJyDBRoCiECJ-WSJrztO2o+wkV06w@mail.gmail.com>
Subject: Re: [PATCH 09/11] lib: consolidate the GENERIC_CSUM symbol
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_000410_694976_6CAD5479 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: linux-xtensa@linux-xtensa.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 2:41 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Add one definition to lib/Kconfig and let the architectures
> select if it supported.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>



> diff --git a/arch/unicore32/Kconfig b/arch/unicore32/Kconfig
> index 52b4d48e351a..9de1d983a99a 100644
> --- a/arch/unicore32/Kconfig
> +++ b/arch/unicore32/Kconfig
> @@ -29,9 +29,6 @@ config UNICORE32
>           designs licensed by PKUnity Ltd.
>           Please see web page at <http://www.pkunity.com/>.
>
> -config GENERIC_CSUM
> -       def_bool y
> -
>  config NO_IOPORT_MAP
>         bool
>



You missed to add 'select GENERIC_CSUM' for unicore32.



-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
