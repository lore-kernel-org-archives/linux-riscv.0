Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFE2C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 23:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFngwU0tZws1IC0BRMULaL2J+Na3oA7ebq8uzsaOSA8=; b=i3lH1K5uRngYYa
	v6iou82nwiShEkxOQs76WRTPDfddlKvPoR2S/tyqZ5FmmEmVwlT6HMHuPHXbYC6ZZ+Wvug1EqBMRo
	wBUIOddLHnPbKgDItVBcpF+Ulm0Gkp7CVtfyRSjJw0QKjq9ZkxRKbZ5i5FcLVovFPU3adIYOCjIfN
	xZ/4kvRc7f8+owvoUWcEy5HzO5qOhRMqGbEIbWLEnJQjHKgYkscfzFJ32FJ3snaOsHpuMLUN1JuxR
	3w1cYnwOT8jyFoHaDNV7KJ1IZAHhumxoTO+C3UV6cTjJmT3XEfMR0dndLuIg+2XeL8rnJ6bqrCV/v
	6feqsFGlhS5Szr4ix83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuf3X-00000001kWH-2We1;
	Thu, 13 Aug 2026 23:41:51 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuf3V-00000001kVt-4BHh
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 23:41:51 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3811f512167so448934a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Aug 2026 16:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786664508; x=1787269308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwC65MbtAmU0iZDgsw6jaeB5r1edUFdIvrYzSi6Yk6E=;
        b=HEbr8KMyrIhwrTw5x6AUouVWnjP9EQ9a5MvQDs4blZ/BImvlLmhBBbSACUnUPePqYK
         RjCPhaJgs4854MZJF3//5yaF5dLUgaBSkCnxcVQY1Ac2zpS1HqonTevpA7N0BJKRFfEV
         +A8cz6qL+jxt3yVQvEHzYtjtoBCIbvxKjUacGdKk6++ynudrAO44QnCe6mR8uMzVtBcw
         Gwb7JGCd0vA29usPlC0y/1NOwbsCZaSgd1jIisFpPO9tkwpN9lXj85MsyrYvs6YYSVC5
         LEGmdcwdOksjN0PGKRqExeYfSpyLS08IyvHWMyKknrgTPtbo9ZeDSbS8oaFH9+0zM1MQ
         mzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786664508; x=1787269308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwC65MbtAmU0iZDgsw6jaeB5r1edUFdIvrYzSi6Yk6E=;
        b=SXAilcRnUHd193Dfdbaa9l/4Rx5UFO1+W1iJMKWFTDrbjOv0kbOiIGiXTF/An1jVDj
         jLA8AHlgU9HXowqnBaao93mzb8oiKsz4h9l3H9cEUQpljmjrLazISyjEL4qGkiNqi8cN
         e4lFacwwk21aHPjhRwK9upHL+kodFIbHhcWUTpFNPWfi+izTRosYrIyC0xt/pK2OGGPD
         QGY799RZfU+kfLIHBhL8mNfLPwaWwVkP1gUU5jZb/9tjzIwJ3w10xx5CxEDS6yOu95dH
         ag6yeaaTElavEZASOcXOxEUlzo26/VrNQRdjXGevm/AgAaShe3IcXdL6ZsRCXH3uxK2s
         tgog==
X-Forwarded-Encrypted: i=1; AHgh+Rq8nNsecIXCHl51vStmKwsjD4Vg22LnSCfD10+W9poBGjcyPaoUwVvuf4j9ssMM/K2Xh9OWn6ELM2QmZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8w5liQck7MUbZpK7xe1+tCvB1JX5YcmuGUgvJNXQurjfXftn2
	RVeFlreMjzOWCwruTGYnaoJAUu+QCRScXfoS/tCdXoI8zozi60DaKQn4
X-Gm-Gg: AR+sD13f821vn3bIeRloPwnMakXaINwdW64SkApiNpA3Do3cv/fOhfHC0W3+C4Pajm9
	+ntTt5M5ZidL5ndFa0LeKAUovFGcgFOK9A8huCX1AJ8CpwMayRSyToUIpQpixuVtPWNbIjrrBpS
	ykUzqEvlhZPQfmhZeian/3SmmglS05yMIRtt0q5SuJBOJM64nY/BHU0Aw7fV+9FgB/Hi8o3UkQZ
	eyMIUihzkwcV37q9Dq7VNY1GH8Cug63uirzaw/q3/1EfuahVcrD/QDRk5oRTsH4a9snIy92WOii
	IQOPNGFf0PoS16VPwgyrLgOMFvb/mOvp2K69LXZQOxm22V21qdbZkxkhdbdrmVkugh3E5bHiU+8
	Uodb9D6GLofIOlCrgrW35CiTHRo532CtYXG/XxMwNCyD9KZaSGA8Tz07zHq2LNkEO7MU6fWzZqF
	l+GpMRorlYjGfVd5Lnop8JBRN+GrfJrRA0V9Uhm9O5b9brAZatLIzs3UOC+FljqwNJN0v4vh6Gq
	lAT3Q8=
X-Received: by 2002:a17:90b:2891:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3933b8e1ec2mr1667028a91.11.1786664508220;
        Thu, 13 Aug 2026 16:41:48 -0700 (PDT)
Received: from kira.gmail.com ([2601:646:9e01:94:1485:6f2e:d5d8:e3ac])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387af4adsm2357778c88.1.2026.08.13.16.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 16:41:47 -0700 (PDT)
From: Mark Harris <mark.hsj@gmail.com>
To: tchiu@tenstorrent.com
Cc: Mark Harris <mark.hsj@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	"Andrew Jones" <andrew.jones@oss.qualcomm.com>,
	"Guodong Xu" <guodong.xu@oss.qualcomm.com>,
	"Aleksa Paunovic" <aleksa.paunovic@htecgroup.com>,
	"Pincheng Wang" <pincheng.plct@isrc.iscas.ac.cn>,
	"Xu Lu" <luxu.kernel@bytedance.com>,
	"Yao Zihong" <zihong.plct@isrc.iscas.ac.cn>,
	"Jingwei Wang" <wangjingwei@iscas.ac.cn>,
	"Deepak Gupta" <debug@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: hwprobe: export the availability of vector to user
Date: Thu, 13 Aug 2026 16:38:54 -0700
Message-ID: <20260813233854.86799-1-mark.hsj@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725001614.2578617-3-tchiu@tenstorrent.com>
References: <20260725001614.2578617-3-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_164150_045364_966A2ED1 
X-CRM114-Status: GOOD (  30.55  )
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

Andy Chiu wrote:
> Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
> vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
> is present in hardware, not what the calling process may actually use:
> when Vector is disabled for a process via
> prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
> reported as present. A resolver that trusts this and runs a vector
> instruction crashes with SIGILL.
> 
> Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
> no value of its own. Within a single request, keys placed after it report
> extensions that are both present and enabled for the calling process,
> while keys before it keep reporting hardware presence. This masks out V
> and its V-dependent sub-extensions when V is disabled for the process, and
> lets userland obtain both views in one query:
> 
>       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
>           present       modifier       enabled
> 
> The enabled view depends on per-process state, so it cannot be served from
> the vDSO's process-independent cache; requests carrying the modifier are
> deferred to the syscall. Unknown keys are still reported as -1, so the
> feature is detectable and existing users are unaffected.

Currently, each key has a value and the order of the keys does not
matter.  If the interface needed to be extended to support
process-specific values, or thread-specific values (the prctl() is
thread-specific), I would expect either new keys to retrieve those
process-specific or thread-specific values, or a new flag bit to
indicate that existing keys should be reinterpreted in a new manner.
Using a key as a modifier with no value and changing the keys to
be order-dependent seems like an unnecessarily confusing ugly hack
that we would have to live with for decades to come, just to slightly
simplify code needed in the short term to handle older kernels.

Additionally, the approach of falling back to the syscall whenever
the modifier key is used could lead to each check for the vector
extension, in an ifunc resolver or almost anywhere else, having to
perform a syscall.  Callers wanting to use other extensions may
even use this modifier when checking for them, because given the
choice of knowing whether the extension is potentially available
or is available, the latter sounds like what they should be using
to be future-proof, even if there is not currently a way to disable
the extension.  That could lead to a syscall for every extension
check, defeating the vDSO cache.

On some non-RISC-V platforms glibc allows its own use of specific
CPU capabilities to be disabled through tunables (e.g.,
GLIBC_TUNABLES=glibc.cpu.hwcaps=-AVX2 ./my_x86_64_program), and as
of glibc 2.44 tunables can also be set in /etc/tunables.conf and
applied system-wide, even to specific programs.  This is more
convenient than a prctl and it would be nice if RISC-V extensions
could also be disabled for specific programs through tunables, for
any use where its availability is checked beforehand (in an ifunc
resolver or elsewhere), without the need to go to the kernel for
each check.

Because ifunc resolvers may not have access to external symbols
beyond __riscv_hwprobe(), it is really attractive to be able to
obtain extension availability information using the same function.
But that doesn't mean that the kernel has to be involved.  The
function is in libc, so it could call the vDSO function and then
optionally modify the resulting values according to its own
process-specific information about enabled or disabled extensions.
This extra information would ideally come from the initial hwcaps
(which reflect the vector prctl) and any tunables, so it is
process-wide, can support arbitrary extensions, and can be checked
without any kernel syscalls and without callers having to know or
care whether a particular extension can be disabled.  If the prctl
was used to re-enable vector in some thread that may not affect it,
but that seems like the desired behavior, at least for ifunc
resolvers, since they are assumed to produce the same result in any
thread and at any point during the process lifetime.

If implemented using a new flag, the libc __riscv_hwprobe() function
could just call the existing vDSO function but with the new flag
masked out, and then if the flag is set, modify the resulting values.
That would probably be the simplest and easiest to understand API
and would not require kernel syscalls.

 - Mark

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
