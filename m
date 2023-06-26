Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07977EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fROxlecu4Em2NsTQGYjkUq30L7MYFbJLrR44W4SRWA=; b=AcjI9YjfYroUys
	gRbUN55vvwTZ7/DYnET+huVt2JfhkRM1Hyy5wHbGNVFiwQcAlHZrv1Z0qXw782DMUf1kR9k1Yj2FC
	7ImuqPl974qNpOjqeZf+lvV33kJgVaQhlZsVZwKHgGIwUJK/PuJMmFMQ/DMHS1ckDw7Kc870k3HcB
	wD54ksxGJfnMV0tziExQzygZJEY3w7uNZPC0NPzYm4SyLRbLrTc/iPQYamThvphjvalPBY2gnpcPM
	4rp8EsOliaY8jnz+Hci2+z/94m3dfhpbkDRX9qSemEE0eXlEuoOuKrpPzKG80jtMYrNV1F2btM6qZ
	xp8EZK/U7hc9eJD/BD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHC-00A43m-0o;
	Mon, 26 Jun 2023 11:20:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkH6-00A414-2q
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687778453; x=1719314453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W1hk6ucl8KNm2U0fXh/wXmuimq2rclUouXAdbjBH3TA=;
  b=R6WGUl1TlC2krhXmh1Ik2DOEdXm1RlqFAwCLNuULfkujmE9NDRN5wfZ4
   nH+K3i8puQIM1O5RLshMgLSJzonaxQDDL2Z6SllH5Gf1ng40t8GgWgLC2
   hySB7YO4z3MaXHC3fJUWntQs88/WisquqGoGOQaODfTVhHaJXU2RpO5jv
   UYHakxp6aur7RK3PdYY/yblLFDC/1LtFqIx/TSsFa39wmgnmtInkNMYUZ
   /wYs+nw4aU7TwEilYTFEJgPALap/oCJEYRVfh4kWmFtOgu7lAf53PQawb
   Gu089cytexqIsYLCIclq7td4fN5R+Uwed60k31WR3mzsGWbqX/y0DKJQ0
   A==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="220501420"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 04:20:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 04:20:50 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 04:20:48 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v1 2/9] RISC-V: drop a needless check in print_isa_ext()
Date: Mon, 26 Jun 2023 12:19:40 +0100
Message-ID: <20230626-skydiver-frown-659b982a43ad@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626-provable-angrily-81760e8c3cc6@wendy>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=737; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=W1hk6ucl8KNm2U0fXh/wXmuimq2rclUouXAdbjBH3TA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkzS3zbNKQ3J0nbH6lftSZ2Rnpt8ivbm0VXvk5y+luhUXH4 k/7njlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkzzdGhpmXL7yX/Km0bOKzqUo5Va ssct7t8czb1rt3rp6Jmsi55gcMf/gOCC7dLrsr2ElpSpft1TnRzJYmoTfWtsj/r/m2sk1IhwkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_042052_924231_7ED048F6 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan
 Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

isa_ext_arr cannot be empty, as some of the extensions within it are
always built into the kernel.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 742bb42e7e86..01f7e5c62997 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -233,10 +233,6 @@ static void print_isa_ext(struct seq_file *f)
 
 	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
 
-	/* No extension support available */
-	if (arr_sz <= 0)
-		return;
-
 	for (i = 0; i <= arr_sz; i++) {
 		edata = &isa_ext_arr[i];
 		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
