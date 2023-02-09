Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C413AC636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8YR18X4sk1H+KXZVf1u40Ngmswv8Q2ilc1m3ecszfE=; b=t0DJLwUPfzhLKd
	mvO0ZpzVn331XhSrm5wItBg+uMS2YMzjowtPaftXfSSEnKZTUU4kXCQDAPi0FC72cVebbCH47ubL9
	WqZXhabRSgu0syiCAVw/PUGEVPFk0/uqbNKkAuWPfCHYvsKy4ZI78UAaa7tVmxs3qYq0MvPZrNZAz
	fZcyFCZog7jdG4iDNAOb8mIga6j+fdSb41NxPHzKXLSOMaxP/5W5SGxVaZFgmVhRZGMLaWA73hhVG
	Sx25fO9ixKYuVmJD53eb4wrn2aVNPumTebHXdLGu9VA2iNTBa6nYdWtc0DTmbeU7FZDhv1xaiptbF
	AlVq4V1ZzXBxsTy5jmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8oy-002CkK-NA; Thu, 09 Feb 2023 15:26:48 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8op-002CaV-49
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 15:26:42 +0000
Received: by mail-ej1-x62f.google.com with SMTP id p26so7348318ejx.13
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 07:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzN8AbOo3JyjfFUVtCb8EymIodGNvAg9owDKXhmBnGo=;
        b=SIV6vLnd1BhcI67eMLyix3FccUCtJUBIQE2cBvdZASfbrr4LJIChW8AfwaZoMAISjB
         tVuT7EQRJf6xP43qarway9C1uShJmrhz58jJqUhvaL9ohITM8MsIUWY+Kd7fR1tNHCxh
         QwdEBFsve3jswe+gEPq6SwrpEZUKYV81Xgb2f3WN8t5cRiMDbzvzmko3O2MwqBQ8EJlB
         bUe53SBat34KgYp8Vnx0kWYXxjv24xrGC++b3+QaSFGXpddVlCDaopWp/d4nUYF96aVM
         2CeImBsU7JKcLGfbxVw0tCTZciLSmS4TjCp+kSvYaKh3cD7wmH+l0S7pcfM/jJB7w2B/
         Eg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzN8AbOo3JyjfFUVtCb8EymIodGNvAg9owDKXhmBnGo=;
        b=ioomJuBzoAP3A7XBIDk3Gt+Lijwf+0pILGBTnCG0wG6YUu00cJpsTtK7kvUw8lysqv
         EcFRgYkwgn936Jw2M12n73GwNskgKo+lZu5eM63Swf2IMANChU/mfikpaFLYjkwLa3Ff
         ceKiBC0sKiTdZrUorWafoQBGITM0I4MHr2k+9vlLgoZgM5IfTDjX2bk1PhLnm9STXGxB
         Mw6NVY9vZ7B2wBzTo/lP0dZINIEQmjktA+gk7l+7LQgugb0B5uaUPsIXf64mXgQxY5L+
         9FYONfHfP2joQtSjoF+tEAsJiHvMlYmttM6/2JcuT4pYIE8W9Zb3oIS+X+uS3TQCHxqj
         X4mw==
X-Gm-Message-State: AO0yUKUxRTxgK2VCiWQe/rkxzJ6mFe2f9x6JCIsE/O8EvN7d4eCqILVk
	vJECeVhVRqLFf8jyTs2rPdkk7ksi3j06Pp/R
X-Google-Smtp-Source: AK7set/g50kwhLiRNXI62js66kVWINozQpaTh8rMCC40tzBevXRxgk/yrsjMPSLLArlomemwhIbdPQ==
X-Received: by 2002:a17:907:9a8c:b0:8ae:968a:cde9 with SMTP id km12-20020a1709079a8c00b008ae968acde9mr6708419ejc.68.1675956395543;
        Thu, 09 Feb 2023 07:26:35 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id k6-20020a1709065fc600b0081bfc79beaesm987397ejv.75.2023.02.09.07.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:26:35 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: [PATCH v4 3/8] dt-bindings: riscv: Document cboz-block-size
Date: Thu,  9 Feb 2023 16:26:23 +0100
Message-Id: <20230209152628.129914-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209152628.129914-1-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_072639_185072_51B1EED7 
X-CRM114-Status: UNSURE (   8.51  )
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
index c6720764e765..f4ee70f8e1cf 100644
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
