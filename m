Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0B9C83F0D
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvREvVNfnaRQfq6c8aHHhlm4daMjd8PP+yYf7S3Zomw=; b=pWpFoRQGOvyEG9
	3z6oy8Y/O8+rbL2WLwmU1FFDbqQg7ygKmVGQPKpy12XRFykVE4P4Q1I1XvLulgZht1MgCKs8hPPuG
	fjjGL5tSiqkv9BnKwk/zi3d5iYlN4HXgvwrBWFUxSgtBTuWo+mdGFvmib+YypPZs8Cl11H5jWelpL
	x+KJv3yi+2woA/efZVIyF/VmikGCot0Wc0Aww3198wwxOmJqrjjDHLm1TXMIB4Z/8EOA8RG9AkCpr
	2wZ1xonaI0bbdQEhPAhp8vr2+e5fOVFy93Q+rrszY1EhB/ZP3396rw6OcF+RbEzE7qdOyZHTEhuRn
	QOJL/FbXM8pY3K43xO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBtr-000000064xY-11Pm;
	Tue, 08 Jul 2025 17:14:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBV9-000000060vp-1pal
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 16:49:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E60F5C63C5;
	Tue,  8 Jul 2025 16:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B982C4CEED;
	Tue,  8 Jul 2025 16:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751993341;
	bh=1gNumA3r3GWXNuef/Bq7M1ZrVMdzEyVC3hw1XVZeZDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kpIElFVScs7kdDepXVzX8Hv6HhgXfSaeW3ul7jauZjH0wFpF4ISjYG2QO629h5ORD
	 u05aagrOPyeQEv0Mx+0fc2b9smbT77zHZt6pya4otJmfAASAqq0GyowWAchlgvmwg3
	 h+pkeyXKTSTzxrlrBmozXOZmpJIJC8llzDkyLKK7KSLZ2YbfTbaZoAmttKehDfGROD
	 ivDQtLfH1MtnTIlZR7j7THSCQHLtI1j87+SAwTdYrw/J5hcobS4Ifo93c87mJy2O9J
	 Qc684oKClGQ5bG/NRHcgkKLy/6Ko9O9adnR1cyR+xKPP/K3ziQyuPrCNKnBDemhGZR
	 mSkJ/yl1yOomQ==
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
Date: Tue,  8 Jul 2025 17:48:27 +0100
Message-ID: <20250708-jubilant-abruptly-8ff77f7986ca@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <0886d3eb81bffbc1d48e701cae21c42cad29fefe.1751988704.git.geert+renesas@glider.be>
References: <0886d3eb81bffbc1d48e701cae21c42cad29fefe.1751988704.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=473; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=SWq9xtGH8SUIy+j6CnVjw/RxXXaBxMRnkvI45y+m/oM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBm53rd1q5g8P3e4H25a/HPH/fVnG59f5uvZfnjxvLgfn x89keSu7ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEZq1h+CvutHh5+jY+DaG3 rzxOz/rm/+KU3bNT3uFW7LtubT35LEmakeG4Z07R3rWncmXj4yaLlar/vXZu9/qIE1++Hvm63O8 1y34GAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_094903_513748_FA585316 
X-CRM114-Status: GOOD (  10.23  )
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

On Tue, 08 Jul 2025 17:36:48 +0200, Geert Uytterhoeven wrote:
> The SND_SOC_STARFIVE Kconfig symbol was removed, but it is still enabled
> in the RISC-V defconfig.  Just remove it, as it is no longer needed.
> 
> 

As I mentioned to Palmer a few mins ago, I'll grab this along with a
couple other soc-related defconfig patches I have. (Apologies if this
goes out twice, I got a warning last time about a timeout, so ending again)

[1/1] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
      https://git.kernel.org/conor/c/493e9b085299

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
