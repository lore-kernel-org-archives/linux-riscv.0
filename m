Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6542C5AD49
	for <linux-riscv@archiver.kernel.org>; Sat, 31 May 2025 02:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Dgyar06uV1fVzYX4suKcMO2axsUvhRvq9xPcRaFn3o=; b=cWuZEkbqL7SCYO
	1MuCQZz6RzgJioQkSxvmCF2UiZFsxpfBTIAWc8OvnZ/UBcB1rJTNpw+UNgBqELxxI4oT34QWjOf6l
	RhnBwHqo6TPIwlsagYAmc77+4Ji3I3D0/857jCOLAdR0eT9XXN2KLkCtqhQWTMaK78E3HjMr2H0B2
	+ia5+f31W8XCuaG8xfmGGcZsfgpDb18YzlHkDY+mHOaW9zizl3moe27jxUhUy7iZsnRTFsDxUmAv/
	iGRRy6i/IKcr9nTSbxqrz/BGrNDs49yMjcbJ9yTD0/+DL/VHAhFXf+Xt4a71lax8XsNucdp06GTuN
	XWbNXBO9hMbOC+BseVkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLC4L-000000037DP-1bwB;
	Sat, 31 May 2025 02:35:33 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLC4I-000000037D2-0XJD
	for linux-riscv@lists.infradead.org;
	Sat, 31 May 2025 02:35:31 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2345c60507bso17863905ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 May 2025 19:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748658928; x=1749263728; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eE5K0L5UOR+5JNlQQlydEE5dD8CmoS7RK8fJs2wf7f4=;
        b=RlDjZiwAj+HyPbdwy85U6d9Z8+katMhxH3btHh8wooyGuh0GJrCv1n6oc1BQi9Q2GR
         DjQKGe+0nEA/JHNTlxM0/fuApYYbX+Mgfo6ONtFFxAgCo9aD68cBYTbhPeXEUvBVj65z
         TulN9PZ19YC9Q1yq/Mf4z7KyDO/49xpodsXNskuAcTkt477bzUK78zpYf7lSrg7OpLxZ
         Kxprs9rVFVJSgdMd9exfKUUWHNMJfASkpebDA9F9UXFV4vmr2CHBeHxLXbAIK5Kh0n1U
         awUOiLKXLsRy/V5UqIX1Yo+sdPmmd4kWagOhzEy56KrGT9rDYebJl4g/zEN+7bmwecWH
         EP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748658928; x=1749263728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE5K0L5UOR+5JNlQQlydEE5dD8CmoS7RK8fJs2wf7f4=;
        b=fw0s3oTtbq8XnJeAh+O5gpgnEKoGAdT7mKOk9fQDU7NTRqIT3m6gf8baTGcC3zduak
         AbbSNwGkOE1qXXR4pX+sQ9bGTgjckkU0J3Q+NC9YbKpFfxxPE4KjeNDKEckQWlpFLNZq
         DWjYCVrQxGGYPTaYRo/aiZN6J4wtXFIOjy9zBn8ybqTPAM6+oExMZ36b9OKclYlEx0mJ
         mfCOzAIRvlUkQ4qaWB0R5PhehR6nBehyhgqT5vV1DL4BOWxiaL9xZaA7PNzRVX3BrDvP
         oqojkQQBlLyL2u0NuJ4E/oRpMD2LL3afttCZjad8rKvrMKun/D2VI49QQfeQDPs0GU2z
         3gVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLAQx7v2ve9wlCl1kihL6XiN91+PMip9IsyjzrAQtqW9EfHONXCSmZoH2oS4Mil3Hr1vzv2ptLOQR92Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZVzmuW59tHm4jS0RGYGNsGewXBodSv91vTjNpaDNLMEwY6SJA
	HwNYOTY58RfYUb9DS3XfZ86DA/oY7qcC06bK22lIpqFdQEFBIGgT1yZKi9Vmfwc4hH4=
X-Gm-Gg: ASbGncvGluMrTLk4PpGaVqV/D64102Gkhr5sv8pS/k41aYA7cz1J8qLCCe19eKZFo6l
	OVoUx3xgzQoFFJ2tN8RXP8pLb4R1YkoisV0s5HxqjUhbf6kpieRa7D7NAELk8Lrd6o3MQDMaf/j
	POT1vYWjv2katqTDf/geWKqGjvpHas2ckt95hcYexJSZOl61BWnPAskA+JAZipLeYE3/hQ/NCOS
	99H3dFfSkntXuGYSc1T8lKXZxMOCWCIl6jMIvxGf5M/puF4mkCkXp6f9L1UcVXhjqfCy6RJid1e
	Yz8dUlJFl0E0xDFOSpTrmQ8uctk3igK5TPvPGkryHzBBNh9LkeDNFPS33xLe8uY=
X-Google-Smtp-Source: AGHT+IGW8UsS10oKPpjE1xfc7ciibqabZN7gXwU4acZF+4/I7AVDG1ffygZZnG/vME8UIUnKm+s1oQ==
X-Received: by 2002:a17:903:41d0:b0:234:f182:a734 with SMTP id d9443c01a7336-2355f74fdeamr6962905ad.31.1748658928518;
        Fri, 30 May 2025 19:35:28 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb049e4sm2146976a12.6.2025.05.30.19.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 19:35:28 -0700 (PDT)
Date: Fri, 30 May 2025 19:35:26 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu
 kernels
Message-ID: <aDpq7kqJUyAjad9F@ghost>
References: <20250530211422.784415-1-cmirabil@redhat.com>
 <20250530211422.784415-2-cmirabil@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530211422.784415-2-cmirabil@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_193530_414245_3F101255 
X-CRM114-Status: GOOD (  33.81  )
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

On Fri, May 30, 2025 at 05:14:22PM -0400, Charles Mirabile wrote:
> the `__runtime_fixup_32` function does not handle the case where `val` is
> zero correctly (as might occur when patching a nommu kernel and referring
> to a physical address below the 4GiB boundary whose upper 32 bits are all
> zero) because nothing in the existing logic prevents the code from taking
> the `else` branch of both nop-checks and emitting two `nop` instructions.
> 
> This leaves random garbage in the register that is supposed to receive the
> upper 32 bits of the pointer instead of zero that when combined with the
> value for the lower 32 bits yields an invalid pointer and causes a kernel
> panic when that pointer is eventually accessed.
> 
> The author clearly considered the fact that if the `lui` is converted into
> a `nop` that the second instruction needs to be adjusted to become an `li`
> instead of an `addi`, hence introducing the `addi_insn_mask` variable, but
> didn't follow that logic through fully to the case where the `else` branch
> executes. To fix it just adjust the logic to ensure that the second `else`
> branch is not taken if the first instruction will be patched to a `nop`.

You have an accurate assesment here, I missed the zero case :/.
Thank you for fixing the issue!

> 
> Fixes: a44fb5722199 ("riscv: Add runtime constant support")
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> ---
>  arch/riscv/include/asm/runtime-const.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index 451fd76b8811..d766e2b9e6df 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -206,7 +206,7 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
>  		addi_insn_mask &= 0x07fff;
>  	}
>  
> -	if (lower_immediate & 0x00000fff) {
> +	if (lower_immediate & 0x00000fff || lui_insn == RISCV_INSN_NOP4) {

This comment is borderline too nitpicky so feel free to dismiss it :).
It's slightly wasteful to have this check right after the if-statement
that sets it. I am not sure what the most readable way of doing this is
though. What would you think about a patch like the following instead?

From 1c56536c1e338735140c9090f06da49a3d245a61 Mon Sep 17 00:00:00 2001
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 30 May 2025 19:25:13 -0700
Subject: [PATCH] alternate fix

---
 arch/riscv/include/asm/runtime-const.h | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index 451fd76b8811..085a0bb26fbb 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -179,12 +179,9 @@ static inline void __runtime_fixup_caches(void *where, unsigned int insns)
 static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, unsigned int val)
 {
 	unsigned int lower_immediate, upper_immediate;
-	u32 lui_insn, addi_insn, addi_insn_mask;
+	u32 lui_insn, addi_insn;
 	__le32 lui_res, addi_res;
 
-	/* Mask out upper 12 bit of addi */
-	addi_insn_mask = 0x000fffff;
-
 	lui_insn = (u32)le16_to_cpu(lui_parcel[0]) | (u32)le16_to_cpu(lui_parcel[1]) << 16;
 	addi_insn = (u32)le16_to_cpu(addi_parcel[0]) | (u32)le16_to_cpu(addi_parcel[1]) << 16;
 
@@ -195,6 +192,15 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
 		/* replace upper 20 bits of lui with upper immediate */
 		lui_insn &= 0x00000fff;
 		lui_insn |= upper_immediate & 0xfffff000;
+
+		if (lower_immediate & 0x00000fff) {
+			/* replace upper 12 bits of addi with lower 12 bits of val */
+			addi_insn &= 0x000fffff;
+			addi_insn |= (lower_immediate & 0x00000fff) << 20;
+		} else {
+			/* replace addi with nop if lower_immediate is empty */
+			addi_insn = RISCV_INSN_NOP4;
+		}
 	} else {
 		/* replace lui with nop if immediate is small enough to fit in addi */
 		lui_insn = RISCV_INSN_NOP4;
@@ -203,16 +209,9 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
 		 * is performed by adding with the x0 register. Setting rs to
 		 * zero with the following mask will accomplish this goal.
 		 */
-		addi_insn_mask &= 0x07fff;
-	}
-
-	if (lower_immediate & 0x00000fff) {
+		addi_insn &= 0x07fff;
 		/* replace upper 12 bits of addi with lower 12 bits of val */
-		addi_insn &= addi_insn_mask;
 		addi_insn |= (lower_immediate & 0x00000fff) << 20;
-	} else {
-		/* replace addi with nop if lower_immediate is empty */
-		addi_insn = RISCV_INSN_NOP4;
 	}
 
 	addi_res = cpu_to_le32(addi_insn);
-- 
2.43.0

Let me know what you think!

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
