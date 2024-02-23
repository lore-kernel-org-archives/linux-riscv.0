Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A654C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvBZXHqXMZS1cEfcv0JeomxJGJZNQkocUvoJhu9vncM=; b=qbHqWXVNHJ/umX
	bhIbVx+PJdkOmcsnT2RGv/gMhu3pScWGIt3122/ZwgPYU6Nr7klLo9c9ZvjKV3vbK7SoaOmiuFWSt
	bV/4r5nIAPP1GPP5f7Xjp+K9ZthLcNLKMVFQxIl02upAb+aXFXi2W7pMNWzQCz+arYj/bCqEdGP07
	3NdW9qHyMFDpCu6hxdBqN/lWVKil+3aVIOnXwvv36GKXP79Tg5ecedmi7MCCRyiAc401exWzWC+ZC
	0P30YGyAf9br941ttB232OdEdJL6yag3A+2JJvxPlOExksR8oAN0KWosCT1BzC6utKtSV/GNTeEdX
	OH4AilvB5L8eaxt4Pm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJgG-00000007EXt-16H5;
	Fri, 23 Feb 2024 00:44:48 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJeh-00000007Doo-1MEP
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:43:15 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6e4597a3ff3so236315b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 16:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708648987; x=1709253787; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jhSBUfusWJ3ofLKWMGpg2YDRgo1XDnuJP2HRidQqwH4=;
        b=EVRQFYwZWLh0Yw8Qp4ksR19DJRYuKltIYM7FQ4nR26r9xOcx05GgCHEX0yLgtcBZza
         Kdq0Nit72SDS6sXLwrqKUf3FYuuDN/EpPrcpebEvVJuQuYID7eGlvs0Tquxl3myMwoEB
         YrhEpCUu8NCU/QsVoEH/6W3slpQ7fkVIgUZYICGtSDnApMdessE0bFm1MV+PQ6XqatBs
         dqoiMjc1DWyL9JNS4PWsT6wy+u4fMCiH/GM7OJ36icwwWVKnxPxCOXDUNFgqN6GUM6Nc
         T5OaeVVnGREkkjX3OOXjkJbsg+HHFy3cnquMLNKBLI6dLZZ7ReaU2WxvHu3Z+oUTZ17U
         gF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708648987; x=1709253787;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhSBUfusWJ3ofLKWMGpg2YDRgo1XDnuJP2HRidQqwH4=;
        b=QFCul2R0QBQas/xiUI8AoY126nO26uRL0xXiOniyxvhdHG0i+9uELUJgkKZR/7Inlp
         7v1ChzGiVicIu0GhjfC1ZzYRuRNpiTe0IS1QJRJCL7/SRUYB8zKsbtGafh34ocEuovCl
         J/2MpmqWY1BtCe6851kfCCvGI0+GYWAMRJLYS3otY98bGOjGaHO1E0dmCr1kSH7kWSXB
         4JMTsvoUGmqaEYaXlK/N/rIuXBJjwBlh2BDfMapDOMggRSjhqDdh4l3eGAHD3B07r3z4
         1ZZwewpNjNLvc1NgaPGdU4l45KyD5mYopLe0ZqWHkCQi9TZqb5/GUlQNsBe47G7OQk4o
         4R/g==
X-Forwarded-Encrypted: i=1; AJvYcCXEKWL8J/iE/vjxdzSAIVPxb1Uc5fPEjct8kU7gnrYPlYr4aDiSw3tqFdeWvlEHP0KDUe6TmV7FZimSqM+lrB8iD8ggK2Qs6kJ3mqr9KJp5
X-Gm-Message-State: AOJu0Yyx4OFJgn7yW77T5bo2DH6zxIv2RcFzzleMAmIAiQ9kJi+eLluZ
	Tz2dH9NaEXmzveBf3PIxbvzT1l8GIvX3X9tYPg8EQkq5TpjbGF14PgpfY2qiEO3VAVK5C/shkmv
	SXg==
X-Google-Smtp-Source: AGHT+IHIxuf373oGf69Al+lWSIf6Q+TRpWLvL/aYM1tJ8IvZSlPzsioXOjltEzRkvK0lvpvWJZPUowBn/iU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:22cd:b0:6e4:643e:e215 with SMTP id
 f13-20020a056a0022cd00b006e4643ee215mr24254pfj.3.1708648987517; Thu, 22 Feb
 2024 16:43:07 -0800 (PST)
Date: Thu, 22 Feb 2024 16:42:50 -0800
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223004258.3104051-4-seanjc@google.com>
Subject: [PATCH v9 03/11] KVM: selftests: Add a macro to iterate over a
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
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_164311_488770_48B37DD6 
X-CRM114-Status: GOOD (  10.57  )
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

Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>
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
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
