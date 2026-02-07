Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C82EE0AC4
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5bUTZR7mn4Q1Mpfh9jRxeZa3Kfa3OfON8AA7op9TSc0=; b=QvMXtysgB9qz8+
	MzX1ELg1ozTaMwl/j5WnowFc+x4MozT4Txv+T4BZy3oMc5Jz4NAK9+ThU+XRuktxDPcwu94+JsES4
	IgYVmmGUpiD9g1q+ys73Hyb5GMgNOnQR/Vm/QSW5afE3GRbZyekuWv6o13XKzS9kiT+penBTm+w0Q
	XXC374c/r6nWFKVsao94Fmm8JAmxeiENrOOUbdsUl7K3iSlHWwrXwydUF0mevZB+0QnPzK/qXlYXj
	bdkbo6riotvwdlihkZ2ncoweYRTUgIJfuI51IowhirZTHj0JADojopMexk+Frh6OXHFY2EYAM6xzJ
	PQdEONsAxevo7vTdgbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofXz-0000000CKIC-1Exu;
	Sat, 07 Feb 2026 10:28:15 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofXv-0000000CKHl-3wyd
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:28:13 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a90055b9e9so13304635ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 02:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460090; x=1771064890; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhIYGzpYATJxZa6gNLgY5YsbM5g0zoUSoycbocUPjoU=;
        b=WkZD+VvGKCNmPrCsk3W4whkUreAzJtIm6G5LqOGEsOnJ119+AVIM667Pm1tWsDGPLO
         7pP7KXySvwXrIKOLrW0FDLAYYYZNwuWNpzxkXfHDqBakqLLK79Xxp2bOx+0uLgiVgnhk
         YTKZhLZ6gTgiwfDZWea+EgwBoU3JpiPAncbuw5BmGOA7caHQkplJ3ipQxpr4nDoZVdQw
         w+PbpC6o5Wpw7i6UKVDK2gD+ISnWV81AAaVDBRLnijZHjmFvEvBUgndEp1aNW+o1BMSd
         AT5Jov9kRaCtt6hXLpO3i/Aa8ARm4cwFLyva35stZi4+E1Dwmf0z/WVPDVsj88JND07k
         fFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460090; x=1771064890;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhIYGzpYATJxZa6gNLgY5YsbM5g0zoUSoycbocUPjoU=;
        b=dEyiZRfUwAhWz41iyIhhgsCswK/b6DeQWF/h5c1y26iyrwdYWMq7xcHiNocUjCBCf4
         RLJJYha7m8gWHeATv4RzwiQRs8/l0fcBVikWd0yfQX0OPXFyfLRb9B9dK+ucq4N3YQTm
         OV3zFC2HHhJKom2yDYluwSXuo+yln2qihHmQVZHVwQBu+78sBwwjqAdHXayeXwUVIZkr
         SLEX8MbUArEeO+6vwVUhONNVG/9p60TlrRg9DphRMSoTks7JwH1ybsB+emMMGJfsOSNf
         gtPGGBBPUmyeC/0E7at2mYV9U62iURi+TddClakYRz/+iXhVjcYGopvAIxYyHl4oYXhx
         nbJg==
X-Gm-Message-State: AOJu0Yx8J2MPLG5/cXOn6pjEuOmvt3pPE7gwPByzdzfWOvwKukxfIKhF
	XgllhbcLIuY292Uty+fnOsU6fmH7vcufcfchEe9ED5VbdHVAdSBvdmQdTK8FPU/49Ek=
X-Gm-Gg: AZuq6aJWwFKuPRlE7zCkIGOVZXseqfTg0LsoOO4PpH5EC7Gvpuhu5tsvL4MqWQWPZJu
	RR0TvgjnCoJNoR6MkXIHP/ZT7FZ3TenqjLySx5cHONVoMz0NzOGvzgBH1MwDKNlFO/UCPNvEo6K
	YeD+ZguIcsoebIGeuU3BEBeO+yO7PTP8UOlTIm8w2Z1eeTz9lLvvU7SwdekACsWsINVQsqJ4GrR
	8N19B0UUkLpEJeXmy2Nq5LBA2tK1FjY6P8nmR/ib8VDnXQxqemZ8y2nIh+SD3ZeR5dB39xumPk7
	wCPApcippEtcWFPguUFUKF0y4SGoYd8pLyorpWqaW6PtCOQAErq/J1b+JasdYllipLfwBkTViMJ
	iAGJ5Wu3gM/aJWR3jG2YoJqNGowWdkANT/ZUKaWX6W3JnNnIE5b7UmF8LSi2Gjde1iYzkc0T1/b
	8lXqRKkKH5irLzNNdrRzYJzKmkSmLIrOcg2fnQmUW7K+28eOqd+wg4cQ==
X-Received: by 2002:a17:902:cf4b:b0:2a8:ac0f:9ae4 with SMTP id d9443c01a7336-2a9522333dcmr53807265ad.48.1770460090653;
        Sat, 07 Feb 2026 02:28:10 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:10 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/8] riscv: Add cpufeature parsing and hwprobe export for
 RVA23 extensions
Date: Sat, 07 Feb 2026 18:27:54 +0800
Message-Id: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKsTh2kC/y2NQQ6CMBBFr9J07Zi2ICgxxnsYFqWMOgugdgohM
 dzdAu7mzc9//ysZAyHLSnxlwImYhj6BPgjp3rZ/IVCbWBplCqV1AcQWcI7gbWBMlx9CBJWXTim
 VoTZOpqoP+KR50z7qnQN+xmSP+1M2NrXd0HUUK9Gvwn3BZGu/Q2a7bVfi+g9OwKPvtm1qYTKgQ
 GPWXEqdu3Oh7oHYcbThmKw3WS/LDxZj1D3cAAAA
X-Change-ID: 20260116-isa-ext-parse-export-047c0003e12c
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022812_157838_F55EF5CA 
X-CRM114-Status: UNSURE (   9.81  )
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

Complete the previous series [1] (Patch 6-9), which added DT bindings for
extensions mandatory in the RVA23 Profile, by adding cpufeature parsing
and hwprobe exports.

This patchset is organized so that cpufeature parsing and hwprobe export
(when needed) are grouped together.

Patches 1-2: B extension
Patches   3: Enforce dependency checking for Ziccrse.
Patches 4-6: Handle the RVA23U64 extensions, namely Za64rs,
               Ziccamoa, Ziccif, Zicclsm.
Patches 7-8: Handle the RVA23S64 extensions, namely 1) Ssccptr,
               Sscounterenw, Sstvala, Sstvecd, Ssu64xl, 2) Sha and
               its comprised sub-extensions.

Noted that among all these extensions, I chose to hwprobe only three:
B, Ziccif and Zicclsm. My observation is all recently merged hwprobe
extensions (such as Zaamo, Zicntr, Zicbom) expose instructions or CSR
that userspace directly executes, or hints for userspace prefetch.

Whereas Za64rs and Ziccamoa are named features, currently I don't see
a need for userspace to hwprobe them. They can be added later if a
concrete userspace use case emerges.

Zicclsm is hwprobe exported, previous LKML discussion can be found here:
Conor Dooley noted the need for "bindings, detection and hwprobe key
for Zicclsm" [2] after Palmer's misaligned access clarification [3].

Ziccif guarantees atomic instruction fetches for naturally aligned
instructions. Exposing it through hwprobe allows userspace performing
concurrent code modification (CMODX) to confirm the underlying
hardware guarantee at runtime. See Documentation/arch/riscv/cmodx.rst
[4] for background.

The B extension hwprobe bit uses a system-wide check against the global
ISA bitmap, following the same pattern as C in hwprobe_isa_ext0().

Zicclsm and Ziccif use the per-CPU EXT_KEY() mechanism, consistent with
individual extension exports.

This series is based on next-20260123, plus the sump patchset. Tested on
SpacemiT K3 PICO ITX board, checked both cat /proc/cpuinfo and a hwprobe
userspace testing stub.

Link: https://lore.kernel.org/all/20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com/ [1]
Link: https://lore.kernel.org/all/20240524-ruckus-trickily-1cda26c1a455@spud/ [2]
Link: https://lore.kernel.org/all/20240524185600.5919-1-palmer@rivosinc.com/ [3]
Link: https://lore.kernel.org/all/20250407180838.42877-12-andybnac@gmail.com/ [4]

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (8):
      riscv: cpufeature: Add parsing for B
      riscv: hwprobe: Add support for probing B
      riscv: cpufeature: Enforce Ziccrse dependency on Zalrsc
      riscv: cpufeature: Add parsing for Za64rs, Ziccamoa, Ziccif, and Zicclsm
      riscv: hwprobe: Add support for probing Zicclsm
      riscv: hwprobe: Add support for probing Ziccif
      riscv: cpufeature: Add parsing for Ssccptr, Sscounterenw, Sstvala, Sstvecd, and Ssu64xl
      riscv: cpufeature: Add parsing for Sha and its comprised extensions

 Documentation/arch/riscv/hwprobe.rst  | 11 ++++++
 arch/riscv/include/asm/hwcap.h        | 18 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  3 ++
 arch/riscv/kernel/cpufeature.c        | 63 ++++++++++++++++++++++++++++++++++-
 arch/riscv/kernel/sys_hwprobe.c       |  5 +++
 5 files changed, 99 insertions(+), 1 deletion(-)
---
base-commit: 4af4e95edc37ae54f64cbd75b46f16ce15f3a6b8
change-id: 20260116-isa-ext-parse-export-047c0003e12c
prerequisite-message-id: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
prerequisite-patch-id: f10e134f9f9291ace47876fa4b2171094838a40b
prerequisite-patch-id: 59a67878b96d6de42a9bad35fc610ef10dabff55
prerequisite-patch-id: 30a3e1b50fc95ab5a521f4dab693d914713992f2

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
