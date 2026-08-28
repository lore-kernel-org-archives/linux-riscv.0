Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CCBC61DBD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 16:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMlmqaahHO+3aehmhNymLUKy3Dw6SVyhsD7pfk+rNSQ=; b=ZshWhro0RwAdOq
	D3ehOD5EuoJgL/4ruRHSbmYxUYXrtyX8yFa4vwnZZY7NbHB2EC/e+4tnv1BeGE4hmr6elxskizkSo
	4SgmoqWEBENMDM6E+Qm4HdaCoYtSfNNoI11toTDBT7+OZ7XqkQLp9mIRH3COTmyJUcZAfv02FkMni
	vJQ6fjaYfvjcX+QU5nazUQJqeO6EVGAtiieAu1p678kRzYhIS99cXP1Kih0B1b22Ad8jhKXQPqqEZ
	kWvSqyOV3yXFvk/5plgbu9S9VZ+kQHk0VNbbhi5cNKhhBYlrtxxxR1GFpeSdzWI2vB9jY5FHaJfGW
	B/zikc+EGETwC1IOC0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzz0t-00000006AES-41Mv;
	Fri, 28 Aug 2026 16:01:07 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzz0q-00000006ADt-3VSr
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 16:01:06 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4b21f09ea42so969382b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1787932863; x=1788537663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oiI3nnX2AJMzBD/AQu0wYIA1ehO1e9AZvUik61NexJk=;
        b=SIIZKrOmZTIxLLgFGUr+y2KfBJYnv3w5MS+78xifKwrvo6sZV1ngrDWDNzqRmNzBUy
         EUGPofI4FuuZGqZP4WSMlx/ajZ+TpD9tD2kZiLG01tGmkExk8o/idmxBjDsDCvdW1R8n
         b5GrQDqt2Y2olt0KPEaiek29Ct4P5ArAzzDrUB5swRHzFBNsderXKlqzJBpZGP8TIXDc
         D7vu53OP8+/C7KlFCIsD/BYYCY4wlTYq2l1cgGemRW141jSuqHX+5htjbSZdUlsgyHiC
         4z1zNVnYKHFiqAj3XWzp94TZfbfoeVGx7P+5Ol5Xqo2QI/PsQys+Iy/MXLvp0OuvV1Br
         r4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932863; x=1788537663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiI3nnX2AJMzBD/AQu0wYIA1ehO1e9AZvUik61NexJk=;
        b=mCpsr/KPvEQomCM4AnN6MPY/hlGs0blVgZVBKsiNV8Wy+HcPiEhwmuQ5vRwUH54I8S
         sbNGinIEL702639mjvo0LXD2AiRBQBiZST+Z3JaA73rLSJjFBzNYsGm7hWgcAxVr74G1
         HW7dErm1WXWq1jq+Me1Dum4j+4SDNRWEzySl9YoP/P06CTbbsKbzlRecxmT11TXGNIpC
         UO6bHNsF0zTXXVPd8J+SN+m5+wZdA9xz47vWBhbVjdEGBbx3zYLwEzPj5LvKaVtRlJpq
         LrSZIOAHvHnLGInnMvUX/W3pgcb+T+ztVYtqEhnGTmpd/6dEeKB22cBShGMt+88stQYJ
         dSKg==
X-Forwarded-Encrypted: i=1; AHgh+RpnRi5hMWb+wqmRc/eKTXF1ODb3/2urAhFvUdNI0QF6Geg2AXogNsF4JaJFTTIxNfFhDrs/vUYSMcQrog==@lists.infradead.org
X-Gm-Message-State: AFuF++lk6Lq5UfVheUnmstME0JdGcdHHhfBlrHV1/IgwzXqdCji87Wy9
	VN0gFMQZtL0bAyBn+jkd6D0AbZsdn9SoRJTrAmmIeZZm0nofBg3WVGU5duEWIo7PpU4=
X-Gm-Gg: AR+sD12SjS3JVDSLFnvXw3EXINTnrUcEr+w6VOaNHZAy9bnac7OQkShMlsJgC2zJO38
	CiGZQos1EzqWGtLosT4nnXBwy4q+di1TOzTp54JqB5FQIdmmvpXXJ0ZtLRl1RWQt34WqLciJhLg
	CJESfv9D/uuypcBKwhgDyDI2C1AFedMMO5N8xv0z3lWLAvvRAHtV4MxkqQLsXY7DkVccCz2dSe9
	5ldK4zv7EnqPlCpcN/R0ne0itlFDP5Nhr+9WtcewfhDD3pi9Od4GjZPj/q4dqGEjkH7/z9C1TS3
	AYLrC/O4Pf4JZAVI4fNPAk6yT/jwd94/5hZmSIykIF/Ogujy2qw99Q7bYUgjJ+MoxSkioi6i+97
	maoPQxY8KwN4ZZIMKvMkrEg/+D9QaF+JtpA39S6424lPVD9wekFqDpnyWZqLagYfROKpEOqq5rv
	kW59l/2P8mvzrB+pLQVu9B+XBu17KgrBJOLavOJ6ANea8vTw/GjjfXPaYk+NSOJM6/UaDmcWLLL
	Q==
X-Received: by 2002:a05:6808:1910:b0:495:f85b:38c0 with SMTP id 5614622812f47-4b398190d7amr8529387b6e.12.1787932862988;
        Fri, 28 Aug 2026 09:01:02 -0700 (PDT)
Received: from localhost ([47.209.119.30])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b3a1625641sm1595919b6e.4.2026.08.28.09.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:01:02 -0700 (PDT)
Date: Fri, 28 Aug 2026 11:00:59 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Mark Harris <mark.hsj@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>, bergner@tenstorrent.com,
	kito.cheng@sifive.com, dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Guodong Xu <guodong.xu@oss.qualcomm.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yao Zihong <zihong.plct@isrc.iscas.ac.cn>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Deepak Gupta <debug@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: Re: [PATCH v3 2/3] riscv: hwprobe: export the availability of
 vector to user
Message-ID: <apGwuxgYZsZHiB8o@Tao-Chiu's-Mac>
References: <20260725001614.2578617-3-tchiu@tenstorrent.com>
 <20260813233854.86799-1-mark.hsj@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260813233854.86799-1-mark.hsj@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_090105_077574_E89B8EF8 
X-CRM114-Status: GOOD (  50.27  )
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

Hi Mark,

Sorry for responding late, we have been thinking through this internally
with the team and other community members, and here is the reply

On Thu, Aug 13, 2026 at 04:38:54PM -0700, Mark Harris wrote:
> Andy Chiu wrote:
> > Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
> > vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
> > is present in hardware, not what the calling process may actually use:
> > when Vector is disabled for a process via
> > prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
> > reported as present. A resolver that trusts this and runs a vector
> > instruction crashes with SIGILL.
> > 
> > Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
> > no value of its own. Within a single request, keys placed after it report
> > extensions that are both present and enabled for the calling process,
> > while keys before it keep reporting hardware presence. This masks out V
> > and its V-dependent sub-extensions when V is disabled for the process, and
> > lets userland obtain both views in one query:
> > 
> >       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
> >           present       modifier       enabled
> > 
> > The enabled view depends on per-process state, so it cannot be served from
> > the vDSO's process-independent cache; requests carrying the modifier are
> > deferred to the syscall. Unknown keys are still reported as -1, so the
> > feature is detectable and existing users are unaffected.
> 
> Currently, each key has a value and the order of the keys does not
> matter.  If the interface needed to be extended to support
> process-specific values, or thread-specific values (the prctl() is
> thread-specific), I would expect either new keys to retrieve those
> process-specific or thread-specific values, or a new flag bit to

Our concern with the new flag is that we have to call hwprobe twice on
an old kernel that doesn't know about the flag. It takes a syscall when
the VDSO finds an unknown flag at the first call to hwprobe. The kernel
returns -EINVAL immediately, leaving all probe values empty. So the user
space has to make the second call with the flag bit unset.

> indicate that existing keys should be reinterpreted in a new manner.
> Using a key as a modifier with no value and changing the keys to
> be order-dependent seems like an unnecessarily confusing ugly hack
> that we would have to live with for decades to come, just to slightly
> simplify code needed in the short term to handle older kernels.
> 
> Additionally, the approach of falling back to the syscall whenever
> the modifier key is used could lead to each check for the vector
> extension, in an ifunc resolver or almost anywhere else, having to
> perform a syscall.  Callers wanting to use other extensions may
> even use this modifier when checking for them, because given the
> choice of knowing whether the extension is potentially available
> or is available, the latter sounds like what they should be using
> to be future-proof, even if there is not currently a way to disable
> the extension.  That could lead to a syscall for every extension
> check, defeating the vDSO cache.

Likewise, I think the new flag bit can encourage the same user space
behavior, because it is the same low cost change to get more
information.

> 
> On some non-RISC-V platforms glibc allows its own use of specific
> CPU capabilities to be disabled through tunables (e.g.,
> GLIBC_TUNABLES=glibc.cpu.hwcaps=-AVX2 ./my_x86_64_program), and as
> of glibc 2.44 tunables can also be set in /etc/tunables.conf and
> applied system-wide, even to specific programs.  This is more
> convenient than a prctl and it would be nice if RISC-V extensions
> could also be disabled for specific programs through tunables, for
> any use where its availability is checked beforehand (in an ifunc
> resolver or elsewhere), without the need to go to the kernel for
> each check.
> 
> Because ifunc resolvers may not have access to external symbols
> beyond __riscv_hwprobe(), it is really attractive to be able to
> obtain extension availability information using the same function.
> But that doesn't mean that the kernel has to be involved.  The
> function is in libc, so it could call the vDSO function and then
> optionally modify the resulting values according to its own
> process-specific information about enabled or disabled extensions.
> This extra information would ideally come from the initial hwcaps

Unfortunately, I think the riscv community has decided to stop using
hwcap and move forward with hwprobe. Although I agree with you that it
is a convenient way to add such per-process's extension enablement
status.

> (which reflect the vector prctl) and any tunables, so it is
> process-wide, can support arbitrary extensions, and can be checked
> without any kernel syscalls and without callers having to know or
> care whether a particular extension can be disabled.  If the prctl
> was used to re-enable vector in some thread that may not affect it,
> but that seems like the desired behavior, at least for ifunc
> resolvers, since they are assumed to produce the same result in any
> thread and at any point during the process lifetime.
> 
> If implemented using a new flag, the libc __riscv_hwprobe() function
> could just call the existing vDSO function but with the new flag
> masked out, and then if the flag is set, modify the resulting values.
> That would probably be the simplest and easiest to understand API
> and would not require kernel syscalls.

I think the argument comes down to: do we expect the mismatch between
an extension's availability and existence to grow? Using the same set of
keys sounds like a good idea if we expect more extensions comes with
per-process enablement status. On the other hand, if future extension
supports come without the ability to turn it off, then this
implementation may be an overshoot.

Cheers,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
