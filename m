Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F16AD3ABF6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 21:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+qKKwnytP7J2onivWuhL03a7yAcTh/SrxpxqOAqLAA=; b=tT4kkceNTTQ4TN
	nqCnzwXdzjXWkx1DZvwB9LxVoMdgCEmqNaIYn2t4G8QxvU8CVmedyDQKRDnc+I+nCVKx0M+BYk6SG
	bH7vYMfCCm3J2iq4s/nnD4aXboZvdXmOBYMJH7XhVOZQOR88h/bBQBDVnyVrod+IC6yBS2MOVtVMT
	mms5+qib9+TZZ7d9onRdbdY24jvva1LsL3E8GLceRbXrxN+OfWQIY7R5eduCzhsaOqRMqt4F6kXuL
	WyDs429n3RHiBtZw1pQN6HPoFdSEnLHQvlNjIoQjduYpAIaqtRgTcFPOc2Ddg3Ta502r050YFIPS+
	XRQv7nOOxtQlR0jWB20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbbo-00000001IsB-1JIB;
	Mon, 11 Nov 2024 21:06:04 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbQA-00000001Fg8-41iE
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 20:54:04 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e59746062fso3934674a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 12:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731358442; x=1731963242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIZVW5kCW5Dqg3JTts8BKHfPCkqfunLzJ4lU/RN+S5A=;
        b=BjlFGpUbE1ppkE3bVUdLskL+5sAwcM9ydkfPYt1bbbr6pLM7FFiD6LJYVLvf3Tj0Lc
         jOKQwKWnU6xjXK/Y2f0izxGzfYtR3YaQFPggK7DpflisC6KYa55w0kgmLGsd9ucOXuJl
         lAseGQozVvXtfZYoai19X6tah8/MSuv4SaL3naz7YTz9v1qhr293CPrkaAxJK5tU478I
         EFTfbp7qJJJTw9hNfVgTivbJjICXnR52N8sIuLXbExBn2Olx1wuxfN97VsT/zA++Uvf3
         TE9Ut2z78N+zA9X4508s4FtbAV9+j+kw5vf2PpzDY+JLZiRdndpycdLsOwGZp1CScgd/
         8TLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358442; x=1731963242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIZVW5kCW5Dqg3JTts8BKHfPCkqfunLzJ4lU/RN+S5A=;
        b=a9qJUtsyDU+YVqtPOGaDWJ4R7zd5yHqS3YZ6xflGwDWo8D+upwoHdx/ZzKj/ggHLSe
         E9U3qlxPYiraEnXsdzuEkHOGUUEdEPXy7rbzS/2/IJygvsq7y4HD4r6s/nGCmARJeMCl
         /1qHLxY7Rr64YyvB4rJv+3tE0VyaVB3RD/y+YsnB2IFlyTT24jiDscU2qnP+sviNQNiT
         LEThyKJBZD/74aMmWewMDcMJ1fqpbx+Xa0oNjEUVhLLrORjDhcbBgN+yxbF4/ygqPLYx
         QePqiURWeCFYnIykggoLeewQ87KX+YnR8BCbKbaGPIVgHX25Qiq/f4QW62MEmS1EYijT
         fgnw==
X-Forwarded-Encrypted: i=1; AJvYcCV0alA5N78WjEn2Jc1fl1YEGX2ocMgb733CC5hV8osuggckbVxJrxQw8bIPcCkLck4Jok1AIeJLdNSaBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzoO5zYiomnnIrjHDuNg2jjMmTxQiSyGq5UZkcN12TUBSEhVta
	MmQb4nqAYIw2+YzTZspu2nG1vA8N5MzCOe7EniWz8BxrTaQOAqPcpPBnzjfGxqdY38N3h1rUT1T
	E
X-Google-Smtp-Source: AGHT+IGa2fbiAJuGCBnF9rSK98Eqsv5rxxJ/njsQk9gbKD4n0fa6MYIbIMWZY1h1CaKZlLTFD7l4AA==
X-Received: by 2002:a17:90b:3941:b0:2e2:d239:84be with SMTP id 98e67ed59e1d1-2e9b166bc4dmr18469289a91.5.1731358442231;
        Mon, 11 Nov 2024 12:54:02 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm9059974a91.42.2024.11.11.12.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:54:01 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 11 Nov 2024 12:53:48 -0800
Subject: [PATCH v8 03/29] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20241111-v5_user_cfi_series-v8-3-dce14aa30207@rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241111_125403_069709_367359C3 
X-CRM114-Status: UNSURE (   9.36  )
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
index af7e5237b2c0..5fb40665fbaf 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -398,6 +398,20 @@ properties:
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
