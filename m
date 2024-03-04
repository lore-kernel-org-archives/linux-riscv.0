Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB481C54E41
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 21:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1YzKPSJ1Zdaev4QH+uYnFzHtI9CZL1VJJxstCW5ThQ=; b=hDyXiRhdhp1Zu4
	dE6eDUlbyDEgxx2w6SI+0K9pgpZvngQgA6cGDCNSXynPxo2Qrsl2EuMITSR8SZDzdTxRk2IP7vNKf
	MHKo5YqLdqsUQzv+SRTQn2NY4I9MQMs4harFI6IAEv+ZosFOMmD+eNo+qgKBOFd3vo3BwOAksMj7+
	XOUbfaUZzfRANPtfcGaVZFPm6K+tTefFSAt5OosmguBm6+HOfZlHgwL7Ypo4GyrxDpjdKyA+6/6/l
	Mk34xETn3TRdFEISSXRZHJC7DUcCmnIDweROzJsFpCn0lFAMAy6NAPTLzc62ItvWI9D+4gCnoqMzV
	EpsXny65UR/7jie0Dchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFWR-0000000Ai3e-31Ji;
	Mon, 04 Mar 2024 21:06:55 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFWN-0000000Ahx8-0K5c
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 21:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709586393; bh=Ia1gwhGj9oMsY1Gs1EXwKmn33KXTNReSu7KithRz3og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MKolYSMfuWvCSONw9QBbRKNgqmIVwOfWER+LtoY+ZCRLBqS8xeuIpKF+lbH8HOIGx
	 WCGaN7bl5ARPfzZKnBnseCUOhVHCbzercU9cusV1oWVnub312j592oaj5iW4Zmc4iR
	 PUrsXAEp19KvMqaxNMXrvWt1+F4OsQMnfNLhsy1s=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 1953A8D2; Tue, 05 Mar 2024 05:06:21 +0800
X-QQ-mid: xmsmtpt1709586391txwo4izeh
Message-ID: <tencent_1B1643401B7BF8EC04C3B5551D9D703B6209@qq.com>
X-QQ-XMAILINFO: NnA3IMNPwBd+jnu/wd3UFMXKkTt7bRLu27jCyfzHaPAh+rXFnucBn8PkW14VA8
	 w+0I7gpfGVUMGOHVgMNm455bPwP2TiksbGOfaeTi0kM+BzBH51a7ELUcYsdbRxl/1mlrDyc2UUj3
	 IvcJDtbeCHgI6rbsgdWVawm69P0M2Rm3DYSq5+1OkN9A/UlHLjdG5p0xepO2O7sS2dN5lOKyL95g
	 cW+SzFyau/PXuOuBmVkFCq2S83Bp34Sb5s/AJ7bXf3Ff/CbTKhQGCAXuzfgUYHxeUOGndiHGw8zB
	 4Z0vd8d8HI7h5k66TnX8yh8qdVA8Mf2NdxYVxQ99Eq21cH3v3K/ssexRIjZn/Tday/WFgAacQOg7
	 3HGh4FCk00NeSUb+CPEcgndE1LQ6gHlT3yRIQ3fY7gKcZqcj6nDj5Jdgzxf6HKgv+vaBgYHlz/CS
	 zbGlFEmUhsWuXiUaPMbi3RlLaGk+C4RtGP/UP3i3V/WOmMIX008yjScf3XNeLhzZXZmH7rhoJx6X
	 CBvi7ZzQkRTSSbW2oWeIZBfEA2Y9RSFK9bVC0YoO9MOiuNUYm4nPeX2Ozx5fA/DruUyJ7I7uaOPj
	 BhFNQvb86YY0PS55lGZOkqKEqnTYTwjE02t4hMG10Sokf758htzk3OCOHChBTZVxM4XzW9udSqv9
	 ntl4NYCeP+gCFIG3by5BrzN1CsbF0QgWsnNGoDNbVJ0BxYhXBS9/1SI1Y3KesJmMs8D7/wEzUudW
	 66d05rIlYOW5h6HRvUV1Luu8MLG01qoxoAc59bLI/fN0oSzHxXMlZWxvMH7AgDhxIfZFp64M9x4m
	 7r0/vO8Nq1H7mTv9W+8HN5u0YBAHsvV4z8Tz1rstfU7YcJXkRD76trtPNcaz/z3ncNo5q120Zhq6
	 nykW5TGx0PTKHThr9z5MxnSi3q9Zuz5aHfptHaDhrWzHG3qoh8D8UcY0rr4NMPcjPPUkRYG2Xkv0
	 bdzUdNrH79DrrpUTS7JRTv6lXepiPCTlImn4wsGWEsj+lSMXH9Q2MxjwrsU76pk0kMaHODV+2RJH
	 JzXgLJ56cc+7QXxn65wn82WPVXlrDpIzGS8PWODvOd73PnWbVc
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v3 4/7] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
Date: Tue,  5 Mar 2024 05:05:58 +0800
X-OQ-MSGID: <20240304210601.777883-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_130651_612283_DC824FC2 
X-CRM114-Status: UNSURE (   7.80  )
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

Add compatible string for Canaan K230 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276b..122f9b7b3f52 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - canaan,k230-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
               - sophgo,sg2042-plic
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
