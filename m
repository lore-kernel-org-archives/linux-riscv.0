Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E598EC3DA61
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 19:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sLQszs8uvBMuM7q3YsznaxRjkr+k4U7AGQHcLo4/h0=; b=qXJKCgmpmkUCIA
	kP8zLome/QlhY8UJnhTY5dev4DrE2zyD+NYosHMqHFuCOljn0i1qCcY9nLVl3IQq74OVMRZkevwsO
	MjPz+KiBPfKKWrplmjd8d7ZHwinFQbVDgaeeyjqJfLi9XqcWq+G50QddIuWxvl0LBOf0I/NKJCV4h
	CPGuNHQIta+wy292RlaIOhDl7QhuXjm3I/tMm+zBnC3++cYinF4vavPa6ezU8ABtxDzuxgyWd51bq
	IakZZ/i/jBwc5ftP3jj+HbdGc6Vwf1gfRy0bHnToq/LgUmai1Qvf0SycBg41uyRjgAQvUofcBv6bj
	d+bo75k7mpwDVm5slE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhR8-0000000GIYd-2lVs;
	Wed, 24 Jul 2024 19:14:06 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhR5-0000000GIWm-3vsS
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 19:14:05 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7a1215dd114so105162a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 12:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848443; x=1722453243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=KiYbH7fyLPvc7wv/EFcuGaOL2Ig4K1hQ6Hu7vSjpuoC3O1OLsTGLO1wsgQn0yD39Ec
         OdhodooiTgwsPoybRMvxhBSoG4LXsq8vt5wQUAbN08WDENw0ul6j4nShq8E9UfR1hwz0
         PMAbiYrUuLVmKlziADQLvPWWG1DY0CNc4DtgDcWdp3/1u2t25rhKak4cy3AE45YIKSF0
         6EmbMI1k4ZcF+/7qkKG7UBM2OhSgYUVIMWdLSQoh0pbkFi5SU7gPEfpHjR+BgFds/uzK
         PSMktBeqEweTiaTvEk1zL/efc+VWXQCIWRhKWjXcCJy6mQ/KO2fZVsmrvfFx4Fr9hE1d
         w/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848443; x=1722453243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=jMMrklgW4uU95HWkQ4KQ3TMHOBtwY8WXlDbTjBvywPPDUfLfAbm+Lr6Jzi1Ho8PXMX
         +7xoNrtHdzNQ+N3gU6S8loxpvIc2+R84Cl7PRqmqB5YOPnrbpAsLyblsoTYN0BtZIvKL
         Bu8e58of5y8Thmo4LxLhaC10WUzOqFx+4MqEKK5V2L3tpfAcnG7ElQ0u8zIpON1NroKf
         I4afsVJAsGa9h4aEHdCsquL7C1A3eBp6qRbvGqQvpdtFt26sf4u9F3w+sueHrnKdmZaG
         J3B1KwPEKD9MxAuZmWRenS8gCt1w0deggcgTU3zd8AqC4fd4pDZnE2+YdYVdioZ7u4mO
         3Bxw==
X-Gm-Message-State: AOJu0YynqGvlv0G9/HhGSyxjfdHz2iSvMmcTTszFOFveXgkTcI1cduMp
	gupJjkbV7IWhpQnpCYUVD9xKSlEQqukzkbYTYStVTOzTL1YHayajIMBKiSW9F/g=
X-Google-Smtp-Source: AGHT+IH05meby4+2EXjFgjam7LAliTRmTubnFATA6oDUhsso55xLxKhzyGK68nAM9BHIX9A04skdVA==
X-Received: by 2002:a05:6a20:72ac:b0:1c3:b0d4:3e8f with SMTP id adf61e73a8af0-1c472fb13d8mr1037520637.14.1721848442605;
        Wed, 24 Jul 2024 12:14:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:01 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:13:52 -0700
Subject: [PATCH v7 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v7-1-b741910ada3e@rivosinc.com>
References: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=1788;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ZzH0VgSdYutk/uKY2omj651o9v+E5HP1BijtgXJzAp0=;
 b=dR5c7ckZTs1cKin6Lbis5zjwQCaBrNTRDODqsLLnFPnwcJ2p+c7cE5w58tm9O4LgIawNkO0cT
 pquX6jLm+C4AKGK5w/+LXn1eHmAkdm1FU3PKqEqJgnv3qi//AIF3pgV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_121404_002453_8DA143A8 
X-CRM114-Status: UNSURE (   7.74  )
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

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..1a3d01aedde6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -556,6 +556,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -563,6 +567,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
     allOf:
       # Zcb depends on Zca
       - if:

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
