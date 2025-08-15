Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F352CA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 05:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xnfFG50BBK8IrJ8tlUzdcsOboYdDkhh3dnyXBfcxnA=; b=NNrJu1409WWem7
	lhFttLzqYNapFbkgCrODPYm5b2xCZ1MRrF7QgHHxAk0XcfQOrwZqB4VWaVKGNSmJBQt52dwD3Yz6P
	jimVEtuEemxP0xgNe8UTPuDEdqJ+0+qnbm/LZkyFgTTdae5oQi+lvDm/NAF4ucv8U4+7iOFG+7KNR
	o7ylc/f3FpWghA+AipPxixS98UGe45kGn7BFf6G+G/v17VixjcQdBWRo1e2RIUG1pR7CXh7gL/m9p
	KTP+UIY1CA7qNzbs4FWXdZfl1Ye0r59uh3MGxdhfsiiVBL4A45Ka1vO9GX9tNm5NCQfKHkw2nDTEp
	rikOh7ya9x7OhmTIWRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummpe-00000001VYH-02ev;
	Fri, 15 Aug 2025 05:18:26 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummpb-00000001VWo-0nbO
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 05:18:24 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32326bd4f4dso1701661a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 22:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235102; x=1755839902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tu3VbVvBVdJX8NKXRo9aN8ru1kGERA/t9NfAcjD1b4=;
        b=p3BL6SYJIKdPIVfgL5XgjtXnxJLCOOlvdcw+e5bloqSEKs9jQByqLwyJ+Pueu1RTvA
         +5jfSm8b5j0OcuAVGiMpWVvqHH90HMhpcwG7uvTMYH8lAWaJrND1oBLMonZ6TtRh84pD
         LxL+KZPsNq6qkpkw4xqtjLsEAZi57SJb0gEPSnBRMBbDtYXhwjgmOBQo5eRXlT/iriDY
         eZf3OMWFe/jKJ50TFW+DvFyClqLKR+DZdRweFeROBLnTP5gfLhYHLq7JKLsuoURbjX48
         U76OeTfGer4FJp5tPnhJ9KEsWOPMUUVRD+zJpPkrHwS67mXdVdsA8ZaqjSQXqOmhp3F5
         Qp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235102; x=1755839902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tu3VbVvBVdJX8NKXRo9aN8ru1kGERA/t9NfAcjD1b4=;
        b=LmMuJfvzU8YjGeL+uLkkeWi+YiNLRbngzsd48HCWT83TAoD0lpkEHU1FNitFuIPiE6
         luS3i04rkJBUVS/krR1KGZisUpjjVDN8GmE74AUblfGP3Yt1ZK/wTnQ4uN1bTa52oRsE
         pdLrOdWN8/GtLYV1urke9Wl8nE8/3xizm39r9EBxp1AqsnStWOGnJ2cp85DcvP/TR6C2
         g6xCbMZMy0InAY6xFNgcG8uBXQboizgNupLSgwU0kUKwFZrE+L66qR0EV4yik9WUnD7I
         wNEMezKP+qAybIVG11a0w46cAdYs3ilCy7wgHOK0U3t4XnBkT8hTOYR5IablRKMLf18x
         2tGg==
X-Forwarded-Encrypted: i=1; AJvYcCU3dXGfjlxEp8xx9sdmQjOGVrEA8+43oLe7w5nEILmGjqrNnXqcKsUuool2hJ/hQxAIAxuy6g3f7AL8HA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8nED/FLg388RpKCrlGAqYE5kLufjwI3Gjh7uTo6gtRfTBbbZW
	lAGDDGGe8QYA5VSH9B8tToLi6oZ9B7DvraPA87yDE3YhVJYeyMLS7W784IIjviOy2aw=
X-Gm-Gg: ASbGncuX3IP3cS8bk2zDls/XGwq7SuGwl/Ek5ZKRMPA+WgxUbwgtBcdO5u7aNZi1BMH
	+T2OtXXu84ichQp0GrXRPudBCH9b7pm0ZQcl/QEO88NdOheIpsq80/ql+1r8dKFodh0QB6BzBrx
	fINmOmjIWKZNDeKBYgHD3rrJpXMYOJUJo75e/4tK3dLiKItf8XuXbl1uLhDBluVrufS0eny05P+
	F/FkWwBPP3Md93Qz/qbsh69lvR8d2hi6N/gYleBLkDEuv5/yH1/+G8RF6tOPmoJgJfIOnor/1Yx
	IdPgaFwpt8DOYSBUge1lzY5vLLC91EeaAcWI1Gf7L9QTkkedDhCd6z3y+BNL2zJwpsfppqZpYdg
	fZVYg44VKhUePBy/n3NPUbQ==
X-Google-Smtp-Source: AGHT+IFDtHgfFvQxxm6fxEwWXi9awBBZD5Ua19+tFUlmmEm3vFbmRHegYSTVwFsXKmUcUeczaz7/jA==
X-Received: by 2002:a17:90a:c10e:b0:321:2b89:958b with SMTP id 98e67ed59e1d1-3233f0c1a4bmr1740600a91.0.1755235102576;
        Thu, 14 Aug 2025 22:18:22 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:18:22 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 13:16:29 +0800
Subject: [PATCH v4 7/8] riscv: dts: spacemit: Enable PDMA on Banana Pi F3
 and Milkv Jupiter
MIME-Version: 1.0
Message-Id: <20250815-working_dma_0701_v2-v4-7-62145ab6ea30@riscstar.com>
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
X-CRM114-CacheID: sfid-20250814_221823_234487_2D8268CD 
X-CRM114-Status: UNSURE (   8.41  )
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

Enable the PDMA on the SpacemiT K1-based Banana Pi F3 and Milkv Jupiter
boards by setting its status to "okay".

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: rename the node from pdma0 to pdma
v3: adjust pdma0 position, ordering by name alphabetic
v2: added pdma0 enablement on Milkv Jupiter
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..6013be25854283a95e630098c1fde55e33e08018 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,10 @@ &emmc {
 	status = "okay";
 };
 
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4483192141049caa201c093fb206b6134a064f42..c615fcadbd333adc749b758f7f814126783f87fb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -20,6 +20,10 @@ chosen {
 	};
 };
 
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
