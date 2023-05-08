Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C193C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 18:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esLwmGoEkA/x0aIrgThQTIAz9gQEwK3VRSy8IbR2+Pw=; b=YPcbJ0HqMNQxuD
	ObuSv4PhVJ8HpY+nbU90I0gJVE1011kRnhc3YWcoh+Ehug7FJoY+UruPkVfQRZJ0sARKnUHuzTlLX
	S7b5rZv7I9RtKpqcvCYUhqXKG+ZGvy8tv5GDwOCU6cKrhtO+Sn5hVdlMEcyL3ueE+ZUvlAf2EQeBh
	ainNiu+q8Ko9f4Cu6QF29uylzeit9cqKJbZTeWNgrQ1awtGkZ9UGBrmEcFbhY+sCSoJ4ICdM1NJ1y
	NISm++Sg6MAuuXpmLu7s5Rp24RgebrFQXPjGJcOqiYsGIknTJY8LiLGEtjkxTySzO35b9tcN+aU1B
	/I7zYjtLRWJP4nr4SMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5QD-0016fL-0W;
	Mon, 08 May 2023 18:17:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5Q8-0016e9-22
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 18:17:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3733361EB2;
	Mon,  8 May 2023 18:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D76CC433EF;
	Mon,  8 May 2023 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683569831;
	bh=VPla/phlxrLYHeG47Y11HycCuElwiwJdnJJp2FxR8K0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGQZz+lFtUgvsJNWM6Ro5wavaNIeeMU8SpIkcsNn8wBJMtajmC/SVvaTKx5gcZYSM
	 MjIWhTdy9v46X10zxrgN7QlTCY6uhVRnC2iThRiIGhlNx0Nv+RFiFVFoaVWgYSYHZF
	 Z5Q3ReMFSC5Di+U4HKI7uMNHCukrBYaAPztj51syjFQgePq35Mw77i0sXzwaaJJy87
	 4aWx+Zi7UhejL5eFkouQ8ASVIhl8WVJw/LQyb8zIKPQ9Ia5hdPFVF5t4OqJ1s/m+IB
	 wKR4GriB71PRcwfNnbfVIPlR18QLlUf8ALOCLtJk667MqFwjzA+QrJp/iH4rMQL594
	 O7iX7bR4KTA9Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [RFC 5/6] RISC-V: drop a needless check in print_isa_ext()
Date: Mon,  8 May 2023 19:16:25 +0100
Message-Id: <20230508-strenuous-mustiness-412fdf2402b0@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508-hypnotic-phobia-99598439d828@spud>
References: <20230508-hypnotic-phobia-99598439d828@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=hjjIKmNmD+GCRsGjW4UHrUxkJuauuysQYic754s15ng=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmRNmWvdKZ9LdmaPeH493SOXR+ETn2+khdVoxVw79WiG zN0E5Smd5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAie9cyMlx8dVJwSlnFfslT 4UXnZDef5Zl9dEPkkVuPe5P+/N7+Y3cfI8NZdt4SzVb+l2bVsufq7+ydv89vwyWOu80PDmj7Vdf xzWQBAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_111712_711405_3BACFCE4 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

There'll always be elements in the array, even if none of the
optional bits of support are built into the kernel.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c29643dca0f7..bc32207b7d86 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -176,15 +176,8 @@ arch_initcall(riscv_cpuinfo_init);
 #ifdef CONFIG_PROC_FS
 static void print_isa_ext(struct seq_file *f)
 {
-	int i = 0, arr_sz;
 
-	arr_sz = riscv_isa_extensions_count - 1;
-
-	/* No extension support available */
-	if (arr_sz <= 0)
-		return;
-
-	for (i = 0; i < arr_sz; i++) {
+	for (int i = 0; i < riscv_isa_extensions_count - 1; i++) {
 		if (!__riscv_isa_extension_available(NULL, riscv_isa_extensions[i].key))
 			continue;
 		if (riscv_isa_extensions[i].multi_letter)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
