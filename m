Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589C3C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI4s9kdLe635xEopwYFMVSVgwe6As54knHVBM4y7oDw=; b=KkEAce+d24iYTWBvDU5XThHV9E
	aKPLdQGXa4Vza36BATgljKkewb8Gx5sm4hx1cxYFycDu0ji7rSrVAyVC476tS1thC7JEsw9T2wUwy
	86GuGmVCLM3juQHZmAKJFNzhfWf4ZFfRRw1Ivt15wqMtwLzpyFGzMZ56yxciD+WebRbJ3qlVtLoaS
	g7b28ubY/qM/7iOwV43cqBYYcGvYfdqcfuuJyQkMpQib7PFUUPOkJH/9TDiDnOvLH8NdvyAl5blH/
	+suQFG1qTJ1wQMVqgZKW4khRKWFBOfJDILRi6/FCkdqqXJU/zfJM1cuaZmFY64mNo61gq4GF7j8oB
	NUZobbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRGrl-00C35d-2l; Sun, 12 Feb 2023 18:14:21 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRGri-00C34o-Cy; Sun, 12 Feb 2023 18:14:20 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id w3-20020a4aa443000000b0051ac1e0f6b7so1012236ool.11;
        Sun, 12 Feb 2023 10:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yy6WBYKFlGUZBC3pfCGZxczFhTSzWxNT+b39rntG37Q=;
        b=YW6hzO2n0rBporypblWiQgvp76xxqSjyHvLirB9V01x/9adKSdCAQMUIA9a0yVzvrg
         9ZbSL7HFlnkLpdK/iQrxorwGtrMwoKLioa44hkgBrH9dzR5sdvWp0CN99IwW96R1XvIE
         YXLB6EWk09Vlw5YaaL5vtnTjXXJqzjKWdJv4v0Ep9rxm7hfFtTrzkpjNUGWrSPvSLQfI
         QSD0GOTUf+A1QHGPdE5ABP8qdH94gUjHpbbhmL8WlbODkF6wZM8PIY6RhBdUtZHo6aFI
         OnLaQMNEXe16Aa80DuZkLzm/FMgO+LhpvmebS1xXYpzhMFSmAr/jwLDCFazlajWcFbSm
         bt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yy6WBYKFlGUZBC3pfCGZxczFhTSzWxNT+b39rntG37Q=;
        b=eZfkIq6EFi8nl8ID3D24RhEM6hlnZtIwQ3BTJKidtgY0MMpKqbSb8Ry0s1ZutvcD3Z
         idvsxEro577gf9O/+8rglsoPppnN8AoDHvdqkEIZL/UX7L2qybdzpcBiixtqEzhZz7Vx
         2FGVidRpmUMi3MJwNtQEDLy5ckEth4MDXih1cO3Uo2wtQ+X93AuXgD3icu8Gef+tG8+t
         cF2SRn7lqU7TUbuAS4Vjtl/AsvfkYWPjnRd5uZswP2GCnYdgghHHDIvBcodHP3CMKwu7
         eIC42s/4/W8dE0BHS8hVubzVMg1qCZAjuscM0PIGZKcPaeDS1bQiopXXcvJi52wwLlSp
         6qDg==
X-Gm-Message-State: AO0yUKUrj9y6K6jcm/II024b11U9EyL4dmWo5fQ4UILQaw47jkQ1wKlf
	mwrOFhu4HkbSV8ZlANqO/jU=
X-Google-Smtp-Source: AK7set8BW/J2/3+jbZTpj+qLH0fqvGXdDRLY9F4WsPxTuUjQgA/SWr4JyMVI6ih0jvlFe9ZfuSP9Gg==
X-Received: by 2002:a4a:2c51:0:b0:517:67ba:586 with SMTP id o78-20020a4a2c51000000b0051767ba0586mr10209564ooo.3.1676225656208;
        Sun, 12 Feb 2023 10:14:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v23-20020a4ac917000000b004fca8a11c61sm4096933ooq.3.2023.02.12.10.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 10:14:15 -0800 (PST)
Message-ID: <a059a815-dcb0-c575-b5a4-f9433e268e9b@roeck-us.net>
Date: Sun, 12 Feb 2023 10:14:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Heiko Stuebner <heiko@sntech.de>, Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net> <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud> <Y+kcgcncQO/2DNLo@spud> <Y+kqi8bQE+8hLfOF@spud>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Y+kqi8bQE+8hLfOF@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_101418_495618_92628DC7 
X-CRM114-Status: GOOD (  16.78  )
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

On 2/12/23 10:06, Conor Dooley wrote:
> On Sun, Feb 12, 2023 at 05:06:09PM +0000, Conor Dooley wrote:
>> On Sun, Feb 12, 2023 at 04:33:58PM +0000, Conor Dooley wrote:
>>> On Sun, Feb 12, 2023 at 03:59:59PM +0000, Conor Dooley wrote:
>>
>> So as not to lead anyone up the garden path, let me correct myself:
>>
>>> Hmm, so this appears to be us attempting to patch in alternatives where
>>> none actually exists - seemingly F & D.
>>
>> And of course that's not true, riscv_has_extension_likely() now uses
>> alternatives as of:
>> bdda5d554e43 ("riscv: introduce riscv_has_extension_[un]likely()")
>>
>>  From a quick look, it just happens that the only users are F & D.
>>
> 
> Samuel pointed out that this is a lockdep splat on irc.
> There's a patch on the list that removes the lockdep annotation
> entirely:
> https://patchwork.kernel.org/project/linux-riscv/patch/20230202114116.3695793-1-changbin.du@huawei.com/
> 
> So ye, no surprises that it was config based!
> 
> Palmer posted a "better" fix for that lockdep warning a while ago:
> https://lore.kernel.org/all/20220322022331.32136-1-palmer@rivosinc.com/
> 
> So we'd have to duplicate/reuse that for cpufeature/errata patching.
> 
> 

This does not (only) happen in stop_machine().

[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x222/0x2f6
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc7-next-20230210 #1
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] epc : patch_insn_write+0x222/0x2f6
[    0.000000]  ra : patch_insn_write+0x21e/0x2f6
[    0.000000] epc : ffffffff800068c6 ra : ffffffff800068c2 sp : ffffffff81803df0
[    0.000000]  gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : ffffffffffffe000
[    0.000000]  t1 : fffffffffafdfb03 t2 : 4c45203a76637369 s0 : ffffffff81803e40
[    0.000000]  s1 : 0000000000000004 a0 : 0000000000000000 a1 : ffffffffffffffff
[    0.000000]  a2 : 0000000000000004 a3 : 0000000000000000 a4 : 0000000000000001
[    0.000000]  a5 : 0000000000000000 a6 : 0000000000000006 a7 : 0000000000000010
[    0.000000]  s2 : ffffffff8000431a s3 : 00000000000000b2 s4 : ffffffff800040ae
[    0.000000]  s5 : 00000000000000ae s6 : ffffffff8131a0a0 s7 : 0000000000000fff
[    0.000000]  s8 : 0000000008000200 s9 : ffffffff8131a520 s10: 0000000000000018
[    0.000000]  s11: 0000000000000008 t3 : 0000000022e125d2 t4 : 000000000000000d
[    0.000000]  t5 : ffffffffd8180000 t6 : ffffffff81803bc8
[    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[    0.000000] [<ffffffff800068c6>] patch_insn_write+0x222/0x2f6
[    0.000000] [<ffffffff80006a36>] patch_text_nosync+0xc/0x2a
[    0.000000] [<ffffffff80003b86>] riscv_cpufeature_patch_func+0x52/0x98
[    0.000000] [<ffffffff80003348>] _apply_alternatives+0x46/0x86
[    0.000000] [<ffffffff80c02d36>] apply_boot_alternatives+0x3c/0xfa
[    0.000000] [<ffffffff80c03ad8>] setup_arch+0x584/0x5b8
[    0.000000] [<ffffffff80c0075a>] start_kernel+0xa2/0x8f8
[    0.000000] irq event stamp: 0
[    0.000000] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[    0.000000] hardirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.000000] softirqs last  enabled at (0): [<0000000000000000>] 0x0
[    0.000000] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.000000] ---[ end trace 0000000000000000 ]---

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
