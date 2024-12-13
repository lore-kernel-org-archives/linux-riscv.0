Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C917E77182
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1mdXhAD03p0hS6r6o8bSP6ipMIFMrSGP0tAIRR+GDU=; b=fj9g3v2ROOwFF/
	/hsJd1XRdGQsrpgwL/M4ygqaVBb0ee5fpyHfM6Ox1hE5JW+q8qUhzfpZzOSLn/6tbK9oX4QcMkK7s
	vhd5dwoHFKjkAWWsMzoTx17NLK8SVC9sq6XE8NK2yg4FNDPl1J3cWJ4rhx37Q9EvKuGICsVPHMUc/
	VQ+9qtsmlJ5iP6v6/GsWA+H9paE/Th+sBTrs7UFO9MgcydfzrSro8uBeybwjZKP8qSeKcYQwZIjfA
	RVhiiu1DDHCUrf2dEEf+EHpFm4iwRv0ElRZ7evv7WvNZPvI4F/CrUFVg6SA3T5TO919Z6HS6uDhAT
	QF4K5/UE/M4ExfCQeBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3vC-00000003a0C-03F1;
	Fri, 13 Dec 2024 11:33:26 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3v8-00000003ZxH-3Itg
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 11:33:23 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2163b0c09afso14927755ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734089602; x=1734694402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuxCIDMe8qbaOgSvtMiepAGljhokMOIMslTwK0Fvg2s=;
        b=GJkofLKRHCjEbsHEnKt45zn8bebL+HB4XVcOenxKaWQriOHZwYKZtXpCyqQeVTC2cJ
         YhwHdNW7amGwAS3WDuFC5EEkgHbEzoHIj/yDijQkwYF4dKWgKR4iQ9nNs0LQfpE8CljY
         ihsEo2re5AjT5tpS0BDFpRGOOZlsyJA2FjvSZR6Pun4axiF1+OOs85+brKRle6U58nHC
         KOIULZNwa0ck36RP+Y4CdcxkLsOUZUl4y0fLySklXSZ1V3v4jahMgf/ZL0ksQ6ueBWb1
         EYaeBLGBECHAyuby76cwhwr9FkGGY4qPYaOG8PswiB1w/w7DhQjxEvhF2xN919e93Udj
         gHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089602; x=1734694402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuxCIDMe8qbaOgSvtMiepAGljhokMOIMslTwK0Fvg2s=;
        b=cy7eyZDwiZKqXsEt13Myj+kZk8E0MNz1xAoJ0P2hKtE3nmLlyPAKaZ6Dgta3BBJYJQ
         FTp3e2xXBbCfnncvGwv7b0nYYwQ9kj3/h2pvg9AwJNVInAFhoj94tQ/cDQfljEPcApwu
         RcHlU1GcsO1sxbikFAyA6lD/GYZhRwd9kM0zP2diIRRZDLTKVap8SdNkiGC516FVUKXC
         GsUBsBdHtfNb0dnjREte7zd4os26Io5R6UhxU/y+GuuM6dA+OwgZlPd2Rfut/Zlkt1YK
         SfwY2vjdGHbmIe1gLdXWJmtNeuRIWKrJsdrQwXDOQ1SczoOy165aUeCWgyoB7NuCgD0n
         6glw==
X-Forwarded-Encrypted: i=1; AJvYcCUBvrdGoucPjP1V96Z4x3OPNQRuaUXa/Dn9TgUeCqLQNddUiKZdFyotrAOOP+Uy25WEgkFFb3wuvvTmlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq3TjJNFiLtSpAG3LWsqYoef/anVLmfosZmhxI0gQ9Mi8B82vf
	XRVzL5L+Sdu9IcFPMfOvy0atVNEyiDktX3ISHJm9PJpN6L6PaJLiSb7XizxvRPg=
X-Gm-Gg: ASbGncuK3lx7k80QcznehTUx6Z8p3C8uKTOi47KMZ8QpvuI44ZOAAosIinsFR6F/q1W
	yRHiF7lAoJVpATKUazBfw+4wBDSFTjEpnRz8bVCB4c0enkYPmz23l68iSGKGtXQVOnOUtQcDz02
	NmKkEBTfmaVvVM8Nov/7dwkteQsMWXS0bh7ufbef2FN/xRj7SDU0qIwcxB+hbgOJN66X6Pi0AJN
	evNB1BImArQas6g/VCdL3vaAmmtU5mS/YYhnQFLEEywivyGOxeePKc=
X-Google-Smtp-Source: AGHT+IFZ6i4b8fOxVCmjx+lwckw8Xv1f0ANQiCeNQYxiBu6aqzxk8+O3BUIvgfb3ruaR891H/Kr1qA==
X-Received: by 2002:a17:902:f68c:b0:216:48f4:4f1a with SMTP id d9443c01a7336-218929c3556mr29884975ad.16.1734089602210;
        Fri, 13 Dec 2024 03:33:22 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21631bd2c2dsm103327125ad.263.2024.12.13.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:33:21 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 13 Dec 2024 19:33:08 +0800
Subject: [PATCH RFC v4 2/3] riscv: Add Svukte extension support
MIME-Version: 1.0
Message-Id: <20241213-dev-maxh-svukte-v4-v4-2-92762c67f743@sifive.com>
References: <20241213-dev-maxh-svukte-v4-v4-0-92762c67f743@sifive.com>
In-Reply-To: <20241213-dev-maxh-svukte-v4-v4-0-92762c67f743@sifive.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Max Hsu <max.hsu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3057; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=LdPuysx21Ofb0xvFzV8QxmW+nt/zKZ5xS3FFhbJOK4c=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBnXBt3eMXow98+LeyNOGLt9sRJUeftUptMMHTfr
 LOMd2baOgWJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZ1wbdwAKCRDSA/2dB3lA
 vaLCC/96w2hpgaZxW2gTD9xyx+m6UFTOHkHPCwOB9gPWzgxY2+SUx/wcYgE/0qnki6dxvO1o6+N
 a/HfwfIcN+EIHHdaN7OYoZvY0uvVQ/DCw0dH41jsZwrYVsQ3KxwlVEsAFx4LJwxQrNy8LdY60dJ
 JxZEVae+hLwZeVx/SUSvJzOaJ4L27NOpqHYHY65QgH7ZIKK9GA1ZygKrV1g/kKvSmfzH3Ad56xm
 JW7gvRfQrEpDAxOlc1vr2GwzlrbbrrfWgli5HiqmnFqVQZ6SyodaYuY6N+TDzBm/Knwy8HtrvRP
 QU2/h4B2NbuNNfAsfVFFo/oySwbEsxhnRR7oYGmSWgNt6eDsGZVZiW9y7XGlv5pNhpHDsYvGqNA
 e7GIv9NuLmxirqBSseZQ+C9Yd7W4q2oSdG/LNp9IEmI1zoGDGRB/TZByvI+6Kj6iww3XACvuVc6
 NeyaIAIonLUhLS4GCs9hP0CITzjlY4DKMbut0ZR/t+ZgzDaGKMhdbgQ1KVicEZ4VP+6Jo=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_033322_834321_8D618C6D 
X-CRM114-Status: GOOD (  10.77  )
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

Svukte extension introduce senvcfg.UKTE, hstatus.HUKTE.

This patch add CSR bit definition, and detects if Svukte ISA extension
is available, cpufeature will set the correspond bit field so the
svukte-qualified memory accesses are protected in a manner that is
timing-independent of the faulting virtual address.

Since hstatus.HU is not enabled by linux, enabling hstatus.HUKTE will
not be affective.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/csr.h   | 2 ++
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 37bdea65bbd8a1a313cc7ba00b80fc5071b9809a..aeb62e9901452f8ded56961ab31dabbb2fd22cc6 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -126,6 +126,7 @@
 #define HSTATUS_VSXL		_AC(0x300000000, UL)
 #define HSTATUS_VSXL_SHIFT	32
 #endif
+#define HSTATUS_HUKTE		_AC(0x01000000, UL)
 #define HSTATUS_VTSR		_AC(0x00400000, UL)
 #define HSTATUS_VTW		_AC(0x00200000, UL)
 #define HSTATUS_VTVM		_AC(0x00100000, UL)
@@ -204,6 +205,7 @@
 #define ENVCFG_PMM_PMLEN_0		(_AC(0x0, ULL) << 32)
 #define ENVCFG_PMM_PMLEN_7		(_AC(0x2, ULL) << 32)
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
+#define ENVCFG_UKTE			(_AC(1, UL) << 8)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 869da082252a460559c9beea3829cc90860d6e9a..811c34d64df88dff116abb52e05054715a474dc5 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -100,6 +100,7 @@
 #define RISCV_ISA_EXT_ZICCRSE		91
 #define RISCV_ISA_EXT_SVADE		92
 #define RISCV_ISA_EXT_SVADU		93
+#define RISCV_ISA_EXT_SVUKTE		94
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c20e2e2f6354a3a4be1f4437f7f564..932774350de42ec9b66fd7d00efb478ad55856f4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -402,6 +402,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_SUPERSET(svukte, RISCV_ISA_EXT_SVUKTE, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
 };
 
@@ -944,6 +945,10 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVUKTE))
+		current->thread.envcfg |= ENVCFG_UKTE;
+
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
