Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B84C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEvcu3XnVwrCERJWYSpGObX1b9qncs73ah1QpXzYczY=; b=wB5WpTaZHrEuC8
	bQbc1NAXB6dFWZy4QP1uONINnzDE1bxNoqhyDwW0P93gSV63MhUGd+1+98aqFfsL2bMbAPFCMsBwc
	nipzoshG23qShF4tdJyI5BFu672TlVuWTnrdBj681tu7MrfBfXePo4g3MhzgfNj1trHE75p6/0neQ
	y9KFgOqvv9M54BmwjPUuLCoOJgiXqvOUFnmToDL7pYkGIJLXDjeX2rjBrKLLU9U8df6xh0uhgS27T
	uBnnjEDymVGSd5E++x47aGRCSZbE0FuyDdQyPrYUlOKDcRFq6IEqGEFMiNF1c92bPWQtuEQh/5yLt
	dtwfZoMt86laEdfHag0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStEj-006kz0-0S;
	Thu, 25 Jan 2024 06:29:17 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStEe-006ksC-13
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:29:15 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ddd19552e6so80351b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164149; x=1706768949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqhJyw4qKw6ttxWAjpEt4kkwqgUPwpH+MlNDa4SEbVQ=;
        b=XJE8SrXYp5GrN9uxg4+eTTgPqvvYpKj/W4gHI9RISpCMPAqsThOq+RrVGsx+zykE6s
         ReuAo+oP8zyO6AcTaTPjqyi7qApf5KD8rjFu7nGVN7N7XI0ReO/ybvcvhFNYKCH3+0SU
         XYRr7vLkltl+P/XTACrlhJSY/OEouclv5LlySE2w4cKRqe3bDmesiSHgiaZclg2LdhPr
         oVw/wBL8P1pc8wCHZntgE9wvAXTuYdae7kntERGpP1+NaTnVOIf0oOhUwyIQmlVhPE8/
         u++tXBW/DzqDNWVGfY4INy0oJ6mHB+/+h/UzVzHBLMLqlBdZfXuWwsDR/xMLVnuvG9eJ
         fF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164149; x=1706768949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqhJyw4qKw6ttxWAjpEt4kkwqgUPwpH+MlNDa4SEbVQ=;
        b=dMdzrf8i+LR35ERM80eezA67L1bKHXQYYGdzFXOddq7DRu1AlLuFAJK4+9cktQDUld
         wrHp6NrEChL4EPRKpizb6WOty650wjZv49zMvdt7wInr2SvhFcvzdaCELPLB652qQ1Uy
         zNmFGHLR2wEpt4DW9frW/Wy/bIIKYHI85pu1soVfHF0n9CFgiX5+eFzaJG0fNorIZ6CT
         JsM5wBaH4/rR7/l/1IheUSyOvOnVl2N04H1iI/z6fdr+sSiOy7XI8N6BqyU5Mil1Lky9
         qrk4o6kJfBazaIWoBkUtm9goimT1Cv5U0oybFGrr8CdDvFqYSTdT1lM5Tl1dHAMR6fKl
         R8Bg==
X-Gm-Message-State: AOJu0YzdyWCjVeLALsfp8mhYUqU7FBvWlOj++5BmS8ZYnUq5YvG1yP+q
	qvTMqVGhC6YPm3YH1GfQS6QMeiOXR1oNGcryB6MxDyC8IHLt7nH5NaoB0Hc649E=
X-Google-Smtp-Source: AGHT+IEl63VLMXT2mHqAciM7L/Xopf+jIyT34V6he9kHeUuUlxwxwREqJzJ6MMes7H6nQTQcNzI7AA==
X-Received: by 2002:a05:6a00:2194:b0:6dd:c69f:1e31 with SMTP id h20-20020a056a00219400b006ddc69f1e31mr202939pfi.51.1706164147768;
        Wed, 24 Jan 2024 22:29:07 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:29:07 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 08/28] mm: Define VM_SHADOW_STACK for RISC-V
Date: Wed, 24 Jan 2024 22:21:33 -0800
Message-ID: <20240125062739.1339782-9-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_222912_425111_920ED017 
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

From: Deepak Gupta <debug@rivosinc.com>

VM_SHADOW_STACK is defined by x86 as vm flag to mark a shadow stack vma.

x86 uses VM_HIGH_ARCH_5 bit but that limits shadow stack vma to 64bit only.
arm64 follows same path
https://lore.kernel.org/lkml/20231009-arm64-gcs-v6-12-78e55deaa4dd@kernel.org/#r

On RISC-V, write-only page table encodings are shadow stack pages. This patch
re-defines VM_WRITE only to be VM_SHADOW_STACK.

Next set of patches will set guard rail that no other mm flow can set VM_WRITE
only in vma except when specifically creating shadow stack.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 418d26608ece..dfe0e8118669 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,7 +352,19 @@ extern unsigned int kobjsize(const void *objp);
  * for more details on the guard size.
  */
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
-#else
+#endif
+
+#ifdef CONFIG_RISCV_USER_CFI
+/*
+ * On RISC-V pte encodings for shadow stack is R=0, W=1, X=0 and thus RISCV
+ * choosing to use similar mechanism on vm_flags where VM_WRITE only means
+ * VM_SHADOW_STACK. RISCV as well doesn't support VM_SHADOW_STACK to be set
+ * with VM_SHARED.
+ */
+#define VM_SHADOW_STACK	VM_WRITE
+#endif
+
+#ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
