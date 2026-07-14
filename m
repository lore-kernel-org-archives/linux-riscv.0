Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D9CC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 00:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JsF8JPaIFI210TNqipaq9bzylWlRWFzdYQPJurUytGo=; b=xSvvKZNiEvySYC
	RaHyaRqwIkGx6FzF9wKOHU5CXg4gwXK4Zpohgb5Jm2eaQyvS3Pa4GS4z5XeyKSFfuo6/fg7ZolsmY
	xHwKzwkh2SCungvKpDixRyyZnzKrPHEWugNGujLsuwgVnlXiIXuJdAqCAZksC2CxfUheVV5iilytp
	+h/rccN4zcsGaeBbuvKvZlcApsfu5MKLbtF1+kI8J4jmXWQqVJVQqpm/+FeChVtCWb5YqvsE9YfdL
	NVRefA2oJRFN6GJfZ6Xl3wr3KmzI6NyJwNms6jJi1kFb7+b5usbwis0JpARdayV53IKp4kokx5Tje
	Fib0HTNOW5f1aHP7k99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQyi-0000000Aavu-12SL;
	Tue, 14 Jul 2026 00:26:28 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQyg-0000000AavU-0232
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 00:26:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cea3004256so32667055ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 17:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783988784; x=1784593584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LIPldVf2eYY4ZzOEEdAQlLQd7zeaBceJuQKY42PJtA=;
        b=mUTLrOAuzcaWpA0O2w1xHI5PR1W/3WTS1Q0BpFM6OqjGIqLctgL4Tg+ls3STaMsHio
         2rzLFjdo7zl9WnNkpPfA7uxky7J9n2LEX7dywnDPoU2TrYG317evHztUgZgxXPuH4MXG
         wDF2Afv9k5fm+qc1uee2jaFwzQZlf8uWoOyC/6Ee3ZGXS7yj26Lq9QG6CAGKEWLqRjXz
         vJjOpP0slMM89oVDnZHcSbwIMu4OPM9AF1i44dW7DCu62czZE2RZJc7u+eD9B4Av5SOE
         gnUxsNCCbeAXZU8Qy1a2btyn0CvUoIGiWBmhB0vRquXlVXVbpdy3xZW7QQ8OINxmVWL9
         g6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988784; x=1784593584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LIPldVf2eYY4ZzOEEdAQlLQd7zeaBceJuQKY42PJtA=;
        b=itg42a6uh+BhXOaIuBIePFaRx+2ZAL4n9f3D4Nbr+6ALc0WXy2vUUlZ6akLTGN/NFe
         fVUrbx3edwFlRmCKZYXxsuGGnEHKi25clegallBsOsDXf50SvAR4BK98jcRmp0CdxnYe
         v3CJjqxIbftC97vALQdY2L2tf/z2Mym6Pm8Ad+1IEuz0p+bR222giPmhOprYBX/CK5my
         gQVD4jaL4Cbbyioc3giH8jnCigmjvH8P/obKK7jpNZ6rFakJUU/deFjyNDOG/iQZSD+L
         sdoiTOmYmIwaKeNtfDYft9Fv6XlG3BFH7k4ECbMTD2xVXfQRJwl2PXZR0capQUH2SMnA
         M5JA==
X-Forwarded-Encrypted: i=1; AHgh+RoTjBUrr1fD3b/2xJA9WrP3SQBuMkLuoVJ4HWpOtGG4KucGwUz568I1mamjlGgi8Ytd5as0kpwVCXIoAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Y6R7AgNk7qIniHLKGjIaHYh15rCFNun7BNAuq57EaA/LEAIK
	sbC9wpCsM0AAlu8NTcaW1b9zNzaBIO9KFzJnWLfbtSfpaSurzIvqdV5g
X-Gm-Gg: AfdE7cmyhiia5DPkY34d9PdiV7qU45GSfafZlcCtAPTWLARhpU1mYI/fQ0HqRKk1Ptv
	Iry7FtrZSFBs7q3h6qRy8ByGtec3plsoL2vc/mN4MOjoCOzMapGhyWgzcBUtl/Be4iEM9V+QJZn
	cCOa/9rwaTXIRgeTCE7uXeyD7RzQ4WLQZ70gco0a+YSViF6uUJ179UEoBUO6Ri0ahMDJqeKzdLM
	b+oYQNwRHhHZQubJ0GkMkCF4VydqhLJqcsdtiYNRwlG94lqYJoNiab4DrUJVMWNBbRUrLAu6zfM
	kEJbm62JTpDf85S+n3w1fnUTnaHCIpjuhJcz2AvdrMWMKVPGJM5eSZj3lTKRk36a8U/DsJbMd8C
	sfVfhypbM01Jnr6wLZ28Spzj6ulBWxx0cab17dfGdUBOAqDQQzmFSIHc+L7802nC/DiAevh85mY
	d52GFwjJTcbffLa+bHy9Dm2Ce+7VqQy8DraWbhH8RnPUxlW8VJqK95E46nRD/voTY6v+zkqXB8q
	xKZwYXDEo/MKhw=
X-Received: by 2002:a17:903:2c03:b0:2ca:c01e:8837 with SMTP id d9443c01a7336-2cef143b095mr1026595ad.24.1783988784157;
        Mon, 13 Jul 2026 17:26:24 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (131.197.81.34.bc.googleusercontent.com. [34.81.197.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm105796545ad.53.2026.07.13.17.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:26:23 -0700 (PDT)
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
	aou@eecs.berkeley.edu,
	pulehui@huawei.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH bpf-next v4 0/3] riscv, bpf: Add support for signed operations and 32-bit atomics
Date: Tue, 14 Jul 2026 00:24:48 +0000
Message-ID: <20260714002451.4091139-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_172626_081578_8E7CF0FA 
X-CRM114-Status: UNSURE (   8.09  )
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

Add support for missing signed operations and 32-bit atomics in the
RV32 BPF JIT compiler.

The current implementation lacks support for BPF_SDIV, BPF_SMOD, and
BPF_MOVSX, ignoring the instruction offset field and treating them as
unsigned or zero-extended. Introduce support for these operations by
checking the offset field and emitting the corresponding instructions.

Additionally, we leverage the mandatory A extension to natively support
32-bit BPF atomics (and, or, xor, xchg) by mapping them directly to
amo*.w instructions. BPF_CMPXCHG continues to fall back to the
interpreter.

As a result, test_bpf.ko now runs with 0 failures, and the total number
of successfully JIT'ed test cases increases from 843 to 902.
---
Changes in v4:
- Add a 'dst' param to emit_bpf_atomic().

Changes in v3:
- Pass insn directly to emit_alu_r32().
- Remove the Fixes: tag and update title.
- Consolidate size, mode, and off into insn for emit_store_r64().

Changes in v2:
- Add missing Fixes tags.
- Fix memory ordering by emitting aq=1, rl=1

Kuan-Wei Chiu (3):
  riscv, bpf: Add support for BPF_SDIV and BPF_SMOD in RV32 JIT
  riscv, bpf: Add support for BPF_MOVSX in RV32 JIT
  riscv, bpf: Add 32 bit atomic operations to RV32 JIT

 arch/riscv/net/bpf_jit_comp32.c | 111 +++++++++++++++++++++++++++-----
 1 file changed, 95 insertions(+), 16 deletions(-)

-- 
2.55.0.795.g602f6c329a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
