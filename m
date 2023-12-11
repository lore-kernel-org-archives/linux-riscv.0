Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D0DC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4QajSACLP5nKuFkuBY2iMfW5782o2Vt+bUrXDJiL+Y=; b=vajjgz1uc8uAV8
	HhwfTUKjyiztUhZBE02m4AA/qKuI9DL5FgM0HOj5xKkK15uQyrbBBS2B30xPv23dSlNVcbGwTGk8I
	sd1+EWgrV4Q/Z8JjIoGe5sFlDCB0V1cA9M2jvAkYrL3J55oFBxaLmOUtM1wgMv+eU/vYZ5ZaehqPW
	gn2Hq+NDxOOnfgQ5XZUX6EUrDZvwJFabcApd4H6+pnDGV5dEkDz2HEXi5Xa2yPgnvGOHZWIcgzNBY
	yeBg/b3GnHvSeTZN+CwFgHz3uZPho2kQvMeG/G4+Z1cV/3WNBAKWYvpZHV9fiIfL6OHV7LxEpuRkA
	nYajPm7IvoX7XQhC9hHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjXy-0060HR-0D;
	Mon, 11 Dec 2023 16:54:22 +0000
Received: from smtpout.efficios.com ([167.114.26.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjXu-0060Bm-0t
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 16:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1702313652;
	bh=xhDt1LTdfHDjHW1Muu0/YN9bTbj2yFZaSNDC1TGeEyQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e108ZViUr2Y2sQwcd+A/U+rTCgun1E82LMA2NBvw7zePyivjM9OW8DAoF3LqZRYvO
	 MUeDNT7FMaGGix4faMoLxFP6B5KQ15tVgqft5fpPnmtFNlNBhlLvY2BD/ykg1g14CW
	 Uf9UCql9G2/ajWCnX2KNzDANhi8wj8YehaEheQgZ2YTeHXFSfYu7kT61TpNmliGwVc
	 2FGeoJdgvRR9W3O3onI+3IDf+dowSGu3A+WupZOogOVrXc977NQmLuU89jeTcdvj2s
	 TzMcL1PH4+N5lUfsh8U7msqeGU6lnLAxqEf0Vx7PYc50c2HYKyo+PwZCDxE6Ob/I5o
	 mFp+CGuGdwbiQ==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4Spns0065Xz1hZM;
	Mon, 11 Dec 2023 11:54:11 -0500 (EST)
Message-ID: <49366b42-7921-484a-af5e-578b41fac1c3@efficios.com>
Date: Mon, 11 Dec 2023 11:54:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] membarrier: Introduce Kconfig ARCH_HAS_MEMBARRIER
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>
Cc: paulmck@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com,
 striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231211094414.8078-1-parri.andrea@gmail.com>
 <20231211094414.8078-5-parri.andrea@gmail.com>
 <8132d732-b9e8-4a52-be5d-74db7a159136@efficios.com> <ZXc+gpayQTUT22t+@andrea>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <ZXc+gpayQTUT22t+@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_085418_639262_D1B1137D 
X-CRM114-Status: UNSURE (   8.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023-12-11 11:53, Andrea Parri wrote:
> On Mon, Dec 11, 2023 at 08:34:21AM -0500, Mathieu Desnoyers wrote:
>> On 2023-12-11 04:44, Andrea Parri wrote:
>>> Architectures supporting the "private expedited" membarrier command must
>>> select the Kconfig to use the command.  Document status and requirements
>>> for each architecture in a single file under Documentation/features.
>>
>> Sorry for being vague in my suggestion: I did not intend to make it
>> optional (not ARCH_HAS_MEMBARRIER), but rather just to have a central
>> place where this would be documented.
> 
> I see.
> 
> 
>> I'm not sure where in Documentation this should land though ?
> 
> Not sure, perhaps a section in (a new) Documentation/scheduler/membarrier.rst?

Yes, it makes sense.

Thanks!

Mathieu

> 
>    Andrea

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
