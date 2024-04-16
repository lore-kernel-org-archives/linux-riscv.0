Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0950AC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Uce0BcXNRHEUa1K/3DLH/K/P3elf9FxykYjmtlwUMA=; b=tQo4/coOvkQKk3
	wz/6inOZcvTdzv1AP6xaO6RFLtmstXqOCGhlYec5gQ4j2KAhAUkykXBVDmIBMJMxo5dZa5iA5sTDS
	p/Bl/OLE+FLAqzU+J7VWL3x7RAYV9rmFihTG6wf6AWNNaVZNxUu9JuQuXZXhfvAW8Q3OyFqyZoZQO
	zthILlT659Arxm4FYCHYRr8WeEm0xG5ZHsMVmc8y686yBhE9MCrDvhnkEf2i/rLDTnMK4OWQs1xPm
	K+ie7FckMtUC5JWV8Tw3gExXSlTmZP9rCwn2EcTB9WSogPb1YsCgHESpKCMljh4z9zuvZpgwfitWZ
	i7d2TfeLqJ6cI3fqdUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwbAW-0000000AusO-1EXH;
	Tue, 16 Apr 2024 05:15:44 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaB0-0000000AkNj-2OvP
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:11 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-22efc6b8dc5so2760744fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240729; x=1713845529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVSzHGFLNnrGti654VC11tvpK1bZGKmyJ0hbbIeQ45Q=;
        b=125lqb3M+kvkVkC+8w3ZKkLif7XX/zfbuyGKmJCrRHH92Fx0rnUHiG4OoIBlUugQaJ
         Edpt5wnKRAcGVszSBntGl9zA3JxznSUgr1WD98SWUy7Y9tYwq8U9iRrB68rIrbNPOT0k
         Pe6416ELYsYFWR6YGPqOsuIqiHcTIq81Gr0+JnBN2WxP5G3XykKgQPFn9aZjZBuBslUI
         wnGqzQYoCpuXa7TNA2fNkrvnrNsoDhvEG1qBzlSKi/aWcWc1DkZZx0FFFmauwaSnF+5D
         kN42KX742+h7X9c641GT3w5c8H+M5C0EUgxPlXFO3aiTe7NOavztCM/Jz+wwYcBw7xfW
         PRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240729; x=1713845529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVSzHGFLNnrGti654VC11tvpK1bZGKmyJ0hbbIeQ45Q=;
        b=AgkMkhlXi4OIxm6QHNJOsT0111A/l8IcJ+clfWVJP6dturTbBGO+MNdiNqlShFU2xl
         rJk1ilKKJHWs3lW9pRQBZ01EFVEQdEAcjH2MMdyw+0Rn0FJ0mlpZbza5V9BADM+0hxKz
         +QIVJ0+GNX7AeKlLzQgWHIrkdi89Dq262wyPqp2VSX6hHP15WEeYjNxMu+auU0hIVCqb
         KRn13CNAdwu1y2lq2og7zrjQQwO0rcrmkdtmeZj/ihS2cjCmDdU55HTRj0q3OxHve5ck
         shJgzIzHOV63cxtze8jLlcbPC+UnvAlI5mCm4Se609mo0NIIyJG/+Hho3JPRoU7ycZYQ
         ObTg==
X-Gm-Message-State: AOJu0YwCwCr7zBK33EjfT+YJWET96rZ771jUQuR/g7+BBILtRnXqARIK
	ENz5e3Ey4w8G5clF63nwxYR1UYygrDDWoph+yOVmyRdOqqvFNuNwVmTD8njWXgO3s5RuZTFHRwF
	K
X-Google-Smtp-Source: AGHT+IFZkd9NDeZNRCG3hOkxXiBzQioQ5hVlHYi/wzn2zrou30bpeRqjwOjjzziMFEa1WsZ5xhufcQ==
X-Received: by 2002:a05:6870:315:b0:22e:8539:60a0 with SMTP id m21-20020a056870031500b0022e853960a0mr12983308oaf.46.1713240729449;
        Mon, 15 Apr 2024 21:12:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:02 -0700
Subject: [PATCH v2 05/17] riscv: Fix extension subset checking
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-5-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1065;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=m0plhmdNbdmA80gesn/7KnCdXtvm5F7fdW9kC5KptxM=;
 b=7DRonXaAgLJzhWvXE1qbRYS0I+BfU0oGsBOBG0My2i8BWoHww2ZulgK6Ne5SIPj9jjmGT1fAh
 WB/f+iRxM2uC9jcfHku9va0/Bg5wWaTVh/Ak3KRIWgDEL+7zSph3JfU
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211210_648669_9917E2D7 
X-CRM114-Status: GOOD (  12.12  )
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
