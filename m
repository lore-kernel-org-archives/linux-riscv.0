Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB45C61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Nd1uR+9vuDiUo+NR1c/QLnbwCHVjyf3SDf2GhJHQLSA=; b=rEBVkGwOure6XTqgSwCxUXwaq+
	OgW3Rbh/YbjH/DDLTLBJ+N346OsLztFZ4qhspxNeBg8waqzsL/WOCYpfbSDcVB+V5N7z+UaMxSoCL
	+WL+R3wYCzlsbugjEXSlleYu20ETL2E2V2m+tU0hCmV17dzY/XzfGwGn8Vo78NZr9UV9rpbbripwN
	UYL9hPLlQ33LbucecZVvILwiZXIj9Uz74giku09iTg3PxRKxTJS3nHgqdYIXSxKWavos5/zCZR6bV
	xvj5p2Z2ya2dQGadOVvkj3lJ0j5Vz1UvI4usmQGyZXjV4ptckP1sPppvHml9QyxRy+2iDJbUP8zM7
	VSwAnAtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mf5-0000000F3UO-1PWD;
	Wed, 02 Sep 2026 15:14:03 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mf2-0000000F3U1-1Qxy
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 15:14:02 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-396750cfee6so1031576a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1788362039; x=1788966839; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lsfjpoWU5W1nFbaeVq9PkGCOWjt0Vb5QIPHyPQ5fb/8=;
        b=g2qI3P6zy0HULu/u8ZF1mwGWOWzmqY6L+aas3Z/Q6UXE7Hu3XiBS64gI8/4/eiDc+t
         9YY3LssHAoXQyUufVVZVoGAfq6KEp7b6ywJLLiVtKgvaCbq1URGqv4MRuIEdY/A7Mrb2
         4wLbJjYhMU/YiHt8kL+o3Ex6HKRundXKbbiJ42ECZdikMbTvWiptpcYWr4Yy6V4SRG7D
         OBfSzWF/ZBRFRpJyy83mOB+EXwMvcwl9FlhmSkmMxWqiuf42S8+EU47H5JYyK+nq6dU7
         d73++vS2wcQ2YJKS0ptTyohwuqRbetWD8MtIIzduym/qgHWC6knff0ijJXiIlD4Ctujs
         lAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362039; x=1788966839;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lsfjpoWU5W1nFbaeVq9PkGCOWjt0Vb5QIPHyPQ5fb/8=;
        b=TNhAH9JBc6MhttePZ8IExUpd3dckUH9Y3njo6xHq16hfKHd2nloTW2T89Qqj2jDtmd
         3bBV73BtDn0S6M5Phnrd3z3ZF5ssktv96rguu7CK/ra+91LdWgaN16PSis5X+fR6tYlD
         64zyOPCCAVoZVfaFTCZtLPxibEtAXIlbCe34TNjDvZtrqS3qi2JfpHAELTBjo05ics3L
         qbUWaqxo4Lv3ktm7ASK+c7w4hr32oDW86KqJDrFVNJ76oiVbsNL9C6xoqTeG7rXTZ9jT
         Sryh8P3s1C/Nl0Xtd6juUDganXFSu5QrMtocerkS3/pqRrn86yQOkD7+eb1vtyptIkt8
         Y14w==
X-Forwarded-Encrypted: i=1; AKwUvBweCcpXUytHJeH4oeky78evrxj+KB3gM925hcmSfPWRkzCkUJPKp0jt6R6tNlq6UILml7q8OhfYrEGUfQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kGQ1pWjU4GncHVIzyiBMjM5PS9ZHR0jxsUw7r9xCYEobHJUcyQ
	EkkQ9BPO+sBlYr3iHS7AsaJZBKhnJZ4MJQhP2j6Flf0Hu82OmrfSNEPCa1HRVLjcQIg=
X-Gm-Gg: AYBFou1u30j5H5vCxpk1gJ9Zh6WwmiBDytFIyrmLJonZQPbWyfwMYyG9AQeWKj2QfX/
	ujnEp2zxhvA+O2dnUN59rSOmd/09eiF++ZQ8W2neqqthsG8xE/Dj5SVM/XSMebkfvLSBuOn20Bn
	b3jyFIJCTAT/JiWfOfCeGAPTWxzGvSPEg7dejqc3lIs/F3gTuR/sdp4MHuy8pcxOZMVWEMJ8Cb6
	CSDugdahk536Vt+/jrVlpUzVP0hSlk6v7Vvpj5f1ek4L8zsAAx7lL5oxrXhJDHZFJ7yG5uHRsXh
	38WSI+OQZ7QtFeWttwKN3NLKHcwfPCnglYi+UdaEy24Y0t2nyRPUFdee97/dqY/bjOZkVbVEUvb
	/SUFzAeQP09y5QBhX92OjWGGZ+XQP1BfaAF9ZNdeo7R4VoB6lr6673+RJuF1dqDKGExgejipkps
	4Y+DJEfoQCpeWTL0WTs583jCLzgWv+PcEs/05Nt5p2z4DhA9M61KZ4ssGMXvWrBh6nSK9N/AEol
	zM7s1HQYf4w57OAL9Q=
X-Received: by 2002:a17:90b:4d0a:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39aee1476d7mr7195875a91.24.1788362038327;
        Wed, 02 Sep 2026 08:13:58 -0700 (PDT)
Received: from localhost ([2001:5a8:4687:d600:2598:89cc:ed31:1932])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1a82sm7956912eec.10.2026.09.02.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:13:57 -0700 (PDT)
Date: Wed, 02 Sep 2026 08:13:57 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Sep 2026 08:13:55 PDT (-0700)
Subject: Re: Re: [PATCH v3 2/3] riscv: hwprobe: export the availability of vector to user
In-Reply-To: <apGwuxgYZsZHiB8o@Tao-Chiu's-Mac>
CC: mark.hsj@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org, pjw@kernel.org,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, samuel.holland@sifive.com,
  bergner@tenstorrent.com, kito.cheng@sifive.com, dfustini@oss.tenstorrent.com, greentime.hu@sifive.com,
  andrew.jones@oss.qualcomm.com, guodong.xu@oss.qualcomm.com, aleksa.paunovic@htecgroup.com,
  pincheng.plct@isrc.iscas.ac.cn, luxu.kernel@bytedance.com, zihong.plct@isrc.iscas.ac.cn,
  wangjingwei@iscas.ac.cn, debug@rivosinc.com, cleger@rivosinc.com, linux-doc@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tchiu@tenstorrent.com
Message-ID: <mhng-28F59A83-AAFB-46F4-8FC6-EDE4DD39EB5F@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_081400_639899_2FD822B0 
X-CRM114-Status: GOOD (  53.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 28 Aug 2026 09:00:59 PDT (-0700), tchiu@tenstorrent.com wrote:
> Hi Mark,
>
> Sorry for responding late, we have been thinking through this internally
> with the team and other community members, and here is the reply
>
> On Thu, Aug 13, 2026 at 04:38:54PM -0700, Mark Harris wrote:
>> Andy Chiu wrote:
>> > Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
>> > vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
>> > is present in hardware, not what the calling process may actually use:
>> > when Vector is disabled for a process via
>> > prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
>> > reported as present. A resolver that trusts this and runs a vector
>> > instruction crashes with SIGILL.
>> >
>> > Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
>> > no value of its own. Within a single request, keys placed after it report
>> > extensions that are both present and enabled for the calling process,
>> > while keys before it keep reporting hardware presence. This masks out V
>> > and its V-dependent sub-extensions when V is disabled for the process, and
>> > lets userland obtain both views in one query:
>> >
>> >       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
>> >           present       modifier       enabled
>> >
>> > The enabled view depends on per-process state, so it cannot be served from
>> > the vDSO's process-independent cache; requests carrying the modifier are
>> > deferred to the syscall. Unknown keys are still reported as -1, so the
>> > feature is detectable and existing users are unaffected.
>>
>> Currently, each key has a value and the order of the keys does not
>> matter.  If the interface needed to be extended to support
>> process-specific values, or thread-specific values (the prctl() is
>> thread-specific), I would expect either new keys to retrieve those
>> process-specific or thread-specific values, or a new flag bit to
>
> Our concern with the new flag is that we have to call hwprobe twice on
> an old kernel that doesn't know about the flag. It takes a syscall when
> the VDSO finds an unknown flag at the first call to hwprobe. The kernel
> returns -EINVAL immediately, leaving all probe values empty. So the user
> space has to make the second call with the flag bit unset.

IMO it's going to be more complicated long-term to have this behavior 
where previous keys change the meaning of subsequent keys.

Instead, let's just fix the issue were an unknown key results in no 
values returned, and intsead just return value of the known keys we were 
given.  That way userspace just gets the best we can give it without too 
many round trips.

Then we can just add another bit that encodes the new behavior without 
any dependencies on other bits.

>> indicate that existing keys should be reinterpreted in a new manner.
>> Using a key as a modifier with no value and changing the keys to
>> be order-dependent seems like an unnecessarily confusing ugly hack
>> that we would have to live with for decades to come, just to slightly
>> simplify code needed in the short term to handle older kernels.
>>
>> Additionally, the approach of falling back to the syscall whenever
>> the modifier key is used could lead to each check for the vector
>> extension, in an ifunc resolver or almost anywhere else, having to
>> perform a syscall.  Callers wanting to use other extensions may
>> even use this modifier when checking for them, because given the
>> choice of knowing whether the extension is potentially available
>> or is available, the latter sounds like what they should be using
>> to be future-proof, even if there is not currently a way to disable
>> the extension.  That could lead to a syscall for every extension
>> check, defeating the vDSO cache.
>
> Likewise, I think the new flag bit can encourage the same user space
> behavior, because it is the same low cost change to get more
> information.
>
>>
>> On some non-RISC-V platforms glibc allows its own use of specific
>> CPU capabilities to be disabled through tunables (e.g.,
>> GLIBC_TUNABLES=glibc.cpu.hwcaps=-AVX2 ./my_x86_64_program), and as
>> of glibc 2.44 tunables can also be set in /etc/tunables.conf and
>> applied system-wide, even to specific programs.  This is more
>> convenient than a prctl and it would be nice if RISC-V extensions
>> could also be disabled for specific programs through tunables, for
>> any use where its availability is checked beforehand (in an ifunc
>> resolver or elsewhere), without the need to go to the kernel for
>> each check.
>>
>> Because ifunc resolvers may not have access to external symbols
>> beyond __riscv_hwprobe(), it is really attractive to be able to
>> obtain extension availability information using the same function.
>> But that doesn't mean that the kernel has to be involved.  The
>> function is in libc, so it could call the vDSO function and then
>> optionally modify the resulting values according to its own
>> process-specific information about enabled or disabled extensions.
>> This extra information would ideally come from the initial hwcaps
>
> Unfortunately, I think the riscv community has decided to stop using
> hwcap and move forward with hwprobe. Although I agree with you that it
> is a convenient way to add such per-process's extension enablement
> status.
>
>> (which reflect the vector prctl) and any tunables, so it is
>> process-wide, can support arbitrary extensions, and can be checked
>> without any kernel syscalls and without callers having to know or
>> care whether a particular extension can be disabled.  If the prctl
>> was used to re-enable vector in some thread that may not affect it,
>> but that seems like the desired behavior, at least for ifunc
>> resolvers, since they are assumed to produce the same result in any
>> thread and at any point during the process lifetime.
>>
>> If implemented using a new flag, the libc __riscv_hwprobe() function
>> could just call the existing vDSO function but with the new flag
>> masked out, and then if the flag is set, modify the resulting values.
>> That would probably be the simplest and easiest to understand API
>> and would not require kernel syscalls.
>
> I think the argument comes down to: do we expect the mismatch between
> an extension's availability and existence to grow? Using the same set of
> keys sounds like a good idea if we expect more extensions comes with
> per-process enablement status. On the other hand, if future extension
> supports come without the ability to turn it off, then this
> implementation may be an overshoot.

Hopefully we'll learn from this mistake and just remember to add both 
the "can the this be enabled for userspace" and "has userspace asked to 
disable this" for anything else that ends up having that sort of 
behavior.

> Cheers,
> Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
