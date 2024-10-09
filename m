Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8746CEE326
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtiPdsq+R+B2duA0bbjuxUMnjuE8ijY07PTmRsqReg4=; b=42IZUdqj63tHbB
	5JbJwHCaJQkwVLieWXjZgRUjkn+0UVR1b54FuMVZQBxXTkPVQIoNN6LtTqWszsxttPAT4EKWQXcNU
	idr1w5Bv6t/1SC+DayF5TFNFtJT2qPgzq1uY4bO2Ryt8C/XJ8fKAN0uNdV0ywow+cZikEeJLtF1hD
	oiOt9C4Eu8HD2hqVmuOkx2DE6g6biiSEstVgHQICNjpCmtPQFE8tc3Mq47PisItd21Bm23U7MnPSG
	oq1lv3yscGu09SOT+0I19rRGgUD0/jpC5EK0jKoRe8BYLv194EPsTWHiaFIifTf3kFC8h/DmhNW6S
	QFGIDLuaKij2H4a1I4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZDk-00000009sGd-1PU9;
	Wed, 09 Oct 2024 16:07:28 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYx7-00000009oCF-3uSc
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:19 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e0228d71dso3363900b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489017; x=1729093817; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jc3MwSNX0+J+oR+H6AzLHubLG9mcnf8agevCb1Rjaqg=;
        b=YjaWhM0PdbW+HQlqZUwTc9H573yohm1JXRDWkH/fOBl0uNm3cVLppWtrBfLHjnZ/yz
         CVykkkcfQigVIf7bqKclD/QB8cdN2UItVWqM4dzD1xQz1y+KLJoKw041eugvJIXIELaO
         9BEC7pcoSfSKQ8lz34YOgfL94OzacoGeveuVmNeTpnAIwsqXw6cGWdwvkUpQiheIkMdQ
         XLB87NWM6adZDJ2HxO+dOu+fyUZp2+/rIWrHspu6FCBPe6qoc/DfIcxM45z5ENZO/9fN
         QrJNSit5XPlQgiB2O9yrKDkNZRCItq2ddiXsgbBDVwdeGk8jaIIuRcFNanLx77XVPZ5R
         mWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489017; x=1729093817;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jc3MwSNX0+J+oR+H6AzLHubLG9mcnf8agevCb1Rjaqg=;
        b=j0HKtZK1vXI7pdzakyWJvGPHheqBGMl/c3XbW7pk+XfjyK4+X1H1PFcyRQraC2bO+e
         7Jpu3Nw0qpMRv0DJIwOb9cT/33hJoZS1ildEeZ61Ui4ENTSAUI2gCXvWUWfoPTzEpIvc
         TQL/bTnfPg1bqIRqp6POZEzIaJlilrewaj/AenEz998BJSD2dH+FpGfu96fpV+hDb5NN
         nVohWL7ZXqSZGfd03xP7NedC6pBLrHsupdp0nrr1j4O2lPoRKEsBQl111Xre5UduMepL
         dkQxfVdTT9JsrWypaC1IoB8ux+wVONBlN+hXC1lJjqO+cIwQ0o2fhayyMoDjERd3MEZ1
         6wHg==
X-Forwarded-Encrypted: i=1; AJvYcCWwVhewoA5z5rbtJOddzQxWqKnCY4qfSRfGFY8A9baYjby5LVyT/HAuLm9n9pcP4oc44XCDRPVQGx+NlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgr66BHpXn+/6wNuHy4GFiw1ltDiBfMbscaFqEQiPJA9wwNtN/
	GRNjmf8THpZbwf3ZtK1cDokT5Z/7ji2vdlJ5JGd5kU8Qq4egsveseTXv/HctGVMdKj/W6d1f1Cy
	7Ew==
X-Google-Smtp-Source: AGHT+IHtPJEK4UvnUH2lB7bwyfqs7oKhFlAZAFDdmrNEVSIuNr6gJJns/OGC4yt52V7y0o2FJEVYvG06l9M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:8f88:0:b0:71d:ec11:1214 with SMTP id
 d2e1a72fcca58-71e1daad342mr3780b3a.0.1728489015563; Wed, 09 Oct 2024 08:50:15
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:49 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-11-seanjc@google.com>
Subject: [PATCH v3 10/14] KVM: selftests: Enable mmu_stress_test on arm64
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085017_991843_44E9288E 
X-CRM114-Status: UNSURE (   8.28  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable the mmu_stress_test on arm64.  The intent was to enable the test
across all architectures when it was first added, but a few goofs made it
unrunnable on !x86.  Now that those goofs are fixed, at least for arm64,
enable the test.

Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>
Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 8c69a14dc93d..4db74792d689 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -178,6 +178,7 @@ TEST_GEN_PROGS_aarch64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_aarch64 += kvm_page_table_test
 TEST_GEN_PROGS_aarch64 += memslot_modification_stress_test
 TEST_GEN_PROGS_aarch64 += memslot_perf_test
+TEST_GEN_PROGS_aarch64 += mmu_stress_test
 TEST_GEN_PROGS_aarch64 += rseq_test
 TEST_GEN_PROGS_aarch64 += set_memory_region_test
 TEST_GEN_PROGS_aarch64 += steal_time
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
