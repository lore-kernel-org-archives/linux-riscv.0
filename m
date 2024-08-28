Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5750C636ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 18:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l0BaeQEBCzfxuVUgK5zmnk2JYv5Sf2U8hqjMeU5YD0Y=; b=mlZc3zY0sIIsBk
	MV6pK/P+LoAVqixhcmy75XU/voM9qipuMRrFKwLlRWIDcESdNECQH9SPuPNnV+v0HtwYpHhhCcRaO
	24AXf0gZK/NB+JUxsfI2x2oq+6OiIvENiJo+KezLKWmIrzh6WVlVQeh6iCutWBs2MmtnfpS32g33v
	tblzxFyg4Yb3NyF/72Vj8sQqrIyLkY8L92AIEqNglEHRGUT3JkFovFthpnt0vDcoVbFlhETQQU7Jb
	KULvBUkiogwkIWLfrjidg95LfWHNUQk438L6So+cobLnebSD48lAcu3aff0Ns5RSdzgaiuEHQJwGC
	h/X1Kbu1fLIkzjutKY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjNC6-0000000GVm8-2FQ6;
	Wed, 28 Aug 2024 18:14:58 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjNBz-0000000GVi7-3rAw
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 18:14:53 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0b3742b309so12585542276.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724868890; x=1725473690; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOTuctWAQz/uwHvaj+krenR+3V9HGV0qn8wI1oPN3U8=;
        b=vKIwyoz9U87vq02KOvBv0fv05PYQCZXyUE4gVL2urvjDAoTtLEJ4WMJ1OZFqGuSiX4
         XQasUTkejqn4tQ4Y19vFGymD8D7ejJM873o0XEHZ+ZbAmLi6pRem4d3qOX2h4HjoF+GF
         0FDJ0jVe+f0YzEol7TE1DibWjVadzpG0472jQ6HDmP3Tv7ArdnSi9LSDsCVIso+vQSdv
         Hd7XaDyKqC1TPESwJaBPlvu+y092U7U3xRfrBPIfVuoRWCQZ0XGAhLLo0lZ9jAWWO/2r
         ufffhQXE5iB/3+5mR92S8LesoKv30s032yQqW+jduGnPQCUTCW/n6ksBC/EPYclUwj9J
         HugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724868890; x=1725473690;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOTuctWAQz/uwHvaj+krenR+3V9HGV0qn8wI1oPN3U8=;
        b=q9EIjk1KyWf0OaLTrekX6PslKcLUnU5rkA1EDPdHAV9QSNAhMs8NcjVryCamRV3Tzq
         XJ2VwryPAN+ARzWatGXPmyQbvcibkpr1+n9lChgdWtejBNKIN2ed97GgNT5wX6sZUPEf
         jRIFSa7P1iRw/HbshBDMqPO4cnSgDERseInTKxBjPkIjzev5IK4Njn0DkakvQ5rQTxhS
         nYH78znPrYRHqy5LxAHmEuvAAnTdVoe/QcakHdxnquos3Pi8HxMTtZTv2qEHyVpR+V4Q
         GWvyQJBrzOMKMWVS7K2ISkLpw4HP5QtWY4Z59037pDt8eIoHDDvLgQY5sgfSeEIVsTKW
         XYsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvkraTcdHdG8w42NcEIERH6QwNFcUtUP3abot43VK7PcYdOUnnptP3VjG2+wInYZB3Y4sXwzUXubUcQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5pHiKDKb5DWkENATOkG6nppXy0G4n4WDOga8a2mcfGSFBVGFw
	yJ7FD/0iHcuYlgyFQSTw8aieOWa2uCCW8BQT2ao65B7oHfRLM+5hb/PJPcYJOh1hbDEvbLUuvUv
	K3g==
X-Google-Smtp-Source: AGHT+IG0qH6fA9bRjxhpjRUB2InNr/s22CMQVHqs6u2Z8BKUP2KlijIIpCznt61+Js/vDVlK65vywKUevps=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:6906:0:b0:e0b:a2a7:df77 with SMTP id
 3f1490d57ef6-e1a5ab5894dmr1037276.2.1724868889792; Wed, 28 Aug 2024 11:14:49
 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:14:44 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240828181446.652474-1-seanjc@google.com>
Subject: [PATCH v2 0/2] KVM: Coalesced IO cleanup and test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ilias Stamatis <ilstam@amazon.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Sean Christopherson <seanjc@google.com>, Paul Durrant <paul@xen.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_111451_979163_1FB36EA5 
X-CRM114-Status: GOOD (  11.66  )
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

Add a regression test for the bug fixed by commit 92f6d4130497 ("KVM:
Fix coalesced_mmio_has_room() to avoid premature userspace exit"), and
then do additional clean up on the offending KVM code.  I wrote the test
mainly so that I was confident I actually understood Ilias' fix.

This applies on the aforementioned commit, which is sitting in
kvm-x86/generic.

Fully tested on x86 and arm64, compile tested on RISC-V.

Ilias, I deliberately didn't include your Reviewed-by for the selftest, just
in case I botched something during the (minor, in theory) rework.

v2:
 - Collect a review. [Ilias]
 - Fix a typo in patch 2's changelog. [Ilias]
 - Rework the selftest to containerize the coalesced I/O ring and its state,
   to hopefully make it easier to extend the test to validate using a ring
   other than KVM's built-in default. [Ilias]

Sean Christopherson (2):
  KVM: selftests: Add a test for coalesced MMIO (and PIO on x86)
  KVM: Clean up coalesced MMIO ring full check

 tools/testing/selftests/kvm/Makefile          |   3 +
 .../testing/selftests/kvm/coalesced_io_test.c | 236 ++++++++++++++++++
 .../testing/selftests/kvm/include/kvm_util.h  |  26 ++
 virt/kvm/coalesced_mmio.c                     |  29 +--
 4 files changed, 273 insertions(+), 21 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/coalesced_io_test.c


base-commit: 728d17c2cb8cc5f9ac899173d0e9a67fb8887622
-- 
2.46.0.295.g3b9ea8a38a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
