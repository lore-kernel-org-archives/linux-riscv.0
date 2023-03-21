Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04179C6FD20
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcBQXDFYpMqzmNwiCDybq9hfYXV2uI1ZbIyheKM9Rb4=; b=MZ1gLEkvK0pSTf
	8oyVctRUi0O9CLpz1voyKT3JiNE69FQypD/pkPeke39Jr0d2C7NXYXqqqVfeL2OWtkJy2ZUNppWKC
	qcz+xHCxmdjD6R2W2qGUPC/Hb9Gap67zoePOWxGWpGuHmAsI3PrioCb/yiswyrwwVvGxJYaej5VDw
	c051OSvn0q9Vs1Yo84QTTr7RgBjjMQ+ReJjIMQ0H9VjyxKPzFamTGKlk3exjE1MoYax/fP2jP2xkV
	CBJXPDr6WMUN29lKuAKl9g3iYXtoqBePjVe2U1TOgh01/RNfups0Xj22CcGnzhR00CRBNoNgDrvAg
	GTW3Ocfghtk0qntuOXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peiaB-00DhMn-0O;
	Tue, 21 Mar 2023 20:27:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peia8-00DhMK-2Z
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 20:27:45 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1peiZr-00042j-6n; Tue, 21 Mar 2023 21:27:27 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, Evan Green <evan@rivosinc.com>
Subject:  Re: [PATCH v4 4/6] RISC-V: hwprobe: Support probing of misaligned access
 performance
Date: Tue, 21 Mar 2023 21:27:25 +0100
Message-ID: <4204101.kQq0lBPeGt@diego>
In-Reply-To: <20230314183220.513101-5-evan@rivosinc.com>
References:  <20230314183220.513101-1-evan@rivosinc.com>
 <20230314183220.513101-5-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_132744_835482_C72DE0C2 
X-CRM114-Status: UNSURE (   8.36  )
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
Cc: slewis@rivosinc.com, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Philipp Tomsich <philipp.tomsich@vrull.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <sudeep.holla@arm.com>, Guo Ren <guoren@kernel.org>, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 14. M=E4rz 2023, 19:32:18 CET schrieb Evan Green:
> This allows userspace to select various routines to use based on the
> performance of misaligned access on the target hardware.
> =

> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>

With the mentioned comment about the origin of the thead valie

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
