Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A643FCF07B1
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 06:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cu3UYi14vbrInwl2HhH+zM5S4tafnzNzsIICQ+gYtfY=; b=JxRWzahaQhtHTD
	ZIKNSFOvnq/cWSRkQZ6Wh15FhvIslOVJmMjYOCUMn9V4R+JfYkKMx42oAEIvpqcWW1+YdAAoHqcZU
	XQXtRnURIbWKxf2DhVy1Es12YYjGzdE2VIaDQyqMLs4oRfHH0IWW/jgQbY7EwfP+n2omMih2zHT0z
	Z28JWMDw5vQfu+IBmMd3VOsqvTVzp/lSiCLbnBIdCtleL/SvMtiD5Vl8SjsuejEGEnY5YugRvDdRN
	bAPZYDzeMvlOwbeEBa6k3E+HpPTlINluov6bgJm/kPVCtARYf1b4BudbfblQVJph/IKbFY1qEVd8K
	yoTJuLiKcbs8gw/nx+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1symkL-0000000Bglb-38z2;
	Thu, 10 Oct 2024 06:34:01 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1symkI-0000000Bgks-2hRC
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 06:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728542028; x=1729146828; i=markus.elfring@web.de;
	bh=qUNkm5MuOxf6IBBgFwcWmJvYdFILddjvzkOVjLt32J4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aKUf0B/s/s1c0xxdCZZxrFjr8kti99z1b8uoZEx73Bv1VPxMvI8+uptDNUqD3Ark
	 0beqcQLnO0E/NpB6m6eP0CpC8WCr1joQyQTNeRt0wqxaOuTkFxUJ/1KzNDhYcd/S9
	 aIXBRtu3ow3Vta8xWSwP5NUb+mHuuKw/Q1Df1zqbaBtyqKVvBbLBUfhzpb8FNueHQ
	 F5kujdJUhelUDIG0rJtSiRj5zmgofTPp/SPYfXkVOIpp5256tzThjFhe5cYT4dbiA
	 ABF5rI7j0X2KKxgedE5CPZqn0KbAUzTMXM6/Cj062ZgB3LH2LDYwBCzbwErhcPXSP
	 anBKuW6VNg9L0/WO6A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2Phc-1szLEr3wLe-001VZe; Thu, 10
 Oct 2024 08:33:48 +0200
Message-ID: <89844cfc-f349-4515-a683-572c09c4143a@web.de>
Date: Thu, 10 Oct 2024 08:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Drew Fustini <drew@pdp7.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] pinctrl: th1520: Use common error handling code in
 th1520_pinctrl_dt_node_to_map()
X-Provags-ID: V03:K1:HQ3BmE4H7byNJFSJkDiLtddpR/WLhnzeHaqc10HnvkaLhIYcKbt
 PanD5avtKht7V5P+L4T0o5BgKdtS9h/UY1i5qKLeOviAjeEFVnHVa+JsMqx730y4+KN836c
 fKxtvv221YlGZ9DlHTlZs5/GMfdxd71INGdnzuft+mqRc/JYLRxzcbwVZ+bCpTbG+mjdZ8r
 f64HhqLxit/i4H0zqkVkg==
UI-OutboundReport: notjunk:1;M01:P0:+ttVb/jb5AI=;Wd/VkN8iGadL+vAUjxOjIlAciuD
 pyXE69ogDJSKGwJPDM0J6nd2zWXVyKrws0ilG2rhqWXUPMv5cRQCuzro2Mc6/9e6X8YqPPmyQ
 f2hYGO6LxVlmPojplG66BS3QRZapoTmraluDKv5YjjQIh5Qsrug9e01Ckskcl6+ScHSsNL9+d
 hQXjkJswt9iZnl8v2k+NSSrS831WGUxQ7EvjdkT0sXJKPBG70aC94SxOPCGM4nOzq+FUSMpv/
 ni2oSqlgXCBxnLc4z8ikvUsQQlD/D1QVOAWUiQ2IZyFwmalXRrizgHKmPOWtaBDtFM5XvglIh
 b+KRN1azZCmYEavMI3MObikm2yP/Y0yPDAyjgf7VwG6i/I4TGW82vyNgkj7HCj0dUSK88Sx43
 mWpuLLGbGmV4NBWFEmgNdxbTnJP38c3NU9bFTWH6+WNZGtn95JFX/vodVckM8C6i5QRoeKtWp
 lnPdvNTqL9VRhTKwZY4+5JaG/JvjmVUfN4sPQv4yAmg8Ymenf7WzvvRMG6fdcgvg7WABWlfyp
 XJ0y9B9J9tcByuzCO//HiRB1TYg5Cy76Evqe1YhUicplz75zcyMlSzb3hH/IBYCpQrYYkzXlj
 ANLXjA2cb0N5y1YUB/7OORDPTUiYnXmN8Y2k5f0LOjSupMhNfG1exjnHZk4VQnBT/P0EX/AQX
 YeCJLmD3qYdb6LG3xCk1UgBz806QEe4c6aEg4g27Gmbsj3bGfQv8edqIAOesiN4vkxXNYmOSi
 SonEpufsE2w31dS6y2EtuOuTHplNcNFpt2B4Fv919LgwJm2PbLWjhuyaDuCaNbt1nY0IHdwWN
 WvyuOLORsTlBn1ijy3gT7qrg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_233359_083009_CFB86680 
X-CRM114-Status: UNSURE (   7.95  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Oct 2024 08:22:14 +0200

Add jump targets so that a bit of exception handling can be better reused
at the end of this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-th1520.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index c8d2ee6defa7..8556dd6b881e 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -464,23 +464,18 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 			if (!muxtype) {
 				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
 					np, child, funcname);
-				ret = -EINVAL;
-				goto free_configs;
+				goto e_inval;
 			}

 			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
 						  np, child);
-			if (!funcname) {
-				ret = -ENOMEM;
-				goto free_configs;
-			}
+			if (!funcname)
+				goto e_nomem;

 			npins = of_property_count_strings(child, "pins");
 			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
-			if (!pgnames) {
-				ret = -ENOMEM;
-				goto free_configs;
-			}
+			if (!pgnames)
+				goto e_nomem;
 		} else {
 			funcname = NULL;
 		}
@@ -497,8 +492,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				nmaps = rollback;
 				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
 					np, child, pinname);
-				ret = -EINVAL;
-				goto free_configs;
+				goto e_inval;
 			}

 			if (nconfigs) {
@@ -531,6 +525,12 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = nmaps;
 	return 0;

+e_nomem:
+	ret = -ENOMEM;
+	goto free_configs;
+
+e_inval:
+	ret = -EINVAL;
 free_configs:
 	kfree(configs);
 free_map:
--
2.46.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
