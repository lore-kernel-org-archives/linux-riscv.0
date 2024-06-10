Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0E4C27C4F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 22:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myF+9jRF9rKKa5GviqunaO7TJgnPFgH3/6JAF0n/BiY=; b=bL4HVvlE5LXVrs
	qxXdq/V0Xou0AbJNSA/iBPEz7QIRoQqIlqbVnD2qwUOIYoqupMFtBqvnY1X3u2Ljl5E6IkKa6G9Jq
	hQ8Cy/hiB8LX76qnEWUO2iGxvcEnzBvZCtmtQaikM1jiQCh5IyEgvFzwEJZsjhFAHaulEpQUQT2yM
	2TdHH2rJ7SCqb/UpCLbtzjczM2As5S+76sHIaVvxFv+hx8fV40WT35Kkb4lQRx6CqcRRg6D6P/+Uz
	ASLW58us2PwX7AEESTCInl3WgAmwYhFKN7z34YcVWPt1LRiKUQW/5+hb2iN20hzHvOWCo24RDQTPR
	MacsQiuqA3ATj1H4uPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnxA-00000006jxY-1n7Y;
	Mon, 10 Jun 2024 22:57:28 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnws-00000006jhG-2nhD
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 22:57:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f7274a453bso3744165ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 15:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060230; x=1718665030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8BieCexzaDREgF6SB/4DhCje3SwtC4a6MLqQwsxjuQ=;
        b=bP8LsAXjDl9kAl4URUBWBqKDsU2A/3huVcBT0Ro8iMYU4tzNCasUl7QcgAdv1Po/43
         9kZY9ptsWlrkcAm54UaBKpx3678ZbvtQzSnoCkkiTMtoDrYuayrev2k8bCyhiqWs4lwp
         Ns7ViwheZiLVE5erOKJDJ40WkE33MmvO58BRkmkiOLnMo5S6naYFdQ60hI491Qripmcv
         6WXFO5V1FrHFwAW4AOY6Z9EmpvTJsRC2LSjsM/alwYno0QDSFKdcuJYkELyoAO6v+C9q
         +qIvtQqkjSilgO1w6qqhIWWEzyN4mfeB2iHdPnhbsY7bep49nm1UYe4FiId9hJT318Ik
         VaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060230; x=1718665030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8BieCexzaDREgF6SB/4DhCje3SwtC4a6MLqQwsxjuQ=;
        b=mVfr1cjHnY6tLniSkN8rUnWhnZEaxfdjlOzlU6o63ANyiE38Z6nvyR7HjQjcrt7BO5
         qWLyvzQwHp6LmBlRQBT7MLTkemRrsXYGFYupHuDfdSbvKxVRJc7QFKxds3k6iAKiqTbj
         gsTUavLm6aDZu73532Gh0bcp5WZvvf/B8fILoanOB+bVwAwukNoOcTsD76XHxu4LXzLf
         J++KU6OAI9HQflUIsM7dYG4MVSm2cIk0Qm3Ju65F6EhbaUUSq5HYDalqFDieJMOzUyCA
         zpcztufieQgPnzWa7lKhPlozs/5Hbegt+dw45lpRvZnquejkIyTXrLeCHPQfRWzQK7v+
         gkMw==
X-Gm-Message-State: AOJu0YxDAKIMajY087Ol8JOzUcfw382AHFsPFl8ZrV9xx8CuiiNvhGN9
	6qHEAOcDs5rfN25K0bYTfGpCuYPvW1pR7wj0iI1MKZg+gRN5qtxH8MjIUnClYPqenBDZzEJL0ZS
	r
X-Google-Smtp-Source: AGHT+IFz9vtXf5e0aEV1kuFGwIdEBaQ9jNPXflxwrEiSR/c7uf4L5n+hy7zOGF7s5B/7ltU8tsmhPQ==
X-Received: by 2002:a17:902:cf04:b0:1f7:26f:9185 with SMTP id d9443c01a7336-1f7026f932dmr68716645ad.10.1718060229608;
        Mon, 10 Jun 2024 15:57:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:57:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:48 -0700
Subject: [PATCH v2 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240610-xtheadvector-v2-11-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=1250;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FGQxjkKFg6ikcL755lFMFBnsaceTJTK90HJM8u9R8ek=;
 b=8Jye09us6BGw0+GT90JyFf5B/Coarcsdhyyne2ijzLW8oQNtKmUdJ3Z2etU1E80MtSToWDYJY
 NmJCjTuWVUcDEhoybVbz6T2CJmAUWhNf0+w/qoQHK3c6gHVe4xXvoyn
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_155710_839956_E8222D0C 
X-CRM114-Status: UNSURE (   9.29  )
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
