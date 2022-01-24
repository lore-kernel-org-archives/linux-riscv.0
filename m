Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25C7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jan 2022 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVfzSUr06JLExEegBezj+ft5MnPfMRtpe0bzeD3zJOA=; b=4LPjf7SVunH7Ox
	kcpeCIvJJqtgag/bI3IqnjzK656XHA/8HFqnTV2xjMAeGzi9x4FEfwv/5YLp87kslkqM5SzpzdlhE
	MSziF+/OkrEpnBBHE7O7JY9IdvpE5hxJiDZKJuEYc1wiWJK+WCVHL61AGE6IEMKU43FkVpwMbwUHp
	A+Ppjl/bPgjm9LiOnbLenx6pmvHSUeUgpZVpcdMh7/UhAJq39RgVpFhLlt84DmP7vgAEBdiB9DAzS
	LYA676bUIszse2ZczDF7AVYYf/fDqb1d7NUNDKuC9PK/bR4BymlXjrtWIsHxLtG4WQc9L/qQY7x8H
	TZ2c4HM6WMOB2FcES3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC4uz-004rtR-30; Mon, 24 Jan 2022 19:22:21 +0000
Received: from m228-4.mailgun.net ([159.135.228.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC4sK-004qlw-PU
 for linux-riscv@lists.infradead.org; Mon, 24 Jan 2022 19:19:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1643051978; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=RTodLktL3fNAjheW8U0upEQdJu2uLplUIyzBCEj09YA=;
 b=cF05KFg5tyH8uIlazoZiHqScEu8+sbt3Zq7skpmpqfiuevXd5HMfQjsCb4hhzy4LKhsK/XnJ
 /4L9Js2zS2vkl8CHK9LcLbKoKTHeMMa2HYzkuZlktp3C8+TcrcXJHlyKhPVI+Lvy9cL8KCkm
 BoCMbU78FAgQHfQMZS4NzHb1K5Y=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61eefbb98a34df816bef9456 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Mon, 24 Jan 2022 19:19:21 GMT
Received: from [192.168.0.104] (cpe-173-88-115-50.columbus.res.rr.com
 [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id 661DA40266;
 Mon, 24 Jan 2022 19:19:20 +0000 (UTC)
Message-ID: <fdbf6e1c-6ed1-bb82-1a56-f7188de7f83f@michaelkloos.com>
Date: Mon, 24 Jan 2022 14:19:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] Fixed: Misaligned memory access. Fixed pointer
 comparison.
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220123034518.3717116-1-michael@michaelkloos.com>
 <4fa1c4bbf27242cf9835dde0abdc89d5@AcuMS.aculab.com>
From: "Michael T. Kloos" <michael@michaelkloos.com>
In-Reply-To: <4fa1c4bbf27242cf9835dde0abdc89d5@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_111939_054613_E75C4694 
X-CRM114-Status: GOOD (  32.98  )
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

> That may not be true.
> On x86 the cost of misaligned accesses only just measurable.
> It isn't even one clock per cache line for reads (eg ipcsum).
I know that the Intel manuals still recommend alignment on x86.  I
haven't tried to measure performance differences yet.

I think the issue here is that RISC-V is designed as a modular
architecture.  Unlike x86, we don't know that misaligned accesses
will or will not be supported.  I will grant you that if they are
supported by hardware, it will probably be faster to let the hardware
natively take care of it.  However, if the hardware doesn't support
it, the kernel won't be compatible with that hardware.

Now this could be worked around by having the firmware emulate it.
This is not specified in the RISC-V SBI spec.  So depending on this
would mean that the Linux kernel needs additional support from the
firmware than the bare SBI specifies.  The counter argument for this
is that it is a hardware implementation detail and that the firmware
should therefore handle the translation.  This is already the case
for the time CSRs where the CSRs are implemented in memory rather
than as CSRs.  However I don't think that this can be considered 
the same thing as memory accesses, which in my opinion, are a much
more common and primitive operation.  The RISC-V Privileged spec
also lists the time CSRs with the associated CSR addresses.
The CSRs provide needed special functionality that can not be
achieved without specific driver support for alternative
implementations.  I would consider memory accesses and the stuff
controlled by CSRs to be in very different categories.  Memory 
accesses are considered a basic part of a program, listed in the
base rv32i implementation specs.

Firmware emulation would also be dramatically slower.  We are
talking about trapping the exception, saving context, determining
cause, checking permissions, emulating behavior, restoring context,
and finally returning from the trap.  I would be strongly opposed to
requiring this for misaligned memory accesses where the hardware
doesn't support it.  It is likely that we are already dealing with
slower, less capable hardware in that case anyway.  So I would not
recommend adding the additional overhead.

If people are strongly in favor of allowing native handing of
misaligned memory accesses, a possible compromise is the addition
of a CONFIG option such as "Allow Kernel Misaligned Memory Access",
probably under the "Platform Type" section in menuconfig.  This
could be enabled for hardware which supported it, turning on
alternative code-paths that didn't care about alignment, allowing
the hardware or firmware to handle it as needed.  I would
recommend, at least until RISC-V hardware matures, this CONFIG
option default to disabled.

Anyone who has feedback on this, please let me know.

> If the performance of misaligned copies ever matters it is probably
> better to use:
> 	*dst++ = src[0] >> n | src[1] << (64 - n);
> for the body of the misaligned loop.
> You can always read the aligned src[] even if outside the buffer.
> So the only difficult part is writing the odd bytes
> and getting 'n' and the direction of the shifts right!
I had considered this.  I wondered if it would really be faster due
to the additional instructions required on each iteration and avoided
shifts due to the possible use of a barrel shifter vs a clocked shift
register in hardware.  But you are probably correct.  It would
probably still be faster.  Using that instead would also greatly
simplify my code since I wouldn't need a bunch of different loops
for each level of granularity.  I would just do it at the native
XLEN size.  I'll start working on this change.

	Michael

On 1/24/22 04:21, David Laight wrote:

> From: michael@michaelkloos.com
>> Sent: 23 January 2022 03:45
>>
>> Rewrote the riscv memmove() assembly implementation.  The
>> previous implementation did not check memory alignment and it
>> compared 2 pointers with a signed comparison.  The misaligned
>> memory access would cause the kernel to crash on systems that
>> did not emulate it in firmware and did not support it in hardware.
>> Firmware emulation is slow and may not exist.  Additionally,
>> hardware support may not exist and would likely still run slower
>> than aligned accesses even if it did.
> That may not be true.
> On x86 the cost of misaligned accesses only just measurable.
> It isn't even one clock per cache line for reads (eg ipcsum).
>
>> The RISC-V spec does not
>> guarantee that support for misaligned memory accesses will exist.
>> It should not be depended on.
>>
>> This patch now checks for the maximum granularity of co-alignment
>> between the pointers and copies them with that, using single-byte
>> copy for any unaligned data at their terminations.  It also now uses
>> unsigned comparison for the pointers.
> If the performance of misaligned copies ever matters it is probably
> better to use:
> 	*dst++ = src[0] >> n | src[1] << (64 - n);
> for the body of the misaligned loop.
> You can always read the aligned src[] even if outside the buffer.
> So the only difficult part is writing the odd bytes
> and getting 'n' and the direction of the shifts right!
>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
