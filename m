Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB3DC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILApmOwT57iddPrSTs/8FiigF0zS70Ip65RyLi1ILjA=; b=0BN0jFhLzQQuze
	KM6eeE4pcGyQUD2RHQRc2kdoSdQeJfELU1BT7XWKzfLlj9twEMYkj+dDCLK9a5l6TV6x/JIIusXW4
	hpko+cFwuElHqD3CdNAcCuWRyRIEIkzoWgyQlceNZIsK2NDqxk0Lb/+fCOfeC4kHigNeA3z2k6k3v
	Wp0B7xA8bF0e5Gk/dVjqhB+rjC6Ee52RWVh6lVaICw2cdZNdWexyHhqzNlPSAUSIaEZX9dSUzBgd1
	TitQmZAHqB5W9UVLqJNFnTCp6M77W4ybdfuvs4kCFQeJU2k4HExYaOoqU76Mgv3at3AgxrzMNzCyH
	nj5EFrPrbsg9V8wYPyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3j-00000009XGL-0l6J;
	Mon, 04 Mar 2024 15:16:56 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3e-00000009XBg-2jxW
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 15:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709565407; bh=nJidGdrVKa9+98drhoLdbDX2xCdE6XKT/ou4UGPQ/5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XIXpNoskD2SzVNX+Peds2tkeV0A5Lg3YB8rIMfmIGAKB5JH5CTW00nrC8+5CV2T54
	 0y2NR57NGy2C5BNuLdoXsYjkIW4Xc9Vwlc+7BUbTMUfVyVJxTD9Iv7R2DY+wghS+4B
	 fO2ED/m+13+Ftk08EsHKpl79G9AsST9gN3xrBcT4=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 42726AAD; Mon, 04 Mar 2024 23:16:39 +0800
X-QQ-mid: xmsmtpt1709565404tp2y8ecwp
Message-ID: <tencent_84166A6B39E6E062C4F8872436FAF1D10A0A@qq.com>
X-QQ-XMAILINFO: M01fr8RkAJIF4wUbDHP5mIGbxbh9iR1w5XGbdFmx5J74WeZ48s/OPys7QOl9TZ
	 xL6Lrk54S3w4AIOydTjq+lfT61tTdueWAUmYcOeIP0mXpXsr89m7vhje1INUkgv2vRgHkDi8/IXd
	 V+yA91cWwTaRhMuJJg+3LxI2AlyCTT6m5h4HTsfc+5RyM+tkWP5HKmKsxLWdeFSRmydNvwA9HUiE
	 n6BJar9CzGKQvuju0y9mwgKh4g9v32/VaY/Q8lqvLYHCtEirOTO5+Rb6tsfxssGJKGRtr9jkKvrS
	 Q/5DgU6t6RMhjpNycpOF93435WmT2tZmvQ63BksFQsBp84H7wWX+qi0PHveFQWRec8bP92B6kJyz
	 KXO4ffteq/4mKND7cdpYpbU7OEZLIH4KX/s6gbcp7ZdW8imx+4xqwfToeAn3uuUgMaVMxnIKg9M8
	 /8sHqkx25NYqBmLQo49m1957kqJZmuZhTu1R9Iwlfg1xU1HOtVZmH9dmGfQnVhL6kK7JippVFbNZ
	 Sl9T1kn+Gjo5/+jg1eg03pf72xjFvn51bNhdQtjDDmxri2sjfOdtbOv9ISF7Ij0U1OrlrqZbzR3e
	 Du6g9AnLhD+dLPtODPQBMcknPBQ3jPOZMBI8IcTNj62MiAExj7tvJxZ/3qbFAc1gsBLBmz34cyvd
	 5XZNbY/GheHqSdhyRzX3T2mhPZK3+ZglFORCaaULpKTC+PDI1jUjYJj0ntR4/7ZSb0oZvdMmM/Gv
	 12nD9wcCobiYtYfFScPvpEypSbT/4uPdXVPAWexoJjnC8PeKpwhKtrAhodSabyEXfIvUbep+LooH
	 U82isaF0Qi47jeNhcXhkoQqP7oY3hYiBGpemI2r6U5McEuFEndRabKi7cAhxP1sly0hTQbTriDCs
	 onDhjJki6xzhO4+NsSo581Oq0l26nlLvNrsHXpX/vi/GKF5gXtvD49KS8ace6cVN88BQ4lGbfdJG
	 Pj+lxaUuiDtAmV981zwfSI9shc9BPj9ryIhfwEUvZjJnNK8IKls24KtJSfoIJgPNKd8NDJdHTWZr
	 vRv5OkbLN01G8kSgvTDrCqrN9z4MLCdXW77S4wo29I4gIpQ/ti
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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
Subject: [PATCH v2 3/7] dt-bindings: timer: Add Canaan K230 CLINT
Date: Mon,  4 Mar 2024 23:16:22 +0800
X-OQ-MSGID: <20240304151626.759150-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_071651_278445_D9645B64 
X-CRM114-Status: UNSURE (   7.49  )
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
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index fced6f2d8ecb..9840a21c40ca 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -37,6 +37,7 @@ properties:
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - enum:
+              - canaan,k230-clint
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
