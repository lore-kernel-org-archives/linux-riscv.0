Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A897C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 20:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQgrANQ8r3p3uIvIpeXHGIq5yEWINaCyNmekebaOfKg=; b=xRD8sDnEjx1c0L
	oERCRbLr+bZCw4EI2oPah/ImrzLZ000kyaBH/04fswdgwBS8H0J2qTulbv4NcMNQAZ9Gs+AxAnqML
	mcCaRBNl8K7xM2xV0ThO5yL51Uv51xwQjJlZP203nU/xip45nYlKxXrpZtFI0h8hqq6PPICGRf7PB
	if+zjSB7LsZQFk5aGR7ZEh4F44WKgEitZWU4YMvOD5xdHYa1ejSrxGKHHbA0pUCi7d4T1t2dh4KSl
	TinaXYYk+vOg5heL7+v4SxU8TqAPsS1mM0Yd7r2nvU1ovKw6kdYngTNmW/Vz2ftkBWCtPFd2zeorB
	SWkqq+KcImcwzdK+VW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJyQ-00000003SnV-0INW;
	Tue, 22 Jul 2025 20:52:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJsd-00000003SKe-0cGE
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 20:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 459D2A56066;
	Tue, 22 Jul 2025 20:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AD6C4CEEB;
	Tue, 22 Jul 2025 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217189;
	bh=0/n304EBrrhIwO7/beO/35oY4Q23YLMRLyZG02akt0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oiW39NK+mCtAQPGjca3Jqr2+w7Rfzh2qLntlAWoiQ7RuE/s9Rgx4ZnePLwBWWnKgr
	 y/zRaIsYUFffwaVTF0LOf3AlT+2f2RzCvrViyWtTnRf2mRJnpJBXq2UZ/pUlAiJpCo
	 bc82H5c6No2OPgh0YO3sjZBAxjfGYT5GFrXkKniNeANO0/GTtEg5AQSlH3/MQGc1PN
	 FNvaBSadEQvQP9XGac0p7EwZp3QED6MDh3Hq3Ldf9m2h0TOP+lHLv2X+VaBs6PfaMZ
	 tLb5eiCCeYoGc6CMCgdAa5fNG1v0BQBt4M19q2Cl2LcpB3DRMazoPsQugzSHevQoBJ
	 okZfTIme9TOYA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org,
	monstr@monstr.eu,
	git@xilinx.com,
	Michal Simek <michal.simek@amd.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Add AMD MicroBlaze V 64bit compatible
Date: Tue, 22 Jul 2025 21:46:18 +0100
Message-ID: <20250722-activator-anthem-b93b62c92527@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <adf316c097ae416eb8565f2f1d67a98c413a71d2.1753169138.git.michal.simek@amd.com>
References: <adf316c097ae416eb8565f2f1d67a98c413a71d2.1753169138.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=440; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QylGl+iLXLcbSGxTurC8fdLCuWCGw2TfymnB3GGjO9Q=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBn1P2Zph/0+lDNpc11KQvgt9xNTFeu4+KPfS39k4dRWX navT/9lRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACaysJKR4dvpjarGS7K/ca85 vELGWqX//GHh8uwvW728m22DLDe9ms7IcORZcq/iihX1x4uevGWz2nx5la3EU55d07e8bNXrFj7 uxggA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_134631_259320_2B7BCFA3 
X-CRM114-Status: UNSURE (   6.19  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 22 Jul 2025 09:25:40 +0200, Michal Simek wrote:
> 32bit version has been added by commit 4a6b93f56296 ("dt-bindings: riscv:
> cpus: Add AMD MicroBlaze V compatible") but 64bit version also exists and
> should be covered by binding too.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] dt-bindings: riscv: cpus: Add AMD MicroBlaze V 64bit compatible
      https://git.kernel.org/conor/c/28fa0dcb571a

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
