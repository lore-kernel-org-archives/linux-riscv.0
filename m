Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7745FECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcnq/ZsYhJRPhOQ0nAb9xPOi6TptvhLIX2GROBrWsis=; b=g06sOp6jyodVIs
	hkOLN3k6FA0/zG2RaNmjefJxOQYHNba59hWL3e3Lrx4fQjaLjfExKq9t2VDGMZHdb/OmvJXRR+UJK
	HYv/W31rHimbZXqzIzD3QvukV/RCEBTEDzAk2LgqGvR6YMVSt0ymu445iGoqXN1ZQrWCBDMt8SO3S
	YsTne79XVnOECLD2nLin9Y+C5jDMXsehG9wgP5ULJffaE9Kq4MdbBYTD6dS6QysuOCq9/b0Fu1VKG
	J6Y+T/prBEIFCg/xOEOMmltJLd0msO1yHAln/2dCEt6/ezd1w7qZarUW3gT/aPG36FVIjVYozjBOb
	yK6dofbPLZ8oMrwC9Wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob3rP-00CEnQ-R1; Wed, 21 Sep 2022 17:50:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob3rM-00CEmW-Qv
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 17:50:10 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ob3rG-0008VX-3J; Wed, 21 Sep 2022 19:50:02 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Print SSTC in canonical order
Date: Wed, 21 Sep 2022 19:50:01 +0200
Message-ID: <21609796.EfDdHjke4D@diego>
In-Reply-To: <20220920204518.10988-1-palmer@rivosinc.com>
References: <20220920204518.10988-1-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_105008_899606_4D801C3A 
X-CRM114-Status: UNSURE (   8.48  )
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

Am Dienstag, 20. September 2022, 22:45:18 CEST schrieb Palmer Dabbelt:
> This got out of order during a merge conflict, fix it by putting the
> entries in the correct order.
> 
> Fixes: 7ab52f75a9cf ("RISC-V: Add Sstc extension support")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
