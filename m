Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C443C369CA
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wB62cJsCM/REAygrPs2oiWrhQ1N/fIJNH4jeZBqEM4g=; b=bc+rm8w0cug6aO
	Z3I0QyekAPbuta62APmOgVqIFpjUVI9pz/AFDq9wGVaCudm6X9aSTwmnjvZzP0RLarHsSa431/Sfb
	Jjglhf7nk3q4IXeTl1buT7XRUYDm9MPYyc/HuwO996qXORkfevUQTkwK2AbZXOPCFfXOtXrYkfpvk
	SbJ8Gqr2eUibI7UwnHv+ddVOHCtX6k+6UQNQ6Jjd8hIK4Uvc9wN5SYlj5ITFcgaTk7L0QABWaB5p8
	6syT0lvNx9WySaC8FKcBCJB5FVoD/RMkYqXTtHTEffTxv59TUqC2uyndGy0erNGP89dM13O5OkMDK
	LBSoSlEwypDcgTUIGVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Bi6-00000001arC-0cNj;
	Sat, 19 Apr 2025 17:10:34 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Bi2-00000001aql-0Ed1
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 17:10:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745082620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kUPtjhyulj4lKNZSr5Q506nPr9Rhwq7BjADHGzZk6aGdlfuF0hQhyDy3kmqP65sKUMmiNlMlCSeCNx7cGlXnSuxeQdx8nEnx8TUTGJl2HjuYdl6YqOqcD6u1boF35DwZ7dQVuaLlpJsgRUywBBNIj2CX8ME1LX6BcANYYnebhcw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745082620; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zc6hW+RokbtJ0HkiqvbdqKYh3HQtrMeP7KANf84SHQU=; 
	b=DYOPJQgPAPgdubZGMf+TVfjRYjlp3smGoeUOiTPOoNkin0Sb94UIJnCTTiNbpp2lTzmzhMPZ3ZhEylRvr6KJiX+9LyXEeFZsE3S3fxGDgF00dHVCgyzKdgUK0QpKTzhtUq3Xiel435HdOJNX8YcVI0SAADxURLKaWEtbb2dfyPA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745082620;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=zc6hW+RokbtJ0HkiqvbdqKYh3HQtrMeP7KANf84SHQU=;
	b=E9E+SLpWImkk9kyjBZ1vaTepXEWMnulIwzrUi0fqLjZbcqni5rOxVuJiDe5+hTW7
	aK8C/+dfGrK4x86Gbbq4XPWNRjvctpehJZb3NPHJOJW7qNEz86IdpRxKs9wbwU0J7FE
	CGm52atno1IotD7UZ3O0vriwGUDn0tD4SPL7xPCs=
Received: by mx.zohomail.com with SMTPS id 1745082617967477.42022053116546;
	Sat, 19 Apr 2025 10:10:17 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 0/2] reset: canaan: add Kendryte K230 reset support
Date: Sun, 20 Apr 2025 01:09:43 +0800
Message-Id: <20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANjYA2gC/1XMQQ7CIBCF4as0sxYzUKrFlfcwXShM7aRaDGCja
 bi7tDuX/0vet0CkwBThVC0QaObIfiqhdhXY4TrdSbArDQpVgxq1GFWNIlCkJGpl2qM99EiugXJ
 4Ber5s2GXrvTAMfnw3exZruvKaDTqj5mlQOHQOiulaQ3dzv6dHt6Pe+uf0OWcf1S31ZSmAAAA
X-Change-ID: 20250404-k230-reset-32987c6f0ed5
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745082602; l=1733;
 i=junhui.liu@pigmoral.tech; s=20250223; h=from:subject:message-id;
 bh=FScS832+VFdZStqXHlWridVxQQzyABZcH6GmzQcbCaA=;
 b=ntVwPG4tNYZHH4Spqv0J8dovVCQpHAe6gzM+PcyDRQMdVcz7dFr1zaHI000Z7hcmCKFs59mNq
 QjQdVUUgCr6AtZhupq0pmKpeP3w0owPe5h/zG0bUbr+aMRJBDJ4/1id
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=ZRZkOjG47iI+To+oAo2R4KIpMwtz8r0TffJ5/nO2tcg=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_101030_577518_54FA4F5F 
X-CRM114-Status: UNSURE (   8.11  )
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

This patch series add reset controller support for the Canaan Kendryte
K230 SoC.

Tested on CanMV-K230-V1.1 board. Some of the HW_DONE and SW_DONE reset
type was tested by reseting the submodule and checking the reset
register value[1]. The CPU reset type was tested by a temporary rproc
driver[2][3].

link: https://gist.github.com/pigmoral/cc45de673775575750ac7fe49d4456a2 [1]
link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu0 [2]
link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu1 [3]

---
Changes in v2:
- Turn to_k230_rst from macro to inline function
- Use guard to replace spin_lock_irqsave and spin_unlock_irqrestore
- Remove assert and deassert operations for self-clearing reset types,
  only reserve the reset operation
- Add delay to accommodate the reset time
- Remove blank line inside read-modify-write operations
- Remove redundant default case in enum switch
- Update copyright dates and my email address
- Link to v1: https://lore.kernel.org/r/20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com

---
Junhui Liu (2):
      dt-bindings: reset: add support for canaan,k230-rst
      reset: canaan: add reset driver for Kendryte K230

 .../devicetree/bindings/reset/canaan,k230-rst.yaml |  39 +++
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-k230.c                         | 355 +++++++++++++++++++++
 include/dt-bindings/reset/canaan,k230-rst.h        |  90 ++++++
 5 files changed, 494 insertions(+)
---
base-commit: 8560697b23dc2f405cb463af2b17256a9888129d
change-id: 20250404-k230-reset-32987c6f0ed5

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
