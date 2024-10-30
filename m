Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F608D5CCB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nxmld1muHDij05G7q/m5gTa+Eo1Qs7h7huLi79xqHO0=; b=SSrcLu78E7BxV1
	vMRyzCSR5U9hGG//n+0Ac7rVjuGQiqiud4xPpnm4Lr6AC4iOd3C/CSKqWPTf/3ECOc9dFfmSUxIOA
	E2oPXYq8ehl6WobQ5SPPXxMHuyUtYyuwQ336bjIak67StgyPMxqkzmEE9caef3BoGKw15yQTVQaY3
	zZmsvXgNThgCZ2/4VyB0dM0pzJHq9rhVRdVEF2dkGsPBqeikNfBrcQhievytmDRDxiw17/bj8nYtB
	iB4qlUCGy4txAAGd06onf8iJgKe4dUF2DCC8jlrBtx5l+kQWzMQ/SKI6I9HAYEPIXZ7JqwzEmKUGK
	cPILJfdQaDZiuHVWqD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t69By-00000000YxD-1vqs;
	Wed, 30 Oct 2024 13:56:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t695v-00000000Xvn-2ehS;
	Wed, 30 Oct 2024 13:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4gTnpkauDGYjzwRVywsrh01v5XrS76J2GZbKVdbAfi8=; b=Uot6gNxvYl2VOJH4FQmfDbn88X
	V2bOPxlMINaPiqggAeoTHMzRcCN9WoIqh/2hxTrMIex1ES0HJLrKD9blSi1iQ900qkqC77qEpLi4i
	opPwYCWGtzJK+9IoFAU5c6zBKbaVE+bDmXFXn2GS6azyt09zSJkzHTOoCMhMNHxbRlrtKFWf5n6i8
	fEXagWBL7AXUykdmlmmWHqj8XxeznqgdlYUlVhajx8lGVj7I7++IVcdX9KfPrc6gali6DF5kZm/Pu
	g44BfkTmKXCfbTKQgoVMFbQ3FO4Td3Ava9QGma83cCTY0/UN6151hBfGcJC+hlE7ORqG5/3KIF9kq
	zbN8PRWA==;
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t695s-0000000AFsf-12jJ;
	Wed, 30 Oct 2024 13:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1730296241; x=1761832241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4gTnpkauDGYjzwRVywsrh01v5XrS76J2GZbKVdbAfi8=;
  b=QEXfclS6WSR3ECB66EPCWVjXsKDnNxu05r6vv99o7AiRElCoW6Tu6wJf
   Tbkjx4LQ8u1h3OtaIENV+MC4pLZm1wgroebIsCoszZndzV/13VAQAWy7H
   t5DySk6EDs8ncgkg+Gwjxy8vZ/RN3ftNbMiwscBYFHF94saGSewFyM7dO
   E=;
X-IronPort-AV: E=Sophos;i="6.11,245,1725321600"; 
   d="scan'208";a="381122811"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 13:50:38 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:4737]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.36:2525] with esmtp (Farcaster)
 id 6a75726f-118b-4ebb-b916-ac128103b7c2; Wed, 30 Oct 2024 13:50:37 +0000 (UTC)
X-Farcaster-Flow-ID: 6a75726f-118b-4ebb-b916-ac128103b7c2
Received: from EX19D003UWB001.ant.amazon.com (10.13.138.92) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 30 Oct 2024 13:50:34 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D003UWB001.ant.amazon.com (10.13.138.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 30 Oct 2024 13:50:34 +0000
Received: from email-imr-corp-prod-pdx-all-2c-8a67eb17.us-west-2.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Wed, 30 Oct 2024 13:50:34 +0000
Received: from ua2d7e1a6107c5b.home (dev-dsk-roypat-1c-dbe2a224.eu-west-1.amazon.com [172.19.88.180])
	by email-imr-corp-prod-pdx-all-2c-8a67eb17.us-west-2.amazon.com (Postfix) with ESMTPS id AD78B4032D;
	Wed, 30 Oct 2024 13:50:24 +0000 (UTC)
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
Subject: [RFC PATCH v3 5/6] kvm: document KVM_GMEM_NO_DIRECT_MAP flag
Date: Wed, 30 Oct 2024 13:49:09 +0000
Message-ID: <20241030134912.515725-6-roypat@amazon.co.uk>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030134912.515725-1-roypat@amazon.co.uk>
References: <20241030134912.515725-1-roypat@amazon.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_135040_793524_97DCB4DA 
X-CRM114-Status: UNSURE (   9.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 Documentation/virt/kvm/api.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index edc070c6e19b2..c8e21c523411c 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6382,6 +6382,20 @@ a single guest_memfd file, but the bound ranges must not overlap).
 
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
+The following flags are defined:
+
+KVM_GMEM_NO_DIRECT_MAP
+   Ensure memory backing this guest_memfd inode is unmapped from the kernel's
+   address space.
+
+Errors:
+
+  ========== ===============================================================
+  EOPNOTSUPP `KVM_GMEM_NO_DIRECT_MAP` was set in `flags`, but the host does
+             not support direct map manipulations.
+  ========== ===============================================================
+
+
 4.143 KVM_PRE_FAULT_MEMORY
 ---------------------------
 
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
