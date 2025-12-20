Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DDEE668B3
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cddeWJirc3uhuJiLntsXijXxB+pisMUE50kKOOxX/Is=; b=rnAbcvYuNk6uCQ
	k9O1lEinS7/XaTjTp95zlJ1cfupSnJoeN9vQAYVvVN1GbSjzXUlE0kzsZrqg0o0yOCehuB3Ruousq
	QTyMX16R+388kRqB6zrnHP/v35qQ37x1Ae5mWwmj/H9VuUltoFt+1FJwNgYqze7o5ELfBSTdFTfAJ
	ZuvaCL7xSSGpZcZl3KyZ+nES89byR2WoXLM28ielgBEw3tIkE4QxTIVqWVddoVCp+99SLDMOMd3XG
	L5bficJJh1p6vto0P0KnBbE0wBIHOiVDwrqjl8YOPGGhNFsugP/bx7fMO+UrVRe7uGvxOyksgim+h
	CyApTgWyMpn/KhLuhL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtzz-0000000BUp7-0r9O;
	Sat, 20 Dec 2025 10:15:43 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtzx-0000000BUoZ-1mWJ
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 10:15:42 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DA0DA340E92;
	Sat, 20 Dec 2025 10:15:35 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 20 Dec 2025 18:14:53 +0800
Subject: [PATCH RFC 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC support
MIME-Version: 1.0
Message-Id: <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
In-Reply-To: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=986; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=GWiPPTqo39BTFGNzQ0XUDmlNacTF8yHfn5Ywnij6LGA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRnc4IsqSpKa8rIBplRoSkYMD41jQazKD9MjBy
 wSgD6dwQuqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUZ3OBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1zSA//VYPBskgcUfCvoQOif0mr0il/zFJOUaoqH9l1i4BXvGmkN62pgODi4
 7hOqDMBZGz9WvJEEZATBPjYNBsa5RhlrTvflE2wiwO8qBE+4THj94FA+fIgTI4yaMmTRHvqkIg5
 3ulMLTPkBUMek8Jn1JViL+cPczREaLrwnhPK0hMFcsAEkYzSD9CRq5F6dbsDDq5oJJiRJJIVtEC
 Dp9OduwZR/YP+gX7TZDD4mHRsaFx25kFNNmuC8zNjt5oSenO8wzNuVyAm7yFNgmAq6PmNTss0SR
 +T3si5te1j74h5CIZh5j/x+ZuaFpHurkB5XY7YCSfnBrkO7NsiT/mMsbTJVyVi65zzIh+hyZNoi
 6HaN3CynaMUOOOwDvBA+/I3Rjayj8lI67Tdnm7HJ+mNpQGOtvoPHzcRlE070eiJCrA5hIz4qw2/
 UE8dNuP7fCTifdxutN2vVKFDby32X0hGi9JTgCB4ygnhhrZ8jsgwx4+QExJ/ddyiP+/39f6mKx7
 H967/yBoRvsRfC1gC3KspEw7d7jKLGHSZhc0QnToGVREvQiW+8kNKHt7QEZ6XgCpgOJibzhV6sh
 n1hi6FnWHOaKgzPU3abaPKSb1xKecIZouwQwKwp3YzvWp3vGzMx8flJrHxRGUL8FIzOm6Y9aQB0
 6RAN6G0NEll2dVXpdEiq9TNAPi9PKU=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_021541_549787_FF95BCD0 
X-CRM114-Status: UNSURE (   7.09  )
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

Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
almost same logic with previous K1 generation, but has different register
offset and pin configuration, for example the drive strength and
schmitter trigger settings has been changed.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index d80e88aa07b4..c5b0218ad625 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: spacemit,k1-pinctrl
+    enum:
+      - spacemit,k1-pinctrl
+      - spacemit,k3-pinctrl
 
   reg:
     items:

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
