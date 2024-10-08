Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C47ACF042A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGAnxL0u3hW8lZOJgf3tL9oT7gmnBQdYX44JCH4/bFs=; b=GYWJcRJsvVzVmu
	XnIHxy5yJcAVEbVUKpKqkxLk4BaPoQet3cE7I5I8T74eGfzRgL5OMhfYflCrsEsbI62OT0/fDsVMX
	PYIyl8ZWbJgSF6evUFUjvUTRAPObiQn8WvFoif7smyDJt6gInfC1antg4aeqItH+CCnxRkFc7hoTr
	NjMkLevswb9UrihAAZeHMczsUOAJuFOiVAtGcI2U0rk1XNWmTn/tablOrepf1eLwgnhlGKsBAH5D/
	PRPZbuRIYpJ02Xhi3bSl5wGAZrAk6XbcVVFLhivj33qUUdvRyIvJdbiKBKQWdaKGeFG22kHUJrwIn
	2ji85c+wzHY0Ul2KhwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqf-00000007ImS-3ziD;
	Tue, 08 Oct 2024 22:38:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqc-00000007Ijc-37EX
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KtNVXjjPkEHV4V6z1fTmchaZwC5pGCKRUL8HB/rDqj8=; b=Blb+g3dUUAk8QOjq7gEMeywjFJ
	sFN0Tsbe+iCNovaFMXSCraT/LydhHTqeFwTAyJbmZ5ftGOI/IRVVCUsPCOyGG7cY7/uj8ZvB2DTgs
	LhPk2U0RhjtucdfXuTfywq2I8+HWdSQTLHosEFbBB3J9jy5/T9lHpTwRXqszQbeB1FgyotVv1n0vI
	YbVpA8ibsmt4A46IVpIKQx7sKI3corjv31gEONxXu/fIt08Jgr5wxonzNDtoHmeYalVxcQft+6oVa
	Ho5mNy7TAhHHcA7Hzj3hGxF7pPile5QnU2VQgz9wtPbVQx7eCFytMORQFrf+EcxsMbszqWfgPgTM1
	vNEt2D8g==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqI-00000004hRE-0TCC
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:38:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71dec1cf48fso3808479b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427087; x=1729031887; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtNVXjjPkEHV4V6z1fTmchaZwC5pGCKRUL8HB/rDqj8=;
        b=xOtJncPZg5YZcirWhChcFk+TdDe8sU+cf0KqPQ/ftD9MEDAN/+qhYgAfPqiW8chMkk
         V33MIRv1TRSPt6NKmRMHvsJTBHkPVEsd6wsi6zuTLwk24CePnw/MXxraZob/Ar5wUilG
         JPBXeTHjae81gfL2Hv9xiwtr6V5FN+WmeJd5cYKs/yuNr58/xIr+OIjN2H6R7cu2NMh4
         2eSjIPpPDKUkd3SdoPdxmAXZCoh4iw2Ehzl3gsFfPUsvM8YpwyXHimF0Q/0MhjzJ+6cB
         e3p0MXwy0/OaUF9bMLuCzJsBdu+LIA+XFNQN4lsgmc4J0fEf+Ntg2N4wU0rs5A+C2d2N
         421g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427087; x=1729031887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtNVXjjPkEHV4V6z1fTmchaZwC5pGCKRUL8HB/rDqj8=;
        b=o/LqToVtVh0LDMpXZBKQvOgASjus2pXopxsv4FqYCC54rXswFP0ayc2YacA4H3iQ6S
         F504vUmibiZDuCj62yEm3meg0fmEotg2Ix5Rs78l/+Wyrae1fPy/lr6ihhLTap9T+cHx
         /FxKhYOcc08wZczhUyKoJtXRGZlFiIkvnNUcbL+1ZAAitFTwPhAmBS3QPQ1bY/eQ1/up
         ajqc7v7oQt9f/mPL3rBO+iJ6Lg0gB5VqGe0AVOB5KM9XK6SgVmn7fKabHpiG/iVZZY1V
         TSLd9iuaKkwzxkkQ4KCpbuBKkD+oPLzfnViXi/kKLmYEyT6tO+jALDNf51+IOazEN1U0
         GdRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FE8Ugj5L3HAedvJ8FX0DQpFiyeUNKB9Mj8OQD6T9HyYSVeiu0ugXYPoLD6HvYz6hHJrJUW8U+8TF5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPXK6NfG7MlG4y3ObzzRkEnEO7C4jqLNeh1J1ALYZDFsdcduMz
	VmOpKvPvuN8ffTyENzzmJ61uMTdI0pkRNYIo7wFbGvHriQjbDlN52qC/jofMyko=
X-Google-Smtp-Source: AGHT+IFTRRphTHkXxNtHYde9BX+luSQbkm62edHJi19X7C1fs0jGU+IiZUI2T3klTsFQ7+LS2WdKDA==
X-Received: by 2002:a05:6a00:3d51:b0:71e:f7d:5c64 with SMTP id d2e1a72fcca58-71e1db648bamr555718b3a.6.1728427086877;
        Tue, 08 Oct 2024 15:38:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:49 -0700
Subject: [PATCH v6 07/33] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-7-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241008_233810_331385_A0D8376C 
X-CRM114-Status: UNSURE (   9.85  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
