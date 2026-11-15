Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26313606A31F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 19:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rp6XD7Or;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=GIQOlB3+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eXEfJIW7Efgr6FEnafy589e45chV1GVjCmnj789AN+0=; b=Rp6XD7OrMPPAkXlnVfpKTbacSb
	uzZyhfRxkrDqxbzUZg0cRatUTOWK9YjnshKAc7PhOSo9kOuEV7P4qDnO7VJy4ZYjsuFSFbHeuylqj
	FL0xBKXVCG37cxmcACdDvT6PYMDMZwq4/PWkZvpOEdYIRs8wt2yP5lQUchTgh44Ew3DEa+/L/2NAg
	/8yba84B2ANPQ8bgM7P4NIFZ55JM37RugXpveS9fKe7ZRwMY7IrepbbYMFOiMtNFi4w1NwFC6er5A
	VzylhSrlZ/DxGK6fKzw1p1NNKwOQ+N7VVojjZLBuITMuKAGqnpjSmEtxE2jP89MKwBI0C38G62Ths
	yH5Qi51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgH4-00000000Otd-28jQ;
	Sun, 15 Nov 2026 19:52:26 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgH1-00000000Ot6-0ias
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 19:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794772310;
	bh=pObfC2ohF/CqwFge111+KxptSo5e+t/Q2hCxcHCJ/DQ=;
	h=From:To:Cc:Subject:Date:From;
	b=GIQOlB3+axCBfEdcC2sYKOj2csYjZKOlQK4T8oxLlDUGL4if4YaSZEpBBypOdF3ak
	 /jGlFsTF8rWHPYuqNkkGZZ6If5u9fCEDet2fZKiXkezSVQbL5YcUuWf1Mk0WUZ6emF
	 Vb0yaolUhoDcqXyMe2Z3l7RQsfbcgDVOboYInCvdtJ/kra4g7wel2wfDxUeL3fjY9W
	 o20yWlhDtf6mxc+NZpHfmMlMa0l/oM4EwuM0F1bsBIiXnnsJXZGiIRTFDDkl8hff6o
	 z0YnvBQvRw+S5KRPDxYYSeRtmqPEgH8lUMpJBHbOhHEc13N01EVGZ2LW61722gukw5
	 7vwep9C/M+unA==
Received: from hay.lan (unknown [IPv6:2605:59ca:364f:d400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B1087B2202B3;
	Sun, 15 Nov 2026 20:51:48 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	E Shattow <e@freeshell.de>
Subject: [PATCH 0/2] SpacemiT K3 use 8gb memory size on CoM260 and Pico-ITX
Date: Sun, 15 Nov 2026 11:50:58 -0800
Message-ID: <20261115195112.32120-1-e@freeshell.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_115223_649020_8B6AB227 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adjust from 16GiB to 8GiB memory size configuration on CoM260
and Pico-ITX for compatibility with 8GiB/16GiB/32GiB configurations.

It is expected that the bootloader will read EEPROM TLV value for
ID of the EEPROM part and adjust the device tree node accordingly.
In the simple case where adjustment is not performed however, then
the previous 16GiB range may overflow a 8GiB DRAM optioned board.

DeepComputing FML13v05 is sold in 16GiB/32GiB variants and not 8GiB
so it remains as 16GiB configuration.

E Shattow (2):
  riscv: dts: spacemit: k3: use com260 8gb memory configuration
  riscv: dts: spacemit: k3: use pico-itx 8gb memory configuration

 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: fa2933aac170dd19c6a7f0d7b81a8f537e40915c
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
