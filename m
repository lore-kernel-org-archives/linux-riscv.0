Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B8EC67861
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 01:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfXAcabfZlKVKjrPxhvy258YNXoddtXPGIU83RRam4M=; b=qSTCp9afM9KC39
	Qb6Rn9/WVpyIamPOXzhMlhKqKKRTXi7f7rgbnxFjqcW9hckrsc8Gbf/y6jLg+10+t7lM9e06zWZhI
	8o/jyyguU6HvOyPKzQpe7ijlclpAO7EQR5CSE9mgJiQrNO5ouWvbV9uRBxr6A59DBTUG/lPE7khQO
	7WR2jhwZjMcKfg3gLNfiMMsiEEwS1QcTTyhY0jm5p99krnZ0RMAHgTEf8iijdc3OgYV0527RGMron
	k0dNFf2Ul+j/6e93fYs/0xbhFIf27LQYjeAXiaYzPvEacNtSimA9NGLA81EJrb122rRZBRF1xw4t1
	KN54QrdlgFLdsAHMmSUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHSd-0000000BPMH-0pXo;
	Sun, 07 Apr 2024 01:36:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHSb-0000000BPLq-0g15
	for linux-riscv@bombadil.infradead.org;
	Sun, 07 Apr 2024 01:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kvuS7K0wl30nwl4M5zznAdLvDfFhfeZr9JFWkFZyoG8=; b=KSwAvCyafhHFDdqQPb8sPpj6D+
	9c7XSeO87+trCRp08gQrx7mqDRReIquCJ62DkVJAXqt3UFmFd0Z+xw1uLg3lwfTWqcnIqKgzRoo39
	0wUr1pCRFU8ISSZxFZU8P//uSyBlBkxFJP7g7jS9Sy3Iv1JhW1rg+PCh5Jad6i0O8uzopoypkD0Y9
	UhBg6yjiLJqWXcqb1nJU5vbkDIK+M7t0M5OLNPBZUjhcX1LwpLCb2x03g02fT1u2p/InHEwnQ+uAJ
	K+Uin1xvwuLrVR/wTrm80WYg9wfrlyAIhcAkHKe9PsI6Hl5gWIwu+tZVZ3FR6+Q+lBEAVJqEpE6P9
	vDKdEQFw==;
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHST-0000000E3Zk-0UXS
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 01:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712453473; bh=kvuS7K0wl30nwl4M5zznAdLvDfFhfeZr9JFWkFZyoG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vUnZQTHBqXL3BuZFHqIynXdF1BuWJg6KEMlcNLpS0tTLGA2rgZfw8GbfvFMPv9Vlm
	 83hoN2mOeK+1g0VOabViJpKamHXIzz4eCqU4pGLjlJwzgysWD1J106NpASAPCKES/1
	 R/ks0Pn84pUuaNRKc72YR5s7d9D9B29fRr6HEEKU=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 7741FE3D; Sun, 07 Apr 2024 09:29:52 +0800
X-QQ-mid: xmsmtpt1712453395trm4eubz6
Message-ID: <tencent_558463152E4FCC7C8843630D5F8FE0A8F606@qq.com>
X-QQ-XMAILINFO: NY3HYYTs4gYSFCBfYc13/eaElaqxaU/zZaBpC8/2tdJerdp08rbG9SAKo7wX8+
	 ZpJy7dmKZeK8itvt96PfNdTrZ0EsAl12g6QmKAIVqVNAxxvzzN9GBc1uDkLyG0hUzOdodu90G251
	 o6nKbez5k1JG9BxCpslFhlFYz2ZgUFBRdHOi+jXkOFCADgPDSw7kCTpV9Ed7RLoY30MJN7oaXwXK
	 eY4gBv6szGmNIfk9tRnEigVPZG8p9h+w1EyepNtBSjdHQrqOW14NtJmfiAb+H4w3zhcoXYlkSL5M
	 /LD0FqLeVW1Lks5LhDeyadKGpKyY2K3QglqG8CLMv7ixi3865I4pfXJeMy8U5n+qTM5IRw2NWXEW
	 6xhvvR2FBi7o9FClm+nRD2bee/+NXTHnmi7VhEcAa/IrS7uayU3y0yN1lEGC7zDY+iNu0K+B+QPt
	 tYiQUDY7P3sbdTgg8tJGTIqwLpr9GezC6Am7m79cSjqPafQdr6VMYOaiIPyZUTcIO3BmMzvd+4QQ
	 hwVLP9K1slsUFvu2srC5mntSRK4VhnHgrxNPstsB8Y9VsTl2zOmB3uOc9HJOwbU0So3xNlCo7Wj4
	 e3/gfe5b3Hk40YC6s4LpluQLHZ+0a+lDwLq4c1P9quEa89vZLfkOFiRo84vLDNb4AlspqQP5iukz
	 TWpa1cbkhhW+uLYLki2O+YF+M9NFJzb5y0685oucR0k3WMkDNPXQRk7JN33f7Af+7niMOMBd4WAG
	 mPtBDwDNsgSzBoH7jizsRcS1wGrb9+n2OqYZ72DdCIEGHvo6+0QF7we1fXqCnmYDZeLij+r7URQG
	 35CmRKy6Geqv4lFp0//CLm0czF8O6IRdEuC5FHrMHzqVaLhh89TxFIJ0yEdlL7xsn6pPRRZK8quV
	 2iKneJRgOBU1eY4hVT5GNivRLB486o5+Md4r6uO+w6gRoAYq/yQG4XI3KsIrrinDkVbKUux9fwP6
	 qfKikbDy9R6bH6DQxuf9Cp7P+KrwoKEFIwV0IayPo5Y4nbsOpB0bpDEEffBR49fDrdiArEnNzfIf
	 vJYBAtLX5vLyXwD4Qi
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v8 2/6] dt-bindings: add Canaan K230 boards compatible strings
Date: Sun,  7 Apr 2024 09:29:40 +0800
X-OQ-MSGID: <20240407012944.2996666-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
References: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_023634_406016_8C5C0334 
X-CRM114-Status: UNSURE (   8.14  )
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

Since K230 was released, K210 is no longer the only SoC in the Kendryte
series, so remove the K210 string from the description. Also, add two
boards based on k230 to compatible strings to allow them to be used in the
dt.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 Documentation/devicetree/bindings/riscv/canaan.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
index 41fd11f70a49..f9854ff43ac6 100644
--- a/Documentation/devicetree/bindings/riscv/canaan.yaml
+++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Damien Le Moal <dlemoal@kernel.org>
 
 description:
-  Canaan Kendryte K210 SoC-based boards
+  Canaan Kendryte SoC-based boards
 
 properties:
   $nodename:
@@ -42,6 +42,12 @@ properties:
       - items:
           - const: canaan,kendryte-k210
 
+      - items:
+          - enum:
+              - canaan,canmv-k230
+              - canaan,k230-usip-lp3-evb
+          - const: canaan,kendryte-k230
+
 additionalProperties: true
 
 ...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
