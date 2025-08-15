Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EDECA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 05:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJHngwCMcAmwaptp7RDmE4WJhejtTeAqRDpn/MuVoEg=; b=qV3RiFrCB/4Z2P
	Kwj4m5A5q0YEMhOx82fjHfbkFSVCRWeIAHJORdaFolRyvnTAOwd/GIOoS5fI4QOFDgscFnFrafebm
	6izsEWMjSM2ktwTVWUZ8X/9EfmTrWi4zEwNolHiCfoNBUmFwO1+KgyUF2EDuc3A5Af9fi7eLzjKgq
	ntRgPRvoTFfFrp2EZiLIertiFHr+cdBjSy/G/FrczKSQ4zpO7xdBhMuuZy7JJzXat5e454Ud19sRB
	wEojKe1uMd/mpyd/u3IPanX9JTCeKPwaQefwMcLN4iF2XG2/m2aa8lkhOoYVVrEKQnpuZ/33BXb6v
	rhpmxXP8JGSns109tMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummpX-00000001VU9-1SgQ;
	Fri, 15 Aug 2025 05:18:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummpU-00000001VSW-2cyC
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 05:18:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2445827be70so18081695ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 22:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235096; x=1755839896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=my5gFgxgwwpLbVFYwIJaqegTw7Bp5Dofm55CB0gOBhw=;
        b=XQ9RMy4EECNuDfosFoHlZck4jblemLvB5W3yt/gUL4CFHgqsA1Y/1FacQ4T6d/tw2B
         RIV4mLKhy+02zylny7gfj2KSgkQa18EmCJGrtuUxn6tDqP0oZKcLWW22bpxIKlr2+czE
         pNqt0mgFlNTadBr7Mdl6eWtHm83ocLnuXgy1A8ow7zlOAfiDCKF7WRNG3Pk0jwej53GJ
         XHZqUuPIIXsQM3LX/syjH2dOH5daJWatL+c/au3J75F6P7QsvmgmZl6rkbhg/yGbOeQe
         NwEV4KyRH2ZrDbOT/duLD8l0U/IeDz+tpSzD5TWhgscdsweangICTd0AQMJ9iE9ObJx2
         Nd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235096; x=1755839896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=my5gFgxgwwpLbVFYwIJaqegTw7Bp5Dofm55CB0gOBhw=;
        b=hcr47QYOvVCR1ArwaftlNfrUILlCFVHub1Ir3R+FpDicXQgoBhGGqgjfOIHjqohWBO
         tm2aaVkywFdI3Wn6dIgSN2ZvBz0AX9qWWKN+8tPCMfTTbYmv8rdCYRVYgFiCKrYy/ysj
         QuWaYQAtQUHaMFsJx+p4USdncdYkbbWHffcJ8gDwEllzWW8WYVJ4ZasMUltnseMl4mdW
         Nwm9ts2Y9K3wLBjBuLgpzJdCQuLrqIu9ROCyuweM19FApYDBEMTKub41dyeeS/wQpsV0
         slZFbKgtCglj7OZGUf0vl5u9uIRfXeVO+Xkl1vSkkT1Pz17FUEZrbicR68ElaPPqe6m/
         c9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0lxx0HGG2FlcAMLMXlkCFEhb1JNd5F6V2I/MkZi5vFsT6D9L2rb7Reb7o6xa3Z786Yy9O739bNBJJXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp29wSOIn2zGzVyR872fwplai+dPrWgyUaXDKGJc/mAfquIP94
	S+0G+k9E5tfavpAGLnm0/R4xsSI0tKto5ZIbd9BXsKdWggI3f84S/3zs6OxJx0LeXKQ=
X-Gm-Gg: ASbGnctys/mnXEPnpLHX/b0ZntOxY7uHl3Z5u+dYA6ro58aIf1JMDBcxA+VUMdLaWv+
	ZZ8+AJMIZTf5Uq0NTtzDbASuYnT81e+MbD/kJgseytVKOVuKSIcfblG2LKHD6rUrY6GyhpAbZ6V
	K3YAySSmL8zBOJhgIHRkWqlcGT2EUsYoUDumgk94q6jF1yjULNOJQFbHoHpjSTQWv14LcFBOAl6
	wsNFADSOO7mFPOPjkmjhpL/bk+ursZiIxSM4d45JdDojYSEJCWDyMMls/aZw6aLmTPTk2nHJopJ
	Q3Zr4nueTmubO0U4o+uD7YYa/8SGgBE8C1x1i/r5PnXY7Ii4Q+TTOv4uMsJJ1yT7LuyQ1AjL0Wp
	KTOqi0LgZwo/gCxGJyh6EXA==
X-Google-Smtp-Source: AGHT+IFr6XYQRBc9U9ia+TIZTQZJnsxXRoou7idyWaoZ8cv3ZQWmSXl1GoKqBAafVqDyDzPpUkQUKA==
X-Received: by 2002:a17:903:1acc:b0:243:47:f61b with SMTP id d9443c01a7336-2446d8ec74bmr13143265ad.45.1755235095854;
        Thu, 14 Aug 2025 22:18:15 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:18:15 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 13:16:28 +0800
Subject: [PATCH v4 6/8] riscv: dts: spacemit: Add PDMA node for K1 SoC
MIME-Version: 1.0
Message-Id: <20250815-working_dma_0701_v2-v4-6-62145ab6ea30@riscstar.com>
References: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
In-Reply-To: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_221816_671061_8B7718E6 
X-CRM114-Status: GOOD (  11.20  )
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

Add PDMA dma-controller node under dma_bus for SpacemiT K1 SoC.

The PDMA node is marked as disabled by default, allowing board-specific
device trees to enable it as needed.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4:
- rename the node from pdma0 to pdma
- for consistnecy, put the "interrupts" after "clocks" and "resets"
v3:
- adjust pdma0 position, ordering by device address
- update properties according to the newly created schema binding
v2:
- Updated the compatible string.
- Rebased. Part of the changes in v1 is now in this patchset:
   - "riscv: dts: spacemit: Add DMA translation buses for K1"
   - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..861f0fe18083fa158da51bd3be2808609f6233f4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -660,6 +660,17 @@ dma-bus {
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
 
+			pdma: dma-controller@d4000000 {
+				compatible = "spacemit,k1-pdma";
+				reg = <0x0 0xd4000000 0x0 0x4000>;
+				clocks = <&syscon_apmu CLK_DMA>;
+				resets = <&syscon_apmu RESET_DMA>;
+				interrupts = <72>;
+				dma-channels = <16>;
+				#dma-cells= <1>;
+				status = "disabled";
+			};
+
 			uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
