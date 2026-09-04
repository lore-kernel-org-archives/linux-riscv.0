Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C054C79F8E
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X52LWjv/Q6QhlTLNo1VimJX/3pCoJV1MqscnKXsE/aQ=; b=ao4kUz0ZrZdokE
	1urJgL75KuAXmFpFl0MyJoGUtTNII4pv3dNhhd0ApgSzll1/dK5UVtExkQalmLgNYA5Qgdw/hB4Km
	0pzJ2pj80gFHXl8azdFQ2uAalpYSewsFJnbOvISNnLvZMg97kJaB0ylBAINGcbQdFvH6em2/xHveI
	i6rf4iwWqkowOeVMaLDeKo2hcDUR231IPWWgOyjK0O/7pX2oLNu5ptqJ/1z3LwKOUvV1RK7M11h+V
	+4F8LnXPLTp02G7pqBQkZcdyUYr8gpsPFIx63rQ7fIDCT5HDHzZZRaSTffUA4DAm2UR+MsPu61pta
	yeaP2w40qhuU1Q0gsI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zws-00000003D9x-3TnH;
	Fri, 04 Sep 2026 19:51:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwn-00000003D6w-2WUN
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 19:51:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-853c07a76adso1276410b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551496; x=1789156296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tq4f0YItm8Nzb37FYEFxDW+SOlv8AsSzRVHLQA1+cF4=;
        b=NqFnW8Ouow/+Q8jIZ9m6eU5stMmZFr2Iio8Mkf0hAxun6t9onNm2Laq4H48B+tTTLO
         DIsf7047gF16anKxKrGEqCwF84XlI2ICOMlANhWwY8kqPERI25fFrs4xzLc1QpgOoSK7
         v0z53B+Wbc6MLvbjeOKqokHEs0+6tXp2Vhb/PRrAl3UxztqnV+8GSGAC/ouiqy3wXply
         ilkAm/wNhs5e1iN1NqdRv4Cf1F6xUGqehMQz/fAvsh18UMqP/CiAEXqbLIQj7PTSSYVm
         wgKremxknVQ8RuZ5uCBP3b3plgDepX+RY/2eDYPe1uTo0f8eB0F/uvIfHS0FgOUvJ1Os
         c4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551496; x=1789156296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tq4f0YItm8Nzb37FYEFxDW+SOlv8AsSzRVHLQA1+cF4=;
        b=KIR6/vUWOC2q2+4xKZahfJos2/pqROVFt/4TITrZ0HJSdO1Kc7VigwsNiyP4p5nu38
         6/Rjrd/U9l9RemXDtcdkLidc5fO8M+O1sSuG6ALXqhzjckvCU+C9E+uz9k0y9kdQfujJ
         ynPMoKr+92vqdOitr55D/QyX1lp+Hv0e5ALASpUAxMjEMqbBZZsChgYcnxnYmJ2xAsOP
         +jb6vfS+1mjyvUYEP+DC8yD40Gc5dSGV/Nca0nvTjwne9ZhUHiVf4ac2Q4r/pip5GYjr
         KDLIXBdjpmDtaEPzTaUENeBs3Jb2rZpVawVBf2D2dcEhCUjvbn77tXta4STZreo/NirL
         5pig==
X-Forwarded-Encrypted: i=1; AKwUvBwUWMXSxzB+FVEKhwu1QJmtr6QexLvL1BAGE5pY7S5+3bCiiAkWP1b4mzsRCMV9ya2oylE9GdfEr2ZSOw==@lists.infradead.org
X-Gm-Message-State: AFuF++kbynjUI7pGweaog6fQN58k9MF7HCs8SYY2Tsi59BzswA5EFXjW
	+gNV0hqDHg9UA1usaxanGe4K6PPMo9cPxDqFKIv6e/riwdwh+R7Ov0qj
X-Gm-Gg: AYBFou1tpUuB3tpHgOoD5OiVw+Y+c/In8KDd/sGO7XUXBI+a2JzEqDng3/1aMcrTE//
	qvN/PcbhwzZIqE+yOjVWUYERvQ8qsUkFsQGpqTbq8EfSMDYjJnmEuN5HI99/TkIcBRD/HvrzpRc
	7EiqXsmFBw+2sbxmuk1mXDPPqg3r2Ru7cFHspiP+yDKp1IpcdAHD6NYqDdSDcstW0OGuFwvIJy7
	zHZuzGUkPy2UgpVLjbMC2Q4Wdn5YDtugk1plJejwvfz79vzlLNy/dsTqWmQSrtJjnhKrXbfiXWY
	ZgtEEZh4SRcvNZNb3g+fpU25lERcS8GN99FhdXBISAXpT97rfMdea4lPPT8XHNGWsvXHGYXzlj5
	Y8ivM0akq9anUS9lfOfFlRjp/KrSeuFRVzNtdhtOvCr8kUI+sF2/EGm2YDv1Wgpo2w14qUGnsvS
	/eD6Jf5eqcHKSrKAOBLP2BdIlyxT38woMUgwYU+lNfxNUW7z2OZYGpIUh+S0xl/6jzWQOIuwoz4
	9Mpd5ZVEniyuG79MMRjEL/6bh2J9wkZA6CiLcxwgZzmHU/jzyQ4ctldGVlLAe1s6BAGys/dsMMd
	KJ8nktYRdlSvbq3FFDxee4lFYqychpl8z+1UDlRAh1YiD+WaDzLy9kQMdf2vEyTv005lw/L7gaw
	=
X-Received: by 2002:aa7:88c2:0:b0:861:1acf:6915 with SMTP id d2e1a72fcca58-861676aa87cmr9593446b3a.11.1788551496447;
        Fri, 04 Sep 2026 12:51:36 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615404876fsm1497684b3a.59.2026.09.04.12.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:51:36 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: bpf@vger.kernel.org
Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	apais@microsoft.com
Subject: [PATCH bpf-next v1 1/7] bpf: Fix timed may_goto stack pointer for private stacks
Date: Fri,  4 Sep 2026 19:51:26 +0000
Message-ID: <20260904195132.141068-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195132.141068-1-sidchintamaneni@gmail.com>
References: <20260904195132.141068-1-sidchintamaneni@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_125137_638639_13B77ED3 
X-CRM114-Status: GOOD (  11.18  )
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

timed may_goto passes a stack offset to the architecture trampoline,
which reconstructs the counter pointer from its BPF frame pointer. This
breaks when the JIT uses a private stack with a different frame pointer.

Resolve the counter pointer in the fixup using BPF_REG_FP and pass the
pointer through BPF_REG_AX. Account for the extra instruction in the
internal branch offsets.

Fixes: e723608bf428 ("bpf: Add verifier support for timed may_goto")
Reported-by: Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>
Link: https://lore.kernel.org/all/20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr/
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 kernel/bpf/fixups.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 65b441e4a351..dc59501a32bb 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -1797,20 +1797,20 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			stack_depth_extra = 16;
 			insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_AX, BPF_REG_10, stack_off_cnt);
 			if (insn->off >= 0)
-				insn_buf[1] = BPF_JMP_IMM(BPF_JEQ, BPF_REG_AX, 0, insn->off + 5);
+				insn_buf[1] = BPF_JMP_IMM(BPF_JEQ, BPF_REG_AX, 0, insn->off + 6);
 			else
 				insn_buf[1] = BPF_JMP_IMM(BPF_JEQ, BPF_REG_AX, 0, insn->off - 1);
 			insn_buf[2] = BPF_ALU64_IMM(BPF_SUB, BPF_REG_AX, 1);
-			insn_buf[3] = BPF_JMP_IMM(BPF_JNE, BPF_REG_AX, 0, 2);
+			insn_buf[3] = BPF_JMP_IMM(BPF_JNE, BPF_REG_AX, 0, 3);
 			/*
-			 * AX is used as an argument to pass in stack_off_cnt
-			 * (to add to r10/fp), and also as the return value of
-			 * the call to arch_bpf_timed_may_goto.
+			 * AX is used to pass FP + stack_off_cnt as the argument to
+			 * arch_bpf_timed_may_goto(), and also holds its return value.
 			 */
-			insn_buf[4] = BPF_MOV64_IMM(BPF_REG_AX, stack_off_cnt);
-			insn_buf[5] = BPF_EMIT_CALL(arch_bpf_timed_may_goto);
-			insn_buf[6] = BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_AX, stack_off_cnt);
-			cnt = 7;
+			insn_buf[4] = BPF_MOV64_REG(BPF_REG_AX, BPF_REG_FP);
+			insn_buf[5] = BPF_ALU64_IMM(BPF_ADD, BPF_REG_AX, stack_off_cnt);
+			insn_buf[6] = BPF_EMIT_CALL(arch_bpf_timed_may_goto);
+			insn_buf[7] = BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_AX, stack_off_cnt);
+			cnt = 8;
 
 			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 			if (!new_prog)
@@ -2661,4 +2661,3 @@ int bpf_remove_fastcall_spills_fills(struct bpf_verifier_env *env)
 
 	return 0;
 }
-
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
