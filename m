Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD60C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXZUIcZjV2+2lyADXwFD3qBBZyaowJL6/JZZbM2gIVY=; b=wnvfSxJLdLEcjP
	0zxzm0KKzuTe3HHjHaI5eqhRx9DWLgXIdEnZNrgF3eIPIvFEakBcsetB4knXRny4iml1dOBPVh83m
	PSE6xo2sZqZVLV04kQUEgtZfzREdD4HLTi6wt8w1GPFldGK4A+NbE0w1PJCsry7EUDSEHXvAO9Sl8
	YT07MC51MAaf/fGC/Zz57XyEm2QtOMxgcYyqTLU3mDhqMYpxUu3t4LTU6nMr2RNCJ4UygRxDYOmbJ
	6mzzyi7+UUAqwioQVzM+05J8bc6XToSZzHuIFkEGBevT+7/0hpjoFWbf59qr4Jpbw+IClH0hYBLu+
	wcV0nBwxu32uvKBNotkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNV25-00Exh3-Ik; Thu, 02 Feb 2023 08:33:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNV0z-00Ex7d-O4
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 08:32:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A85D661920;
	Thu,  2 Feb 2023 08:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CADC433EF;
	Thu,  2 Feb 2023 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675326736;
	bh=em+SA8bH+Ubycp8Mf1txaZ7e8DD8A60wBth/RmYKOBc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u+5WKahB1r6X27Df3qzWXCmH1Ssws9qhIS5elNMhpfG2fNEd5hBYm41/xm5JERarP
	 SQgY3E1J+aLBWYsYOZvSfZvx3LCMBi7OvW7IUz2q9e2x3LDxsC9WMRFZcrPVB8X9Oa
	 sSr/Vyfww9U2vUMKQpwMW8sHYozZrHPR8fPWNmJCQtCqEIl+NtfSjxcDJWIvQsvc17
	 44m+xq/z2kFk1L6zaJ84niYG19C/uMgK83+/k7C2mzHRwjJb7ARXUj3i77KUaEPJok
	 ClHfWe8w9UFlQNs9hehcNpne1OrBFmflqvqWIWGhtT7nt9wG4LmOqOVlMnsWrKqPTK
	 ptIANM7k7Gg+Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org,
 conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com,
 liaochang <liaochang1@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an
 illegal position
In-Reply-To: <CAJF2gTTn52FWRU9-ZqDLpTUe0BkLgttP3NOyk-PzxJbbX75cPg@mail.gmail.com>
References: <20230126130509.1418251-1-guoren@kernel.org>
 <878rhig9zj.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTQHDmT=XWE=j8+5Y5ogKh4qNMpXCwAa+7wXEkBit0ujXw@mail.gmail.com>
 <87357pravt.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTTn52FWRU9-ZqDLpTUe0BkLgttP3NOyk-PzxJbbX75cPg@mail.gmail.com>
Date: Thu, 02 Feb 2023 09:32:13 +0100
Message-ID: <87ilgk79iq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_003217_840649_058FD565 
X-CRM114-Status: UNSURE (   5.62  )
X-CRM114-Notice: Please train this message.
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

Guo Ren <guoren@kernel.org> writes:

>> > -               tmp += GET_INSN_LENGTH(*(kprobe_opcode_t *)tmp);
>> > +               memcpy(&opcode, (void *)tmp, sizeof(kprobe_opcode_t));
>> > +               tmp += GET_INSN_LENGTH(opcode);
>>
>> I'd prefer sizeof(opcode).
> prefer sizeof(opcode) = 4
>
> GET_INSN_LENGTH(opcode) returns 2 or 4;

Sorry for being unclear. I was referring to the sizeof in the memcpy.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
