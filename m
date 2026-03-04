Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68442EDEC02
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 03:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBKARwV2J4suAGfbWI7ek960GYMEoKwz6wAuPI/3kpo=; b=pFEBFkBkHIZSBw
	3C/+If/7GttB9jqrhiyuT5ZEvNi5Zc+t+b3qZ3Cm7/xXYySnMARrvrQM6UUixZPLwRrpxuLsweKeI
	JQICcpmBzbRELFYGYTGwtgrtHJvxjB90lihzSIlC8DKU6Hnxrr3KH6PCkwE97GryG0s+e8OvtFUzY
	0XbHDDCWzxqUmlD7CwLHMHemUDiWa5NRcYEvsZ6pqPSGdpYfsmLPGytwdLHHw/ON61XFXNzXXGSQs
	HSCt/oeG4ehqhtXZtRfHd4Pb25OtzJ0RZwu5WUZ9fZYgMuTN4/b9vUKhwP3STd69LqeFl1T3Xg6ef
	ajb7QwF/1OIQHUHmOvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd06-0000000GNUz-2iPA;
	Wed, 04 Mar 2026 03:34:18 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd03-0000000GNTA-0brF
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 03:34:16 +0000
Received: from hwang4-g16.bbrouter (unknown [120.238.218.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0770940A2C;
	Wed,  4 Mar 2026 03:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1772595253;
	bh=3hYJ769jNiLJlUs/NauA8Lic2EA4k2zrtP6rZn3eFFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=LTzL7Oq6KgF8FhwVwscRWKIq/sj2ZrteBXF+GLDNjfoYe16prxo+UedzhP7e8jcSd
	 Tw0a2TMA8n1jKZwQFfHlUbcdhxVHkuVN3Ssy8uDFwcXXBr9hVVlM75tkNPptmePDNE
	 QBBB39mOwgFjHcI3PlNWTtPKt2gWhF+bPA26kmtSbB4MMgCaOSjTK5NU1OawicCVem
	 t0ZRRs5FoxgmEtIisjNliIFggr3zhhPdnVb6jtQLOciOwlYNrtV1R2cvSHoOKT9rN/
	 go/Rrh7aKFAJgj5ORm1ylvexfEyJJSmv6mn1cItc+0T+omd3OkXeqcoD+UaFBdnJtQ
	 OlBgm3va8vYB1ky4nDj/qci/TTuwh/SmWYVwIAluMFlyNqML1bfVYsUYPsjCGmEux/
	 9w0ND5CJqkwUBg8ZUdRkj/Jr3bgeFxbxGF8n+40w2D9linzZ/Zl317MVUPmok/7mUJ
	 CDIH8WpUSie4s9kPJceWp1G2ZmLa1spVTr/dAxR+au5EljmxO35IQN/nmwCKUuc9IR
	 pCjaumKKe4441nrHeTmoIy2euAJapYNB1jSMLmMt4spmm4OfKH7MbupaKx2tvPifIp
	 2PpafkQstALH/Ek6BStqgUldhVeFKjokng69UKzqXQ+CYZTyxfKa/SI307LBS7nJOo
	 djvgwOvd6WmaKlG8P/NNevQc=
From: Hui Wang <hui.wang@canonical.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	danil.skrebenkov@cloudbear.ru,
	ajones@ventanamicro.com
Cc: hui.wang@canonical.com
Subject: [PATCH 2/2] riscv: remove redundant #ifdef check in cpu-hotplug
Date: Wed,  4 Mar 2026 11:34:03 +0800
Message-ID: <20260304033403.238012-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304033403.238012-1-hui.wang@canonical.com>
References: <20260304033403.238012-1-hui.wang@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_193415_307349_8BB925B8 
X-CRM114-Status: GOOD (  11.14  )
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

The cpu-hotplug.c only is built when CONFIG_HOTPLUG_CPU is defined,
it is not needed to check HOTPLUG_CPU in this file.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 arch/riscv/kernel/cpu-hotplug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index 3f50d3dd76c6..e07564638b41 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -43,7 +43,6 @@ int __cpu_disable(void)
 	return 0;
 }
 
-#ifdef CONFIG_HOTPLUG_CPU
 /*
  * Called on the thread which is asking for a CPU to be shutdown, if the
  * CPU reported dead to the hotplug core.
@@ -75,4 +74,4 @@ void __noreturn arch_cpu_idle_dead(void)
 	/* It should never reach here */
 	BUG();
 }
-#endif
+
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
