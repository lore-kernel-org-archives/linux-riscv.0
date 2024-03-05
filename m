Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD95C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 20:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R00RvjwMYj6xw5VrxMPtIccZXT1/OQIrtyzXIGXAnuQ=; b=gIGzXrO4a+rNDd
	achw0amZOj9KIYfRbzucbw6rGB4btYiSkAb5FJiF1HjJEsukLKdx/ZMSpLM6wpsOgRHMSB3Mk+IuH
	qdc8FbSnz9Fy+6Bst+6rMY2dIWlz9Vw20B2tt/xl86rNS0Wwbp/PbTX7RXT6WI9aB8C1dO4BdO+Xo
	r0Ep5225JF3OoLGmlhzW//mCto3jemnz/aNUh2Irz3F9L5TtrE3dwpJOIWzRZK416rHnOgWrzDuR8
	34lWCy7Ap9ifv7KwLpFQEUwZCpiLVoVPP++zVxsJBT6CTKw/GPlrlijNGF4AOUAu5QH94H6VKbq/N
	zcqUybbCruzYLGBDjvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0U-0000000F7U4-0ABU;
	Tue, 05 Mar 2024 20:03:22 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0Q-0000000F7RW-2ikb
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 20:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709668996; bh=RRjix0llQAKkZ0Th8vUk4UX/Alg4KPw3+Xw8qybrfN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ik2PuxjfyigyEZQirzJIcyjREFKznjHS3coUGqDBfyEsqM90MqomA9OO3E8ieaIe6
	 Gki3yQOUk+iMAQHBhdEzN9GDnR+qUEENMLQIcbuFHcCBbhzD9zOjpdwh+e6nqNdD1d
	 u2wkVGELwJkVDRppCjpbBzNAfufZn26tzjzEEHFE=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id C898283; Wed, 06 Mar 2024 04:03:08 +0800
X-QQ-mid: xmsmtpt1709668993te08079ng
Message-ID: <tencent_AE58630CDF9DA09FF6B5633B2E4C8C668806@qq.com>
X-QQ-XMAILINFO: MM4ufCTznNl4ZcuhpieiNuvZ5tqX44Yafw+IBkMLVPpiqUBHnMOZOqobmBDCyl
	 Kss5hynsGzO5CjHA26nX59TyIgC2DZwCWNgOwNyFuGeoa28Jxq3tPkuO7Y7l0IGfjmS6wZ7PV9gU
	 G4Bee/DtUCrsjdt/BvSLIWzb8dNgF1fyQ2MOKPtfldWzAwQVpwWQb6G71yq7ffz/OVZi2hQaR3LT
	 bRNy8nht7Ijk/ukAjat+3pBtKq0wLIiXLWY44qsTLg3uJRSRwStOnCz5jhyv5XkLfF+Ayj64gCp5
	 hgx1E92nVjw6PQzlu6SmqE3NKBokxjw9yUEgJkMBA4fK93adD02bmgWIt3IuhZQZ45YoGCD4Ia5D
	 G59SFfWcNCFPoyzBXN+YpajYcszQSRqfYyJOUKRIr0xPxmIdN/kAD3MH6G/jOcSUrPFt4+JYdW1P
	 ZxwiLgqYGISL9LogTm7+6v3wVyUlBtqJiun0Dx3/3jBwp5JHMHCAxh2YeJsBPlmaJ2XFCe4+4bUn
	 uiAExpuna/hjZtgQnAfL0+NvowD3VgxqohcdVNp3OAoUiHOBYc9iyZ9DNVUtpM6/K8wMinAYPvCa
	 85WiWVU/TCTKJWY8m6VjlM5wGiXSlz6IiYKbqq5X85kSMlmtMRIiZKNxDQyXTB9ytca/ieBzqExQ
	 mopA32PSzjeuSIBYrfJrFJm9XsTK6isW0mtlXVQ6LrcvDa3jlT0oBRtTc2m47DAxL6sWQ10/oCeB
	 G4ENzDbBsBBl21QabCRZS0/5PTVVjcyPyoxiK3heGJRwKDUje2WytuNTxbzLcHo2XEZvNsO9sLFV
	 CusCGMpUv/EzphWecdSs+BaV/IKWPpTYlB1y+ZKKZ2ByxjuLqIhTEuLFy3y1l5AKcHfBtEHOrTTn
	 eFHzcdr4nyqUJFAmUasynLjtRgko3Hm8aWoqaLpeplvLxvZyXxwsVlwvzTgY3oPtrPh8stdCGZXh
	 CxIpNvgXJaJMM16dCioJwosPpIhYfnljaQb8jkdHznl03vwmuIG3v5JKMryU+mrvnJVgdupwgEtC
	 MKSz9Qr92n+80kpkajo3mWcps3LDnLyvQbbP+qORShRs3xv2WyTdXx1kzqmaQA+7hYlcRnOITLw1
	 GDiAWIOPJLESdDYsBaYrWHVWmF1qxSvV/A1ZFN
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
	Yangyu Chen <cyy@cyyself.name>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 3/7] dt-bindings: timer: Add Canaan K230 CLINT
Date: Wed,  6 Mar 2024 04:02:58 +0800
X-OQ-MSGID: <20240305200302.1093082-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_120319_048390_50BC5E73 
X-CRM114-Status: UNSURE (   6.73  )
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
