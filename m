Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2854CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 18:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNqqDLYKgwDHFAGmMQJEVsLVuDDm8Pxv5g4DyYMLiWA=; b=BVAmti12VEAKES
	IRM2CtAgxLgv1Tae1taW0aG0JbnOxZ3DCjAjngkKn25F17hfsWVBs1hkhzFHB8DNP2RDRB73twMkw
	0EAUU/DbCp/3lFnt3ReBkUsdj8dSA+fQa75jdgZlnNEf9nnER0GVkCa/QWyd7oPYsixTJ1EdtzGu+
	RG9g44PpLiUlkiMGXWET0wH7/SfYl2Wvv0fkQbYLPVbck854vfCp8Lj/vbUtaEkg91LNR70mVOEOz
	LeBtGAtjNzkkIY+FRzgZ8PlXQdSvrH6zrzndYZxjyh/wk8mxVq1xSXDezx1TvbDEUk3svfCv521t4
	QJEtsyRSroL1p+gEUBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBab-00FUXT-19;
	Wed, 18 Oct 2023 18:48:17 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBaX-00FUW1-32
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 18:48:16 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4S9fxD6sb1z1r1fc;
	Wed, 18 Oct 2023 20:48:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4S9fxD5Pq3z1qqlS;
	Wed, 18 Oct 2023 20:48:00 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id yVsnDci_gSYG; Wed, 18 Oct 2023 20:47:59 +0200 (CEST)
X-Auth-Info: z53x+HAGnC5Mr85hNarHhEetogq4Juc1fsSdAKqHPeyff1cH7hkefuC/L5r3bMDv
Received: from igel.home (aftr-62-216-205-223.dynamic.mnet-online.de [62.216.205.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 18 Oct 2023 20:47:59 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id C38602C1354; Wed, 18 Oct 2023 20:47:58 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  Eric Biederman <ebiederm@xmission.com>,
  Kees Cook <keescook@chromium.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v4 1/2] riscv: Add remaining module relocations
In-Reply-To: <20231017-module_relocations-v4-1-937f5ef316f0@rivosinc.com>
	(Charlie Jenkins's message of "Tue, 17 Oct 2023 22:34:16 -0700")
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
	<20231017-module_relocations-v4-1-937f5ef316f0@rivosinc.com>
X-Yow: I am having FUN...  I wonder if it's NET FUN or GROSS FUN?
Date: Wed, 18 Oct 2023 20:47:58 +0200
Message-ID: <871qdr938h.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_114814_146054_C4862C67 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

On Okt 17 2023, Charlie Jenkins wrote:

> +static int apply_r_riscv_sub6_rela(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	*(u8 *)location = (*location - ((u8)v & 0x3F)) & 0x3F;

I think that should use *(u8*) on both sides.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
