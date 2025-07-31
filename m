Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C417BC87FDA
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjmfLAyXP+13R4fYtCVLhSxhildOHDo82TfsOgaYcfQ=; b=frGbxAN/qrX9/Z
	dKlthV6VHoIrmDrWMkP03WGmIvGu6WgEJAR6B5K1UNc7hDfw7rvB/Ty+1bpcW2538vtJQf+Qp7WQj
	gnXfrJj0IVjQCmVX/MlHhgqz9XLU2gP6KmW1LRPJD+peY1W6PZ8ADWZOfmT5icUEWkT20+bENftSm
	DQvxz7/v4gj2KTdbPSlroHYNre2bEkjbOMyKiJjmXFVOp/jjW5OVIIxlf8vPTuc9EjmFECqqXvMLK
	zsYbstlzaRr9sopDogYbXYWuv2OhE9ilwV8euRJVptZeK3c9Ua3cnptxvP9r3kbYLdsfNWeBWXpMl
	mBtVk4kt0bXBDEBj3SEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZe-00000004bpJ-4BUv;
	Thu, 31 Jul 2025 23:20:35 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcYW-00000004b0s-3gOk
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:19:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76bc61152d8so1526928b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754003964; x=1754608764; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AetdkWsxzLbheuZJ3kb+4mhEhv1uz8fN4NCKhkFj5X4=;
        b=xYvdu1J36D8twpuam7ho6e9h03E018gUwhP+lK4sQHT6Q5HAQGG5JhrrbvMeAiKvI/
         h5+ovKGXNh24ivS2+P7a7F0JtMoIfpRMbyKnR7tNKfuwfhrj1xp8N/h1yzwJLKMkjB/f
         BEbFfSztfIObdWw2GXvzCxIptklYyFcFV0csZeama5ucZNIWpMaIlB2kUEYZnxImrWuR
         1fUKeg/YVfTQLvGPqio+b7ZsLOipiPNvmykm1dXMmJZk3KaDAovSTx4iBLaD6ztaxHJ7
         Sg8TLSOAjcbHMRn5d34jTcmSQu6ZCvgshNXkXqezIL8JSz/kuxfqBAyIWI5vpC5rpQ9U
         0QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754003964; x=1754608764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AetdkWsxzLbheuZJ3kb+4mhEhv1uz8fN4NCKhkFj5X4=;
        b=ULIKVGP5kfY5rqYARwEqk/KcerAzy0tXfR8Z4rHsyXjUm8xoZFSoIeU1ZpkpmESZ6B
         NSC5k8if1HMFp4p6xXh/UV5uoh8TY0dJ1dJNKK+MaDdxtALz7Q5ZWznTqZh+vxS7xMPd
         ONunDJJVw0sB4USmmkSZ2SmszUj82N1QeAB2GRSygtr2NJaQyXv1KfJaxF2JNevnFGhX
         wmZR8BCpZWWNeGTiI6FrZVoZL/2Syk2AyZG61BCL2OLJglcyrAX+gu8oE3Yf8wrhsqed
         0CfrsLWu14vEFi0Mab3RQep4AZ5YXzeP7nymAICOEwNsrfJgLoEbuMXcjNHS36ZFfxT4
         trDA==
X-Forwarded-Encrypted: i=1; AJvYcCXHzwGb0lLY89dMSyjC13p5DDQDyfMon120+DFo/JtG/7HR9Z0p3xZMXfoNvrC9MaDqOKIBKbe7YNhFOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjU2BRxXXxpeaUEm2gI/w3UcKFGCH44iwIK0E7ijLwe2Vz5JrK
	ua1RYksvbD5o4+ToEWrIaid/j/z1vs3xbZRw3JAOVZnLwu4wJqt0Sb2bkdIDdo7gz0I=
X-Gm-Gg: ASbGncuOv3H1stStG0EMkaOaaQY/QgZ/YmpbnuPCHun7WLpSA7YBT380zUjVPsORjHI
	Q8vWs9thcWPshYl7BlYoTvcuR7hsos0MM5BLXpDKGMzSjdV7K6pxZnk0h+VMr7iMpPXlYlNrhLY
	4z21ydzKyPOSZwIcTqPdu2SNSOYkyxw9oV0uy7b/Y42oywqN/SA/nfTQuDdZnvjDJtiui8uxk9g
	W44Xt7lt5V6quu9edgEr+Jkev7h8+0j2EsLJKgvXEIOHg3pQAxdfFTlF2suEX4NGJIfty1SPFlc
	9gnHajw/zcF979ETSL2/63s5YT9qxI5zIgsmrLa7iA6bR8Fs5PtBMVz68Q/291DEhZlxad14C19
	Tz7187VN0qL05QbxzjUzYQjuv6igaGqad+6yZIokQ1o4=
X-Google-Smtp-Source: AGHT+IHQbINJSIJX3DRCY7VWQRNn4wGJVllkshwYu6z4COruD7/LM4Lj3NJ+5unK+IoBRvria/ND6w==
X-Received: by 2002:a17:903:1aee:b0:235:eb8d:7fff with SMTP id d9443c01a7336-24096b0404cmr123206725ad.28.1754003964051;
        Thu, 31 Jul 2025 16:19:24 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:19:23 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:12 -0700
Subject: [PATCH v19 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-2-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250731_161924_924365_301BE54C 
X-CRM114-Status: UNSURE (   9.70  )
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
index ede6a58ccf53..9cfe4381f3cf 100644
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
