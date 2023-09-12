Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960A8CA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kq4i1vUdHxCQZq2IyHLc5fQhScomOLITTl/ot+YKs+M=; b=0b5A0aJ4aW/AfY
	Rb7fupjO6AQdjnAEmGVRUgiBQv0jf/b0tCVuAbqPxR1zb3jJchV/em1j4+lay+k2k170YpkqAGuez
	Yh8zXnKGO6qKnWByOCODPbT810dx67DD8G4vkLzSQCzk4Cj07urNTO48FiFQS+SDpGq3f/x0476VD
	h+3t2TZ8962hA4DRGESrREzTAciW5a7u3HVMAQH9no5RNRLVwHNUixiy211X/xOZB+RlkA3GTdDSF
	2daORHCqVlcYOFLXbjnjLU7aQc/7+Tq7QpJ0JdHApRcR7CYY/bJJMneDasGaGxQWzNw+gfleo4HSm
	7NpYHxU0QwCFYh5rvnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxup-002PiZ-1i;
	Tue, 12 Sep 2023 07:34:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxun-002Phs-2E
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:34:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C71BA615C9;
	Tue, 12 Sep 2023 07:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DE0C433C8;
	Tue, 12 Sep 2023 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694504068;
	bh=xC6q3HYiwW9CEGzJvj/sjpQyCTVoGfRxTt9DU15lsZM=;
	h=From:To:Cc:Subject:Date:From;
	b=B36S8DTT292C3Y/z3w0PZdqkISNsor2tvJRyDzHkyvoejCDbdPUO+eAs2CVWuy3Ni
	 HkDmMaRwCxbfPegnuc7asX99szOYHD/gq/kH9BcwqE5POyG1S0U+QCp4bvbC61Dleg
	 zzdvafPvBPod5m5Yqgdb6ZRgtEr8ySKIhNnbIQYjceYnfIZWQueqxgs0Gc4oqFIjgn
	 IQkacC0hQf0mCsutjBAROzg2nv9GRxjqgCyNTo2AUK+CFzV7H2L13Yvbzq4oI8flJE
	 I8VnE/BeSrM3RcnwLyOuUh0E9ecDT66E71MzgOqRFIwkBKxBxAiA/4tS5LD1mwXfXT
	 yWSKvvGQhV6Lg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Date: Tue, 12 Sep 2023 15:22:32 +0800
Message-Id: <20230912072232.2455-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_003429_817936_9B3D0014 
X-CRM114-Status: UNSURE (   7.99  )
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

riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
dma coherent, so set dma-noncoherent to reflect this fact.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Tested-by: Drew Fustini <dfustini@baylibre.com>
---

Since v1:
 - rebase on v6.6-rc1
 - collect Tested-by tag

 arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ce708183b6f6..ff364709a6df 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -139,6 +139,7 @@ soc {
 		interrupt-parent = <&plic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		dma-noncoherent;
 		ranges;
 
 		plic: interrupt-controller@ffd8000000 {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
