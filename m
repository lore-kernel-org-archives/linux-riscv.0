Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D93CECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZuD2e3QKbWfO2eL9A1FA0YUgw6f25FVRFrnOKxsjj8=; b=dCElKtJfPfDSeB
	zI7OsB9l2Y3fPUyflkY8psw6KVQsuYEU4ZHnHztBlajndajI7ogrsAYKeX+5f2K3VVNsnz4/aL1OC
	VBcnDuqyr4RFBcAHtxSaRHkG7E7MSzkancfGTTtmET4RCTfmosxIviYKHnqi5fgypItKzbUaNhPL+
	SO/FowhRyH2RbxlEn38XKutb5ysIT+WRg8z53XvlNMPsAyow3xzDtl63nwP4q+4uryMSCIW8QEeDv
	SffhsQEbMegF9Wq7KkDpZlHVsWwUA+ky0dmhNhO84/ZXygdd0KzPvQcLg7LlHtT0QSZBnTaqqpSJH
	twBZn5SC+8o89PyR1aUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCs4-004FiH-1c; Mon, 05 Sep 2022 14:14:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA0A-000vLc-Tq
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 11:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GtckfgR+zRLgkF9jUpLwgWNTOTQm6QSXVcTTAkb7Ptg=; b=gPxBj4ufLf/s5/6+4ZurZDwnrF
	SUtG6IHpdoeb0HubDpz9l9gelYFiD9Fo1ZSD0nBLM2f1ZE4xeK/w1lVeemmqbdxsAMhJ8KRgrA1u3
	F3JqydOsgBoAMODjR+aZjOEXUQR8Z9mZzhvYbomUvz4Cqa+cBzhl31PSVu1GNDRt8YC9ExfGQ74lX
	7W71AXakvw8W8U7hnt8lDpi6bqD9VVytoyaL6N5PKxm8h/FBkDEL9kItft6HueC6E9CoGp4GByXLh
	/WX8M1rA52LXyZ3a2r78q5gFJzXLLzs/rIF4aqx0shwvohfhciyCEQjjAtaIQRz5IREgBN/2jaRrm
	Zq4JT3GQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA04-009YuM-9S
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 11:10:46 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oV9zy-0005hc-23; Mon, 05 Sep 2022 13:10:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: guoren@kernel.org,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 4/5] riscv: use BIT() marco for cpufeature probing
Date: Mon,  5 Sep 2022 13:10:26 +0200
Message-Id: <20220905111027.2463297-5-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905111027.2463297-1-heiko@sntech.de>
References: <20220905111027.2463297-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_121044_442631_CF37DE40 
X-CRM114-Status: GOOD (  10.41  )
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

Using the appropriate BIT macro makes the code better readable.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 729f7a218093..08f7445985dc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -289,10 +289,10 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
 	u32 cpu_req_feature = 0;
 
 	if (cpufeature_probe_svpbmt(stage))
-		cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
+		cpu_req_feature |= BIT(CPUFEATURE_SVPBMT);
 
 	if (cpufeature_probe_zicbom(stage))
-		cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
+		cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
 
 	return cpu_req_feature;
 }
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
