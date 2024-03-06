Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6647C54E55
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYRWCLe27HG9aNimRIlulGh19swqovIzRlEsSD8T7n4=; b=IKKhEYzRuf8gdM
	U6rv9PR/0BHbgZWqUmcQ2ckVFO6+v8Vz8tYCcwz4gM2XBDH7IIF7m1OZfOnicpqA3DoNrJsqeba3L
	XidcoHDkaFdHAtO6MyTxegqGf+wy5PqrqaCbeiKLYBXcHkXfGOFDMdRvqbrIkOHmJalaMy/n8Ky/w
	dUsT9wHgNNMMz9+IiPjIGOXF08H/tF/YZ45Nxm5wi+fH9tDiQR1wI1WB6Cnab4mgX+lL1aHWvFQ9+
	fbtmM+9tBwTnY5q1bVW2WDfcMzBip+ONMmclKVo5wOjmM/nIA2EtkJZZVr/mHbQn+soJWcckm25fc
	O6AgthweZxcnZPBhcXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxVF-00000001jrt-2g2b;
	Wed, 06 Mar 2024 20:04:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxVA-00000001jou-3cUb
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 20:04:34 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dccb2edc6dso943515ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 12:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709755471; x=1710360271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8i7Hn0NjGdBjABWwTPM97LUVWqQ4V1pWIxyh4e32z8=;
        b=xKDoryT323DjR/j4H8aXSBOLqD8v2FX1DizpubC1pi1+2Pktrjuq/pSdE9tMUht1G9
         2FvPG8YhKTaunS0wBLiWFMF/9ylEWuhCkYdU2JDbfky2NNSIYDUMbqt4vb7Cfxq6R7RG
         jyv7d5uxeu8NLda6LGOnKC2bccsnJwJ7+Be2UYgG2XqwzGKAUf7PRrMVEBpKK9Okh1ta
         ZmPakOkhg/PvJ892gf8/+3hpwmwaS7/LeCqUoZIkjJ6JrJ+DuZaw152bXJK0lvZIFvYk
         nNJtTyV7I4knlkO9ZQQl5s1/70A6c2Amk5e/A4cRZLdNUf5i3EUvR6FiovGvapudu5Fc
         FL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709755471; x=1710360271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8i7Hn0NjGdBjABWwTPM97LUVWqQ4V1pWIxyh4e32z8=;
        b=sDovoFRNif48miMaoh3D3CdIcI3mE2nNLzM0yroEJNJSPTzJyGIDyw11sG67UeYhTY
         HWFVTopJP+QJqFZo3h6ZeyeOmn5OQ2b+eCAS/0Akt1jeHxgFTmYW6OoPmX3oPlEIpyIa
         1CKlOlqxGQ17pTDZH+69bvZc+jW811QzDlZNLtsXnYAhqm0/Ruy/GEBak5SL/ON8X2G0
         /uWmqb4ntgQrmvbq1U7Fdwe0Qkb6YfR+ZSNLgiW1p8eUClfqeOFbMPZb1Q6VOKM9//IV
         2+HD3uSTCltRxeBb8QjXJg5Sb2JXdnm59+XOfPP/znV/xt+N7Jfy8czNVWPKVosAYTE6
         b0DA==
X-Gm-Message-State: AOJu0YwMabryK9wwXGbRXLMwpMAn1n1sVErljHJsoVj3MO1kzAqkr8U3
	UK7X+wLiup1VqnC13hJSxMdXJ7XtRh8oTmQL4x/82Iw+o6EXgnKySyiMRqlo3wo=
X-Google-Smtp-Source: AGHT+IFiTweil7aQBRcwI+7H86suc3cGJBwmzJVih/YHjqX8u0RZZY9V0G85J7qj4Q4zuaOUvEoKZQ==
X-Received: by 2002:a17:902:f787:b0:1d9:8832:f800 with SMTP id q7-20020a170902f78700b001d98832f800mr7051856pln.8.1709755471482;
        Wed, 06 Mar 2024 12:04:31 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001dd42bbb08asm874913plx.253.2024.03.06.12.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 12:04:30 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 06 Mar 2024 12:00:02 -0800
Subject: [PATCH v7 2/4] riscv: Only check online cpus for emulated accesses
MIME-Version: 1.0
Message-Id: <20240306-disable_misaligned_probe_config-v7-2-6c90419e7a96@rivosinc.com>
References: <20240306-disable_misaligned_probe_config-v7-0-6c90419e7a96@rivosinc.com>
In-Reply-To: <20240306-disable_misaligned_probe_config-v7-0-6c90419e7a96@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Eric Biggers <ebiggers@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Charles Lohr <lohr85@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709755467; l=985;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VSZiKx13zcdCVDYwqIRzCcJDp79icXmI6mc1wjrw+wY=;
 b=J0jL6+8JqCrPcSklgw9NSjUi73EcQ1W43bQbtjsgXL78c2d9/VwkDRPZmyz/8+75OR9dmiASR
 BogsnEbR27ICPcusENpMNmdyy8SN/GRLOuSHLzCSpXseFkTsqmzXnz5
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_120432_998060_E088FDDD 
X-CRM114-Status: UNSURE (   9.33  )
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

The unaligned access checker only sets valid values for online cpus.
Check for these values on online cpus rather than on present cpus.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 8ded225e8c5b..c2ed4e689bf9 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -632,7 +632,7 @@ void unaligned_emulation_finish(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
-	for_each_present_cpu(cpu) {
+	for_each_online_cpu(cpu) {
 		if (per_cpu(misaligned_access_speed, cpu) !=
 					RISCV_HWPROBE_MISALIGNED_EMULATED) {
 			return;

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
