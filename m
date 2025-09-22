Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C5CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9ARiShSGCsu2QgCs42DSTcseNse/vdB4e8O15wRCiM=; b=UKuIvfNnOJjAlK
	RJfKZ1teu6+CwV1pNyoiWe2i+QBJYpJo2nQgqxxPAVDcXKZ242/1/kindxmMWA5STSTlb7lp5ImVl
	How2y3nY4JSrwBQcLiooMpupuOTGwv8az1ODVENNohVD24JVcW/z2YOH7S6Ml9Xt7pALiYgYm9HjC
	Yd4aYfdpbqxHT6HNEFSfnZBhtRrzAEu9h3xrblibDochM8faB/sS1CuddH7Qgrfvk1+R0aicsGfj9
	LSh5XPxbH42wWcFJ4pIW1gz6wOstvBlWeBKRDulyS79C4P9cSxQ8QoXc3tSp0H15XZE0SqgC/pkcL
	iiCUtqVO4O01tvK+QfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g9x-0000000AP0S-20Es;
	Mon, 22 Sep 2025 13:00:49 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g9u-0000000AOzg-3FB6
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 13:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758546042; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FhQErGUCqPYuz8npt0QoLiU5orGG6kD0p8QBIVD2h5piCbiTyR19zJ3+mVTnpRXzSj/T1o9zT0KAjsPwiIi7oNcOp8EPJ0LPPEP19pwoQqjTOcF9fPHPD937HlKwExcrK4MJjwq9DCzJLDwQoGIa+phPYM4I5B3uuC16ZPRv3hE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758546042; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f3nvmSiet2Q3DR2SkZE1/iC4vHuWkyp+B7sW2U6MWUk=; 
	b=W5oQpcLINEHHqmO9KNiTob8R/AIHiGaqBw+5ndGyu7EfNI6YCY314+jCeTbxtIKKv0E3a9aJj8bOWy4k/esFSfJrLob1XVS7gG798sOFm+mpg3WqH1jJ6HqCNPVuM73ggovpaN3FRYDGQBcb5PbddJ5alQDj8KtVgrRZuFsFiYQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758546042;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=f3nvmSiet2Q3DR2SkZE1/iC4vHuWkyp+B7sW2U6MWUk=;
	b=ZEuFMvP3rKqUeMkyCV2WYaBd18AeO3dKUJaNX2qQq4c3Uf9RJ/PAs3HoXgaKuBaG
	6nuZ0kf0RQqRKTHEmAN/hpcfJ8IjM5cPVjpbDwWqLqYec2us/TnR25KdFkeC8Lwnr9L
	w5xG+qvX3ZsOiAn/Bg0P7DQsz3yXtxJp+yww1RB8=
Received: by mx.zohomail.com with SMTPS id 1758546039179166.5139405502831;
	Mon, 22 Sep 2025 06:00:39 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 22 Sep 2025 20:46:40 +0800
Subject: [PATCH v2 10/11] riscv: defconfig: Enable Anlogic SoC
MIME-Version: 1.0
Message-Id: <20250922-dr1v90-basic-dt-v2-10-64d28500cb37@pigmoral.tech>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
In-Reply-To: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758545232; l=720;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=ZH5mj7Si1pInidDDRccHQdYBENMYV9CAGFNeoheRne4=;
 b=qRIMklpcFF+PHU4aYCJ+gt+lGgQSvdln6gwtn7JDuJKqTsdYp4BAXa/pkad0L/eLgfGn4Y6Iq
 c9FjHQ1kNwdCr/nBXCL9h9wR9NUV+B927Fet6s/HO1oGUVB1xGu06m4
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_060046_876227_686B307F 
X-CRM114-Status: UNSURE (   8.21  )
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

Enable Anlogic SoC config in defconfig to allow the default upstream
kernel booting on Milianke MLKPAI-FS01 board.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 7b5eed17611ad2260a28f9fe9985b88682eb1ebe..889a9f779c94a33b0164626b3726e11ac8cf357e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -23,6 +23,7 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_ANDES=y
+CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
