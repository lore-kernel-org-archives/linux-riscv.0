Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D10AC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPKD/IszVhQGwvxGhwNG8AoGMUSQ3Zp6Q1z2idbHons=; b=Pp3P5IR6uc+T/v
	o1RjBsQ2X1UCdnGvRnGHgRt8h9O3sixwCCcXawL21xfZG3P8XlebvBMh2UH0x87UakuNRk5raTaiZ
	S0GdNSYvBtKYA3cLD25o8mMmJJKEtu0tjRZ13J3dNnoMSGRvUWQbOz1/obLziSqT1645YxELMre6j
	C+ZF7VAnw3yaXJcud1D9B5i9BgXg7GMqut+MRoUjbUhTgMpcrgR7MJUn+5MXZt/LMnc/B1egugRFH
	vQrM15xd1mkaHLBKEKb7TuOb2GFfAtr7YdfIaJaMs2qUlS/WhckFjfIUDkISsHzsRkO7qg6F2/XfE
	aj7UMPBn967dVnN5M6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd8M-0000000CAR3-2z2G;
	Tue, 14 Jul 2026 13:25:14 +0000
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjd8H-0000000CAPA-3JEx
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035499; bh=BgcfPTlAW4ZkrVktnHYyLoftRs8DvUUUiqXzc0BRnK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dlJfhImirMjVod2uYKiJ3LLJYMpTA3KWsLviIWKOC9Feu+TqPxf7QWe7gsEGnUIjv
	 akECdilG7I54OBruBMbRE602cwUyZBw3Q8dtWorFl/fu4V9tnvDELx4PO2Ums3azFp
	 S1mOmNzVUJFIo2YCoQ4KR6lA8JQ2NwrZX77D01Fc=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 6383F6EE; Tue, 14 Jul 2026 21:24:56 +0800
X-QQ-mid: xmsmtpt1784035496twq166pem
Message-ID: <tencent_A781C26C35482A03F6BD42B277ED977B8F08@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoQ2aGi58qIhW3zO5H6sWOgWO/OGMpD2qezJajP9n6UVuXR+RcY4
	 LZdxd0RrhCiUr80UqpMF3uGJ5zwPsyvjDML/OkSPK55g4WEizl2ozuarmRKohiM+vNzRgoSodiZh
	 uMUSau1vwhaZZtCP4MM+8XyV2MnXUZmuSlf2YDH+rveTxJz0ACbQHNeT/ndwRGO9uLSf2iiG6slC
	 /W7GIe/Cepw4CnnUQ9o3pkuCCiqGdGzYnq51+VR1GPe6iY1xN8zB5Z7O3zU6vwl3V9VEO3+DCBLy
	 macRAj5FB6iGmg4YnF6fzicCgQp/wiCD3evlVFq6i86z4RUrynwu5WVmcYNZ4HncEYS+BPXCutrg
	 pHd7Rqem5tCZNXfE0OdaRns2z9xMj/mksFa+7b4Oo1mp3Sbige2RZHA6A+a1z2ChzIG9zyWv1vVt
	 +7SDI4Qb84Z535QQBUkdI7JXMc8VhJWm34PWHTt/hU9tQA0I/y04TT51EwApARgWgw0OnEcuBIe3
	 Lh6koXOQ1WYcrxcIMMhSa1Z6/2QnuM0yaXP66cbG+AB7WGB8EoI2MALgP+cZMkUsJtn/OWLcivHI
	 NstC3VnWj/8kRqVQ+0zT/ss9nQkh6R3mvWXz+ReZio9rMuw0tgjREgTnWVGFT9850sOQQx5frLrQ
	 gB/N+iuT0qvr8mIjFnfMlg+B8nc9+9iDjFquYsyggaemlWF8QgiwiRN/MEUZ1f3+0StBylIE5fMN
	 Xv5zvnPdcpCd4Spmlh9CCAWhlCoSvvxGf9WXyT9ELXEhuC5sQMjRrglnyF6c+y5bBrg8bIv02XvR
	 33bD9uMrAOrqlVEfNV3fAFdJSZSioUvJXU6OtNRE8pQFKN0yMgWo2ElmMzkZ/FwnmTP16vdjSaf5
	 2EAUWBPRR48LZubr12U12Om0UoNMT1y9eCwsGOolz/l79HcKyCkbwiI0D1FXUuO0Ra3XAdnz5HM8
	 brSo8itpKuRShKyvAuAJSC11wKiwkCTP55eOjLosK/PN2EjEemVrkpfiBA8x8LKM268A9dLQatha
	 azBMOjsySZzyy/zqnP0vOi2mS3oMs6q08ib7eH+Ly3hsI4des3+rGk2+sdxeH5Z93pRrIe1w==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Subject: [PATCH 03/16] irqchip/sifive-plic: do not iounmap devm mappings
Date: Tue, 14 Jul 2026 21:24:39 +0800
X-OQ-MSGID: <20260714132453.3302672-1-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_062510_150631_0AC98F31 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: Haofeng Li <13266079573@163.com>, Haibo Xu <haibo1.xu@intel.com>, Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley <pjw@kernel.org>, Haofeng Li <lihaofeng@kylinos.cn>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Haofeng Li <lihaofeng@kylinos.cn>

plic_probe() maps registers with of_iomap() on the OF path, but with
devm_platform_ioremap_resource() on the ACPI/platform path.
fail_free_regs always calls iounmap(regs), which double-unmaps managed
mappings on the non-OF path.

Only call iounmap(regs) when the fwnode is an OF node.

Fixes: 206dd13a1011 ("irqchip/sifive-plic: Add ACPI support")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-sifive-plic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..0bddad388741 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -819,7 +819,9 @@ static int plic_probe(struct fwnode_handle *fwnode)
 fail_free_priv:
 	kfree(priv);
 fail_free_regs:
-	iounmap(regs);
+	/* Only OF path uses of_iomap(); ACPI/platform uses devm mapping. */
+	if (is_of_node(fwnode))
+		iounmap(regs);
 	return error;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
