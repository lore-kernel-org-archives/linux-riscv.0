Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B61A60A262E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZBitzaE/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=TN06RRtY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Hm8BhhbvY4fbqTsu1Yo/qWZm0N3a1nQ7cL8qeH/5AmE=; b=ZBitzaE//slzChpP7HmTD31TQr
	ZsLDXfisl38XKA8/K9t157VkfWU53XAu9qbnZ1IbdBJGkesKXSlPODFCEbb5b71ek5L+ifTeChiQO
	T29Hmn3iWpniBiPts0Py/K6eIfCm3dxh8n5IsjwC8FkOWTRlQK+3ZGIHhuOUL5MIK8uAd2p7kNdPK
	iTBNoqUmmUrZpXhKoaQ9zuTcnnSmeVBtIYQKe0RmFbvzmCaCAUeMbEcIqqozy9/qh9cfmxnIAglEB
	CEAJkr/KualmeqBuRPtZpBh95nrtd96B4dk5wbrESl9aGjlxGsjPgIuZ2KffW52DocGcem45+xE6A
	FstZEWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRt-0000000CU2l-2hW6;
	Thu, 26 Nov 2026 09:07:25 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRq-0000000CU1k-3NDF
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:24 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-38644aedba1so10186731eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684042; x=1796288842; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Hd89c8JD9mWPM1aZ0uRbMq7kDfWlM+9M5g/GqO5V3A=;
        b=TN06RRtYEAq/04fj4ZxbE7LpqBAxiVmDS/Pco0aAV+BmUZTlBmo/jb3iChjONVc8Ay
         nRWS7+N/6LxUHjlTmqMcz1IyFsNiFCsr2tYJ9BCLe++m6tM4GJMTa0eLfSR+/JV98Bik
         rJd0Z8E0YpeHIGKpDtZfxTR2rDhaZLNUjdA9pCh7qtyPi2Le9pVP732LGUFvh7ZnFDCK
         OAby2pCnK6M8+sNVo+CzulnxgAa8cWWJC8B1Nnw7UUl8sQ3u+LqWN7yloKymB+oRgyra
         TK9a4HNX6aLLY3STqu0smr4VTMZx6ASmyttjS9Q2T1APxjp/mvQNMz2krqbFF5I74LK9
         J8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684042; x=1796288842;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Hd89c8JD9mWPM1aZ0uRbMq7kDfWlM+9M5g/GqO5V3A=;
        b=qMkMdYgO+t7l/G2PAy9jmyGVTrFCyHdTkoxkL5eWwR43sV5kwaY3vgHKsb88CMDi78
         3AjQAVMUOQwUqpW2dEcnSwuYEEEKWaLL9hIWEtiX0IE4p4n2RcGVFvPYacv+KkDnP/Pc
         i/vAUSkozPnSSZAEr/ubSry4SUers4a/tKPap7DBzdYkeLN66mHHGJQ0keuv1tLsIguQ
         KS9K4R9S65HKWDMTv1dTem0ewy4j1N8pGDfZjPVSZN1Jiq5+XmUP6qW2F3UjIbrM4ovG
         W1JEZgY71JAvs3WDt5uYDDTCptIO2nutDco3E3vo/wAkfSy0EFZAtWYOwb+/WZ2Hx9ZF
         1qog==
X-Gm-Message-State: APuU4Z9BO+LmN0BtafUCnUrzZRkblAqqQCoQ2Q1QSj0wGIHOAJgIYA07
	f/qY17ARZRrJs3bvsp+PIrFd050BgMBpzFvH6MD2cpsMiK0/TNRmY3/p6NRBwIIgDMk=
X-Gm-Gg: AZFdTZfzIFEYv2pDVnB3SrumZvrYaKJtWR6jxSGnYajfm0zpCQ0WI67lpsOvmEtWWn8
	AZ5EfCZqD2DqviYeC8uSLoJP799CmTkzDtUJ9PN1HsXONTFPevjZ05FObMgkkrUiAAAzAPCeqGH
	DZ2rMBeZMMyXfYQgB+oKniqZPp4olV6vjVv4bkkMiiQ4IpBn/vtXBvVBAgdxaPGEsQvbc1BIrtZ
	v/dGHap/NB3JcJFIdy1lzIZwTBHRG3viqpcgU/r2HnQViVvwZgVIh5jTiwYeL9KO6CV/vtNw0UK
	TTdWrmBNy0AScRkrUcTVHdepMXJV6b7BKlKrIufWnubqH6uxu1LmC211vNV3uvNZNtIXw/rv1N1
	1/sc/ta4WGDZd0uTcjvHhEG12KoexCil2lPd74LTqJhrxumv4SijHb8Cv2k0o4o+cUnUVwAGrsm
	AytxiHFMNPhAL1w6gegSZukuKmw1N5MxBxjTluhKpGzOJ/VL6kLS6lZAHsn/++rtF3Bes86BiCF
	puuWF19WPK+G4ZR5p9upLv3wChr0HDC4/HAg7042Y0zHi4eWFExQHTGeA3pc4igIC7FJiQDfUUT
	O97+Qxb/9hNrE3vIqSAm5CrZ9TrDcFDHu/XQnNiH6iOc
X-Received: by 2002:a05:693c:88d4:20b0:386:a8de:2bfc with SMTP id 5a478bee46e88-386a8de2f67mr13392563eec.6.1795684041729;
        Thu, 26 Nov 2026 01:07:21 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:21 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Subject: [PATCH 00/10] gtrace: Add support for SiFive pre-ratified RISC-V
 trace components
Date: Thu, 26 Nov 2026 01:07:06 -0800
Message-Id: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALv2B2sC/y2Ny26DMBBFfwV5XSO/IIRV/6PKYjweF1cBEo+pW
 kX59xrSzUh3dO65D8GUE7EYm4fI9J04rUsN+q0ROMHySTKFmoVRptfaOMm0BHnLlKGkmCjIkgF
 JkjUBjbcOFIharkRMP4f44/LKvPkvwrLb/olM960ulhcmZmKGY3Fsjj2ltOqMcba1ypnenKSWM
 /xu1TW1OKUCV3pfmdv7Bldc57mtZ3d7YJL7I5Wx8T2cI1iH5PRwQt+fg8VuGMB5HyNajdQFP0R
 xeT7/AMBCH8cQAQAA
X-Change-ID: 20261124-send-preratified-trace-e32dc2b34a0a
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_010722_868687_75C99612 
X-CRM114-Status: GOOD (  25.01  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for pre-ratified (version 0.x) RISC-V trace
hardware, such as the SiFive trace encoder and trace funnel as integrated
in the ESWIN EIC7700 (HiFive Premier P550), on top of the gtrace framework
posted by Mayuresh Chitale and Anup Patel [1].

The gtrace framework and the rvtrace drivers in [1] target the ratified
RISC-V Trace Control Interface. Hardware that predates the ratified
specification is functionally the same (encoder -> funnel -> sink), but
differs in how it is discovered, routed and where the sink lives. The
specification of the pre-ratified trace hardware, is described in the
EIC7700X SoC Technical Reference Manual [3].
This series makes the existing framework drivers handle both flavours
instead of adding a second, parallel driver stack.

Background: how pre-ratified hardware differs
---------------------------------------------

 1. Discovery. The IMPL register layout differs and does not encode the
    component type. The sink availability is also reported there. Specific
    compatible strings are therefore needed: "sifive,trace-encoder0" and
    "sifive,trace-funnel0".

 2. Source ID. The number of SRC bits is preset by hardware (teImpl.nSrcBits)
    and offset 0x8 is the read-only teImplExtra register, not
    trTeInstFeatures. The trTeInstMode encoding also differs.

 3. Routing. Ratified hardware routes at the receiving end (e.g. a funnel
    masks inputs with trFunnelDisInput). Pre-ratified hardware routes at the
    sending end: the destination sink is chosen by a bitfield in the sending
    component's own control register.

 4. Sink. A ratified RAM sink is an independent component with its own MMIO
    block. A pre-ratified RAM sink is embedded in the encoder or funnel
    register block, with a different register map.

 5. Buffer placement. The sink limit and write-pointer registers share their
    upper 32 bits with the sink base register, so the trace buffer must not
    cross a 4 GiB boundary.

These touch the gtrace framework from [1], so I would like feedback on them
in particular. Do you think supporting pre-ratified spec by the following
modification is the way to go?

Architectural changes
---------------------

 * Per-compatible match data (struct rvtrace_match_data) carries two optional
   callbacks. get_impl() translates the pre-ratified IMPL register into the
   standard IMPL layout, so the common probe code needs no special case.
   get_data() returns component private data (the available sinks), stored in
   gtrace_component_id.data.

 * Version 0 is handled inside the existing drivers. Components are
   identified by major version 0 (rvtrace_comp_is_v0()), and the
   pre-ratified specifics are isolated in a new rvtrace-v0.{c,h}, selected
   by CONFIG_RVTRACE_V0. Ratified-only configurations are not affected.

 * Routing is configured at start() time from the path topology
   (rvtrace_v0_sink_config()). This needs the next hop of the path, which the
   old start() callback could not see; see the API changes below.

 * The embedded RAM sink reuses the ratified RAM sink setup and copy
   functions. The register offsets are abstracted into struct
   rvtrace_ramsink_regs, and the standard and v0 layouts each provide one.
   An encoder or funnel only sets up its sink when it supports the SBA sink
   and has no output connection, i.e. when it is the end of a path.

 * Because an encoder or funnel can now be in the middle of a path and also
   implement copyto_auxbuf(), gtrace_path_copyto_auxbuf() now only calls the
   callback of the path's sink. Previously it called the first component in
   the path that implemented it.

Function signature and API changes
----------------------------------

 * struct gtrace_driver::start()
     int (*start)(struct gtrace_component *comp);
   becomes
     int (*start)(struct gtrace_path_node *node);
   Pre-ratified hardware needs the information of the next component to pick
   the sink at the sending end. The node gives access to both the component
   (node->comp) and the connection (node->conn).

 * gtrace_match_id()
   Now ends id_table iteration on GTRACE_COMPONENT_TYPE_NONE instead of a
   zero version. A non-zero version as the end-of-table marker cannot work
   with version 0 entries such as rvtrace_component_mkversion(0, 0).

 * rvtrace_ramsink_read_pair() / rvtrace_ramsink_write_pair()
     (pdata, low_off)           ->  (pdata, low_off, high_off)
     (pdata, val, low_off)      ->  (pdata, val, low_off, high_off)
   Zane also suggested this and Mayuresh said to fix this in v7.

 * rvtrace_ramsink copyto_auxbuf()
   Split into __rvtrace_ramsink_copyto_auxbuf(comp, priv, buf, format), which
   takes the private data explicitly, and a thin wrapper that keeps the
   existing callback signature. The v0 encoder and funnel call the helper
   through the new rvtrace_v0_ramsink_copyto_auxbuf().

Testing
-------

 * Boot tested on a HiFive Premier P550 (ESWIN EIC7700, four P550 cores).
   Tracing was verified to work on this board:

     perf record -e gtrace/event=0x1/ ls

   and the decoded trace content was checked.

 * Firmware: U-Boot from [2] (branch eic7x-dt-fix-hfp) and OpenSBI v1.9.

 * For this testing I reverted commit a7b9ce39fbe4 ("serial: 8250_dw: Ensure
   BUSY is deasserted") locally, because without it the P550 hits an init
   hang. This also happens on v7.4-rc4. See the note at the end.
   The revert is not part of this series.

Dependencies
------------

This series applies on top of [1] (v6, 14 patches), rebased onto v7.4-rc4.
Zane has a patchset implementing RISC-V Linux trace support [4], which add
RISC-V trace funnel support. I will try to review and merge the pre-ratified
funnel accordingly.

[1] https://lore.kernel.org/all/20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com/
[2] https://github.com/ganboing/u-boot-eic7x/tree/eic7x-dt-fix-hfp
[3] https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
[4] https://lore.kernel.org/all/20261023031505.2020925-1-liangzhen@linux.spacemit.com/

Side note: UART init hang on EIC7700 (question for the ESWIN folks)
--------------------------------------------------------------------

I added the people working on upstreaming EIC7700 / P550 support to Cc for
this one, as it is unrelated to the trace series.

On the HiFive Premier P550, booting v7.0 or later to a built-in initramfs
(busybox) hangs at init. I bisected it between v6.19 and v7.0 to

  a7b9ce39fbe4 serial: 8250_dw: Ensure BUSY is deasserted

and the hang is still there on v7.4-rc4. Reverting that commit makes the
board boot, and so does adding "snps,uart-16550-compatible" to the DW UART
nodes (the latter I only tried on v7.0).
The commit adds a BUSY workaround. I have not found the root cause.

Do you see the same hang with an initramfs on your boards?

Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
Eric Lin (9):
      dt-bindings: riscv: Add SiFive pre-ratified trace components
      gtrace: rvtrace: Add pre-ratified implementation callback
      gtrace: rvtrace: Add pre-ratified private data callback
      gtrace: rvtrace: Add pre-ratified encoder support
      gtrace: rvtrace: Add pre-ratified trace sink config
      gtrace: rvtrace: Add pre-ratified trace funnel driver
      gtrace: rvtrace: Introduce struct rvtrace_ramsink_regs to abstract register offsets
      gtrace: rvtrace: Add pre-ratified ramsink setup
      gtrace: rvtrace: Add copyto_auxbuf callback for pre-ratified encoder and funnel

Leo Yu-Chi Liang (1):
      gtrace: Terminate id_table iteration on GTRACE_COMPONENT_TYPE_NONE

 .../bindings/riscv/riscv,trace-component.yaml      |  96 +++++++++-
 drivers/hwtracing/gtrace/Kconfig                   |  25 +++
 drivers/hwtracing/gtrace/Makefile                  |   5 +-
 drivers/hwtracing/gtrace/gtrace-core.c             |  34 ++--
 drivers/hwtracing/gtrace/rvtrace-encoder.c         |  79 +++++++-
 drivers/hwtracing/gtrace/rvtrace-funnel.c          | 132 +++++++++++++
 drivers/hwtracing/gtrace/rvtrace-platform.c        |  46 ++++-
 drivers/hwtracing/gtrace/rvtrace-ramsink.c         | 211 +++++++++++++++++++--
 drivers/hwtracing/gtrace/rvtrace-ramsink.h         |  43 +++++
 drivers/hwtracing/gtrace/rvtrace-v0.c              |  99 ++++++++++
 drivers/hwtracing/gtrace/rvtrace-v0.h              |  80 ++++++++
 drivers/hwtracing/gtrace/rvtrace.h                 |  22 +++
 include/linux/gtrace.h                             |  20 +-
 13 files changed, 833 insertions(+), 59 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261124-send-preratified-trace-e32dc2b34a0a
prerequisite-message-id: 20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com
prerequisite-patch-id: 1d7b783884bfe7e1d91063e0f8a232b86cdf4c31
prerequisite-patch-id: 8f59df8d7a27f0b3d3f34a0abb35e6c893c0858b
prerequisite-patch-id: ef326ac6eba908afdd7a49a264094367ed03a1c0
prerequisite-patch-id: dae8df7640ac89ff801741dba7e6d8e66432d54b
prerequisite-patch-id: 56b583656f75c0bf3eec5dac4113782110bbcf0a
prerequisite-patch-id: eacbdac5b4875ee7c84d9878f5a3cccfb79f7476
prerequisite-patch-id: 81535ef70fc7c3823810f14dcd1a069a05e6e2ac
prerequisite-patch-id: 65f827c9235a732612499b9ef95355872dc12a9f
prerequisite-patch-id: 53d04850a79d6b6fa1d88b6b0d2cebc4348a41d7
prerequisite-patch-id: 7a9c5eaccb41e1e63169edc3605f2dde7c373da4
prerequisite-patch-id: 6e0bd370e542f4cd0db70ff88b6634be6a446aec
prerequisite-patch-id: 509f41312fbcaa6a2bd0d9255cfd2116dc241adb
prerequisite-patch-id: 0ede4337d462b0cec2b67c10533768c7de762408
prerequisite-patch-id: 6b8939aa81ca09a16895a9ecf4de71e377a04ea6

Best regards,
--  
Leo Yu-Chi Liang <leo.liang@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
