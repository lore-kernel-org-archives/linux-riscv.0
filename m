Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1091C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 20:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ziGRdKcRncLfDDiMDjaFSV4Hq6MKJou1SsicfD1w2M=; b=lZ8BzPylLNvhWC
	Xh4k/TaFQHEstfUsNj7ygaH8YvpVPOZDbIXlXolMdirux47+BxooSQ/1tu5bKOdO/40uanIooJEgd
	bF28X/xpJ7HV5e+yamD6/l4O8GClCC+0qahW+HQOPLXlJf4APYYD0Pp/lEu/RYQ+NAllDNVKmCnHe
	QrWNNy5lts6qqyVQ+Hqgxv0TQQ9ioa+o4HLfW6v0pX7f0PE9OhZjSjumyQnDb1gWhmbCdCAwt/HnM
	be/ZNE84Ooa6P+/AUcelQyyR1OXiPshqh1jMCCKcKF2i6sZFRw4YxrKdiGyVn2gGw0MNMw4sLp2j8
	92rON3ofWQhw0HiOV02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIXv-00BPbp-Vi; Thu, 24 Nov 2022 20:10:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIXt-00BPax-8t
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 20:10:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0EB06220F;
	Thu, 24 Nov 2022 20:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5F9C433D6;
	Thu, 24 Nov 2022 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669320604;
	bh=KXjgMIIzjeBW/b+BUU54O+6KKHdrQhBefEjGsi6yglo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLqbwLT9iKMsr/p6RHja2vOPufX12lQdda6T8mJ2ZBs8QBk3Nhk3Wuf66gJb9g2Tx
	 2nEjXa+iLfmRrHKAHvekmLWRBZv94L/ZYWK9Ew02qhtNOI809EhL7dgYbLnXFcs6Pf
	 UXrvC8yJNGK5353IZYRlwFhRq3u1oavGLfphLrwgbCWBxxRvOSiRPtRJOtKvpw9Yln
	 g/dnoGdQpbUzL24ceWtL3dv70oId893FdsCcENJ5jNMGr3jD2aOVKwQOb/H+p63yY0
	 baG6REtzXE2PyCUNK5M7BihLKrmsh0PqLDQmYOknoinb5r1t9emixY88T3+FcGwTLO
	 8LmMZAHYNOssw==
Date: Thu, 24 Nov 2022 20:09:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 2/7] riscv: asm: vendorid_list: Add Andes Technology
 to the vendors list
Message-ID: <Y3/PlXJqJZzWN7Qz@spud>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221124172207.153718-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_121005_363656_E5C154D8 
X-CRM114-Status: UNSURE (   7.35  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
