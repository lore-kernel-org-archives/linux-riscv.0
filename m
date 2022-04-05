Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8348FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=S2mYls9+BJ5+Ak4DW5ohkT9HCkcUjH2pevE4whPUmI0=; b=weW2idPqkLKn55WdFU40soYAGE
	iecZQB/D0qDs56f23zAbckhdDt2/3VC2QAcblUqyHjgVDoB7Un8cXnRSI4kGzYbJqjR6cfkQODIgF
	HS7M1dovnKudDuKHwfhmNDNNxpSL5LF+jc3uiaVM4bgHv0WiUhfKScEnklD33n2mMwupew3NzvSHz
	XgLvChuukgQE48XvB3NidW30b3FftdxhhS0wNTWi0X+Z3QRHx1VuubbQoidof6L+g5/tjdNrMb6tU
	oBT8UbEU9LhvdK8udJ880ZxkEBXMzlwgAf8VeEYT/pwe9Wxkc1Ut+00JppvaFdGLqFnI9Dv7DX0ZP
	nd4kUwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nblpm-001sSe-5G; Tue, 05 Apr 2022 16:15:10 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nblpi-001sPU-2I
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 16:15:08 +0000
Received: by mail-pg1-x530.google.com with SMTP id 66so3900845pga.12
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6FUWFiiYF7RQM6AiZGZcmbxOr+8HtS1WpPnaUZsigro=;
 b=BTCrh4EKdaMDmASfvS4ew7BfBRsBgAtjr3IHlo839Gs+uNJL1JaNgY7v+7hWAxfY3l
 JN6DJshYDWPdzucQ0JkmFgrUmhoNFfJi73bCsveF0oWuFRP7ZaRXxVcx2MyGXEHBvcqr
 ezLUNEkIkWuxApp/dOzuZHu9vzWAhReBDPZbNvhL60twYPz0hc25qbW/Cgif/u1Y2Bey
 PFaiizHMBpyTQJeQxq7a9EHoXAw6vbOcXzeuNAH9O6dn555WunwPMGVXih/B0i1WNkF8
 JKObM6m7yVDL2I0mUfdRK16YlqWP6DY4csOafI7oq9eqeQjOy3Cx7zy5zk/TfjfOOHiP
 KGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6FUWFiiYF7RQM6AiZGZcmbxOr+8HtS1WpPnaUZsigro=;
 b=TwtUjH2amYTy6lqWM+zTB8S5d8xhPuIZNGmxvHl0p4OFG0953c5wZZEFJMMj+dC6ur
 Dfcz+wDkgMfx8JTk/uX+WkkDP54McAamG8t40PG2IHJNJxAc9Xm0sIgNFtleIv/IhvU2
 II2gN6nVc8DxX3Rbz4G6EVd0pwrXYIbZI/jBryHhRIRoGizQdiJVUN38ZOloxQ+Yemm6
 3KEdCo/6qaDl+OrzvIV9CMJa/qNjcOUUbtjoFDi3241r1TWVEKomZoA90f4XRm8pPRSQ
 r0y0MwARQ2b4EOJ49Xwyc1S4qYnxO/niGXJWf4KOFkh67fbdtbaKp8dA442Qi4GYl6o2
 /5Gw==
X-Gm-Message-State: AOAM533DMCO26OzKGvGcrHiZUZlceZwew2PnA309ylVloAU1YkJBFCTP
 PHYKGyGYRyrSrxS+YZDZgaho05RDS/Ri8FUb
X-Google-Smtp-Source: ABdhPJxBsrRDDTM9H+4owE4Y81jBgCK2c5EsTHBBhVbKGNYldNMxrnBlnlMtBkUyZFupsZRuHzSSYg==
X-Received: by 2002:a63:6443:0:b0:399:54fe:5184 with SMTP id
 y64-20020a636443000000b0039954fe5184mr3478339pgb.511.1649175302141; 
 Tue, 05 Apr 2022 09:15:02 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 l192-20020a6391c9000000b003861d9431c7sm13808252pge.62.2022.04.05.09.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 09:15:01 -0700 (PDT)
Date: Tue, 05 Apr 2022 09:15:01 -0700 (PDT)
X-Google-Original-Date: Tue, 05 Apr 2022 09:14:59 PDT (-0700)
Subject: Re: [next] riscv: Linux next-20220404 riscv defconfig builds failed.
In-Reply-To: <CAJF2gTQkGZnwXrXsbx8drL0AicVpOMW=JmOcrieuvyEf91XPhg@mail.gmail.com>
CC: nathan@kernel.org, naresh.kamboju@linaro.org, linux-next@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lkft-triage@lists.linaro.org, 
 regressions@lists.linux.dev, Stephen Rothwell <sfr@canb.auug.org.au>,
 guoren@linux.alibaba.com, heiko@sntech.de, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@rivosinc.com>
To: guoren@kernel.org
Message-ID: <mhng-cfa7bfb9-bab8-423c-85ad-ecd407d6e806@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_091506_362973_D1385EE3 
X-CRM114-Status: GOOD (  17.52  )
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

On Mon, 04 Apr 2022 22:17:24 PDT (-0700), guoren@kernel.org wrote:
> On Tue, Apr 5, 2022 at 12:57 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On Mon, Apr 04, 2022 at 03:28:41PM +0530, Naresh Kamboju wrote:
>> > Linux next-20220404 riscv defconfig builds failed.
>> >
>> > Regressions found on riscv:
>> >    - riscv-riscv-clang-14-defconfig
>> >    - riscv-riscv-gcc-10-defconfig
>> >    - riscv-riscv-clang-13-defconfig
>> >    - riscv-riscv-clang-12-defconfig
>> >    - riscv-riscv-clang-11-defconfig
>> >    - riscv-riscv-gcc-11-defconfig
>> >    - riscv-riscv-gcc-8-defconfig
>> >    - riscv-riscv-gcc-9-defconfig
>> >    - riscv-riscv-clang-nightly-defconfig
>> >
>> >
>> > arch/riscv/kernel/compat_signal.c:7:10: fatal error:
>> > linux/tracehook.h: No such file or directory
>> >   7 | #include <linux/tracehook.h>
>> >     |          ^~~~~~~~~~~~~~~~~~~
>> > compilation terminated.
>> > make[3]: *** [scripts/Makefile.build:289:
>> > arch/riscv/kernel/compat_signal.o] Error 1
>>
>> For what it's worth, I also see:
>>
>> $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- defconfig all
>> arch/riscv/kernel/compat_vdso/compat_vdso.lds.S:3:10: fatal error: ../vdso/vdso.lds.S: No such file or directory
>>     3 | #include <../vdso/vdso.lds.S>
>>       |          ^~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[2]: *** [scripts/Makefile.build:462: arch/riscv/kernel/compat_vdso/compat_vdso.lds] Error 1
>> arch/riscv/kernel/compat_vdso/rt_sigreturn.S:3:10: fatal error: ../vdso/rt_sigreturn.S: No such file or directory
>>     3 | #include <../vdso/rt_sigreturn.S>
>>       |          ^~~~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> arch/riscv/kernel/compat_vdso/note.S:3:10: fatal error: ../vdso/note.S: No such file or directory
>>     3 | #include <../vdso/note.S>
>>       |          ^~~~~~~~~~~~~~~~
>> compilation terminated.
>> arch/riscv/kernel/compat_vdso/getcpu.S:3:10: fatal error: ../vdso/getcpu.S: No such file or directory
>>     3 | #include <../vdso/getcpu.S>
>>       |          ^~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/rt_sigreturn.o] Error 1
>> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/note.o] Error 1
>> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/getcpu.o] Error 1
>> arch/riscv/kernel/compat_vdso/flush_icache.S:3:10: fatal error: ../vdso/flush_icache.S: No such file or directory
>>     3 | #include <../vdso/flush_icache.S>
>>       |          ^~~~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[2]: *** [arch/riscv/kernel/compat_vdso/Makefile:43: arch/riscv/kernel/compat_vdso/flush_icache.o] Error 1
>>
>> I am guessing this code was never tested with $(srctree) == $(objtree).
> Thx for pointing it out:
> I always use:
> make -skj"$(nproc)" ARCH=riscv
> CROSS_COMPILE=riscv64-unknown-linux-gnu- EXTRA_CFLAGS+=-g
> O=../build-riscv/ defconfig all
>
> When I change to:
> make -skj"$(nproc)" ARCH=riscv
> CROSS_COMPILE=riscv64-unknown-linux-gnu- EXTRA_CFLAGS+=-g defconfig
> all
>
> I got your problem.

Just to be clear: this one wasn't supposed to go in via the csky tree, 
and had other build issues that were being found by the autobuilders 
(which is why it hadn't gone in via the riscv tree).  I do in-tree 
builds somewhat regularly so that probably would have caught it if 
nothing else did, but my guess is that some other autobuilder would have 
found it first (some of the earlier patches 

Guo: please stop pushing things to linux-next that break the builds 
and/or aren't aimed at your tree.  This just makes things unnecessarly 
complicated.  If you don't want to deal with the build issues that's OK, 
just LMK when you send the patch sets out and I'll deal with them, but 
having linux-next's build break causes fallout for a lot of users.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
