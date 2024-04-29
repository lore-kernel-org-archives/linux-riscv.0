Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DB5C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 22:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rg6iswVWC2uSriKqQN2TMv1wYOA02lj0kEihjPAtGY=; b=YY+cTbriBX9CjM
	jDDpxPegYZYgXEenE3kicuDWvN7+fHHIXtcF8vU60yhyCsCKDuz/dA5KoLJFuT/1tMjmvmeEHA9J0
	e83SfeSPI99QPVBSMk9aT0OyxZEMmJVUGUmC3zje37KpIDEeCQrS137aK4tauAo4/pXz6IDKb6Pqn
	G9hYzTqnrc2d+oPg3yOg8lEP65g0G3tVavYWtLRrJy2Z3ldnhSX5758U607OvQCb0fmAjYkTnTk+l
	vcbumrdp6CASgfS8R4AMsKJePWq/fR1pqByP+qg4Qz9TSmagYIEfEjbEJLhBvsiAlu+OQ6BTRg2Kr
	PnlDzwYi8G3NFSP12w2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ZVm-00000004NZO-1TFj;
	Mon, 29 Apr 2024 22:30:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ZVe-00000004NVv-0EPl
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 22:30:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so41118455ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 15:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714429805; x=1715034605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aX2DfJuhjTWNBKhMnmqS+pd+lvRTTCLIsIFTFp4GW/w=;
        b=Xngcn4nLvpPs8ULdNz/tUSxswVy/jEQJLcMgRdalnAO/XlDNiKtcYKSx8hJHKONk1s
         5eyOoIImK/CZF8uav+331PBj9rfZx6YFF2uXHETDcViWKiJ8hkeZQd81HUoQkA5pc9m3
         JqUwS6F9cuyUoKHyI3KkNfRHBV/UOpTgBzZtrw1G6bx759SuS2Wrt3htSlh03s+ZIe+j
         A9k8U5ScbC5yaRI+vDQj7AP7V1iwhgPRle4wLyMPHvFgZhD+9oM6c2L/KXsA3B9t2Nel
         LhtsXjODAkqX6ejRzb2qVeZX+RnGdRFrW/k6R1epJz0cIS1pXkKrKQVE6/6t2uD/CSy2
         1THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714429805; x=1715034605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX2DfJuhjTWNBKhMnmqS+pd+lvRTTCLIsIFTFp4GW/w=;
        b=jFVO0IabDvZjd3g6C1bsENStDwtaXHNLFnuJacO12IxsdVIr+/cqqLDgCDyEAWQ4+c
         okGfcy48SkkLlJn6GSjdOviJvQG7PB8mXwFUBBWKK0vN5dz4VAjDSaksBFr4pA1EVVNO
         Wy3Jap/bEEp5vqm/n0uFc+RduwZX+E0+G/FHEAWqE1kz/7OPKLf5K/Z6UdCQ5GBrjbKR
         8URFp10AQyFI5OsuaZjASM2SjwMNGOiy0tVu6a35IKmZdE1bMD3k6gmlBbQ0S2lM1nWj
         V5ssDPndEj1teTtPoHl91waeQ8gWBBhnBm5ECDRDcTTH0FV16ChiwDaBGfcLdZlliKQ8
         JJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2xPiPIZ5FuiPtcLwjREeGW06/00UjaxCPzr0J9paxcSQCTzOnS68ttz2i+y5e8rvkPzQfFC8/AYpkj8gpOMQvC8VTlL90NEf2LG8DShb
X-Gm-Message-State: AOJu0YyMQlDMTx2tXNUV1WhTxnWJ7c0hGnEwCgne3RbnG8gdj//fc/96
	c8/qPXS+UE9gy5t4QJwIDDw0OOnT9+jOUHhR8Te7S7qSC+6F6An7DKxrqt+EQdY=
X-Google-Smtp-Source: AGHT+IHwxNeVVhhVRrTQfsymAJ/atiWTaXImzKKz16IcJH9dHlOgfRjFsDqkCd6wjtJtnoRt1L2VrA==
X-Received: by 2002:a17:902:c412:b0:1e0:b62a:c0a2 with SMTP id k18-20020a170902c41200b001e0b62ac0a2mr10454686plk.51.1714429804664;
        Mon, 29 Apr 2024 15:30:04 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001e0942da6c7sm20794013pls.284.2024.04.29.15.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 15:30:03 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Apr 2024 15:29:52 -0700
Subject: [PATCH v3 2/2] riscv: cpufeature: Fix extension subset checking
MIME-Version: 1.0
Message-Id: <20240429-cpufeature_fixes-v3-2-6aa11dde513b@rivosinc.com>
References: <20240429-cpufeature_fixes-v3-0-6aa11dde513b@rivosinc.com>
In-Reply-To: <20240429-cpufeature_fixes-v3-0-6aa11dde513b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714429799; l=1173;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=T08ZWGfXzu8lqvzWKxup1FOG2SgEPHbIfOXibfZRkUI=;
 b=fsDLorZDUM2Mswu8g1OspVSNZ6CUk8OfBnWHhbHEHmrn1zhm44AcPx9hBM+6Hl7CGQAa5lboZ
 Cf3P53ThUgGDloa52Mb06Hwze38zJRMWl4xBqxsp+n9pvZ8c5eC08/1
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_153006_138123_87BCDDEE 
X-CRM114-Status: GOOD (  11.49  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 818adb0d388e..ab683bed8d44 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -605,7 +605,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
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
