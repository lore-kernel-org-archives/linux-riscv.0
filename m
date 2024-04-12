Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EC5C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SsHdhedh6Sd9zpTu9GQsd5yZnOPzatUdNfnNzGfcig=; b=er7OzGCbT0T2Xl
	wkGKYCTdIL+cCKhRmFmZXWSaHN8pTS9hEqW/2bqjXMThS+FO+ZGD1dEi2w/QBcB/n0EwyqUYPZZ9a
	+lvpNl4l2tNUxxVeavJk6Kj2ASQYkdpGJqTVnO/nMd6Tx53lvB82iDr16Wx+Lskgm3BoD1jIP1quD
	W240lqdPMc4PD+2TQffoAaliMPU+f46/f2X0c4/UPHZy3zrzg5fcbbXN21RYZgSE6Ig+9N51pB8Lu
	uk9VFs5t5iyhJzoPuO9pDQQ5yE4dJjSuYkamgfRcEOjPCTIMrWCfAMJpoDvFj26fUwzrI22IuOntI
	nTklVYn/RL2IDXNglolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8H6-0000000FAr3-41JS;
	Fri, 12 Apr 2024 04:12:28 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GN-0000000FABz-39ts
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:11:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6edc61d0ff6so505143b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895102; x=1713499902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wB7ZUsYFAipUnqatnSlT79/6WrFmpwXquit13SzfcsE=;
        b=pCFohwP/pKWUdym0eW8DTZMKccjSaY/OCP1uqi830phi/fDKrYzpoa6VsxeieBzfs5
         Mt/pa2p0kJQUXwgMLDtVtwPrgC+MH/BrsgO+hD5nDpLLzkGlCJXye3AbTzI4LbP/umPR
         X0jP7Dbad4wWBV6r1RtIznwk3CajeFhcF9zldg85vhFQQc93tq2dKcYOLX/PQuO2491B
         6P44zrpHZUmZQJFfJIw2zrGF3fDrKl/SdAx3BZMO7czdEIjf618wK2QVPd9aTJiKUxj/
         B3ZdReQgjPdIFlfSMLuPBHplQDePh15r5ARmDWZzjCP1IsqzOVMdR4UD+4PfBoaiZn6a
         nJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895102; x=1713499902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wB7ZUsYFAipUnqatnSlT79/6WrFmpwXquit13SzfcsE=;
        b=L0wpBKFHwI7+UqMGWAOTWZ69MwI8cosWqAINvc5gLPjLOO/x5Mtzc1yWVbAiP+qsoZ
         u9Kzi6yJK62EXCV0lhPCBNrED4mVmd3U3dRUCKDMkJn4DuYBxblxtJBGQoj30a4S7kqR
         vCKX+8HVaqmtb7J7YhLxnBpXUrkpZSvBCECJkxQaUcEuuUdAH6we9DK9MJ+KyjGKW0Uc
         F9OgLKPVh6UMS+mprGKvHZXPQ9Px15oNTjmBLeyrt5iUh8PPJUdGqkgK8gNHXAY1GCWf
         jwayWBFPbv7+S7Iapwv+OuRFmdkzWPNfLPRYOCO2r5r/aLBkOBzAaMEN07LHTYm+fhIu
         wnQw==
X-Gm-Message-State: AOJu0YwvSh1SMaytaQD3lU/FOvj6c8kJliRFG0/WSp3aKdvmVPIdy55l
	MgXKr2rPCHWAHqrvJamkQUjvvhKwNLAsYvWlmmoZEH1n02Rv1pDfJP6mhvUjpNI=
X-Google-Smtp-Source: AGHT+IEbXTdjwKLaPoBheBbgei3pXYbfSWchIDinY7tvcECrUoBINHI4reVXQnWJo28mfWEnV9kXkg==
X-Received: by 2002:aa7:888b:0:b0:6ea:bf1c:9dfd with SMTP id z11-20020aa7888b000000b006eabf1c9dfdmr1790213pfe.27.1712895102592;
        Thu, 11 Apr 2024 21:11:42 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:41 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:11 -0700
Subject: [PATCH 05/19] riscv: Fix extension subset checking
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-5-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1009;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=WDb56Qzs+x7qgry7ohRR7vfqZXbErIkQr8CN2awdr1k=;
 b=DqPs9x4+xKLxKyU/GrR0haiJT1ooRWwhD1976AoD+11P4Z8zzQJKe+3G0zIGEYtipbwIx+Bxe
 QzUI0P7hfTcDieR1B1pNbhgYYul8C9wqM7AqldfpgtiC+2APKsFh8HR
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211144_035994_A3B4ACE2 
X-CRM114-Status: GOOD (  11.91  )
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
Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index cd156adbeb66..5eb52d270a9a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -617,7 +617,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
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
