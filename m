Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B438EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 13:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8195E60E8B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 13:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8195E60E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFt2dYCFDsxzo167RchaAPlil/aas6iGqWmxbX6KEqM=; b=lLXX2cIVRBPCqS
	5MiCEnEVqtvaHLuDFz7nCmJxYXmpRrSOEQYy8xX7k+nbfPMJs5bl9qXqOTM13LW8B2Az9fyjo3CJn
	LETcFRoZ+RQj/7A6Wq5ALV1lfEoqmK2L6Thbh/Q/GmjvlVKObxGvChudaR14+Cn3IMAv4tWZDerkS
	/Z/IwcmsCJOIeb31/2IsiSRfOrylhRVd3iu2IwxOi5gZi4zfoLirQHgLp6cpNHw25saNg634K8+9Y
	zLGS/v5RAMC43t2bdSKwQ+/rViSIUn2CIG7iia2Fxew2Cr7XAX2/AoDtlCOz1ediyOf8UBIW6nDgl
	5An0tfihOvz5N+8d8U9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvIZ-009Vn4-TX; Mon, 11 Oct 2021 13:24:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZvIX-009VmI-RB
 for linux-riscv@lists.infradead.org; Mon, 11 Oct 2021 13:24:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F9E460F35;
 Mon, 11 Oct 2021 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633958697;
 bh=LEZbhktiDsSW+AwzStPDh+VwFomRdqomqsmfTAm2/aY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y8cUKprreXse2sf+Od1xtI2PwfWHJEK1o0LhxjXvuXjvtKARsNBuXxxJzowHNZh9I
 2AKJ1iEMrNNbky/N5gmhCqdWeesxYR4OzP2LMF7JSTYPVy2oqSjx92arAgil2QBZTX
 b+4UFaSi207sdMjcsVAvxcTZOEv4/QLC8kM/+T0oJqjPr14yCryQgQpx8e0JpHS+oc
 QjW5U2Tnrd9MOwGz4/8RvcpncnjpOEmGsBwVDR/K4CrfiuwhhVHCJGuWhsslCEI6dY
 t0zaEzkhF5lHCU3PUpJ4DFtHfwxb+oBeQnYk1xb+BYfDBY1xkFDxDRY26EvwLPjb21
 jHM2gP0IQZRgw==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH 2/2] dt-bindings: update riscv plic claim-mask-support property
Date: Mon, 11 Oct 2021 21:24:31 +0800
Message-Id: <20211011132431.2792797-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011132431.2792797-1-guoren@kernel.org>
References: <20211011132431.2792797-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_062457_917559_EED22091 
X-CRM114-Status: UNSURE (   6.44  )
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

Add claim-mask-support to control riscv,plic don't call
unnecessary mask/unmask operations.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 08d5a57ce00f..f32c1792604c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -71,6 +71,8 @@ properties:
     description:
       Specifies how many external interrupts are supported by this controller.
 
+  claim-mask-support: true
+
 required:
   - compatible
   - '#address-cells'
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
