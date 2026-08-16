Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D164BC5DF6A
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 07:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PvuauLT5tZj7T7vGMTHdfMDa8ehROUDtxnIk9/ytLfI=; b=P9zkxlTk2DDSpx
	QGqZhOZU10ZjZFEr13T7UHbPamil6hH8Vg2V2FarwvhhOlcWB9QTUO1CbDL/wUVCxERqMQQpjARnv
	cJpmEhlGHU2lGKYcra8OMAihE6VNLYsl5BcTluMlTFfF4w00EU4k9KeSOxpIA2HeIEGPmHq8MUBdE
	qMYNmfe6hh6ZkXFDfKgfWpk/uUj/R0E2ai5Hc6ipBRol7TLk/bONG4LAZat2kuFjmLB3T5+zR77CC
	tx15YMwLrB66Wb6hT2+Vsl2CoyI9UVdwUyAXqaZvUkZcuNJtZekSWt9jVfzXduwxXW6qsUg8bIcBG
	Uc+YNwDXMBzFTXo2pdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvVUz-00000004ZF2-2jns;
	Sun, 16 Aug 2026 07:41:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvVUy-00000004ZEw-1fw5
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 07:41:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 661D26001A;
	Sun, 16 Aug 2026 07:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3361F000E9;
	Sun, 16 Aug 2026 07:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786866099;
	bh=Mga7YU8olL03rKcmeXwf1ZVpiLVR3P7uFAukeYH2nEk=;
	h=From:To:Cc:Subject:Date;
	b=bNdO0ZGS0NB+KiJgyB8kBORkitZ40RFSin9smRe2M47kyLoAAKGwAUvdwjoq5YeLm
	 qfovbYfmIz4aR43xPXaGFHUh5dU7AK+Sbg7WI1PfFH+vXwXSrfAUPc1NbWiFISGzin
	 Da2m6B6Rt6mHb/HCw5istgPFOfObDzdjZzdtM5SF6r5oK9JM8ogE9i0cf3ypwIcis4
	 iDSohKpYL/l5HNoyRq2xKgsP7hWRAo7at5BTNgJH6UAhMp7bdplpXvM9MPN+LlOreO
	 DHEc4vZZRB+SVGmdUb8La8+QfQqffrPm1oiXmiTmMDU0cK0wePgT9JBqtt58smQbAt
	 mOG7LRpXjhhYw==
From: Guo Ren <guoren@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: dlan@kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	"GUO Ren (XuanTie)" <guoren@kernel.org>,
	stable@vger.kernel.org,
	Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH] riscv: dts: spacemit: k3: fix IMSIC guest parameters
Date: Sun, 16 Aug 2026 07:41:25 +0000
Message-ID: <20260816074125.2105828-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

The initial K3 device tree used generic/placeholder values for the
IMSIC guest configuration:

  riscv,guest-index-bits = <6>;
  riscv,num-guest-ids    = <511>;

According to the SpacemiT K3 User Manual [1] these values are
incorrect for the X100 cores:

 - Hypervisor Extension: RVH 1.0, GEILEN = 8
 - Advanced Interrupt Architecture (AIA):
    - M-mode MSI: 512
    - S-mode MSI: 512
    - VS-mode MSI: 64

Therefore:

- S-mode IMSIC (simsic) only needs guest-index-bits = 3 (to cover
  GEILEN = 8) and num-guest-ids = 63.
- M-mode IMSIC (mimsic) does not implement guest interrupt files at
  all, so the guest-related properties must be omitted.

Although the KVM AIA driver will re-detect the actual number of guest
interrupt files via hgeie and correct guest-index-bits at runtime, the
device tree should still describe the correct hardware parameters.

Update the device tree to match the silicon.

[1] https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/08_cpu.md

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Cc: stable@vger.kernel.org
Cc: Guodong Xu <docular.xu@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..4120eb0c4083 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1127,9 +1127,9 @@ simsic: interrupt-controller@e0400000 {
 					      <&cpu4_intc 9>, <&cpu5_intc 9>,
 					      <&cpu6_intc 9>, <&cpu7_intc 9>;
 			msi-controller;
-			riscv,guest-index-bits = <6>;
+			riscv,guest-index-bits = <3>;
 			riscv,hart-index-bits = <4>;
-			riscv,num-guest-ids = <511>;
+			riscv,num-guest-ids = <63>;
 			riscv,num-ids = <511>;
 		};
 
@@ -1168,9 +1168,7 @@ mimsic: interrupt-controller@f1000000 {
 					      <&cpu4_intc 11>, <&cpu5_intc 11>,
 					      <&cpu6_intc 11>, <&cpu7_intc 11>;
 			msi-controller;
-			riscv,guest-index-bits = <6>;
 			riscv,hart-index-bits = <4>;
-			riscv,num-guest-ids = <511>;
 			riscv,num-ids = <511>;
 			status = "reserved";
 		};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
