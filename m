Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E475FC28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 21:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jU0T5QkEr3232RN3yDhzbxX5XeNOIdmcHfVs2jzrTyQ=; b=KAQjVkKew3Gk3y
	98C0M4b3s1o1l6R23Sp9m1G3AjKoXoMAfzUkwo+N4UxukhiZ3HeGtMRqjpac2FPhfSZzGt1FoS+bk
	o1zqR4QOXTuMhk5spb0KvzW6JbgTUuk6BtxBKhlNP2Zi8AIr2cl5rLIVy9INn/Ar5QYtc0aIO34vi
	rp10a/NFLWW6MMK3ANRsV4NXjDVOBJzxK4bCJEKTM7/gL70kq573qDsLSC2AidkFozCuIX/BydQgN
	9a8TaRm1vu0PlQFFFHBNAbhrKOiTD9i32QOY+V4NdrJSL2hkIZtKN2yAB/6xTre+NOQVR/BXy7FIS
	drFxGlv/FujiyHtEPIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkh-0000000FKF0-2NOu;
	Fri, 14 Mar 2025 21:39:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkf-0000000FKCR-0Itn
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:39:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22113560c57so51668525ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988372; x=1742593172; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=wYPJBMt0khCYk46NZEo7SRJzO67og7Lbrx9ND7uZI0+vUgSCc2g04XT4uC1yWAwsOf
         2dpLllwBRW6IzwC8Dax//iDO2YQN8Lmr6Vr4oZ8yVkWlZRPP1rfVV3eAu4rUOUSZaxJW
         fomuFelKHvThbqwYGDE9yUfZ9QHbiG4TEsAz+mhLX9TEy+ccIY2G46wMmJverh6xCJKn
         e4tURJLp/tXCGfbUBVIgjzqRIEfjnJtT3nxfc694xEN+yLZuixly2176ch783Po0dR84
         XZTop1MY3sUn4mQO6uLz65BuxA6yKNahv6/U5GIorPauqyb2twAJBvzCbVxG5JyhApVK
         1dXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988372; x=1742593172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=ApUbr0Hg9WUdovXGHCPyfoy2xTrZfLnTeUY2/7gn+FpsPbk0HprrMvHasfY1LWoXl0
         ZVXMGC+mEXp0g4daXCukNfb1fdQ5mTuMe0an4BYtJppWxr/nr6PMw3iCBiMANUFBcscu
         4CnwTjKE4h1ZNBluay+gktZwyDN2ERJJYT6GzF7AcsSfE1DyfoElErptB/LhG9OV6ToR
         vEZ+kjYIC1i4RIv1vCEG+qiPEgHi9qUZG1uG5fZEd1F5KWxuR+5puUgS0KBA8HCa7/fx
         T1puIBHw5b9h1fMwlCd90jWk69TN2C82C5lly8iSANunZ0HY6A9S3xGqpqHUfAL2VTfa
         6BNg==
X-Forwarded-Encrypted: i=1; AJvYcCXF1mvBqd/SuNYy9YKTapjje4Q5V9TkhI3MW9/sFXcAyZcYbOIiavTivZ8ulb8L4wm4M46yB4d9DRoZAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyajb1puYxHZJJrvx2pwcBhZQ3v41LM04mOHX6NPCvON6mgyG9k
	BJ3u/YkNKh8bKbXGjDiMNMKreAbvkJ810uipJqmQk27shKqqUYcU5rVxQ9kZ1+8=
X-Gm-Gg: ASbGncvcbalGjsCyFxCUsQQyHE/SiaqkRQIOPSGym4vew/qGrii2KsYVW2PwXTRrnnI
	V4d4KuEzxV+Yv6KPlyDyEQxSPltATR3hLil6VKrIkAZ9DmNeJI4mhVfy/OhOzRjfe3hmG+KL+dF
	bkvzf5hn74asW7QArfSg/Wfhgb2uk2puDDcpaFy+zDb25dkKXjss3KqYcIH7bCQCvTdo4BxSFiE
	t25Ms/d1dSqUbQoq0VGUFwyf/0iav92e2oppyth8Q3EBN7wffy66QwSQk5CkKruC329j0FcoFXr
	YPLfIYAxWp7JOnJj6U62ovxhXufyFX11b0O0ppi+XFkuxW+8YK3hIl4=
X-Google-Smtp-Source: AGHT+IHD2xqF6ISXqrc66wt93NwJ9QpiMUhs8Y+9GVF8Ev9srJWeDiSZWraNiRIMMMrHSoWJEgWxBw==
X-Received: by 2002:a17:902:d50e:b0:215:94eb:adb6 with SMTP id d9443c01a7336-225e0aee9bbmr48831645ad.40.1741988372408;
        Fri, 14 Mar 2025 14:39:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:39:32 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:21 -0700
Subject: [PATCH v12 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-2-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250314_143933_127833_B3FB7693 
X-CRM114-Status: UNSURE (   9.13  )
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
