Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEBBC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRHrc2MpnfGDTUFrhC3VGh2fvDhfdtI2LuklsVyRvhw=; b=ovPcvOw9+BJx2e
	MG2jJDaYDLcXF5OvQgHLp+qKimtkcEr3b6KxQB+5aiiEVVvWVj6Al/hV1AqarTcIIGDYvrEVRcUhD
	Y52EdFQECC2YDhlXXTuygfXfzI5FNEHms8OHb1/MX3uWkew6fZSEbMn5lOYIzHlC3pBdekLxBd5pP
	pCk9IyYnTiVHUccrj9S0r688JkkXSGUJDMUHQAzJZe7EDrHHaJoDIPGYMwqNHKxcaIrr6zikqAnPg
	/qb3Tziqkhk7/AlN7ZPXbj+7DBrdjjgszH7AMk7z3XdPOjrCkqNM8VHU8JbhNCwtf9vfQ+t3aEcX3
	fu/yc8vgc5GgBUYqVjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01hO-009Iix-L2; Tue, 29 Nov 2022 14:35:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01hF-009IZK-HF
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:34:56 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ho10so34286906ejc.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BysgsltvZHQEbka4m+WGk/CR1Jp5prfGKuxP5ujDIrg=;
        b=dyfGBebhUYn3USFzHyJFj/EjOgmg/tmg+H7Kabzn5e9oZXBoUnMh6fe1Didry/KAWp
         sJjKOmp9RPcAZab9z4HQqEtmNxzeHsZZkfCLBAqksVAPw6+UrWVOrMGzJSetJiNXJ0gZ
         l9lE0Yz1cW9I/+OD8Z8NBwWOBhepApCStPId/r8JQCtdyQuJSsYsK6//5070snYXsEj0
         tykkN0Vvpd8qx1HAqrbrdT7QKZFJATc3nOMZOH9+Tz1pd4dww70xv2+v+AJM5u5XVwe1
         C/ejJnwduH00sx+blwNK8dry4qY9ZFxHV3L5TqqJ+ka9sMpMMHAAn5DyGzqY4aRllnEJ
         zPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BysgsltvZHQEbka4m+WGk/CR1Jp5prfGKuxP5ujDIrg=;
        b=G5UWGUmgwNx6QN2lT6e3W2ek1uZiGtrjc5YItnRzDp6Qn7SkZWr1h++z7CanP5TLxk
         nIXjE/qBbU3a8yFjBaWoT/dWpXEogInaM/YyjkKfXm8xf0gorCep0RH6wJ/CSl8BB//f
         mMbRLykYk+qpPoDYGp9WWLez+uyzgL36irlCkSsgaUQ7vgsbCMXI3PrhcRTlJ7gBgSmN
         jRXcrTRlSnohLEuCal25SmItF6Zdntwl7AQtCU89NshbLci4lTiafsSwT5Dec6T1PHka
         /UVVHS5Wy0cm0SnGbEie9GX4KMzqvn3KMTZPlHnhe1+IDNtPueZm5/rxl1yAifm+5zDc
         7nIg==
X-Gm-Message-State: ANoB5pmZnUKSf0yF2+HNCV6MNaIvcwTDoNNNjkWjaWkWfVT/nYNksPJk
	Anyen1NzkkcTl9IY4bQNv1LPC64SuVMRMQ==
X-Google-Smtp-Source: AA0mqf6BTjR/HmsBVW0WCaxeLVy0SHaP0B40I2OOj/YtTnJKraTHIcxq8zfcJYZ2sHE999SjU/jN1Q==
X-Received: by 2002:a17:906:e0d2:b0:7ad:b45c:dbe1 with SMTP id gl18-20020a170906e0d200b007adb45cdbe1mr49026857ejb.726.1669732491824;
        Tue, 29 Nov 2022 06:34:51 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id f9-20020a17090631c900b00782e3cf7277sm6154875ejf.120.2022.11.29.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:34:51 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 2/3] RISC-V: Introduce riscv_isa_extension_check
Date: Tue, 29 Nov 2022 15:34:46 +0100
Message-Id: <20221129143447.49714-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129143447.49714-1-ajones@ventanamicro.com>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_063453_625077_88C3CA83 
X-CRM114-Status: GOOD (  14.68  )
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

Currently any isa extension found in the isa string is set in the
isa bitmap. An isa extension set in the bitmap indicates that the
extension is present and may be used (a.k.a is enabled). However,
when an extension cannot be used due to missing dependencies or
errata it should not be added to the bitmap. Introduce a function
where additional checks may be placed in order to determine if an
extension should be enabled or not.

Note, the checks may simply indicate an issue with the DT, but,
since extensions may be used in early boot, it's not always possible
to simply produce an error at the point the issue is determined.
It's best to keep the extension disabled and produce an error.

No functional change intended, as the function is only introduced
and always returns true. A later patch will provide checks for an
isa extension.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/cpufeature.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4677320d7e31..220be7222129 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -68,6 +68,11 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+static bool riscv_isa_extension_check(int id)
+{
+	return true;
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
@@ -189,7 +194,8 @@ void __init riscv_fill_hwcap(void)
 #define SET_ISA_EXT_MAP(name, bit)						\
 			do {							\
 				if ((ext_end - ext == sizeof(name) - 1) &&	\
-				     !memcmp(ext, name, sizeof(name) - 1))	\
+				     !memcmp(ext, name, sizeof(name) - 1) &&	\
+				     riscv_isa_extension_check(bit))		\
 					set_bit(bit, this_isa);			\
 			} while (false)						\
 
@@ -198,8 +204,10 @@ void __init riscv_fill_hwcap(void)
 			if (!ext_long) {
 				int nr = *ext - 'a';
 
-				this_hwcap |= isa2hwcap[nr];
-				set_bit(nr, this_isa);
+				if (riscv_isa_extension_check(nr)) {
+					this_hwcap |= isa2hwcap[nr];
+					set_bit(nr, this_isa);
+				}
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
