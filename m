Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6661C36005
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 20:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jS0/gy3V13aGMJe/SgmJFlcyHXo7yEew2xN1Kc9lXy8=; b=22mf80vD17THlu
	4crM2okZaez3KvQc0w6mISfvoskSqU5SfCTfkLr61/zIKXCmhfCcoj4/YFQRPVaZD8JqyRP9GBCLp
	R/qSZ7Md2AgStJKwF5mGEHDQ6YA6zbTUcHdWBESplP9aiyKHhATfp8vYEe10H+xnFFTUedhGNK4AR
	b614vTxN+QJkOFMHLAqjLH8SoCJ7o5Jlzlp4mHffBkYHH4Sxqi4nCJD8C0fIM6T5eIBkD/iVdpMbk
	9oXnZFbiY91azmff3S/dP4l9T8odUgHKPACGP22z6hujj3ufH0kYYpj5RphBFSOf/SnXkCsLGBdRw
	1E/CWeoOKyYz2zyEtsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBBK-000000070Lt-0uDf;
	Tue, 25 Mar 2025 20:47:30 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBBI-000000070LY-09SG
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 20:47:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54af20849bbso2159574e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1742935646; x=1743540446; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=bcQbr37qluL5J+1qe1BYW3pwgGL0wlvH9f6JzQZpnpyxomkwRgjFp1qwHbbxg1PNOw
         pm+KaKYEK+BaMBwaHbUsKi9zHaQeJi/b24R2pAaTalVLcwT955YPPKwYFmZJh6KYPV+t
         z0K3ap2QV1ar831lOpvnBqy+9JPH4a8AI850Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742935646; x=1743540446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=Dfkoq2KGa1bTVo/drQXqUkFbrq+gvFdgFftFiyejkeq/UKSd96m+Gz2yPF5CipfGMR
         gNfBqkO8Jk49jS8B5Md+Ygj3JToMF8MbbbPi64pO09FN3uFEkUYgz/iybT3KzsdN67sB
         szbHi+H+4ByUBA+jCCwd7KKDsNzr168pME/RXMktfZSwjszxvmaQEN66vhfo4bmF8WFl
         FchR2HlMS55TPeFZd4L/EET/cTXNGDa5XpG+RhfqTyGVy6NaxH/lv7bB70In1TMbn8FW
         h2G3YNkfUKxUFZEMRTZOf4d8KNkTZYlIzkwU2//IDZJcrrwr61HLhUKe9+uzqs2gbHzp
         LflQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi+JyVKCRbSHg5Cqa695hAZw+II0cNjcKTrbwjYlcEp5p4DPU/xC/ykFHE1myTgn/SX1xajy18aBcpLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywba9hCJ191jYoPlxJGj/MK5wRl3kCHuw++cjBcIhbRkwlnqVWu
	NC2IVJHmrWT9wMmsRyesFwxJ8RpeYT6q7472ykw+ugzHHelGh456ah50t3kD+YpGX8Kg/1d5Xj7
	V85rrHA==
X-Gm-Gg: ASbGncsOGDyRFctIWwFkFVrl8apa7yLcnkpkr7vGuRyoK3lIeJZNVyygHC+E5QI0pqi
	Dl+9to4Nh6614b8WF7PYnEV0zaU6YkMy6o6g7y2cFmszHQeN9ZyLhdDs+HRZ12P+oR6fxVvLFg7
	kA5QPaCslBEcErXDNwa4+mFZzGpJKpFQgXQGHS4EuohuBGMfPLoUfu6LCegCXxv0nZLxTxN8THR
	GMeb3ZNNFqvYe+APZZ4ilVlRAOxCYaatJzVJTo67nB2mEKK5GhMr1MDv/WWpc6156hpDVcORC9n
	Ws6LEAYa60EXId2euHd+x8PaEYt8UeTKQ5V8Au24UyLy4EcRvqTvmhluf4vdxjU8U3KAmnq5ci/
	tQXuUFbCWnMRBtWWEv8wEF1U=
X-Google-Smtp-Source: AGHT+IHcMQITkbfaY30Pvmj5WFLjGfin8150q//HLzJyxUfZnGFLMdq5hcfsqU9WVd+txE8IlKNDgw==
X-Received: by 2002:a05:6512:3b23:b0:549:4e7b:dcf7 with SMTP id 2adb3069b0e04-54ad6479ab3mr8332636e87.3.1742935645739;
        Tue, 25 Mar 2025 13:47:25 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64689eesm1592902e87.24.2025.03.25.13.47.25
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 13:47:25 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso58925621fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 13:47:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdIbHN7ktakch4Gp41Hr6R25y+v2DGyiIL+/EZAowQUre/hPVEsAVOwdkgEQgbJ/51R7/WjkOvaBU1TA==@lists.infradead.org
X-Received: by 2002:a17:907:95a4:b0:ac3:48e4:f8bc with SMTP id
 a640c23a62f3a-ac3f27fd3b3mr1859596466b.48.1742935307883; Tue, 25 Mar 2025
 13:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325121624.523258-2-guoren@kernel.org>
In-Reply-To: <20250325121624.523258-2-guoren@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Mar 2025 13:41:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
X-Gm-Features: AQ5f1JpwFc7ifwGuAhyrs4E5qPgHx1McCR38KFycRhkLFRMKTveHrmoaWi4zba4
Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
Subject: Re: [RFC PATCH V3 01/43] rv64ilp32_abi: uapi: Reuse lp64 ABI interface
To: guoren@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, will@kernel.org, 
	mark.rutland@arm.com, brauner@kernel.org, akpm@linux-foundation.org, 
	rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com, 
	inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, 
	jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com, 
	wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, 
	dsterba@suse.com, mingo@redhat.com, peterz@infradead.org, 
	boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn, 
	leobras@redhat.com, jszhang@kernel.org, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, yongxuan.wang@sifive.com, 
	luxu.kernel@bytedance.com, david@redhat.com, ruanjinjie@huawei.com, 
	cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn, 
	ardb@kernel.org, ast@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_134728_066962_9CFCABAD 
X-CRM114-Status: GOOD (  13.97  )
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

On Tue, 25 Mar 2025 at 05:17, <guoren@kernel.org> wrote:
>
> The rv64ilp32 abi kernel accommodates the lp64 abi userspace and
> leverages the lp64 abi Linux interface. Hence, unify the
> BITS_PER_LONG = 32 memory layout to match BITS_PER_LONG = 64.

No.

This isn't happening.

You can't do crazy things in the RISC-V code and then expect the rest
of the kernel to just go "ok, we'll do crazy things".

We're not doing crazy __riscv_xlen hackery with random structures
containing 64-bit values that the kernel then only looks at the low 32
bits. That's wrong on *so* many levels.

I'm willing to say "big-endian is dead", but I'm not willing to accept
this kind of crazy hackery.

Not today, not ever.

If you want to run a ilp32 kernel on 64-bit hardware (and support
64-bit ABI just in a 32-bit virtual memory size), I would suggest you

 (a) treat the kernel as natively 32-bit (obviously you can then tell
the compiler to use the rv64 instructions, which I presume you're
already doing - I didn't look)

 (b) look at making the compat stuff do the conversion the "wrong way".

And btw, that (b) implies *not* just ignoring the high bits. If
user-space gives 64-bit pointer, you don't just treat it as a 32-bit
one by dropping the high bits. You add some logic to convert it to an
invalid pointer so that user space gets -EFAULT.

            Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
