Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3A8606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 03:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A1O4mFGS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=aqHsCYbO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	In-Reply-To:Mime-Version:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=hE+As6ozKGQmrcFIDqJFU1jUSTHGNeOxZP2hyzQWDD4=; b=A1O4mFGSikBiLl3R7a1TUS8xyU
	kEOoSwsl6KmAg27XY0LE4gUwePxyo35+XbHaloe4Ma130PFmBcx0OsnfpoM0yebtT85BkhIR+ZyO+
	1SQSn6U7N8qQG3OrKF8xJSgzoQHbywgSU8lDIrD3c1MKqvsQP2eI8Yj4pwOJduxsYTDTbZPJBwfFD
	Ulmg1lDlJWH8RTcZmOJwo5Rg9b7wbpxNWNFfgV5ElKCOIp1PpPn3opmdghzcIBBqTurUKsJogPHx7
	xsjUOogJYHHLjTYNrlU7mN+YKEH3y0S+0z6kJC8rR4MARkW2HHL+PuEfscquN2AXt5jYUvX3eXpDi
	g/GZtZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGTe-00000008EhL-1usK;
	Thu, 29 Oct 2026 03:06:54 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGTb-00000008Egy-2Rz5
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 03:06:53 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5be4d648aacso1540969e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 20:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793243205; cv=none;
        d=google.com; s=arc-20260327;
        b=RwC9t2klHEJf5D2Z3CDmKUIWN0Wq+ANn3/zlOljOhSe6W6gQsJOOVHfCkmq0e82Ujw
         rUk6RtvBNsVY5sGM0vsEeaoywDelcWcCfKvbXMIshS76io4AGtuxC2MfLfwm1g6C+fU/
         XLIvLB0VJPWMzP7FXktZaFSGon2V5F91luA+CJRerox9DSvhekblg6l1JmIPlv8d8kPp
         TOi/ZElDUzpmFFLInuOt2F2/qACYSXdMRu+HxAqYdUE+LE5VIoogMMBIMaDwUR+6ntPK
         H5uceT8wibYT8313UbB7mUEj4+BFkTnXgNgJvbNudGykqnRHDtx49YWCXD3WD9wLGb0b
         OJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:from
         :references:user-agent:dkim-signature;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        fh=N0NMjUowh/FwptXSsVPA2UeC27kq4R9Ue5YH4PSIJOI=;
        b=PV8/r99t16/Z7mHJWAZLsWrVFvp2Rs21gqlPNHlCkERyX2vSX0HL0EI043AHuC/JbC
         stahyA2heHWcbKUWkY6oEbkf6JUxvT+HdemQe2LZHA7M9eFmtulq2ycQpqbYqo+w6C24
         9OIKTJ+m5f0ox4dn0+VkCJ34AcPP3+XI0ZAn3v5olRcrGZUR8naZvDSdGfZGhFBeEkhU
         FhgktYLb3R37VXWRybFmDQ71xWUQ5D51z6fWgpQYy8U9Tb2xup5x9wzEBnYt+8tn5S1Z
         fqQ6H0s2KFnmxyTJhzK2v+QEJ0+0qnHtWaFGbFGbvm/FC/0n9p051bZVBPE6qPNaMfI9
         HZlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793243205; x=1793848005; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :from:references:user-agent:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        b=aqHsCYbO38j41aJhz3vfeVzW/2rmKOJjToPcVgBtBG7yqkrdq/F+Yna3jDA/vSOUwM
         oHN+UEReotatwcR8fBkX4jPFV5ZlmaVzJuZ2On+jlNIJbks/YnJouQwQeNyqeTsjiSX5
         CGV3f/ljAeDixgzFmI7qXsoCXtrKXkWqQzLZ1QSNUpTf2cFOsglU210XVAkV1xPOmYJs
         PjPftzafqM/iJZ7KkPi5cPoulqantrVI+OWQYiKgzTb6FmhZfbde81uP627d3M7KqFFR
         NbK88OxMOCQEHg1E2c5Y+OVttQzikViEojwbEDcTrK967dCh1TMAtARBkcrOR6jaCYmh
         XW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243205; x=1793848005;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :from:references:user-agent:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=21fFFSCtjvZ+BnQkCcGT5s2MmdQCNwbulDZga2Yp1YU=;
        b=ygv2ytSyFxs3dEL3Oshh7+uBEL/ZBfxbHOyIkVUXOHk8uMMb0+KzIv69Z8YFhD3cF5
         /Br66P8p7Plm5lNODQ4BRMDjY4BNdCCvHRIdh0l2JkSxKY/BjbCUlTivpzcaEY1yHxT0
         MEDNYdgqgKKHvIxwlhh++CiGBRR2aCquR9vQVW6VVILbcOrOD+mrI4mv13UU20dHh8t8
         Oqx4P4jnvxV/0hxlTkU5q9FYGaRfOXt6KTXq4W5nJ1D4gj4QnvF1nlpdzVnGzn1wwrJG
         U3SsGVTNGmFtILfIPl8QYmwHkQ5roo4g8y5Kr0n2cpVucOqnzlnUAcOuH/deQPR1kd3o
         4PhA==
X-Forwarded-Encrypted: i=1; AKwUvBwI2ekWdrFZwu+F4Lx8sjSGP6z/O3ps/BZeYcjj9FVBMo8oWhKsHHdaUCLeokwERTWt9eUbNtb8XlcZxw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIO5x4C77u7w2VqKi9Q07r1Dxqn0JYkGIOH0oXns2+eoUs79+WS
	CHton+bf4og2LZ9gBXI4FZ2LlcTf59yl2O5bb4p7ncjbgpIOIOJNxuve8QC0qcVNfnVu9u3PQ9t
	bPW0JuxVRmroCR3c5zxHu/kG3azqkhMB8HTa7cZ0pgw==
X-Gm-Gg: AYBFou0VWJfer057nNX5PQLWchjRC5SXf0uPjZ7O3jNCMKFVdo3c2a8GYCOtMDMb2Kd
	MBaZJ/lCxC6E8dASsvnUjzz6v1CSeGAtzd67fQJhuwhgL/sV3mf3sIY1iARLHaZoLyA39RX000j
	cISpcylO7PvmXbmKoBOnrPKItsI2q/7ymxBzlJlFRSG4/qM5ydCsd88fqKuWRX7nTTFRY4oeazm
	kDhHbMsrLmcIikBY2d9LyLJbZIvnYorrHMQYi3jBqFSht9G4JT8Jl5fyMwGECfHFVcVIEiRw9Mm
	ueEyYtAN7kLqLA9Z/iwaa7kZn61JXHZ1thuPtoqGLalXkxKUjzvNslniM6sD/FXmATYFvIjvakw
	xfmiVFIRFq5GkB2NIT3mMMb0zzz6nEIU8oKJrIQ==
X-Received: by 2002:a05:6512:1250:b0:5b8:997b:c606 with SMTP id
 2adb3069b0e04-5bfcad9e1a6mr1490725e87.41.1793243205235; Wed, 28 Oct 2026
 20:06:45 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:06:44 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:06:44 -0500
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:06:44 -0500
X-Gm-Features: AclHuK_OONCiZpFhomM73vca1DSs-MUlsV-8C6gmVeQhDkNqE4BPqIm0xCP39ic
Message-ID: <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Anup Patel <anup.patel@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atish.patra@linux.dev>, 
	Yuanzhu <yuanzhu@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_200651_686962_B90269B0 
X-CRM114-Status: GOOD (  13.93  )
X-Spam-Score: 0.2 (/)
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
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anup, Paul, Himanshu,

On 10/29/26 12:55 AM, Anup Patel wrote:

> [...]
>
> Changes in v11
> ==============
>
> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65cee).
> Also, tested PMU driver with both PMU irqs and PMU SSE events.
>

Thanks for rebasing and testing the series. I was a little surprised
to see v11 posted, as I am still working through Himanshu's v10 review
and validating the fixes on hardware. It would have been helpful to
coordinate before reposting so that those changes could be included.

I guess this follows Paul's request to rebase onto riscv/for-next.
However, there is one change beyond the rebase that I would like to
clarify: why does patch 4 remove the scoped_guard(preempt) sections
from the CPU hotplug paths? These were present in v10 RESEND, and
the local helpers still retain their preemption-disabled assertions.
Is there a reason this protection is no longer needed?

The changes discussed on the v10 threads are still outstanding in
this posting:

- Preserve TASK_TI_A0/A1/A2 across nested exceptions.
- Replace the temporary GUP-based perf user-stack copy with nofault
   uaccess, following the x86 approach.
- Address the per-CPU initialization/preemption concern.
- Split the MAINTAINERS updates into a separate patch.

Additional fixes from Sashiko review, the kernel test robot report,
and our follow-up debugging are also being consolidated:

- NMI-safe entry and lockdep irqflags tracking.
- The unused-function warning reported by the kernel test robot.
- RV32 vmalloc synchronization before nofault fixup.
- Faulting-PC validation in the kprobe single-step fault path.
- Per-counter STOP handling in SSE error paths.
- Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.

In particular, Himanshu identified the missing preservation of
TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
I validated the fix with hardware A/B testing: removing it reproduced
corruption, while the fixed kernel completed the same test sequence.
This also gives us a solid basis for replacing the temporary GUP
workaround with nofault uaccess.

Paul, please hold off on taking this version into for-next until
these fixes are included. The rebase and PMU testing are useful, but
there are still outstanding correctness issues.

I will consolidate the changes and post v12 against riscv/for-next,
with an updated changelog and validation results. Let's coordinate
the next posting to keep everything together.

Thanks,
Zhanpeng

[1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
