Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2CC606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IMDzMWVz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=OF4axXZG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fqrv1dX+5yOJU/4s9jWG4QF67cSMKcN1+n7PipeLYic=; b=IMDzMWVzz3b8/NwCCwh+zVIYXn
	dQP1bKtMnwhkTLeHS00PpwKxZBHh9FHgnr0izn0GOjfANmV+rh7JU2jaslIY3J2BJFwxaQmcPariP
	Jtzm/DhIzsvDddwAKG8jODkooxETLmw9o+/J4fSOj9aITUF5U+J3STeI6kWG0PGvpAMlXF+QJY9cy
	0Ot2KQK52Y9ukCFkIcfCkQW6TNssWHIjdAbOJm+3wCPRuyqkMF6RM5hNuZYP9CFWn22dj8q+Aj0kV
	VGBcJNyMQYhucdlO4heDbO3XGOHltdwizu1NP6UF0qBRYxnNCTCcwXi+gtycFWuhLUlsoUI2A3li+
	O/oO6OZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1yZ-00000008C6y-494i;
	Wed, 25 Nov 2026 01:39:12 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1yT-00000008C0j-230q
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795570736;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=OF4axXZGTF1qfqvRZiz/JtxjxaW8akUj1PWSe0W4qR2PIDuU2rbZoYsDI+m4AInMP
	 bcTFTAmK/FbqWLiWXmOERBWwY9QSqWq1I4ZP+udyRrRoYueBa42OaAuIOKNIzHPw4H
	 /gg1Fi1bU23tM6P6FaPYv2SkYTByiXO1txKzlPW8=
X-QQ-mid: zesmtpsz4t1795570735t6bbabc43
X-QQ-Originating-IP: 0ipUMo1ro68wul0tWJTxBe0L3A0y0yI1TLXD4IzXO8Q=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:38:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7546957723103759865
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 25 Nov 2026 01:38:24 +0000
Subject: [PATCH v3 5/5] MAINTAINERS: Add entry for SpacemiT timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-spacemit-soc-timer-v3-5-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=iHFUNkL4vpfnAkYRawlVPY3gFssiqBgZcrn/XNSsq1c=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDNlsNqKcdftf+Hkl39Oz5yqZMU+0xWz5oZfr7GbsU1Zaz
 Lg90vV8RykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwESiyxj+2cQxt2pMYI4+9ULU
 N0B74vqyw/4aX1+3+k4Ke6r+galtHyPDpEvbG+aysgpvr95u6P9SacdRtxqO2FX+f5+5uZ3XFX/
 KCAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ORqNQdnYjakCneEckYyMZq2geyR0FvsdiXdGpB1Xyzs1Yi2I1tsake7X
	mH6xGfMQydNDKRrHEmqR1qvS+afUCD8AjdwTWNVFRbnHgjE3xmkocHit+Yiws6siVr8MYLH
	c0CLHiQXO9FuLZY+0GUly6VVIfv5Nj0x0ysmRVIHhGfGmzGR1bcENICowW2y4JPlbxwf7ll
	9JSv1idirHd6bJplU/kcJxZja5249hTwzZdr3+GQcbEYEfOT4jf1BdwEbz09gwVcQKq2xwn
	jMN3oD501JPMt6Sv5cZ3nxjSjzkdaAX4t1H6UrkX29CtrIqnEAz3euk7lujopb98TB5c5nY
	/hQJDUSxHhoNwU6EWcHcsuJYaP+oQ0rRTCpTWIPekg0jmyUo8WSDJvfNQ2dqmj0Sw0T4SRv
	w7/Z76mJmgKIKOaUiGhLhxsytB+cfXJ40rHDawKfINV0AQrfBkDgKrYBvLViEHazaC08y+j
	SIHilSBQ7vYQ5TLTXVEFaQGy93WxhlL5h07O/aATb+poU/7rjbicUkVmmqx7LGi0RGw02pc
	eJyijYCN59mCsLoMOwE0ihh0TdbGNTUOtkebpalOPZ+ihwJ0t4jqNM3fwHtGSL7GCx6FRC1
	SXzUpN/Z28FnogUTPHiCEiu4AstUHoJx8m/4wFsZgDgY53wHfLFpfUJxFXu6dDDMdZZC2de
	Njg0HRHy2xcyTpeUClEHhWb60JhF5JCM0L//o5nj3UxhUMZ6KbhdV5IQcMChBgCeWxZODtT
	b9cQrAhSpLMI+utkXh10x1zkR/UivhJv5+Eaiun9mqm3UMRBf7uMfapmrKYVkMl0xPq/NeY
	gvxSjJ3BFxkLFOY7Aok0F0/NcErxCVcn5NkxrlimXeEePyybfZ2IhwFa5hT7xzn1iqGL2PI
	d2bkkheFiw2+F7C11H1RMysxT1M/xIiQZVTB/ckZZ5BvISPlIqjLcu+ANNBB3p2k6p2Ob5v
	wro1T10bbVeHN7d1REtwY4IIghFboD3RIQLGHbROoirDGWERNXQ1f9CmVuVJKb+1SGq/EtU
	P+eRlKichfNWQpkthUosfPsJgg2WCvutA8NrHKS3Byb/PShriKvwUb492a1TbraO2pUQGDu
	XzSC3f0vTfC
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173905_919878_ACFDFE7B 
X-CRM114-Status: UNSURE (   7.98  )
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

Add a maintainer entry for the SpacemiT K1/K3 timer binding and
clocksource driver.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e607e9cb07a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26372,6 +26372,12 @@ S:	Maintained
 F:	drivers/reset/spacemit/
 F:	include/dt-bindings/reset/spacemit,k3-resets.h
 
+SPACEMIT TIMER DRIVER
+M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
+F:	drivers/clocksource/timer-spacemit.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
