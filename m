Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FB9D7494D
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSEqvtHFVKwN+hxaHzXV+FmJE+ZQKk94mNVv3JU0Eu4=; b=bTLDEIU7iIzMZG
	9GTfAtyelUCgjPT9G5fwg3pvtt3PRRXDvQPxpllOIa9kwY8GtrAWrBtuwAS4rj1P4JWJCbQyc6xYv
	X80Zn1i2/Vkj0/qlI6evhafIMvwozwx2VJ3x9PnSomxk30OPUJ46dr2bWufgRS5fWwENDaOjDmfY9
	PtbejqWdG0++dokyd80SbhFN8QxFyR0Yntf6KOjxqYrxojo6YtgbxmnrNIJsrzBCEc27IEsUDc1/K
	yPDh4Qt2mqTuVqweQ+IuempwQbH1GZY3uIThF7srL2/9PtU/aIJk3vxVvNilIyp+YV50aqgLjYJC5
	PuEZKK6vAeUwnXWbf1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtI-0000000GDai-0cEw;
	Tue, 29 Oct 2024 23:44:48 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vt2-0000000GDMX-0PuS
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:44:36 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7d916b6a73aso3884339a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245471; x=1730850271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqlGzJEOA0rIxMbra4aAEQkUCqIib9RSzM8TmOHOkBA=;
        b=j74NB7F3slTQEIkR+9hSJ4VLUfh2tPHjO9mQwajVSgTZlKv+SgRBAMVfzA8eID0JGl
         KrEGIRvEUaT2ZFvJ5ONCBVTL0s7S8NE/cFHembJAR//Fr/GSiuxsrKgtgHAVyHTL47T1
         k5c/WDewtlYLXJvODkIpvD0RI1GNaRzISx9EFw0zLACKU0HWWvb0IFsbY74vlysZ6og3
         aISDo3R9hCbgAuYBwzIkiHzdqVXMTh5Vf1Ei2H4C+WhHMZZcyDdcFgJzYejK1oA/GD0o
         3Y/yH4vvXAtRMK9TyOiSUP/JxYws6LEkKKJvSxIZ2615F2CRZmUax0GycqB7WKyvaoLx
         S/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245471; x=1730850271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqlGzJEOA0rIxMbra4aAEQkUCqIib9RSzM8TmOHOkBA=;
        b=dhnyVGaI2ouVXs36l/aI2zTW+lckCY9iVBsSTZ8rl9jeyNvxFThA/t1VcXsezYMeIC
         OfrTU7W/T3op/FGS84QRc/WrpvCD6tzF66qGllL9Ltnw3DCCWwnbr4QTuJZCXIhe6Uqj
         NgVq74XKOe4f/ccHDsaDfDfU42eaK2MnKQykMTESUzORP205fJcc+5Fz0E51IAem3as+
         /xcPdJb6IO8k809n2OvK9NT8q4s2ZpjshcUM/3doG8UVgy/TUYwGtfcemHn6sSAkrs8r
         r+gnnzyFfV8kpUQY0Fu4vdF7s8JISX6bwmo71OyeLgOovzGnvCIhcgXsiutNE6WdrBbE
         G1tg==
X-Forwarded-Encrypted: i=1; AJvYcCWHnv5GGOli4UiP2+NZRzJBdGjXZKhagjJXQWjMrRaXXGR7gPmSfczcQvuwavm2zn4bTMVFVL57DUSwmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZhZaP0QJK+7bPJkYuQmhouklM2E2O/+q2eeBAr8QP5D3NIQCv
	AgOAUl+rNohXYDCRs4UDK0/upoBcLQcVv6oj+nuhP2zAe6LN86EHfgYCvHJQg44=
X-Google-Smtp-Source: AGHT+IHPZtS5V83Y7JMjzODTd/hxnTyAzMxstiwXVpmrwh9UhJDy1/DHcrx/nIgBTJ/vKGmAOmeiGw==
X-Received: by 2002:a05:6a21:4d8b:b0:1d9:b78:2dd3 with SMTP id adf61e73a8af0-1d9a840aaf4mr18555145637.26.1730245471399;
        Tue, 29 Oct 2024 16:44:31 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:30 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:06 -0700
Subject: [PATCH v7 06/32] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-6-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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
X-CRM114-CacheID: sfid-20241029_164432_400657_F12B2D53 
X-CRM114-Status: UNSURE (   9.79  )
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
index 2cf2026cff57..356c60fd6cc8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -368,6 +368,20 @@ properties:
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
