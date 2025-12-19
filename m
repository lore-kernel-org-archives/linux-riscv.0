Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09BFD78786
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5zLb88UBHROvs4oYsA5S1ZiWkuorJLNsv30TjQ17dXs=; b=feAVKr84qUfj/w
	kU1qC4WhCtPrYq4M51ddwO6PDml+4sXCcI+sOfqIUkd1ljuOTVCnkKNc9VlhNSwVvl+KR9vMTxOsQ
	x0C2fes9Due185alsIDYCmjc+AJgDu1nVMjCnwlOBktTUQPOWCdmWcYCXJ45OKAnvj33kCTQGx43X
	x/4nY+30gNosy+Ecd7FwXDTMbgVj/yM5GxYZU2E2cFgBGz1JNYFcyLI4AUak/YQNqWMM/3U1fG6Lf
	pIXB+mfiklMyzn12gCby+sOOjCKdSlb4m++VJbXSg0IhDP3y9DgTs6gkIiwqZ7q5vvG1howw0QzTc
	dOLR9oFv0oSZco6CLEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbdx-0000000AQwx-1EEs;
	Fri, 19 Dec 2025 14:39:45 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbdu-0000000AQwV-1IOU
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 14:39:43 +0000
Received: by mail-qt1-x844.google.com with SMTP id d75a77b69052e-4ee158187aaso19089141cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 06:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766155181; x=1766759981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8S9arpnQbQKRrRPutZ5MVC6WeUVyaLDfqwrd6H6Lag=;
        b=nnSU0vt0eQNIo6Kkz5t/3PQzUWcYkN7rEfpTRKBhNbq+tfABKuxiR/LZa18py+/zmd
         X0gl4ISZ5eWUMjgHJL77W+Bz4/iIIcktn8pE/5MyrXx1140pLYRed0urPM6+bHF1QEhE
         DVz1/1OPiTw2VpL2rEliJiIDXcvrpPCLZL8nkmdbw65q/WX4Si90Pj0Mtx6TndraJQXk
         jreoC6zxy08VZoOz45fPW2ao7b0r/VYISSpdq/P7yqQGJIvNhRXOT5huNb1rot+16+C5
         m5Xo9xpoaq/6f8XgJsSE1yvuYAAsc0NeQ25ooBmtCczqbnGsJi0EoTm6igFUjszjWjFT
         lQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155181; x=1766759981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8S9arpnQbQKRrRPutZ5MVC6WeUVyaLDfqwrd6H6Lag=;
        b=nVzMcThjq6/5dBpMDmo2WmJ9kp9NqHY4iAO+LuBNf5o7v1oEyQx2d7Isfw8sXhajcC
         hr4HN1Ux0gTl1XJlsOAWS0ZWrn5EuUI6PPquL/yvd5bgbMwdyCyzuskeJeyrEO7OunDP
         XndMGIfwh3F1KvN3mKU22A9yoOEnraoM3CLuSv7wY0liY52HkuQo/BXPg+pQwVkoE/g3
         Kvs5s8Xb1USjzD54Vk06wrI/eOrkvxQfCHvgUlYPRGcqsTqj3eBn4ypUL7NxRzTiL1az
         I4qOoGtYUDtlXt18XUUDL4FXnG5IHKe1WuFroIN70dTAYFQ94KljoBCKDxBqrFdNYosR
         0big==
X-Forwarded-Encrypted: i=1; AJvYcCXCFBCzPMMneu5A6926PEZNDTRM4iY+2fL57Ityr80zmScqZBx4ZUIEq+vgZBORMCTC5yN50R7w064eWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVOQ2PrEF634zTumsDb5nHFe2z09ULyZclsc2gn6F7V002PIvC
	PwaSjKGbX3Xt+ktRf7vLOyyTF5HCvw2F5jM9P2Tt7Uh/ep9RxrC9hvBl
X-Gm-Gg: AY/fxX48KqrIBF5vgo82N66SC49eNIQwuXNmV7uleGhVK9cXqU9zZh/HL0XTH2DnsS+
	yrnemkzz5B5gDEU4uj/eoofj4tQvUR4v8Fm9RktCLUDnfaCd6vBo7fpvcdGYdcAvTZnLGDSmIWp
	y45THjBQJBZJuSuglP+mVqxnQT5592tEfhCVUQx5jj7iuMJBeEA0HSOzKuMmamKh9LtuDNeroKJ
	NZ/bQrbY2BuJFAzi7JXEAFt64JlE92dBX42FAKphxAD5jMCucQgZ/IphU1IRH8HlM4Am/Gh6R8b
	DOKAdJ0iHyg7lsmGIkj2dARwqTO9ijw1Qm5IB6xFAaWz151oxJcXYLexSw4YeydPFPefrSW5BmE
	gqH7gccOe7t/8QH0jv4aNV8/tsLTf4w9zsNV4PgEAnEdWiUAzXgnjTxZ6kY1aHKcV+2b7B/Tde+
	tJmvuHJmDWiwo=
X-Google-Smtp-Source: AGHT+IE+veN2yrrZeFF1UwlrVEnWYNBAeihhpAYdak+7pFIePoIXcnPL+veHjarmZ99tXTrQ3zfZ4g==
X-Received: by 2002:a05:6a20:e293:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-376a9de5b1fmr2872897637.41.1766148481835;
        Fri, 19 Dec 2025 04:48:01 -0800 (PST)
Received: from 7950hx ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm2110688a12.2.2025.12.19.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:48:01 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
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
	menglong8.dong@gmail.com,
	jiang.biao@linux.dev,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf] riscv, bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
Date: Fri, 19 Dec 2025 20:47:48 +0800
Message-ID: <20251219124748.81133-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_063942_360387_0ECD8BE0 
X-CRM114-Status: GOOD (  11.27  )
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
 arch/riscv/net/bpf_jit_comp64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 5f9457e910e8..09b70bf362d3 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1134,7 +1134,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	store_args(nr_arg_slots, args_off, ctx);
 
 	/* skip to actual body of traced function */
-	if (flags & BPF_TRAMP_F_ORIG_STACK)
+	if (flags & BPF_TRAMP_F_CALL_ORIG)
 		orig_call += RV_FENTRY_NINSNS * 4;
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
