Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED9DCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIlt2CNg0VXwZW3+RJ+sl9tlKN619kGHlt2OEkJq2/w=; b=ERMfjQ6C4q3Kj9
	HlPCBM6E2dd65IJIToskT3RWlFoxgOSo7a2InQq+EmWqxDNHVOldsw6zwFqNaw96FNDly9BvcUKQo
	vBL0EKglPv7jsp3KfX1TOopLYS9RbtBjuLbrxxFO0VpijQ19FBuCwLbNzRbLdunxxmimcA6WhciQ+
	CjsoX1bF3aBsw2yNDg01EbWDVuzJFD3qtBUYtLVKeZ3jAZ949QyGE1LvdA33pINpJRncIzINwbsve
	Eh8T5dNMyjcXXpHj57uDYFy8UbZv/IrywhU+Bzy2ujIXDvcLNSbEl0Kalsbxh8VXAKLvX3HsiTxb8
	8O5Bofo6nrcpkQyykg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWT-0000000EaJh-393B;
	Mon, 13 Oct 2025 21:56:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWR-0000000EaGo-092j
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:56:04 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33274fcf5c1so4958605a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392562; x=1760997362; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=BDuAipZwkTnldNlapa43gQRVcgiOQHN/IFx/N0z/BDKRqMkEFDF8aw5Q7Y2nuKZ97P
         AlblrWkELDJPv1FAcb3hvadMk6tTLWFZJps7Y0DzEWFj+vnOnpX7DDLSnoJPbR6TEaJz
         UakaiiPWOsa2K13K6mTLy68ldfcWElZSGy9QkQjM+wP2RKqwwuFg4z4dQDUdO07Ypy8U
         z4WeQWMKDqCXw3MmwnmnmVOUh61IUMdIpHbj2/7iITTfeI9ExEirjjsijfj7coOFgbiq
         E2Li8P+p5sJ/nIsDTzZuGqVMEWDzPfRX37LZ+BEV2FY2694H80mVFZGafKvv/GBN7ANY
         x17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392562; x=1760997362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=IxEC7QfXjh3Qgcju3yrSTR7HyVPrBaUNvTsw4OiFoCf2S7tCE0U8ArJMjClCfRowQ8
         dUq9L0xjX2Hrt/2K3MJzxUmYeZGvRzfTAtxny0yrs0UrHP6s+M9tQYYzdGtAkAKJz9qK
         h3WDrd/Baf5H4Gj+j2M5Al/bcDO8yYe5bglltKPxtdHX2AxqL0QmPi1u7Zg9l+ZAuSNN
         aXhPYSurshMJZAKxtVFYgv+cchp0X+Ar3YmPA5lE+lWzZMD+lzWG6p5KhHX7aRnqNJmC
         u30zdcoOI/C40Efsm69r5RsYA227aZOGujTM3+8CTj6FJOZfscfvtzWefrNYFmuSSEdj
         N6jw==
X-Forwarded-Encrypted: i=1; AJvYcCX9H2zljwiPtTwBcnuFdk2+eo4vDjq52q65nWq/OPbhKAmR2lyN6/9WGFjsZkkgqgdM/L3OjGufoRSm3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2fj7hpmuBm0Gp1lY2/bEExOoSt1FAbDjFtf1t39r4M6Q98xjj
	pLlskL8zDzNAtb6Dlh2t9Qx0nUyYT3Ssa7tArLi4UZmB90wlgYQMhj9iMuVrBG/jpWg=
X-Gm-Gg: ASbGncv++P/CKNfkRSCJDo1gtkWafL9op4mSvZSN3hiY/5IQ75WTICyIXVbXFswP8GD
	6VXqYYmAS29W1qzrKkCAkv6tLVF8Zj1SPchuyj0xxX0S1tCucMfWL7J5eVsyAPezLf8Z5SXjT0a
	qNLkkJkMDjO4beZ0pDsdxu1BSD4xr5uWJIOhfBbyRn1+bJRAcw7G+WRqdBY4cHUME2pVN5kY84K
	ybI8JiBd2r9muLVgIx1dD3Hkmwg52bk7ptWh5oDm/e4zXV/MyUeLknDgsWnzMULqr5SoAlK2s38
	xPd0FXEzjJ9wDyWtGPUr3gIS4Nk8EBbdKB/oHIZ1Cearl7n/MVuR+r6jJToVS8Qz2AkK0rbpuVg
	iRr8Xaq/XiVz8dXgJDmIYqGbY5C96viLRXC2bYJLvc6B3cmb+Vn/QjL9NzDN/WA==
X-Google-Smtp-Source: AGHT+IGp2pHmwU1UwjR7VWVlmD1Zgem8xnSW6VcNxKOg/UKV/EDFr/tijHZhs1T8DdSJm+2/ITobLw==
X-Received: by 2002:a17:90b:180d:b0:32e:3686:830e with SMTP id 98e67ed59e1d1-33b5137586emr32096496a91.23.1760392562315;
        Mon, 13 Oct 2025 14:56:02 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:01 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:55:54 -0700
Subject: [PATCH v20 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-2-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251013_145603_084938_A726A0BC 
X-CRM114-Status: UNSURE (   9.28  )
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
