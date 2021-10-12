Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FCFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:35:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93BC560F3A
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93BC560F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9z7UDy3LYt7OOzzmvaKu11J4CSUkE4sOkg7wA5DIZXk=; b=s7lJPFVSYjPLNr
	yMzDpB5CX0Ga+qj6oyCQqp0dQVJC97zp79c1KQSzFxuue14F08oZ3H/Ai8WriK6LiAfQyIW8o8HVb
	KssMLKgyns5ZAy8Yx8WjaZ04SeoadMJkMOYwzxoflSucoN6uMxKA9NvwwpSGrExXgwivUSApseolT
	QrlWhpM/f4V122Nlc8n94GZ7s4XdHP0k61VsUIG2bRMVv4npaZHy7Q3yVLE1GiNC8jrEczB2vvtGi
	fcJF0KfwjL107uutU5Gjsj+aSXq/I3uZmXVj+Vhiv+kdVwAooG7E96OIKgczcATfVHSSuHg6nA/sj
	cN2RfwL7pfAHb09pvG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJnh-00DLrx-Kt; Tue, 12 Oct 2021 15:34:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJnf-00DLr7-FK
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 15:34:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D42FD6103D;
 Tue, 12 Oct 2021 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634052882;
 bh=0P5VyqUgzjD9h+Pv4V64yy8+3aAAXuj4+n7+F5VEBf8=;
 h=From:To:Cc:Subject:Date:From;
 b=QKB9Fe1YNuoXEynoPNmfsCG807LtmLa++Hbsad9rfJfeBtH3p6Pws8Fip0iT4Pp6m
 P3JF8kvvqVeXCv3LOfa+YSpeGCktfVijo83GlZ8Oe+tyrqlhmupYB5Q3VgBF5fygUb
 pAbBVxEKDGvmz+4y3glwjrMmIklZflxIsXO6LwOeFZARREAMdaLHOMM6VkD5A+stFt
 3N0JIzB3Eis2eVJaQfRBErD/kE+ndI2dG/N9hu5GXBhbHYAo36R/GQXbN5MuuRPx7v
 s1sgIc3JNH02Mqe+F/TOEpwhHwbPWFs247jsZhAmLQnm6zb5RS9cUJPHFWOCO2Shvo
 ETzLWBVPptiNQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH V2 1/2] dt-bindings: update riscv plic compatible string
Date: Tue, 12 Oct 2021 23:34:31 +0800
Message-Id: <20211012153432.2817285-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_083443_547714_9918818B 
X-CRM114-Status: UNSURE (   5.50  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add the compatible string "thead,c9xx-plic" to the riscv plic
bindings to support SOCs with thead,c9xx processor cores.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 08d5a57ce00f..202eb7666f9b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -46,6 +46,7 @@ properties:
       - enum:
           - sifive,fu540-c000-plic
           - canaan,k210-plic
+          - thead,c9xx-plic
       - const: sifive,plic-1.0.0
 
   reg:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
