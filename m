Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9DACA1003
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Pj/cqHpVd3mHaNSj4tPsYjpmj96z4MMbDhSuJdJYZM=; b=fsYIW96iY3wLQe
	7saApBaDYmy33Pea8mP4LgFGZzt5M2fWAy19AC633hsXb8YK71vPZ5pc1kS1nP4TwcOHWQj1wrmtA
	TXKof+CJYL2OB9VfU6arKvzIrqOP6cUcdqkDftex4bkVxJ3cVTejq+4sZ1bFgzUmHUd3qBUFUV817
	lZNdUWvOQRfgUJ8mCGKsTOESkyeUq+sZxge6ziSzFtP6aWEYVDOQvKvk+uFrRE5wInkLPJfFAXX8C
	EiYyAo3/sPSNrpL9Ynj4z3zYyrHPom7tRvm7zX8FGVFea3YzHQogNLgQohtfgUan3IEtMoLtHFhh8
	SUDwlRyPBFtd+d6Nt2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Aj-00000006fkv-31nj;
	Fri, 29 Aug 2025 18:50:01 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hz-0000000645T-0qRM
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-771e987b4e6so1718093b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478475; x=1757083275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJrFx3WCqf6VFVoWT85m6XL4XoNDn8hAld/4UFHpYgs=;
        b=OFePEh0V3xPkBy1hgGqrfYg+fPI+dVQpm0zAj7zJD450mFlrBtXL4Eiw4IMVU6A4Hc
         lh1q0jr1vytc+8/fmVSb04r6OLuXJv4opNrsRj2Id87Cy2eOVOXlvL+8zhEQsBNyw4kk
         afeL/xrwPL2gqz9DHfRkDILC03+IiTySSM3Y55C9uMRFZ4opjlqXzRknX1MhNKtvWd7G
         u2pM7KdQYh5LmSCQJxJmlfAexXXqLlSLLOwrqfxTrOWQ/XuYyI/rkKMk6urZ5B5XhAap
         hKhMJ1b+LyJ1LkE9oHjx6l/WMdNDe1wNE/rA8TmqIYnwkOq4Rn0yZpfut8fcOjh0gtrg
         nLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478475; x=1757083275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJrFx3WCqf6VFVoWT85m6XL4XoNDn8hAld/4UFHpYgs=;
        b=sBp6e3O8p4F5Kr07gb9JoW9vlVXZQ7Kr6KaWceUizJ45pcrlk7mlWIgGVk8d9d2EvS
         7ZQm528PAdSPomH3wyvaogfi6kZnSjOwaf9QDJ2igmNS/gOA98L7VNStsvh1Ex62qJjg
         DZ0u/xQfpgZlKLhVe3Ykw4ProehlIvp5RQKwkQcJeWD6q0jNxtWLE9KCDVM6kBHfUWtj
         Gzd/rfMVFmVl0VqSsgxD02eVlKKcQLOBXavvwSZIfGM6lfOL58p0WVL51I1JP7TskgH6
         c4mRRsCURE4FgWTn2Ewdy6mFP6yXJjDM1fKmPrvx3mpRkYmEvwISms7xMbWh2JhOT+sp
         Qa5A==
X-Gm-Message-State: AOJu0YxdIOgRRLp61f8go9esaGXhZyLB6uGTlXaaF3YftLOFnthBBETh
	OJ5IiioX3ET62ptWEdxmCEGHw351EA6H0KUDeXAYPOV+Gm0NtYzusbgsoj7L5AIMJ50=
X-Gm-Gg: ASbGncvGlCgCe1aQR0a6n6ILTuxYkQhi2/BCwqxh8WP3zIX4RU0u/+CC+DXjCQVdugC
	LfkyqRF9pHkmOxYp9sQg4JJmstPhEYsQb7wBIFhulp0Da4Ueh/G5ajFpwsgK4naGPtQQBL++O43
	MdNAMQ1F9J+qy50FRHdqMVEyNhyGrSqySSWdnPEzBQBZJkeEMZ2lQ5Yc4HdzIF+jkLuQ58YPFo5
	bxAReC8V2gCgaV7eHbzIK+ioubeeuAcijHm9gRapD71xXUiqXyUGUiUiMqpuhSzZ3AEfkJ++DCv
	zemscnAn49HQ3KgUqJ8WPKOi16B8d7Eb2iklt2/BRx964hw0jfBJCAGle2BbHZTQEx8KEP2O/rP
	jLoQBzFfAESn3zezdVTD1wlBRUw59LAOcupIxvUjEkQ6GMA==
X-Google-Smtp-Source: AGHT+IE+tippTw8I5Rjqj8J4MuD+XFXMLrYSoKCBTNLNIx4D19MX2vzDRgyVPUrBIKEMjW6IJPF1lQ==
X-Received: by 2002:a05:6a20:c127:b0:243:b8c8:a247 with SMTP id adf61e73a8af0-243b8c8a5b5mr5669681637.2.1756478474637;
        Fri, 29 Aug 2025 07:41:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:07 -0700
Subject: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>, 
 Sean Christopherson <seanjc@google.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074115_252826_A335530F 
X-CRM114-Status: GOOD (  10.64  )
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

The arch specific code may need to know if a particular gpa is valid and
writable for the shared memory between the host and the guest. Currently,
there are few places where it is used in RISC-V implementation. Given the
nature of the function it may be used for other architectures.
Hence, a common helper function is added.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..eec5cbbcb4b3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1892,6 +1892,14 @@ static inline bool kvm_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
 	return !kvm_is_error_hva(hva);
 }
 
+static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, gpa_t gpa)
+{
+	bool writable;
+	unsigned long hva = gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &writable);
+
+	return !kvm_is_error_hva(hva) && writable;
+}
+
 static inline void kvm_gpc_mark_dirty_in_slot(struct gfn_to_pfn_cache *gpc)
 {
 	lockdep_assert_held(&gpc->lock);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
