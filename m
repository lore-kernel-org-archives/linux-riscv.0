Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206C6C021A4
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 10:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nm/Hj7xRm4u3Y9JvAKS9CsKfYFjqFHGE9yuewmTTe34=; b=f2EMD1Wi5aUvj/
	SD3ath/IMVH56J+45H5GNu4yC96g7Pm+5iCykRPGCaxkUiYAZNSwBXFrPVKU/LUwbI8vGx4tm1gvS
	89PZqpcFrPpj7FW6db6TmhF4z9bdIZjL71b80LGe5VqfqFvIx6IhtYZKUz39F+zNvHtO4BAnAhffy
	7hzB36VhiWQuMPuP8Pko+47Uc0oUgdMhXB5ObHv6e5UoDNiK1xJjUZn61MLOssKI80o6ScMh0kn6p
	PXwlB1p/YSyZ6J86g3Q5RStpI11G/QJ+a8eX5V5TDMx03LTkm965n8uyVMr5KBcROmOQSRQCauofb
	ZCOEa2Pmr6Ir8Ct5F+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9au-00000006uYM-10F9;
	Wed, 12 Feb 2025 10:03:48 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9GM-00000006psr-3MtJ
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 09:42:35 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3f3d3bdaf01so46821b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 01:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739353354; x=1739958154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BDt179jsPGPQXJw6cCKRg6ipVwilMKrhen68cQV3C0=;
        b=cUZ8pIs1J/s+l6btgYBNTNDvE25aahpqkkULCS+9W4/hD3FdbcnR/50fs7U4djQW6V
         9wHLjbgQmMZwa/pUub2fs3HmN8VDisBLyp1misZ7ZAmRuVX5hGP1XWWXZc1P2+1uOiaW
         ODo+HnERTYjuHYGwc1ctDSga7svoG20EdFfNhQtlNzKNhOQi/F0gkPk5KAv52GxjejF+
         QNDylu2FHdDBVCz06QAedujqczCIgKbOFsao950eDMgMRGZtfea3kn5GNdSn3dnn3jd1
         bGP4PQim5kRvoKTYxSg7OYpdbNSrM7k6/doaLINElRC0pGra+VqQcfDdHnk3szMva7p2
         a6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739353354; x=1739958154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BDt179jsPGPQXJw6cCKRg6ipVwilMKrhen68cQV3C0=;
        b=tyAZJd7iD7ybLFolAk1AO6+j3jLNOHAQZSFI1A6uDqlCrjUD7zJX2/DErc2OKSRsFT
         MpTzhztkUF334CSMNXmTYWp6pRtrCIVRBN+aYP57867XH8li/kEov8rM7yIQK6SzDeos
         /NvwGnNOfNpkwq4OFsN8U5TAVQh9666ko3jL2rMmSKI7u9e1cSq0mJTWOXmW0JvcCMyB
         9jQK8GSGnJtJMWe3cLMxNM+MUd/1Cn1n6zD9keE5GM3482EwupQoZLTxkfHbUocm2UWU
         oR85VA9lm9aa95ko2QFD3O/YBFPbP2a476/X+zqy5y910hLEsqUxLGhNxrB6ZhSRlCbr
         HJqg==
X-Forwarded-Encrypted: i=1; AJvYcCWzXK5meE5MQXQD1haCcERAAhVY5znkuOw2hMRMXjbiIo9EaTe2EfytDiaztHUAGoeIJudL7YszCk1iHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBEaHO0Zh++DdPEf/M+tAjWpfMkaLIf5aUpCqgz63mBki8bvHX
	01F9J0dQwsf1mqPOX0KJDIsX2nUaIsCHJTFvaMbQTsoq/c6w0O1E
X-Gm-Gg: ASbGncsobe3DhXmF6x9uoUHJiJmxumPI6+5jRl+9u3ak3mU+TgERA6AtnYbVFMiBEKw
	qWo6eJ1oAwYGSeBR7pKPhUgwX1ZDoMLtJKLoUWGV2Bz1n94wZ+c4elkfa4E7CkmlFCvog8NPFCg
	5bSBPOPE6xa4Qz1mnLUaYes+iBqbY+wT39UvtggRbdoNare1CMwzevfkAQshu24qc/IgesZ1K76
	/MCd3tk/U4XIWh5F+/2Ec06map2KtR8QG3VyfwcalhD/0aEw/QvcIEc6fwR9WFb68nYX0sKVbvo
	57JeSDLcPWm9+wmdGAewU6NCxQ==
X-Google-Smtp-Source: AGHT+IEy/UxKhE92PT2Nyvo9fgnKrPBECelMkTakVs7vyrkYcrqQXDdT71oXo3Zyrau9+iD0WHIA7g==
X-Received: by 2002:a05:6808:2e85:b0:3f3:c9fe:7fa4 with SMTP id 5614622812f47-3f3cd60df50mr2191427b6e.19.1739353353785;
        Wed, 12 Feb 2025 01:42:33 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726f2065dcfsm819321a34.34.2025.02.12.01.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:42:32 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com,
	inochiama@gmail.com,
	sophgo@lists.linux.dev
Subject: [PATCH 2/2] riscv: sophgo: dts: add cooling maps for Milk-V Pioneer
Date: Wed, 12 Feb 2025 17:42:23 +0800
Message-Id: <5a36a2784d97ed7b1e06777cb0c3c14fe9185e99.1739351437.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1739351437.git.unicorn_wang@outlook.com>
References: <cover.1739351437.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_014234_839351_1DEB0D07 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Chen Wang <unicorn_wang@outlook.com>

The normal operating temperature range of SG2042 is -20 degrees
Celsius ~ 85 degrees Celsius.

Simultaneously monitor soc temperature and board temperature to
improve redundancy and safety.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 74c997ed8283..34645a5f6038 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -111,6 +111,28 @@ soc_hot: soc-hot {
 					type = "hot";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&soc_active1>;
+					cooling-device = <&pwmfan 0 1>;
+				};
+
+				map1 {
+					trip = <&soc_active2>;
+					cooling-device = <&pwmfan 1 2>;
+				};
+
+				map2 {
+					trip = <&soc_active3>;
+					cooling-device = <&pwmfan 2 3>;
+				};
+
+				map3 {
+					trip = <&soc_hot>;
+					cooling-device = <&pwmfan 3 4>;
+				};
+			};
 		};
 
 		board-thermal {
@@ -125,6 +147,13 @@ board_active: board-active {
 					type = "active";
 				};
 			};
+
+			cooling-maps {
+				map4 {
+					trip = <&board_active>;
+					cooling-device = <&pwmfan 3 4>;
+				};
+			};
 		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
