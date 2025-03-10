Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F68C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jU0T5QkEr3232RN3yDhzbxX5XeNOIdmcHfVs2jzrTyQ=; b=xeNqY7cj9CGFiz
	7BZTso+v82w52E5yrkFSJb+2Y9SzEHu4pakevZostSpRX90v9uSFHztmyGNv7RRwdT25KhLfiM0Wa
	i8wusjzcXgyBnRw0R5W7OY2wvHBr179Snam//IrRoyTGNoaRQO5NlFh1SK493twPepWFQUlCrKcEy
	0/Vb1NdzCaFDEln+YzqIinobWi4gJ2ofHxk5J7ppcB18xiPGDfwwJ7UfcIuLgGkOu0DDmau9RjFoT
	QjRX9tjVXuWRoOzw1QjwTkk7jU0bRC/azsxmpqpdsGRkS4sLAodQro/9E45cbUoMBtI9jabvUkHDz
	AoKK731dhVOgYIn+X33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfGr-00000003DDx-2QL9;
	Mon, 10 Mar 2025 15:42:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treUg-000000031Pu-2byj
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:52:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22359001f1aso104774875ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618358; x=1742223158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=TAeG+eQwzIREj/gfbrOXihZZTmyOXkY5Jq729zlXc/UWI2XjidfzXFmO6fsqiUPHPK
         Vx7p381juMeHOXDXRpo7wD924rhcBC6HOoMj8aQw372glV3kutbkFYt/WHS2AfflAO4L
         QRD9SBKiMkr1taVFSPxflEZk5GY5ORWS4ckA7gngjfZfu7EvPw8EnZZQ8UsQrvmGciRi
         NI9YvQgm4pCjXNR1I2xm3HXqmtOtQ281jIIFCbAzK2PPUjClkYG8d1hrtRdKt8HYrBGd
         LLaUtYN5Dec9ow3o70Nq81JgsvtLHQYpTbFczmkTCvTl64NKbsBGKt3uH/vX6jipxi/P
         OJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618358; x=1742223158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=McrsMZwGbsxd0jbjQzxvoteKiwI8qy2nZGn1G37dEOCMdh35Wk+01FKMQdUOPZSuAc
         iZJ4xzk/o25EWxzQPzDzqPpr2+vFPR8mMtORJUnyxLuFQQwkJm0z5/GXbzNJyz0dsSRa
         oRn7CEKnkijlw+23mhiRpS4DMRFp64eDE9XK/uw+siTcnh262JY8RZxyPmL/UN4OplP2
         zCZmQuVRWRdzLGpzk6pkD7+7wdAQml14KaxRN0HVWnlSDo2sTObwKYNpsdp/CIHAOAYj
         Ml1NWtpQjxE0/NFGkPmOvcdHIfesDP6MsAYaGRm1rOkkX2z6NqouDFzUZEW5a4RIHoR5
         l2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkQsSC99ec9G9V4GnIPOotX4VZ9DZhImyjrFIakO0jhIxfYtpCNkRZwevRjM5e2KJTWamcYTlxZKGLog==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBSBivRyzbu97LyCM+FcINkmyt2WLsretD0bAqu6uH/oMFun4h
	XyMz61G5q/fs6o47peNhGXe13dzX2jKSOZD9tdjzIV7KFKQLZhgNTBYxkpu+NlY=
X-Gm-Gg: ASbGncvHREYvZFE7VZSm/gKDFmFbs4xdQ0y6ef5ja/gbWsFyrz/MCPTxaEXxCMZ+1Iu
	HzdQwIsWouxrmC9thYeE6uDCCMW75Pi4rnYNJRArSa2r1cU41ZQ+kDVv8EaCL3fxCLAO9diYMRY
	2sYjQw8UaPvTabaRwHT3bYzEoQlc+qHd0ukp0nqoz/oDnfKLYUpi6MB8K/JmncNtOec9V65eVGq
	SzYPBJ3UGgjRiOvwVn/E/wN03JYY+aKvAHGCYZiXrTOFvw9ScDvy4avsU+PZXScL1ByyNA6PkEp
	dvdlvI/q1VBIF5mwQQUmFJZZk6BzAX3z5OedbjsARXMwqVdyF5JoK+M=
X-Google-Smtp-Source: AGHT+IHtkwbPi3YsMJ6A8ZQyEy1VJS3fRxtZo4fUkREMtAJmz9IifioPXZ2s22L3uz4hyDnWUTIX/g==
X-Received: by 2002:a05:6a21:2d08:b0:1ee:d687:c39b with SMTP id adf61e73a8af0-1f544c37a63mr24132640637.7.1741618357489;
        Mon, 10 Mar 2025 07:52:37 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:37 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:24 -0700
Subject: [PATCH v11 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-2-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_075238_669498_F265B3EA 
X-CRM114-Status: UNSURE (   9.59  )
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

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..9b9024dbc8d2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -426,6 +426,20 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
