Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50E5D78797
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n9s5zovepzvwblZUm5dsXxVNbvOvk8T7laW5ezUBUCE=; b=kz/N3JGtuSqZZa
	le/zulDqo3lfiYPGBYeLn/4bL4qQMqmXgwFJaA/P3kme+fhsdZWxDXEBbNZHUg7AON7ibPnthGBmj
	KDmW5naS46sjHPcBJ0rcYMHVpx4nRDxZvqSvRCJBit/ygaZ0aDuRT9EZTvsw0knAZCazV7ri+j/I6
	ukpsKpuECNhSgJxJxM2Qq8HsMRTfPcCu7p+x+pLOlMZp+J/qNrw2X+Gp5sV1eWtSXv/Xh9UKcWt1B
	5yP33cYHC0Ton6aSpHtyJffFeVqwqm8+4ApybTOCa8IR2Xv6vEvT6h5dH9a9VVMq8QKiHwGfn4A65
	v5vZDE9ZpFhso6RS1hug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd31-0000000AcdC-0r4i;
	Fri, 19 Dec 2025 16:09:43 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd2y-0000000AccD-1EVY
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 16:09:41 +0000
Received: by mail-qk1-x744.google.com with SMTP id af79cd13be357-8bb6a27d3edso177256085a.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 08:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766160579; x=1766765379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Edwd8UY5a1jD2Jxp69UFc+WzgBkBRj9goxSodHca6Sw=;
        b=Xwh+BBwELdVYGgpx6v0hotzSFmQnYa35Eca1NrA69cr/JiaEuZKGdTKaVk7SvRA5Ah
         CWKHbjzAdeggJbmUXWOfWCJ/dUEQRgNOpL6fU6c1KiTYtthIzNFAjEq95H8fEXOYpBVs
         ED5z4u+YRyh6MKPjflyVK3cW58UpCVkohqVbc2ytcPu3H1c+kJR69FHgb19Ee7hX+O27
         nayV2q5NgoNksfRAgyScFXYlEc2wAzgUnrQAAnm8gsrYQIjucmtwS76guO8ICoSmroSb
         oO+aNFyonnX5toSIRyCcBG0rtcfz3ZQ11ChY/epewNE0mPHq3kuQE038/UTJyvuqG/Nk
         +pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766160579; x=1766765379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Edwd8UY5a1jD2Jxp69UFc+WzgBkBRj9goxSodHca6Sw=;
        b=oMMq3kWHhc2vWKQVi8Byt59sd/65ylea2S2P25yJsiFf+Q/kTeI/QUa1Qvg77gcgvp
         zg3VSQISvnb+Gvta40UwZL7xBEgQDcykGE4PymyolOd+vXoz2/iGqa4zHsLfK66bHEik
         9eL8chZGXIWMbC1n2q9oreWVYBlmBVRjhFEMCLfx8lxO+ZXtnHFwLBLpsMRVQtfkYs9s
         1g6Un69fw24eRngtXx4TCFu94yjVv9aj7MJCVk/wQjRu/GzKur5SeYXYnRhQ2qemRJF0
         h3n6zjEk67o9dACkA2JWIQ9/a0OsZeHN081o/+ctRxSuYkUllAqUz71h+aKznNLw5LKp
         jKfw==
X-Forwarded-Encrypted: i=1; AJvYcCXTsKZRGxS/ll8Tp8v/1eXv27TUkp0yIq89ACq4U5zE+31bG591efL3zkxcmKozKbiWDcnEOIGPaY5h3w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3OChiXERJCoy5uSd57/pkVQ5X2XOmLMvIa8nfu4cv8+dDHuG0
	HTp7UkfYUjd5JQ0JUsNv/3+GT6ajH15k4buL/6OXPKfncvw7JVG6esm12tuReUA3/VM=
X-Gm-Gg: AY/fxX6UtGvOLDK3ZEgL9KdnciQCAxRAhTHVzTrcg5mswnhQQRVsv6G0xKqpCh2QCI1
	SpjljoDy7r09wDgvQZRPmE7uQQDPzrorlh4lGFYXFu5XOv3AvZMRHYs5l/p+DIKeCytlnRm3xad
	aPfjpg1vNp0BxF5rv+MYWA1PlYdRocD3VSjYBrl/IoKeQB1cNHBjMW31rCAVTtlvQwi4ncLi/Rh
	L6cnmLq9iDNPP6domWOGvt3WGzCSQ0VgmY0MjsWtk5CF78rK9OG8aV0fBXfhq0qmnMw6I8pJN/C
	p1LOk2EfaQRJU1bVeK+lYmPBX7JKjBcEmbm9qaBIahUoxj0s/QpiuhwPeqejSLkbM/5iNEclXea
	Zv9/aZwI1QDfCF3JuZJ93fMXufOfJNUWUpvuk/WtXgl+JNoxoucGzlIMV6EmXT/zEyxX69KnEmS
	q6uGC96Vpz3IoGK6Ox1DZVsA==
X-Google-Smtp-Source: AGHT+IFq5oWI2daMug51YuI+nmWHxSg6/yFeviCCy4ETMjX2vXEJi5/nbTSyTXuKWJ73d/ANbQ0DVQ==
X-Received: by 2002:a17:902:fc43:b0:29d:9b39:c05f with SMTP id d9443c01a7336-2a2f22026camr31186615ad.10.1766154600996;
        Fri, 19 Dec 2025 06:30:00 -0800 (PST)
Received: from 7950hx ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a769sm24607575ad.7.2025.12.19.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:30:00 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org,
	schwab@linux-m68k.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf v2] riscv, bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
Date: Fri, 19 Dec 2025 22:29:48 +0800
Message-ID: <20251219142948.204312-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_080940_370296_1D959659 
X-CRM114-Status: GOOD (  10.56  )
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

The usage of BPF_TRAMP_F_ORIG_STACK in __arch_prepare_bpf_trampoline() is
wrong, and it should be BPF_TRAMP_F_CALL_ORIG, which caused crash as
Andreas reported:

  Insufficient stack space to handle exception!
  Task stack:     [0xff20000000010000..0xff20000000014000]
  Overflow stack: [0xff600000ffdad070..0xff600000ffdae070]
  CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
  Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
  epc : copy_from_kernel_nofault+0xa/0x198
   ra : bpf_probe_read_kernel+0x20/0x60
  epc : ffffffff802b732a ra : ffffffff801e6070 sp : ff2000000000ffe0
   gp : ffffffff82262ed0 tp : 0000000000000000 t0 : ffffffff80022320
   t1 : ffffffff801e6056 t2 : 0000000000000000 s0 : ff20000000010040
   s1 : 0000000000000008 a0 : ff20000000010050 a1 : ff60000083b3d320
   a2 : 0000000000000008 a3 : 0000000000000097 a4 : 0000000000000000
   a5 : 0000000000000000 a6 : 0000000000000021 a7 : 0000000000000003
   s2 : ff20000000010050 s3 : ff6000008459fc18 s4 : ff60000083b3d340
   s5 : ff20000000010060 s6 : 0000000000000000 s7 : ff20000000013aa8
   s8 : 0000000000000000 s9 : 0000000000008000 s10: 000000000058dcb0
   s11: 000000000058dca7 t3 : 000000006925116d t4 : ff6000008090f026
   t5 : 00007fff9b0cbaa8 t6 : 0000000000000016
  status: 0000000200000120 badaddr: 0000000000000000 cause: 8000000000000005
  Kernel panic - not syncing: Kernel stack overflow
  CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
  Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
  Call Trace:
  [<ffffffff8001a1f8>] dump_backtrace+0x28/0x38
  [<ffffffff80002502>] show_stack+0x3a/0x50
  [<ffffffff800122be>] dump_stack_lvl+0x56/0x80
  [<ffffffff80012300>] dump_stack+0x18/0x22
  [<ffffffff80002abe>] vpanic+0xf6/0x328
  [<ffffffff80002d2e>] panic+0x3e/0x40
  [<ffffffff80019ef0>] handle_bad_stack+0x98/0xa0
  [<ffffffff801e6070>] bpf_probe_read_kernel+0x20/0x60

Just fix it.

Fixes: 47c9214dcbea ("bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME")
Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Closes: https://lore.kernel.org/bpf/874ipnkfvt.fsf@igel.home/
Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
v2:
- merge the code
---
 arch/riscv/net/bpf_jit_comp64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 5f9457e910e8..37888abee70c 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1133,10 +1133,6 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 
 	store_args(nr_arg_slots, args_off, ctx);
 
-	/* skip to actual body of traced function */
-	if (flags & BPF_TRAMP_F_ORIG_STACK)
-		orig_call += RV_FENTRY_NINSNS * 4;
-
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		emit_imm(RV_REG_A0, ctx->insns ? (const s64)im : RV_MAX_COUNT_IMM, ctx);
 		ret = emit_call((const u64)__bpf_tramp_enter, true, ctx);
@@ -1171,6 +1167,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	}
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
+		/* skip to actual body of traced function */
+		orig_call += RV_FENTRY_NINSNS * 4;
 		restore_args(min_t(int, nr_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
 		restore_stack_args(nr_arg_slots - RV_MAX_REG_ARGS, args_off, stk_arg_off, ctx);
 		ret = emit_call((const u64)orig_call, true, ctx);
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
