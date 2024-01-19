Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A9FC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+8Ty2lCej2pJ8CJ3wn7hEIBLtJ6OghsfEdf34NgTcM=; b=c0WmIC2jGEKdvU
	B9uSUDX6+PtDP2vuVRFGwHab1agTfT5LafAscTcFKel6pQBtrHveTHxQvsuNoT7FhlBrD3LVpcjpB
	Am7AYK1LmmkRrDLDTmP20GBJoW4i5FsKZJds5I6uWoBsYlJLIMVnuXuWweoTz44NP8VnFCfaqXQT1
	xYuMJScJuk/0ClW3r0qOcehGNOIArwYcjCSBxCI+VqSE+EB+r7QoL9554c1AZY3KoIVvf4zjZ/IQ9
	HS9rlMsWgMF1YPLUENIgD7aVmdy3n3BXtL41LtjQ51RCHjjHeEGpmqSnjb7b29ZZdreKjs0g1mYgJ
	0BoLO0UzHcFYV0O6VM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQqGs-005udz-0i;
	Fri, 19 Jan 2024 14:55:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQqGh-005uUV-1l
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Jan 2024 14:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rvI+qIRXvnkRa99jMtk0WlMp94Xm6ORI7SgED7Qv6WY=; b=KrcTqrB4YQkbU+E3ydYJyPXes0
	d6PQV8m+HiAsS5pyVtKvKPkFjpt27wfaL1H3d+fobZpjnBSBBqVyE/DipdqVIzAYa0TyeGMCQdpDy
	RkT2mUKod6/+8xaGCcqG0c+CQ5b9c3mx/57JjtXDbtNQrSyL94DOzPjxVSs2oRv6ia91eYxIcuSzL
	/7rHmKcGlvVAWElA1v5dGDpy7G8vtS5kwFJugKve07UN3FUfLmbo/UfiiS5WwZiOz4Powy5E6T2Sd
	z3in/2DQtbQrCK1vJU5HSP58jZHMr39AmhmyfKQ7o+oND76r2DigF2wTsybZPtLTAJHbXfJcL1kbc
	AMozLroQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQqGY-00000001cR1-2ske
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 14:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvI+qIRXvnkRa99jMtk0WlMp94Xm6ORI7SgED7Qv6WY=;
	b=RKlya3arLXj7dl7KVVn2Y1Q65ULGVLiWO2bavxxiEBP6jJkeUJjKMq+ZXwufVkqTRy/3Nv
	uUsTu0rGd9EqdxM53S9VUQXaeipSM7DERNk7VZr56VjdUgyN/J3+qvKzvYe3on77fYi138
	R7pqHb7EN5Tbkpx3ZvwuXPI03wqGN6M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvI+qIRXvnkRa99jMtk0WlMp94Xm6ORI7SgED7Qv6WY=;
	b=RKlya3arLXj7dl7KVVn2Y1Q65ULGVLiWO2bavxxiEBP6jJkeUJjKMq+ZXwufVkqTRy/3Nv
	uUsTu0rGd9EqdxM53S9VUQXaeipSM7DERNk7VZr56VjdUgyN/J3+qvKzvYe3on77fYi138
	R7pqHb7EN5Tbkpx3ZvwuXPI03wqGN6M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-5WFyMg4UNWmcGndjb4K8hw-1; Fri,
 19 Jan 2024 09:54:16 -0500
X-MC-Unique: 5WFyMg4UNWmcGndjb4K8hw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 159183C025B8;
	Fri, 19 Jan 2024 14:54:16 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA96351D5;
	Fri, 19 Jan 2024 14:54:09 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	akpm@linux-foundation.org,
	ebiederm@xmission.com,
	hbathini@linux.ibm.com,
	piliu@redhat.com,
	viro@zeniv.linux.org.uk,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 11/14] arm, crash: wrap crash dumping code into crash related ifdefs
Date: Fri, 19 Jan 2024 22:52:38 +0800
Message-ID: <20240119145241.769622-12-bhe@redhat.com>
In-Reply-To: <20240119145241.769622-1-bhe@redhat.com>
References: <20240119145241.769622-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_145442_958517_ADC7F0DA 
X-CRM114-Status: UNSURE (   9.26  )
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

Now crash codes under kernel/ folder has been split out from kexec
code, crash dumping can be separated from kexec reboot in config
items on arm with some adjustments.

Here use IS_ENABLED(CONFIG_CRASH_RESERVE) check to decide if compiling
in the crashkernel reservation code.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/arm/kernel/setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index ff2299ce1ad7..cf0b3798179f 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -979,7 +979,6 @@ static int __init init_machine_late(void)
 }
 late_initcall(init_machine_late);
 
-#ifdef CONFIG_KEXEC
 /*
  * The crash region must be aligned to 128MB to avoid
  * zImage relocating below the reserved region.
@@ -1007,6 +1006,9 @@ static void __init reserve_crashkernel(void)
 	unsigned long long total_mem;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
+		return;
+
 	total_mem = get_total_mem();
 	ret = parse_crashkernel(boot_command_line, total_mem,
 				&crash_size, &crash_base,
@@ -1064,9 +1066,6 @@ static void __init reserve_crashkernel(void)
 		insert_resource(&iomem_resource, &crashk_boot_res);
 	}
 }
-#else
-static inline void reserve_crashkernel(void) {}
-#endif /* CONFIG_KEXEC */
 
 void __init hyp_mode_check(void)
 {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
