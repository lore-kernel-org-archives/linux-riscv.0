Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F69BC64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 19:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fS14RHxZOuylZnS6fNgXFI/vJr1XqqET9MmXgDhkUII=; b=2IL
	oYZ0hzIYXNHHqjcE9+bSyQb5al1hd8uKZbMzuUIeHZML9T5BWbZlDt3tqWPWexdyqcZh7zGee3li+
	V7OrzFHh7IdmFhWK2puFwY8mlljX8RocC0WoLUPW0eHjo8b+MIIt1LFtwPhp32o8whj1hvtj4WOIr
	EJngs5Qa5r+U94VLjgVh+rz2eCfUdDCbDKMQibvLctIyJ2/o814C50HphWsh/bTCvUSu/44gdkUDr
	GKrHdB1phG09mlbCIcrW6KJ35UpCKQuE8pktnMkOVwECeIgUqxaQouat43PSvRQ1nP6g+F9RJtUQa
	4EQ16Jso7WkuKGDoq86/58fGL8CfJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG60-00ERWT-Vx; Mon, 06 Mar 2023 19:02:05 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG5x-00ERTd-Ic
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 19:02:03 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id a137-20020a25ca8f000000b0091b90b20cd9so11468761ybg.6
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 11:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678129319;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C+DxnQV3hp0RGd+ug96FCObNfG/ILFIXHP4OvcDjXtA=;
        b=VWgYmSrmEfZIk/6E1VMbGjDaim/LrqhaEaWbHuc+fH+V6S1DKdJkRtZ34FezlMlvhM
         U6mcoknL3sAYb7G1m+RD4Ig6gMHZ3RTQuTmwizQCiRBj2rGy41IyS90Qy6jvQXVsrewL
         9SFoAxeMBzW5t2TD3YILUvsMiBUCUbLVi57NBysGJg1yYn7YuGGMcpOxrx1eRRLBIO55
         6Jbb9BwFCYffUcjzVZAFu0HkR94u7+bMfdsXfZ8y0VaWIgzYSxnsXzYIhqkR9LOZ5C0I
         6G5p1/Kff9hdoITAYU26Wdj64V3gzTqUAgddrH7mg7Qk+8AvTWLN0NmGqN/B0ffPRXLb
         3ITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129319;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+DxnQV3hp0RGd+ug96FCObNfG/ILFIXHP4OvcDjXtA=;
        b=Dj/7Svcnh9rCRadD1q0uGNoy0o/wfE+wkKSHe1LrYyKKt1HHxuGw96JbDvcq+3d/da
         iqLTL3ZPDC2zFBeJnRGN3KTu+qATHo04Dp9A4TsiTi4QMbKnEVccmMqwCbr1W7R9koZF
         O5kndtIpN9M0FAopdPsgHQztrTtbnJey4Uvp2wbT5qgnzSJFpAsLLFVUgew7thfiMO+E
         JNLRnK4b3jE2c5mkHfopEbzg7Dc1ehoyECn6fSemngBCtlkUrK1FaTQCbeFYJmU9+MqJ
         CcGwOyaBIV/6oHco/Ayorg1TgR3or5CFjfIRBuZjG8i0OBiMZkNiPCAgGA0Ka6c8qwUC
         TP2A==
X-Gm-Message-State: AO0yUKW5K+tSO/7qyiG27EtNnL5tut4uyBTJJwkhZYfwOedjXktd1n+c
	3W5PPrtI9r7TX/4VxSuXP3qLpeD4SCJnTw==
X-Google-Smtp-Source: AK7set/pVosUQpXpF+342Y6QcFu+4eURtJP2+OiNzV4zJi7D/yZ3hybJi6gL3lLKDOrFj5EE1HIssi/eN+VpiA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:b723:0:b0:536:38b4:f51 with SMTP id
 v35-20020a81b723000000b0053638b40f51mr7493840ywh.5.1678129319569; Mon, 06 Mar
 2023 11:01:59 -0800 (PST)
Date: Mon,  6 Mar 2023 11:01:52 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230306190156.434452-1-dmatlack@google.com>
Subject: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom stat names
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Eric Farman <farman@linux.ibm.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, David Matlack <dmatlack@google.com>, 
	Sathvika Vasireddy <sv@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_110201_651824_1A51FDEF 
X-CRM114-Status: GOOD (  10.07  )
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

This series refactors the KVM stats macros to reduce duplication and
adds the support for choosing custom names for stats.

Custom name makes it possible to decouple the userspace-visible stat
names from their internal representation in C. This can allow future
commits to refactor the various stats structs without impacting
userspace tools that read KVM stats.

This also allows stats to be stored in data structures such as arrays,
without needing unions to access specific stats. Case in point, the last
patch in this series removes the pages_{4k,2m,1g} union, which is a
useful cleanup to prepare for sharing paging code across architectures
[1].

And for full transparency, another motivation for this series it that at
Google we have several out-of-tree stats that use arrays. Custom name
support is something we added internally and it reduces our technical
debt to get the support merged upstream.

Tested on x86. Compile tested on ARM. Not yet tested on any other
architectures.

Link: https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack@google.com/

v2:
 - Refactor stat macros (patch 1) to reduce duplication and make it
   simpler to add custom name support [Sean]

v1: https://lore.kernel.org/kvm/20230118175300.790835-1-dmatlack@google.com/

David Matlack (4):
  KVM: Refactor stats descriptor generation macros
  KVM: Refactor designated initializer macros for struct _kvm_stats_desc
  KVM: Allow custom names for KVM_STAT()
  KVM: x86: Drop union for pages_{4k,2m,1g} stats

 arch/arm64/kvm/guest.c          |  14 +--
 arch/mips/kvm/mips.c            |  54 ++++-----
 arch/powerpc/kvm/book3s.c       |  62 +++++-----
 arch/powerpc/kvm/booke.c        |  48 ++++----
 arch/riscv/kvm/vcpu.c           |  16 +--
 arch/s390/kvm/kvm-s390.c        | 198 ++++++++++++++++----------------
 arch/x86/include/asm/kvm_host.h |   9 +-
 arch/x86/kvm/x86.c              |  94 +++++++--------
 include/linux/kvm_host.h        | 179 +++++++++++------------------
 9 files changed, 314 insertions(+), 360 deletions(-)


base-commit: 45dd9bc75d9adc9483f0c7d662ba6e73ed698a0b
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
