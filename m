Return-Path: <SRS0=x9rf=L6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7BDC07E9E
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 19:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6F861C73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 19:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6F861C73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WEowalzucguNKeCimpt1N+a3FxXBXhT3jyBPD99ovM=; b=Mzj4CfI22Lz1c/
	exoynGUx5f8zlyxaqLXyjogo+PEbRc7MnkQelmqAmrMBhc+HCiiXvXyiNhhFGxpDTh5E7De8PC6r8
	DcM6zSpdNxhEwOciHuuvSaw0GT0SGzPEQAPnHsrtdxKwq8n2gSQMwDdQgowZfBcBkXb8xl9Y3/d1M
	JX47rZY8hblXXRW2uwXz2k+GncMQf84/z3PeGqMulaeGif17TiH180D6mDeif7vuMA2zGGUermhPT
	g+aEXdOwgcSc+TZC+ScR4Lq7HeHkUFq1kN5CScAd81Czk+rzSXlQHeHudbXziZVpTk+wDDCo/8bTd
	MAfG+zCESfmGeyb7fCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0qQA-00Cd7O-QC; Tue, 06 Jul 2021 19:07:50 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0qQ6-00Cd5y-ES
 for linux-riscv@lists.infradead.org; Tue, 06 Jul 2021 19:07:49 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GKBrm0xkKz1qtQY;
 Tue,  6 Jul 2021 21:07:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GKBrl5Kw0z1r6PF;
 Tue,  6 Jul 2021 21:07:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id fw-QNfhDit5D; Tue,  6 Jul 2021 21:07:34 +0200 (CEST)
X-Auth-Info: hqIQnrhVC+qQkOv/oIdG6t6LH5c2HROoPvvXkgRTysOBYhEovzDSoGAHzQryEqTD
Received: from igel.home (ppp-46-244-191-40.dynamic.mnet-online.de
 [46.244.191.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  6 Jul 2021 21:07:34 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id D078B2C0B25; Tue,  6 Jul 2021 21:07:33 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Ard Biesheuvel <ardb@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Atish Patra <atish.patra@wdc.com>,
 linux-efi@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] RISC-V: load initrd wherever it fits into memory
References: <20210629134018.62859-1-xypron.glpk@gmx.de>
X-Yow: How many retired bricklayers from FLORIDA are out purchasing
 PENCIL SHARPENERS right NOW??
Date: Tue, 06 Jul 2021 21:07:33 +0200
In-Reply-To: <20210629134018.62859-1-xypron.glpk@gmx.de> (Heinrich
 Schuchardt's message of "Tue, 29 Jun 2021 15:40:18 +0200")
Message-ID: <877di3mfbe.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_120746_688721_900E69C9 
X-CRM114-Status: GOOD (  10.89  )
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

On Jun 29 2021, Heinrich Schuchardt wrote:

> Requiring that initrd is loaded below RAM start + 256 MiB led to failure
> to boot SUSE Linux with GRUB on QEMU, cf.
> https://lists.gnu.org/archive/html/grub-devel/2021-06/msg00037.html
>
> Remove the constraint.
>
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

With that patch the image in
http://download.opensuse.org/ports/riscv/tumbleweed/iso/ work again.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
