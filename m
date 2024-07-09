Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF07C3DA45
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ku1XXO5vFl49knj5zAuyVkFmhodPHenesSyk5+uogF8=; b=jCpREk++8VtrEY
	Besqfhm83H8JIEcc4PD6kFwP5Wg4LlbtY/copjs/8j33nwyaMKvEX1Rfurtx+JIfBUfDbBbRzICSc
	L02DSQ/MNMB1qfPE2uhwPPGvtVlNpZmazaxYtwfhUnp+XZDLamvN23HTNtJBlPTTydImz/2I4Raj9
	g34n2k5lKZZX685cd/At16TcgXaveLk+lVekIYM7ElBhRPxYox1Pw2jlqxV56JaFog3hnaMyTubqP
	qfEiY9IaYMN1gq3qanaQ8Vk65mC24FSUa+WNT+TihK/j4o8sweQe/Jx6mOGkFRWYHYe3UquHnnReh
	rHaeKump6e9mkA4nOwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1Or-00000005jJY-3tcz;
	Tue, 09 Jul 2024 03:20:17 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1Oq-00000005jId-0s5t
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:20:17 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 09 Jul 2024 03:18:47 +0000
Subject: [PATCH v4 04/10] dt-bindings: timer: Add SpacemiT K1 CLINT
MIME-Version: 1.0
Message-Id: <20240709-k1-01-basic-dt-v4-4-ae5bb5e56aaf@gentoo.org>
References: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
In-Reply-To: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=wvQLp2j2KF1DXU6LoDgHk1K3AJ3TNpJmOxUxNu563OM=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKwoJ9JhYzGBCEuNvHOCsyEcGGruZO/c7JUBo
 8TRFLqj+5KJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysKF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277SMBEACGqhJUmsrYkAtBv0
 gYxjSG3KtPXmPY4v83ANmFloGZJ0iT0IW3hhUyHrDPx0oYSObj2h2Qlm34FQ+99wpJnk//0RKDm
 M9tvDl9GyGo3BZI053SZ3KybNR9i7u66BHzgcSyD9R/UhA/AlWDboX/3UFRN+lqM6JBi+daeE17
 grXdqWMwPBFoeUSyejWIAj0eVEaLkvEd0ky/DzTf0lgVRoLux8C3VZzbnyBxZ+5JSjRUqcL+BAc
 b7Pf55QqX5PxtVWKw2amqq76l4+SSFrgrmGqYLaNkbXYlRvIrj9ZT+Lw3A74U+ll/GKr1oYBcel
 6qyf5J64gBJLF7wvq3lcla1i1S4whxgcH7+yRotn2gQyCGrcW+okpsKW7u43NswAulNcYF2gyrn
 kblw2h5c/eES7jR3zr3oQkIPiuqWjZmvHkYsyzYVLmukG3U2NI9xguIJ5hwLJoZk/uMR9vXcXxL
 SrwHsN6vWGq00Gfqz8JPogQcrsP7+tJz509Rtwztd9BNJjCZ2mzfbOLh1XjGQNEEMTJJxEzLiS8
 AMfRWvwfqgmnq8yJKFekiLHvVI2gPdsQeY3X530x155ppHxtYzjxb+To6v68EsrNsRWxSNNAxAJ
 ujU9ON1vKwRuG51nx29Z/qc9g7VqE1i7oj4p1mYjG3EZ+3wt1fA5dkAysSfnLZBG1zmw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_202016_281785_FE4E8858 
X-CRM114-Status: UNSURE (   6.93  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Add compatible string for SpacemiT K1 CLINT.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index fced6f2d8ecbb..c2e68587a806a 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - canaan,k210-clint       # Canaan Kendryte K210
               - sifive,fu540-c000-clint # SiFive FU540
+              - spacemit,k1-clint       # SpacemiT K1
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
