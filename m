Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BFCEE0AC6
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me4EAYcd13oHLmqeqATnIqo68cZZ3lV7KNCjutS7mwQ=; b=ESPz1fTl5Jhm+Y
	K/uDil0zLLipptMJ6YPwUS61YS6DbXcWuzKFRrIo4DcZAlE0bqAqVarFcjahp+mYBK/sO+hG/38Db
	fyiLF55+Rwie23b/V/T0p3cdXQBzGo3B400xHt6zeYOUw2DdMNtqaCqR3Oe70WXG8dsiu8RNLn6Ba
	Ma/56AmIfa/JLF82p9/tfCyrzgLPSDVvFbG9Y6GGbyA+35AHOSTpCOpl/UN1vB2Uxy7ruv9Zt/O8J
	aVNliDmSm6kK8t3oCtgZ3ZBk5ysa2cy2dra/4dJp+BDAtcKckQz82gR0nzYpz7fzsOUiAzIaTvn1D
	k7rD+PjvCB84gyFi70fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYA-0000000CKLN-0vTJ;
	Sat, 07 Feb 2026 10:28:26 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofY8-0000000CKKM-01h2
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:28:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a9004e4239so14604295ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 02:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460103; x=1771064903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKr9V6mOpcffHWDtL8Wcd/TDNqYsCZ2Vf53JPWeLv8E=;
        b=jkvypPaPLiNtw8eUhAG7iGZpJFRSRLk/nyeIOTmn4911PDC1xWNLvEFNRcYK6La6S1
         TgfYwtnZt/zfEU2ISd1hUR0r75AEOl3d/tq/4xwuJgh/P2Zy/c01Wq8DXR9sHy+p5AqS
         jWdRHBJ2OyLoOFkZIiMOB8fuatAv4uoOOOy/nvD8cR+qSYHw4S2uwk/5Hh8RQdW3wuC0
         O7hAr70pLapbfaNoUL686P4f08b2ve+6IPvM4b9+aWwD9JQcHbUzDNS5ywJeRbZXK1/o
         ZkhpwMeuJW6YCOO5if7l7umDGdXz4Tc++8yAqZZKefWCQKFZ5B3O5edhrePq4bhsekk/
         4YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460103; x=1771064903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CKr9V6mOpcffHWDtL8Wcd/TDNqYsCZ2Vf53JPWeLv8E=;
        b=QPiXOwwegkQ9XxpKh92eVMNfUWMnEgOJzZpg786CR5vD0T00vORuFD8TOdrvQsG+Lw
         sY0DBw7RHELO+WHJ3kSiHlJf7uinZiZGKXJJBW2tJmA5+3WlYAk/Mjy4oOWJTQXTEBU/
         bBTheLmcTdMzRGkeNTo2HSajGecBRl6heiAsOk2RTN+FPKSLOlBuLEyAa4ea0YgdbZFV
         JZ7qpfXDx6TafbtuXmuoUMU6/ET5yX4aPxP3rztSF3beYsH1X160KCkJhvQqXHZ+4EEN
         0qY7cXGAKrbXPPOWOvrli24dWAct99FOJGcD4Tu6h2adMrb6ytTCN3EIU/4lFFjWoqaB
         b4jA==
X-Gm-Message-State: AOJu0YwmLuIG5b5OpSbXSGreQYCnF7kB2Hb26H9J9adDzv6ZJCP+P3Hd
	LGIcFTtHo8p/gFaeKNzx0VAtTb1PMEyhsrp3hcw/DxNdsTSq4UuF+vsv0vdyD7P0Fd+gS8BopXl
	xgd1OpMM=
X-Gm-Gg: AZuq6aKe7LO3VJogx/jf0xFNlan6FwXmG79SQSNn4YDILPd/EoZJwne9GhCSp+Mc1jE
	N1ysjdB7y9ZxOyyAtYCTw9DdXhklMqBnM0XcU298E54TDj7HaPmdKmcliCkhnR0T9XPLWmLsA1a
	EwLZt5+qNpEJTSz2cNT6gifoXmZrOiaawITzgNAgxY9uRB/AmMR/V3sdAUFmdHzB/QN2+0KqCpk
	Eb8cNABDx+i2KIyNSjGDGoouDMS0FLDOBpby0hKD5F0NSzlTZCFhNpoEOiWKKujj3oGGqLVYcuj
	QLnDrLJrYAqX3W8ymTME+m4bP7XcQzMmgI3cHPXsvDUQL8vIBSmbENJbsf3sRqxtfG6iri9Asdr
	z7ZzYldGly/Ak/2qxiwXL4O9BwUB9HSy0WLIXjegtHU1kzr5aaJVZJ+rou0uRcKHe8c1wDf6JJL
	xxTl/2m112CXNsNC5Zltwp3EwKaHNGMzQHqzAnQVf3PYv6FlhH2Fm5lw==
X-Received: by 2002:a17:903:1c1:b0:2aa:d60c:ab68 with SMTP id d9443c01a7336-2aad60cabf2mr1522425ad.60.1770460103063;
        Sat, 07 Feb 2026 02:28:23 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:22 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:57 +0800
Subject: [PATCH 3/8] riscv: cpufeature: Enforce Ziccrse dependency on
 Zalrsc
MIME-Version: 1.0
Message-Id: <20260207-isa-ext-parse-export-v1-3-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022824_054396_DC849906 
X-CRM114-Status: GOOD (  10.67  )
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

Ziccrse guarantees RsrvEventual for cacheable coherent main memory,
a property that is only meaningful when LR/SC instructions are present.
Since Zalrsc is the extension that provides LR/SC (also implied by A),
add a validation callback to enforce this dependency.

Introduce riscv_ext_zalrsc_depends() following the naming convention
used by other pure dependency checks like riscv_ext_f_depends().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/kernel/cpufeature.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3d3af82a53250f29204a3fb138feaf520a878d0e..68c94fe29cd1b26925fa38a5c877d699bbc88e25 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -338,6 +338,15 @@ static int riscv_ext_supm_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *data,
+				    const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZALRSC))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -543,7 +552,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
-	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ziccrse, RISCV_ISA_EXT_ZICCRSE, riscv_ext_zalrsc_depends),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
