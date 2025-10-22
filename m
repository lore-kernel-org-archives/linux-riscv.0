Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412DBCCF9E4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 23:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIlt2CNg0VXwZW3+RJ+sl9tlKN619kGHlt2OEkJq2/w=; b=OWHZcwfX4byuQ2
	6bLVYrJg0nmQPcgZBnyLLTRUTPBGMadYoIbX0yQMfflGVJKetWtdC3+nJYVKATWi0QT+vlqdSfSte
	MqnXuMwEjfqHIeO4XcKDRZjOL7F/NqFkvOHIJL5MjUhiMVnTanunxAbTsvj0oFC6AMUNbSyLK2pHe
	xa8/Qf0Xs7XHl9ReQ3vnqzQ1hnruii9pk/Vv2oeIoj//4kOjM/UxHBg1YFbRRzSe0RbdWQNygxfCE
	gTtcaNgchptqKnzvjqWapr88D+/yDxuf7vLA9lPg1yG2ymDvdaUKHvaeii0k53mL8vrRFIuw3GIF7
	jB2Y5knLnpNBn0LPufRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiH4-00000004YCO-0vi3;
	Wed, 22 Oct 2025 23:29:46 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiH0-00000004Y9A-20b8
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 23:29:43 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7a26b04bfc8so213790b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 16:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761175782; x=1761780582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=KJY+kVYDuyqFkTeX7Y6mikL/JuVWZ74xlpPnfbm0P29DzeYtQA/6918ziq7YkEqeVL
         qZbBd3o8Vqx6UDKb8QOoCXCTUtqDm7sk0hDBQjTMIV5t5LFmDj8xkknk8QdThOKhbjTq
         HVfMYuwnqZHmszaQ6OU0Bzzg5qgoexpeOJTsdBz89y9Lie3FN/1TJA+Z8zxo/Exhi8Zy
         Fo/ljdbCE2HcYszZQ10UVZen2m82ZE7qbiAkYXbj3tJi8Zq8g9UWWDwnefTMKs7zGJ1m
         1Spedd2F2wN2Y7mj8ew8nmPn2w4xq18t0bE1G0ypDJoL2Nhe9FlI2mBrRkxmvy+8Ci78
         NPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175782; x=1761780582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=UHIT2wDvhp6mkWsKJFlJw0RMdlSCMzYvEPWIqp+zS6MxqfAJ8zIgOmvi6PHSVqFKzz
         w0anWNO3ph1ewxVgBmpU0h+Ug47boYsFq/h20o3arp+cR456N5jLeC9AqIAvw/bSfFRd
         bZ/7t2axXB3ar72jjXUuNk6EythbWE8G1T8iNDRonkt5IfduH4fzUH1C10pzVrCv1MpO
         dJhIUaEap91zVyYps/z1Hkl8+mve84JEvmcHookcAG6lghwTVyeZr5ldNZv+PaTiTX8p
         odSN2mzQVz2nV8mGZKPufC6+RhSGwcWY0RvhKL4XAwwCbavdF1xWb8uobj3sLAwq4+Ke
         wz3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgDebrZyI/ghuOg5wYyIiljTrLpeaT5w3Y+TZ3jiOK/iMHQSuHx+GtIaHBzu7rFz0kY1c1QY47ezLJLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz5i7T8AoPzS3nFuPyB5i+zzP1aNIxsCN97N1W2DUsTGmDih2t
	rSwxVi+MGkRTpUyzRkNEY1fUFNiu8iIwgyH529+SIdiIqgW/FjSoiWGJdGPfc0ZuHAc=
X-Gm-Gg: ASbGnct5nQQ6rAOyTgxaWSFtPAY9HJzwHKAu2G3EbOMc2oWuMehhbs6DIm4971A/tbY
	eTPJOW/eWnF56rUDIoyYlFAsTOQaWMfseIJjSaX7N1XJP9NPWN1/QhhJtyQMDA1FlXENEX5NwFf
	U8/yWkVzCafYvQv5cZZdyzWcim6dcNTm/D29BqDQXGvoaTuCTLORSgU9xwzCMURI0ZctzaQtiND
	KgtmIKka+jWq057P6dIlj5FGEUSQR82auBgKxNlW2tawthmBiasvZ2Qdajh++nMp9M/1oiayNfC
	I0+MJVY8ZHQtHnrRO+ilbmBAcdP872It3a6GJYZCVxaOgjthw+rQ+pBx/w8zmecsbKtAfrjLXl/
	oc52bTZocTb0Sz8PRa8cXKTj0UN2FbxKnTfWozVKfUi0xhqdgy4NjmaqxscDZEYeuXgxtK9de//
	OZkRipO9XZ9A==
X-Google-Smtp-Source: AGHT+IEmNDRmBGQ90oJZVfBuso221N4gx1WrV0qlXlFna773Bu+yBYH9fzM5J7wk1l162T475OZz0A==
X-Received: by 2002:a05:6a00:21c9:b0:781:32e:53cb with SMTP id d2e1a72fcca58-7a220a56abcmr28815176b3a.2.1761175781543;
        Wed, 22 Oct 2025 16:29:41 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc12b2sm392646b3a.67.2025.10.22.16.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:29:41 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 22 Oct 2025 16:29:28 -0700
Subject: [PATCH v22 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20251022-v5_user_cfi_series-v22-2-fdaa7e4022aa@rivosinc.com>
References: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
In-Reply-To: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251022_162942_524340_EA89E550 
X-CRM114-Status: UNSURE (   9.61  )
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
