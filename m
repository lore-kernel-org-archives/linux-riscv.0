Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0FAC07E8E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkrIW5L3v7qYVUyiwLB6CrXTiqGBuPWwCEitANeE7B4=; b=gzGJPXi4pntRa4
	zVSIAQTt2AkBqgWTxrpOWkSyPAeoVkB+J8ahyC1zCJwpvPnQpOj/nink8bakcElvPQRTrg2VGIWvG
	OQOc5dsU8iaARVwtmVrDxLvgI/qW1fLPpGRJMhRP3Ou9Lfx6yDrHA7y+vYao48lLGAhZSJPCF5nTd
	DMj6VAmznQvQxPvssZbCwgK/9NCAqqemxVE3XzgXcsKrlTxNj4VeDqob1CVXelre/AzLv/ruQaMlI
	RRZwITDq+VOtGNMMt+v34++cHvUoZ/CUYjNiU8WPixfuh6li9MvhsOH6rge/dJPinmfRw6qwhOLWq
	/gsiNrdNumeTJAKC+YEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzfNz-00000004viB-09Bv;
	Wed, 24 Apr 2024 16:22:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzfNu-00000004vgW-1nTN
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 16:22:16 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2a519ac18b3so67882a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713975733; x=1714580533; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/mT8dYLNNDcBxpI6RYoMuqc0Mj6CDLobboyrOMzI0o=;
        b=KlSQu8E1t+FK2BglMNY2Crk0hUlWo8/fyv4mLGJ1rulEGmD7Wm3vnFW9gsqy0+Tz03
         oc0Bf3z/3hYZAQKUSmIKPVFDKGzo28FhykuH+ELzNZiG7mk7RnSOQEwJxKjm2Bbf2WaI
         O61IMj6adJN5IUwEKfX+X7GP1An2DarprygSkZjaBvlcmT0IljBMSZUxr2JTK2zmwtK8
         QuahSBv1l/yjfZtHm2bv/OWUnWIrsDCnGxQl/353Bh37dkOXZhd68JQHbM7hoPBdY4Qn
         X+quYe84O9+FAgxuX7vSvmTxcVvWtd/FXFQonapKGGum1nAAzb5rDB3fEkypoHSoq1AD
         RP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713975733; x=1714580533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/mT8dYLNNDcBxpI6RYoMuqc0Mj6CDLobboyrOMzI0o=;
        b=agOH3/HsNIaSYdSE26aMPZDTE39d5ADtGP0LdglPrHQIlYrB8V4cWIS9FbrIMsj0TT
         yNLmcNfZQl7afbDUGp7B0KG77rjcatVIln/8BLT3q/YKsQ9jCWD+Hvf0DNgUOlFqTscV
         6OeLVTaGUAsp38afjWYha3lwinJZS+f5zAlcs9Ec/UMpou2izzsYcUGF1c7IqdlZmIVG
         9mohUA4sEePVjqwZZupr5Jfs7k9fvpjvY6ME2aS1fBa4SnNfxowp7vW6W0BS43fINmy+
         UInBys2NuilIbX2QFclldOnzUqyZUUyYht0pfjEkyXSFUs/yAL0Z18j6f2EFdSJaHdDg
         1D+g==
X-Forwarded-Encrypted: i=1; AJvYcCXbAAsErLOlu0kfnC/8X7NqKVlKblMd1tKmVkwdSuKFKRvsT1/y6J5NAEWqAz3pYF+RfODEp/KEro7nrYO9qMRKOM2OmBzIi17Moe61rY46
X-Gm-Message-State: AOJu0YzzovO4REqWDxOUJCGu5mOrj5U/RevPkUOZnt2N5M2iS2WqDooR
	PhxOxCbipOge4kLtslTZCXooArBTD+M98bfZpto0t5meYU24Yss43UgBaT9GGng=
X-Google-Smtp-Source: AGHT+IGMumjYf8mPlW+j425B4XJG0C/FHdcbATybQFw+ishD2opGN8n3uPWhego21AWcmcCax3AHhA==
X-Received: by 2002:a17:90b:68b:b0:2af:3088:e36f with SMTP id m11-20020a17090b068b00b002af3088e36fmr2212404pjz.7.1713975733147;
        Wed, 24 Apr 2024 09:22:13 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a17090a1c0800b002a610ef880bsm14505760pjs.6.2024.04.24.09.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 09:22:12 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Apr 2024 09:19:55 -0700
Subject: [PATCH 2/2] riscv: cpufeature: Fix extension subset checking
MIME-Version: 1.0
Message-Id: <20240424-cpufeature_fixes-v1-2-585e73d2226b@rivosinc.com>
References: <20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com>
In-Reply-To: <20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713975728; l=1120;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=RrP4p1oOkU3DSs5epOmV4/BbqCtTpx1t2NayPBKRDTg=;
 b=fykBMmNYGQRbdKCnZBCBpAC7r/ZAcCVj+foxhpZYBt1r8uQQCIiAPcxCl/E79KO5e4NqinaiQ
 KxWiqVn4klhCdrNlU6ZGZ9F6O2RPTasya1RqwpiCLfDAjqIoRlwDu6r
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_092214_540768_7B694DFC 
X-CRM114-Status: GOOD (  11.14  )
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

This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
than if ext->subset_ext_ids[i] is valid, before setting the extension
id ext->subset_ext_ids[j] in isainfo->isa.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c6e27b45e192..6dff7bb1db3f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -607,7 +607,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 			if (ext->subset_ext_size) {
 				for (int j = 0; j < ext->subset_ext_size; j++) {
-					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
+					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
 						set_bit(ext->subset_ext_ids[j], isainfo->isa);
 				}
 			}

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
