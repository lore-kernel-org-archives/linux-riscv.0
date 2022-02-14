Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED492C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMxj/X69NPdkJbFVPSOUiKtW5WOQfQrj9itOW+r8dmI=; b=pdGR2b4pBy1YnP
	e1z25H3PgHb7JGgk8KU6mvdo/RYyA1k9EJsRFxLXQE6wvzDbth2cHr13030F9++7Yw+7McpNZg912
	Dn1jtHEcJ0pU76DTd3f1chhMTDWxRqXDHD9LBMl5FzkpG+D7NUekp4xsxcIzwSKSuV2pFcv7Hyw3f
	T5I/hlsOq2IMXIWTFGShM49N3xxXjkEJj/ry21YlJoIoeeXflzg7HGMPHFNBfMgjW3QBLqU5JfVYG
	GK18hduOMEmr3+O6lgTTQQ1s2Wkyp2V2uPOP5H2jE0zdpQwOT3iId+BLgJq41qNegnt/NpXF+7/4N
	6OKDJdz9NB4l9bMylRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJZfQ-00Es4P-U9; Mon, 14 Feb 2022 11:37:17 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJYOc-00ES8k-34
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 10:15:51 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Jy0V924ftz1r86y;
 Mon, 14 Feb 2022 11:15:45 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Jy0V90YlFz1qqkG;
 Mon, 14 Feb 2022 11:15:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ciTL-mIIXXIv; Mon, 14 Feb 2022 11:15:44 +0100 (CET)
X-Auth-Info: k0w8anaaY5GOMTg9kubk4prPg/gPXdju+Qta5i8aIzT4i0LbN2ihZ0bcWJdLYcD/
Received: from igel.home (ppp-46-244-178-131.dynamic.mnet-online.de
 [46.244.178.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 14 Feb 2022 11:15:44 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id BF2382C394F; Mon, 14 Feb 2022 11:15:43 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Ard Biesheuvel <ardb@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Atish Patra <atishp@atishpatra.org>,
 linux-efi@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,  Anup Patel <apatel@ventanamicro.com>,
 stable@vger.kernel.org,  Sunil V L <sunilvl@ventanamicro.com>
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
 <877d9xx14f.fsf@igel.home>
 <9cd9f149-d2ea-eb55-b774-8d817b9b6cc9@gmx.de>
X-Yow: The LOGARITHM of an ISOSCELES TRIANGLE is TUESDAY WELD!!
Date: Mon, 14 Feb 2022 11:15:43 +0100
In-Reply-To: <9cd9f149-d2ea-eb55-b774-8d817b9b6cc9@gmx.de> (Heinrich
 Schuchardt's message of "Mon, 14 Feb 2022 10:24:22 +0100")
Message-ID: <87tud1vjn4.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_021550_333135_5DEF6C52 
X-CRM114-Status: UNSURE (   9.42  )
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

On Feb 14 2022, Heinrich Schuchardt wrote:

> set_boot_hartid() implies that the caller can change the boot hart ID.
> As this is not a case this name obviously would be a misnomer.

initialize_boot_hartid would fit better.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
