Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8465C7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 18:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DU0zmBP/vlLLm6AsfCKQDGL3gwY0FeNgz+yBo/bt7TU=; b=kDTXasUPBj+W4E
	EJv2We571X8h0dh7LThbR6gCagl1c+l885TXE5VmJaLEPyQUEZWPZmSNNuLH8KaZpVWnGeDjmn7wo
	xCTTYJFblJTlqd2XfQM0qzDPENAl5ao1DGJrs0icbVBIopVihwwR3Kc8VFB7GxxHAoCVt5Dxbk2U7
	Q1QYmmf4BClxDiWkXk0aW28vuL7D3TZNNvV/ffsGzS2wZikrQapH/iOUIUKVy7m+6yvMBP2G7zjG5
	IZAvMU4+vE20/bPYaKNnYMEqgMNebX2fqVRyScEsv2HHaT2cxi+zGEOEwJP6mpelUtEtYVG2+rZe2
	ag060VdL8PCI88vd+qSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzio9-00Dstd-24;
	Thu, 18 May 2023 18:57:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzio7-00Dssk-0p
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 18:57:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C26F361B56;
	Thu, 18 May 2023 18:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F9BC433A0;
	Thu, 18 May 2023 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684436218;
	bh=KmkRRVkb2zPg16/+5SP/TqktZEzO+CbiEGfvCZls0Vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EDdT7AyS81YPAnffSgoZvef1gPV9a5EzUleOkNdMKnOCnVW6oLa9L+jqaWFy1y6DM
	 UNlmgX+OumKc4rqRDnunVnrjm2OM17/479A7ed75G1/7a1sZ1vFLoXuWSXO+Y+XcEl
	 XpJbGdD2AxW6wM37rBW0ZdW59dydpuNwrglrUXdgk4N02oYas/6fKzdrsPoNnJNc5L
	 YqNDGzEtWzCPv3b16VqmBOwnOTZkg9jVlBY7bl+v22GWuHTcj1vfmNzOmPG6LDv9wN
	 7kOJAfN2ZztrUtISdoGBSD4x8QcMKKkdPxllRGE+tiJGb51EmK3trcDlt/5dHrG8cn
	 XI6D2GSmacMsg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 2/9] dt-bindings: timer: Add T-HEAD TH1520 clint
Date: Fri, 19 May 2023 02:45:34 +0800
Message-Id: <20230518184541.2627-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518184541.2627-1-jszhang@kernel.org>
References: <20230518184541.2627-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_115659_334130_E73E0B78 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: devicetree@vger.kernel.org, Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add compatible string for the T-HEAD TH1520 clint.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 94bef9424df1..388d3385d7eb 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - thead,th1520-clint
           - const: thead,c900-clint
       - items:
           - const: sifive,clint0
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
