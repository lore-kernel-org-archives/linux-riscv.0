Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F722C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n66qFVBBVnriZp4E6k5hejc/uq9i9NeWwyPGGNZFuwE=; b=thTRwM1U98grdG
	kOxw5D4XOSKmdQH6CUuLWuo91ywjWINnzmlcNzlHlGkRa41IAUHLO0nVm1pLoMZ1xvXFsrudAEgRF
	IJz33QpE7jKPPMfGhPzHatEdknzdvDlQjxvwL0ik3/l0hyFdwSlR1COyYFYaN1wrcsh7p+3muI7i6
	1FqzzVbSlBhLhHXojyS/+kObPZjEuojqIE5K63yEJWlLWau+/zgzWAfeNP75zAqFH7nfNz2JuxGR2
	4ScRfQSaZRWr+cSH6bxGXKlIQgDhnMwRz7wIucPqHiXDvDtuzFl9PAyH0vyBImAKG3t/4TdxcgW34
	k3mCgbIHUtL6JSOaMzkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1N3-00000005lbn-1ZLs;
	Tue, 12 Mar 2024 12:36:41 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1Mz-00000005lZy-3Z21
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:36:40 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-29c4fe68666so131819a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710246996; x=1710851796; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gL1AqKbDgF77eUGaRWh04mFqtvQeccdHou3cDA87rIE=;
        b=JkDmE0Y8BY07Pu0yi8vRzOFJTJ0cfSHrksqEU8Z7rBemdDSfkIG3hU3H8NirpnDyT6
         390LbTLC9zyuSlHSqAbWie+3ifLz+hqalOcqZJKppTS7EKgUZL6cCasg+V4oclGWSsmg
         OsHxdoJVaCJaIA9YQ1jj73tIcvMqG6do6NcSTcHqnk3ddtqn0nmlMd9PH6CQ9vteR9vz
         IyHDNPuPYd6Y7GtepGgGaGp5iNvk2v18+byoNsazIa3GKRUVmOHjoR8CK7tnS9fL/BBG
         lZ0A3ZuyVN4KScETSqWwexOYWz1IGf6rO3+hOusIi7omiYdfnW2svXUxtmqm5HFDBHMa
         vbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710246996; x=1710851796;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gL1AqKbDgF77eUGaRWh04mFqtvQeccdHou3cDA87rIE=;
        b=bJ/4dbBgd4qpMYnSMScdm+klMKIVP71dhfC3v2E31O+5p0g4jSXPymzsAbnHl1zWst
         uuB2GLqaCwbCe9bv/6LGweA3lRH6Aw6QPxFuQumR+RUfgEN1bbrFvCh5d608aE5yejoE
         w34iOM15xhh8fORwB2f3O8OmUt+JumqQY8jx4UA54y7gRqxOFRWMu4Jy/2z6Qf6wCDW4
         sWyz8XMlrvij3TpKwxs5p5d5AsDp3I0wGOfOETuiJK2TvWzj1m+2vd3VCnvVYRtX5AKQ
         Pfce/fE3CYOdgPs1jBtYes6maP60P+f2P/D9sjorg5DC9pXgwPcogrEmGksNBgo0QKPH
         N+vA==
X-Gm-Message-State: AOJu0Ywsq2COHJ+/ZcHJOC2P80QvKZx0rj+AYYGYsuFcst60yjxFOrcD
	lu/NzhFgegyyp+TCXsHKIFbCfDPYlaqJgn8GXA3I09isvRMMALmdLKF44kgM0qnRct3HtynqNxV
	qzAuNZrXfpiwTTFoyGqcCqy9X54gMVLW0kqq2LpHAeE6YymLzNEBpLP7M42QGSy2rAR46Pv6nwc
	fMIc/m7r678KZUZ/OSPvpx8oH6+Eq5hgyv6QJ8tBuMa1Qzmyje2DfR
X-Google-Smtp-Source: AGHT+IFqYZ/DzxGwe2i5+ZW/8/kbRHzUrYcDkJpR97fnR8PCFUUbhwpSC52QesBd718zrSuw6K3pWQ==
X-Received: by 2002:a17:90a:ac11:b0:29a:9ed9:56fc with SMTP id o17-20020a17090aac1100b0029a9ed956fcmr187889pjq.32.1710246996462;
        Tue, 12 Mar 2024 05:36:36 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id hk13-20020a17090b224d00b0029c2794d3f7sm1804233pjb.7.2024.03.12.05.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:36:36 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: [v1, 0/6] Support Zve32[xf] and Zve64[xfd] Vector subextensions
Date: Tue, 12 Mar 2024 20:36:21 +0800
Message-Id: <20240312123627.9285-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_053637_972170_D34B2631 
X-CRM114-Status: GOOD (  12.68  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The series composes of two parts. The first part provides a quick fix for
the issue on a recent thread[1]. The issue happens when a platform has
ununified vector register length across multiple cores. Specifically,
patch 1 adds a comment at a callsite of riscv_setup_vsize to clarify how
vlenb is observed by the system. Patch 2 fixes the issue by failing the
boot process of a secondary core if vlenb mismatches.

The second part of the series provide a finer grain view of the Vector
extension. Patch 3 give the obsolete ISA parser the ability to expand
ISA extensions for sigle letter extensions. Patch 3, 4 introduces Zve32x,
Zve32f, Zve64x, Zve64f, Zve64d for isa parsing and hwprobe. Patch 5
updates all callsites such that Vector subextensions are maximumly
supported by the kernel.

Two parts of the series are sent together to ease the effort of picking
dependency patches. The first part can be merged independent of the
second one if necessary.

The series is tested on a QEMU and verified that booting, Vector
programs context-switch, signal, ptrace, prctl(sysctl knob) interfaces
works when we only report partial V from the ISA.

This patch should be able to apply on risc-v for-next branch on top of
the commit 886516fae2b7 ("RISC-V: fix check for zvkb with tip-of-tree clang")

[1]: https://lore.kernel.org/all/20240228-vicinity-cornstalk-4b8eb5fe5730@spud/T/#u

Andy Chiu (6):
  riscv: vector: add a comment when calling riscv_setup_vsize()
  riscv: smp: fail booting up smp if inconsistent vlen is detected
  riscv: cpufeature: call match_isa_ext() for single-letter extensions
  riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
  riscv: hwprobe: add zve Vector subextesnions into hwprobe interface
  riscv: vector: adjust minimum Vector requirement to ZVE32X

 Documentation/arch/riscv/hwprobe.rst   | 15 +++++++
 arch/riscv/include/asm/hwcap.h         |  5 +++
 arch/riscv/include/asm/switch_to.h     |  2 +-
 arch/riscv/include/asm/vector.h        | 21 ++++++----
 arch/riscv/include/asm/xor.h           |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h  |  5 +++
 arch/riscv/kernel/cpufeature.c         | 57 +++++++++++++++++++++++---
 arch/riscv/kernel/head.S               | 14 +++----
 arch/riscv/kernel/kernel_mode_vector.c |  4 +-
 arch/riscv/kernel/process.c            |  4 +-
 arch/riscv/kernel/signal.c             |  6 +--
 arch/riscv/kernel/smpboot.c            | 14 ++++---
 arch/riscv/kernel/sys_hwprobe.c        | 12 ++++--
 arch/riscv/kernel/vector.c             | 15 ++++---
 arch/riscv/lib/uaccess.S               |  2 +-
 15 files changed, 135 insertions(+), 43 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
