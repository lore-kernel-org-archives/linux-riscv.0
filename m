Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA6606A32A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 03:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DuBaMQ4e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtxE3NnU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+zbA5cdI8BAxokd3pcTeBREuZ4dr0knnyRWseXj7KTc=; b=DuBaMQ4eZ9zzepBaEWfX13WJPK
	WB1n2oeEEkkLmlSEGNbOBLWuyyC/tzYUZTcOOTWl9KkjnJN12uTq5ow1cQJSRYHioZzH5Y9XZapjK
	czaQwxiKUTBhCwUeuAHdw3wWlFh5ldReReJQS+ShsG//ZBd+yYz2IKcEjVdHZxe0CJal0yhV73jbI
	aIocpxZpeIMViDOHywJKHCiJWMUcWstfwLp5qcZ4GiPZVxGRSyWGoX4w8XFqE7AXrWB3xd+w5hk99
	3ADj6sdsmdHtfoQwEm0JufPgUYVDf9yMG9gSr+7LyyjX8j2o4lzyqdrBOHZmzkVvgNctThFwZIXmP
	oOV83iuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHp-00000005Rhz-1a1S;
	Tue, 24 Nov 2026 03:33:41 +0000
Received: from mail-pi2-x0a.google.com ([2607:f8b0:4864:3a::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHl-00000005RfQ-2A6o
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 03:33:39 +0000
Received: by mail-pi2-x0a.google.com with SMTP id 41be03b00d2f7-cd6b195dd0cso548581a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 19:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491217; x=1796096017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wj8SC7VUDAGsA7/l9+3e1xtsohCAj0LdZM2x+Y37EQs=;
        b=QtxE3NnU4/tmPZNRo9MUb6iQeBTfcrBfJYQbHGDQZs0h//dugzpI317j9dmRbwrR7p
         HFVAWEfHPx2jj/Gs4d8eNFq2HvpqtIdVUnWIMKNfZo3yocMM1j1HkLFe0RmGapCMD8lW
         BxV3il6+nLXPsFNtltvkbmj7QjWxDAdnR4s5APJefknM01U5bfcoYOLz9walIGI131j4
         96IVMJw+4p5W932rEgR8FdPOulfUUTfYjl31OqK3kYeWAc9mi/R+8HZDzqJB11gGB5Z8
         aXL8UzhnqPnFNjuTzGjeYtH6a2D1xPfIbQPikklDa/jKHC8VmMJMoJu8uepJuwEULu7C
         1waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491217; x=1796096017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wj8SC7VUDAGsA7/l9+3e1xtsohCAj0LdZM2x+Y37EQs=;
        b=KZ/t6pS4kDePMNDFYSHuOxWm+Y3jaKHmlzQcrbMwkys4AEIA36kWSEq1qRqeM5DI4G
         3VwPvPRvn2Lg/3/BmXvi0v2W9e9wxlt8lZ6lyI3iueTHoVy3/2mUEkCM/50u79/pCK+b
         sY+tK0XIpKvkWNgFmM+wMZW5Jo8gpN17CxNH14+4SRhvwQeTEz02POmSPQZXpRv2fNN4
         89p/3l8uR9gpGoR5iI8LXIZe2IZxRyDIRgDtugesPdU4QvRKd1qjSwh1MpAynxVPWw8N
         ICraKRLtQJXox62+6F9aUdLffE+yUMYCawX/H+8xTjEoxGFmWmef4zPhGDhoJur+o5G7
         VBTg==
X-Forwarded-Encrypted: i=1; AL+hErHLFa//o67CLUJWOch4XAt2C++WiJJFte/BBs8eUT7JqwyEbTCNnXpUp/BzL/umzELYKBD75FuqNIo3Sg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/RzHWjb2XY5e6A8b9eR+oDJRN2iYy9DdAvBgLdUNJjjcZgs7Qi
	wlBf/t/YPn+DX5yhkpFsMfgMIIiA8MEYc3DHSDODH4ATgkBqqy/w9XzV
X-Gm-Gg: AZFdTZfEVLeaNMLd5MDxEGMEU2GW8A17jPUyHfAcaxKzQb884x7mYFNey9kZbp+GwGh
	OZzvJI1vC6FeBpNsKjclgPFmVniAJ2p3bQ+D9rYzvbXwwUZrdbcJr4mFnN6/iqy/HsCGfTmuMXa
	tr0pvH9gp94uv536X3ILf4O+fadgFz74lkuv2zVYUHP0x+cZLh95G+A1bC4HJyBSAXasUEKMrWX
	1hk2InXKX+Ng9LIxdbjCuuLmyhWoFuI5bNeUxTCkzD8P0qmbgyBnU06FMLnEJzusvrmxtz9UQYY
	JHgQfLS22tDCpbWyOs2jr5kEHg/R+/c+/6ldMaCCWNg/PnbByrhNvVJ4khv8NQtEPrJEUeD3fGa
	ni6zFhot1gO8exktagawOch/kJUydheVWZLejTBxYOWrrQZTW5tWS+JXxATRJi2MeyrdlKLDuIc
	Pir2OBnTBY+x9C1qJ+zX4ck5L32gYStXnlj6xfZwbsUlhLnAfd9dqgCrfJsVOV+P6N7oxw4DVV2
	fzwAdg8h2OexWYshGwoRLoeDzPZlKwL+FO9FLh2P+sdMKkJoddPosju+bQi5r1AEiwnhPuDLJAp
	g20FUz5zbcKKkBsQYIgPb0yeWwtAYvWeDqjvExtjlA==
X-Received: by 2002:a05:6a00:414c:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8c87c3882fcmr11093633b3a.21.1795491216650;
        Mon, 23 Nov 2026 19:33:36 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm6495773b3a.3.2026.11.23.19.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:36 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@linux.dev>
Cc: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: selftests: Test steal-time dirty logging and RISC-V STA transitions
Date: Tue, 24 Nov 2026 11:33:26 +0800
Message-Id: <20261124033328.612894-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_193337_905189_F99C087B 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series extends the KVM steal_time selftest to cover guest RAM
dirty-log tracking for steal-time accounting writes across architectures,
and exercises RISC-V SBI STA shared-memory state transitions.

Patch 1 fixes get_run_delay() so that missing or malformed schedstat files
fail explicitly instead of dereferencing a null stream or returning a
fabricated constant that causes polling loops to spin indefinitely.

Patch 2 enables dirty logging on the shared-area memslot in the common
per-vCPU test path, clears initialization dirty bits before checking
accounting writes, removes the v1 #ifdefs from main(), and tests three
RISC-V SBI STA transitions: disabling an active area, re-enabling the same
area (matching the SBI calls used by Linux RISC-V guest CPU hotplug
callbacks), and replacing an active registration directly with a new area
at the end of a second host page.

Changes in v2:
- Split the get_run_delay() error-handling fix into a prerequisite patch.
- Move the steal-time accounting dirty-log check into the common per-vCPU
  test path and drop the added #ifdefs from main(). (Andrew Jones)
- Separate RISC-V SBI STA disable, re-enable of the same area, and direct
  replacement of an active registration; clarify that the selftest invokes
  SBI directly rather than running Linux CPU hotplug. (Andrew Jones)
- Drop the MADV_DONTNEED check, which discarded guest page contents rather
  than modeling migration. (Andrew Jones)
- Clear initialization and transition dirty bits before each accounting
  check so registration writes cannot mask missing accounting dirty marks.
- Force bounded runnable CPU contention instead of assuming every KVM_RUN
  advances the sequence counter when run_delay is unchanged.
- Size the RISC-V two-page region using the host page size for 16K/64K
  host page compatibility, and fix Author/Signed-off-by formatting.

v1: https://lore.kernel.org/r/20261115085457.889873-1-shanbeeyoo@gmail.com/

Validation:
- RISC-V (QEMU TCG + H-ext L1 KVM): all 11 steal_time cases pass; local
  controls confirm compatibility with skipping zero-increment STA updates
  and immediate detection when the accounting dirty mark is omitted.
- Separate local 2-vCPU RISC-V Linux L2 guest run under L1 KVM confirms
  SBI STA detection and 3 CPU offline/online rounds invoking
  pv_time_cpu_down_prepare() and pv_time_cpu_online().
- x86_64 (host KVM): all 8 steal_time cases pass, plus fault-injection
  checks for missing and malformed schedstat files.

Note: AI tooling assisted with review analysis, test rework, and local
verification; all changes were reviewed and validated by the authors.

Thanks,
Bingyu

Bingyu Xian (2):
  KVM: selftests: Fail explicitly when schedstat cannot be read
  KVM: selftests: Test steal-time dirty logging and RISC-V STA
    transitions

 tools/testing/selftests/kvm/lib/test_util.c |   7 +-
 tools/testing/selftests/kvm/steal_time.c    | 233 +++++++++++++++++---
 2 files changed, 210 insertions(+), 30 deletions(-)


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
