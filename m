Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579F2C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kBuljG6ssb7v3FUCNsXuk4+D+uNgY4eueJ3ufTeWegM=; b=NCObsgd1RuyR7h
	9h5dl4HOYdl3uaeJZF0fuXtSU3L/BbI/84+KZqfb76n4Mv1/heGdYkKK6uV91Tx+VBYPY2XZ2Si2y
	qQkYhlqeDNZxRF3IxkU276PaUo1dqKKwr3pgfJLGDYaxQGHBASAB/oC9lIK0VmhQgjv/T8POK4IGF
	evXgvHIe4NGhjhdkVNN/hrNGA4GTad95Cy3R1QIvZxfNbWU7fDrBmWE4OotUh8XE2+E+ubLJ3IfO7
	U3hUOJwG5tf1C4MsQnzVanpFZuGuz5E065eIDSCe5bLE0i9I5XoT2VGQ2BWCYXC7ECDfz1mZY+fH+
	adXncUmWSOGA+nYacd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pXn-00FU6y-06;
	Tue, 14 Nov 2023 09:17:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pXk-00FU5w-1T
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 09:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699953429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MtEPkJopop+ROXauEEPPt+ntR5SxkjHn3hndM/5Vkgk=;
	b=arOlliGGJ2jeu2PQsS0u2wNJnufp6kqnQuuvAiLYQVTmXOovfeQPQq1Bv3CwgmCKOTWGRg
	p5GKNEQU7QQKevNEDo+zYD6HINQpUjgVY2la1ezGqyjcyNkfhA+kyJtibcHU0LTlMDeGuB
	syRnM8OkmeVGqUU5WZjWMMMqdqCGS4E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-HXGGcwenPp2Kdq6IOqHFRA-1; Tue, 14 Nov 2023 04:17:06 -0500
X-MC-Unique: HXGGcwenPp2Kdq6IOqHFRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A04CF821C21;
	Tue, 14 Nov 2023 09:17:05 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 615C72166B26;
	Tue, 14 Nov 2023 09:17:01 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	akpm@linux-foundation.org,
	ebiederm@xmission.com,
	takahiro.akashi@linaro.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 0/2] kexec_file: Load kernel at top of system RAM if required
Date: Tue, 14 Nov 2023 17:16:56 +0800
Message-ID: <20231114091658.228030-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_011712_566624_50CE1E0D 
X-CRM114-Status: GOOD (  11.18  )
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

Justification:
==============
Kexec_load interface has been doing top down searching and loading
kernel/initrd/purgtory etc to prepare for kexec reboot. In that way,
the benefits are that it avoids to consume and fragment limited low
memory which satisfy DMA buffer allocation and big chunk of continuous
memory during system init; and avoids to stir with BIOS/FW reserved
or occupied areas, or corner case handling/work around/quirk occupied
areas when doing system init. By the way, the top-down searching and
loading of kexec-ed kernel is done in user space utility code.

For kexec_file loading, even if kexec_buf.top_down is 'true', it's simply
ignored. It calls walk_system_ram_res() directly to go through all
resources of System RAM bottom up, to find an available memory region,
then call locate_mem_hole_callback() to allocate memory in that found
memory region from top to down. This is not expected and inconsistent
with kexec_load.

Implementation
===============
In patch 1, introduce a new function walk_system_ram_res_rev() which is
a variant of walk_system_ram_res(), it walks through a list of all the
resources of System RAM in reversed order, i.e., from higher to lower.

In patch 2, check if kexec_buf.top_down is 'true' in kexec_walk_resources(),
if yes, call walk_system_ram_res_rev() to find memory region of system RAM
from top to down to load kernel/initrd etc.

Background information:
=======================
And I ever tried this in the past in a different way, please see below
link. In the post, I tried to adjust struct sibling linking code,
replace the the singly linked list with list_head so that
walk_system_ram_res_rev() can be implemented in a much easier way.
Finally I failed.
https://lore.kernel.org/all/20180718024944.577-4-bhe@redhat.com/

This time, I picked up the patch from AKASHI Takahiro's old post and
made some change to take as the current patch 1:
https://lists.infradead.org/pipermail/linux-arm-kernel/2017-September/531456.html

Testing:
========
Only tried on x86_64

Baoquan He (2):
  resource: add walk_system_ram_res_rev()
  kexec_file: Load kernel at top of system RAM if required

 include/linux/ioport.h |  3 +++
 kernel/kexec_file.c    |  2 ++
 kernel/resource.c      | 61 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
