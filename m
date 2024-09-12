Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C50EEE6456
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/+Mrb5v6khH7isSMLAJGGeV+oQ1HEWPaA47gpodMX8=; b=v66/sGappUVsM+
	hnB+pyP3G80ZpEn8z9/FIiRXxS//jXor3OEI/UOqWkz7CZHQ4RD2YNfYYVJY+7c8t6wNZBZDnifbh
	xDbSVSnVvJOnlE27zLjS1BZXCuC9eYjSrwOZiybDZkBSjJS0vDJx6oauVpIIHJXAu8q2ffbNmLyJD
	/T5O+8Vgw6+xBwmV6PbEyH398sbZK/Hnc15Iz+wO7ub7ef6/a5uQD1LU1CRQpHoo7bV2AKNx5lnPH
	X0hyy/YTv7LWCV50rgNRyYQw7ia9/VTtImwY1H8Iy8pakyMAe3Ql6opN7bvAODKdKY+21DM2s8sB2
	Y6HXmFH9ILqffb8bfHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sodos-0000000C5kv-3Q2c;
	Thu, 12 Sep 2024 07:00:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socoL-0000000BwBc-3JVt
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 05:56:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-205909af9b5so5982545ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 22:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120568; x=1726725368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzA4CLrN9c04I0TkiHjILEnLnNrrRfsvuLr439lHPOs=;
        b=MT5pb4snYSrv4cBhSu6iKk7R04LIMADnRuGNgQsq5neZt8KYeDMQn9+AxrXLbK0p3w
         5r89hvBbhAtThLlfmcFEFmofn/WnJurTvpG6EiIRVNGSlm4m/+33KGtuWzFBdtCqQVGI
         ReKHNPHR401ZrTmZ12VJWnmPsauvXKxTvfK+on25tuvhH3xUIcu+vScFAMHWN3WMcvZ8
         gjqrgyNIccU3UcvggjXl0/pya9eMv8oJJ5v1wPLYG1LSoc0Ec3PskSAvPwsXOxzjRPH+
         yM9nPK9C0BnF8JEW4wa01eXDLsZlCCMw9EXZJCV+YaA5EogFaPKI7omh8z45BdrGV04Z
         L8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120568; x=1726725368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzA4CLrN9c04I0TkiHjILEnLnNrrRfsvuLr439lHPOs=;
        b=Sqntt1+KifzimmlOGCMx9IXlSQMV+ryiJaGptTa3aITgosURpaDA9B0nx+ULhY6mN3
         +TBBvyxo4joLqLUv/fKbkDOjZLjHlA0Sy72WSiz/0dSXMMg4SCyKXtiOuSpjM31zsNkF
         lEpA6asGObBVdx+sRXdmZ/X+g0RNQpOOIOBd8Cq0UnzFgJT0KaJ8uL625yt6fyZTLA7p
         qsIultLIvgQUWgoOWqYxD2BzXyvfwrQHO0iyTSvz0R1hF8ifUcHMbGAZk9oSj5W5Hl6+
         df+qfu079F9r5UuHim7EAhTYGLRXgKV32v5TpWQIWvuMg/RVr+pfMTEy+QKxhTrlbeAe
         EznQ==
X-Gm-Message-State: AOJu0Yxp4kh/UP1I1sALlc6MPXXVjdeOeghmEo9VXJ5zi+Q6Q5ThrOa+
	yNUFnN+CLF8y7eXkSl1HSMXJ2PuneLfV6nBodJi3uo5kb2I6HapYPVN0io0bPgg=
X-Google-Smtp-Source: AGHT+IGAuCccU07DZqdkiMWs0Ena2Nnk3dSiXEP2sYQH784oXf5a8ibel1CZaIU3Cgs5q7SC+nXlTg==
X-Received: by 2002:a17:902:da8a:b0:205:68a4:b2d9 with SMTP id d9443c01a7336-2076e4150famr25682015ad.48.1726120568364;
        Wed, 11 Sep 2024 22:56:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:56:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:19 -0700
Subject: [PATCH v10 11/14] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240911-xtheadvector-v10-11-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=R1ruP19VNMYIJ2t74sibaC/YoWJ+uh82rPlu1gqwh/o=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpljm0+eaN738l85uMF36i+LEa+wXNIQaszqzX2xan
 Wzwst6so5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIl0KTIyfFf95Nteqhx7X/P8
 DuUjS9qEgl7qbb1ybo3LoWPHqvhZ/zAynCvdIxn/d0l27MM1l1UiWNIzcuvPtW2QWLHppnzMlsJ
 SVgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_225610_342635_590D6FD9 
X-CRM114-Status: UNSURE (   8.82  )
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
index 3db60a0911df..400753d166ee 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -266,3 +266,13 @@ The following keys are defined:
   represent the highest userspace virtual address usable.
 
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
