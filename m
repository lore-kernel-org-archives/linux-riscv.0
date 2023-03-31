Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F92FC761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bjrVBSJKZ2BoV3iUXyIAO8v6NodFLp7MGAaUyZkD55g=; b=Bs3DFXEy57TWkZ
	eQvjpgwKzIAeD753udeI/l1Tz2Z0dywQQeV12NEbcEimHaCfXuBiwc7xkjWh3YLFPzSGjaCF17ge5
	rH61d2FtVEKEIH0neRbivBhcN5wXKfbKHYhBFrqFmDlcCBbkiUR2D3k8jzrn2YZhxNxyWcyf0T/8N
	SalNsAz5sCd7lExFdJy0neYvCPLdL6fuB1M7P+mx6DBTvLQcpv418Bk6qb3ba+J82yej0CXzSXxL7
	qFwA2RbA1epBBq/tSDPJl19XvnUjFw4dF6XHO0MDp8j7ysiY53GLxVT34EDi64oFnJ/J+Z3PFe754
	RcWv/hkULwIOS8pFtKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJTO-008RrT-1Z;
	Fri, 31 Mar 2023 18:27:38 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJTJ-008Rpr-29
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 18:27:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so24285123pjz.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680287252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4FGWSIPST9m6YTXbscC7ErUtHPtpC6n3urFFBCXSuI=;
        b=74oWXDIlBPU68uwXVejlOmomkabmhkdTDR+caL1MADEQSdjPjVuZ1dMDPKYm3jiBJz
         f89c39he3eNwXJGk9iAPuh7PGV5QlqHep+5CsA9D0jjjZt/ijv8kbwl4tOExrz03/UFv
         TJucNRYuNMDcIDYmsQUJs/CFGXH3IbzJL6nsSD3YASqmB3b8uJDdwCFHneyfAiEfKd//
         k2DilaXoubfPSHiuqOLWcY+cLX1kMibk9FbQY45f4ttJJBOyxxPLTMSX06VX6i1X1rO9
         ZP/zJsdxyDYzQG+uqof4J08lbr0lWdOdvCUFGCrR6LtqcbjSN60FwFniWzA2bSx8zsUx
         00jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680287252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4FGWSIPST9m6YTXbscC7ErUtHPtpC6n3urFFBCXSuI=;
        b=rt4AzXCCyPe5j/f46IDwQaLboNUWmK5lHLvVU6HkEFcu8A2B4R8hX90yQljou30u3b
         25P4YFCAQHfzZDr7CFMYlFOHbIrDSH1uGdlSNwAyuBmEfovV113MJ87mB/0mb/5FPcAP
         an2rIYOuIJ4xueCb1m5AujLDIV5zYIWO4vinxurTbQ/hStD8QNwt28uT6J6WQHWjrcqW
         kTtT3dEoAvTOwtCHTJKg1Eo9jVbyZgtZq4u+7BA5zzjKuV/v6bxoObl3jwDUmXu3pyj0
         s4m4alUE4hv/1yak0l1+yeavqjW3Er0dYmVgKUyTyCCEshuHD79iCBSW53y8+ioHFtrC
         PYtA==
X-Gm-Message-State: AAQBX9fNYiXXwonJKC3lOTMKsK5JEHptaNDSXJClJtpRTaxVoep59CQx
	a4ZxhJOYb9XCba06RPt2JNO/eg==
X-Google-Smtp-Source: AKy350a/MDZEdFquMNruFsfiIdHNSmiDjW5khv2c+3EheVH0PNILA4FW8AGtniTzvagvyHWYVpCHPg==
X-Received: by 2002:a17:903:3093:b0:19d:1bc1:ce22 with SMTP id u19-20020a170903309300b0019d1bc1ce22mr23992076plc.5.1680287251852;
        Fri, 31 Mar 2023 11:27:31 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c20-20020a170902b69400b0019f1027f88bsm1826795pls.307.2023.03.31.11.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 11:27:31 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: linux-sunxi@lists.linux.dev
Cc: conor.dooley@microchip.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Conor Dooley <conor@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Trevor Woerner <twoerner@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH] riscv: dts: nezha-d1: Add memory
Date: Fri, 31 Mar 2023 11:27:27 -0700
Message-Id: <20230331182727.4062790-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_112734_707854_826EE41E 
X-CRM114-Status: GOOD (  10.13  )
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

Add memory info for the D1 Nezha, which seems to be required for it to
boot with the stock firmware. Note that this hardcodes 1GB, which is
not technically correct as they also make models with different amounts
of RAM. Is the firmware supposed to populate this?

Signed-off-by: Evan Green <evan@rivosinc.com>

---

 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
index 4ed33c1e7c9c..6aba68cf5541 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
@@ -32,6 +32,12 @@ / {
 	model = "Allwinner D1 Nezha";
 	compatible = "allwinner,d1-nezha", "allwinner,sun20i-d1";
 
+	// FIXME: this is temporary.
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x40000000>; /* 1 GB */
+	};
+
 	aliases {
 		ethernet0 = &emac;
 		ethernet1 = &xr829;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
