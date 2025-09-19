Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCA8CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqClue6ZQdGDW2dppvcPgqdj/HLV25elO1Dr3+BZCdc=; b=xILcqw90bgmyT1
	VYfuDKI2j2Bn9/SQRm5fDjJ15g9uu2R0W6zSG5lErdF9TlA2c60v6ubPEcyqh0XQME1+IiUO/rDFV
	5lITtU7WSTQaJHecDsibR5C81ACJqnNXIS//bLlZxJ/6rCkVwbD7loQmYKiyS/oHwAj0j3qH0wIq9
	z88lYU0P/45oB3ETs4KG/WxM/dPSyRa2r2f5/LVnPlmjyTIfHn+rDtogmAowQPLNeqG4z6d/8+JyW
	iVGFncEipLAJ3TNY1/c/dds16ht79obbOvgZEmGuNyty3icBwLa7koPdJVwVoRJzu03ooH1qUrUce
	ysio/3ruyWPHNO1EurAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfmx-00000003kwY-3I9c;
	Fri, 19 Sep 2025 18:24:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfmw-00000003kwC-0Rhu
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 18:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 253D26013A;
	Fri, 19 Sep 2025 18:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A5EC4CEF7;
	Fri, 19 Sep 2025 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758306292;
	bh=1IVG3kWb+ICcP1ix8L0I8381OKaoshV+1ehyxxb90qI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Pk7eWoomJsWIx9HJ6D+Y6bg4qhA4bCOdOkCqIjVW9FyxhSyS2alujMBAzhHKQVgcD
	 bbgJl43wjtGflgVAwQbn6dJ/HhYuug/632sNIh1jOrApA56Xff3HZVCtesk57OqnV+
	 gR4ADg8CbPI231jRgHPSxaoDkaT8wK+s6oLXLM77Or06aNdj5AiVRQ6//tge4ML3Lg
	 P3eM1UvAVPyTMmgZaZolBKKmMINhHvhcIoxOKuUk/mutNKsqO54QIK7IFWHw1mhDs2
	 QozwvHCyIGiJmBHsQIf5OXgdAowSs/7hIfJCA+8UE0mYR2i27LYaOlgYbPdX7aHDQm
	 mFkpvoagxU6lA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: kwilczynski@kernel.org, u.kleine-koenig@baylibre.com, 
 aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de, bwawrzyn@cisco.com, 
 bhelgaas@google.com, unicorn_wang@outlook.com, conor+dt@kernel.org, 
 18255117159@163.com, inochiama@gmail.com, kishon@kernel.org, 
 krzk+dt@kernel.org, lpieralisi@kernel.org, palmer@dabbelt.com, 
 paul.walmsley@sifive.com, robh@kernel.org, s-vadapalli@ti.com, 
 tglx@linutronix.de, thomas.richard@bootlin.com, sycamoremoon376@gmail.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com, 
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com, jeffbai@aosc.io, 
 Chen Wang <unicornxw@gmail.com>
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
Subject: Re: (subset) [PATCH v3 0/7] Add PCIe support to Sophgo SG2042 SoC
Message-Id: <175830628258.24420.13208135130254060127.b4-ty@kernel.org>
Date: Fri, 19 Sep 2025 23:54:42 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
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


On Fri, 12 Sep 2025 10:35:10 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Sophgo's SG2042 SoC uses Cadence PCIe core to implement RC mode.
> 
> This is a completely rewritten PCIe driver for SG2042. It inherits
> some previously submitted patch codes (not merged into the upstream
> mainline), but the biggest difference is that the support for
> compatibility with old 32-bit PCIe devices has been removed in this
> new version. This is because after discussing with community users,
> we felt that there was not much demand for support for old devices,
> so we made a new design based on the simplified design and practical
> needs. If someone really needs to play with old devices, we can provide
> them with some necessary hack patches in the downstream repository.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: pci: Add Sophgo SG2042 PCIe host
      commit: 4e4a4f58bed19e1a3a5a7c3a18ce3b927b76fcd3
[2/7] PCI: cadence: Check pcie-ops before using it
      commit: 49a6c160ad4812476f8ae1a8f4ed6d15adfa6c09
[3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
      commit: 1c72774df028429836eec3394212f2921bb830fc

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
