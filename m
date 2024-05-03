Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1326C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7xmyQLAY5LShPIffkUVscHudkyh1pkLENSCTLNzojc=; b=09nZ18w1Rb+Ej/
	75ksMlPQ4/rvQa2hjcf/Q2wc1VehUNXIENwGAxnpL8rJFZNkp01S5L+nCbRa+W1rV1mDe/BgSy6Qn
	Rz+ohAjdfMBIrN28CVHpAOq0X53jmMMLF8ESISyGyEAPVa9q+i79Kl+V/11xjV6n9QDLDbTb0VsR6
	/DKUzpxOQTAQuIutw21xs4g+gtMzyU86HyEKKxfAVnyEBI5fYPigOcQo6wAgt/zi4FIcSxjpWFcss
	lPKsyvUfoMAnOMwNUNq4pQjRafFT1L/5otyV2EgymxYJdWjQoEaRiB+M6rnxGqk+gdw/wxR7a8Z6n
	JtAZIuiMI1DQGneNKFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xVt-0000000HXn1-3r3S;
	Fri, 03 May 2024 18:20:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xV9-0000000HXDh-24Oc
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 18:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nZNu49cB5jIU+scPc/LTeIomrER6yojN6Bu9P2llbm0=; b=orSmdA6xvUmzMyo5OSpjZi4zBV
	mDwHC7U4UxO2YtFcqS/Np51Th3annDnPs63IhyxTKk4p35PpsWu6V+EJiM/e1Pp2klSsLmdbIrFGw
	CG+82jQNSfJxGeAtYWq9qt29A3U5PkZuBhhjrhEOL1/RZBVWihSunPiID9HYkS4IEVJBq1hffpCRq
	EM+6RH1EW45lTvs/u1P2KDjBuNvoLko3kU13JUTsIJhDPHg5UpAINqo1wNdADKV0SUaT+cnsSflL3
	16K+tos8+DHnPOtuaswUqNVzHN3LZ8mgSXqkV9obANUoCxCkhwkuXGgJCZhcUEDYMB1IebSFpvRAO
	70gc9koA==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xV6-00000000dwr-0OeX
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:19:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6edc61d0ff6so1978b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760354; x=1715365154; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZNu49cB5jIU+scPc/LTeIomrER6yojN6Bu9P2llbm0=;
        b=jVy2D3kfaPnRPuIBWWZqkgT2Q1XcqZWLdmjAIH/JrDrn2hG5Tnndz5CS8ALf7csIvp
         xkrmvxFnpcVtZiGtLAthoyIqDxZhwTCvE2LzVveADY+v3Y3gt9b4CKpTTE33whcvF8hB
         PA19yp5oTyxryIOcfS7xub5h5pOd28q7HWe6iBGI+cPhXm1PMZ5IraWMLujqE2zGXWFj
         9dHei7KnMCBjz1pf7cDlvLh2dxksbGKNrELsJLUL8djkgdQr3ZvvjghEBhAR9eDant0l
         aNowt/Isz38dnmC1Y1Hs/C3MDHjRlkHCE97a+p5STVuuaumgTlTc5LrKdtqnGQtTdOg6
         I0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760354; x=1715365154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZNu49cB5jIU+scPc/LTeIomrER6yojN6Bu9P2llbm0=;
        b=gqQ8bwfaq1iOHlVpgeTDW0dbBtvV2y+f8Y1r4u1m9HUSEvGixbFs8FAh80pspiTcPl
         05LfVf2nGKVKhDk+JFW8J7+DQFl/pbVLNHB6OgpxuKHHFkKeq0pfbghyxBo0xoad/da+
         Z6SKsNiEPOcrBjGmWgJy0gHXFL7Uho5AB8Z89sPETbsBYo1TWu1gpb/0NZxin5N1CjE9
         7tR98EdyWiXSiCJJswmBJYVAIclJha0m5sU3AElogrjbdjwgRyZuW50Fm+SUximDRoXa
         g70+X0X7Kdac7dthpu3Lxb3ow6YCM9cnrqBNNwTV2LDvGKd4w5X/JTUL4Z/MXEKwn636
         NLxA==
X-Gm-Message-State: AOJu0Yxtu7e9aIZD50vIAtSMjXFJB4o02ODXdFwWBE9WGnOFyEZ9Lz3I
	zwyW/jwWVBX+js8dvRFRJII+B6qUyhPUW/1S1DChN9PQeOY0NuY8/gfNHv+pAmQ=
X-Google-Smtp-Source: AGHT+IEDiBdqfsXvGEcow+/xXhFzmm8QJToAgACIY7pUp3n7rDHD0x7GsayE074DmQ273Ns6HlLwYg==
X-Received: by 2002:a05:6a20:320e:b0:1af:6fe9:5039 with SMTP id hl14-20020a056a20320e00b001af6fe95039mr3721586pzc.1.1714760354553;
        Fri, 03 May 2024 11:19:14 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:30 -0700
Subject: [PATCH v6 15/17] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-15-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=1250;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=CUBdyiNhoSP4ACo+iTYp6MRGKjg8W3HE2pVBTFyz0Ws=;
 b=LJgbuLGSxVyIdCFiPOjJ4kcjKkqUizdoh8dgNf3DO8NV0Ma7wpUEikvJ7F3hAU0AjgkpzXZDh
 YRf+T8Yp8P4A58deAYlr+lbGFAdB7N8Y0VqXB0uIqrC2OQnnArji8iw
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_191916_450396_F7134E80 
X-CRM114-Status: UNSURE (   9.14  )
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

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..b2bb305140aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
