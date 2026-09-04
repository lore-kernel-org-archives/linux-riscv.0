Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DC9C79F85
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTmdd8N8p3W8vpv1oHPeDn6ZjAIxFm5qgd9SMm4SQYA=; b=g8sVGAtw1wyPS0
	/XeZsYc61BSmXC5RGnPmZllsrEC4d2rh2OcCN4mZAQ9+qWa6R8AILiKZ4/xdzdwlHT0NfvJhgF7vP
	cy6yGIrXcW2x5e9wqmrjg54AheVyDYLDreW3jOPWyR0h68siHTO0A3EC+2/2QADVwtfi7slgLHAm1
	b3T+emlOyWPGjTyc/9IzPAmg7U1qdUqbVonueYVpwnPs2YeOIwGSJDmZ6N6M93RzRgqclTbeRwnFh
	AyJ4dawkewiTeeAQqAsq8wrDAfkVqPo+jLfQge2LNtjbGLTXP31t4HSZ7gBmUtTJmu6SSh5GNpQ+W
	ca/IHMGUxnPEPfC1URQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zww-00000003DCl-0MKd;
	Fri, 04 Sep 2026 19:51:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwt-00000003DA3-0Obp
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 19:51:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84864086bfeso1201060b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 12:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551502; x=1789156302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQCTqvUlSwcygaUD7WF/GhyApu6o4em2Qqn+xndUeoE=;
        b=RDy4UqhgIJxYkRxnEW7yF53GfXs/HwwkTzf1bHj80Ic7MoYCXeBR7bZZGd5KaR5Fum
         Bete35fKBy/rUqbyfNZFn7J9tDGz3qQKCiin+TAkSSM8jikIOZrjHPIqtLUEvOWsBS57
         cNgGBQEQvlo9WdYKLFivgZnz4x6qs3Y7eNcDx5F1CYKtV2KXeB4yDRDeHsaNs497VWlt
         FEcMdzM5y0hZcc8PkEPmzJ6izCieL0td9LlMcAp5wcM7QxU79Yjsqt6UkF+hafmncR1n
         PTt97yeuc8qXsvlEgw3eeTb3KZs2GINQzsgVkLt+hQolNSPoTHDnBOYzsjrr6XhOsOot
         tdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551502; x=1789156302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQCTqvUlSwcygaUD7WF/GhyApu6o4em2Qqn+xndUeoE=;
        b=pLxSOZqfPeyzV5atkrwHeHw7YpgRb4SyUOqjcnrCUgEGKThVOCAA+WQ90T73kLz6u3
         vXKzRJg33/OesQT0NK4pNNq+P62Utsfkfhg/1qLMXHeSef3ekg4awEvA5xMrx0bl3jpv
         3rrXIhBMaGC+6O1nbkMgUxCvKV39KRz6pPmSO/ajY1HLyvv7WspuH85Z1nXNuZxzzq16
         wOm8csxcJTm1Z45l2bToS9dcfUFuySUMBKYD4IPBJntndIH4+AZ+MDJpOA2j9oIsWa57
         3aKoUWBYkWNLK32vsI+mRLG4BKAFYBkdGCfO3tWRzpQ0ln8bhQvJPbmA/VVuLLcqRlSZ
         8feg==
X-Forwarded-Encrypted: i=1; AKwUvBwX8V9LzqWkQlZIs/LCB8P1G+0q9nyp9IdoQewshw/GqE6ENFDwI+4r9LsDwG0cg3VBKmgSuqo9Qkq6Wg==@lists.infradead.org
X-Gm-Message-State: AFuF++mcg63O1xd04ksD7BHXZVvGJp0wA3qIBuNv5ziEjoh0HMkH98GY
	92A3tMoVzWO8424NNYN05VOEM73amzG/A6tkdLuzDSdTs88EwaHACYly
X-Gm-Gg: AYBFou29b/CXMyoQ3/actuFa8elC7htBtO3IzBZNxnpzW62ZJNSzsdgb4iJKx4kL1ce
	YHv+r0/uyJL1sw3ZLXFWuOBW8jM+kfRGd/TPl60SYP5zKhC3PCEXwWceOV4gzMd5Ad0YC/Eso6U
	PFQRF41tNETWsUIiir2qXPChlFME4LDguSAv9i1z1XqSdVyNyRpDjvTCguxuYcMkehNxU2Vbbw3
	i9RvksI2mRmCwmVCEO0ODAjJIzWJBtb5ZDewzUYT+723M7K85Ec6ZfcpgyuwG/JCqMEXuxIHRyk
	Md7GYcKKTIRAdGGgMQ/Ps4dv8KZGFKVOwe20ofMSoL9WpxYVSWE3ZLkDdC0HHsMao8CCS5BSLnd
	P+7caD1Jmal2Rkjbj51R2gu8w06oGEzJum06H+ZimzsmWEjyf+4zJ1MAlS26iWerLyor+Y8H6Wi
	bt10EopZEMx9xdtSiDPQrR6wlOq7iNnh75e6TZnkRs68rwMSDg9oL3aeVgiaQoJk1h50uUx6xmg
	uVi6Rt2r+M4cOQSLchpVwsd+pSR+a2Eyoewpgz/C8SyyTgZxSIGbKbDsUBqnlno080jDXPxHYw9
	2syAHV5dJ4vJtHT5t43GAx5Qfa0ca6W4YtzaEPZ9WxQHxyLgqCosmYc6NLSYaDeJXdv8puVoIvA
	=
X-Received: by 2002:a05:6a00:ac8a:b0:857:726d:2e9c with SMTP id d2e1a72fcca58-8616b560a78mr11539240b3a.25.1788551502338;
        Fri, 04 Sep 2026 12:51:42 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615404876fsm1497684b3a.59.2026.09.04.12.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:51:41 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: bpf@vger.kernel.org
Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
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
Subject: [PATCH bpf-next v1 7/7] selftests/bpf: Test timed may_goto with private stacks
Date: Fri,  4 Sep 2026 19:51:32 +0000
Message-ID: <20260904195132.141068-8-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195132.141068-1-sidchintamaneni@gmail.com>
References: <20260904195132.141068-1-sidchintamaneni@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_125143_156802_50587F6D 
X-CRM114-Status: UNSURE (   8.95  )
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

Add private_stack_timed_may_goto() with enough stack usage to select a
private stack. Check that the JIT uses the private-stack frame pointer
when constructing the pointer passed to the architecture trampoline.

Update the translated instruction expectations in may_goto_batch_2(),
may_goto_interaction_x86_64(), and may_goto_interaction() for the
additional pointer construction instruction and adjusted branch offsets.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 .../bpf/progs/verifier_bpf_fastcall.c         | 30 ++++++++++---------
 .../selftests/bpf/progs/verifier_may_goto_1.c | 17 ++++++-----
 .../bpf/progs/verifier_private_stack.c        | 19 ++++++++++++
 3 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c b/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c
index 328cf630210a..c5996d9dc8cc 100644
--- a/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c
+++ b/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c
@@ -635,15 +635,16 @@ __xlated("4: r0 = &(void __percpu *)(r0)")
 __xlated("...")
 /* may_goto expansion starts */
 __xlated("6: r12 = *(u64 *)(r10 -24)")
-__xlated("7: if r12 == 0x0 goto pc+6")
+__xlated("7: if r12 == 0x0 goto pc+7")
 __xlated("8: r12 -= 1")
-__xlated("9: if r12 != 0x0 goto pc+2")
-__xlated("10: r12 = -24")
-__xlated("11: call unknown")
-__xlated("12: *(u64 *)(r10 -24) = r12")
+__xlated("9: if r12 != 0x0 goto pc+3")
+__xlated("10: r12 = r10")
+__xlated("11: r12 += -24")
+__xlated("12: call unknown")
+__xlated("13: *(u64 *)(r10 -24) = r12")
 /* may_goto expansion ends */
-__xlated("13: *(u64 *)(r10 -8) = r1")
-__xlated("14: exit")
+__xlated("14: *(u64 *)(r10 -8) = r1")
+__xlated("15: exit")
 __success
 __naked void may_goto_interaction_x86_64(void)
 {
@@ -676,15 +677,16 @@ __xlated("2: r1 = 1")
 __xlated("3: call bpf_get_smp_processor_id")
 /* may_goto expansion starts */
 __xlated("4: r12 = *(u64 *)(r10 -24)")
-__xlated("5: if r12 == 0x0 goto pc+6")
+__xlated("5: if r12 == 0x0 goto pc+7")
 __xlated("6: r12 -= 1")
-__xlated("7: if r12 != 0x0 goto pc+2")
-__xlated("8: r12 = -24")
-__xlated("9: call unknown")
-__xlated("10: *(u64 *)(r10 -24) = r12")
+__xlated("7: if r12 != 0x0 goto pc+3")
+__xlated("8: r12 = r10")
+__xlated("9: r12 += -24")
+__xlated("10: call unknown")
+__xlated("11: *(u64 *)(r10 -24) = r12")
 /* may_goto expansion ends */
-__xlated("11: *(u64 *)(r10 -8) = r1")
-__xlated("12: exit")
+__xlated("12: *(u64 *)(r10 -8) = r1")
+__xlated("13: exit")
 __success
 __naked void may_goto_interaction(void)
 {
diff --git a/tools/testing/selftests/bpf/progs/verifier_may_goto_1.c b/tools/testing/selftests/bpf/progs/verifier_may_goto_1.c
index db7e30da234f..1721897160dc 100644
--- a/tools/testing/selftests/bpf/progs/verifier_may_goto_1.c
+++ b/tools/testing/selftests/bpf/progs/verifier_may_goto_1.c
@@ -90,15 +90,16 @@ __arch_loongarch
 __xlated("0: *(u64 *)(r10 -16) = 65535")
 __xlated("1: *(u64 *)(r10 -8) = 0")
 __xlated("2: r12 = *(u64 *)(r10 -16)")
-__xlated("3: if r12 == 0x0 goto pc+6")
+__xlated("3: if r12 == 0x0 goto pc+7")
 __xlated("4: r12 -= 1")
-__xlated("5: if r12 != 0x0 goto pc+2")
-__xlated("6: r12 = -16")
-__xlated("7: call unknown")
-__xlated("8: *(u64 *)(r10 -16) = r12")
-__xlated("9: r0 = 1")
-__xlated("10: r0 = 2")
-__xlated("11: exit")
+__xlated("5: if r12 != 0x0 goto pc+3")
+__xlated("6: r12 = r10")
+__xlated("7: r12 += -16")
+__xlated("8: call unknown")
+__xlated("9: *(u64 *)(r10 -16) = r12")
+__xlated("10: r0 = 1")
+__xlated("11: r0 = 2")
+__xlated("12: exit")
 __success
 __naked void may_goto_batch_2(void)
 {
diff --git a/tools/testing/selftests/bpf/progs/verifier_private_stack.c b/tools/testing/selftests/bpf/progs/verifier_private_stack.c
index 3d9994a52464..639b53363c9a 100644
--- a/tools/testing/selftests/bpf/progs/verifier_private_stack.c
+++ b/tools/testing/selftests/bpf/progs/verifier_private_stack.c
@@ -70,6 +70,25 @@ __naked void no_private_stack_nested(void)
 "	::: __clobber_all);
 }
 
+SEC("fentry/bpf_fentry_test9")
+__description("Private stack, timed may_goto")
+__success __retval(0)
+__arch_x86_64
+__jited("	movabsq	$0x{{.*}}, %r9")
+__jited("...")
+__jited("	movq	%r9, %r10")
+__arch_arm64
+__jited("	mov	x9, x25")
+int private_stack_timed_may_goto(void)
+{
+	volatile __u64 stack_space[16] = {};
+
+	while (can_loop)
+		;
+
+	return stack_space[0];
+}
+
 __used
 __naked static void cumulative_stack_depth_subprog(void)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
