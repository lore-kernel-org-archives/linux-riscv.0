Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EFAC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyuJoLOiwkGzbUBsCw88Q7KGGBq9ep3NacT/AV8l/UQ=; b=OxUz/W0+mPyl13
	ispU6LBctRlIUC4k2Czpltid4+JTangNslWXbzSTjzbVyi33+3xxJWPguEO7abljGhtRZL5S7gILV
	oKZPxSxPWl0IMcJJtvBYta2wHjQgBVRGQNrevB4B5B03Arl270wcMjd66CLeZkvCmc1sQTGCPuKAX
	/AVOEHLsTL6pGUu33Ve5QXVc/zjJEuJBdHA2hJnKUqLpp2zIWx2L9SREbXaAahXPrQ1E+khLZ+K4p
	x/nGnM5Gi0E8y9DHF2jrEZBfppEH/PH6RXoojyreuoLviXobwgjL/qfb6PNcVQNNBFgAV9Nwlyka6
	G+cyhausCiMB6b/q5j1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5cEz-000Qo8-0D;
	Wed, 22 Nov 2023 01:41:21 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5cEv-000QnA-2w
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:41:19 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cb55001124so277026b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700617273; x=1701222073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wZkVnSThHSQ0nduxa23VteQPHRdj2Ex/elZXOf6IRxQ=;
        b=C/I24p4KCuWXUzKSTLRJYhPXrYR6iHV2Up75GRzQ/JON79RWQ8Jnx6N5L6trST/D4z
         4laq7XC6KQAJwVOUnhDLw5ONy/oOBhxKfySA5/J/Ct2zGqC5fsljxcudkspCnTw8QUQM
         oahpPNUX9Yqq1CCECdSSWw4xM7f57mYn7DkTq1vH0uSxQx4tLndNQXyFPsQwRJyNaqAJ
         YReIe8KPoJhfKqZp87lyFByVLvL1Pp3NNlsnUm7uW0OHS2vLQ4erlDvSgninbr+OcMqZ
         nGUmHX/Uq/x0e/1Gef8mw7rwtk3yE+snecVeOVOOku8hF8VXsRB9sNUc6LIDgDLTo/+p
         BQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700617273; x=1701222073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZkVnSThHSQ0nduxa23VteQPHRdj2Ex/elZXOf6IRxQ=;
        b=EQAszVeaAQiCr12BU2dXfOAg+bfbboi7PMoWwBoqy+HeZxP5mUEOQBkfuQmE2o/h4R
         icQ24BXQvGv9p78bb0daGL0G04U8eJjCQHsKdsyuszWOoN8TgWM4jDJqHb08od2Y19tz
         W+cj03LbqbP8FPmUQRhgRNIuyR+CkWwNRF4Xt2KRWhPnVoVbgr79w6SPczt67OSQRNpX
         tZv5MtzTbj8z+kAn5ULXQyyEkvLXZWcYbqZWqsvRbuZ+xvCvBO8eeZLbLEql890nWnL7
         EYw0qDf+4n3YVVEocqdBDDt2WA3CKxQ8xGQ+Br6bZY3X4OvHpQTT2xqDcM7Rh80U0RfG
         eGDw==
X-Gm-Message-State: AOJu0YxfqGRNjZMiTJQgUid9nV0Oc44zRkb4joLEEcPxkM6FD5m4Dl7I
	Wt2ABrgZjiOQ6LiR1RO0T/U=
X-Google-Smtp-Source: AGHT+IHAMbcH80Qv38sfnNHrOUL21YxFpmpRBj4ZbJPJ09PEy1rp7PPEr4++1O5WoMpvW2iMsf+Omg==
X-Received: by 2002:a05:6a21:a59b:b0:187:962d:746b with SMTP id gd27-20020a056a21a59b00b00187962d746bmr1839947pzc.9.1700617273489;
        Tue, 21 Nov 2023 17:41:13 -0800 (PST)
Received: from macbook-pro-49.dhcp.thefacebook.com ([2620:10d:c090:400::4:da69])
        by smtp.gmail.com with ESMTPSA id v4-20020aa78504000000b006cb884c0362sm5005865pfn.87.2023.11.21.17.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:41:12 -0800 (PST)
Date: Tue, 21 Nov 2023 17:41:07 -0800
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	davem@davemloft.net, dsahern@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	samitolvanen@google.com, keescook@chromium.org, nathan@kernel.org,
	ndesaulniers@google.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, jpoimboe@kernel.org, joao@overdrivepizza.com,
	mark.rutland@arm.com
Subject: Re: [PATCH 0/2] x86/bpf: Fix FineIBT vs eBPF
Message-ID: <20231122014107.p5zf4o6kjanypla4@macbook-pro-49.dhcp.thefacebook.com>
References: <20231120144642.591358648@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231120144642.591358648@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_174117_974708_32CA1D1C 
X-CRM114-Status: GOOD (  16.64  )
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

On Mon, Nov 20, 2023 at 03:46:42PM +0100, Peter Zijlstra wrote:
> Hi!
> 
> There's a problem with FineIBT and eBPF using __nocfi when
> CONFIG_BPF_JIT_ALWAYS_ON=n, in which case the __nocfi indirect call can target
> a normal function like __bpf_prog_run32().

The lack (or partially broken) cfi in the kernel built with
CONFIG_BPF_JIT_ALWAYS_ON=n is probably the last of people security concerns.
We introduced CONFIG_BPF_JIT_ALWAYS_ON=y to remove the interpreter,
since mere presence of _any_ interpreter in the kernel (bpf and any other)
is an attack vector. As it was demonstrated during spectre days an interpreter
sitting in executable part of vmlinux .text tremendously helps to craft
a speculative execution exploit.

Anyway, motivation aside, more comments in the patch 2...

> Specifically the various preambles look like:
> 
>    FineIBT				JIT
> 
>    __cfi_foo:
>       endbr64
>       subl	$hash, %r10d
>       jz	1f
>       ud2
>    1: nop
>    foo:					foo:
>       osp nop3				   endbr64
>       ...				   ...
> 
> So while bpf_dispatcher_*_func() does a __nocfi call to foo()+0 and this
> matches what the JIT generates, it does not work for regular FineIBT functions,
> since their +0 endbr got poisoned and things go *boom*.
> 
> Cure this by teaching the BPF JIT about all the various CFI forms. Notably this
> removes the last __nocfi call on x86.
> 
> If the BPF folks agree (and the robots don't find fail) I'd like to take this
> through the x86 tree, because I have a few more patches that turn the non-fatal
> 'osp nop3' poison into a 4 byte ud1 instruction which is rather fatal. As a
> result this problem will also surface on !IBT hardware.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
