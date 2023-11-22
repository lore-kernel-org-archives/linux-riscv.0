Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F57C27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 23:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+tR12fS/Q6uOptjz1hDctuSv3cCxGS+37QVM9Nyuf0=; b=mqE8jOZyHViOh8
	4kgeCsF1BHISzuAnSk8gMNK/b7lQgH8gnJxh/dDiuT8ymPYkJAy4SfQ5diqN/oAt7tNLS6D3t9NpR
	6j82YAHwFgVEDSFWawxYADbL1lVinKQIFGkNnDvoaHJXbUiq+eEX8U3B4mbrKkd1G22aqWmFOH8pi
	QzbnYla+pijVAUtWO4gafGiBcK68ie4rAZcWz2BWd8ZG1/phGpykDCMxMF9lS4rhJVpCHxRnjTCYM
	perIp9T4lgLS77x3rpckzAliEZcfk/YZN9poOSIOZ8nHMqN515bWUKKK/kxYfrLIQaJN8XfT1toJe
	jL1WKEoNd3VXOUaWRMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5whi-003Jco-2E;
	Wed, 22 Nov 2023 23:32:22 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5whe-003JaI-2j
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 23:32:21 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6cbc8199a2aso317188b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 15:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700695937; x=1701300737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTOEMFDe24CcawDbpqI8rRhvGeiKsZMYCpriyAZ9TQI=;
        b=RjpPpSqN6gWx/kxzsIWVOMagg4DWCZeXQ/apGE4b0KNA6s5aspVWaJ3NqprOAhJN6w
         ODo6b2hi83BkNHwYMWBjUJ5M4d+DI7btB0rd2MFK7LVZd6EH5lTq5WFEXGCXaqP5GZat
         BlvnY3M1z/bdBDYx9vMeFnqke05m0XEp9t5gOCHRK6YWFcfEvoPtYTuHIV3BF/C3DMi8
         7huwEYmFoFn7HrnDdExBuj6zv46fHazg/vg3TfbxljYv+oyjP8w5InSwJDqIRIYNuLzQ
         VJoFNIKtRkRNbipbd1BNdBikYXEKmVdwpyEzzTJauPoTvNGmHKC9aWwM1VLb21xWgzmS
         64aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700695937; x=1701300737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTOEMFDe24CcawDbpqI8rRhvGeiKsZMYCpriyAZ9TQI=;
        b=wQJxvX9Xsd8Eq2fQ4DGnJeiM8aOUQ+zE4F1jlG9e84WeU3MSoOX50ITElacUkXaLnB
         ve6o/gt/Px5FNzV7ObTeAdAuJiEqGtI1Xw7+AnqBSX96q2HyjBSbfZkB2Bo70A3CDlvt
         9lkK8uXUc70s2eDNOmVLXWmnGrBfeqmrKrUSBrPSN1FhzrduUZ7lWBuj27HJzUlpsnBH
         wdzVFfgWQWTkvBUamnTVqWJUI5hRJ3u85Rw5WGkEeBPT7Mc0zu5KW1/Wl8gxdZJKW6wu
         w/OyNJeEZuiIRWg0S/+DaWOA042THMFFHDbwU/K7A+nyMjH94W/9I9lFtuN1Z6yziOW1
         aUVA==
X-Gm-Message-State: AOJu0YxrydR+bHoZrOZDP4dLCbRzRkPvLfwiKcEMCpCmtNLeDXK90ST7
	4ZPB7H7sKCuXbtopnLUiAGZvKll+Opqo7s75ciA=
X-Google-Smtp-Source: AGHT+IEXMuZbVUcDIR5OaKBeEgk+i7PG7HnEzJbJhQ7rQEpMxdnnM7iLkA2DbE8LcD54zxaRSiz1vg==
X-Received: by 2002:a05:6a00:6c8e:b0:690:3b59:cc7b with SMTP id jc14-20020a056a006c8e00b006903b59cc7bmr4648756pfb.32.1700695936871;
        Wed, 22 Nov 2023 15:32:16 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78c56000000b006c875abecbcsm22603pfd.121.2023.11.22.15.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 15:32:16 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Nov 2023 15:31:42 -0800
Subject: [PATCH v3 2/2] riscv: Correct type casting in module loading
MIME-Version: 1.0
Message-Id: <20231122-module_linking_freeing-v3-2-8e9e412a3305@rivosinc.com>
References: <20231122-module_linking_freeing-v3-0-8e9e412a3305@rivosinc.com>
In-Reply-To: <20231122-module_linking_freeing-v3-0-8e9e412a3305@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ron Economos <re@w6rz.net>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700695933; l=1122;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=JEDtvtgEBmFqCKNc+NtpG6SnBh4nM+PNkCAzWthvfGI=;
 b=agKzcrFlKLjzZJouJQrrVp+E78ppa6q038/I46LaMQxzZRAByfrJC5J1zXsrBngNF8BddyoyG
 ULuT+Dr5K2OBcOy66Mu2Kl/sIi2+HtIaRq7LtTQ2aV/x88utv/NoJX/
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_153218_886626_E8DCF2D0 
X-CRM114-Status: UNSURE (   9.04  )
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

Use __le16 with le16_to_cpu.

Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/kernel/module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index fd9a5533518c..b570988e7d43 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -66,7 +66,7 @@ static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
 
 static int riscv_insn_rmw(void *location, u32 keep, u32 set)
 {
-	u16 *parcel = location;
+	__le16 *parcel = location;
 	u32 insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
 
 	insn &= keep;
@@ -79,7 +79,7 @@ static int riscv_insn_rmw(void *location, u32 keep, u32 set)
 
 static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
 {
-	u16 *parcel = location;
+	__le16 *parcel = location;
 	u16 insn = le16_to_cpu(*parcel);
 
 	insn &= keep;

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
