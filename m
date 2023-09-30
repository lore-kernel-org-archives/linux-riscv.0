Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB53E77374
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 14:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9WSr66LGNwjQYKOEmJdbe93wXSQPpuHvtui+4u3fCw=; b=OI0eGEI+J9DwbA
	rH+pO6Fopi/amghrJIvl9YkpeMMPxALOAKOySanB4aXOb1AoQkNWYh6AUsKIab8loR0+VbYUr1eWq
	NWExNvpbG4f557Jiorm3dIcbam400AjNXcDDBbG3xKL4bRmjuJ0nIzz8EKxkM7H7XK8eLi06PV3Tq
	dcBN4tF3v56L48ouEJxrkuG/PTmUWfcxtbMnYH1DEtlkRfrl3vd+tT2io5GKTf2aGpaT3C4/v5fQS
	Bd2cXm6uvkqbLdHfAoSTq9XyGiE0g6JoY1QxabUcHLLW9z+7Po9HnP5+oUK3SV6MIsi0iVcNiQS3H
	tBHOyL7ltOA0SJKw/kJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmavd-009fQ9-1n;
	Sat, 30 Sep 2023 14:26:45 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmavb-009fOy-0D
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 14:26:44 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E1CE06D6;
	Sat, 30 Sep 2023 14:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E1CE06D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1696083999; bh=+zJwzVA6xYPyFirYQsaCDkrq4i+jIS3PORmpAYYOKtc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mhhN1LL7SrQf5o37LFQCYsx+OoJ/Jm7J2L3SGmhIpwh4RwXC4WP9H2nUpfMh62GIL
	 pPyNZVHJ2gvunI7ZXyd46xxKMsw8DWLflFrBoHk+5+uWaWpn6S2YlBVcHtZgDmm6+5
	 5hP6kE3Gi7nSUU3vk+tzfTodEOgnYoJrNh/Uqid5ekOaMkaW6x8U8V+B/LPV3K4k2l
	 MT/i/ljPrE/BpwbszyfmxpCFQcKDg/9TEfQcy7amFVSJL3R3WA1yY9ByWoA1O6grCB
	 e/DUnumkbTR7KT6vRx9Cykxpfy8qvpXCGBSDaKId+yqXzoltWa68rOSAFKz13nyJe3
	 KiEAWOCVjmxIA==
From: Jonathan Corbet <corbet@lwn.net>
To: Conor Dooley <conor@kernel.org>, Costa Shulyupin <costa.shul@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Federico Vaga
 <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <siyanteng@loongson.cn>, Heiko Carstens <hca@linux.ibm.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Ard Biesheuvel
 <ardb@kernel.org>, Atish
 Patra <atishp@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Randy Dunlap <rdunlap@infradead.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner
 <heiko@sntech.de>, Andy Chiu <andy.chiu@sifive.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Greentime Hu <greentime.hu@sifive.com>, Anup Patel
 <anup@brainfault.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Charlie
 Jenkins <charlie@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>, Wu
 XiangCheng <bobwxc@email.cn>, Sami Tolvanen <samitolvanen@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org
Subject: Re: [PATCH] docs: move riscv under arch
In-Reply-To: <20230930-mauve-jargon-0f7760fd262d@spud>
References: <20230928103134.2779459-1-costa.shul@redhat.com>
 <20230930-mauve-jargon-0f7760fd262d@spud>
Date: Sat, 30 Sep 2023 08:26:38 -0600
Message-ID: <87h6nbka8x.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_072643_114227_35352877 
X-CRM114-Status: GOOD (  11.45  )
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

Conor Dooley <conor@kernel.org> writes:

> On Thu, Sep 28, 2023 at 01:29:42PM +0300, Costa Shulyupin wrote:
>> and fix all in-tree references.
>> 
>> Architecture-specific documentation is being moved into Documentation/arch/
>> as a way of cleaning up the top-level documentation directory and making
>> the docs hierarchy more closely match the source hierarchy.
>> 
>> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>
> This doesn't apply to riscv/for-next or next/master, with git
> complaining about the sha1 being lacking or useless. What does this
> actually apply to?

docs-next, I would guess (though I haven't had a chance to try it).  If
you would like to carry this through the riscv tree (which is probably
the most sensible option), I suspect Costa could be talked into
respinning it...?

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
