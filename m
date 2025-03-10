Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23738C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9qkzKsYDwROP0gsq8WnWm/7dIGk720AEL3lnwUPsDE=; b=VNHPHcZx7zY+MX
	tEiNPbLmC7163+TrEARcpQDaWYV49sTKDmQProISdd8PCmP1GEisLDiR9x2tzzG4npcK8CuP+reKl
	2Cv6jd4FqZQ7ISYBzOaYTLJ+PYdgyC4Oc3ab0SbztuO+MJ2cXK2PudUa4exwsDSW8qmxtoiWpx/Um
	bC+HWakIJRu6dMzvoIPAEVwQz/NizHO7yJqG/Qt0wp9ON5paipQBqnpsi19XL56/EU5GyTjj3HYdp
	SeK6tafW7k9PhwYCqvHwjIGa+Qt4HVLUjjekXAHferWR/swUWQ9dTlPFo0OfPpBO9x2aoj1KRapf1
	4Z1iu13ucowLL3nl1OQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfGq-00000003DDf-43pA;
	Mon, 10 Mar 2025 15:42:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treUd-000000031OO-33rG
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:52:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223378e2b0dso62364625ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618355; x=1742223155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ADFXc53D/cc0VutYfr8tgUjvI5cmEZUhOUtSZhfaHM=;
        b=bVc4Iok3L1cqWfJRDu/H54+a6HBjz8RfIBxYcGuziCPxVMu2vcI9XXjwYk74FIT8A+
         dYQSK0fzdPALX+IQ5bSfqoOX6YxN5zYuARDJLMmYgxE7YDbjsFcyt7H+yb9hT/hfXh2m
         fLmYay0/aApu24a4xxBWS8auBNIeHceyzkI8GFWwL6iXdDXJkhGtXpifFjRD7S3kk+LU
         di17FHe71EVFWRo8sOPIHTfmafs0d/t31dVMNK0emLapf9X0JlrmwILBA7/J6NbgHDFX
         3ruPFybuTdENeHuF9TTZbM6MbWtuCq2b8Jweehak15BGDab48B+LPjhZMjoXD0OBqsz4
         7YJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618355; x=1742223155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ADFXc53D/cc0VutYfr8tgUjvI5cmEZUhOUtSZhfaHM=;
        b=vgvsk/fJAlNSWCZPvOICCvTKjFFtJ4n+Q8vFwp+bN2QYif9bRcvn2kfdwfbgohG+uY
         le1D0JicNrFulaMdr9Xb2Li8gexWG878kBJSk3zH+wFiMOtFnbnEtQofQquoOzkHv5iZ
         pDYC8DNSnyRxJ8Xxv8Ngy3qgnJoltAEDCSA6HNZM+iAazU6vpXRLtt4zsuWqHxoirthZ
         pwH2WsKQ/ZAz0jcyOkoTlkWi1pbrDB+mHIM5X2ZLqI7jJYm9XAuKBOcf9+YtYizzeZLf
         u34Pv7jOnA5NFDXqqmwYeTpHe8ie2hT6e0Z6vlPlinzXBuv4JOOFDZrm37W90nj8nKzX
         JiCg==
X-Forwarded-Encrypted: i=1; AJvYcCXqrQSRHbVD1dEoMSAm692nsTO+bRlzz4Ubj4PWfPTZxcrmOuYBPTgVG0pCfduYRih52WW+ut1xnjnzDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8gSswURhi8A5WC0BUeLdx6cZLJxPdUbgZZ2wTJMQqVuHYtkFk
	plVjun/757IfXssK8IoasIr2mVVJizOl6C4Tw51vF8r8zRieYnu8AQwQ+Tt2ESo=
X-Gm-Gg: ASbGncsjgWSi5bbKq1TtHojWu0dF9Iuf1/0TpuO2Ep9XbUYs6EAu87lB4DD20auiKHB
	8iRO/E6Sk/I3YA8gOVJ2cgkA2k1yv0m0rn73vFhZ67CbtULXvTc9i+jWqVCL99GPt6sgxGkPXgF
	G6/wSWRGxGWNa5ah7rHpZqpn9ZWxgcv7xgRNKcOyx46qRGJ71Yezs971WhnoTP1RywNV89irz9V
	n9PaOFY9cZlTFoxzGzGlgzle5z/T1W4TcFUbJgkErD2a1A413ma05iwTkXW4LjELpmuGco+7MpS
	IPrVn5FVBX65SS43lkdmGn2Af+9txXsL4+Y6TByYJyk8byeHRfOILWg=
X-Google-Smtp-Source: AGHT+IGmALl7tE1vDAuhwzUIZXgg+Q9w22Wqj1GO54eJLmN8OylP52nRYF70/T1mCfLbdEp2H00RTw==
X-Received: by 2002:a05:6a21:4606:b0:1f5:7df9:f147 with SMTP id adf61e73a8af0-1f57df9f49dmr7380018637.40.1741618355060;
        Mon, 10 Mar 2025 07:52:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:34 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:23 -0700
Subject: [PATCH v11 01/27] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-1-86b36cbfb910@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250310_075235_775979_E3FAFBAC 
X-CRM114-Status: GOOD (  10.23  )
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

VM_HIGH_ARCH_5 is used for riscv

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..1ef231cbc8fe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -378,6 +378,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
