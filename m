Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B2EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 21:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WGz/4fxpn1NTP3//MGyPmplu8ZP5MRKCg1Mizb3vR0=; b=ExP/pw8h4OPNz9
	dBCpzg1JVTBglGNzYxk+vpTgIgFMU9jcinP22gPnwBDqXXzZxKTsv7sCvi7zXVuNFfP/d4xny4JpQ
	VEZUM4PPjlqoBxMJxxNA5AfBilfT1xUQJFruqohj2ggHRMpaEO82ZP15RBMD1kxmEFVBrPq7P8XR8
	6iBjZeDurmIzBfNMpa9clsiQBtaUDAFQsZ2IUHuxOxZQ2DYxWZiu8nCgfGcJIw4zEYeY8S1hrAVzP
	JpVkwAo3qo5t4SGFCE7InysUi55P5WS8m3d3LdOv5iSh0+2AOd0v0SvQ4XwQ8zBz+KrvMx510QeS0
	+Gaeg3DuT0WrS+x0d8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7MN-007OoI-MO; Thu, 14 Apr 2022 21:50:39 +0000
Received: from terminus.zytor.com ([198.137.202.136] helo=mail.zytor.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7MK-007OnM-Li; Thu, 14 Apr 2022 21:50:38 +0000
Received: from [IPv6:::1] ([IPv6:2607:fb90:7391:dbf4:ac39:3cd7:6899:402e])
 (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.15.2) with ESMTPSA id 23ELn22M2798814
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 14 Apr 2022 14:49:06 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 23ELn22M2798814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2022040301; t=1649972954;
 bh=jiFuth2NsJ6kFB5qJAnKixgQm17ojdbszGGbG4v/FeY=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=WlSCH46pkTTvkaONLTYtjSkmVwtV4qIeEdMmXnK56j8qtfwYS7JikfRA16t5MViVC
 EM1qWGvWzhlh2WlFCdtk8/UVeYPWJN9pelM2/l0cF13oibPwWutbgFsYCsjE65uNxL
 UzaMe4CX9mRVu4ZeBkEf3DAcp1R7Lu0Q4CjYfJaSmfE341ksWVeh/c/jWjfchMFBDB
 Kc/0+g7g2/qKBHAy4Z8aTTrUnbJmj1jVMpR2c1aRJI76xB5zAdlw1ESnuyChATNlb9
 ESUZ4Kayt9mmYcOKPJjEWAfQnrQPber7lZBL2bGlkPEFzqEejAivyie3AdvPo+WqEc
 sBsC/PwpLjncQ==
Date: Thu, 14 Apr 2022 14:49:01 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Rob Herring <robh@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 "Theodore Ts'o" <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S . Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-m68k <linux-m68k@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 sparclinux <sparclinux@vger.kernel.org>, linux-um@lists.infradead.org,
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_01/11=5D_timekeeping=3A_add_ra?=
 =?US-ASCII?Q?w_clock_fallback_for_random=5Fget=5Fentropy=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <YliHAl0XpQ57FSGy@robh.at.kernel.org>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-2-Jason@zx2c4.com>
 <CAL_JsqJYq5Oe_zBbcwYNMpfpqGLGCyaSfGqOrPjZ_Pj=nF73mA@mail.gmail.com>
 <CAHmME9pn++c0qHzq39YWyXogcKRbn2XK=yA3kFqch0wH7qPcAg@mail.gmail.com>
 <YliHAl0XpQ57FSGy@robh.at.kernel.org>
Message-ID: <B465920D-5799-4799-A0AC-68837E159D66@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_145036_817073_EC987ACD 
X-CRM114-Status: GOOD (  18.13  )
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

On April 14, 2022 1:41:38 PM PDT, Rob Herring <robh@kernel.org> wrote:
>On Thu, Apr 14, 2022 at 12:38:49AM +0200, Jason A. Donenfeld wrote:
>> Hi Rob,
>> 
>> On Wed, Apr 13, 2022 at 4:32 PM Rob Herring <robh@kernel.org> wrote:
>> > 'does not have a usable get_cycles(), ...' as clearly some arches have
>> > get_cycles() and yet still need a fallback.
>> >
>> > Why not handle the 'if get_cycles() returns 0 do the fallback' within
>> > a weak random_get_entropy() function? Then more arches don't need any
>> > random_get_entropy() implementation.
>> 
>> No, this doesn't really work. Actually, most archs don't need a
>> random_get_entropy() function, because it exists in asm-generic doing
>> the thing we want. So that's taken care of. But weak functions as you
>> suggested would be quite suboptimal, because on, e.g. x86, what we
>> have now gets inlined into a single rdtsc instruction. Also, the
>> relation between get_cycles() and random_get_entropy() doesn't always
>> hold; some archs may not have a working get_cycles() function but do
>> have a path for a random_get_entropy(). Etc, etc. So I'm pretty sure
>> that this commit is really the most simple and optimal thing to do. I
>> really don't want to go the weak functions route.
>
>Is random_get_entropy() a hot path?
>
>
>It doesn't have to be a weak function, but look at it this way. We have 
>the following possibilities for what random_get_entropy() does:
>
>- get_cycles()
>- get_cycles() but returns 0 sometimes
>- returns 0
>- something else
>
>You're handling the 3rd case.
>
>For the 2nd case, that's riscv, arm, nios2, and x86. That's not a lot, 
>but is 2 or 3 of the most widely used architectures. Is it really too 
>much to ask to support the 2nd case in the generic code/header?
>
>Rob

It goes into interrupts, which means it is latency critical.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
