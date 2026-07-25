Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90841C531FC
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u4OY0ftHe/DC/Rs033iween5R9h7UyiSq7nRhkOhlrM=; b=Po/vUgIlGXlsmo
	VYgoFFqfRGpF1oWD0wOI7Ux3o74u++SHpPkWlasYiFmtNFcLq7AtaSio7uFuvYZetnJFBPcuc9jc7
	4hxvCfDL6TZCz2saZvVm6BgPcQrk8ws8TeE6k/jvLmd8wC/RBBeG0etcgr4SAl++rHP8HFIDPRgPp
	pZaFdF/hNZWi7V7r0/0Pmh0ZAG4ZxsBJLQByqwS5TyT/Vm2DKWD9pm7VnhYvwtNJyET9iu07btKC8
	qo5YiURHUnMmHu9NFYoF3APITA0RZfKbyMY1t9Y28V5sHGhzeYE8yOxGfo4t0gK05bt6PoN/s697X
	D59JtR28IZ45YG6CkJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ4W-0000000HOJP-0llz;
	Sat, 25 Jul 2026 00:16:56 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ4T-0000000HOIg-0lmn
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:16:54 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7eb545db3afso560045a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784938611; x=1785543411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8eQBqW9ZpLe36qpuA08KeknMXgKjkr2x1vp4ET7Yuh0=;
        b=bqc7PZtxw3fvzfyCFh3DrOoJaVv8RWBwXEE1XjqaW9mil9FvYWJWnijfs5eZ5Mt8xy
         DaE17KkBVsSTdtMKmXOB+pf4bjpVosZ8WZ3LIB9E5dv9h0oARD2Tw3IzfP3DJAMftVsz
         Hpc3Vio45nzTD/tnsiF+flneYm6FFzrXCGKfINj9SBxAztXejB50Ssiv8RSNleikcLri
         LjyBsPUKIb+raaayVnrgJ1nv/lzKHzmU9KyQtwsO6rvIPxW28XabnzpL2xMKV7wEVH/2
         lvi/1XkSgCE6y7NOBlgjCdX4Eb4z2iNt9BPE25Vyex4EO8cjWfOvNq3L/C4OeTemP8rV
         p4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784938611; x=1785543411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eQBqW9ZpLe36qpuA08KeknMXgKjkr2x1vp4ET7Yuh0=;
        b=pwV8xGHxaaeCkOJ+uE3WJoy21+a+3GRj1HNT3Hyi3SdhmGVHchBjvGbPruYrK8Me2s
         TxACCIczbvptE47jVCq+IBVJSWILd9nzWDEVL+Aa39rOdbKh07Xs1/Fk4JVLz6zCPl4Z
         kKiek30ekUu3C8r4bxZboxTaKs/2KBxKMamlwLgTFqivynKRCz1xKGYqEcbzRihvsnZl
         aILItOunOI+WZ75j1U8Hlt/2OnrrZqgP9037OjhHIuYWuVow4fmDWY2A5unCQpyP8iw8
         fF0dLVpTQ1DAcvwnkDK8rjWBYNLEVRtwEvDOVYB5fBJ8wyEcj3Edk5S69lKtJJciKIzc
         JckA==
X-Forwarded-Encrypted: i=1; AHgh+Roaj9Y19kKCGAUEg2QwZP3LxgJZLuLuV+Yj9kHvnEX51hHCU+MJlQb0IF3iP8MSb3xV/p9oHvjNXgT4Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyR+BNKziq63qOYoJGYOBQXtAKiPnuLimZHyLs5dKo4vv7tJS+
	F2UvdJNniSr1pm1VTA+FEe3K2LD0adCLRaYphVfHYHlGL8cDFrMiZwa1AgQZCuTm7LE=
X-Gm-Gg: AR+sD10qqlTrtLWBSxZmr25G0dRy9CEvpau7aOHNVGQYMaSfj6Y73jdIY+Q9JnG5Wp9
	x9hzdWOEKndzLuSCuSXdt75tx4+cPqm1PfTGsxhibOlFyyRN0sPvNTNAVT+3vmyB3LNbo5EjDQB
	ryhkzhyO7GeBIspPNUb9xPoQ92p4mAKFvfPYUE7vUwMQEsTxp2g04T8P2oiXJu85o8YNcxH2B/j
	cRGOEtrck8CaLk0US0U/Kwcd9kVzGBM4R60VWW9EVhrIXUF9OZMI+6ohVjTvw6kAcfvh66c6Ttu
	j28b3PrVw1ZfbFZomGJeJu4jsVuSzARLL9Uuaoj4gDIDoylX2CSt+7SB3mKNbxQJRGIen8EEFJY
	hVkGJbCy8r/dz5hShC7o0nldV2g8z3Ef1callVqXedAz2ftKluwt08ZRiS3lt7K4OYf9hiLP2t4
	xxA7IHVfpykAHE4riDG6q7ASrSXI5fpzPD6P4=
X-Received: by 2002:a05:6820:2d03:b0:6a1:50eb:2119 with SMTP id 006d021491bc7-6aaffda4f11mr413554eaf.61.1784938611575;
        Fri, 24 Jul 2026 17:16:51 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm882929eaf.7.2026.07.24.17.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:16:51 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v3 0/3] riscv: hwprobe: report per-process extension availability
Date: Fri, 24 Jul 2026 19:15:49 -0500
Message-ID: <20260725001614.2578617-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_171653_298029_FA2B7DE6 
X-CRM114-Status: GOOD (  14.43  )
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

hwprobe reports whether an extension is present in hardware, not whether it
is usable by the calling process. Vector can be disabled per-process via
prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), yet
RISCV_HWPROBE_KEY_IMA_EXT_0 still reports it. An IFUNC resolver that
dispatches to a vector routine on that basis then takes a SIGILL.

This series adds RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier:
within one request, keys before it report present-in-hardware, keys after
it report present-and-enabled for the calling process. Both views come back
in a single call:

      [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
          present       modifier       enabled

When V is disabled for the process, V and its V-dependent sub-extensions are
cleared from a following RISCV_HWPROBE_KEY_IMA_EXT_0, and XTHEADVECTOR is
cleared from a following RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0. The enabled
view is per-process, so requests carrying the modifier are deferred from the
vDSO to the syscall. Old kernels report the key as -1, so support is
detectable and existing users are unaffected.

The earlier documentation patch [1] clarified that userspace should discover
non-standard Vector extensions through hwprobe(2) and then use
prctl(PR_RISCV_V_GET_CONTROL) to check whether the process is actually
allowed to execute them. Requiring that separate prctl step is awkward for
the IFUNC-resolver environment, where a resolver wants to decide from the
single hwprobe query it already issues. This series folds the availability
check into hwprobe itself, so a resolver obtains present-and-enabled state
in one call.

Tested under QEMU (rv64, V enabled); the selftest passes. The disabled-V
case runs in a forked child that sets the NEXT control to off and execs a
nolibc worker, since V cannot be disabled in-place (-EPERM) and a
vector-using libc cannot run with V off. That check assumes
/proc/sys/abi/riscv_v_default_allow == 1 and skips otherwise.

[1] https://lore.kernel.org/all/20260107000609.63892-1-andybnac@gmail.com/
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220795

Patch summary:
 - Modify patch: none
 - Unchanged patch: 2, 3
 - New patch: 1

Changelog v3:
 - add a patch to fix hwprobe value leaking for vendor extensions on
   vdso (Sashiko)
 - Link to v2: https://lore.kernel.org/all/20260724183646.2363114-1-tchiu@tenstorrent.com/

Changelog v2:
 - Rebase on top of the latest riscv for-next branch (patchwork ci)
 - Hook test_avail into sifive's vendor vector extensions (Sashiko)
 - Link to v1: https://lore.kernel.org/all/20260723222109.2229089-3-tchiu@tenstorrent.com/

Andy Chiu (3):
  riscv: hwprobe: initialize pair->value in hwprobe_one_pair()
  riscv: hwprobe: export the availability of vector to user
  selftests: riscv: hwprobe: test the RISCV_HWPROBE_KEY_EXT_ENABLED
    modifier

 Documentation/arch/riscv/hwprobe.rst          |  27 +++++
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 .../asm/vendor_extensions/sifive_hwprobe.h    |   6 +-
 .../asm/vendor_extensions/thead_hwprobe.h     |   6 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
 arch/riscv/kernel/sys_hwprobe.c               |  41 ++++---
 arch/riscv/kernel/vdso/hwprobe.c              |  25 +++-
 .../kernel/vendor_extensions/sifive_hwprobe.c |  16 ++-
 .../kernel/vendor_extensions/thead_hwprobe.c  |   9 +-
 .../selftests/riscv/hwprobe/.gitignore        |   2 +
 .../testing/selftests/riscv/hwprobe/Makefile  |  14 ++-
 .../selftests/riscv/hwprobe/ext-enabled.c     | 111 ++++++++++++++++++
 .../riscv/hwprobe/ext-enabled_nolibc.c        |  58 +++++++++
 13 files changed, 283 insertions(+), 36 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c


base-commit: 76e885f2b89d9e88291c1864e5f89a6b180768da
prerequisite-patch-id: ecac88d39cfd235fd3bd3be495124f8156f45c5f
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
