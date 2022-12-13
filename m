Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98CDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vi/qWyHiMLNjJCM/sR1WLt8K2cZMRv1V1C4R7nX0GMQ=; b=GXJ5w8wHzT82zV
	rJXbiHHyLIyVSRzuEa+0gT/M/n6xWVSdGRAJZJ4+08kiOIecFZdEpQ5gKxeQrUIFwO95uZWs7/KrG
	FEs4aQ5bheEAw7KfXVClcHZtZFi9cc3eTgquEWBRsKHEMHcJ+nXPrMqyMh2/Mj6horLRQhkWcCMYi
	PPUleFESLTC5wG28gBvZskvK89vLohzSCAgwM0dEbYMMi7uG9Xlh/BW0pwzT2g7MukAxC732G2BXM
	f+Mlfj6/LnZGal9ciruM27uwJ7qcKw2SbFF+dTYYTsEAwZhpx1wXPHwtJyZSNrCgShMj9BB6KiOTS
	Vstlh/wTbQrTnVmb44TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u67-008vAQ-Be; Tue, 13 Dec 2022 01:28:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u5N-008umi-Hn
	for linux-riscv@bombadil.infradead.org; Tue, 13 Dec 2022 01:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nM41DSVBAJr+S3W93Zis4JAYC8eUvXamzXgPZLD06L8=; b=K+Dfx3VQln8kiPqZt2IVcBTvk3
	NhR2yeNxUFKGGtw7upKqYFAvj/X5wGB87KE83xKf1a4QvGCRKLV/6io+KY55oA3t8XX2h8HaIX4m4
	SOFB6Dwmhhw5wFPCtIk1jTLqMwzgxP1K7xRn79KbClAxB/13tg+KSEV9P/eyk5O/p5ClMZniZ0D/1
	7VwczxE3YPCxSo4is7dDhk5qJvmEqP3oN8nnsxqnEF/io9+id1DTdeJtBS/2MxZZ2cefhcdb08jTU
	vSPwbqPqUWWAXzWRF5olID+/zf9fmCtSQ8Akv/5eMQMCPDYeJVi3WDkhMXX9/jEflQ5MVeBO0TV+H
	/zO0uCwg==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sz1-009w75-4R
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:23 +0000
Received: by mail-pf1-x44a.google.com with SMTP id u3-20020a056a00124300b0056d4ab0c7cbso906556pfi.7
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nM41DSVBAJr+S3W93Zis4JAYC8eUvXamzXgPZLD06L8=;
        b=nYe6ZWOHPMJgTGksZPiEisBf6HPHtTh7LwnzxBJxPqoYHxDIXfUXIa80Wv8FT5deaA
         UzHNYFP0DWaotAozDYEqkVOhGC3cJzSjZIrX35uJMvKk0qzEdjbF5qj55iPpjtEz3ipO
         bm8VP2buvMYoUm5bBSsgzK0AvSdBMq0gU3WwNjXiGhrTir7XSUZ3UlUPkv2SzjZJXHyV
         BW7oqPIg9/2WzHp2xjLzs82Y3ewdbcwG+wxaYmUKR44YKrwYEmcWRcUYbv914+1ep3vj
         XM381ihLSB7s6K13WjVWXGmod93EwbDCFi3RC00C/qqJJxPj4hbmeVdBA7F4fDCsvIiB
         q4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nM41DSVBAJr+S3W93Zis4JAYC8eUvXamzXgPZLD06L8=;
        b=C2DbBJBPcI2hs2daJqvUOktlMGF4WgeVGJuvh+69G1e07hojV9MI3k/F9JhH3dgY9o
         P7ME708SyySX8RBrUk+tf3q1zWaHbhGQexO43LKVooWTqkBA3ltK6SK6cOu7VUzLK+oU
         IYRup0MQZrqPsajM+iSKhPRJjDZ6kkjT7ECOukQf8Ok8geW8Yhg5/bYthh1UW854Y2D7
         vFsWqLqq3eOg1+QbF9bta3cTfLPAiv5YQWIcBHCdAMMCOCryEfSTEuwZaZKu9twQTIY3
         TbXUAYNV+TvcrBd5gKBAfkJ1C5mKUqftfS/7E139N6zMcfPc7cx44Rfcf/t64p2BGK1y
         Q02A==
X-Gm-Message-State: ANoB5pmrXs9hpgMgDQVyj4ggimG9qMtPtSGm2YwA/kQd+IQ4c6T3+04q
	6yhz1EnAy6DiCDurUpRgY1pEphxUAf4=
X-Google-Smtp-Source: AA0mqf6ZbJmcYrZNpc/Z0ppwmhrlHhb+cLSNTmH678oSo0UQF9b8LuTc9fdveE6JT7fYmZu7x1S++6s+7UY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c406:b0:189:6df9:4f85 with SMTP id
 k6-20020a170902c40600b001896df94f85mr62591897plk.27.1670890635443; Mon, 12
 Dec 2022 16:17:15 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:50 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-12-seanjc@google.com>
Subject: [PATCH 11/14] KVM: selftests: Disable "gnu-variable-sized-type-not-at-end"
 warning
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_001720_168816_CD92113D 
X-CRM114-Status: UNSURE (   8.38  )
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

Disable gnu-variable-sized-type-not-at-end so that tests and libraries
can create overlays of variable sized arrays at the end of structs when
using a fixed number of entries, e.g. to get/set a single MSR.

It's possible to fudge around the warning, e.g. by defining a custom
struct that hardcodes the number of entries, but that is a burden for
both developers and readers of the code.

lib/x86_64/processor.c:664:19: warning: field 'header' with variable sized type 'struct kvm_msrs'
not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
                struct kvm_msrs header;
                                ^
lib/x86_64/processor.c:772:19: warning: field 'header' with variable sized type 'struct kvm_msrs'
not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
                struct kvm_msrs header;
                                ^
lib/x86_64/processor.c:787:19: warning: field 'header' with variable sized type 'struct kvm_msrs'
not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
                struct kvm_msrs header;
                                ^
3 warnings generated.

x86_64/hyperv_tlb_flush.c:54:18: warning: field 'hv_vp_set' with variable sized type 'struct hv_vpset'
not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
        struct hv_vpset hv_vp_set;
                        ^
1 warning generated.

x86_64/xen_shinfo_test.c:137:25: warning: field 'info' with variable sized type 'struct kvm_irq_routing'
not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
        struct kvm_irq_routing info;
                               ^
1 warning generated.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 2487db21b177..9cff99a1cb2e 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -196,6 +196,7 @@ else
 LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
 endif
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
+	-Wno-gnu-variable-sized-type-not-at-end \
 	-fno-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset \
 	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
 	-I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
