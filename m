Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515ECC54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 19:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R00RvjwMYj6xw5VrxMPtIccZXT1/OQIrtyzXIGXAnuQ=; b=oS9/OLdOSGE3ei
	iD5wYBxn7BweY/VZuRhWUuerSr4codfiBgFgeR3BS8i8QFEZjt67iH5lyeHJi/YkUAStJ00Oaarqt
	3V2z/VWAkI2Sk6jiP0A4Wi+p1P4FucXRn3NSmSnoMe3Pjln8C4FYBQvVcQeBr66ty6DY+8aJsAm4u
	fD+xxYxmaCFePpcJT2LUlWoMgk3esOkMxdeBy8Rl8KnjTbMm/iT2vH8NVqaB81yRrkh4VYsyoo1RI
	U1LLjaVj4k51KxK1Bp2A9yzmtlCCcwZS0EYVOjExOndW2YyCvG62uOfPbg2Z0Z59yqzgyWeM3Ly5n
	wyGhn8c/tvPS0D94ZQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhad2-0000000F2Mj-2HQw;
	Tue, 05 Mar 2024 19:39:08 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhad0-0000000F2L8-0um1
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 19:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709667543; bh=RRjix0llQAKkZ0Th8vUk4UX/Alg4KPw3+Xw8qybrfN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SqSU8QFIL9W7ZW+iDmSVSq13xgn3Mx/aGpkNNYeAQ/yhnUKbM1zdkj+8z7SJ2TxD3
	 b12ACg22BKhSpDiuJ2mDGLUCNLWSat4LazP5gAEKVP2gcsrGs0UFKrjOQRW7nNUrV3
	 OvXu+p9w/rnhwT35O+o7dkUaGBI04yjpyj+roaWE=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id 9B6B9246; Wed, 06 Mar 2024 03:38:54 +0800
X-QQ-mid: xmsmtpt1709667540thoirjwv6
Message-ID: <tencent_7DA0F188AF4130573BCD9106F738862DA405@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeie4OtLKJmFhfdwewlzjSHecvDggKwqR1CfOGM21ebqXl8dHq598K
	 +8fI4AjWA+pCGw3tuPpci7DcYAzcBtoxedHsBr+DAx/GBAcD4mJCBhoA99iwOu+uORe77yzvgpfe
	 QOU9OoF72SBofkwgdaVwTc1RImnsNGVP9tgygPwDF1k7+rzUXbaowOAV7QfBk95wfqzQ1AwvheSg
	 dQ2hRxrQUpW0iQSNclgAFPRghQe5shn3UNkPUoeJGuU6ErJ6L4xJEx8bXg4IsYpCECs7hEAgFmHw
	 geoX1jRom6ywkD5R6QyR+QmNRhxuwVha44JUvn7CQ/le7yJGBG1WwG8jj8qZg9v0BAcBi8DtTQuB
	 bQ1WyJBjDOkBh6mSFI9PbRRTTBnZg8m8n9UA4jPECDTKLB3tNAQCDwJgleQEEqHjYMFiUCKFPW+H
	 Fzb0406vYpJx3c4OshEpjIQhrxjyxF2U6G23f+KI1GtJoKmLJhF/tUH6bBToPWLHcDLRK9LjAFjG
	 hIrayCUzrcm3jceeJmbaFu+bE65Wa51x/X1JDdTwO7pswdPDqqhFmhYCdD3mUAI1iKIrkIB0OFVY
	 XX8oGRaBZLyWOt5f4Y7cDxZoSNbRfW9D6l/wINvZ0MG9z4E/zRYU7T9bYUBT4bifz3Z/X00WPwAM
	 VVjEJjDUkJuwHXbEH7+2Jp7VS+RO+Uu/7kKLt9aVbjO/2T8rkSyhLEsJh5RydH6Upl/si9m1T7U2
	 5gYpeCVYu7a+yNEqHOOOKiF30JonidkEhCmywIRPxufqz4SlUfPXvDIdrh2ohiPNV1BGF5ZWGnEn
	 nOZoFyMovB6/g3Qcrqm1MBHhGYrh9kEZtFvZZv8KiAYb67UugXPK7B6o/3yyWoe9pC47BCOd/kxN
	 e44PuSt+82MVM4fNXhaCYF74kHE51ItAuG7YyA4Nf/rJLbaOHAshBJBfe3QvZqFUn6Vz5GGRxiXd
	 Mveg1s7Q4dXFLfJVqiF11F9hFGYrPhVGEpD7CAr/zeLfquRvYAJsJNU1THA+8uCyvoZP9tszbZs3
	 WeD0BrlbkOl+D4YPkQXkx2h+tjF9Vlh3CU+3tGHTx2Ay7zhzdj
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/7] dt-bindings: timer: Add Canaan K230 CLINT
Date: Wed,  6 Mar 2024 03:38:27 +0800
X-OQ-MSGID: <20240305193831.1084556-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
References: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_113906_616356_75ADD9A8 
X-CRM114-Status: UNSURE (   6.83  )
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

Add compatible string for Canaan K230 CLINT.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index fced6f2d8ecb..06c67f20ad3c 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - canaan,k230-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
               - thead,th1520-clint
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
