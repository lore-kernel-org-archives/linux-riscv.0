Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CE2E77188
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a+4WzIyZCuEQJW6HyScpJZpo8GuffY85K38tDYCkwDo=; b=cHnNdCSmXth6eb
	CRoMCxhPuQ6Djvro0kpMkxFMMd2y8xHHsu7c6mspPG9XQqfVhDAf2y/M4mucYECUJslPrw1r0w2DT
	iWrAGj61uxLU9JqkEZbIQsLQ4CW1vzWog3P2Fs415skW27mvnyl7ZfKmqa2CQAz6lt76X8BOIj4P5
	6JjXear8dnlHJccx/2yduDFyaJ4/iWGUFiJW2FpPHA9CUfytPgzdmQ5hnC8B5MdMgbwG0DHgJaygU
	E5oS0x42qhkhdWsl+CmI423/GSMTaVrmvAJRggMkbMRxT9XEQgXxldLBe0Q88j6wRtZbUCwXH/x1N
	F/gbgjJbsjj8dxlCyixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPkj-0000000HQqJ-0N05;
	Sat, 11 Jan 2025 00:53:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiM-0000000HQLh-3A1R
	for linux-riscv@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Reply-To:Sender:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9xron+KThU7T77R5VL2QV4m0fAH5NzD4XXNwhcBHEXQ=; b=Jnyizcz7AXZPUzAfIfnNeQuH6a
	vu7TZ9fXSkhRvNYsVoDMc4L2jrOr+C8GgSJLUc+oRaEXbixiW96sjLVYCUocQMWI5a8P05vcXhvNW
	zwJfcZQ7eIEKMbuk2Oy7Zi8PU5gIp+V/rlQICLkwP4yy8C7svVP0ibOng+5NfJVMAu2563SnbrYOf
	FK4o8NRCRLRpxVcIFqgoR7dqTkQbDcn6nByfTaKNQc6k8VSxcySW38EjyQx3bNGWFrdG20hH3zKR8
	JnQ/XYICT6pKS3y0NF75LMvgNIo8opvNODhenPN4Ih5vY1+wSQCGtjGHUpLeJhqPwC2Q800v92ZbI
	6vtIhRtA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiJ-00000009yL3-2WIu
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:50:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef728e36d5so4812759a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556652; x=1737161452; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xron+KThU7T77R5VL2QV4m0fAH5NzD4XXNwhcBHEXQ=;
        b=DUF/pvUe1GyOJnaDxbJ3MNai7b0eIuV8a3V19fvMEHvvE5Sw7O4e++F0ZjptgLKs9Y
         jewklpyZWMOI4jFqHWtlFog1vOB5sXCsxmJ3u8Ac7XDOMt2aQ9bYuy0cvCR2lCyRoBLP
         cM01EmkX43QAKYbvz2MVLvBLKRCqZbOFupyCGbY7qb8SxvoGwTjWxNuqMcq849HH+mcJ
         gVAkeyePCbFgMpPBPcNJK8jVVy6IMgdVFaRvlbPbTKqbBpXowpHKXwy70qulEu2kh3hj
         hbh5aPew4xfPFOkrVRNzUPhM8HVVXebEhfDQv2zKkd8A00I58Nv+OYHBwfRJx5Oh7iCu
         EpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556652; x=1737161452;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9xron+KThU7T77R5VL2QV4m0fAH5NzD4XXNwhcBHEXQ=;
        b=u0WlF1xs9+2XSqfuoZjsvWEovXeDmdoDWIKrJ8TpjUNuQeLi1oJoLEqAV6UtblfKEE
         i9RciiSNbLQv/EvFRZdHmHzStMnwNtmEBkSpPeLqjaTfRmlcIWekxKHAZv93DMdjFLgq
         fq87ez7Ga2tjjypl+qEkuDytaV0Xwtzkuoa192vpmiwT6II9IIp05tsGV5DleTDyNK/3
         r9igPdGnOJVnzZXrtxoXSGlrsagdsrUizm+1HINBGnyBd4ofInldJ23gWDlCrZi6CgGy
         FLS4k3ta34U8naXitpebYFrX2EjBtPlYIr+3KaK/1NOTquITbK8jNidlMwwx/pSMqIh/
         cxKA==
X-Forwarded-Encrypted: i=1; AJvYcCWjeBQtLc2BxB4581setSF9o7+jAQNeeosmxnOzAkmLS1Bl128lviSdq4bG0gh+9FOJ7lz8W5MmS6/42g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNFoddaFxCMiOhjD/AnxaxbHoG5Q/3DOkJDqH7Lof3p/QVf43k
	sidKETmo9/xC/mvUxRKT+HpYiqtoy7TujC8jbLQGWG+6rdLCPbvhQMfI1OxG8Wk2enjDyTf9tSn
	Feg==
X-Google-Smtp-Source: AGHT+IFGHtmLK/IYHq0Rf1GMc11fdZBgGQoU3n0wFrQS04Q/FED/wp6nrTmZr2LCO3EYVe3us4g7I58uwQQ=
X-Received: from pjbqi13.prod.google.com ([2002:a17:90b:274d:b0:2ef:82c0:cb8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a44:b0:2ea:61de:38f7
 with SMTP id 98e67ed59e1d1-2f548f1d420mr19019162a91.29.1736556651751; Fri, 10
 Jan 2025 16:50:51 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:40 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-1-seanjc@google.com>
Subject: [PATCH v2 0/9] KVM: selftests: Binary stats fixes and infra updates
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
X-CRM114-CacheID: sfid-20250111_005055_816293_E72A43E6 
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix a handful of bugs in the binary stats infrastructure, expand support
to vCPU-scoped stats, enumerate all KVM stats in selftests, and use the
enumerated stats to assert at compile-time that {vm,vcpu}_get_stat() is
getting a stat that actually exists.

Most of the bugs are benign, and AFAICT, none actually cause problems in
the current code base.  The worst of the bugs is lack of validation that
the requested stat actually exists, which is quite annoying if someone
fat fingers a stat name, tries to get a vCPU stat on a VM FD, etc.

As called out multiple times in v1, I'm on the fence regarding the last
patch (compile-time assertions).  My plan is to apply everything except the
last patch fairly quickly, so that the vCPU stats stuff in particular can be
used in x86 tests, and hold off on the compile-time assertion goo until
someone comes along with a strong opinion one way or the other.

v2:
 - Update rlimit number of files for all "standard" VMs.
 - Account for the vCPU stats fd when updating rlimits.

v1: https://lore.kernel.org/all/20241220013906.3518334-1-seanjc@google.com

Sean Christopherson (9):
  KVM: selftests: Fix mostly theoretical leak of VM's binary stats FD
  KVM: selftests: Close VM's binary stats FD when releasing VM
  KVM: selftests: Assert that __vm_get_stat() actually finds a stat
  KVM: selftests: Macrofy vm_get_stat() to auto-generate stat name
    string
  KVM: selftests: Add struct and helpers to wrap binary stats cache
  KVM: selftests: Get VM's binary stats FD when opening VM
  KVM: selftests: Adjust number of files rlimit for all "standard" VMs
  KVM: selftests: Add infrastructure for getting vCPU binary stats
  KVM: selftests: Add compile-time assertions to guard against stats
    typos

 .../kvm/include/arm64/kvm_util_arch.h         |  12 ++
 .../testing/selftests/kvm/include/kvm_util.h  |  51 ++++++--
 .../selftests/kvm/include/kvm_util_types.h    |   6 +
 .../kvm/include/riscv/kvm_util_arch.h         |  14 +++
 .../kvm/include/s390/kvm_util_arch.h          | 113 +++++++++++++++++
 .../selftests/kvm/include/x86/kvm_util_arch.h |  52 ++++++++
 .../selftests/kvm/kvm_create_max_vcpus.c      |  28 +----
 tools/testing/selftests/kvm/lib/kvm_util.c    | 114 ++++++++++++------
 .../kvm/x86/dirty_log_page_splitting_test.c   |   6 +-
 .../selftests/kvm/x86/nx_huge_pages_test.c    |   4 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |   2 +
 11 files changed, 324 insertions(+), 78 deletions(-)


base-commit: 10b2c8a67c4b8ec15f9d07d177f63b563418e948
-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
