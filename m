Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067DAC36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 16:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ULW2ddl+5xBMdrmC9kUe1UDeS6DrFWyFz3hJiZRYKw=; b=agYnHdDV/6m5FF
	Twbc3nAokdZua/rNtnUSKa0eXWUUw2yl3+mB587HxL9aWtupv9VU9TXiOLU5vUhWJQi5lstuixuOt
	HFNVbGthTGdemonxpT4JaR9gZuEp88NsSPhy4M1sbd+xcRoaodaiUdd9d90KlYOzvQu/Yz0HCcyCA
	elnTMxKK7Av1NFMNcHtww/ERlknOj6FYDyAlee6nOiAqVnJukNL+beXr++/VlqHNGXTX65qip9ih2
	69nuS8y8kJfT0gnTAw/pd5cdtexiQmsfQWV8dVzbdCT+n5R5Z7DNOxgN6SAsGtyiFlIFVrTVvSlFU
	2ivmSa6EVOyBukpfRfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvf9T-0000000FUIt-1dFP;
	Fri, 21 Mar 2025 16:23:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvf9Q-0000000FUIG-24Qr
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 16:23:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2064BA447B0;
	Fri, 21 Mar 2025 16:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B070BC4CEE3;
	Fri, 21 Mar 2025 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742574195;
	bh=uhN6QJh0tP83UgoduWmaigRwPkVaACTLj8V+BUixCws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t7gPvO3okxvDMLDqE4vtR0NptCjPnaTAqAqUwY3qA/DfySDChcOVpbmG5vpe/8RVJ
	 TUcu7fYT1pYBNBo4cVtentnH6ATRwjYhV+cdQ5304hCyc7giVcUGIL1peapF9KXO4X
	 dCZ3Bw/RstpIWLo8sOLQk1F/lH76+JK5lPWlIHmi45fKc6WWBGieuK3VRGwsi3gFVj
	 meQnBcSupj12gb67FwJHx/QdKAjjM4T84Xr4JPigVlnzD0sckKH9HG1UiHspr9PTi4
	 Kgq+CNkVvN9OvmaQ9UF67LRzXC56ukdco3SYjd4lsdz2e8IP5aR0rkm//NdtUwJJD4
	 1iICj7yAU750g==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/10] Basic device tree support for ESWIN EIC7700 RISC-V SoC
Date: Fri, 21 Mar 2025 16:21:50 +0000
Message-ID: <20250321-trimness-unwind-0ffafee4ac8a@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=646; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=G5nMXPv07/5t5qEEHTEA3VTjgeOZ3saVfKZymta3BuE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOl3Jyk6nJ7/OTf/3mtx64Ctwmf+FhRPnFWmpLMvnW2v3 Iz5PoVbO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARpxyG/8URCaFT+Q/8UrpX 6lXeUV/3Ty9tTemRRZVB7IevGfmfWcLIcM8o7Hvinq2Jy8V3zirel7PHSO/G6kNHXfkkdrNl/zV dxQAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_092316_596699_9FE438BD 
X-CRM114-Status: GOOD (  10.20  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 20 Mar 2025 16:24:39 +0530, Pinkesh Vaghela wrote:
> Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> P550 CPU cluster and the first development board that uses it, the
> SiFive HiFive Premier P550.
> 
> This patch series adds initial device tree and also adds ESWIN
> architecture support.
> 
> [...]

Applied to riscv-cache-for-next, but too late for this merge window.
They'll be 6.16 material, the commit hashes below will change when I
rebase on top of 6.15-rc1.

[05/10] dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC compatibility
        https://git.kernel.org/conor/c/a506a819af37
[06/10] cache: sifive_ccache: Add ESWIN EIC7700 support
        https://git.kernel.org/conor/c/4a9d4db6ba17

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
