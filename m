Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9637C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 16:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GTviJq6aghD0/6l0v5E0F/j2/7tHqcegpJXK8ftCXY=; b=VqovWXQZiUSm5I
	wzp4bQtTrtzb6ZMWmTvIjEs2HZbc0LjuV4ZVgH+LxP+q7nPtuxT9IDpJWxdw53p65ksOB5pPfegQo
	uRanWGMFDgC0cRthwyi6OdsLGxVeG6GDkdlIGAyXYbFh29fIriaqneggOwRuVVDfRtZIjN3l4FXFb
	mA6/wDTFmb6amF8J1+2IOV6uq7TjCpFq+lHs6nPRXwgExbPn3HMMV5NlrK+kLTVWjNvKbYevgZfTK
	QIoUF1AjaZW0U/6tsJ7vlxQbBrC6t+KepjXGKIXfahrBVVz+wXkTQhDGnZ0Ca5WsPBbDSGypcn6Oh
	EycurwUm2kXID+jxZsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVauE-0037An-1X; Fri, 24 Feb 2023 16:26:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVau7-00372e-N7
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 16:26:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so4346562wms.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 08:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ulHjChwX0EpCdPBQp6OD2TjDP7InY37wU45TsSAj1w=;
        b=Hqo7fu1B4xqPawDMyW66q3vces/lc1k8SQ+c8oQEtP6S3LvATJfoIKXuRYcluW7sfy
         +ugmVcqInbSAczNkKhfdWaI3i8SO4YOZWvKcrdtgk6OIuxNLt2RkpXwslwuEonv9zXph
         vxeHEaoiDJOu4nqWOCTZ6P2mXWns/DP9NTw5VBWS/trQxmwUIZ1F0pmY4RQA/Xh7rfTl
         rtBrfIN/Px2t1plT6ZbP2YvAzk1H1PV5QkTHqcBEwHvcN5EwRy+lX5NfhLqVAOjH74mh
         ZSM+9eG0NGdZSqiMlM8N2QbPkiKSDr8QRwjKSQKha5gxA+Vd9I+jXViZAqAIzsIpkZ7e
         IK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ulHjChwX0EpCdPBQp6OD2TjDP7InY37wU45TsSAj1w=;
        b=oJOW8D8J50q/vOEGyp0A5W/GHBAC4M/cjMuUwWaqEDOdPNat8eX6Bm7r6KGE82e1UY
         JHQDM9y6fTrgYIvitSDpgJ2p7mT85en6uK5C+UGxGGehqNYHzP2azS3p6RPUKvaRyrlz
         UyydKqaG9V3DLfArG2tYrFyAoBWhPFurP8QQ6UHYeHOqN80zV0RxboDzK2SBptsCdkVE
         sBVLwZ6LEKu5B6bJ2wma5RLv8UwvIZ/FU7ctVosBL7URwjh9d+Pt2cfFYFZiN0LLi4E0
         1WP3Nc0jVTVA2qo65XPMIBn+Ld6MBzPmpRsNWJPdwRH0XTSB8jmf9yvSSfqLjiJ+gxc5
         8usQ==
X-Gm-Message-State: AO0yUKVbomRo11RjfieBMWo/IWNB4TiVbzo5HTqMVc33QtOn/SaHaH8t
	OBspkAZyvpcxsGrUQT2jHQ0t5FJWl9FL4heV
X-Google-Smtp-Source: AK7set8zVxc5qiCueExOLHTCFNNzolxFPSj234tIjv7/zx7MafBbdDpFH8c7Yoswk3smf5KklatbGA==
X-Received: by 2002:a05:600c:331b:b0:3eb:2da4:f32d with SMTP id q27-20020a05600c331b00b003eb2da4f32dmr1107776wmp.26.1677255995904;
        Fri, 24 Feb 2023 08:26:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t25-20020a7bc3d9000000b003e896d953a8sm3377129wmj.17.2023.02.24.08.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:26:35 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Conor Dooley ' <conor.dooley@microchip.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Sudip Mukherjee ' <sudip.mukherjee@codethink.co.uk>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>
Subject: [PATCH v6 3/8] dt-bindings: riscv: Document cboz-block-size
Date: Fri, 24 Feb 2023 17:26:26 +0100
Message-Id: <20230224162631.405473-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_082639_802687_EF1D62BE 
X-CRM114-Status: UNSURE (   8.29  )
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

The Zicboz operation (cbo.zero) operates on a block-size defined
for the cpu-core. While we already have the riscv,cbom-block-size
property, it only provides the block size for Zicbom operations.
Even though it's likely Zicboz and Zicbom will use the same size,
that's not required by the specification. Create another property
specifically for Zicboz.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 001931d526ec..f24cf9601c6e 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -72,6 +72,11 @@ properties:
     description:
       The blocksize in bytes for the Zicbom cache operations.
 
+  riscv,cboz-block-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The blocksize in bytes for the Zicboz cache operations.
+
   riscv,isa:
     description:
       Identifies the specific RISC-V instruction set architecture
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
