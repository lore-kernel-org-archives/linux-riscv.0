Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7D8CD129C
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QnTTaUxuNTLE4IQcEOtHeoZq8Xx5VobOXSCUlLgc6YY=; b=mQyIgBn+09My7N
	Q0UICty6vdApcqWQK+4sHvQYYi+J7Sx9wTzx645nXr67m6hIr5ZOiIvQnanHurfCA/x2pLY7pB4Lv
	zDNbcF9QMfuWi/PCYw6SCpRWPZEQrbzAC57VbsvGkkywgVn2l6KjIJhaRjwZ6fisRqgiRkN1wHcmU
	ULsShuTdMy7quHpARQTUz5fJ4f05Fx1lM+KWLDhvxtMG91Hvo5m7iq59DXlpA3xtfpo1OGUyOjca4
	wqZIj358irQkEBORUV5/gcuDyIXFXmiwmZJVM+tKt1gXCxj4YF8IFr5Q3iPGI266zbbsdRHe1QyxE
	3FGjtavpdGjiUxkZ5llg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEc-00000000ZJf-2icj;
	Wed, 03 Apr 2024 23:41:38 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEY-00000000ZFl-0HM0
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:41:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e28efd8335so2948885ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187691; x=1712792491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rv0B5ns63COKymo1kiAr4r2DGtjIZSKU8HdFj+0IH40=;
        b=eEy1O436ra9LVze519q/wYsD1sDyUW2Q4mt4XpyRxHpS3IyT1oYRoHWaW5byTWs1sN
         85Y7tYq1mNvaY/wkG2Mr2fpzgmSyZLlY9bME+LvYZ5lFWXiibFt72NZMvTCTd0mjwRR7
         Q0H0RBapH3S3eM+D5mV16cEpKClqBNWk5JBeIfm5oxJ7HRBaPHYytiafYt9Rzq7GGLyu
         f4UtKcfcC6+14OW1JSlDcC6N6JkjeIJLtd1bBwTXRvCkM6JdaDUXcIKjh8geD1oKKi9a
         ULQ+ghzPO15k6a6tCKvzQ7hGHiRlzIm0/tGTfuLFVfxWCyf1cReUxPCuNXPgWrSXBl5N
         8JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187691; x=1712792491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rv0B5ns63COKymo1kiAr4r2DGtjIZSKU8HdFj+0IH40=;
        b=eZpbZG4WQV50tQXRjn4okp9X5awnCCXWnITPkg8/CTrTiCzmatesxWCWbElmsyuq9a
         srEwZxqN+nXGgupbn/J1ojOpTpz7IfQ8w/7WnIXz5XggRw6V8D/H6q4SD97w2tndhkiL
         BYx+d18KMYebQ5cE9vqy2er+bJv9GaFGeVZxYp7wCBWAEewpN8WXAy6ET5cr9A5IJ6Lk
         6wgq4fEd+tQOdehXTYWGrfZMPeu+P8vqOwlVkSWHBBJt7I92A51avdg54JxMYHwD7n/w
         GOWo+XeTbWBZES1GFwiGH+5uhfdI3oDT1/y/h6yZKr9CZSda3Wpc4id1gZpuROBXeNmX
         BCtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlfSnufQyUgRR1NCkDpR/5pcUGSJ0nBmWjnVEHk2OgNq73tHWNcspXquBMVJswNR65ST3IPe8VNq2EFtygkP5xn3NBY0i+PGwrxXFwWRmP
X-Gm-Message-State: AOJu0Yx2jqDT1ubjknYa78XeHgpdNQRyK9jgplq6ngx8yMdoI5eRtSMR
	EXSWfvisthfBg9s0Z0PB90dzUgyolBCZ8N9H1x8gQz0hakpN+nrEr9qu9x6vrFA=
X-Google-Smtp-Source: AGHT+IG0BMforFKG/Z+mj8l+gwmdkHRGf0wkX6Dm3/AG2fDf6ErYVT/6uGhIGHy46uRoq1WTT9/6ig==
X-Received: by 2002:a17:902:c402:b0:1dd:c953:cfa0 with SMTP id k2-20020a170902c40200b001ddc953cfa0mr1051389plk.48.1712187690540;
        Wed, 03 Apr 2024 16:41:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:30 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 00/29] riscv control-flow integrity for usermode
Date: Wed,  3 Apr 2024 16:34:48 -0700
Message-ID: <20240403234054.2020347-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164134_252975_D5791DBC 
X-CRM114-Status: GOOD (  13.71  )
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

Sending out v3 for cpu assisted riscv user mode control flow integrity.

v2 [9] was sent a week ago for this riscv usermode control flow integrity
enabling. RFC patchset was (v1) early this year (January) [7].

changes in v3
--------------
envcfg:
logic to pick up base envcfg had a bug where `ENVCFG_CBZE` could have been
picked on per task basis, even though CPU didn't implement it. Fixed in
this series.

dt-bindings:
As suggested, split into separate commit. fixed the messaging that spec is
in public review

arch_is_shadow_stack change:
arch_is_shadow_stack changed to vma_is_shadow_stack

hwprobe:
zicfiss / zicfilp if present will get enumerated in hwprobe

selftests:
As suggested, added object and binary filenames to .gitignore
Selftest binary anyways need to be compiled with cfi enabled compiler which
will make sure that landing pad and shadow stack are enabled. Thus removed
separate enable/disable tests. Cleaned up tests a bit.

changes in v2
---------------
As part of testing effort, compiled a rootfs with shadow stack and landing
pad enabled (libraries and binaries) and booted to shell. As part of long
running tests, I have been able to run some spec 2006 benchmarks [8] (here
link is provided only for list of benchmarks that were tested for long
running tests, excel sheet provided here actually is for some static stats
like code size growth on spec binaries). Thus converting from RFC to
regular patchset.

Securing control-flow integrity for usermode requires following

    - Securing forward control flow : All callsites must reach
      reach a target that they actually intend to reach.

    - Securing backward control flow : All function returns must
      return to location where they were called from.

This patch series use riscv cpu extension `zicfilp` [2] to secure forward
control flow and `zicfiss` [2] to secure backward control flow. `zicfilp`
enforces that all indirect calls or jmps must land on a landing pad instr
and label embedded in landing pad instr must match a value programmed in
`x7` register (at callsite via compiler). `zicfiss` introduces shadow stack
which can only be writeable via shadow stack instructions (sspush and
ssamoswap) and thus can't be tampered with via inadvertent stores. More
details about extension can be read from [2] and there are details in
documentation as well (in this patch series).

Using config `CONFIG_RISCV_USER_CFI`, kernel support for riscv control flow
integrity for user mode programs can be compiled in the kernel.

Enabling of control flow integrity for user programs is left to user runtime
(specifically expected from dynamic loader). There has been a lot of earlier
discussion on the enabling topic around x86 shadow stack enabling [3, 4, 5] and
overall consensus had been to let dynamic loader (or usermode) to decide for
enabling the feature.

This patch series introduces arch agnostic `prctls` to enable shadow stack
and indirect branch tracking. And implements them on riscv. arm64 is expected
to implement shadow stack part of these arch agnostic `prctls` [6]

Changes since last time
***********************

Spec changes
------------
- Forward cfi spec has become much simpler. `lpad` instruction is pseudo for
  `auipc rd, <20bit_imm>`. `lpad` checks x7 against 20bit embedded in instr.
  Thus label width is 20bit.

- Shadow stack management instructions are reduced to
    sspush - to push x1/x5 on shadow stack
    sspopchk - pops from shadow stack and comapres with x1/x5.
    ssamoswap - atomically swap value on shadow stack.
    rdssp - reads current shadow stack pointer

- Shadow stack accesses on readonly memory always raise AMO/store page fault.
  `sspopchk` is load but if underlying page is readonly, it'll raise a store
  page fault. It simplifies hardware and kernel for COW handling for shadow
  stack pages.

- riscv defines a new exception type `software check exception` and control flow
  violations raise software check exception.

- enabling controls for shadow stack and landing are in xenvcfg CSR and controls
  lower privilege mode enabling. As an example senvcfg controls enabling for U and
  menvcfg controls enabling for S mode.

core mm shadow stack enabling
-----------------------------
Shadow stack for x86 usermode are now in mainline and thus this patch
series builds on top of that for arch-agnostic mm related changes. Big
thanks and shout out to Rick Edgecombe for that.

selftests
---------
Created some minimal selftests to test the patch series.


[1] - https://lore.kernel.org/lkml/20230213045351.3945824-1-debug@rivosinc.com/
[2] - https://github.com/riscv/riscv-cfi
[3] - https://lore.kernel.org/lkml/ZWHcBq0bJ+15eeKs@finisterre.sirena.org.uk/T/#mb121cd8b33d564e64234595a0ec52211479cf474
[4] - https://lore.kernel.org/all/20220130211838.8382-1-rick.p.edgecombe@intel.com/
[5] - https://lore.kernel.org/lkml/CAHk-=wgP5mk3poVeejw16Asbid0ghDt4okHnWaWKLBkRhQntRA@mail.gmail.com/
[6] - https://lore.kernel.org/linux-mm/20231122-arm64-gcs-v7-2-201c483bd775@kernel.org/
[7] - https://lore.kernel.org/lkml/20240125062739.1339782-1-debug@rivosinc.com/
[8] - https://docs.google.com/spreadsheets/d/1_cHGH4ctNVvFRiS7hW9dEGKtXLAJ3aX4Z_iTSa3Tw2U/edit#gid=0
[9] - https://lore.kernel.org/lkml/20240329044459.3990638-1-debug@rivosinc.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
