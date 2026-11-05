Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CB2606CBCB
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EalhEpMS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JdNzkF5w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dhNfErP/fVU5XkgGUvjFIJ1mDUBR0Aq393Uki5Foi9g=; b=EalhEpMSh9n08AcCD3WhR6Bd3m
	ZnxcIbhflK5Dg7kWmmEV9WXQRYCE/QlGRGPZnW+u8S7UtmZmocDjBT9846Fyzg5Yz7TobJlkxVbhm
	JqCRofy75PxnbbgcRJzbeglhtquyJ0wINve6Btu/Ax2n78vZgaabU4jlIkjLAX/38OINGtHMqBLzt
	vSlrhdERL3svUEglMcZqTTyx8qETmpAv9rUZr3YyG3plINW+1jFkTXHF5J1VAYWeIccCon1KgNNL/
	97OU4EVtDANMIi7w8PZiGSPoMEVP7egwus0voFl0uYBwJ8QUJpFeuUJEUy/zbwxxd1YBHFJubgqAV
	Z6EVFqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Si-00000009exZ-052N;
	Thu, 05 Nov 2026 16:37:17 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0SY-00000009ew5-2CuB
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:37:14 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1765256a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896624; x=1794501424; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EMTT2HHjSkY1uGJyH89VPeEJ36kiCXEDFii0T4E6Iac=;
        b=JdNzkF5wzK0r1BI+mmAgASAJT55HGfe40bLAx9TI1YqALIELyTYbFWxix9zo08FewD
         yZRRTK12OzU/dpikonPQYCG5MtiAENkJhHVfcwcpnLA69hw5uaQOZrn3QCmMa6eCQF3/
         ZwMtCCtIxs72LwsDcOLxYSM4TkL4iswFWw7Uywu8acID2q5wArKNpBCrhSn+CHh8oTAd
         a0PgEpA1XeK5aYOU7lDaQ4YJoqNOsvAhdWqmJxTDaGfC5wmn4J54uDQB8N515eKySMxc
         nq65lW0anfu4zYKX9Xc493mEZDtXTlocmQ+ftSXB6HOW0RJHf5hf9UK/FcCYfj7V/a4V
         Z9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896624; x=1794501424;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMTT2HHjSkY1uGJyH89VPeEJ36kiCXEDFii0T4E6Iac=;
        b=jWkYVH96lCS9klH38GnKOk7z8P86oLUoHsN5Qrq2Ul243grqk87SJ3y6k709d2tTRb
         DvQSgs7uZJQRM5JKfpo39ctCycZXD3wYBYGLn7rjW4ShhJhL69un0id+tFYoZ8qc+m3F
         HF7RcQ6clAVZ3xGLvsh2MUEzUz/G9JMN/DcvtraAhllxoFHzJIpwuxvojm9x+GJmv3zs
         fv5w461FVfeGverKwZhfcxZFrgROPn1F90rf9yYQzSzBoQroprM+Ho1/bMH73zLSTAbK
         pfr8rfwTBOj5PRklZ6/CdHbw+FR0/8Ceg4Dy21mhEUpPaY1PVxUAqy1cZt+8AcxWGxWL
         /M4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8Ig4PVJEbnyNl3zEtAdPiTE7YHkNCD7G54qYMcIlaKuh9cnv/D3xPBFz0L1EQ2jwOw1hMwpRgjbLtaw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8E96R7YEcvq9zHpnkZxkgO4W2o74I/Z45H9L1Xsc1ujfqfvyRu
	iNd8AC1frPlD85vbL8b2vp7nJdq4ybZfvmmGHVOz33R+vnlV16TxS0/e
X-Gm-Gg: AYBFou1FZ2kNZgJbB0XIqHYdrk8zXYoZnANlXCSOuDbojaxs2LVfUOoOaDAffWc2voH
	N3n8/O+ERJK7h3mc7X6rb4diEg3Bio4El79V8yzk3RvFeqdvZf0o11YVXixVoY0804ZsffH0kzv
	sjyORg+7g9n3MmdN1fjTkE8guIWhW3EQE9CCgu+SJ3i9xsHW51BVL0TW8m4Hu9wRKtUph2mCuNF
	tNvVL/LHopnAjtYLQ5PEz6jNsCMpY+bcvUThTCo0sgxXcC4uSnQCsFcgQ+MSJwI9nqKUqgiCQDT
	fsTnWQdWghSdU4R7oY9f8jnSBJ8ap8gZjax6BzQliM6nnizw46LcG6DWn93bzLLJ/KNSgDj4LNQ
	tvk02rjMBwnbcrAYKi31FKWF8W2dJ5Ym+YscxOyoLRzdaJjb+QQJhxvY4kuBQtKUa4qwV/zR0Rt
	/+Htxift8clg8FAqR/TedZdXXFIdV5TIfN5R2DvAhgVMa8rIoRrl9rjHvOUY5nKG4WxWTQY7ssq
	Z89BcpjNqztc17T7SsqiQclFb979R2RE2Fe0vJNoO/18+qzy6csSx5pHy8001jh/qV6wvHb37c9
	VsQYboBayGodirGqnqfjYywD2u20LiimsAZ6oHbWuZD2Q2+HFUDZB6xavuEM+pvDh3w0YkMdJV8
	J8f7Mvf0fzaltbzMwmhGNbUWWoWxGiuWR5Q==
X-Received: by 2002:a17:90b:4d85:b0:3b0:a378:1cf with SMTP id 98e67ed59e1d1-3b0a378049cmr4183905a91.22.1793896623555;
        Thu, 05 Nov 2026 08:37:03 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3160634sm4692625a91.6.2026.11.05.08.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:37:02 -0800 (PST)
Date: Thu, 05 Nov 2026 16:37:02 +0000
Message-Id: <DMNFA3D0M816.2K02S8LB47QM4@gmail.com>
Cc: <eddyz87@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <pulehui@huawei.com>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <luke.r.nels@gmail.com>, <xi.wang@gmail.com>, <shuah@kernel.org>,
 <rgbi3307@gmail.com>, <guoren@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 bpf-next 3/3] selftests/bpf: Add a runtime test for
 private stack and stack arguments
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Chen Pei" <cp0613@linux.alibaba.com>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <memxor@gmail.com>, <bjorn@kernel.org>,
 <puranjay@kernel.org>
In-Reply-To: <20261104100411.997-4-cp0613@linux.alibaba.com>
References: <20261104100411.997-1-cp0613@linux.alibaba.com> <20261104100411.997-4-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_083706_983128_987EF100 
X-CRM114-Status: GOOD (  11.74  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 02:04 AM Chen Pei <cp0613@linux.alibaba.com> wrote:
>  .../selftests/bpf/private_stack_runtime.h     |  12 ++
>  .../bpf/prog_tests/private_stack_runtime.c    |  84 +++++++++++
>  .../bpf/progs/private_stack_runtime.c         | 140 ++++++++++++++++++
>  3 files changed, 236 insertions(+)

bpf ci is right in the other email.

pw-bot: cr

Also, the test runs on riscv64 only. BPF CI runs arm64 and not riscv64.
arm64 has the same combination and no test for it.
The run time part has nothing specific to riscv64.
The __jited patterns pin the frame sizes that clang picks for C code.
zero_stack doesn't use the private stack.
It's the only reason for serial_.

Two asm progs in verifier_stack_arg.c are enough.
BPF_PROG_TEST_RUN runs a raw_tp prog. No need to attach it.
The test runs on x86-64, arm64 and riscv64.
On x86-64 both frames stay on the kernel stack.

Like (not even compile tested):

diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
index abf319c..9423048 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
@@ -667,6 +667,53 @@ __naked void stack_arg_precision_fallback(void)
 	);
 }

+/* Writes both ends of its frame, then reads args 9, 10 and the frame of the caller. */
+__naked __noinline __used
+static long priv_stack_10args(long a, long b, long c, long d, long e, long f, long g, long h,
+			      long i, long *j)
+{
+	asm volatile (
+		"r1 = 0;"
+		"*(u64 *)(r10 - 8) = r1;"
+		"*(u64 *)(r10 - 64) = r1;"
+		"r0 = *(u64 *)(r11 + 32);"
+		"r1 = *(u64 *)(r11 + 40);"
+		"r1 = *(u64 *)(r1 + 0);"
+		"r0 += r1;"
+		"exit;"
+	);
+}
+
+/*
+ * A frame of 64 bytes in a raw_tp prog goes to the private stack.
+ * arm64 and riscv64 pass args 9 and 10 on the kernel stack.
+ */
+SEC("raw_tp")
+__description("stack_arg: private stack in the caller and in the callee")
+__success __retval(890)
+__naked void stack_arg_priv_stack(void)
+{
+	asm volatile (
+		"r1 = 800;"
+		"*(u64 *)(r10 - 64) = r1;"
+		"r1 = r10;"
+		"r1 += -64;"
+		"*(u64 *)(r11 - 40) = r1;"
+		"*(u64 *)(r11 - 32) = 90;"
+		"*(u64 *)(r11 - 24) = 8;"
+		"*(u64 *)(r11 - 16) = 7;"
+		"*(u64 *)(r11 - 8) = 6;"
+		"r1 = 1;"
+		"r2 = 2;"
+		"r3 = 3;"
+		"r4 = 4;"
+		"r5 = 5;"
+		"call priv_stack_10args;"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
 #else

 SEC("socket")


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
