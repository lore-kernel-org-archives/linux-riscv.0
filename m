Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF2ED3ABC4
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAtbhEMye/6VTqEpc4a7ccdKhSgkYC1/ygikbLfxoYk=; b=3dB3X/o4fTca7y
	thbK1v3j1/eYZnslC6I9uTRsIT0dRnrYR76rqkCcsEqn/UtnIEWBEjuaJXbi38qwzIDPwcAl3eeZJ
	/P+fXQEC8A3YCwtNuWa8xxU/PExNfIkb3J+pHkk60u4n6QmZ5vrR/wsp0SUi5UAHeglxXil37gv6x
	FOhCz06YqOew+A6CgcMRQKgj5QaTnkBHfpXYMIverUN5lXtdw+k+NyMfdECRJRsKC5uWQF1WY3+P/
	cfSW8msJtTR3JEZ0eaZM1rF0xSQjsWvvIrsLR5TvwmMaTePhIVFsUCggLpi/8V6RdptdFVO3pjKEf
	+63MT+Xs/6VdptbG+ACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2W-0000000AJvQ-3uBC;
	Sat, 06 Dec 2025 00:20:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0q-0000000AGRv-079G
	for linux-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n8V9DDSigR69uE32CWTID9idTpYitJ2rw2w6q4YtJdw=; b=MXcEaKSkOcBG7f8Q+kwst7Qg3D
	7S4GUOk9RXIa6HBCoyCGnmUxVsRHyK9Ov/FFeGiGwEaQ2n8Cwq1oI2Bfig22UclLnx4UjpEJa7/9A
	9wLOaPrmG3Iy8FxYdtOAoPlaL80Qcd2E/0e6QEcgNeAOklcIbH2ARRori4eX/Ax9AhHnD99B9MnEo
	ZWJRbpTERQltCTyW0axc+PCb/ABlzgjLF5lzJWL8Ubsu9YkWB2uOViENOiIwSyVowQPzK4Ojv8aYh
	Bf7PvONNxMe0tJtms6evAzCob0q/mGfeoevfXF9xbBY+gjv3IWUjWO5grVwIfEq5RBL7mbP/cdW0d
	jT9w21cQ==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRf9E-000000072u8-21NG
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 23:23:38 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so2996950b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980333; x=1765585133; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=n8V9DDSigR69uE32CWTID9idTpYitJ2rw2w6q4YtJdw=;
        b=lQdd7+Lyec53L2mx9m0tW0PsQlz7EVBzkVC5AfkccSHmJLbAkKlGMRGG2Aa4kUs4CV
         S5/UcAmxwmtxn9ly/ZKAVFr08PRSb6VWxcDhIea6xnw/n+erF/hU+kPKUE9CDdtlZQpD
         l/oHSD5kk2jQZOe+qG/1E0+aW/ZTksYu8WgbYbio7mAIDORptxdm1Kwo2KH4Pg4edrYs
         OUnD66uo4fO09lP917kmyMIjLmHV5ptCa2+iuBZxH9NGcdt2t36EsAJMYK0G6nMSioJm
         63U1KKdqXlTUj7xygW7LQrnqRR/0bRy6sZg2Kx06HUJmjWm9WehjwramB6i7A4KcnqTt
         w8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980333; x=1765585133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8V9DDSigR69uE32CWTID9idTpYitJ2rw2w6q4YtJdw=;
        b=UpDy5d3ybQaJaaTFyKufuShyHLrFWujoWgaeOB9PgkMeW5BFDiQ0PBKEPfjfXJCN7Y
         fX8fWBnP8XLfWAuMjYxCAnsD80FQTgqddPTnD+IAEAednN3incHX+d9Pb2XN10hopmV1
         EhhI4pw5Tpw6InDUfpubwJH1C4sszk7q1DFQEQkv411HlIbDBC05JiahVNGzrlPDp1RE
         DCLQQ04NhkGJSNaxDtKs2J06OwMD5x5cQOOlGyYb5sGY4QgMQh4dUsxxytf0No29kHSw
         b3m9e8yPr7Enn5xHg9J8bzhBL5nwupumuKHZp4eUoOlhUSXFgHSq2qM6P3bKVO2LyyWd
         T56w==
X-Forwarded-Encrypted: i=1; AJvYcCVXywlmnfRHjOlyO5mhQ5HPBSl+ewtawes8FkLG7N1RjeSFtEcvQ3EraroKvmJqeepzaWy9c4GWq9j8Bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE8Kh2i6onUmTwwtvAJbJSt9lFeVbfUEMIr8Jp0A4ITWGF+uTv
	+q1UfvK6So/qqY2JyR8jVZU7MP6zBh14dderDbTvKaXNCGoItBSnUMFtgQR60qiQkJlxFwjRcAT
	v2syW+w==
X-Google-Smtp-Source: AGHT+IFvgfK2a2snqIy1Rm8aE6qptyZkQEpan42/+C7VOcIZpnFc5T7dKOJ6QhHIoZwkwV6ZMBDtCsCouY0=
X-Received: from pfbim5.prod.google.com ([2002:a05:6a00:8d85:b0:7b0:e3d3:f042])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:888d:0:b0:7e1:89ad:991
 with SMTP id d2e1a72fcca58-7e8c6da8d28mr855283b3a.32.1764980332931; Fri, 05
 Dec 2025 16:18:52 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:19 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-44-seanjc@google.com>
Subject: [PATCH v6 43/44] KVM: VMX: Initialize vmcs01.VM_EXIT_MSR_STORE_ADDR
 with list address
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_232337_343802_CB2233F1 
X-CRM114-Status: UNSURE (   9.74  )
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

Initialize vmcs01.VM_EXIT_MSR_STORE_ADDR to point at the vCPU's
msr_autostore list in anticipation of utilizing the auto-store
functionality, and to harden KVM against stray reads to pfn 0 (or, in
theory, a random pfn if the underlying CPU uses a complex scheme for
encoding VMCS data).  The MSR auto lists are supposed to be ignored if the
associated COUNT VMCS field is '0', but leaving the ADDR field
zero-initialized in memory is an unnecessary risk (albeit a minuscule risk)
given that the cost is a single VMWRITE during vCPU creation.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 3f64d4b1b19c..6a17cb90eaf4 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4933,6 +4933,7 @@ static void init_vmcs(struct vcpu_vmx *vmx)
 		vmcs_write64(VM_FUNCTION_CONTROL, 0);
 
 	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, 0);
+	vmcs_write64(VM_EXIT_MSR_STORE_ADDR, __pa(vmx->msr_autostore.val));
 	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, 0);
 	vmcs_write64(VM_EXIT_MSR_LOAD_ADDR, __pa(vmx->msr_autoload.host.val));
 	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, 0);
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
