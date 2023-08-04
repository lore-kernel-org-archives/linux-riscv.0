Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16AAEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 02:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vj7mM/uUAUCrkTvNcQWFxxya44RCLZXZpy/t/5aDr8Y=; b=LScL/JpmAdH52s
	63l1aQ3pr2buDUVno4HNL8QrBMz1kTlC203eTpGmvrl5dhTzPMtDhc3ZZX8wMrJdVYqoQBqhk5EUt
	Ad5Bi0XXTA4kcOvyue8EskuXPNoOjZGEVo1ZupiKhQuiNjHmAR9E1+Yy714i9xwiggYB4kcFmWcds
	c36F1dMMejDzTkiQ82h8qlk7k8CGzJ+q8JPR4vpo16byrHOzEmVQVwZXEaCju1fhDKtpqtK5gWn/H
	Cl1UvSQSuruUMw1wcptL5SfzBHDFD50qyjS+zLoF6pRifLVMVIvAhnojyollFJbzYTgCrnqcNd0XS
	ZZ7apDRdEp744T+AhUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkHL-00BKw5-0S;
	Fri, 04 Aug 2023 02:10:59 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkHI-00BKu8-1w
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 02:10:58 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-56d455462c2so404360eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 19:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691115054; x=1691719854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efS36dkbCzja1DEoOkKk5twnSGIQYzSPz7GFgwV0rps=;
        b=sL5L+XGZXxz3uilHLZ9996rABpzv96OCLn70c9kreiKgPg+WH3KJroL9cVLj2fBjI4
         NQe8+w7CLAox+ot9c6Sx0ktR3iYP5P+c8pN85u54Rsy06KDa4GcfJccDlv6X4vB+zHUn
         fOSxh1hOUBlo6UgFcJDC47IQVz1f4EDcD0TlBOGU/8cvax961M2jcrcuGJPlBRjyBApH
         Yr9yABf/BnVF1c20z4GgGSV/40DAWyj5SVhDT+9mC7k6UVziYmYdgL3moyY6QrCvZd73
         4FZ3hUQCNUuO/ok3JHJqIRfA/yxktc+meR9K37rZmH55b5iR6aKlCC4Gg1xr0MwsaNDG
         Pekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691115054; x=1691719854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efS36dkbCzja1DEoOkKk5twnSGIQYzSPz7GFgwV0rps=;
        b=dnc5NJaKuPDGHga7T3QyNzR9S+2AORZKKdtFYot763k8g4rQnyLoDKrFsw0b5xUNKY
         i4osf6RBWd8E/hBp9vc6g3GY18WXLhS00kamv+YlKWtiluHhxsUA6eg1sxEhtydKBSam
         frh440Z4k/2edBbiIxRqunpSO3EWdTjGp1srltdvRT4XfA539BIuv9Zh7q2EkWK/bO27
         p+Qw/x5C6mPGm8OTeuvlQHOslY2qUWtCh+Rx0Bo0/RWzvQ2vcny4sC7y0CI7g/urnRAi
         tb4RCT3rodFoABt3Rk70xJNAr64H6TUoEFCS4so3IsdBbCbYF4iTz0NF5O34NTpr0Hi9
         WufQ==
X-Gm-Message-State: AOJu0YzF2Z2kaINmV5/WstICP0h6obvkrRYkZmp6Dq75KfjuY/F3AY5P
	jRjqJoJf8Qx4879K5fPpwuvSDA==
X-Google-Smtp-Source: AGHT+IHkkquc+vtnTAEnaVFOIeS3KymV7yesjBryf/XUZfueFQfWUT4yuX+ZoQdYenvjMp3+aT7A/A==
X-Received: by 2002:a05:6358:c603:b0:134:ded4:294 with SMTP id fd3-20020a056358c60300b00134ded40294mr441125rwb.17.1691115054417;
        Thu, 03 Aug 2023 19:10:54 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g6-20020a655806000000b0055c558ac4edsm369499pgr.46.2023.08.03.19.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 19:10:53 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:27 -0700
Subject: [PATCH 02/10] RISC-V: vector: Refactor instructions
MIME-Version: 1.0
Message-Id: <20230803-master-refactor-instructions-v4-v1-2-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, bpf@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Ard Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, 
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Nam Cao <namcaov@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_191056_639293_D8053371 
X-CRM114-Status: GOOD (  10.63  )
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

Use instructions in insn.h

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/vector.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index d67a60369e02..1433d70abdd7 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -18,7 +18,6 @@
 #include <asm/csr.h>
 #include <asm/elf.h>
 #include <asm/ptrace.h>
-#include <asm/bug.h>
 
 static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
 
@@ -56,7 +55,7 @@ static bool insn_is_vector(u32 insn_buf)
 	 * All V-related instructions, including CSR operations are 4-Byte. So,
 	 * do not handle if the instruction length is not 4-Byte.
 	 */
-	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
+	if (unlikely(INSN_LEN(insn_buf) != 4))
 		return false;
 
 	switch (opcode) {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
