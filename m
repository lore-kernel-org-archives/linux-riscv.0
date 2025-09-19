Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FD0CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ca/FUgePb9DXtdG0qLGrNN+BnzMMTRL7dvFN6t1OQ7I=; b=gu2Hsy56PJXXno
	SeuZMEI/bWyAOJueqGRdzIbC+nE9s/KA6+e9m2a2MidxSpclu+AYn0Xnp35SRaVDFGraohwljNz6g
	bSYgfjyjzqLEVzeAaaFtG/5bHxrKznISmnWRKUfZTsBoIABWfDenh1Gu5XfxQnU26if7QBY/2GALd
	qZBY0dgg4uPUugnx6nvLzpOhxd55jlekmBYaics7kFQoW0d3c4NcSALdffl3ejfDtd6wFjy/qqysF
	hjjGueYlpVzuJX/VpNoxDx9ZrRGl0PHrEFJZGiaS6ozpxrthFyACsRq5EgJktr/+qLCBCzhKHS+TN
	8NqDadhwLMC8452FEMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgU-000000025EO-2xGH;
	Fri, 19 Sep 2025 07:37:34 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgR-000000025C7-19nM
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:37:33 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7725de6b57dso2454292b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267449; x=1758872249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQi8kkf+E11TPqHviak6Q179Pwf94vhIPRCTAWlGN3c=;
        b=Nt9U9R4JqfMlrzoWM1xn9yGioyHkAPiizeQ3epFKxbz6q2+RdwpNw/DJBZSnXzPdic
         vmyeLYcCjeyP1ZMEjjXF14XzHC/ksMJ+KrU0mNXS4/tVMCFizAw+y0lsmjkQrqx28KAB
         N6QzTHzsClQQZ+PKXmX4fnvlv/Cjdz7iNRU/ZKbHDV9ZcCfpq90NYl/jwRCo2FXt2cP9
         orppQf6JoEjHdvzJR/kpoyeXdiz4Ov2YkDy+KmdUCyKdEFQjaXZTOl1kddyn/0ecMp8q
         IdpTcbk/13DH40NLxaT6uDKygg9ubLhwG1ZmAJQvJxuLa9xpP3dixc6VTkCxp57Vlo44
         2wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267449; x=1758872249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQi8kkf+E11TPqHviak6Q179Pwf94vhIPRCTAWlGN3c=;
        b=oO5+z/TyfTapWsjeoqOYKoE+GAy4vw/YbWybJlHoZBGIKJgE3nFu6ATakEJNo9xb4n
         RvutLwYSgtByZHexqsyxdOs5Nap1n/dK1BcJPTlWZBK6aCCoGdP4BaD/Gy2Vm44BfQpm
         88IbHlaABF767tqirhVpeEhV9mmkoSsrw4/Uq/mGQLLIWP/OGHG5x2p1Lw5LixNX9VyD
         rVN5mvaymVQeDGKw3jWEbsFCCQNzFUmHUksZo+5uYaEUsHfRNTftJVyM3w4KgHt7TAND
         d1XjyeY81zqf2cn3PhWWCG5FcsBOI5f7/mpDVGO5FhcrNJmEEh+CJe0qu98bDHEWu0RD
         S1dw==
X-Forwarded-Encrypted: i=1; AJvYcCXla6DbCjuLSXvlSvfRhSB6+7PPp1EniBLD2Y4VW/EY52NhTeCzB9O/Q/6mv+mxdN6L0L7bDg9CDMl6/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYAk+MCcRIjAFN/AtfLqVFmAZPT6Id27l3ksNOdNAF0WH/1OZi
	698+XVEmszr/R+ZbegQAPkntzy0lW7T7k7qLXADAoDIYKtKeR31NYjXVMqDl71vTDkM=
X-Gm-Gg: ASbGncuxAb5iZK6xC4LEMwGnNX3gWq+nhRXeqpbW56OL1oFL1RWxi/GgR8hhBo2dIW2
	NDRxs1DoaLTnaQHCipf0OnMJYL4IYevgkhjERRXAulEkQ0dECHF6xpdDz/3rVt1aw0UTvxxbxuM
	vWyDSRZMloZ8l2vbwh+nDxqpb6+73z14R1FEi4gaZgb5NgI3cfswA5x2uxgjyGqyOmtGGTUJss8
	4tL5R5DCBfhyVev9VXVKkMsBbosXvkfvkgdk9jA+jKG5uBLeCh/GAlxtPzafem/U6R+uYmWkt44
	ze757PKfC+lWnguBtuE6ysdD6TykzLwZsandkIvlnQIoxGcfzK+RmcsnVnifLct3aSOBoL/5+po
	DH6hD+rDtAqXctxFXqmqT/8+r0wCZYEFEEFZjkrXcOB/XglPQ7ukhWS5w7t7TBBJNFdkEvVk+lx
	a1MFEGqHelF0IqZsa0o/3Qu2/pfzeIbgyoyCAkLvzuH6IqqYqydGFI
X-Google-Smtp-Source: AGHT+IGt4SFGJptpZ0jrCH0JCo7jlSYHb5iMvq47K6wOnBUV4fZAO0y+jOsnj2fzSLzf3+aWmVng0g==
X-Received: by 2002:a05:6a21:3294:b0:263:7cc6:1c3b with SMTP id adf61e73a8af0-29277cb8e9amr3774594637.60.1758267449202;
        Fri, 19 Sep 2025 00:37:29 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:37:28 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
Date: Fri, 19 Sep 2025 15:37:06 +0800
Message-ID: <20250919073714.83063-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003731_589487_A311EFB2 
X-CRM114-Status: UNSURE (   9.94  )
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

This patch adds support for the Zalasr ISA extension, which supplies the
real load acquire/store release instructions.

The specification can be found here:
https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc

This patch seires has been tested with ltp on Qemu with Brensan's zalasr
support patch[1].

Some false positive spacing error happens during patch checking. Thus I
CCed maintainers of checkpatch.pl as well.

[1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/

v3:
 - Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
 so as to ensure FENCE.TSO ordering between operations which precede the
 UNLOCK+LOCK sequence and operations which follow the sequence. Thanks
 to Andrea.
 - Support hwprobe of Zalasr.
 - Allow Zalasr extensions for Guest/VM.

v2:
 - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to
 Conor.

Xu Lu (8):
  riscv: add ISA extension parsing for Zalasr
  dt-bindings: riscv: Add Zalasr ISA extension description
  riscv: hwprobe: Export Zalasr extension
  riscv: Introduce Zalasr instructions
  riscv: Use Zalasr for smp_load_acquire/smp_store_release
  riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
    operations
  RISC-V: KVM: Allow Zalasr extensions for Guest/VM
  KVM: riscv: selftests: Add Zalasr extensions to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |   5 +-
 .../devicetree/bindings/riscv/extensions.yaml |   5 +
 arch/riscv/include/asm/atomic.h               |   6 -
 arch/riscv/include/asm/barrier.h              |  91 ++++++++++--
 arch/riscv/include/asm/cmpxchg.h              | 136 ++++++++----------
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   1 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/sys_hwprobe.c               |   1 +
 arch/riscv/kvm/vcpu_onereg.c                  |   2 +
 .../selftests/kvm/riscv/get-reg-list.c        |   4 +
 13 files changed, 242 insertions(+), 91 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
