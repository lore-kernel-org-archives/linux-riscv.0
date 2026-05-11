Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C93ECD484E
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 22:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xh9fIwNI8+7GOYONEsVDEvfpgUV42azP2VIXST7Jukc=; b=00YIPokkmJSRuF
	Vz/uCO5NDlHmq1q67fKsxYXiYmDrif8kLFk3BxjBA0jX9lLn53ecQp2W7wvNT8MZhqpBrzYwll8bg
	mL27I2AxEw77SEPV99d6957Wbc1aOEwNFD0E7TgMGakJcrCFkOnF9KahXcs+wefljHz5hWph6eOUj
	xx1t+ZVqLXiWumjr3htfiIFYluIynA7x4Xmzz0p/1QsBgUx+zqXWBO1KSrCbMdMgVJFmARdz0jUZ0
	kO+k2kSCwRrtsUGbBCtTGKuzvphSHMAg4uctHnWY0uv68hQySHomK+HtKcxtfSScwQ4qIscLS+atw
	6iuEbScgr+TYtHcEdhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYvx-0000000EtAW-0C3r;
	Mon, 11 May 2026 22:17:05 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYvv-0000000EtA8-1BiT
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 22:17:04 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so2067421b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778537822; x=1779142622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4KQfTAAZ5oqTEXttxPs+3ZZUZfSXw+XpaZVnMOUj/I=;
        b=N46+TfqTJWBO8oooQzDCG+6UkIVQHmZDfVbXu1chHdz4kWq4FY2BeIinU1a/teWls2
         x8rC6nidt2pZGhNi4/YK0z/t84qPig7ilnjY3W52r1/kSRHzOSd7n1dPONYXVjmTe877
         6kTLDetOW6n9DhwVmLIczokgYJEZ1xQBLmXD1ihOEiCV2zGKyhD4YYGSUO1wx6tlutEy
         KZn+X558jDycYywU1875aIXoOd5LIs2URX//NPCWCJCORbYtrTs49aci0xsjBYYK2BVy
         c456QLBDec2KHBbAgVXdyU0YJz9WiIbczL5gTQRWCtu59sd6GCAu6FxbadOxhH4FZR9X
         K9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778537822; x=1779142622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4KQfTAAZ5oqTEXttxPs+3ZZUZfSXw+XpaZVnMOUj/I=;
        b=pQURrpr3cuFPal24odCeVuyLEE4qgMXiIo1pJOVI/Qd/aqHjwm2RSPqhzwzM7I/56U
         IX60YUZcamsBj212pF0TOOUPtF7XvXq0wf8qnzdZWEnIuzmAYWW5pPHL3lfFXazrDcZc
         eJ6JWtc3IvUQSY+PGChN260Bmlfd4TjgxI/FqBYceRxrbUCQr1caxaCzHmarBsDaat5W
         j4m7mERm1Px3OqrRFgZNY1o/2xrnYxni19aQa6gwrcg1Jb8lMz61p1RwcFVgpe0dO5Wc
         kjYifF+YlrWKZm7Wq/aavWIH8sTPtUDOZqiUNbw3taYfvf7NDQOPBbgnWIrz2dsht9/Z
         e/pQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GF6kC1VvbKHSXw663iXUvSXSkD4WOlSpd1/9gQABp7Ih3gyAi3t8B4dHDQRL9sXlsEQKHmzBVBsebkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAHP132wwilPeiEKMv2CFRo17Y00BiocuTh9AerpReE1Hxaqxr
	MOPBlrGJrDkzWDGu0smcPtKB8z+Xrnepz1ViosNNICrg8xANwY1pJ7+v
X-Gm-Gg: Acq92OE0wzvcO4b8EoNnNI4tNO08Cw78oZSmvzzBTpNKiXMnGTw1m49Mghnu/nsOYrD
	vFo3W5CzQywbtb7YBpjWfENKSQxNEWtoeTrIJif1SHbvQKMxT20W4GeLhZM7iGxXl1EdCwuTAPj
	KvxwjyJugBmc+pVN6Xfw7CCCy2OEn/yd1dcYuvgJQkIH9lcef2JA9ysj9CvIslBL98JKa5KXpwj
	GIFz3whJX55xlmAyqCLTyIOhbPnzeUKTxPlgZzdsekFowujMMOmwgnxDSWdVQ/jz1kNRXXTfTW6
	VkAoWkMeLjTy1u7H9xVC7VxMma4GW2gfJ+pQoLXLjRM7EmyMdxgwjL1GmsMEBT+tpkyucVslujc
	AejIyO/4kKLg0CZMaaAPq917uJXKvaZWRUJiH5luFSrjfmgWkTAgtp1pc5uiArZD7H9T4Gnpko3
	yu9VPzmBebJSQck1tLa9ByC+vHLxbYOR/oQyAvZVMIz4Lr5NFBmNoFJ3U3EJ8Dbq/VbgxgKeWjy
	Ii0RD5rtqFpHgAkLFttd+zdJ/QH3WBXHg==
X-Received: by 2002:a05:6a00:b82:b0:82c:e60c:f36d with SMTP id d2e1a72fcca58-83eebfb399fmr276070b3a.48.1778537821952;
        Mon, 11 May 2026 15:17:01 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm21943329b3a.19.2026.05.11.15.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:17:01 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH bpf-next v2 0/3] riscv, bpf: Fix signed operations and add 32 bit atomics
Date: Mon, 11 May 2026 22:16:45 +0000
Message-ID: <20260511221648.3251464-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_151703_326190_6D5CA3D5 
X-CRM114-Status: UNSURE (   7.51  )
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

Fix miscompiled signed operations and expands 32 bit atomic support in
the RV32 BPF JIT.

The current implementation ignores the instruction offset field used by
the bpf instruction set to specify BPF_SDIV/BPF_SMOD and BPF_MOVSX.
This causes these operations to be treated as unsigned or
zero-extended, leading to test_bpf failures. Fix this by checking the
offset and emitting the correct instructions.

Additionally, we leverage the mandatory A extension to natively support
32 bit bpf atomics (and, or, xor, xchg) by mapping them directly to
amo*.w instructions. BPF_CMPXCHG continues to fall back to the
interpreter.

As a result, test_bpf.ko now runs with 0 failures, and the total number
of successfully JIT'ed test cases increases from 843 to 902.
---
- Add missing Fixes tags.
- Fix memory ordering by emitting aq=1, rl=1

Kuan-Wei Chiu (3):
  riscv, bpf: Fix support for BPF_SDIV and BPF_SMOD in RV32 JIT
  riscv, bpf: Fix support for BPF_MOVSX in RV32 JIT
  riscv, bpf: Add 32 bit atomic operations to RV32 JIT

 arch/riscv/net/bpf_jit_comp32.c | 101 +++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 16 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
