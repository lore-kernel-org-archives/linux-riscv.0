Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAA6606A321
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=etrE3wbl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jlpkt9F2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Atpay0r3au9REd9hupTGxWK4SbRRJGbUHmKqOuSLKuw=; b=etrE3wblpLd2dkdvBdufhARnqT
	B5uS9mwLhOZ/pLzcH77gGhhc+0R4Ro30pj1SqZAC9Uvtmk0l+Sl6/X6a5qJ3ljB9osW8Zrouog5qq
	OeGorzILUxUPi1HOBDFX/lEmepCVtsiZegoD6PFfIgcA8pRZKQa1rdd9vJZdH2yZRZi2rwnm4gdLr
	hbaE7uZSG5RjUnZDNaMxjKqUKdaFXr9pJAtjZ3pKxS1vmOH2HbMchK6CaZWp8cHoeiAqGf+pQDAAg
	Ll5/vMO+QPf5j7iYJSYRhA4uNVa8HsxngoANOTV6kz4YZ5srzt6mrWzkOUoutZI5Kru3RxU0vvekP
	Pb94bRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0hs-0000000G1Y4-2yKa;
	Sun, 08 Nov 2026 11:05:04 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0hp-0000000G1Xj-3Fcj
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 11:05:03 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso5462a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 03:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794135901; x=1794740701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKnJ5ofY6xI7mGRCSoUHzG0stJCP5GNAGXYvslrLiuU=;
        b=jlpkt9F2go/YmhC80pBfhwnWy6rsi1X3e+GczRlo6rU2BcIe7v32wYJ1k8l8jgi/G2
         YP1sFBYmHAx4VsYnxW9873hdOOpdNpGg9CfsDJk7oKCE6VwS88YJHWkaKGHv0/dWMQga
         wlJtbEjkpF/abHPfK2+CrfVOFoQu7JGSPhCvCGU5sIm2tm60v+U1RZ9pvB64eHc4XdJt
         42NEHyim2oXKEag7uiI5JHOrHT+pL2fioIwNHJsb2t5ClhCABaRiyCR9dfuvH3esHncK
         Io8ejxIzvdobyPXcBhXjHEpgxVx8XQGjUF5VSN+K9X6WoUw8sa4RjllQdlM+B3OyfsvJ
         BfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794135901; x=1794740701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KKnJ5ofY6xI7mGRCSoUHzG0stJCP5GNAGXYvslrLiuU=;
        b=NutO0ylloWNMpcB1EEosff4lQvEzicgo5pFZGlQu8sHiaF5FEz/0k9IZjFPE/uH1EL
         PV4lWzb5TgVp3X8vNBMU87OuOzweziLcB2heX3opIrlG+ForVR/xDZtIkz7VoARQVHcR
         So1+C1H7tyFwh9Sjj/v47GCB7VBw5el/Hm4b0HXhkUZySi4vGKcz7rr44WKIyrM3qyTJ
         nOR+LwegdsKNnjBFZMzMpijAWhIiOS402Ip+I44CEo4EVMe8cvRYMHfcCpioIMNzPFf3
         ZkvclcIXrvXG4udNUtKbm7TquP3e06SbmPSPF5aBp461XKN+5Ps0Nr0V6Z/cmHusHyMh
         Lc3A==
X-Forwarded-Encrypted: i=1; AL+hErGFqqDZO7bmH8RxF0CP6v6M2PIT4ZFuWVX25aA3Bah00bymZXy6SDjUixDf/KuwGXQgmzzznPwl1w+4sQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8tU8iblkgi+FfJO+uZF28MsHAp4oqKhBaVLJFJv/fnhkbNvOQ2
	+2DTn9SM3blr/4Vr8y7e/KnyRdMlzVNCC7DmY5umr+wFmNvlAAaNOsy+UDJ8VVklcWI=
X-Gm-Gg: AYBFou0B6sY8H43mhIj4um7PDgPCSsQCf3AD5FrH7hdSAPKYzp2dnnGKqhVZbHKPw1P
	lu0akHj23F7FnjbCTy6zDDysBikkEP4HvnXX0cDy+3nTQrwJ1nVLyvQyxV8oaUIhuJTjAIZOfAe
	afY2PWsEJAeBkNLjJgG8AIt29UOE9iCZmt7LeLUtCPTU3nSwz0b1CTrjti+xWnvqQwPfrfrU1fL
	iqlHalIp0dyP9Xaisq7wW73zKTk+6RdjkKtdoncVOZmfsauPXNCuxWVvVrJsq15w4iQcc3Ozwag
	/zlEbZCpH7ARjib6HuIQ5eb0ex8PaiEdiWYVMRy5wjFg5ZZKsTspRVz2Th6KB4YhsSUgbvuYq+z
	mU8mf7C+WA33fZVdPKxfI3TQCK6wUrYqnMxCq4FLT74UGIQVZscDzHYvs9CTBqCv9eMu9875WKw
	Scz7omDTWv74OqrUmeXph9X5Zv6eB3U/3MxWxfhNd3Cko9o+74jwCXCz2tWfdcYeNoaZ67uvfXT
	K8IJzI7ePXkHox+0spCdZPVQRUPuTDVjltVK0sR2OOzBe7LjX/O/ytfHHFuoRCEB0rPKtW1oPyd
	H2DQMf0lwR5P5KJkLrWx3hGbkjrLJwvQIpUAkmdm2nWdgnVRclWBe0hYjnHwlLQ=
X-Received: by 2002:a17:90b:554f:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3b12d51f0b3mr872216a91.48.1794135900776;
        Sun, 08 Nov 2026 03:05:00 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm2609818a91.6.2026.11.08.03.04.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 03:04:59 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	dave@stgolabs.net,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	broonie@kernel.org,
	cuiyunhui@bytedance.com
Subject: [PATCH v9 0/3] riscv: optimize percpu access
Date: Sun,  8 Nov 2026 19:04:03 +0800
Message-Id: <20261108110406.97495-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_030501_837774_2FB98AC9 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
operations use generic fallbacks that disable local interrupts. Per-CPU
addressing also derives the current offset from the CPU number and
__per_cpu_offset[].

Implement RISC-V-specific this_cpu operations using relaxed AMOs with
preemption disabled. Native-width read-modify-write operations use AMOs,
while 8-bit and 16-bit read-modify-write operations use Zabha when
available or a local 32-bit LR/SC sequence otherwise. Cache the current
per-CPU offset in thread_info, keep it valid across CPU bringup, hotplug
and context switches, and select HAVE_CMPXCHG_LOCAL so vmstat and percpu
counters can use the this_cpu_try_cmpxchg() fast path.

On a SiFive P550, Davidlohr Bueso measured about 15-20% lower
this_cpu_inc() cost in an ad-hoc microbenchmark.

Changes since v8:

- Drop the PIO helper patch, which has already been merged.
- Rename the first patch and update its changelog as suggested by
  Davidlohr Bueso.
- Use value-returning AMOs instead of rd=x0 for CPU-local operations.
- Remove unnecessary memory clobbers from the new relaxed AMO and LR/SC
  code.
- Use .option arch,+zabha for the Zabha inline asm, matching the
  existing RISC-V cmpxchg implementation.
- Isolate arch_cmpxchg_relaxed() behind typed always-inline helpers to
  avoid macro variable capture while preserving atomic instrumentation.
- Make the cmpxchg128 fallback use the already resolved per-CPU pointer,
  avoiding the same macro variable capture.
- Copy the cached per-CPU offset from prev to next during context switch,
  as suggested by Thomas Gleixner.
- Initialize secondary idle tasks in the common startup path, covering
  parallel bringup and CPU hotplug, and remove the duplicate initialization
  from smp_callin(), as reported by Sashiko.
- Select HAVE_CMPXCHG_LOCAL in a separate patch.

Yunhui Cui (3):
  riscv: implement this_cpu operations
  riscv: store percpu offset into thread_info
  riscv: select HAVE_CMPXCHG_LOCAL

 arch/riscv/Kconfig                   |   1 +
 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/percpu.h      | 574 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   9 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   2 +-
 arch/riscv/kernel/smpboot.c          |  10 +-
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 598 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
