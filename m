Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A7AC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYneRwU7HIn80/DpXELtAXyKb91hHlkasoCtpDa+dVI=; b=F+0Z7VXM43d5oK
	8VEaUV2ANWBJrcbjlLjyN58V3d8PrTq86csgIgNGkgfoQ5tcwTpgTilP+olLcjEIsdFsSRoXnVW6P
	Fp+cBkAo4/XxpFNspg4AsPqJBlSFlwfOf/Xi35ez/2WAhjWJ4bBR3VyKEDzqmc9iMoR609VTGuKVP
	FnHrIJa1+lwSxW+7PkvGWr+SKUOZinLFN6v0A0i5URJWOAEWyKQnec7ffmwj15s5jBcPTRy37maAS
	GE2ZSh+FNLTzvdKgYkUof6wN6OdZUYep/olzENGV5AuV3F/jikpn1G9gzMUP3LpU7DxLlz/0Lqo9s
	4lzqCgpBwyqVTemsOtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiABD-003eR0-V9; Tue, 11 Oct 2022 07:59:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiABB-003eQ7-1L
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 07:59:58 +0000
Received: from p5b127dea.dip0.t-ipconnect.de ([91.18.125.234] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oiAB5-0007Ol-7T; Tue, 11 Oct 2022 09:59:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Nikita Shubin <n.shubin@yadro.com>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2] RISC-V: Add mvendorid, marchid, and mimpid to /proc/cpuinfo output
Date: Tue, 11 Oct 2022 09:59:50 +0200
Message-ID: <4820619.CvnuH1ECHv@phil>
In-Reply-To: <20220727043829.151794-1-apatel@ventanamicro.com>
References: <20220727043829.151794-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_005957_104331_3EF3FA34 
X-CRM114-Status: GOOD (  10.28  )
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

Am Mittwoch, 27. Juli 2022, 06:38:29 CEST schrieb Anup Patel:
> Identifying the underlying RISC-V implementation can be important
> for some of the user space applications. For example, the perf tool
> uses arch specific CPU implementation id (i.e. CPUID) to select a
> JSON file describing custom perf events on a CPU.
> 
> Currently, there is no way to identify RISC-V implementation so we
> add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Tested-by: Nikita Shubin <n.shubin@yadro.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
[on Qemu and Allwinner D1]
Tested-by: Heiko Stuebner <heiko@sntech.de>





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
