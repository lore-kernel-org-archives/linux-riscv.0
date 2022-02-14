Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2D1C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPaSOLG+E7UWkNI6WEqvgE8ZOQgv2ye8VjexucDM5Zc=; b=h4qaPJfVg2FXJ5
	TlmBZpCgCiQ81teKkAAQ1A+NGuhV6oz0Bmq41OqdabMV/PfA9/vymPyGfYWjEn1Z5sg5Uf6T/o4p0
	FsC4TavJZw1jmM10V2iko7fKstK40s3siTVjKWcmsIp3jnWPXdc0dRGoYvIV1K0nJH2yc0x39h4Z6
	2ohstZ/qwOncH4bkpFodMP0hWMXJQ5FKKp/5aa8pHjqFfeBgp17YrUh+92GK0YpVKekCMB2VnypVT
	bMKAuUly7Ypwc/IOMUFjNL0JxEBm+pgQ9GC++ZzTWcZbGTjTAdq8QIifZ1iHoJEdSag8yVnT2NBSp
	50XUBhmmHjCFmcPRonUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhap-00GmQR-BH; Mon, 14 Feb 2022 20:05:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJham-00GmPH-MS
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 20:05:01 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJhal-0002kS-Jj; Mon, 14 Feb 2022 21:04:59 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>, Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH v3 3/3] RISC-V: Extract multi-letter extension names from
 "riscv, isa"
Date: Mon, 14 Feb 2022 21:04:59 +0100
Message-ID: <3338405.bqgxkn9aiY@diego>
In-Reply-To: <7677a6ab686d9edcb0c09b56d8323c76008ea8a5.1644647398.git.research_trasio@irq.a4lg.com>
References: <ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com>
 <7677a6ab686d9edcb0c09b56d8323c76008ea8a5.1644647398.git.research_trasio@irq.a4lg.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_120500_781202_155F8423 
X-CRM114-Status: UNSURE (   9.10  )
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

Am Samstag, 12. Februar 2022, 07:30:01 CET schrieb Tsukasa OI:
> Currently, there is no usage for version numbers in extensions as
> any ratified non base ISA extension will always at v1.0.
> 
> Extract the extension names in place for future parsing.
> 
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> [Improved commit text and comments]
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Tested-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
