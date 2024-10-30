Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7300D5CCB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shtcXAM/kQWmvgIh8qRwz3BvUAqLTlHWTpfXadeNGA8=; b=n2Kml8boMMNjp7
	xUTQ5vG7izSM7fpp5FU3JRAzFU71jm+37R/XV0QQxvAwmwcgWq9wMgJ6MNVv9B4EC/kIj7z+Bf7XE
	Wb8o5irD5RrLhYHZLjpW4RZ3Ps/iJJQkYIVmWMntqv0c1Y5Ln55uTDy0QRH2siZ6NpfgXsSAjzUtv
	3/wneRj1xKAxreX17vAHS+o0wbjgd9Q70B+wZ0CeCioo+BibIk7Drf9w6eCDa5Xf8RqoZmCo9ft6/
	aoPvJq2tM+PfwUTPjyWevjpZmqO8P2ulXoPPfdkj/o39K6JPvYUK4EwbdmCYdBYYkxp2XspAGu0N1
	cvMbUnQ37iPA8MUijAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t69C8-00000000Z06-2Fyy;
	Wed, 30 Oct 2024 13:57:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t696D-00000000XzK-3xS2;
	Wed, 30 Oct 2024 13:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7/qXvSh0Hjany10m5XTRwJaHsD/IFz61ERHpnmidOYs=; b=hXj44/ZZOEIHpOcXLFWXRkf2eI
	8sTt/yTMeCqheySDWrdoQnSTxYFaiwu3XD7qdx7lLT11hVbcsM1PChcY3lHFAvt+NlezQoNc2HWuS
	0umgu/2/k8+Ly2L1OzHb22/Ckg1tIxDvqzMaRVhRPqPslD/nCX3PxzRzcxXHoK7jxPSuyTh+Zs0ke
	4iH4UiIDUrz22SSQpaFf2z2Cxrpjo7raket+h/+yTN0Lt45RL5iXVOL+iq4nVKxknJzUrUmZ8eGDL
	5+0tDeXjrA9I7zTHWZ9vgc6OpxIDq8ZnLoQ5nLqK02LuadtdvcUCxjE7G8ExHuSTEFdilOUV8zsVf
	K6c601Eg==;
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t696A-0000000AFxF-0mwj;
	Wed, 30 Oct 2024 13:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1730296259; x=1761832259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7/qXvSh0Hjany10m5XTRwJaHsD/IFz61ERHpnmidOYs=;
  b=YcUNP5zmCRxREu6gynEaIsDQpemWGvck+K+EkyCWJ1h7030FEHCuDACD
   w7M+l7s06K9Ou6TLSfJVEqxzVcvO2u05Jhj01kmEEdnI7eAkGqJPerPfN
   3jG23rzzQMeaFd/CFiEeR6Kf8HY7wzEG31/T9dfYZw32qZyW4Oj+0ZkUJ
   Y=;
X-IronPort-AV: E=Sophos;i="6.11,245,1725321600"; 
   d="scan'208";a="465820264"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 13:50:54 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:12628]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.102:2525] with esmtp (Farcaster)
 id 00b2c9f1-27f5-4a01-ae54-6fda17405dbb; Wed, 30 Oct 2024 13:50:53 +0000 (UTC)
X-Farcaster-Flow-ID: 00b2c9f1-27f5-4a01-ae54-6fda17405dbb
Received: from EX19D020UWC002.ant.amazon.com (10.13.138.147) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 30 Oct 2024 13:50:46 +0000
Received: from EX19MTAUEB002.ant.amazon.com (10.252.135.47) by
 EX19D020UWC002.ant.amazon.com (10.13.138.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 30 Oct 2024 13:50:45 +0000
Received: from email-imr-corp-prod-pdx-all-2c-8a67eb17.us-west-2.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.135.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Wed, 30 Oct 2024 13:50:45 +0000
Received: from ua2d7e1a6107c5b.home (dev-dsk-roypat-1c-dbe2a224.eu-west-1.amazon.com [172.19.88.180])
	by email-imr-corp-prod-pdx-all-2c-8a67eb17.us-west-2.amazon.com (Postfix) with ESMTPS id B5B724032D;
	Wed, 30 Oct 2024 13:50:35 +0000 (UTC)
From: Patrick Roy <roypat@amazon.co.uk>
To: <tabba@google.com>, <quic_eberman@quicinc.com>, <david@redhat.com>,
	<seanjc@google.com>, <pbonzini@redhat.com>, <jthoughton@google.com>,
	<ackerleytng@google.com>, <vannapurve@google.com>, <rppt@kernel.org>
CC: Patrick Roy <roypat@amazon.co.uk>, <graf@amazon.com>,
	<jgowans@amazon.com>, <derekmn@amazon.com>, <kalyazin@amazon.com>,
	<xmarcalx@amazon.com>, <linux-mm@kvack.org>, <corbet@lwn.net>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <chenhuacai@kernel.org>,
	<kernel@xen0n.name>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
	<agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<gerald.schaefer@linux.ibm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <luto@kernel.org>, <peterz@infradead.org>,
	<rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <shuah@kernel.org>, <kvm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [RFC PATCH v3 6/6] kvm: selftests: run gmem tests with KVM_GMEM_NO_DIRECT_MAP set
Date: Wed, 30 Oct 2024 13:49:10 +0000
Message-ID: <20241030134912.515725-7-roypat@amazon.co.uk>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030134912.515725-1-roypat@amazon.co.uk>
References: <20241030134912.515725-1-roypat@amazon.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_135058_697554_A2A0BDB3 
X-CRM114-Status: GOOD (  13.24  )
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

Also adjust test_create_guest_memfd_invalid, as now BIT(0) is a
valid value for flags (note that this also fixes an issue where the loop
in test_create_guest_memfd_invalid is a noop. I've posted that fix as a
separate patch last week [1]).

[1]: https://lore.kernel.org/kvm/20241024095956.3668818-1-roypat@amazon.co.uk/

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 tools/testing/selftests/kvm/guest_memfd_test.c             | 2 +-
 .../selftests/kvm/x86_64/private_mem_conversions_test.c    | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ba0c8e9960358..d04f7ff3dfb15 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -134,7 +134,7 @@ static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
 			    size);
 	}
 
-	for (flag = 0; flag; flag <<= 1) {
+	for (flag = BIT(1); flag; flag <<= 1) {
 		fd = __vm_create_guest_memfd(vm, page_size, flag);
 		TEST_ASSERT(fd == -1 && errno == EINVAL,
 			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
index 82a8d88b5338e..dfc78781e93b8 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -367,7 +367,7 @@ static void *__test_mem_conversions(void *__vcpu)
 }
 
 static void test_mem_conversions(enum vm_mem_backing_src_type src_type, uint32_t nr_vcpus,
-				 uint32_t nr_memslots)
+				 uint32_t nr_memslots, uint64_t gmem_flags)
 {
 	/*
 	 * Allocate enough memory so that each vCPU's chunk of memory can be
@@ -394,7 +394,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, uint32_t
 
 	vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RANGE));
 
-	memfd = vm_create_guest_memfd(vm, memfd_size, 0);
+	memfd = vm_create_guest_memfd(vm, memfd_size, gmem_flags);
 
 	for (i = 0; i < nr_memslots; i++)
 		vm_mem_add(vm, src_type, BASE_DATA_GPA + slot_size * i,
@@ -477,7 +477,8 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	test_mem_conversions(src_type, nr_vcpus, nr_memslots);
+	test_mem_conversions(src_type, nr_vcpus, nr_memslots, 0);
+	test_mem_conversions(src_type, nr_vcpus, nr_memslots, KVM_GMEM_NO_DIRECT_MAP);
 
 	return 0;
 }
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
