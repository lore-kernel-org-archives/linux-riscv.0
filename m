Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F5560A3824
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lZvn6z0P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=OIPKKBUI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8xLHx94Ip2iD/efC4UrymTRaUac8QZ/CTok7b6i13bg=; b=lZvn6z0PpreMKC0a1zEYniFIgh
	23onAYO4ZZlN0ALCnE2OYTtxBJnjcTfnCBj867OlDPA2JAPHWnUjqwWrRcIGb3DVKGGzzej6N6jWy
	HbqaoA+S+utJYYIEExOtnXR12wXR+C2yQd9u4IRrPGteAWtydeu1dArJBQQ5XCoH3PFfQ25n8LPHU
	MOaZoF6/sRjJA4SD9nqLJ6+yKbH+iszhnarJaAnkyVUwmrf94K8tSP4FHGmzzwMM9AvhPK6vC6DpI
	ux1lp/juyPCXkXZxCSKxK7TOFrZVKp+ZfxJ3rOENe5Cq7ms6O8FZh3oEPWu1WuPyztScODe4XRaWe
	4QUaSYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaN-00000001Euj-3qJi;
	Mon, 09 Nov 2026 16:51:11 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSaC-00000001EnE-3Vyc;
	Mon, 09 Nov 2026 16:51:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 280B3201D22;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l85lLtPB4k5nrum11Kb2TQsl8QGftnmx/GCtns0Dk4g=;
	b=OIPKKBUIpaH6OZX8RYwsR631RuqRnnizwE6WwqEFkHQ5RW7S58vGr2v0idQBdr6IgyJ+90
	R15DyJ6blCh/MYqtnIJ11TB/CSMitfoZS0+3Jw3V2NMAn6LH41QKpvk7AEbDTr5Z+eGcKD
	clhgYDgShlt0ZHH3+fPeS9QIeW6HFeLZ7n0NIi05kpuQ8OmZJj/LREf1ch3IOYi3mgrkr/
	cbiI7dLBfsABwda5bN++aodXzNc92pipI7vlYQxjUjpfypnskz9ESOFW6kD0QiYzc7rP1l
	rFiCM/ErpYFuAn0CN1hGTjj97NbGodBnlmh7hTD2/t+wZhXH6v9AT9K+H9sbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l85lLtPB4k5nrum11Kb2TQsl8QGftnmx/GCtns0Dk4g=;
	b=Ny6VV/TII73WAqesGa7JQOErfLvOenbYriGk3Ed5jZXak/yYhwV/SQWa5MgIHZzqGh3GS0
	vU6sbY8nq2S5mc7gK1GHZ0p1K8rV7rhKSQLNxxwfBs8eaKlhXhv78numjgNNjuPQtDaZis
	YnF4HKk3OAaTPSFK542NX/+lIZTz532BIP/uc3RU8hjvgrMOZj2tML/0Q9nBsWz8OvXcct
	F1JuGCLMVZPaT4EzTBB8LyzZXnMME2/kyaZVOqNkJq/Gf9AT3JoMvpaLDVVujayPW62e1Z
	vUnk8B88Xw5WBt/z93jWHNQdfIDJGJh3qXCV0R1dwbWEw669SkG085mruikKjw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=S2NBx6fI5GUMEfVQGuLdVoEu/C8Km5CN3DNVuBNIdcKRWnh6QweDGVP7gxsS/H9TwU9qwa
	cLUlsZBMBv8OwEXvI7xX9dksqSylOUKVD2TWaOWF3FhjKcqYiSX0UAgiETPCvZTsSFIWId
	CLqLhFkCgBR3GITeZMvb4s28LbrXEzXZHcfYkex+ihhBZsN2Mn46CnY39+ORR3tg36TGA5
	lw6lUZzdhbvh2qau5EdXAXWNMGbSTkm0V0+sjsl2nLwId3U92/IDZ0oKkrz+fxTWSyMDES
	JhuWtFLYLd2PjNAhdM6V/etwYQ/PN4YKTwoUaWveOGN0FJIfNDIflf+TTyBfzw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-0F;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 0/8] reset: Use regmap_test_bits to simplify status
 callbacks
Date: Mon, 09 Nov 2026 17:50:42 +0100
Message-Id: <20261109-reset-regmap-test-bits-v2-0-c886689bb85e@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOL58WoC/4WNQQqDMBBFryKz7pQkFm276j2Ki0RHnUKjZKJYx
 Ls32gN08+HB//+tIBSYBO7ZCoFmFh58AnPKoO6t7wi5SQxGmUJrlWMgoZiye9sRI0lEx1FQl7U
 zzt6uF9VCGo+BWl6O42f1Y5nci+q4v+2NniUO4XOYZ733/kpmjQq1y/NClbYsnHqM5LsphsHzc
 m4Iqm3bvhSTM6vTAAAA
X-Change-ID: 20261103-reset-regmap-test-bits-17cb2ba9840f
To: Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_085101_038519_532CB8A4 
X-CRM114-Status: UNSURE (   6.29  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A lot of the regmap reset controller drivers open-code a variant
of regmap_test_bits() in their status callback function. Simplify
them by calling regmap_test_bits() instead.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v2:
- Mention error propagation changes in commit messages (Geert).
- Collected Reviewed-by: trailers.
- Link to v1: https://patch.msgid.link/20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de

---
Philipp Zabel (8):
      reset: a10sr: Use regmap_test_bits in a10sr_reset_status
      reset: reset-intel-gw: Use regmap_reset_bits in intel_reset_status
      reset: k210: Use regmap_test_bits in k210_rst_status
      reset: lantiq: Use regmap_test_bits in lantiq_rcu_reset_status
      reset: mpfs: Use regmap_test_bits in mpfs_status
      reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
      reset: zynq: Use regmap_test_bits in zynq_reset_status
      reset: tn48m: Use regmap_test_bits in tn48m_control_status

 drivers/reset/reset-a10sr.c         | 8 +-------
 drivers/reset/reset-intel-gw.c      | 9 ++-------
 drivers/reset/reset-k210.c          | 8 +-------
 drivers/reset/reset-lantiq.c        | 8 +-------
 drivers/reset/reset-mpfs.c          | 9 +--------
 drivers/reset/reset-rzv2h-usb2phy.c | 6 ++----
 drivers/reset/reset-tn48m.c         | 8 ++------
 drivers/reset/reset-zynq.c          | 8 +-------
 8 files changed, 11 insertions(+), 53 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-reset-regmap-test-bits-17cb2ba9840f

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
