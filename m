Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2C6C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnvHXGEiK1Gqp2qLpkbPZ6EFaQvG4SwlckiuR4q6AV4=; b=KXyMscVDKKD5H+
	wcl/EascBTiTYvmsTack5/ihJoFYNmk7882nmm0BJbkOGce9vfWs0BTSBm0PVnfctrY/ooRQTkzph
	oXpRNQGtg8xk+YcfujR+xWUxDkec/neRUVaCEbBJ0MupluRxbq9q2KZLNOdZ0sT3sBXmgkJPMS70M
	yZyPivBO4l5FkhYEBWN12O/4HEGsMYw3clhb+zi4Pm4nOIu2XIzEetQW32yziVgGhZByeefQOjHVL
	ZI6p6grTh96SB4PmFU4TO+Jrl6hj5aSu0Elf0FSOLsqcsNXUMMI6y3cqGSxAgV86wl7CwUu/LxSuR
	qC7tkga3HkC2YS/yAFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXUd-002Sp2-3U; Fri, 24 Feb 2023 12:48:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXUb-002SoO-5f
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 12:48:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pVXUZ-0004KF-Or; Fri, 24 Feb 2023 13:48:03 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: 'Jisheng Zhang ' <jszhang@kernel.org>,
 'Paul Walmsley ' <paul.walmsley@sifive.com>,
 'Palmer Dabbelt ' <palmer@dabbelt.com>,
 'Conor Dooley ' <conor.dooley@microchip.com>,
 'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 5/5] riscv: cpufeature: Drop unused includes
Date: Fri, 24 Feb 2023 13:48:03 +0100
Message-ID: <13210765.uLZWGnKmhe@diego>
In-Reply-To: <20230221185603.570882-6-ajones@ventanamicro.com>
References:  <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-6-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_044805_239890_22B64504 
X-CRM114-Status: UNSURE (   7.53  )
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

Am Dienstag, 21. Februar 2023, 19:56:03 CET schrieb Andrew Jones:
> Do some additional include pruning while dropping errata_list.h,
> which is getting dropped, since cpufeature.c includes hwcap.h
> directly to get cpufeature IDs.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
