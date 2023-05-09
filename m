Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BCAC7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 19:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFLRiVifTa/4Ezs9agjQm07m/UFN9RMi5Bqp4TTuJvo=; b=vbOYs8yOgyXKpj
	GPu10PXNTlkJFo/qRgLk6Nj7OUU9Nydi2gAoHwEpatLFyIDlpGosWdE1++fGcAE54R74g2oPNQRw0
	FMMJjYnItpbeHCg2+uDB8HOyivLffKuqNlj69hjM9ZlzJJGbjmSRCCjmxmH6oNBM2BBoLEei3MeI0
	ym/bD58Z5czBMSwyjhrw6cE1+yi3wKv9h+JjNRZKX++WnXJhcKDOoARvaS4GMVPa0v25x114driGm
	shTYUyDxao0aBjlfTo75m+7ZrZ1W7cFUXAk7pgAzXHLmBeht6MU6NdNDWa8aB44BlSb7S9Ib8Tsjx
	qME2h97twwyVgf1WDWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwSh1-0045IS-1y;
	Tue, 09 May 2023 19:08:11 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwSgy-0045G2-0U
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 19:08:10 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4QG72v0NH2z1r2sF;
	Tue,  9 May 2023 21:07:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4QG72t5sZZz1qqlS;
	Tue,  9 May 2023 21:07:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id yso-XuuckmCF; Tue,  9 May 2023 21:07:49 +0200 (CEST)
X-Auth-Info: w4NQfO3soUsw8RkOB5e7u4hvvdQvUWQgRbXNQVjJq0PodgIkJvk8KeWFGS7X8Z2g
Received: from igel.home (aftr-62-216-205-77.dynamic.mnet-online.de [62.216.205.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  9 May 2023 21:07:49 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 463252C1D3C; Tue,  9 May 2023 21:07:49 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin
 <npiggin@gmail.com>,  Christophe Leroy <christophe.leroy@csgroup.eu>,
  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  linuxppc-dev@lists.ozlabs.org,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org,  Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <20230215143626.453491-2-alexghiti@rivosinc.com> (Alexandre
	Ghiti's message of "Wed, 15 Feb 2023 15:36:24 +0100")
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
	<20230215143626.453491-2-alexghiti@rivosinc.com>
X-Yow: I want EARS!  I want two ROUND BLACK EARS to make me feel warm 'n
 secure!!
Date: Tue, 09 May 2023 21:07:49 +0200
Message-ID: <87wn1h5nne.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_120808_334676_68618705 
X-CRM114-Status: UNSURE (   6.73  )
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

That does not work with UEFI booting:

Loading Linux 6.4.0-rc1-1.g668187d-default ...
Loading initial ramdisk ...
Unhandled exception: Instruction access fault
EPC: ffffffff80016d56 RA: 000000008020334e TVAL: 0000007f80016d56
EPC: ffffffff002d1d56 RA: 00000000004be34e reloc adjusted
Unhandled exception: Load access fault
EPC: 00000000fff462d4 RA: 00000000fff462d0 TVAL: ffffffff80016d56
EPC: 00000000802012d4 RA: 00000000802012d0 reloc adjusted

Code: c825 8e0d 05b3 40b4 d0ef 0636 7493 ffe4 (d783 0004)
UEFI image [0x00000000fe65e000:0x00000000fe6e3fff] '/efi\boot\bootriscv64.efi'
UEFI image [0x00000000daa82000:0x00000000dcc2afff]

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
