Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4458CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etgJFFHupnvCll1HbjCmMqpODg6ZraXUsyvriLIsx9M=; b=wXz79/YNpVyPpi
	Cu8PpaMhAQyl4R7ZEXrezOreqOoihvTkfs8JnRVrOHIVWFgMT2qlKqSrrZQsfTqabRUivl+g+Wuy1
	mnUh85/XQflKaGZky2FwOYt3b7oz1+aGrf/c8Uj+QUpRA/3uMuTElcTu8N/yYuuBQiJhzHP/JnyRh
	S+e2Y6VZ8KMLXqby19Uj2p+1mQv8N2ti6cUi/bd5zvA9a3G+XVFyGC1SOctNeGNz0U82+x8do/CGI
	IcCRL8kd5oxjM+iNBnaibMfT6WterWRAlxjvSIQH3EEt56MqWlvlhg79s1bjSBmXvlNr4KvAx1fyb
	RyayKE058h/AMXykJCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajt-0000000D5nD-1zMK;
	Tue, 30 Jul 2024 00:29:17 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajq-0000000D5la-3RVl
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:29:16 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 30 Jul 2024 00:28:08 +0000
Subject: [PATCH v5 05/10] dt-bindings: interrupt-controller: Add SpacemiT
 K1 PLIC
MIME-Version: 1.0
Message-Id: <20240730-k1-01-basic-dt-v5-5-98263aae83be@gentoo.org>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
In-Reply-To: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yangyu Chen <cyy@cyyself.name>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=991; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=uv26Rjh9IKMB5x/gGwi/qL4b2tY6fy8LbhopCFjMJXU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDOrebmKoNBdTxSBFxluO4fDpviSPs+S/+2/u
 jqPBBmjndaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgzq18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WPGEACZQzXm0k3JkWpRaK
 ve8mnvNuPwSBiJ9QI5XuUfUUml5ZHbKO5kRqv53I7mwjSIpakbREPRZwUQIxXmMb/wCrm7pf02I
 KYdfjRhuQ7ZS6zlhBYibTW8tf89B8ryXNyOLMnkpKveyyj3U/idclJpSjGzXaNHhtfggTp4a6Vt
 s8ypKGFvGc2wc0Mf/q16N67HBGT/s09gUy0QygqFa5v/xwkU8aUt6cJ38Gxn7LbNpzdnZ/Bl1qn
 KRQsxOY6nemWph5Knc+kGRZ+lEYRJ0OaF5SH7+82rGSfeJuQJ+f6Ykk5O4ktm8FokLhzCP5Gjzh
 i4Dq0scBbS4ZqnctDPqm41uZMem4hQdDe4ZdOIwzAT36KfoTF+fIWJdnYl4cKr8mvNf897zBaRs
 MIuf8aigBNixEAuT9ZwsaIg5Z05Vct8NOEUDtS1lWjfS6UPU7iwlWqmlNHr8Ue8lnW7keV7ysDS
 SlGCbIbD1v7u+Kg1WuDBPBsBYdSv7bFuGdlfo+S4fUgflxaSL3QTAmh9hZkx9ovuK/jW9zde4KH
 /uSxP9ImJB1sJC5lfQAfBC6/N3BTUC8IjC3fXPRpUzQa+JJZfEs22zynHeIN/YLxww/bfuPjN0q
 dHIjfzLgffsuvo2KMOMQ84DhHiByjHKaPhFBITwFDYSD9G7vJwE+Zpdd1FXpUBLbsyBw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172914_920573_A1E2A147 
X-CRM114-Status: UNSURE (   7.08  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Add compatible string for SpacemiT K1 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276bd..f473ca3479efd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -59,6 +59,7 @@ properties:
           - enum:
               - canaan,k210-plic
               - sifive,fu540-c000-plic
+              - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
           - const: sifive,plic-1.0.0

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
