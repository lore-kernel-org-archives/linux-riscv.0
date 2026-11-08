Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE8606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ui8w88FC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNc7EgjW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6uoJouExj3pOXL5JUPGXGeQDCNoyndsv/br+tuYYPTU=; b=Ui8w88FC+ys7u2CZE+DAqi7gko
	U8FdBOXiCyyKPFx2SKBSr9nqFtnechqCZhWxnq4vnx/CjCu2b0NG7g8Z97yExyCwW3hA87BPb0SFB
	DJEmq91fKlbE/CV0hny6HY6N4p5DN7DEOIA6H7eUl7XrKPSPXRnolaIHtoHt7ySwNkOX9Pux9rM6a
	azW8EdZItkGOW/SQkuLUv7lvZRBrAKfanjfT/vCtwzZefhoWfZGJGyiMNi3EZg8k2fuBJf8jhcKbq
	uqrVyhzhaodtcdB2XywAH1icbJbUJF8JP5L76xF0lTgBZNE7T44CsYxBfVUVX8X4gdtEYnDEU3ab6
	ezcMCkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0G1-0000000Fz2L-3t7C;
	Sun, 08 Nov 2026 10:36:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0G0-0000000Fz29-38y6
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 10:36:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3379A611C0;
	Sun,  8 Nov 2026 10:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974CF1F0089F;
	Sun,  8 Nov 2026 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794134175;
	bh=kz+V4tNKgCgTqqukAPWOp8JL5D6hxHLTQSOOf6DneB0=;
	h=From:Subject:Date:To:Cc;
	b=ZNc7EgjWwSNk60I/4Yb05rQ+nMHctWoleNJRYDq0AmhD4VNlHOzQFQ4fJlUb9oEz5
	 fHMdcbmN1HqeFkLHj4YW3MN1UpkA8bZ2zJxf+86OWCCCsY26rxqYfy8h7TC+XroNgb
	 YcxwBu0DRelo0He2r9AHNBU9KquD0+D3yUXASEInO+6mZwgQ+38NmLiK/ajnvBIs9L
	 9GcZweFT6Fe7ZJ/BcAjiT3G4PsIL1rTgBHcnOvVbl+v0Ge2k0VPB5+83Hu0HwmHcns
	 GLxtMK4NNSsIC2/uYzZcf88/K+T7bIhCHZE9sObkKx3r2rhlVs55/qXxX+0RmIGrHw
	 4o6/Yq+aqNftA==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v3 0/2] PM: spacemit: Add power domain support
Date: Sun, 08 Nov 2026 10:36:00 +0000
Message-Id: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0K6dsxYkIIr72FYAJ1CRWgzBaIh3
 F3ApcuXvP/+IgKxpSBu0SKYZhusGzaIT5Go23JoCKzeWEiUKeaYAybQxeB7CJP3jkfAikyClCm
 jldhmnsnY95F8FD8OU/Wketw7u9HaMDr+HJ+z3L0jf0HM/vOzBITUKJWV11hrqe8d8UCvs+NGF
 Ou6fgHPXAQpwwAAAA==
X-Change-ID: 20260909-04-k3-pm-support-0bef40e87fd7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=dlan@kernel.org;
 h=from:subject:message-id; bh=eYHQ9sRtIF3B/i/yNtGTuObHILC1/C1ifsAMq+TkTEk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBq8FCSZppbebPKDI9SWsfL9gla8PQlWEXw26y+r
 V7jViOb4HeJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCavBQkhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0jRQ//UZP9/Zhkmhue1itkQrV/MjQ4baUoZQhpV/Xx4j2XaheBJtYUKuvPC
 XX75AGU8WnzFC0Htcm0feEjL6y6uELsCbOPQK9UeLpMpMMuJb5/NDGHX5ekpDK10vJyWKBL9IsN
 VDRR/OW0SoTPciEwyqjLZ6P7/9OVpvcoqgYWLhJjLRRzkPG3LGicoP9VKj1djcC6OzxK4KH+jy9
 1eTs0QVb9+lMxugzFb98QaPqe926AHtkTpnf6HJlQ+vAbU62sxL9cb/0q7zNdscyCOst64t8n3r
 ginGc8paW5IHvp427KX1LCGjmvApy9yjV90seDeDObaMa4Ty6vw4d2eo3ji8UooK5I2djBtplFU
 4DSvuT+h2GpLqHTltpC1IVVus0oEnMSwkRPlunMp+AlOmtRiDJoKuttMsN0iuXR2DfnMaIBbM2V
 kxkzDt5DT0QzfK2AtHyzoZWj563TEm5P8oURp/G8MiIUVXL9dp/AGk0v9wFY5Bd80ldpToFmMxE
 GB5ooJfq0JEfd2FUBh11WmrtUl90VDL4a6JFqFA9SuOE2xwvH4ucUEAjYnvKissMRBfeSXNaux6
 Yhr85hrVUknGAX/cWzyGlFBcRUF/8WLQITzQeM349VW3BCn5cQ9I2RYzXQ5rJ5MyVyyxPzf5Guw
 cFjD6cQbwnCSi4ehwKecE3AM4lqdtQ=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In this series, we try to add a Power Domain driver support for SpacemiT
K1/K3 SoCs, the driver implement the power-switch functionaly which support
power on/off, and it's based on Linux Generic PM Domain framework and
similiar to vendor K1's implementation, but unlike the K3's vendor
version which is more complicated.

  The DT documentation for Power Domain already exist in below file,
and APMU already has #power-domain-cells property.
Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml

  The previous DTS patch is obsolete, so I dropped it. For devices required
PM feature, it need to add a "power-domains" property, and should send in
a separate patch.

  In order to test this series, a prerequisite CCU patches are needed,
which can be found here [1].

Link: https://lore.kernel.org/spacemit/20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org/ [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v3:
- collect tags
- rename spacemit_pm_is_off_state()
- implement a remove() function
- use proper type in struct spacemit_pm_domain_param
- refactor struct spacemit_pmu
- Link to v2: https://patch.msgid.link/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org

Changes in v2:
- convert to auxilary driver
- no need dt-binding doc, drop it
- drop dts patch
- support to build as module
- set always on for K3 audio pm 
- no global variable for struct spacemit_pmu
- no force to do power-off in spacemit_pd_power_on()
- check return value of pm_genpd_init()
- adjust license header format
- Link to v1: https://patch.msgid.link/20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org

---
Yixun Lan (2):
      dt-bindings: power: spacemit: Add power domain controller IDs
      pmdomain: spacemit: Add power domain driver

 drivers/pmdomain/Kconfig                        |   1 +
 drivers/pmdomain/Makefile                       |   1 +
 drivers/pmdomain/spacemit/Kconfig               |  21 ++
 drivers/pmdomain/spacemit/Makefile              |   1 +
 drivers/pmdomain/spacemit/spacemit-pm-domains.c | 431 ++++++++++++++++++++++++
 include/dt-bindings/power/spacemit,k1-power.h   |  14 +
 include/dt-bindings/power/spacemit,k3-power.h   |  12 +
 7 files changed, 481 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260909-04-k3-pm-support-0bef40e87fd7

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
