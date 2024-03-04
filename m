Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343FAC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 21:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93TdIt9wugNdVNdft5kgd91er1XcPpyjDY0QiaoCNRs=; b=46D3AztZX0Y95h
	3VMhwDrBe4ap09dGqmlwIsHcVqf6g+lR9Kv8hwrQ53bIPwWHJiNvFnIvhT2Y52VqywhkhPrbmeiJW
	4WgW2e0BdNtzgGMBRM49RQOF8BhsDw9/x542z4dx8tKuwz8EI3HpFK5UcOAdpgg+8lxUVAG3HL9GS
	BGY8SJsexzd3lvCBjJke4Kc31gVhuf3KgTay5ZsN1uVx8Fmh3vxhXG+oR28y/JAdi4cDtuw243gGJ
	orWZDQTFMFfOktPoBQhRrcVlN/eww3qVGAIZPIAZgxaxK5llMIaYhlB8KvVYdljuqAoIN3ntsJxBm
	nDXAIwJd5DcuHcTFRv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFWA-0000000Ahpc-08p9;
	Mon, 04 Mar 2024 21:06:38 +0000
Received: from out203-205-221-235.mail.qq.com ([203.205.221.235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFW4-0000000Ahjw-3pfQ
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 21:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709586388; bh=s7QEg+O5WzM5yI1q1lQPoUf0e90dpB5qxk5MpOdViLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NsaDB7PPAxypurlm6rlAl+cL5nLuE8Ls1vqlARtzQI6ah5iy0jAyNZWDmkGGHmspq
	 SqnPbEpgG8Onklrc+C+P2YXL8mKnR4FHA0tlXMrJzN+h5zfUfcikO7abwhOWORD9X9
	 4TDjZ9VrhrhxHK5t6SZ188hbQk8VAHKsgPsz1rME=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 1953A8D2; Tue, 05 Mar 2024 05:06:21 +0800
X-QQ-mid: xmsmtpt1709586381tcdoc9q8g
Message-ID: <tencent_2C7B0851631A9F9AA0A4F6A9E30EAE5F0C06@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznRKnYlSRS18X9ZwJFLn74xBtXc+wY0Wb28ataBnC1sYFWy81Njd
	 ejrXyDqdB5c3TUxeogi9GQtQzV9z680J2JVlXFSQ/wi/808PVqbg7m/SaWAQDwb6hyhB5ld1zeYk
	 9rxb8WbosrUYxu+cpzUIDoSfoXqWW37zqzkU+25WvLuoKUkMdrAq5lQg5CViq0xSAc7fonMSerF/
	 Efx0w/0juW6BmjGDbxTzeZjpULgAqjwyWyK/fkGKNkyzNdMOZBMIwaj3UxXfQpd8LUQoHrUvxkdN
	 qQqh3CJaxT9F317ztLKIy2XeTPQnX9lsfFmqRIrwt8a21ESzHeYbGRdByvZ3mlVlfMQXf65CRADd
	 GCQKMGBazhJ4r2qGNHG0IqTLrWkyZZ5Bu/wAZ7v7wg3v2IIE6sdpXsjC4OW0Gg2RgspucXF+V2Cx
	 Tq5GOCN3tH7qtocIRbddcfw86PP8AXx28CQ/Z3TiiNkqolXM7CCBaFvgVevmBmjJhL5TUb7h+NRv
	 /j7SpEgPwU8+nst/yJ0Ztw5fzP7v4gXmFp9eO6DQg2g0fHSoIbdijGWho2qEogGtck1G/m8gNsi/
	 XuhpJ5aU0NuSIyGD/NHELLBpkr7SBVPIQ81uuch02bxGAM/SXmuw/1naezn1a8EY6Ucgq3PSRk1S
	 NoQ+XPssbXVmF1stDDheEbnsqFxu7gn+tbR/yv/v4l+g/BOgUBQxBTQhSk+7ZujbAUbMo8Ws31fj
	 F72evz97+jszst9CFrPyU/zMRAUpmFBEUJEO84h1v+J9+Wgn+XF4PrFcDkG6WUFYdkhTqwMezSwN
	 E01xJNBvL8DbBazA6iEWyMwVyGeZsdDjcxH395RWiOf2bNM/ZeqF2CSpCBHATmBy5eeBwdYVOhLE
	 a1oCSm+N1rHG3lOc4CDFdPIMnSBoocHB5UxBa6R+ZpmasFYxwEC7V7NmxNH9pfGZnfTVyCHXLLLA
	 x+5tdgR+lMCdJZGz8LxytPWe1KQkjGBwwnBpmMibKPKlTbCfOtspbVKykbN7pzOwrYxTOzrEOmE4
	 gDgr8qagHCG8SD4yJGclpX5SBtV+g=
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/7] dt-bindings: riscv: Add T-HEAD C908 compatible
Date: Tue,  5 Mar 2024 05:05:55 +0800
X-OQ-MSGID: <20240304210601.777883-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_130633_633550_A9EEB396 
X-CRM114-Status: UNSURE (   7.69  )
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

The thead,c908 is a RISC-V CPU core from T-HEAD Semiconductor which used
in Canaan Kendryte K230 SoC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 9d8670c00e3b..e853a7fcee8a 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - sifive,u74
               - sifive,u74-mc
               - thead,c906
+              - thead,c908
               - thead,c910
               - thead,c920
           - const: riscv
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
