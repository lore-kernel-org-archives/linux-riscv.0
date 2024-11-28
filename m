Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05887D6D251
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 01:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ri3/ifDpYhmxLADPp8AuuiP8BPLad97X6GAICuVkvPk=; b=H8hTHPo+9fz5PK
	maMhmepPXgWp0jOQz/eDr+nztKuRM1BnUoUcgLRsgYt9cgKOt3uRsIvBhg8s7xqfhInPyuoAu86Pk
	e0FiLgdRmoQwSJmLA07jcor4c5HT9aXwudDPVoMBpmrGpgvdsZ84kcK+Z2errV0v8zCpV09lDRVsS
	PH9JetmyHd9LJ8iiOdTn+uRh3ma/tjxPhVURe5ZQHr78qHegwjxM2dKkE8rBef2pCTdUAWLJsdzRu
	CeAWMnSu0AvXmbVWV9QnudyPoSN1oIVTJXabnpbmb82uhQBfOmGKT1ihoAbNLqo5rIaXleuyv5ZL0
	zdEXyroE4HTF0lIzMQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSya-0000000EOrG-3ZAD;
	Thu, 28 Nov 2024 01:05:48 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSpC-0000000ELvW-2y1j
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:08 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ea2dd29d16so316676a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 16:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755365; x=1733360165; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=m3N0I2xWsrfV4i9nnr3KT1Cpmm4B4GrEhZX0cF+2Gqk=;
        b=gpwYmPBqOJqb7DV54cDcRy44ky391zaidr5gqV1nM958cFcXMYOHFzwpI9iYwZzmGy
         EPT/21vtyvbvSQ9jAZv3ZOCwb/Exq4UmHyBvD5qJqnWZC4UZSVEqlnWWxTRxqkCcgw0J
         N80malAxY0NojwGztsIQkThRC5SDK928pUlPJODx1x1vm4wIu281Tx1AeiMjV08QnOJ6
         Gnu6xATk57YIKHn3fC4Co/EoLs5REeyPKWz2WSAMZ2qBLE1sFIflYS3NQe8KTmr0toj/
         XV7EFCECNaZdrC6LBkLri1aLsCsMW7gNzB/lOVsEGe6wJWJIbyA3zKArHcUzdNlswwKE
         ItCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755365; x=1733360165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3N0I2xWsrfV4i9nnr3KT1Cpmm4B4GrEhZX0cF+2Gqk=;
        b=F1r0aKpiPJpleoY8IvZ0AGbEYV3Nl6PNKDydwF41kWP9a8MH4wZsHCv1RDzw1a+6/K
         4jdgXdgsePz3Vg6nzhSh4QYYD9ZyHAUb2sNlrK0egJf+ZAVB/583ORORQ34u5ZlNx4tx
         opWR1OPV6mWcGDUIj8KWRHpQSa7minj1HCGzsftmJMk+ROqFOO26QQVg4oKTUepa6/j1
         r80Sxn9REKUKn/lMVRUX9TE+5914mTHhozlxCuWBAD8mLxrx3EllVJcZhL+hivwaLPif
         dR6a3t4fwL6O9oD0MQKq1fgL6qOfeNVtY0W7pUZe0LkKc8VbVoWN60xr+WUqIK+q4c+f
         Seug==
X-Forwarded-Encrypted: i=1; AJvYcCU4kjsTk4hRw4oqDvo76bt9J/oPRGWfBzLntP7w/vO2rkwNxiJoglDUXCMjDvosnnAxj4vRjPvAgWxe/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUsknkDDMv4IWay0hw/Tlj6WGOi0VlyieR+AgGr9ay8maXgUOH
	O+/yY/zYX7HnQ5AIMH0+TBSoo1e+yydWleMBGNc+eGCmrl/9Fmwjr9gF3XL0nEtEKZOrhlgkfnF
	bnQ==
X-Google-Smtp-Source: AGHT+IE4OA2YWpjZt4cUyGKEolrSn+wbKfMl6eazhCePp/W8mIleK1HW5p9Pm9svs3J06p9qg41Q+800XRI=
X-Received: from pjbsn5.prod.google.com ([2002:a17:90b:2e85:b0:2da:5868:311c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c6:b0:2ea:6f96:6504
 with SMTP id 98e67ed59e1d1-2ee08e9c7a3mr6508990a91.1.1732755365479; Wed, 27
 Nov 2024 16:56:05 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:40 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-10-seanjc@google.com>
Subject: [PATCH v4 09/16] KVM: selftests: Enable mmu_stress_test on arm64
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
X-CRM114-CacheID: sfid-20241127_165606_740485_0CE4028E 
X-CRM114-Status: UNSURE (   7.28  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 4384e5f45c36..c59a337cd4da 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -180,6 +180,7 @@ TEST_GEN_PROGS_aarch64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_aarch64 += kvm_page_table_test
 TEST_GEN_PROGS_aarch64 += memslot_modification_stress_test
 TEST_GEN_PROGS_aarch64 += memslot_perf_test
+TEST_GEN_PROGS_aarch64 += mmu_stress_test
 TEST_GEN_PROGS_aarch64 += rseq_test
 TEST_GEN_PROGS_aarch64 += set_memory_region_test
 TEST_GEN_PROGS_aarch64 += steal_time
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
