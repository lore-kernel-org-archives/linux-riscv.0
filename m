Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC5AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 20:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG+jy/zUxYjr3SkYoFDlzUJp5CFx/aMePc0vmc1r3Tg=; b=brnQfKtfwv7MjB
	EtDZ57i6DcXx9PIwW1mnBLI7XbuGOVhz1LZWxWw2ODlzSU3WYMXyf0Wx+jzg+rtTYTdcd6Oi6cdvA
	+xMyVpO2pMbLehgcKHndnZ2alKmPR60fhrUWh9bLkkuD4wE8RIKxOzaWMBA7TOYSjhGX8xd5TeNeh
	HdiKHljKMs78Znm175h3JOaT9JOw+xJ8n0km/0OsHw6fw3zP46oNh6UwURdWgVz5z4uWE4p/Yy+ph
	vCXKsU08u5quSLOtITeonO/DMrWVcSgzFFk9f4RegQi1nFHRQcOdxwLQI0604qA/O/8v5uGalQALN
	qW7kbK+6hOFSCey+FUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8SAj-00GsRA-Vf; Thu, 22 Dec 2022 20:28:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8SAg-00GsO5-8v
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 20:28:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id b2so3065488pld.7
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 12:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5HwyEmiomjboVj/trHaxxWvGfVIfqkNF8FY6xGz8yM=;
        b=jY9mSbC5JDoPDVS5jt+FpQdnQrUyH/X6wqKUjthZ0lc8LdzMxpIkup1ar6IMmHfbdT
         gt8hu6IuB5W93JAwfipVoS8l/pmfVSsfBURw84IhCC8i9xyfX7L2kAMZc+TVNQIUweC3
         qDMqyeSmlJHf6weTcWE9Amt5XK+28Nz3WGkhofGSOO7F6FnUDoFgm74IEnT91dvpcyca
         Yo52r2fzz3wC4Fp/yQaxKrQtWseoW5Z+NipBWRzs/duPrAwkICCxEakftW3RBmCLPT/F
         Ldc+WYpa/BNsRbmF7Rm7pgkH+Okx0yyvX5W/516+Z9smTHlsePdZ58ZfTDUipxvXkzcW
         /BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5HwyEmiomjboVj/trHaxxWvGfVIfqkNF8FY6xGz8yM=;
        b=3Gah1o15/G/Ct0Vcpkmq6eSRbqkXOq3GvdwaJXt/DhxSS1xvuPcam2MW35ruvUOVMM
         ooKk6PecO0Uz3skZ2OXEH0l4IQhczp+YB/jIT3T5DLgwKqf+bmvpDhTnwT9cnPmvXVun
         hOuXmofXwyrYE4wX1jlpZjC+yqY/TOXndqBbv8C2lMlRdQqic9g+Ys+glFHnQ/bCVkPb
         hyyk5zIIXoKkpJSYdEHUS3cJBjfN0/tc7IVYe2SQrXCboxbrK4r9P/vZVm8MuJVyFxfr
         uibc1d9fRcVZIvzcpUwYiOpS4hVNHkZbBDIVs3c5P18ZBSQsSsffLcJPCQ3mUw+diZNh
         NSkA==
X-Gm-Message-State: AFqh2krS8tT+qaoXKWJDJxSCDg6ZnsecHBF/kfOLtNyEp+c6g85x0nHB
	QLTTzd2Kpd6EFTkum2kYd4T1hg==
X-Google-Smtp-Source: AMrXdXthGIPtKi4Hv9LqMkflOsINub95XAD/fbg+asgyUkDowrE1+/YXEA7iw5vpsvW4sjialdWgbQ==
X-Received: by 2002:a05:6a21:e301:b0:af:85b4:2397 with SMTP id cb1-20020a056a21e30100b000af85b42397mr9821855pzc.41.1671740881880;
        Thu, 22 Dec 2022 12:28:01 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id t16-20020a634610000000b00473c36ea150sm1060512pga.92.2022.12.22.12.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 12:28:01 -0800 (PST)
Message-ID: <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
Date: Thu, 22 Dec 2022 12:27:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Vincent Chen <vincent.chen@sifive.com>,
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com>
 <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_122806_546433_4379CF7D 
X-CRM114-Status: GOOD (  25.60  )
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



On 12/22/22 10:33, Andy Chiu wrote:
> On Thu, Dec 22, 2022 at 1:32 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> E.g.
>>
>>       reserved[0] -> magic
>>       reserved[1] -> displacement to "extension area"
>>       reserved[2] -> size of "extension area"
>>
>> Thus the area can be located anywhere within 4GB and expand to 4GB.
>> Not that I'd hope any signal frame would require 4GB.  :-)
>>
> By encoding the extension magic into fp reserved space, and attaching
> actual Vector states underneath, it is possible to make no size
> changes to the sigcontext itself. In fact the comment section of
> __riscv_q_ext_state specifies those bytes were purposely reserved for
> sigcontext expansion. If this is the case then maybe we should just
> use those reserved spaces anyway.
>
> struct __riscv_q_ext_state {
>          __u64 f[64] __attribute__((aligned(16)));
>          __u32 fcsr;
>          /*
>           * Reserved for expansion of sigcontext structure.  Currently zeroed
>           * upon signal, and must be zero upon sigreturn.
>           */
>          __u32 reserved[3];
> };
>
> Here is a way that keeps the size and layout of sigcontext, while it
> also manages to let the kernel write Vector state into an user's
> signal stack. This approach also lets the user space leverage existing
> reserved space to get context from new extensions. We introduce a new
> struct, __riscv_extra_ext_header, unioning with __riscv_fp_state in
> sigcontext. __riscv_extra_ext_header is the same size as
> __riscv_fp_state. The only purpose of the struct is to point to the
> magic header of a following extension, e.g. Vector, located at the
> reserved space. If there is no more extension to come, then all of
> those bytes should be zeros.
>
>   struct sigcontext {
>          struct user_regs_struct sc_regs;
> -       union __riscv_fp_state sc_fpregs;
> +       union {
> +               union __riscv_fp_state sc_fpregs;
> +               struct __riscv_extra_ext_header sc_extdesc;
> +       };
>   };
>
> I wrote a PoC patch for this and it has been pushed into the following git tree:
> https://github.com/sifive/riscv-linux/tree/dev/andyc/for-next-v13
> I tested it on a rv32 QEMU virt machine and the user space can get/set
> Vector registers normally. I haven't tested it on rv64 yet but it
> should be no difference. The patch is not the final version and maybe
> I missed some basic ideas. But if everyone agrees with this approach
> then I would like to start formalizing and submit the series.

This approach looks perfect. Lets productize it to fold this patch into 
the respective patch(es).
We would then need fixups to not unconditionally enable V on fork/execve 
and hook that up to a prctl.
Let me work on that and provide something on top of your series.

-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
