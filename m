Return-Path: <SRS0=OGj8=Q7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7ABC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Feb 2019 21:03:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EFA20842
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Feb 2019 21:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cz1l2rxe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="fl3I95PE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EFA20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jjcNepOiHkEmSBkcy58ZxPMHjdWgPdosKTXtVbmcGJQ=; b=cz1l2rxeOIqVorfaak/a349gS
	/xmU4xjzMi9NMBXZq50rqM4jrJL5pP4gMc6Kib8J43z/toUa72j/INJBBvjA2uW3xTMQ7V7ZbMfeC
	U+C5+MSFj7pN8JJLoXgbg3EoVVv1g+9kWQe/YzIQ2f7GTuWl2zq8lTOXYO+W2+qs7PkwUtqIoYERc
	YqCIlDABAwPGpiOglKIJsKtY/70wRqmg1IFpcq47qDQbWs66FKYwdn4pzKkZUo3ChXwAofjxnE/9U
	QAS0Z+MB8jM0+k4VFwx+AKqpinrWQkyvqNAEKsnb/ekzJO4UDGozIv/sK/aBQN7zgehcraFZw8CJt
	/H8HdDzBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gy0vq-0006r0-Tj; Sun, 24 Feb 2019 21:03:30 +0000
Received: from mr85p00im-ztdg06011901.me.com ([17.58.23.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gy0vm-0006qg-Vy
 for linux-riscv@lists.infradead.org; Sun, 24 Feb 2019 21:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1551042205; bh=2CwhlJKRQAPkSBh7DXIOu5lP1HWjmnHukcgTCQUes10=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=fl3I95PEYM91rcDy8h5bCMPr8cKG+XsSkfx9hm8GeV8klVRjum1nEX9StdwPYRIWU
 0Ato5gbgQJW0eOozJfQmaNyu4wAaMNcH1XYN6DowPbFw7aJL3PzgAx/Eg/04UUmqK5
 2NxQnbH7E9cCGhfCNntzKoQbNtLkKnwXwaKhCADjLoEVtCGlTRW+ZOaCLDgSiNdEfH
 MPHRSDHD/+qKRxd5nSveJLP2AfJO2/c0Cvk9ZpO8QY79BcgO+pUidL0buFF2UeR+P+
 vasj0I7tNycLDCnlCAjQZ/G1WvZscdkNZIWkcPlnqHn3cklmqUVP+2hgaNvWs9ZHZP
 vkJ7jl3Pp63Lw==
Received: from [192.168.0.18] (125-237-34-254-fibre.sparkbb.co.nz
 [125.237.34.254])
 by mr85p00im-ztdg06011901.me.com (Postfix) with ESMTPSA id 753DAA600B9;
 Sun, 24 Feb 2019 21:03:24 +0000 (UTC)
Subject: Re: [PATCH 1/3] RISC-V: implement xchg_small and cmpxchg_small for
 char and short
To: Christoph Hellwig <hch@infradead.org>
References: <20190211043829.30096-1-michaeljclark@mac.com>
 <20190211043829.30096-2-michaeljclark@mac.com>
 <20190212071726.GA15079@infradead.org>
From: Michael Clark <michaeljclark@mac.com>
Message-ID: <951195a2-1d02-fdf8-c72d-9dae3df9f1ca@mac.com>
Date: Mon, 25 Feb 2019 10:03:22 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190212071726.GA15079@infradead.org>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-24_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1902240166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190224_130327_049759_792D0A5F 
X-CRM114-Status: GOOD (  19.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: RISC-V Patches <patches@groups.riscv.org>,
 Linux RISC-V <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 12/02/19 8:17 PM, Christoph Hellwig wrote:
>>   
>> +extern unsigned long __xchg_relaxed_small(volatile void *ptr, unsigned long new,
>> +					  unsigned int size);
>> +extern unsigned long __xchg_acquire_small(volatile void *ptr, unsigned long new,
> 
> No need for any of the externs on function declarations.
> 
>> +++ b/arch/riscv/kernel/cmpxchg.c
>> @@ -0,0 +1,118 @@
>> +/*
>> + * Copyright (C) 2017 Imagination Technologies
>> + * Author: Paul Burton <paul.burton@mips.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms of the GNU General Public License as published by the
>> + * Free Software Foundation;  either version 2 of the  License, or (at your
>> + * option) any later version.
>> + */
> 
> Please use an SPDX tag instead of the GPL boilerplate.

Okay.

> Also this code seems to be entirely generic and very similar to the
> mips code.  Did you consider making it a generic library routine
> in lib/ instead?

Indeed. After your feedback, I agree. There is no reason why small word 
atomic support cannot be generalized, as it is, it is written in terms 
of the underlying primitives and is not MIPS specific. The addition, is 
the addition of; relaxed, acquire, release; and they can be made 
optional if this code is made generic. We have to think how the arch 
instantiates the templates, in the C template idiom and that likely 
requires some Kconfig magic...

In the mean time, I've absorbed feedback regarding amoadd, and it may be 
the case that we end up with an arch specific spinlock for RISC-V. I 
have not research rwlocks yet. Below is the sample asm snipped from 
another email. Note: this code has not been tested yet...

spin_lock:
     lui     a2,0x10
     amoadd.w a5,a5,(a0)
     srliw   a4,a5,0x10
2:  slliw   a5,a5,0x10
     srliw   a5,a5,0x10
     bne     a5,a4,3f
     ret
3:  lw      a5,0(a0)
     fence   r,rw
     j       2b

spin_trylock:
     lui     a5,0x10
     lr.w.aq a4,(a0)
     addw    a5,a5,a4
     slliw   a3,a5,0x10
     srliw   a3,a3,0x10
     srliw   a4,a5,0x10
     beq     a3,a4,2f
1:  li      a0,0
     ret
2:  sc.w.rl a4,a5,(a0)
     bnez    a4,1b
     fence   r,rw
     li      a0,1
     ret

spin_unlock:
     fence   rw,w
1:  lr.w.aq a4,(a0)
     srliw   a5,a4,0x10
     addiw   a4,a4,1
     slliw   a4,a4,0x10
     srliw   a4,a4,0x10
     slliw   a5,a5,0x10
     or      a5,a5,a4
     sc.w.rl a4,a5,(a0)
     bnez    a5,1b
     ret

Here is the thread where I happened to be thinking at the time about (a 
bit of a tangent, but as we know, acos and asin can be formed with atan)

- https://patchwork.kernel.org/patch/10805093/

Reading the per-cpu amoadd thread made me consider a ticket spinlock 
that uses amoadd for lock/acquire and LR/SC for trylock and 
unlock/release. The idea is a compromise between fairness, code size and 
lock structure size. In this case we have a 32-bit spinlock and amoadd 
0x0001_0000 is used for head increment/acquire, while release is 
slightly more costly, but it balances out the code size quite nicely, 
compared to the previous 32-bit ticket spinlock code that I have been 
experimenting with (independently from Linux asm-generic qspinlock).

I am interested in fair locks, and would also like to try them in an OoO 
simulator that explores the constraints on the bounds of the RISC-V 
memory model, such as testing the correctness for the extent of what can 
be executed out of order. There is quite a bit of work to get one's head 
around this, because I would like to see possible alternate executions. 
We can't really do this with QEMU nor spike. Work such as this has 
previously been done with black-boxes, however I would like OoO 
simulation to be part of general simulation infrastructure for RISC-V

(although I don't currently have funding for that as there is a 
reasonably significant effort involved; small steps; like actually 
getting different lock variants to test...).

Michael.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
