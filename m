Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F025C4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 00:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15s5TIum4m9ovkF0h4kfM85bwxpLPPebdEW0xyqk6+c=; b=L5HyQit0McOY1Y
	3PV/IZFARKKRHvtLh9f/T+Y+5iL24LjgLsdMOH9UehUof7IsFjSzjVichH4vbDCvI3KFJPizTpnN4
	Hvo9nP4cWZmaRr2r1uSxPQkA0g43n6tsFUTFKIet3cxwXfFVoJvejNXlCNRjMRbWPuBYfUd/624h0
	wFfigNume2UH0MzNwzlu9mrEzZHNCD3+GGyNQy7TSv+9hSdGMO/eHeerN8Jp+2g9QsIFrc+o6pTto
	FWgQUD/qRIOjLJ4iJxRouCVF3jJEMPyYeX6UhT2XYJ0bxxaILsqhTy9HDd/uI2MwAff0hzkAEDut1
	bBDdzNTap6gSQpBE/xyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3bE-0000000DshN-38v4;
	Sat, 03 Feb 2024 00:09:36 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3b5-0000000DsXq-3mY6
	for linux-riscv@lists.infradead.org;
	Sat, 03 Feb 2024 00:09:29 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-603c0e020a6so39301097b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 16:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706918966; x=1707523766; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EJcVR2aXcmJcYN2R0niM7r+O1TbQOV0XdUcPDJMxbc8=;
        b=aRe2AVOiQrg2bgM0LN6fA5pWhiNlXNOHaeiczzXow5CL85FQztVaEFAvmk6r191OdK
         2tT/hyODEPfvRNhPKC3GTDp2EKQ4H+IybcIc5RQJQTGxmoECpv6geJzjK3Jbm4BJJeIt
         L7BbeJ3tPw0e2KzjNtcBLnIy8bpx1L0F0j6TAbZOw5v9aPuWsQGEHFCJSGm3DanNXuvo
         EFUy8EYfsCaRFeUmqxSm9+JTvMACeDr/BkADNa9iivw0b5kz0EHZydrs09duESw/lkNf
         /gBE0cKO+Ko7lYtHwMf0V256mSGgXSwoqcZksibkSqFwa3z1vVF7tceHpmMCjlzjheXT
         4OFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706918966; x=1707523766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJcVR2aXcmJcYN2R0niM7r+O1TbQOV0XdUcPDJMxbc8=;
        b=sYA1XJhSqG5ZpdpHGwRKV0m+itgxrFeKkfp6hWuRfTIbFSExWWKvlDMXuy00EcRNV7
         wQqlsZgUOYqtPmNQdCAFZhFcKQPOj+JyQfZzZ0c7JOlWYyKTv1d6g+qkHhrr+SeaQLK5
         s2m7I4CH3jlsmLW6X9aXzV4bj2zEGHXyzMScqbKgLgaHztknSQKFTcDRkgztdRftfcGg
         Z+kpDx6i67pfojGahOo8pmBTvFil5ielur/adoQVLOG3TS72Id6fgWNak0DVo8c8075d
         RK1BCtXYMqbokqI8LFZ5vuDTIC81mOU0ziptkwcadGrMbZxWBWvJ5xYVcMk/28ydQKiB
         jozw==
X-Gm-Message-State: AOJu0YxdLtMVC5hyJQHdlQwne1TyiJoj3FBUlk/KsMYTirffattDGbww
	NkXFyJlkfWpSXIjbPzxaiWIGv0PDRFy024A4w5ziFI6abb4hgHNFAwkB0/l6TWSsXZKs7NgRbQA
	IFg==
X-Google-Smtp-Source: AGHT+IE1s6EJfVGREtZvX37sLQNXxMNUUf6YnupI42R7gjK7Gbj5RZLdSqayMtCx5amfWpfD3Lqf6oThk4c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:9b4b:0:b0:5ff:6041:c17d with SMTP id
 s72-20020a819b4b000000b005ff6041c17dmr1167011ywg.2.1706918966644; Fri, 02 Feb
 2024 16:09:26 -0800 (PST)
Date: Fri,  2 Feb 2024 16:09:09 -0800
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240203000917.376631-1-seanjc@google.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
Message-ID: <20240203000917.376631-4-seanjc@google.com>
Subject: [PATCH v8 03/10] KVM: selftests: Add a macro to iterate over a
 sparsebit range
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Peter Gonda <pgonda@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_160928_001428_87B1CC94 
X-CRM114-Status: GOOD (  11.03  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ackerley Tng <ackerleytng@google.com>

Add sparsebit_for_each_set_range() to allow iterator over a range of set
bits in a range.  This will be used by x86 SEV guests to process protected
physical pages (each such page needs to be encrypted _after_ being "added"
to the VM).

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
[sean: split to separate patch]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/sparsebit.h | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/sparsebit.h b/tools/testing/selftests/kvm/include/sparsebit.h
index fb5170d57fcb..bc760761e1a3 100644
--- a/tools/testing/selftests/kvm/include/sparsebit.h
+++ b/tools/testing/selftests/kvm/include/sparsebit.h
@@ -66,6 +66,26 @@ void sparsebit_dump(FILE *stream, const struct sparsebit *sbit,
 		    unsigned int indent);
 void sparsebit_validate_internal(const struct sparsebit *sbit);
 
+/*
+ * Iterate over an inclusive ranges within sparsebit @s. In each iteration,
+ * @range_begin and @range_end will take the beginning and end of the set
+ * range, which are of type sparsebit_idx_t.
+ *
+ * For example, if the range [3, 7] (inclusive) is set, within the
+ * iteration,@range_begin will take the value 3 and @range_end will take
+ * the value 7.
+ *
+ * Ensure that there is at least one bit set before using this macro with
+ * sparsebit_any_set(), because sparsebit_first_set() will abort if none
+ * are set.
+ */
+#define sparsebit_for_each_set_range(s, range_begin, range_end)         \
+	for (range_begin = sparsebit_first_set(s),                      \
+	     range_end = sparsebit_next_clear(s, range_begin) - 1;	\
+	     range_begin && range_end;                                  \
+	     range_begin = sparsebit_next_set(s, range_end),            \
+	     range_end = sparsebit_next_clear(s, range_begin) - 1)
+
 #ifdef __cplusplus
 }
 #endif
-- 
2.43.0.594.gd9cf4e227d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
