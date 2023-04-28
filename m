Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D0BC77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rl6fMdb2Q9d4rLOrJ+X3Z71r9yddQsL2FE0sjm+lO6A=; b=uqR8mnWzRLw2Rn
	cPCt5GZTEVRI71il/sJbXVzJfwibQLT/poTxfU37OZ0bP+GLrl07g+BQ7ehwau2X+Z/ufnR+xKQFq
	2WbXKsem4+ui8fTdkiDuyeMt0JORxHOO5hBrYJJGTgXztlHNyAsCFSH1KaLsvzrRzFrTxdpTCb6bB
	iwJKNcSBPPCjUqDJ+tKpHPlOb6SOD+hP4Xmh4bVe3KBYblb2qxy8btCp1eyipsv2WLnAlAc8oFJ0L
	k8f2Vu55FCMls1hib0pnBoysrwMcIAkwEnNb2mhWO5Q2Zk1RsqvggdijrvC/uxEvaKGGD81yuaa4U
	iQ7KYp+Xu2EcXiQOvVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psOth-00Arsi-0w;
	Fri, 28 Apr 2023 14:16:29 +0000
Received: from out203-205-221-242.mail.qq.com ([203.205.221.242])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psOte-00Arlj-0i
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 14:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682691374; bh=UISpvrWcf8XGHw2gIn9GQp2Gz016hHdtzc/xDluQqIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dBq84jf1X2DACXxYNGfUMRBqYj2e6uzE9ls+p1/N2+BZyVVVIDqzuAcOMp044tXXy
	 88JigZzhMjAJn0prAcBIUwylPUgI4o7ryC7HZZycgp7Zf/PEfrSZ9Kyaz1+Ed4948e
	 +zOrnmrI4kV7vD1ZdLpINwzhsTH094kFynktp+/g=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 4029CE99; Fri, 28 Apr 2023 22:16:02 +0800
X-QQ-mid: xmsmtpt1682691370t4nljvwy2
Message-ID: <tencent_85F69423082E524C478844E31D5F8920A506@qq.com>
X-QQ-XMAILINFO: OOWntbL6xj161VqpJyPFXPlj7lVhXLHqtUlwNC8Wpct+zWuCZOPfZLGmFG4W86
	 TifaEo4I4giiKn7Qn6LrA7Q6eNu0+vhilhVtxwG4t5O1PEG0ZXy5DKIdDegDmkG7wp2w+EzUxpD8
	 Me1WxHRRtikxQ3qUMkvU3ZpMvUHIPwsJKvAwWxFpVp0+SUmIj95bQcxC40FGYInRe8i4vdbccgbN
	 FmwOCEl5jTgmuQxJ6804jQYKIUppa5r7Fv5h7SeBA+D57AIELnuOZLUP8QoX19TxHgM9tOC/Ps2k
	 YFHUcAvCf1Izj19rTyWHs+Wpb4I4xYwTGam3m3xFn2dQRyCtAOIfAURrq52ROHmoNFugnBXfkgFU
	 N1bVo8+Dsbea3Cqqq3MfXNK2un1rsM+uhRWf3QYMoCcFEfvtDXQrj6vXQtv/O25jf2/a9CeHhgXu
	 KFdAehCAdL5kvLKGAvqrZ3ZMYrJKCyW5GCWFsRaACWDvq+vesmw3rr//p7F7EpUbIx36sLQ2nVTI
	 l3x+DvR3QEsHqEWMX354e6Oo72uuy1JIH81S3OqyBNurtXe8YjYVI6XYlN8a/f5KuljPNe7TMmPA
	 I8FcPuemMOljOIZUkQj5oCIv3jBGoarKU8uAJ12PHAS7iiaftNtsWniF8VY/3hNixPp6Hn+YueyZ
	 ISQPEa5sJ1l0YqLmKpNpEw+NFfM+LALrwHh2Q6cfMWTaYNhTLeuBO+kKsnL0mquqsLcK1KYgb5Zr
	 LvdT+XI6jGpd+CP+SG5/KVb3v5xdvKY6CQ58KpjlcOTmqf+s58W/AWE6tmWe/DxT6eqSSLh3Jebg
	 q5ypUhQg0BjWuFRyCVIJg7RvaDKz+4mKuH3aZz6jZuTRlx1xlJ12vUkmd6js5jK5h0HkSzHdclee
	 fY7ZeU5lxzU/CLi0O+wN84oIy+Ux1g+HjF6UwMaOeBCNZ0ROA96Gwh48J0NM50HEJVWrrBBrm78J
	 pD7l+VoFLGD4TzHe08mItOjKSM4VdoCnOvPelpvImIaIGXq8kwVA==
From: Yangyu Chen <cyy@cyyself.name>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Wende Tan <twd2.me@gmail.com>,
	Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/2] dt-bindings: riscv: drop invalid comment about riscv,isa lower-case reasoning
Date: Fri, 28 Apr 2023 22:16:01 +0800
X-OQ-MSGID: <20230428141601.678489-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428141601.678489-1-cyy@cyyself.name>
References: <20230428141601.678489-1-cyy@cyyself.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_071626_594396_58656EBE 
X-CRM114-Status: GOOD (  10.27  )
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

From: Conor Dooley <conor.dooley@microchip.com>

"Ease of parsing" may have been the initial argument for keeping this
string in lower-case, but parsers may have been written that expect
lower-case only.
For example, the one in released kernels currently does not behave
correctly for multi-letter extensions that begin with a capital letter.
Allowing upper-case here brings about no benefit but would break
compatibility between new devicetrees and older kernels.

Drop the comment to avoid confusing people.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 001931d526ec..1ee97621d0c7 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -81,7 +81,7 @@ properties:
 
       While the isa strings in ISA specification are case
       insensitive, letters in the riscv,isa string must be all
-      lowercase to simplify parsing.
+      lowercase.
     $ref: "/schemas/types.yaml#/definitions/string"
     pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
