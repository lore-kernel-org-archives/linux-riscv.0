Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B562AC3DA7F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCyMjregICdtF+QbzqgQ62fKoqyLmhptlTrZcQtjnvA=; b=Mb/kAYeQAyUZQY
	SEFV9zS6bXE5HWwZFt6MLXTo010gXomHyma81a9Yz2DH9DpuJ111Ojc2b4wzMPX7DBZavXajOik4Y
	WvIULNdMK9nC/DFQIf4sAv/dLFmlZ02OJt1pC9bClHql+QdJj54nPStA4IOOTl4LvwYaCs1d8kQcE
	X0aA3UF+vzqU6zJa1ADasz2vzPiqbrLTEZC8De5k9Zynp60u5c9Tt5yWffgEKXC/Gkrl8a/yttYIB
	8C7Plne6Oa+kpwjGj+RkT3y3y2SGO9b4GIC3GZ+uSRHH30feDHSp6WVbAl9c+cff8TEiAXkhYs+4Q
	WYL1P8Dj0LcWXjm3n7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajg-0000000D5fg-0lGe;
	Tue, 30 Jul 2024 00:29:04 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajd-0000000D5dp-2JBP
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:29:03 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 30 Jul 2024 00:28:05 +0000
Subject: [PATCH v5 02/10] dt-bindings: riscv: Add SpacemiT X60 compatibles
MIME-Version: 1.0
Message-Id: <20240730-k1-01-basic-dt-v5-2-98263aae83be@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=W8eM35e/PTpqsXXOCfHverpbl8e/pGr451VH+m26oA0=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDOhfX0Xrzy0z/5lq7e6AD+TZMqsPXdTaQ9PT
 yy5IH4xgHOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgzoV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277ds+D/0bI9pzmp5cVVSPdS
 ZC+vFW3Mcg190dl1qRTCiR0ouSU80vI3l6jTXMQzeBC49uz8+2w9ANm37dtmAWsx+Y7jLTgFVoA
 fkMixKGm9pYoE9oB0ZJlW3PWm3mbJ9WckU1d5ysPJ9EOhkEs36s2uX4JQzEdtaarPX2156vfMte
 ecFuNQoeyjSid117hwtvSvYo/7Si2bQ/wIw4W59tpov6641yAFXYeOPaqO6Od2PIjVyrdz9kaR0
 FxGCltGLSzifNNrPr03URC3S+RcXR0096aOq41AKG3pnwB+aZAqmdyUvgzrcZtKoGPK1shgBnBU
 6F/YrifFZHqx1pRMymFrgsbFQyVn8cQ26VkgKrXlDdGnfRf3TA0qbcBADoStituAc/6NhwzGA5v
 jhvnSBgoAbttMPFwy3vNa7W6//xzTF6IS+m0TL/lzOlp9Y1h83imJamle67Yorh4XSP454BHDQ4
 dbBm8uXuy0oQ/s/T8o+Q4e0ol/CrMsEPhedbfEaWtYH0/NcGM9ioC4pijiFCFTGFJW7ly6vMdX5
 lkd1y/Xy3s08oMdA3LzypQx/599RwKTDFPFHRUaDRuzQHtqo/ytBgsBZ+U2Rpbqm2Zhq23Wf7X9
 C6sap5IMGt5EyoosbkrR/z5rHaSWebnrQgUjORmvPS2CF1pdaxsELNvwCeLiXHkxPbVw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172901_651505_CCA4F694 
X-CRM114-Status: UNSURE (   7.18  )
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

The X60 is RISC-V CPU cores from SpacemiT and currently used in their K1
SoC.

Link: https://www.spacemit.com/en/spacemit-x60-core/
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 8edc8261241ad..acb5b9ba6f049 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -46,6 +46,7 @@ properties:
               - sifive,u7
               - sifive,u74
               - sifive,u74-mc
+              - spacemit,x60
               - thead,c906
               - thead,c908
               - thead,c910

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
