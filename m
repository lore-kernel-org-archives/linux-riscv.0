Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B948F41989
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iqkY9DPbZYxmwtZvDqsHgFIXM+n176wjcJyW21WeWKc=; b=dqYEnG+Mi/9x4yxjCpxMl+A2s1
	YO/d5+UhUNV1iTETLRFKkshw03LyrpdTnUgVx3cgWZapfM/l59Uc8rn9QTtl2z/IuUYs+2wxVYfbn
	yYcofj7vlp6jF34212TaCnndwrl8vb0KCEznvIAESzmXWJn6c+ES4a7Vm5jDKwqX0Gmw+b17L+y3H
	1e4LwWEA5XMypeRn5lLGv93IFXgu9DsNAHJG7TvzcWS9I/81GCX13ihYeAcySDCY7XrTeMO8+UN4/
	Qc7F2qqOxMKgxUh+h7rypKuMZZ5fWdxJypjo86crBD0SU/aqOduYEXqDQi6bPeAj/UhSucY68aLRt
	SiTTv55w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwzr-00000000wKZ-23lj;
	Wed, 15 Apr 2026 09:57:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwzq-00000000wK7-2VUI
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 09:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5DC06012A;
	Wed, 15 Apr 2026 09:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D28CC4AF09;
	Wed, 15 Apr 2026 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776247041;
	bh=wH1QJ5TIoR8oX2w9Na/+u1m1rf0anCjBEQAWOnhtT00=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=uXykSiGUMkzGeKIAYXg4pmGp9TnEvttockT1kfCKoKEW0qpGzQ0KXG8EGgxH1JiD9
	 WZV+3PVpb2QCveuL2F+4QKA8cFdJIRlqVoJKrH2fAtl8WWPar3dG7tgFRbVvt8Nxo+
	 u1/e8VU1y7Zj9O0uAQPDiTnY33uvkl8+69H5rTwkgwGMelSa+/TyUGQpcL6lwQLwws
	 eJm5dVY8s02JcWemJR8kkd3pNRNmNSJBwBibIenXv3MMQyvTBX2KG+guq6LkERByPe
	 rMYJXs/60xbfQuX0sO5accC3g3M+ew1zk48A/NX9Lyuk2n9HmdPR3J0TN8dZyW5eIM
	 gQywBmEFdeSdg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1683EF4006A;
	Wed, 15 Apr 2026 05:57:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 15 Apr 2026 05:57:20 -0400
X-ME-Sender: <xms:_2DfadNhTKGrjQwmSn52axFQ6SFI3Zk3oSyDSneV_d_g2JIzl4cPJA>
    <xme:_2DfaawMfFGLIFB96GpdbtAVN2QqgXQW-cF4AfDpKcfQVk02HTKWVlUCJyyaOEJxk
    K-TFvH5csRgnJ9smemJJB0RmVsK9ksXS1_zLprl1Pl_Z0SKaiQhJ3I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegfeejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtg
    hsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehthhgvtghhrghrlhgvshhjvghn
    khhinhhssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthh
    gvnhhkohesihhnthgvlhdrtghomhdprhgtphhtthhopehpjhifsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdgvfhhisehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepughmrghnthhiphhovheshigrnhguvgigrdhruh
X-ME-Proxy: <xmx:AGHfaVMVXjMnW4js4Tf72K1EkpzB0rMWGBZgzkO8V9rQcQSnsHklWg>
    <xmx:AGHfaUiNh4DMYQRveQFIph_HiS2eLbvCrnEexRGq8409PK0TJFs5uA>
    <xmx:AGHfaYsQrKS8SFPmgjwnd_LWBrtGm2xGlhnrfFoK_2m-_Zud9mlTdg>
    <xmx:AGHfaYjuuK6TJDvYXTDDhu9FNkDQ9xSGxSL-ktanQQaofEDLdknmaQ>
    <xmx:AGHfaeaXibxrakcLsQK-WHiXKH4F8mZUjNa85YO3yFGaLAMBzAE7I9SZ>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E2013700065; Wed, 15 Apr 2026 05:57:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 15 Apr 2026 11:56:59 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Dmitry Antipov" <dmantipov@yandex.ru>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Charlie Jenkins" <thecharlesjenkins@gmail.com>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org
Message-Id: <33c3e393-eacc-4ac2-97e4-5ce45c1b6604@app.fastmail.com>
In-Reply-To: <ad9f9543RuV17RnH@ashevche-desk.local>
References: <20260414102608.573555-1-dmantipov@yandex.ru>
 <20260414102608.573555-4-dmantipov@yandex.ru>
 <ad9f9543RuV17RnH@ashevche-desk.local>
Subject: Re: [PATCH v4 3/3] riscv: fix building compressed EFI image
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

On Wed, 15 Apr 2026, at 11:52, Andy Shevchenko wrote:
> On Tue, Apr 14, 2026 at 01:26:08PM +0300, Dmitry Antipov wrote:
>> When building vmlinuz.efi with CONFIG_EFI_ZBOOT enabled,
>> '__lshrdi3()' is also needed to fix yet another link error:
>> 
>> riscv32-linux-gnu-ld: drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
>> __efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'
>> 
>> And since riscv64 can have CONFIG_EFI_ZBOOT but doesn't need these
>> library routines, introduce CONFIG_EFI_ZBOOT_USE_LIBGCC to manage
>> linking of lib-ashldi3.o and lib-lshrdi3.o on riscv32 only.
>
> Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>
> I think you need a tag from Ard on this.
>

I don't think we need a new Kconfig symbol for this.

Better do something like

zboot-riscv-obj-$(CONFIG_32BIT) += lib-ashldi3.o lib-lshrdi3.o
zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
