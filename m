Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7162C5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93TdIt9wugNdVNdft5kgd91er1XcPpyjDY0QiaoCNRs=; b=tOpykgqKYGxaIa
	pU5bcpz/KUzwmwmsk7ZYnLk9XkW+/28mhMNiSaFoZk+Gz6T8fYhT9ULJXJcpyIOCvsQqu9Y1qISJo
	LzKg9XGWMZXySAABYQsz9Faeb5UzSu7fwkXgKOlEESt9+QYyx7K8d235R6vgxqyxi3OrrVeie0tsE
	bUWkIgf3GZbf4Z9PINUevUYVw/OOEPaD+FWNqDYntBL260tn0qGCtpFJsJtgWuEfkHgA1TnH1mwel
	8H49CwMdkzhjOEFXhhUSLR9/aJEzKYYv5N7UzKImfR/uZ09E46EAf/I4eLWPvhmyEiwM/r6XxYmrD
	O72pf/dlAQ0P0hIf5EaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3e-00000009XCn-0dTT;
	Mon, 04 Mar 2024 15:16:50 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3b-00000009XAY-19c4
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 15:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709565403; bh=s7QEg+O5WzM5yI1q1lQPoUf0e90dpB5qxk5MpOdViLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KFqjWutXOWrgnx+YBQrMGfQZm37zOqEe59oGBjA+c+aIgHZnZjosnKK5+XCh/cfQA
	 BqHw1cYOfjIQv2SIfijRPNR0r8Cbtmd+M53YzE/P+mmRAVaSFc9PG+9GlQgXQnfqaj
	 dwqA3HbLp4/7G+Awn5vzQySpSQGiUqk1rCKxbFwE=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 42726AAD; Mon, 04 Mar 2024 23:16:39 +0800
X-QQ-mid: xmsmtpt1709565399tgkhp07d9
Message-ID: <tencent_4EBC1BA5F988047DB4691C1D714D636E4209@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoN+Knf0Ay9A6Og7gvJ/GmKJTIgfR9/r0iceG/xbDQNEolu02CbB
	 U0eMZGsivnZkYrCZjgoBJRq4r0rcMCyXIN2gO2XkFhn2z0KstNf2ncy7tJdCw3YkWIZgfLIITsi6
	 cfju+qoziZMpTegHNUDPKRKx9gf9ip1bllwbakjF1teNWm6ugXBf+kiE5Ed9WZuceVRzA/o8Licn
	 SfCVH93e113sJFrxNRgM+6/V2eIK6tX6zG7suGHITZxM8W7sGmhwcdqlCn4weAlO8hm1S9d3lFEW
	 F+0XCWdS1Q3lf92IsUXyjHeZYhNZGkWbTtmuXYGozjaOfcsmG4aHvtMK2VNzy3jzT6t1uZANK3Fj
	 F3zaASNUkWYEFgbrvgMFAW0R8z+PFQgLYgfYS0KecLkZNLGIsuA1RROrG2FmyXoMlb+t+a3xgoGy
	 l29d3gCXnBYAzX002s9r2f28H2qPRTpaoi9giVj8OrH+sIP+YxA21AHM4+CHW3iSJWKP0vHg4g2a
	 BrPvbi8NDnL6Mv0THAouYmcW0m/lImjo4h8z7sDl5zBz+kuNwGrpjBxEtvDOGT5EzNxkW5CFCEJJ
	 XjkNi8grjGOYDi4xzpZ/P8QI6Mq8pQvJ7FzcNb7NidEioZ+MYJemFWGWg+RyxYCDita2WffFJLzQ
	 9OITInRwrA6sxYX/+wXvyUy8aCjZrpS0om1t7jydCwJSv/IP5r+wBJYBZvB5XQm2mohs+1UBJXgR
	 guPZeC2eyG0mLgfxQKuiQ4mrKFdXxYDSGO93t8KsQjaT6CPm47Nyo02SqDmuVz64MCRwkh4FtDj7
	 QzFxXyzZp+yw1FeYtbV5EWe2PGUDT8HO/DERYHeYRhWvLF0gQcSqwGtP+MFKOpjSFh5b9NG6vOLE
	 yeF6WQqL3c+i0E6+wKs8B3lAFdFANTZoCKC//8whQrjkpr1NZ9bO2PYBWYxJZmwy0yH7ZYo2in9L
	 0ymoZg9wEY2sfGO9KDkQCohYIF/QnbavfoTvL/gho8binJsskS8qaX9yga2IcEbjFYct55XEShIj
	 ELbwR0LR8suArhY0wBEPe56P1xqtUR6BbcedFC5jbENLVlV4lj
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/7] dt-bindings: riscv: Add T-HEAD C908 compatible
Date: Mon,  4 Mar 2024 23:16:20 +0800
X-OQ-MSGID: <20240304151626.759150-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_071647_732790_A1D23AFD 
X-CRM114-Status: UNSURE (   7.41  )
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
