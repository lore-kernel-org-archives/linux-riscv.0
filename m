Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF0BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MwgZSamWIuMJnNUOX5YWThlqxvPeBjf2gqaCyskjgM=; b=pH/RYNJkClYmg8
	uZv08fPzJz2pIZZ9+sepbwm3fTzYcXG1sU1U1C6KZQC88/GH9eoIgYI7yOoXzJIq0HHblLLjEyeWE
	Lliy3ZcOr40KWAOOZxy/6sRvPbMyBXJwYkyezONwCjjRCHkUXLBzG9zeZMf4GpbSqHbnPuGcefxBK
	AMNQxVNWm0HKHjnUhw1J+83gSaBa3HhMOuBKxGOzsQbX/YnH3287rzUkgmKN8F8w8fHsfg26LHLEd
	0zcIpBM8wB/kRJ58vMbYEN8AjoWq1eT8ggO6etRMYLcKT441Ollatk7t7G7xEoxv5qc4glKO+hIel
	EEKhBLg59np7stbbJlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TbE-0000000EALu-3pvs;
	Fri, 26 Apr 2024 21:59:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Tb8-0000000EAJR-3LVW
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:59:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e8f68f8e0dso19632355ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714168753; x=1714773553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TchHp9iPU+jV41Lhl65NNSkSnBIWGzSHLYj+6EVTYis=;
        b=k4b+t/n8s1aUwUESWM+9ZIEhjIAo28jtUhaHQHQgUGgy7K1D2utUYVLlaA2edrTMwK
         0KsYunWLROUIezlCNIJcvOu+aREjols5iQg6ali+vA0+zu/tBjaVCCNhCB3HOhHg4air
         7sOT7xWcfjz7yQszEWtp2IS9V6Qzy5btFUemfBORkbC2tZ/hYCI8G2jIWC5Fpt2Ypplo
         c5y64xhWbDMu3KdLWTwAnFuVO0mfOLZ4f/fBZFG2HbqXQ/KDbLzQ+QE8kZffZxtasuqp
         BIf4cdV6CSqP0fSBJb8xg7uIqKpHgAFUSqG+yxjcpDKTzOqiLNMQr+/4jDO1iOLSt5AU
         85og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714168753; x=1714773553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TchHp9iPU+jV41Lhl65NNSkSnBIWGzSHLYj+6EVTYis=;
        b=MIR6B3pbskKa60n9uQRZcUeIn7A8WQwKJLk818GUCjgryMg+pOrA6iy+/M+zlAhqva
         TzPhjrMDuPN3EA6pRpw9BZyLnimsFZJUyGKJRV1rsOcq494vdihDejAHcOiL8Ecv8YDh
         LT0OkR92pertc2eMAd31HbegUw2DxY1LbL5+u3fxY6Z3QYGagQL+t93UKzn34bGrtzEU
         21bHff9FnvveHT5jeV6Htaxun7uRgYxhMobVCvEv4x0UITRN0YThuCgiPLEkqPXZ2KHw
         01JUciBAhxzvk2R58i3HHU+FLTrEuaba7Nhe9TUA9llpy3AadO8RQ3OneWmZRWATnkoC
         QTQg==
X-Forwarded-Encrypted: i=1; AJvYcCUZCCq3iU/F+NXhFAO2xsBE0Sy0QUz95XgNVOfv3xor2k61EYymPgdqHyhGPmC3Fa585G5DykzzNJTh1Bfw8ijBv3kA76ElGs0i2V/FEezO
X-Gm-Message-State: AOJu0YyZfjJWIu7bBGz6FtUMXzXHI0z0XFQZuBUiPJotqqdfFkjL93CE
	65ArLEZEvbw0IpWZ/6Nk8vB9WtzksbceO+qH1qNiutVX1sdOhdzINjVb2cjcxEo=
X-Google-Smtp-Source: AGHT+IET9MIfRPVLQ+q19JlPHtZ5UN13lMzn5RxDFBe+dFnHx+VBL/0Yu6aR/OhMxKkAebF8s3aZ0A==
X-Received: by 2002:a17:902:fc46:b0:1e0:119e:f935 with SMTP id me6-20020a170902fc4600b001e0119ef935mr1210821plb.15.1714168752781;
        Fri, 26 Apr 2024 14:59:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b001e2a7e90321sm15899787plc.224.2024.04.26.14.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:59:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:58:55 -0700
Subject: [PATCH v2 2/2] riscv: cpufeature: Fix extension subset checking
MIME-Version: 1.0
Message-Id: <20240426-cpufeature_fixes-v2-2-7377442b1327@rivosinc.com>
References: <20240426-cpufeature_fixes-v2-0-7377442b1327@rivosinc.com>
In-Reply-To: <20240426-cpufeature_fixes-v2-0-7377442b1327@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714168747; l=1173;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=zokeLGTCizecBJ0C/S5HawdecIVVpc4P0EAGzps9Dbg=;
 b=g6HQlFi2r2iw6uPy9CCrKLJWOVB7GKXPFTWeJwWyNyzIvj5uFAh15VfM1hFJcjfczUEmHFAe+
 Jow/gSE7KbxCHuTt6nkCaxYAJsqGghfDwuEHkI6U4tRBKzhfP7i8M/4
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_145914_969874_B7D2F10F 
X-CRM114-Status: GOOD (  11.33  )
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
index 500a9bd70f51..e53deac701db 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -606,7 +606,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
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
