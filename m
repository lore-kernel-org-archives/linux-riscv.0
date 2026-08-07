Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911B8C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 05:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gfh3TrsnMwTIdZwTH7F4qdM/I5w5WHF84Yi62d3OyXs=; b=UvIJS3XGlNJ/tH
	ptswR6KaJJROgOXpheByjVW6l8JMmBGQrHwbsC7wJ4A3/+pEEtvSFybHLIisOWZhQYqgwBNn0Ms7u
	q6F8hEYKpsH3tfGHFOWyrtn8mm7GfvGabPDVpXfVWtxhzRnIwVA1vI6datUvAVLilszwcGq0UauUt
	/3wu1lB/tg8LGAjo8mSeXbY3JirTQ9e1R2FiJCUXhj83wtU8klleEm4gO6rA7Kv/XLMGjlGtrlZPB
	u6dZnOvHBScv2qw04Jwp63tiHmAYCj12B1edgE6gfn2aF0DKNuRqfIxHnHbYRxRX+CjNiS55U5ZRO
	Sd4xBQN+4ap1N6S5PO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDCL-000000077Xm-3G1m;
	Fri, 07 Aug 2026 05:32:49 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDCI-000000077Wv-47zs
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 05:32:48 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ca957432c7fso2826134a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 22:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786080766; x=1786685566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PIbnsun6zq+1L1BT2WwwquArLAsjhJR/tgK45GqLXtI=;
        b=qDes2qgBVG8rvC6EU2jUvmDkc5wpfg2Qn8Xsun6yhR16vqYy0aEnom/zzWvy50d6bO
         lXBnrqlLMleHm8DRmYcjtieOu0GQLQxG28kSZTvEPUzGzrvlVSEUWjTd3XKVZZ2c5XQw
         /MHTGDsuG4XyoX/kUX2cy7+VyJ1xuStc5tLCZBmUHRQ/PM1uObuxlfD41IRkNBdhG2rI
         VyYIpxH5if9YGN5qxmQw3anYFqswklJkik0mOvQ3NbtVGOhKMn4TyolVwREAkcJipw/c
         aXsl+aMPpokcjcW0uRj8I60iq00p+SS1+TxO7ezKgQ3yzT0FxDHcjzi6XnQFqL9a7sTn
         qSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786080766; x=1786685566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIbnsun6zq+1L1BT2WwwquArLAsjhJR/tgK45GqLXtI=;
        b=s0bBjB98lH07ouoQCyRjP7PTqlsOE1K/Pm6cRmLys4Luml0EDeanazjwWxNIQsXgk0
         SJKaBmxnPbQHr5pXAxy6QHBxMYvtWq2NBd7mLpAMyZTObEUwnfkf8Dt8LMMy4Ffg/p1q
         7gy38KcYLPgKxXFzCBVHReWRKIH5hu4yP3fkkoNmWmP7gxOhBU6MzJnPaTEjfXImiE4C
         BKBgl1qHGYuSZysxBdXrc/VHyYOoDHuT9kwGAny7AhSu8CD1LD9kfeUtl9+LDbkzb4N9
         35XHwz2mJ6QQ8Dov1SUeZX8YL/6Wo5lpzqEvh1vbULon9jotxMA5Qo9/T6ZMw4loFrXu
         A9Sw==
X-Forwarded-Encrypted: i=1; AHgh+RokXa1oDw7TYaxfw5MNWJ4cE1WOBIdHXlMfrQhwTzx8ldTu2iYPveZu2msHzDsrs2HgbrWzGlkRfxK6kw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8FrAen4GGOGaYBvHhlP8u5EIlnrafYomi0YOY0QovpCo6fJQ9
	/QSKhFCBUSp+w+t0TFmxaQXnDHsTnXTeVwAb/JHR+aHrOVr8aApnOqIh
X-Gm-Gg: AR+sD12c211H6eFZeikT1nUsTQv0aobV7Jxt3c3vTefm8vZ7ug1QzK5dtVp07OcViz0
	M9m4Sj+O57jiGnAylp3/dgojU0jnwChWjaWI68PCHSQEXYC+8piacyZg/Hv+V1yjaEeM+FN4FZ+
	YaLPF9ncScduQYbnIYUvTJ4wWadiqnjYoFxih/fUjDGbTw0OrPOJKPbsX0z0v5sJ3V+/xGw1KEj
	99ZVCWD0UDKWEucHupzkPOl/DIn/HNuM2AbW/94kOdXbgY45azdPZ3nPphMAjFijpI5US23VOWh
	EUZzUUhr59YzIb9+OC25TPQkxChxzQbu/+3lDn/P4m5KJlv1aLqnY4NGuSJtqTOPjqjRFP4D+wH
	QcghMuyEyWiUrY89sO1zba/JsLDllCu7BDdHiUsq+8AV9qZ7MUjB+fG9Wit4cO6qemmV8TS4fNq
	tLSXl3HN9CQQ+nFqB5kuFYYLyyEsY2PxTj6WtTK7Jl+0d90EakLU3Vbnc1Gl7CXJCXSiSoCavC5
	2ZxviU=
X-Received: by 2002:a05:6a20:918a:b0:3bf:d0c8:2aa4 with SMTP id adf61e73a8af0-3cb85df0a10mr21226501637.8.1786080765955;
        Thu, 06 Aug 2026 22:32:45 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19634dsm108940a12.7.2026.08.06.22.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:32:45 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	pbonzini@redhat.com,
	shuah@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhouquan@iscas.ac.cn,
	"Yuhang.chen" <yhchen312@gmail.com>
Subject: [PATCH v2 0/2] RISC-V: KVM: Add PMU event filter support
Date: Fri,  7 Aug 2026 13:32:25 +0800
Message-Id: <20260807053227.341700-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_223247_045012_48BEA523 
X-CRM114-Status: GOOD (  10.39  )
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

This series adds PMU event filter support to RISC-V KVM, allowing a
userspace VMM to restrict which SBI PMU events a guest is permitted to
program.

The KVM_SET_PMU_EVENT_FILTER ioctl and KVM_CAP_PMU_EVENT_FILTER already
exist as generic KVM uAPI (include/uapi/linux/kvm.h); RISC-V KVM does
not yet implement them.  Wiring them up lets a VMM limit a guest's PMU
event access, which is useful for sandboxing and for withholding host
PMU events the host does not intend to expose.

Patch 1 implements the kernel side: the uapi struct, the ioctl handler
with an SRCU-protected filter, enforcement in
kvm_riscv_vcpu_pmu_ctr_cfg_match() (a disallowed event fails with
SBI_ERR_NOT_SUPPORTED), and advertisement of KVM_CAP_PMU_EVENT_FILTER.
Like the other arch-specific KVM uAPI structs, struct
kvm_pmu_event_filter is defined per-architecture; its layout reflects
RISC-V PMU events and the ioctl number encodes the struct size.

Patch 2 adds a selftest that covers the ALLOW/DENY semantics with the
event in and out of the list, filter clearing, and ioctl argument
rejection (EINVAL/E2BIG).

Testing: built and run under QEMU TCG with nested KVM (an L1 KVM host
running an L2 guest).  The selftest (patch 2) passes and dmesg stays
clean throughout the run.

Based on v7.2-rc2 (a635d6748234).

Changes in v2:
- Mask reserved high bits of the SBI PMU event index before comparing
  against the filter, so a guest cannot bypass a DENY filter by setting
  bits above bit 19.  Noted by sashiko-bot review.
- Reject non-zero pad in the ioctl argument to keep the field usable
  for future extensions.

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>

Yuhang.chen (2):
  RISC-V: KVM: Add PMU event filter support
  RISC-V: KVM: selftests: Add PMU event filter test

 arch/riscv/include/asm/kvm_host.h             |   3 +
 arch/riscv/include/uapi/asm/kvm.h             |  20 ++
 arch/riscv/kvm/vcpu_pmu.c                     |  31 +++
 arch/riscv/kvm/vm.c                           |  69 +++++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/riscv/pmu_event_filter_test.c         | 199 ++++++++++++++++++
 6 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
