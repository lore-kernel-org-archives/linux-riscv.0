Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCAFD78789
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5zLb88UBHROvs4oYsA5S1ZiWkuorJLNsv30TjQ17dXs=; b=vKzJxkGpI7rbzl
	FH/0NSMIL2S2hEO11SmpBvfhfWZi0GYCxxtJASY4nt9FVVnGfVlxcu4VUZZXh5CIeNGUIAzBIwZ+E
	iehfQ/bQ+YT/KLBdYp2MjnKQUmidlM4YVdgET21PspfQkGbvaRduIIGViwee6ZOoijNkaszxsFFzz
	5fLQiAGncIilM+qHFYbEdlfme410ax6GUu1SYmbmL/uX/GKdBVmbgguqvYnNQyeaiv5DGBp0do24K
	ZlHqNJcu8Ug21hZyAKeIcws5h/lCsWz8aEVZNuc8uyDEbpuVebo3sT+fEly5VDCtgoOzjW8CDjXHh
	bJwE5+G3rySb2RQCT+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcEz-0000000AV1g-1tRA;
	Fri, 19 Dec 2025 15:18:01 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcEx-0000000AV1A-16rw
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 15:18:00 +0000
Received: by mail-qk1-x742.google.com with SMTP id af79cd13be357-8b25ed53fcbso265446285a.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766157478; x=1766762278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8S9arpnQbQKRrRPutZ5MVC6WeUVyaLDfqwrd6H6Lag=;
        b=O3lp8Fn+Xt3VKonH1a5V+VkTOjEu3cYg8JMAlo79DNAy/eS8aCrFaNAUGScgRkPABb
         2z4cB/FX546tMYP0WWmOmMw+NYE+4dB8SQWMmDt1R2lyR3DVN2tEKTTh4lnWyNMJWxt2
         dUWpciVRY0zLA4+OTfvbc80XkZqFY2onos4MTd8ot3SUTcMBokYT6MSNlW4ycTTLVObI
         HtlANsCL892r9ivRQmWG1zmfkrkld6OV/Ebj0/4NKaAbt0tA/jaemm35aeaMmRKXavN7
         ReELLb2U/I5GOifo/vFoeCHsW74fm9MlXRn48q+0hSNUXUD4MElRVwOz98f4cLYsJS+F
         Rbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766157478; x=1766762278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8S9arpnQbQKRrRPutZ5MVC6WeUVyaLDfqwrd6H6Lag=;
        b=jm/wShEYslBJ6DcbwcwhFl0PK+b4qbVI0lm4mhxwvFZAIRPgx+0d7C2IEd4DNkSrjm
         bxHq2QbJyOpXhivJwCBOmFKeSYuFK3OvR7Cv8zOm5Jl0hZQL36vNJHyl5zkf1pTeT9io
         8YvbqOyH+hnPTF4r/+vW29wLdly/FAz/0ZBKoObstSDK21OXXKrYmI+tgdHmPPqKE3pm
         9BOMEpQ1gznQ/MoSOgAcL3QQyBLm6nh349B5XGYYIz2/32G/JdbcrYnlDPRercU7gWcZ
         ZVl4G4I1ICZLfPOo8DrBNNNlcB0/GVk879gC+3nN2ApaqCBjulU0Z4dug0tPm1ykIcCU
         rXlg==
X-Forwarded-Encrypted: i=1; AJvYcCUorfxRPvyO09jESsh4lWsU+TKPwNuSVt44INtbcui+F3av4s+dSfIAhPyqYPtSXfXA5Eea9z5lQTYtgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKRtw/epRaesZ2SwI/Er+dYgq0j4SuDz8bSAyzD9LPBz1atwhc
	R/oENdGlHTMwyhmaz09yheYhKvNwB2W/I6ek+HsFG/LLJttrdGCvwfRZ
X-Gm-Gg: AY/fxX4VlgfnhrNVZMAJ8udZZ4fesPxnY3Nf5HvPqvzmyVUsXQX/xa/CZBRzx7E66Ub
	o6yiBLrXckV4a6JFoZ0ogcNRTlYEb5dShCrYRuyzAS3JJ9c1nKqIRfP8oiL3lX0xqUeZ3Mn63FA
	bXF8pioPJsrDbkp6ZtYzKW5NtKs3F1Af8frW6/dvJVfWiXrSW7WTQgyWZFfauB/wkdjnKWVoRok
	Ubk7Zj4euzB5egrPBgtchQTg6KQuMAAKNdzS7ZpCQqe466Zyu6gRhmmgcZh/Q23F4+RyZnSpTZe
	E+MkoPsGuwNbS4/Xer1KVY2ArW5vetAl5fWCaXed9qtmWeyDJiLEEc3EtmDgV1H/yQ3O9j64HUr
	KkHb263+lDIw4SUarIFKEYtzoOYTY1KohGq/aw/usbqmgcHzAytmESgMiitWuxbFobs/hHNcpt2
	3uFY05ENKSqBA=
X-Google-Smtp-Source: AGHT+IGA2/j7Dp0GcCqLOtCuhTofXascKJCOpzP4V5d1jVIW4N3VAzOMwjEDO8OdEOpYvh5aBfsBIA==
X-Received: by 2002:a05:6a20:3d0a:b0:34e:eb6a:c765 with SMTP id adf61e73a8af0-376aa5008bamr2997142637.37.1766150181401;
        Fri, 19 Dec 2025 05:16:21 -0800 (PST)
Received: from 7950hx ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9224d9e5sm2346819a91.17.2025.12.19.05.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 05:16:20 -0800 (PST)
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
Subject: [PATCH RESEND bpf] riscv, bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
Date: Fri, 19 Dec 2025 21:16:09 +0800
Message-ID: <20251219131609.176911-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_071759_307937_BC21820B 
X-CRM114-Status: GOOD (  11.19  )
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
