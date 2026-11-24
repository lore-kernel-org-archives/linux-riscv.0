Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB13606A334
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 07:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ixoFbbiM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0rFEmOjA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TvwYj2LTuGLQ5tA9hBJRmwfRN29A1yq9t4vYxPdCOIs=; b=ixoFbbiMHaSTIGPpFPDIVOZc2f
	UQfCMBqHwXELhyh0rAaV7tQOBTUyC3j2AKgAk+9Bq7+B0hNXoQPgJfvd09qExQ3bdobTffZ3IbHgI
	Ef1lXgMDRBHQP0Fe6wWvBOc9AE2w43jUJJ6RCzE6hwGmVH1tELB3iT1njJHtmoLqOnBhFCt0RMZSs
	sSW2nuL43ZaIPkjsSH57jrGFlRJ4Viiyf9dWJQiXIgd+hknDcYxCkQU/sGLLZwN/2C8XBg7ZIXSJb
	9wvnH7dPOZ1ajUiNhlIdZjbL76bSLXpRPsobO3MGUl2dtEAeada6Wq/Ll5ddZFdmW5r+pwYxzlw6T
	eBVzwSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkyX-00000005lUh-49fc;
	Tue, 24 Nov 2026 07:30:01 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkyD-00000005lJb-35t6
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 07:29:59 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso3001567a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 23:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505381; x=1796110181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
        b=0rFEmOjAG/jLivMQgDyuoy5e337QwR+Q9RgF73k7tnZu4jMyXcEwNHINM/Yn/NnkCO
         x4mqBaWChIkzev5tSJGGCUph45wA/C2RQ0/Y1YPpYnlsZdFCzEyVDSYwZAku2fST/+cp
         pNljUOVTl+lzAEeyPrqvmSIbVFD+hXPt3kwfBmvbFlE2HWbW/oY0gA2r4KVS14EoK4ER
         nk1dXbrEj8c25FQMxcNAZefdN5ZhQIgnDlzmyY63Aj9B0FfwXlF04wRTU0f2q7Pu9A9k
         uhyk+l8DxBoDRAChB1/9JwveHqKhGPm8+27IGp2/FqWyPzzL4YwxXG2JfNobW8OjFNNB
         SXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505381; x=1796110181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
        b=gcCkj4RE8803+zV0xGSE3Nt7kEC5D0i04+8mt8ZMjgSkht5W9bTBndX7Fr4oRAIL6S
         LAVzf8+3PX4c0+e00EKWCsqQfj9kO6x7AaU5RAikeg0r1C10YwIyvhi4Sf2PC3ELYnpZ
         E9hsgK+SnJ99ti7T9xT+wYZ2OSffnu+Y1gx68l8SNieiB1aFIZVAGRNBJNSjCa9K7mhb
         nfylJCQP4+P0mFBcKja+dbVwolrVHH3B+kiAE1fYZQMr++lQK+Tigpn5q4v3xY+rd+gc
         mwpS9oMPD4FS4Fb23DR2T7MDajGw0Q9lUNn2RiwW42MX8CjlXbtellQlk8+nfDmcvD89
         e7hg==
X-Forwarded-Encrypted: i=1; AL+hErF7GXPfUc4zv4vnPn2f4yoQAIoMXVNIEEfnRKR06OKAEhs92k7ajVPJfD60bG4MVjLSE1LjiRlFbInGwg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZG9CbhA+J8oIgUGFwh7KwB8eN9QPT6riyFaernKhR6aoebh63
	GinBEEFk+1BDrXnGl/2zr7v5h+dSgxNedDNW8axI+WzvXj22m8r29dzm
X-Gm-Gg: AZFdTZcn57fr5joXr8NIgQ+eP8NrD9UKrhr1r0KoVVFQgQdzNE7076J9OYGQYETgaaa
	tyetITrZ+i+3xPRM4b4ydBZvoYBHsN4cIAWOnSyzYSYuY+yINEYp/QQkZF4iSOd/kZcYJdr8DFG
	+U6pCqgCWu1R0a9WV+6IoWH28pdj/Zki5NWR0WBEhBGGa1e4vtWph39QaMV6nGAvbo+ZbfF+2zL
	3NVt8bZ49YJraeY0oR8c+VjOGTVBn4qzaEd/zliMeCUb9lNUSd2F0odRzLS7akNT8waJ5jYxu0k
	V/Pn9AN41V1+9Ddo/ud4oFikA0rZDBjDUvVo4JFNuOdCkCbQ9/jZHDm09A3ihLkC0I4NNo2wc54
	D1xE7sMgsRZ2gG/P2nQQzzmneyepTk8zg3kG8BaP9MUBjPDlhPF6nCdlWJmwSC4nZfTG9IZTT4Z
	3CvDuu/GwzhyU3OPlVBhKMqHQ+85Rmi8ywd7mRI9EC74ohFFlKuLNFc5pp83S0AXK8XHGTdHW9F
	tykUTRyzD5HAVEVapg3t9m/DceyBx73WhHQD5BA1MjYTMDqqVVpfL5YeK+//ifv0Am2bbh2DqaD
	M6tb3vjpdgwOtG+4htDyZmlFYeU=
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id 98e67ed59e1d1-3b41c955bc5mr12961867a91.39.1795505381135;
        Mon, 23 Nov 2026 23:29:41 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b457a58d04sm8262361a91.0.2026.11.23.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:40 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Date: Tue, 24 Nov 2026 15:29:23 +0800
Message-ID: <20261124072924.556678-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_232941_793301_8420F8D2 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add eFUSE controller node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 88ddc8e793f6..2f9fca6bd110 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,10 @@ &emmc {
 	status = "okay";
 };
 
+&efuse0 {
+	status = "okay";
+};
+
 &gmac0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 320c4d1d08e6..9577aae08f7f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -408,6 +408,18 @@ sd: mmc@703000b000 {
 			status = "disabled";
 		};
 
+		efuse0: efuse@7040000000 {
+			compatible = "sophgo,sg2044-efuse";
+			reg = <0x70 0x40000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&clk CLK_GATE_EFUSE>,
+				 <&clk CLK_GATE_APB_EFUSE>;
+			clock-names = "core", "apb";
+			resets = <&rst RST_EFUSE0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7040005000 {
 			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
 			reg = <0x70 0x40005000 0x0 0x1000>;
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
