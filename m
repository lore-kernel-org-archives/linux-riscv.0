Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634A7C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LX6ewwmcG0SpblkKLUR6LRMl0kpWJIlDfny/jbDH7s=; b=Qy9hgAA1i5Yy/y
	iNZ5PHQg8xEQUJrfucIbWg+GpRaY6sIif80TfGjrdgHQ5OEi+Y2NoUoaD1mEuO6pJwzLgOgDxWosZ
	AIxJLu1ZrmX7gmDUpLid4ldxplAn/zNbfFQO+Ov0EEhkzo8ZZ633ODVcfDki0dVHN9FGhNn+lSzg2
	fthea//XqQpAObKL5xIJAZpOPifDWNpkBPr/rgOO/LThaqF03ltneORATAUGX2A6dSf2xb3tVTYCX
	hLqPAyvPghaUC7m5Q0BSagwGgpagLEtqfG9LpH4ZO39OPG7bZp3A12oKHqU4zz87jyK30cW0J1knx
	Px8rwCAy5+P1Bdexamkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr75-0000000AsYH-3Ff5;
	Thu, 27 Jun 2024 15:32:43 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr70-0000000AsVm-3f7a
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:32:41 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Jun 2024 15:31:16 +0000
Subject: [PATCH v2 02/10] dt-bindings: riscv: Add SpacemiT X60 compatibles
MIME-Version: 1.0
Message-Id: <20240627-k1-01-basic-dt-v2-2-cc06c7555f07@gentoo.org>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
In-Reply-To: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, Yangyu Chen <cyy@cyyself.name>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=oiadtAT5r7xDGzsCnaCGPJ2frMTxz+XpkwmHxkPFkkA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmfYXjsrZOKxCkQrojHnkDrw7pdrxsCq7ycSSsn
 /C9MT4rJyWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZn2F418UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RwQD/4hzCsplIb2vrQt9n
 5IXGzH3kWcO5Wtvxw6BcBTbWTVcA0hMvgoxjVeVIOlsmUAcrtJqKuK4dskwimO6KOVhXekrZzxW
 Lv5YMu1bJnPMNVvEnNdWFKR2PLk26ncFYAA1hO/1Fk3MRXwCFsAzMTpAgnVgeDg76lucL8pJpkY
 PtcZI5NATDRsxPvvgiv2+UziB1KrFd2hUgel6BTFo8GAY2fNDJNxstMtpDAz20xCwEwQwWphEVQ
 rDT0pgrIjCExeRud32LcP37hWNT4Y3vLiceZepRtl5C/GV0wIvVuRy5eFQfVzij7KT+nxR1OwtI
 RxgzzsVhhla0s+UNS2uyZlLJe4pSfSZ+q5Ow16LuoXrIR6OPE1oNQXxn+zggYHVq51vnGISfzJl
 Szx7htGmM5WskMVzQ92wSMhiGVukwfkS0l+ew40E22OqvV181B/TOQQ+uSbNaGdpgb56pL9FACn
 GuRRCs3GMIveibo6psuy4FN0Y7p+2oUyrBumBMNu4Y0ebKQB9FWoOqtMp8jmm1EsaHQvLlJbxR+
 naEblORmjEiRmE4G1KmFs20mvJqr4YUj5KJY2j9lVMsX9U7ESNgxkwbS+Z8boltEiiKA+WOJ4ih
 Yysj4umnW23flwGzvqopfZoZpj6yJNvcmt02bn553k4ZzdCO2QFiAySGpS/i7Mls8wKQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083239_010464_38939A38 
X-CRM114-Status: UNSURE (   7.17  )
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

From: Yangyu Chen <cyy@cyyself.name>

The X60 is RISC-V CPU cores from SpacemiT and currently used in their K1
SoC.

Link: https://www.spacemit.com/en/spacemit-x60-core/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b5..5ad9cb4103356 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -46,6 +46,7 @@ properties:
               - sifive,u7
               - sifive,u74
               - sifive,u74-mc
+              - spacemit,x60
               - thead,c906
               - thead,c910
               - thead,c920

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
