Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7ECD6D250
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 01:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MuBP5plYRmW7W9AX+S7naglUhHQyxa9l8ftvJTSBGM=; b=Cg/sh8ZuhOzdy9
	KZJzXiW76+hXBRNF+C47aJ6Kdn+BdLXFaxkbRLsqSE7tDx4QaTDt0twE1u433x0Ts8ADyHcCFiYgr
	Ion0/sTML82zJG9podW/IpSZ8tq6yG2TB0XFYzcjMN5nun0qkago3br9czxyhSpxDyIQpVKn1YAzT
	W0z9/IIZ4S7jeHaOMEAaQQxlRoxaPS9+AJkN9bgDtawIPzMfRJCU4Dut5GMlZlQ649EH1XjN0T16d
	AlceQQK+HwmXQo21KpcwZtpc02i0D1/LaE5IYTeCu2Owh06DlJgl1V+SZIxBtxJUHV9pcas08s/pZ
	I6z+S0tVbCbCbajOn07w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSyb-0000000EOrc-1xY9;
	Thu, 28 Nov 2024 01:05:49 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSpE-0000000ELww-0UHj
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:09 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2edeef8a994so350354a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 16:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755367; x=1733360167; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Agu6M4WZdSaan2rYdaSmo6PpiQZ+ciRGpotTGWqZBGc=;
        b=sshUH0dWouhLM1oGMZu6iUtsXuqxSm1z6/S7fwfMxF4GQxJYTa6s5xbGSMAn3K3aI0
         44zBw04Co86oAbDKAxiCkJU8+544Vpu13uGoe3UtgBk0h1oqScbTIAfoxDqw+oUrwD1t
         wk8f+Fro82E6KMwkL7Ij4pWf4ZstepNfAClnO898kPk/WGnkqB0cIYZcJtROKKaIdC7M
         jh9abs2CrBqBttvW4TrBSW2pCP/l7oFr74SIbonIqrx/oOTsy4qx12h66PSbrWGV94Fq
         pyyGfW7xsfEJU4M4JBZTU7rKLL0YRAir4SvK7q7aW5xcB0UkMuWx+SRrXJTzqPy7awR4
         2CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755367; x=1733360167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Agu6M4WZdSaan2rYdaSmo6PpiQZ+ciRGpotTGWqZBGc=;
        b=Ny6BW80HopKcmvIeEOwjbOhb7Jlvl9dtMmTgeuaO7PDMdi0F9cpjsgnSW0tuAF6D8+
         lAZeRfK2X4VVKtr1uGvSoocHlh/zsouOwtuAMMC5EuLV3aZdfh31lrM4CygpTSYbiwkz
         QR/9oCgS4TMV1O3ywETqNNU5M/4KHx8UiQ/+diTePoB7d+aY45FkZm9PtFgRikckw840
         elApCDjPhW/kxgwjPDYG0g1u13iw7SkwvsiCJFK2/UwcqK3Ho6IexAY+ULn4LhouUC16
         WwKaiRm92RgHgIsqMmzYqPPlEhD8jzxUSmqsNBjup8+esL04o/zTyZgXg63IpJeZWc6R
         Ni4g==
X-Forwarded-Encrypted: i=1; AJvYcCXxzZsT1hmMJde8RC87NoUy0tpF2UxC9dOdB2tiALUaiuZa1C57mx37kPHVeknVwGHBkuR+kTbuaikvqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxuEWjr///PvtVDRloRNJEFRfP5xCKXYTvS/ZiImC4dO4lpCJw
	TzOmQ+/F06/DhQFJJ17TTxyjxrSfrOjF5LqPrjI4dq/Gh4sJk3cY8BbMw5Uyl7FDl3OGEEZMy6G
	MZw==
X-Google-Smtp-Source: AGHT+IHzlIPOR1Dozv2+kADz6uvilkOgvJy6Ih7MLR3sUMAMwXrp/UBNznMIvAz/TeA8dqsISkWCfiSMkjQ=
X-Received: from pjbcz13.prod.google.com ([2002:a17:90a:d44d:b0:2ea:63a6:d869])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c04:b0:2ea:7329:43
 with SMTP id 98e67ed59e1d1-2ee08e97ff9mr6674171a91.6.1732755367252; Wed, 27
 Nov 2024 16:56:07 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:41 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-11-seanjc@google.com>
Subject: [PATCH v4 10/16] KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165608_155728_1BEFD4E8 
X-CRM114-Status: UNSURE (   9.09  )
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

Use vcpu_arch_put_guest() to write memory from the guest in
mmu_stress_test as an easy way to provide a bit of extra coverage.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index fbb693428a82..656a837c7f49 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -23,7 +23,7 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 
 	for (;;) {
 		for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
-			*((volatile uint64_t *)gpa) = gpa;
+			vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
 		GUEST_SYNC(0);
 	}
 }
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
