Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F011AE7719D
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 02:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/d3OrkX5SqWGpqEugxZNEAx9Yx6nPdJVmq8wj7MvBk=; b=CzCAlPYcmyWQ4y
	Wjrr8xK+t7T1psX4NXoqCwVwGRYChus1ONnz2EcEGWYTDH5eqTZgc0NmasBdN7cClneO8pq8J0cQU
	MJlI4Ozt2l+8qq3Lhf+a3HNXUQrFgF8ny+6yM2+n4sxFdob2Ayy4zID7NYdItJ8+7h4OpG7DB5qS4
	yEVI3hcePBFOvpGcAcxcSsxTXXvdddA1n3C/03r5JeyeGJxTIbG3eM0LC6Lz7R3yNXZwwtoeVPD5e
	rq2z7qUlsmces9ry0r8FEb9yN3HvARD37i6rM/4y+lBCJB76VK0CF1pn2wLqmaRTxm7V+OGVDKVTM
	p2rgaCKa7Pp3IFQF3M8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQud-0000000HYGi-0CN9;
	Sat, 11 Jan 2025 02:07:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiL-0000000HQLK-42pk
	for linux-riscv@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OYKvlAfMuP2ktBfEDhDytfcvSdR/S4IqDZKQdTsYjuw=; b=p+2thsV1/0XAtPS0ZKPsnN6aSv
	Y9Iu/2nw0BxJwl9Hit2sS380HZ4GSrKl2Nqk0uWOF01mg7HU7PT+AsXI5M9TD/w/2DBP37+RElasZ
	lHtVXfKQqEiDZUzuuPuwDsxzIMII1ZrUmLv2u0Ztf54LFHouGW3mwvfER6Yb5umBaYEMpVh7NKVe2
	MdE6cUXD1YsIrhZP+9uyefVPbVCrQ5/qAD65daZo+R4/iEKmCNXVH5TEueLTZhW4CN6V7udnEKYyx
	1hnLIJNbPPQGrpIch7aSpJMLgSGRAoyZY6k76sPZwqCf/TeLriK65fcDxMYm+TtLPl097ZLyq12A7
	bQ+U3AUg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiJ-00000009yL4-05Pa
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:50:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso4788196a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556653; x=1737161453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OYKvlAfMuP2ktBfEDhDytfcvSdR/S4IqDZKQdTsYjuw=;
        b=OA69/A4/KfX4HzRof7rHdAncGhFb3FwgK/3Z4ZVmAI1CkrSYi41sh1GllhZfpO5pH1
         d/Mzdh6MT3moHhGgljTpBlnVBdxXYmbNpsk3g0bBCyxErFGUb9ACJo+7Pdy5HhdR+qlP
         bp6VoLc5/dKzvIeqBIwiHLyiYL7V+72WIBoIxb2MDhWRN5fWuCWrWq+fW017dgTCoZow
         QSsxXfrkuGwBdvZSTM35KMkrzRO0BCUjPD2NEzNfof2Otc771Ol8512bu0HqwWI5fJff
         q+8G5YFSv+eFLmBy60/j+IylJ5Epmdx4vIeQhnaQbnm15/6SyhbZWTbJ116zSDfhcj6O
         PPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556653; x=1737161453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYKvlAfMuP2ktBfEDhDytfcvSdR/S4IqDZKQdTsYjuw=;
        b=psceMpjx0YUagoVeuk6sPuY7vUW7zhhqzqO+r4xdDojyQd4o1cAnSjDmbLW8BGmx+e
         s7/HYxubh+q3c6PWTcUnS3ntTTQauDPtBvb8Z3FIg+CFRWFXaHZuoqB6q/DLKizQYkzd
         afBvA5FfgD70vYKsJu7w0yUDOKjfiSy77dIEX+cK22MJhcm+aPmmjrjnogQ5X+T8pa7J
         7WuSyvxIAfikrIIABv/YR9O+UELZTgM4qZvJon5DeZ6KEq/+cuy6a4aXULZYMw10zeMm
         TYR6dihw3kbVrCPwgmCmlr/PcBWhlxh4fuCw3qyByGXynDxW5ItdDVVWyOB6suSzVXNV
         jz9A==
X-Forwarded-Encrypted: i=1; AJvYcCWyAWS/U+whfYMUwiiBWp/9HO3Icl/zf7AVjhXdnd8ntzjkFKkO1a4mlAUOipWUdFZhvGxIlD6tedwzbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqT6/+25bI/OpCOaFwFPyhoU7+0UPVIxr9ZIm6/rxo3ucKTCP1
	Wjd3Tkgd+fWZ8Z5FxWJveB3PZC2OScN/dMIIKjlfN2oQmrSQy1mShV1sqaE6HmhItIXB9eFyezH
	72w==
X-Google-Smtp-Source: AGHT+IHC7L4dio3zRElUKJK6ZXLcnIeUcETaJFiIoDB9K4Jc3JVwsDgdf+5YQVS28IyDhPWQi08akvDOKi0=
X-Received: from pjbqi14.prod.google.com ([2002:a17:90b:274e:b0:2ef:d283:5089])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0e:b0:2f4:49d8:e718
 with SMTP id 98e67ed59e1d1-2f548eac0bfmr19303629a91.9.1736556653508; Fri, 10
 Jan 2025 16:50:53 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:41 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-2-seanjc@google.com>
Subject: [PATCH v2 1/9] KVM: selftests: Fix mostly theoretical leak of VM's
 binary stats FD
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_005055_274579_C295DCC3 
X-CRM114-Status: GOOD (  11.03  )
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

When allocating and freeing a VM's cached binary stats info, check for a
NULL descriptor, not a '0' file descriptor, as '0' is a legal FD.  E.g. in
the unlikely scenario the kernel installs the stats FD at entry '0',
selftests would reallocate on the next __vm_get_stat() and/or fail to free
the stats in kvm_vm_free().

Fixes: 83f6e109f562 ("KVM: selftests: Cache binary stats metadata for duration of test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 33fefeb3ca44..91d295ef5d02 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -749,7 +749,7 @@ void kvm_vm_free(struct kvm_vm *vmp)
 		return;
 
 	/* Free cached stats metadata and close FD */
-	if (vmp->stats_fd) {
+	if (vmp->stats_desc) {
 		free(vmp->stats_desc);
 		close(vmp->stats_fd);
 	}
@@ -2218,7 +2218,7 @@ void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 	size_t size_desc;
 	int i;
 
-	if (!vm->stats_fd) {
+	if (!vm->stats_desc) {
 		vm->stats_fd = vm_get_stats_fd(vm);
 		read_stats_header(vm->stats_fd, &vm->stats_header);
 		vm->stats_desc = read_stats_descriptors(vm->stats_fd,
-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
