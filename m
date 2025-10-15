Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742ABCCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIlt2CNg0VXwZW3+RJ+sl9tlKN619kGHlt2OEkJq2/w=; b=IUUSH+29cot1hm
	TF9KuVLh8Pq1dDJiLSEOy3Qnd00hQhHe0HuANUQ1icEY3m2/iVJVB9/gTDnSZlkaf4wrgztjAao+K
	XpECKFUNBjCYsIPc350JMOB6EBDiOqQGsEynVsa3c6XMB88D0Wlh/97t7nb9GpEUDMtD9EYNH394a
	3OfG8327TlL3puVYUU9mdlVtI2sCrXdftSZ4knxlUNuujxv49wukazQYHdYhWw/D/XHNz7CE3FNqV
	IgF3w4TB07Yg7I7PBMCMcr4DM2mCKmPvdznbgBPw50bRzW6rMGSu3l8plku1jOGSY+fQfaCqQ56CP
	Im0hM2oQsqE2sWKrv1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960U-00000002Wkx-14rC;
	Wed, 15 Oct 2025 18:13:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960R-00000002Whe-0H4e
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:13:48 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso6731177b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552026; x=1761156826; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=GE06f947LGuA7PjUxuZwl1mqgKBqkpEKtaa3K7a6/vz6/5CpqfpK3WYAJvKmfeGnjA
         FFbr3GNpvcRJbpo9Oc8jKurkHMIg3tqgJjRoEQ4NTrgkgQ/7YIbUuiQMTWXfAcbE0eBD
         FNCNeBm5hCzb+9HpXqRkX3T2nd0fD2iAxsN66w3/y5I/IZeeo6VFxsWuBkdfpdfhjBjC
         MhRQssZinDlNcme47/00kTdOku7QgqV77zHA62ZSXbbNaVSBDNlXiV7TUb9joVpeQa8d
         H87qnGAYEgOuNJrkoMowr9Bc5qstgdyKIYtzPmqwqVZ9l1YXy/nrvokLTNfrBZOP4ALM
         1N+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552026; x=1761156826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=Ne0nAn7dmyJxLbJ4IRxKPLSPmeXelqKhxtSqCYZIlq8z29p0yfRmGVwCmIbsXzaY2x
         ostP+Esj0tDfbKQqIn2nzLfvR03lX4ejLh2oGFKHtDyPu3LfZ31dWbjpl11s/MNqNlGM
         IJg6RYtLbW1lG4F1eHgsL+/5pEWF1GyyEG//32/HrM+klPhNsIp2bxs3UQcl05wDPb8h
         J0DQlyR3kOKha4uLCxO+ScYscyTUTVu09IqekTHsn13kE2AsJrNKt89OY6v3LZBd0Xo+
         ocz4O/fgQu5Kk/0ehaOhXSAZ4yRRvVBVNfksUEyX4ZqhG98s8ehj8OBIzbJ+73XFxFkd
         NVlg==
X-Forwarded-Encrypted: i=1; AJvYcCWQKTrgMlgZ89D4+njulSEVb/7ZQ7isOX2RFFAxCwgEoIoFttSzu29fWuJ0yyw3WlbAeovKkaGxusme9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCfeQwh0xFq8LZH2MqfAt+HLd7AzQ5YXpinukjm19FC6QDUsZP
	UwaIeQgrBjw515LruZ7s0VcoMzRN57WaIq5dfVIrr6CPYietY2yCZ3wK9bI4r2NhyAA=
X-Gm-Gg: ASbGncvu8HINgnOEDvDfXZO7JH/i4aYsL1+cjaLffBLSikqj/AZDIT9yYyZf624ecwl
	LQicG8Z5fAeawJcd6vPcoDbPB/UUDMA4Bybb8cMA6AU86Pd7/Aqh/aUMEzfw18UOl0+7Mrxjyp8
	gCabJ4YB5yDMrrVkMuSSahb/Hi0SY/Fyhau3qYQEwNttBrSu6rbfTKhnaKzT888dGFcSvfVJlBt
	H1BCLqmx3hUcOqlcMGzKcyPPb1PuU2s72xH7QXRMyyiR6FLiTqGDS6yztpPoQbF1LMaWNClGd3u
	slJDyKmWNEgcpC1N5/BzVaUDb+Evzv3bRmzE+smO+AwpNkL9dh7a4ChXsBteJWhzVVUkTqDWc2/
	XxMYNYIc72MQiISQUl0sfffQBjxgdlQl8d2thaIy4Ck2aJrLlGJ0=
X-Google-Smtp-Source: AGHT+IG5lE0uCP31F892Rhz+3o+LdNX1Rw5571X/JjIijPM/WottLx6odEgFGO357kvJF6BtLvDxeg==
X-Received: by 2002:a17:903:3c25:b0:26c:3e5d:43b6 with SMTP id d9443c01a7336-290273ef107mr347052995ad.32.1760552026115;
        Wed, 15 Oct 2025 11:13:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:13:45 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:34 -0700
Subject: [PATCH v21 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-2-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_111347_115875_DD15C401 
X-CRM114-Status: UNSURE (   9.35  )
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
index 543ac94718e8..3222326e32eb 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -444,6 +444,20 @@ properties:
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
