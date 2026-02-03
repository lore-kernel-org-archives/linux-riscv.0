Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F5E8B363
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrV0DaBBb5rQI15zrlmP9RBv8Ha0ayq6+oanymts+tk=; b=H10vvf1T1IQdjj
	4cPQ7MzJj0KA8i+tUR/gRr5JtMvOZU6oFZo+fatiaJCXlfZ/oqnnEAL10/koy865cIjB+y6lj/4+m
	GmMrhbzUeiv8wLHJgTTh+B6pmhzAdaZ2LcAbcB/DTamyGcwEOaM9WclMmuUEiGK/0oYQvzjy8FKXz
	twxqY9vvyFPnK9nW19QC/4fBb2cuvy7VU2m0qggXI93CZQzVL0BlJniF5ATz6FlSkWKcP01vnEyPZ
	FregkqRGogBmAGjSwHxBni9mS8yR+x7gB63ReFRGMQzCnP5QRgLEAM5gPHiolZKEuDSsuQz/S7pUV
	+U8jyw8F3Gzti86BD1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNaq-00000007ME8-0sNd;
	Tue, 03 Feb 2026 21:05:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNan-00000007MDp-2cuS
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 21:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5C0A443BF;
	Tue,  3 Feb 2026 21:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC44DC116D0;
	Tue,  3 Feb 2026 21:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770152748;
	bh=xmUCOlm9OwpsAmbF5bHmt3N6r/h7CrR/K5NFN6KlqJA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TbCm1lV+nPWD8krh1LhcMBRcoMjzI3XVqcUDOJt+dnEZ9xFjDyULnGrzPNKSG1zu9
	 mCF+y/8n7w/tnHJJN2A5Wu8theLALwXKildzk65T7Z8WVJIizfcOiST9uUf3UNbcVv
	 e3mW7rUDlSND+YpT3n6DvpRouFxIuXpHlmfm4qdB/71y+CNYTC9JHNzCvkEsIDUKRU
	 57WoHSM24opI6A4ZWuW8vaTFdSlBgjhRZ1a7j4hnt78ZceeAH9PxeiHRflx1SbADsU
	 120pAeT3zKMTLTjCZotSsb2A2UHx1FysU18iCY3kZad3baeSfGdXlJ2XoQweX74nEb
	 1uVp8SGH/fTpg==
From: Thomas Gleixner <tglx@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Yingjun Ni <yingjun.ni@riscv-computing.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Marc
 Zyngier <maz@kernel.org>
Subject: [PATCH] irqchip/msi-lib: Refuse initialization when
 irq_write_msi_msg() is missing
In-Reply-To: <87ldh93cn1.ffs@tglx>
References: <20260203080256.9401-2-yingjun.ni@riscv-computing.com>
 <87ecn23q6e.ffs@tglx>
 <CAAhSdy31dF1qHtaM1mqx+dG6ryb_3M+M63e8ujaCZBWDGUYeNg@mail.gmail.com>
 <87ldh93cn1.ffs@tglx>
Date: Tue, 03 Feb 2026 22:05:44 +0100
Message-ID: <87a4xp35cn.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_130549_685779_C1C51AA0 
X-CRM114-Status: UNSURE (   6.90  )
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

MSI parent domains rely on the fact that the top level device domain
provides a irq_write_msi_msg() callback.

Check for that and if missing warn and refuse to initialize the device domain.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 drivers/irqchip/irq-msi-lib.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -48,6 +48,9 @@ bool msi_lib_init_dev_msi_info(struct de
 		return false;
 	}
 
+	if (WARN_ON_ONCE(!chip->irq_write_msi_msg))
+		return false;
+
 	required_flags = pops->required_flags;
 
 	/* Is the target domain bus token supported? */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
