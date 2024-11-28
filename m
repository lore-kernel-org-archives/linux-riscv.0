Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4C9D6D251
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 01:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGymXEb9ebRDeSJpSBZb0yx67YhWI/CFv/A4D2hB01c=; b=RrefRre0nmnwPq
	BMj88PJrSyrYvb5qe0RGGQ7TEpNeUVcPuZeycotLwTm9v+sI9crElTMMcAhInH1CO0J7ap0Wwee3x
	wXR4EJcAq8MWjT3u8ppCEI4fY1DgImx1PYAMqH7e/S4Vzi/ZuHbZA8LrbEMEMLuH/H9sT72UcnslA
	KS1zONDxlvGAsa6xM/gg4Fn5Fl4fWpD642moUuFLqRSL+S0nQifAFHikYDDjtWffbJw3VcKRTBFvv
	P3BZ6eZynYY8NgUfLFNLvII5jOBDqHzU5IrPjywc2OLbSJRdSKBmIkv7Eezm06f3CsPxj62kcWLcZ
	zpN43XfCgcsaDciW7Qrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSwg-0000000EOV0-0xqp;
	Thu, 28 Nov 2024 01:03:50 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSp9-0000000ELtK-222U
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:04 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-725126e7da0so321651b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 16:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755362; x=1733360162; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7/2VfJdiek5/ConUN3oh8Dq9U963aWvO6yCMgPFkp+8=;
        b=Y4qleVyGsoIbWOq+EjCtoe26IZRgfQ7VQCd2qUnqIJPSAmp6o6zmQKkP39AgbhPDiF
         w/syg4Xi/XYxNhzhpDk0dTGYyInn1AxhQgk3bt7H6Y+ZkfK/enPeOEnLC61n2RKejvb/
         RSjhuHQvgTUeHUPWUxDKoCef6ts0rR8rQJ4h5KHBZNO+JjYKJ8xeAwN9dQIxlRx42kG/
         1kAOLg98vUX8mC923EuF+ODJSn9FsQv9CriYmLa7/Kx6uqN3vHsjOky8gxrXH6z+sdy4
         M9fGNdx9/R46loEAyMIBWHzwu6NGAVuCIy1Y/eJLixQQc+UwDNJ1XxO3pf1abKNSMqyS
         Qrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755362; x=1733360162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/2VfJdiek5/ConUN3oh8Dq9U963aWvO6yCMgPFkp+8=;
        b=ghYLqyNVkvx603FxzqSYdJUGt6qc+0fzbzEB+MqDLOcPsFWDKHS+MAPUWvFGO0p1G9
         5B/uw7+/JXHJrNsROBR72b0VyO5Qsd0odoG4urC3EXI+bV1Do2NN2G/szNj9ozyHH7hD
         IcUT7kxykrysut5pHtsa+tFnl7792FkJ2ExhtFW1A26RJ1qOlxiO2+WPf7QptR2R91Eu
         RSYWhl1lBqe0N2x11Lt7WI15HE+jQnkxveJ9KMl5fuPEzwiDsAKWJpXjTJcVJuVs9Rkd
         5tq3jrwKgQueucGLQdJwaFjvOxkVn+lxv1suYLXM8/TAWTpbWmRBg9kG8QykKrFAEyAr
         Zpvw==
X-Forwarded-Encrypted: i=1; AJvYcCXyu9DQv/OXtIzGl7pnnQ67FGLysdIF4PJGNQM6/8g/i9H/oAuq3eV6c4s3WN/WOGsjHMnFzvMse3694w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNALaXvvKcicMWN/TeLXzxVVA+SNjHmz8aqwM1bbEW51CyHApR
	PzgHtzgQh3MMML3dzJbRrNIt91qrekz+HWPRrY/fMmJpSq0frR+MU6Z0I+d13IiGUagtbi6AS+g
	jbw==
X-Google-Smtp-Source: AGHT+IH/oCUXOezhQ0A565EEmfthxQY0rCc4VbVmqRSwagA0iA03VskT3jIu5Z1zmAcsnP7ZOJe6QkUN4cI=
X-Received: from pfbeb15.prod.google.com ([2002:a05:6a00:4c8f:b0:724:e5a7:e33d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4654:b0:71e:6c3f:2fb6
 with SMTP id d2e1a72fcca58-7252ffd753emr8477585b3a.8.1732755362168; Wed, 27
 Nov 2024 16:56:02 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:38 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-8-seanjc@google.com>
Subject: [PATCH v4 07/16] KVM: selftests: Compute number of extra pages needed
 in mmu_stress_test
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
X-CRM114-CacheID: sfid-20241127_165603_537118_382DA045 
X-CRM114-Status: UNSURE (   8.45  )
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

Create mmu_stress_tests's VM with the correct number of extra pages needed
to map all of memory in the guest.  The bug hasn't been noticed before as
the test currently runs only on x86, which maps guest memory with 1GiB
pages, i.e. doesn't need much memory in the guest for page tables.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 847da23ec1b1..5467b12f5903 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -209,7 +209,13 @@ int main(int argc, char *argv[])
 	vcpus = malloc(nr_vcpus * sizeof(*vcpus));
 	TEST_ASSERT(vcpus, "Failed to allocate vCPU array");
 
-	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
+	vm = __vm_create_with_vcpus(VM_SHAPE_DEFAULT, nr_vcpus,
+#ifdef __x86_64__
+				    max_mem / SZ_1G,
+#else
+				    max_mem / vm_guest_mode_params[VM_MODE_DEFAULT].page_size,
+#endif
+				    guest_code, vcpus);
 
 	max_gpa = vm->max_gfn << vm->page_shift;
 	TEST_ASSERT(max_gpa > (4 * slot_size), "MAXPHYADDR <4gb ");
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
