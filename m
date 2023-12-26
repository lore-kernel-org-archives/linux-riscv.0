Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6527C46CD3
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NXn/K41lXben1Mp4SFrQGT4hrJ6u27tndubVhZ+Z/NU=; b=xMKRfsBIAxOvW6
	/N6OG2J3XVF2KjUPco8s2Pzy+dy3L+sUUkRUgBur5G5lobpt978GM30rF+gn9+GRgEyqOXu82/xat
	swWETRVglBgDdONc5VF847vm71Xx3Di3g9jHWiXPG7WTeDmyRUJdEO2xzyo4FF/SydNClKhv5PsN9
	XwDLToxeKLsl31r7fb6yq1jymHQPd0Ibi8hN4enzgc4nJ95kxmlFTwiqyUNpKXVzZ410scglsbtqt
	6yaotpKFEZqHDIaGmNdJMPm/Wdk9iesA6ko+20Wj6Sad5WtuEqBxqN/yPqaqbOJEUB68nn+ntzm/u
	SzaFJF+ZgEcKDbVu0Qrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIEGK-00DX4Q-2V;
	Tue, 26 Dec 2023 20:42:52 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIEGH-00DX3z-1y
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 20:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703623343; x=1704228143; i=markus.elfring@web.de;
	bh=T6cDnr5hFtFbP2etPVzAZk5zoBQrCmisolCMkj0IYRQ=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=wSZwN0u9XxH3EuhHZr1KPy3ie4ZT3Qn0DIysbF/Sa9XZGwNtKE1rs3T3+MG6NzuK
	 N2Al1s1JXw04IVBYIhznOBCZyCl21qKgRzbT6vc0EEftw8kFHSo3JfZ6y/fFgcJQz
	 Jk0TxvJvgVgWmAx9+fS+dId4OuA/GowQE+FJKUgZU46Rjt7dA8sVLMBw6QNCuyKz/
	 wf3lSwD3ws2wrdxHcPPGsC3kmOt8ii1TXKVA3hrpXMO0xM5hVVbfqOcVwMMfkZaY+
	 NFz/Meask2Zjv22UKBytb9JBNOvlTatOTLtxb7ZbMQzZqGwFtcm6cMb/t/tyL/Va5
	 u1AFXvk6qyDj1wic/A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjPPs-1qpAkn1qvK-00kp31; Tue, 26
 Dec 2023 21:42:23 +0100
Message-ID: <71aebecb-ab59-4835-9320-10e849c04a5c@web.de>
Date: Tue, 26 Dec 2023 21:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] irqchip/sifive-plic: One function call less in __plic_init()
 after error detection
X-Provags-ID: V03:K1:PL5C36CURHSbdroEInCd+9jbMmVEKNPmO+AYoHaevTf15uMeyKZ
 pFuMaYZ1hpPtHyJWRqw7Vpd3q78MRXTrhGpFM23XLG6kHqPYd28ngv/y4hXj6yL6C1cKnV9
 Kg02EGUbMSdde9WK314m5C/vKNDR1/g+k6d4cgl8z4MPAN9EFiifXupWBYWn+NIykPuuSDD
 6tx9OomGmnXlsEZ+MhWug==
UI-OutboundReport: notjunk:1;M01:P0:zp7bCe/dVQE=;Kkt8nPqdlTEUtkFKrL/qlAx2nv1
 37s4PQyHu3QGIQuaKUwPVN3YAK9tktu9wHjxGsiLjm3A3F+KbTkjXZ4GtyyLg2nl4bvOY/fLc
 CH1o8NMtikYMHkTjlh19DYB8VKH697WMO0zR2eh7qmAqikVFRrEjpX/7HfgcjL3zHLaQMic5Q
 ZIL4I9ZMJj7jV+omwPi1WtcpOLTvUXs7MwISG27j/u5Y6LNR8BHz1FINNV0ZglKq14BepGsMj
 p9gSv7zvog/1/FhnzR4DHzsqKd2dPaG3FiFeCBegh9Jmn4wejiceFYb+JloFq3RIXFZr5CT5I
 jrpHqFIaIeui1Bb5e4Umf3VAU8oXoY9zohAhBlTqyyEXVQUFpJ8m1tKG3dYa18IKhFbUFZJ3C
 y3ALcxHf+q+r3/90UJ/3UaubUwDokOm7xUehk8GHsrF5QKzUy8cvEbAH51a7Zd1UUIOY7ERuU
 +COfiPrIeiuPdR4sWAF34WP+CkASRfdY973K7iemppyW724cuLeGcWfpkBHep6t7rsKFqQ72W
 IcoAWflcJudax6UOKi0ZGWXNACZjFShr4jH84lGN0gy+6piuxjMfSS7R+najnobBr0ykLxc9H
 Oohz2c3xQypnJ9M6ssVpKk/z2zvi18l23A+UDEQccIdlI+OBdpWHzE7TgIwfv9hPPt7uRft9E
 2TDxLyVDIkvsXSq7HGLoRz/GoX1JwwsWXIrRU8CBCN9Ckz2r42/kBgC5n9XMHv87yhiZSO7W9
 boPyQ8D9XUtsi2Ry2edktzor3eevFGcdaOQAanvRlt3dZOEmxakquOECf/omKLvVlYgImqH0a
 vc/sxzE2+Q35JzulTFtL7IXHGhT01yqr1EoqONMauNO7z+nbpYNHw+PZh6+71sUqrc/4y2EJ+
 WViGnkKWh3swDh947xq+P3e7hcJvlqr0kCShBp/Fx86rdBcKyQ/tOfjjRdjDyIKjBGZGEvGOG
 vpvTzQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_124250_124937_23578625 
X-CRM114-Status: UNSURE (   8.58  )
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
Date: Tue, 26 Dec 2023 21:34:47 +0100

The kfree() function was called in one case by the
__plic_init() function during error handling
even if the passed data structure member contained a null pointer.
This issue was detected by using the Coccinelle software.

Thus use an other label.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-sifive-plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b7bc4fd9517..e9e3ee2d6440 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -437,7 +437,7 @@ static int __init __plic_init(struct device_node *node,

 	priv->prio_save = bitmap_alloc(nr_irqs, GFP_KERNEL);
 	if (!priv->prio_save)
-		goto out_free_priority_reg;
+		goto out_iounmap;

 	nr_contexts = of_irq_count(node);
 	if (WARN_ON(!nr_contexts))
--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
