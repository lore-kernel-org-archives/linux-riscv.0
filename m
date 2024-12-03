Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092C3E6C608
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 05:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh6T2XTwyxf8Jhf/4zXOs2d4D/Vm8liqLmVMv4hmOGo=; b=rWfZNsBHFIb7/N
	pqIRVc36MeLCzDFEU6vTFHt8KMCDgOmuGZURjd/mN684Th8szuya+de0ffrLAB7OGFSujKvzZcxSR
	UtYx2JNWyIFZGBH/rXUaYnmPcs9VpynPy+FyLkfo0IqOfLbzCwToDn0Ar83SRrlQtFynkBjxiF+wN
	MCV4xNoAmvw9maVSsjI8lHJ3Yjp1iJZ2ZuSlYhBGoapZKhbphYUBH5kuUXypq1gBPITh5IZ6DAQEx
	hOpp8IvyxhHdPXMjuLfkWI5NqzuTbDyvh5WAZnyRpZpQxALQKO5mLu8Jb5FufryK4GRSo9+eXuRNl
	nnF/vyXVgbwCQ9u6SMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tILaz-00000008Ku6-4AR7;
	Tue, 03 Dec 2024 05:37:13 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tILaw-00000008KtN-0tu3
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 05:37:12 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee3737d2b5so3241100a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 21:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733204229; x=1733809029; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vSXjh3hiBldNNK5MEJhxrZDpPGH+8giPIA6kOty2v+Y=;
        b=TKV2Rchg5XdvelS/4HSzsYW0JLknrq84uG0p8ytcDbjIDUMUggZ3gpTlYgLUSuDmqE
         kB3Hai3eUO00bNAdhEujyZ93RZfM+LB/uQ6iEodRCjaWPsAdbIS9DL5FR1XiodZLqtl+
         41k5mMETtXmxaN/5I2o0cCfOARFL9cin3ZLLLVNeoB2436nupel3xyJH3aVw69oBiENw
         Y4OhRgWCIVhPPzWv8OKz2bk14AlY9qyAaBkOUOYdWc8zmQ865UQdZg3b+z9reRXrtXMV
         IgKyPQ+JoOxB+tk/UtZJFwsxHYyDWchtNxUXuK7O17wefRRjvCN9ueWNoM4qkSZnbFs7
         q5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733204229; x=1733809029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSXjh3hiBldNNK5MEJhxrZDpPGH+8giPIA6kOty2v+Y=;
        b=vGgDMCHp6NCf0NcRXNijFZl9qC1vF9QfwQFylWabdtamp03mRXMA9HOR8SlxMo4lXH
         vX6YXBXZBE5NkGQMvsAyzzhhOwYqQffzkIlRDQgkHvkM4KFxkNe9p6yhIG4k/yvWhEap
         U3eEhndQaOXJr8sZEslhNtswH6oNtBiaoT5GfpTecYkhTLmCfo5EiRnHszQWvuaqruw1
         JSQjR4P4376pTQXkc6LNMjbKxtqg8tDG4HRvBZntak/R0CVBhONHatHC5bnqJ0A/z2YU
         YMRwEfS0qD/1Nr3Sc9viBex4qyU2CDcbLlomD1JjF5sIzP5ZYRzq+TDZV9NymTCqDdvG
         TfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtRQSzFESHfcuYtyE8muZ/4//7nyifECsFOOOISdk2xxXOJvzLlR24+mKq1nYYwg8VRlNtG8fvqPzyhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsbcKhk4A4IBmQNyOhptC/wuwXBP7JkFmhU6+bqyzuC1xCfbx7
	HT2VxW7VqP69iCgQPRFkZsMp5eBGOokrLK+OkLpHtEFFnGkxBMB4+BWJ7b/4tRQ=
X-Gm-Gg: ASbGnctu4WHEPHLAesiRbjmwb/BulRIduJlqSBqk7jxNstvcuAdPT2P5PF0GQTrIf6V
	G5XHRSZ+Axm07Um00taKKeMTDUJ3Tl3yeN/hEZc02MwzaJe+SET000N+o6K7q+NJYY77O3bN449
	FYRDiSio6Ii+xViGH9wZDskPT1OTdqEtAzPnxIJa4RvJS0EXafGvZA56KeYKL4aFNTBP5FO2Y8m
	wIKSwxrloxpiADh2cxrlxJcqnb/QAE0st2wKtSf4ELqqQ==
X-Google-Smtp-Source: AGHT+IGS9ziRjAIA8V4lsdHNGlH70wznvS7wfFk2e2BDUXAOOqVLzGGRJVECNcRpYwLUrZIk5c8bog==
X-Received: by 2002:a17:90b:4a4e:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-2ef011fb97bmr2306174a91.12.1733204228773;
        Mon, 02 Dec 2024 21:37:08 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4f56:309d:bf87:2589])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eecd83914csm2806157a91.0.2024.12.02.21.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:37:07 -0800 (PST)
Date: Mon, 2 Dec 2024 21:37:04 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
	Andrea Bolognani <abologna@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
	Quan Zhou <zhouquan@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv/ptrace: add new regset to get original a0 register
Message-ID: <Z06ZAP-_4J4-6aK_@ghost>
References: <20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_213710_533107_E4EB3E2A 
X-CRM114-Status: GOOD (  50.48  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 01, 2024 at 05:47:13AM +0800, Celeste Liu wrote:
> The orig_a0 is missing in struct user_regs_struct of riscv, and there is
> no way to add it without breaking UAPI. (See Link tag below)

We have had a patch sitting on the lists for a very long time to do this
which I guess didn't get enough attention. I am glad that we have more
eyes on this problem now so it can actually be fixed :) [1].

However that patch has the problem that it modifies the
user_regs_struct. It is super unfortunate that riscv didn't have the
foresight of loongarch to add padding.

There is a nice test case in there that would be great to get added
alongside this commit with the appropriate changes. [2]

[1] https://lore.kernel.org/linux-riscv/cover.1719408040.git.zhouquan@iscas=
.ac.cn/
[2] https://lore.kernel.org/linux-riscv/1e9cbab1b0badc05592fce4671741893007=
6a6ae.1719408040.git.zhouquan@iscas.ac.cn/


Since I am familiar with the code I have gone ahead and made the
appropriate changes. Here is the diff:

From f35184467cc7b319c2a5c5c034d18119c46f54c2 Mon Sep 17 00:00:00 2001
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 2 Dec 2024 21:19:13 -0800
Subject: [PATCH] riscv: selftests: Add a ptrace test to verify syscall
 parameter modification

This test checks that orig_a0 allows a syscall argument to be modified,
and that changing a0 does not change the syscall argument.

Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/ptrace.c                   |   2 +-
 tools/testing/selftests/riscv/abi/.gitignore |   1 +
 tools/testing/selftests/riscv/abi/Makefile   |   5 +-
 tools/testing/selftests/riscv/abi/ptrace.c   | 133 +++++++++++++++++++
 4 files changed, 139 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/abi/ptrace.c

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index faa46de90003..025c22894d32 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -197,7 +197,7 @@ static int riscv_orig_a0_set(struct task_struct *target,
 			     unsigned int pos, unsigned int count,
 			     const void *kbuf, const void __user *ubuf)
 {
-	int orig_a0 =3D task_pt_regs(target)->orig_a0;
+	unsigned long orig_a0 =3D task_pt_regs(target)->orig_a0;
 	int ret;

 	ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &orig_a0, 0, -1);
diff --git a/tools/testing/selftests/riscv/abi/.gitignore b/tools/testing/s=
elftests/riscv/abi/.gitignore
index b38358f91c4d..378c605919a3 100644
--- a/tools/testing/selftests/riscv/abi/.gitignore
+++ b/tools/testing/selftests/riscv/abi/.gitignore
@@ -1 +1,2 @@
 pointer_masking
+ptrace
diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/sel=
ftests/riscv/abi/Makefile
index ed82ff9c664e..3f74d059dfdc 100644
--- a/tools/testing/selftests/riscv/abi/Makefile
+++ b/tools/testing/selftests/riscv/abi/Makefile
@@ -2,9 +2,12 @@

 CFLAGS +=3D -I$(top_srcdir)/tools/include

-TEST_GEN_PROGS :=3D pointer_masking
+TEST_GEN_PROGS :=3D pointer_masking ptrace

 include ../../lib.mk

 $(OUTPUT)/pointer_masking: pointer_masking.c
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/ptrace: ptrace.c
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/abi/ptrace.c b/tools/testing/sel=
ftests/riscv/abi/ptrace.c
new file mode 100644
index 000000000000..1c3ce40d6a34
--- /dev/null
+++ b/tools/testing/selftests/riscv/abi/ptrace.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <errno.h>
+#include <sys/types.h>
+#include <sys/ptrace.h>
+#include <sys/stat.h>
+#include <sys/user.h>
+#include <sys/wait.h>
+#include <sys/uio.h>
+#include <linux/elf.h>
+#include <linux/unistd.h>
+#include <asm/ptrace.h>
+
+#include "../../kselftest_harness.h"
+
+#define ORIG_A0_MODIFY      0x01
+#define A0_MODIFY           0x02
+#define A0_OLD              0x03
+#define A0_NEW              0x04
+
+#define perr_and_exit(fmt, ...)						\
+	({								\
+		char buf[256];						\
+		snprintf(buf, sizeof(buf), "%s:%d:" fmt ": %m\n",	\
+			__func__, __LINE__, ##__VA_ARGS__);		\
+		perror(buf);						\
+		exit(-1);						\
+	})
+
+static inline void resume_and_wait_tracee(pid_t pid, int flag)
+{
+	int status;
+
+	if (ptrace(flag, pid, 0, 0))
+		perr_and_exit("failed to resume the tracee %d\n", pid);
+
+	if (waitpid(pid, &status, 0) !=3D pid)
+		perr_and_exit("failed to wait for the tracee %d\n", pid);
+}
+
+static void ptrace_test(int opt, int *result)
+{
+	int status;
+	pid_t pid;
+	struct user_regs_struct regs;
+	struct iovec iov =3D {
+		.iov_base =3D &regs,
+		.iov_len =3D sizeof(regs),
+	};
+
+	unsigned long orig_a0;
+	struct iovec a0_iov =3D {
+		.iov_base =3D &orig_a0,
+		.iov_len =3D sizeof(orig_a0),
+	};
+
+	pid =3D fork();
+	if (pid =3D=3D 0) {
+		/* Mark oneself being traced */
+		long val =3D ptrace(PTRACE_TRACEME, 0, 0, 0);
+		if (val)
+			perr_and_exit("failed to request for tracer to trace me: %ld\n", val);
+
+		kill(getpid(), SIGSTOP);
+
+		/* Perform exit syscall that will be intercepted */
+		exit(A0_OLD);
+	}
+
+	if (pid < 0)
+		exit(1);
+
+	if (waitpid(pid, &status, 0) !=3D pid)
+		perr_and_exit("failed to wait for the tracee %d\n", pid);
+
+	/* Stop at the entry point of the syscall */
+	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
+
+	/* Check tracee regs before the syscall */
+	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
+		perr_and_exit("failed to get tracee registers\n");
+	if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
+		perr_and_exit("failed to get tracee registers\n");
+	if (orig_a0 !=3D A0_OLD)
+		perr_and_exit("unexpected orig_a0: 0x%lx\n", orig_a0);
+
+	/* Modify a0/orig_a0 for the syscall */
+	switch (opt) {
+	case A0_MODIFY:
+		regs.a0 =3D A0_NEW;
+		break;
+	case ORIG_A0_MODIFY:
+		orig_a0 =3D A0_NEW;
+		break;
+	}
+
+	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
+		perr_and_exit("failed to set tracee registers\n");
+
+	/* Resume the tracee */
+	ptrace(PTRACE_CONT, pid, 0, 0);
+	if (waitpid(pid, &status, 0) !=3D pid)
+		perr_and_exit("failed to wait for the tracee\n");
+
+	*result =3D WEXITSTATUS(status);
+}
+
+TEST(ptrace_modify_a0)
+{
+	int result;
+
+	ptrace_test(A0_MODIFY, &result);
+
+	/* The modification of a0 cannot affect the first argument of the syscall=
 */
+	EXPECT_EQ(A0_OLD, result);
+}
+
+TEST(ptrace_modify_orig_a0)
+{
+	int result;
+
+	ptrace_test(ORIG_A0_MODIFY, &result);
+
+	/* Only modify orig_a0 to change the first argument of the syscall */
+	EXPECT_EQ(A0_NEW, result);
+}
+
+TEST_HARNESS_MAIN
--
2.34.1


> =

> Like NT_ARM_SYSTEM_CALL do, we add a new regset name NT_RISCV_ORIG_A0 to
> access original a0 register from userspace via ptrace API.
> =

> Link: https://lore.kernel.org/all/59505464-c84a-403d-972f-d4b2055eeaac@gm=
ail.com/
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> ---
>  arch/riscv/kernel/ptrace.c | 33 +++++++++++++++++++++++++++++++++
>  include/uapi/linux/elf.h   |  1 +
>  2 files changed, 34 insertions(+)
> =

> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index ea67e9fb7a583683b922fe2c017ea61f3bc848db..faa46de9000376eb445a32d43=
a40210d7b846844 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -31,6 +31,7 @@ enum riscv_regset {
>  #ifdef CONFIG_RISCV_ISA_SUPM
>  	REGSET_TAGGED_ADDR_CTRL,
>  #endif
> +	REGSET_ORIG_A0,
>  };
>  =

>  static int riscv_gpr_get(struct task_struct *target,
> @@ -184,6 +185,30 @@ static int tagged_addr_ctrl_set(struct task_struct *=
target,
>  }
>  #endif
>  =

> +static int riscv_orig_a0_get(struct task_struct *target,
> +			     const struct user_regset *regset,
> +			     struct membuf to)
> +{
> +	return membuf_store(&to, task_pt_regs(target)->orig_a0);
> +}
> +
> +static int riscv_orig_a0_set(struct task_struct *target,
> +			     const struct user_regset *regset,
> +			     unsigned int pos, unsigned int count,
> +			     const void *kbuf, const void __user *ubuf)
> +{
> +	int orig_a0 =3D task_pt_regs(target)->orig_a0;

The testcase above highlights that this should be of type "unsigned
long" instead of int! Otherwise 64-bit systems will only be able to set
the first 32 bits (as Bj=F6rn pointed out in the other thread) :)

This issue was found because the test case tries to set all 64 bits and
succeeds, but the extra bits corrupt the stack. Maybe the code here
should enforce that the count is equal to the size of an unsigned long?
Fortunately the extra bits ended up in the stack so it was determined to
be corrupted, but I suppose that will not necessarily always be the case
depending on kernel compiler optimizations and user_regset_copyin()
could end up overwritting other data in this function undetected.

- Charlie

> +	int ret;
> +
> +	ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &orig_a0, 0, -1);
> +	if (ret)
> +		return ret;
> +
> +	task_pt_regs(target)->orig_a0 =3D orig_a0;
> +	return ret;
> +}
> +
> +
>  static const struct user_regset riscv_user_regset[] =3D {
>  	[REGSET_X] =3D {
>  		.core_note_type =3D NT_PRSTATUS,
> @@ -224,6 +249,14 @@ static const struct user_regset riscv_user_regset[] =
=3D {
>  		.set =3D tagged_addr_ctrl_set,
>  	},
>  #endif
> +	[REGSET_ORIG_A0] =3D {
> +		.core_note_type =3D NT_RISCV_ORIG_A0,
> +		.n =3D 1,
> +		.size =3D sizeof(elf_greg_t),
> +		.align =3D sizeof(elf_greg_t),
> +		.regset_get =3D riscv_orig_a0_get,
> +		.set =3D riscv_orig_a0_set,
> +	},
>  };
>  =

>  static const struct user_regset_view riscv_user_native_view =3D {
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index b44069d29cecc0f9de90ee66bfffd2137f4275a8..390060229601631da2fb27030=
d9fa2142e676c14 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -452,6 +452,7 @@ typedef struct elf64_shdr {
>  #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
>  #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
>  #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control=
 (prctl()) */
> +#define NT_RISCV_ORIG_A0	  0x903	/* RISC-V original a0 register */
>  #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>  #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers=
 */
>  #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension regi=
sters */
> =

> ---
> base-commit: 0e287d31b62bb53ad81d5e59778384a40f8b6f56
> change-id: 20241201-riscv-new-regset-d529b952ad0d
> =

> Best regards,
> -- =

> Celeste Liu <uwu@coelacanthus.name>
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
