Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E48C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 20:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IP6OgoAWPQuP6xEuHyaeHq8Ng51GD47vS5E9uh8Inpg=; b=4/i/reYsDRU+f1
	M/ikPUXWZz/KsfbnQ5WBvfOlBYnvhoUoojtlLu2END0SO71x98J0CVUGywS5Yj59oXZSZKInTxi/X
	F1Z5u3a3Gsbb2Q4mIxX+52AcJfPgbRo0dIJYHQKCjV6e3+YTakO/x9udvio1GFfzl9XpmP/u/ywSJ
	NHJAKnQk6ftP7LH9Oibmfd4mxODugqm97unOkQ1OSUOl2HYBRX607lRSJBVrKp2FZmjyXteyd97Da
	0ooo24upLhTH2NXbzSymt+6QyhcAZVvUxR/o3Vvmir6CkX7VHKTKXcfRmbbkz8oEMTOyh0SiykEUS
	ECUyIu7tkNIr8kOkreGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peiVg-00Dfrw-27;
	Tue, 21 Mar 2023 20:23:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peiVd-00Dfqm-2q
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 20:23:07 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1peiVQ-0003xq-DY; Tue, 21 Mar 2023 21:22:52 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v4 1/6] RISC-V: Move struct riscv_cpuinfo to new header
Date: Tue, 21 Mar 2023 21:22:51 +0100
Message-ID: <3703783.44csPzL39Z@diego>
In-Reply-To: <20230314183220.513101-2-evan@rivosinc.com>
References:  <20230314183220.513101-1-evan@rivosinc.com>
 <20230314183220.513101-2-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_132305_916856_D061D0AE 
X-CRM114-Status: UNSURE (   8.82  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, Randy Dunlap <rdunlap@infradead.org>, vineetg@rivosinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, slewis@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, Dao Lu <daolu@rivosinc.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 14. M=E4rz 2023, 19:32:15 CET schrieb Evan Green:
> In preparation for tracking and exposing microarchitectural details to
> userspace (like whether or not unaligned accesses are fast), move the
> riscv_cpuinfo struct out to its own new cpufeatures.h header. It will
> need to be used by more than just cpu.c.
> =

> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
