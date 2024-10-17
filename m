Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D43D374A2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EXI8Z+v07u6BGlp5patHqY2lWyP2iODqLz5tlEzwEaw=; b=OdJi8AgQVNGqX0
	/xaBFb9fsiXM30bIW3L4yS/oyYaO4nzJajgcrvh/J51ZuXaj3ytYGTy9I+QmwwEc9tP1gDz0Ra+29
	kX9GmHK88Tazt5HSMySH9+983/GbU/xqJmuqLbYRuA5uO3K1I4ChDwoLcQAhf/cRYbKv0mFuOHBfc
	SjAomeYuF66kvYdeQFHBocmbDFxHKR9LhgY4Vp+JofTaXH0do92bz/WDI0FRZIJ3hBSXXlPatbDEw
	cWgFScxjsesPI3NX635cC45FnVfD22puS9/OFR+hQsd/mYBNXoJWX5JZUgtu8T1UZI/7sHzm4VGJK
	3Kh7qLI1PrXg8yuHMbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RcP-0000000F8hR-1ELE;
	Thu, 17 Oct 2024 14:36:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RcJ-0000000F8fJ-3A2y
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 14:36:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37d58377339so1026125f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729175801; x=1729780601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZagKg02wl0icL3yNm9ZBuvWQr9E3IdxLZ4rUxrkLGY=;
        b=YZ9LM5lVERye+NuzcV6Vr3uC+DDjKG6EmY0w9VzwPg9zBzpFsJ49GJePgzSIlLY2QD
         vKL6iFOELj1GxwYt6ndl6OK78UniynzPP6O2SdlJbVgq+rVsg/67AE6+j0Vn6ZrJ/prN
         5jzsjcbb8azYjiORTGC6Na6FAS857lama4ql+CnlB2pREMa86RAXpydlOOzURgVfAuYc
         SBD+5suQoCk7Pb0c4t17wwcp6/cUBxiEuzdH3FF3E80c7o/DdAPznpB1lyJ7hoFbnSrP
         4yL9cjMyDa+2xzAAv+gAlwE5528tkLlkXk6KA16C9/3UuVtZvPEuug1esJGbxugHr0nL
         tzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729175801; x=1729780601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZagKg02wl0icL3yNm9ZBuvWQr9E3IdxLZ4rUxrkLGY=;
        b=V6oP62iTw5v/kysrp6EYlI6LJqRH7AINRVx7sXG/8U6Kix0pJ5gIPf4ItHNeVyoJk3
         KR34rMZyUu0VjO8YU4vqJXAcd8p0M1c2cbcRnnCVAz5KypSIdkJuKzilHVGad0UKawOX
         NKpveuSTT3gSt2b/yd/zbQeWHZT6IMb8rDLB11y5CE+6ZBKDjvnpBghEMIgJyum4oVXR
         3gMVeLtbpbrNsnQWQ501nGwS+0+x+nKp77RBbsRKDCNPSGcZrba549vatXXofC00lpOQ
         XHcZtMlrK1RPRj8wBmM10rD1N0Af6g6xxEbwKiRZbHMC8eyeuTu/MSs7vaDPmfP064Gl
         VgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0J0wNHTsiyDDYAucGMWwEBTTznLyUM2RBDZPqnOTQ5Rta1ZNcUvAenZqc9Mr1f+FZPU83pWE/VlA5/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsBwpQ8abHDY/f3ya1bstlTlino+Qwa0ChKoHYmVLqNxFgCogp
	mo5WvF1nkGE2A+rSBU5TFoVv9U7ABtismDG8YnNLFtAayIBOyz4v
X-Google-Smtp-Source: AGHT+IHfffww4ML1derH7Nbp65Ko+ITzCNOIk4WkP160BiZx9OIx2j+xcWvUgSq3w+mw+RHW1zFZsw==
X-Received: by 2002:a5d:59a5:0:b0:37d:53d1:84f2 with SMTP id ffacd0b85a97d-37d5ff27fa8mr21397323f8f.11.1729175800873;
        Thu, 17 Oct 2024 07:36:40 -0700 (PDT)
Received: from andrea.. ([2a01:5a8:300:22d3:c46d:6fc7:2b80:b267])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa87d56sm7473352f8f.43.2024.10.17.07.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 07:36:40 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
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
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paulmck@kernel.org
Cc: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH] riscv, bpf: Make BPF_CMPXCHG fully ordered
Date: Thu, 17 Oct 2024 17:36:28 +0300
Message-ID: <20241017143628.2673894-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_073643_818478_146D453D 
X-CRM114-Status: GOOD (  11.61  )
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

According to the prototype formal BPF memory consistency model
discussed e.g. in [1] and following the ordering properties of
the C/in-kernel macro atomic_cmpxchg(), a BPF atomic operation
with the BPF_CMPXCHG modifier is fully ordered.  However, the
current RISC-V JIT lowerings fail to meet such memory ordering
property.  This is illustrated by the following litmus test:

BPF BPF__MP+success_cmpxchg+fence
{
 0:r1=x; 0:r3=y; 0:r5=1;
 1:r2=y; 1:r4=f; 1:r7=x;
}
 P0                               | P1                                         ;
 *(u64 *)(r1 + 0) = 1             | r1 = *(u64 *)(r2 + 0)                      ;
 r2 = cmpxchg_64 (r3 + 0, r4, r5) | r3 = atomic_fetch_add((u64 *)(r4 + 0), r5) ;
                                  | r6 = *(u64 *)(r7 + 0)                      ;
exists (1:r1=1 /\ 1:r6=0)

whose "exists" clause is not satisfiable according to the BPF
memory model.  Using the current RISC-V JIT lowerings, the test
can be mapped to the following RISC-V litmus test:

RISCV RISCV__MP+success_cmpxchg+fence
{
 0:x1=x; 0:x3=y; 0:x5=1;
 1:x2=y; 1:x4=f; 1:x7=x;
}
 P0                 | P1                          ;
 sd x5, 0(x1)       | ld x1, 0(x2)                ;
 L00:               | amoadd.d.aqrl x3, x5, 0(x4) ;
 lr.d x2, 0(x3)     | ld x6, 0(x7)                ;
 bne x2, x4, L01    |                             ;
 sc.d x6, x5, 0(x3) |                             ;
 bne x6, x4, L00    |                             ;
 fence rw, rw       |                             ;
 L01:               |                             ;
exists (1:x1=1 /\ 1:x6=0)

where the two stores in P0 can be reordered.  Update the RISC-V
JIT lowerings/implementation of BPF_CMPXCHG to emit an SC with
RELEASE ("rl") annotation in order to meet the expected memory
ordering guarantees.  The resulting RISC-V JIT lowerings of
BPF_CMPXCHG match the RISC-V lowerings of the C atomic_cmpxchg().

Fixes: dd642ccb45ec ("riscv, bpf: Implement more atomic operations for RV64")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Link: https://lpc.events/event/18/contributions/1949/attachments/1665/3441/bpfmemmodel.2024.09.19p.pdf [1]
---
 arch/riscv/net/bpf_jit_comp64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 99f34409fb60f..c207aa33c980b 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -548,8 +548,8 @@ static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
 		     rv_lr_w(r0, 0, rd, 0, 0), ctx);
 		jmp_offset = ninsns_rvoff(8);
 		emit(rv_bne(RV_REG_T2, r0, jmp_offset >> 1), ctx);
-		emit(is64 ? rv_sc_d(RV_REG_T3, rs, rd, 0, 0) :
-		     rv_sc_w(RV_REG_T3, rs, rd, 0, 0), ctx);
+		emit(is64 ? rv_sc_d(RV_REG_T3, rs, rd, 0, 1) :
+		     rv_sc_w(RV_REG_T3, rs, rd, 0, 1), ctx);
 		jmp_offset = ninsns_rvoff(-6);
 		emit(rv_bne(RV_REG_T3, 0, jmp_offset >> 1), ctx);
 		emit(rv_fence(0x3, 0x3), ctx);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
