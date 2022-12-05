Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01F4C47089
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nISNrtgaWI9yyWBM0GPmnHTsRYOlrVcN6PB9bvB0KxM=; b=X3pAgnbw82P9dm
	WLpRD8r95haXuNI7QlDrN+qznr7+zZ1xDpQnQMM9k/svaMum/2OCbBCE5Er2C5csPoR3cQ4ZnheDN
	sJUQAz6sufRQpFNZ3iojk/LQO9ZborQYZEga7N/Fx4xAaN/fOPkkjZUgfQuBIsHdFOPBXX+835Y8/
	7GhLhxWseAyrdk2IYXR1tPsMUL93p4NtlteMyQIWdHwtgfN4Klg8dfttkHAbxv+Ek0y9tnl4/cey+
	R7wUMxj7g94CTk1rk/6a7ih6s0+CajlnZWe2N/kV4Qk0EtRGnqGyt3NMgzqHn+aYAkeska53GOIG4
	O2cf3uEzhCqhMV2J/DMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2FXE-007hsW-Q0; Mon, 05 Dec 2022 17:45:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2FXC-007hog-0b
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 17:45:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B444612A5;
	Mon,  5 Dec 2022 17:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAEBC433C1;
	Mon,  5 Dec 2022 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670262341;
	bh=HO07O/dwEDuJ+b3MFU4z+ov/xFQe3b4wprxsPB4rHdg=;
	h=From:To:Cc:Subject:Date:From;
	b=JJnLXbPBpH8GZdzC+OwUEkp8WOan84oXpWZ3bj6Ss3lY77irpIXpE+xL3aLwt2ao5
	 iyBs75jNgsqBFnEmI5SSpR7sMOie3IDLtY936bMf8SRvC8WeFOsVPX2Z2+AJ+I2sYo
	 NDJfWtbwn8NuHRrow5GcSRT1Absh3ufIcqjP9jXPL9FhnLKtVAfYvnkl3pyaHb+VjD
	 95Yz+pVzR3gmuiiEhKgNeC/nM/PdsGSKy8pKAjIJQEMssPUQgML3jxEGn6mA7hPclv
	 wSJYoyIuHIsFTAlRrCVYPfbEoljUzCLkXj6USEudD4Es+SQpHL24BjnlfNCGC6mWzr
	 R7tAHJWnrPLeQ==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv,isa fixups
Date: Mon,  5 Dec 2022 17:44:58 +0000
Message-Id: <20221205174459.60195-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_094542_113804_4A152404 
X-CRM114-Status: GOOD (  12.46  )
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

I noticed ~today~ while looking at the isa manual that I had not
accounted for another couple of edge cases with my regex. As before, I
think attempting to validate the canonical order for multiletter stuff
makes no sense - but we should totally try to avoid false-positives for
combinations that are known to be valid.

All I've changed for v2 was collecting tags & adding in the missing
commit reference that Heiko pointed out.

v3 fixes an issue Jess spotted - it's *any* multi-letter extension that
can come immediately after the single-letter ones, not just ones
starting with Z.

@Palmer, either you can take this once the DT folks have ACKed it if you
like, or I will take onto some v6.2-rcN fixes branch. I don't think that
there is any urgency :)

Thanks,
Conor.

CC: Jessica Clarke <jrtc27@jrtc27.com>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Guo Ren <guoren@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  dt-bindings: riscv: fix underscore requirement for multi-letter
    extensions
  dt-bindings: riscv: fix single letter canonical order

 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
