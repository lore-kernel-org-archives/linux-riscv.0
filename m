Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038F8C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 05:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7TQEQ3A10Hi2EMoBBdGRoZUTWs80aYDrdC3RA4Q4Sg=; b=cIpeAleXDuQqUk
	QmKHiDLp+phcs7wLnoAbwsiLMxaqJjgn4pYeQyphlSi2tFM9xMeWOWIGRdrTJFwJqnvBtHa4N16y7
	saSlHknQSj1F1Wl4oMJYewvaQLtbwEd87N4GdUd9XlRmOiKHvyZw1d3tzY3h9cWoUyo84yJFcgS2k
	Co0AhF0GoK3HaGVyUR4irbc/ZejGjFGxYUmLR4WlOAc+YCtriCDkCQmoXtZHWQNEreXAk4zfufjhL
	qanHqrjbmN+c16Tv2wJr4ov+NI3lC0k+4OJkG3mRYoToOkxBEsr95+zFnu7TQVTXb8smzqidksJaX
	KYmEVTMlNHHsEa1oHbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5hDg-00FjR9-AE; Mon, 27 Jun 2022 05:23:32 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5h3W-00FcXY-R2
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 05:13:04 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 2CD7A5C00E5;
	Mon, 27 Jun 2022 01:13:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 27 Jun 2022 01:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1656306782; x=1656393182; bh=90
	4GOKdujIzG+lXqqN6R8S+IQA88lTLYQXPZ4MZDHfo=; b=gU6c+UQZzR1bHbD0Y0
	Y1X5WqhqLKS2qzLBp6VZODkeZTrum83ll8H11JMZ3hPJdIlMIzviMLlvreyxm39G
	zmxRkOjWWX39Nov4ktAzMPh9SjtFNnLpZ9+5xrMeZ3k67mmUHUuChpCQeK/rGi51
	E1BdZKd8zhnufI/psv9K3IIDMlGkMZbKTKHxwYDodzik0xc2ZpwlTtUNVYl6tqGV
	/+1UCT+31x1SbGGI+KApCZFrFGyKegDem+YT5OvrOgI3zY9WMS1uR2UCZd4OU6q7
	cvQis7mIeu5Y7uCZisuWXc0fQAte/LdGtFhSYYKNqxt0brOkfOyiqr3ZpULTg4VI
	pWxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656306782; x=1656393182; bh=904GOKdujIzG+
	lXqqN6R8S+IQA88lTLYQXPZ4MZDHfo=; b=O74T68806yX33KKUD/DLjemFcyheQ
	WOrRA8Sit4G5xnWAJRPum7J+ml7yChGFvIurCkLTbl2QYtFrQGMdKGnzjaZzgsn4
	NTNagGAUUrvBld67vpyIHVRSsrEnoUtiOPsPeE28P7ByB7B7igOjUwL9HAmV0gzR
	qgGyK2IW4bVtRa/UfmqkowomlRWrr5a5idXa3LceRjE4zd4i/dPBtvaJ177nyvEo
	3jg5V6nrQ2DfWhdt4rHT7eNho5ONrUFfYncFk7w0564IIKULY18x1RzBRGzyM5uW
	8T5l56IQyEnasax99fyg8ENHS8GJFduf88PfSAAStZYBPfeIaY/mbU8Hg==
X-ME-Sender: <xms:Xjy5Yoltw-FXt0DH-R2kEfKVYbhK7Soo9SjNXV48VKfnOpwqTsoRCA>
    <xme:Xjy5Yn3V4MQe42mxSK-IY5w6j-aR_T5W2VprUCYNpT7SBkcutvcEuxxZgcRPvqw07
    Q_wwh5zj6mQVsAxog>
X-ME-Received: <xmr:Xjy5YmqMJQC2IP20fnFOip5aZhPYw2cukIxxtqeSt5vG935vuqdjuTXYdW0tBfsvuRXVnuDpsBRs1zf2629ETQhVNOob5e_6seFAiFWgcEuFUoxi_QeKVNiEzeCCoacVM45AMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeeuueeuheelgeeuhfeutdelieffveetieeftdfgfeeiteekudet
    leeuueeljeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:Xjy5Yklxv27gvgfwA7WD7BRyD-VmIzUi5HMSeH5Dm5NMiE0biwH2tg>
    <xmx:Xjy5Ym2W2iCtxaqw56kDoyrTJVW5LIf_DJZiGcZRrJ3MqeAVMHdmvg>
    <xmx:Xjy5YruWmhNobyFC-dFqgSXjTkBta6LpVXVtmA6ckock1VTAs_G_Ow>
    <xmx:Xjy5YvEJSeweprKFGGyK9PS1-PTHhmPYoNKQe3jrDFSyev5p17NdCA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 01:13:01 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/3] irqchip/sifive-plic: Name the chip more generically
Date: Mon, 27 Jun 2022 00:12:56 -0500
Message-Id: <20220627051257.38543-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220627051257.38543-1-samuel@sholland.org>
References: <20220627051257.38543-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_221303_006208_7EB31F74 
X-CRM114-Status: GOOD (  12.21  )
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

The interface for SiFive's PLIC was adopted and clarified by RISC-V as
the standard PLIC interface. Now that several PLIC implementations by
different vendors share this same interface, it is somewhat misleading
to report "SiFive PLIC" to userspace, when no SiFive hardware may be
present. This is especially the case when some implementations are
subtly incompatible with the binding and behavior of the SiFive PLIC,
yet are similar enough to share a driver.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/irqchip/irq-sifive-plic.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bb87e4c3b88e..90515865af08 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -28,6 +28,11 @@
  * The largest number supported by devices marked as 'sifive,plic-1.0.0', is
  * 1024, of which device 0 is defined as non-existent by the RISC-V Privileged
  * Spec.
+ *
+ * The PLIC behavior and memory map is futher formalized as an official RISC-V
+ * specification:
+ *
+ *     https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
  */
 
 #define MAX_DEVICES			1024
@@ -177,12 +182,12 @@ static void plic_irq_eoi(struct irq_data *d)
 }
 
 static struct irq_chip plic_chip = {
-	.name		= "SiFive PLIC",
-	.irq_mask	= plic_irq_mask,
-	.irq_unmask	= plic_irq_unmask,
-	.irq_eoi	= plic_irq_eoi,
+	.name			= "PLIC",
+	.irq_mask		= plic_irq_mask,
+	.irq_unmask		= plic_irq_unmask,
+	.irq_eoi		= plic_irq_eoi,
 #ifdef CONFIG_SMP
-	.irq_set_affinity = plic_set_affinity,
+	.irq_set_affinity	= plic_set_affinity,
 #endif
 };
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
