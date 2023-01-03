Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D18C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 19:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sA21qUwDYB7EhCPu8DoB7AXIE1tGO0d0dPRQ24UVUgQ=; b=yMdh6SmyQFVxZT
	lL3STaxZ4f0n4nObUPPsr0Bd4EJxpsq+wd/GDymGtixjqYjsXEMHMjzrxHKZ0taqdm1asswJb3qQf
	LVIcHlITe4uHrxqH3fWHfYIWyygCoebZX91Vutk9s6SzGQQOj7Pm3DwTUs2JMgHpH2oxFqoFEyn/Z
	IUJPMqN2xjm8a4pyxp9MWeBV8LX/11bljH6grV0LC8aeEYS3BsrWyg9G/W4kxxFZtM4BGEiC7q8aF
	zGmC8vKPBvA5tgJh/EPPAP8yySA5omLfQysLFh+F0eFhv9UR+22JiqHtyRicEvRnSj0fNLuPuEcKC
	knryuHHRBCBWi8nbyOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmzo-004QHP-1K; Tue, 03 Jan 2023 19:30:48 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmn7-004JO5-EX
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 19:17:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o31-20020a17090a0a2200b00223fedffb30so32106970pjo.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 11:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44MCRsfSlf8X7n1ikk4FRz2Ch0iMvVbVLnOQnQq+m3I=;
        b=yXu+WY1oAieZXe1MesFKX1vAlnVi1J5FF3W3I71h/XoFYJxBN2jWJecq8nVY693Q4d
         HVfgNK368w9mOEu/ZunHt22vwq1dD5/SHhG0It3ZlFsXry25Lgh3LNGicMISwbWGoFXP
         mqz0ZM8UtXV31qw2RvfIVIRyXyQsG1MuLwbyVMpXyKo0GtqnSFH3h/bdKJsZ8boLEIJb
         ULWJSAt/Kg3UGQwgffBfTKuHgYK2tRxAA/z5vxR9PAwmyDrY8zr7PeIgTrFHt3qPWsi0
         3Ic3b17XVxycSrTgySkXgAf6GoDLjMz+BRheTIP2cWW70d6AK20gIcYyXlgfSgMXKaLW
         Tnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44MCRsfSlf8X7n1ikk4FRz2Ch0iMvVbVLnOQnQq+m3I=;
        b=fb8pQ5uACC4iweheH9y4NLzzusV4YHRB/9QSYbP+ORMM+9iO4ghX4M/fazEx3aFB2R
         amBAdEMa22m1d6qVwvNMX5AF1bY9MR5DStBt1xPaOOtGJsHrDEijcTHJNP6vyt8yXOXS
         4vxGpLIK58zmCggtePU1YNKFGRBHz/k+TYAfBW75Y7/14xA8XnSeH8STFePSO2qh/ZoZ
         OyUWQvVokN0xpXIngkhvqHW4eQp7aTVdB8czQwxKcyfjaAgOnULeemCyiTQZXuoDiPSL
         d/0E6yYeV4FzFaBCy7m7gW0NQ9n67WO27ttfOR7VTpEpmNmDqm93gtalKejmPdjVVA+H
         xaDQ==
X-Gm-Message-State: AFqh2kph5qQnMXaqxpDo0Dy7qOyLvgHBDtSpl28pnLzA5bulJ7CmCa5J
	mlwTDrYWxK3o07YRrlhavlTQJg==
X-Google-Smtp-Source: AMrXdXsOhHF6I/k5JAYq2fwOQpPCxJckCAhexdm9tEppu2R+Lw85p7j3vdx0Or6H4LOznOyQ1NvFww==
X-Received: by 2002:a17:90a:1008:b0:226:18ca:b53d with SMTP id b8-20020a17090a100800b0022618cab53dmr26479388pja.41.1672773456282;
        Tue, 03 Jan 2023 11:17:36 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id oe5-20020a17090b394500b00223ea04b3fdsm12586045pjb.45.2023.01.03.11.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 11:17:35 -0800 (PST)
Message-ID: <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
Date: Tue, 3 Jan 2023 11:17:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>,
 Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
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
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
 <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
Content-Language: en-US
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_111744_987786_A6E777D2 
X-CRM114-Status: GOOD (  16.99  )
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

Hi Andy,

On 12/28/22 02:53, Andy Chiu wrote:
> On Fri, Dec 23, 2022 at 4:28 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
>> This approach looks perfect. Lets productize it to fold this patch into
>> the respective patch(es).
>> We would then need fixups to not unconditionally enable V on fork/execve
>> and hook that up to a prctl.
>> Let me work on that and provide something on top of your series.
> Hi Vineet, I have included the approach into the Vector series
> according to suggestions, which makes it formaler than the PoC one.
> Additionally, I picked up your prctl patch and added a kconfig to
> compile a kernel that won't unconditionally enable V. Please tell me
> if this does not seem right to you.

The prctl support in there is really rudimentary and incomplete. There's 
more work needed to use the dynamic state of enablement - for say signal 
frame etc. The new Kconfig CONFIG_RISCV_VSTATE_INIT_ALL seems like a 
hack bolted on top.
It would be best to drop it in the current state and rework properly 
based on your patches.

> I will submit the series if this
> seems well to you and let's discuss some more details further in that
> thread. Here is the tree, thanks:
>
> https://github.com/sifive/riscv-linux/tree/dev/andyc/for-next-v13.1-newapi-prctl

I would also suggesting dropping the 2 patches for in-kernel enablement 
for your submission as it might require some more thinking/design and 
builds naturally on top of the baseline patches.

Thx,
-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
