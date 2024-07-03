Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E5BC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myF+9jRF9rKKa5GviqunaO7TJgnPFgH3/6JAF0n/BiY=; b=LNZWrqkMTcvdKu
	Amm2DosLpldhYtKK/ScJfI2qBJa7hy6cPswbXqESPTPcuclOmGhxOx8aZqdwrQ1qOXPyNR1Kf8YgW
	oWCJ2dUn28M+Y/uOoLygXa85mIS7EmrSQykR3PpLp6PsJeSJQBqmlmZsxI1wC9KSsLSp7E2/Ncz5t
	d9mfBnoEZBStF8oHN3x3+MTuaPkafl3pAvYzVFgOo9rzpQcOxccXmgWVd6wK4vgPrHkqprTiySxkd
	5xljqqMirxX1wrx85/RtkBYZMItfBd6eSBOQvSqucpglAfi/DJiimq2z4FVqZEjyOz8/pZpEOnI/4
	iliRaGzqjCT3oWZ3EYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszt-000000098AX-0iJS;
	Wed, 03 Jul 2024 05:57:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszq-0000000987H-2jon
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jul 2024 05:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r8BieCexzaDREgF6SB/4DhCje3SwtC4a6MLqQwsxjuQ=; b=Zm9RChboCtd203uTjl8DCEcX4F
	0qPWQH5JKRyoMAqKUOm+feE9A8MiwcbszR2A7MrRYnwITlF9UKSQndrmNb9FR6p3ICVtjAldD9Aot
	BVFFTQ1np7sSkliljvw80M2tl7CFv0YCVtmUFAPhGHjXiQql0oJucCIiBF6c6aLi+yBzy3DfYLkQK
	GKIZGx9GhzuYPwsfUB7vF6EMe/uWVKActGx/qbJXhHr8CCQhEgay1bTq+gL7+tAkNuywbtKVBRD3x
	r5NJKuk4/Gf9E1ODTZbGHTuH8CqT+0nRPuyzUPoxx+WrIOT4SERjlp43OgAwHJbJfYd2JzBCbl790
	1VovvOUA==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOsza-00000009vfa-3wq2
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 05:57:31 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso3519216b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 22:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986238; x=1720591038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8BieCexzaDREgF6SB/4DhCje3SwtC4a6MLqQwsxjuQ=;
        b=GWgeYZ9C+fNjQXpss0Dt/0RLh19DpOmYm/g4E67X62YQH5Sjy/Jawv0H4pu+4eZYJB
         SMWIhp+jSAiW8yoid+0XByPa1iIL7MsYcSKFsXb91j8hO5vbwlxFiFW9qGQNIr2NQ+Jg
         CaCw+4lWqfDxX/x+XJ9SAE5mS/I7eIfzl9VUTg8H4VpqowQ7m9RmmLQhjD4Zv/zKCnWo
         glb5f/QLCAoNrawQbjFq/jpbyLXov+DGvLJ9tSU73i9esJvlSE95bq0Iqc52j6SCn613
         gshId3BjzswZIrLt/gEvP4PJxIO8WMWQs0CZ9t53vcuiFBXv7rep8N6bGkgnPbp65e0k
         gOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986238; x=1720591038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8BieCexzaDREgF6SB/4DhCje3SwtC4a6MLqQwsxjuQ=;
        b=uLODN4l6BBOMHYClR2QESaI6ckNRuX7Y73w/NBeUi07WCSzwEj2xQGVsqGgicdfvER
         iKwbV6kDfQxzV2k4deq94BC0EIgmP9pFRFpKt2Mq7UORqdThOPeWW2lKl31/iEPuZS7H
         pONAMsiVTsknqsZCfForBWOhEg0hAQhRcQ6Js0iKkyhNBaQ0FeZ6EQsoHvc8W4uOj6TR
         l/IhaZRLDgKHS6ulNKNxXkBfncIitLsqf61kZ6MN+8uRsU64mn4AcUaac1WAU4HiSkOZ
         achvtpfoj9VluRfJfMemT9FP3mLdaMgM1qc+gDcefjphd1RJ3qrEhmFt43MCgUhq/g40
         CKIw==
X-Gm-Message-State: AOJu0YwAGOPbF5XvFW5d4AzWa5ttFSbPwzQtEbedH6Oeq7hYB7W0HKgL
	olSC/EODx/Ut5Pk0vp4ExOOkjpqju4P0uR8hOHjFBOtiylDSSG9EfyAfn4lv/M8=
X-Google-Smtp-Source: AGHT+IFzvdI//RONmUthpW+hRWa51qcRYfwcsRmaIZeDnAw47D4PCUBSFePGU751qqoEQDHXwWFdIQ==
X-Received: by 2002:a05:6a00:3c85:b0:70a:97d9:5b9e with SMTP id d2e1a72fcca58-70aaad356acmr9691205b3a.10.1719986237704;
        Tue, 02 Jul 2024 22:57:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:57:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:31 -0700
Subject: [PATCH v4 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240702-xtheadvector-v4-11-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=1250;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FGQxjkKFg6ikcL755lFMFBnsaceTJTK90HJM8u9R8ek=;
 b=sIDrXUBnETGRLfiW3zt5N5JYHfJry51btMZGlC0y5DhEnENP8D39rrbQ3DrevQRN+apvrPhel
 LMTH3ygFemNAAJ/z4MibYy1lGR4MHQXOubOgGbmV5dOQelLGlVHepXR
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_065728_879748_DBDAAC19 
X-CRM114-Status: UNSURE (   9.28  )
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
index 204cd4433af5..9c0ef8c57228 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -214,3 +214,13 @@ The following keys are defined:
 
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
