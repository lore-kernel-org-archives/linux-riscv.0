Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDDAD69114
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dX+b5VL6dC3dklFQjPYo7AMTF7kb9Pyo3xezevxb5u4=; b=FtP/Uy3HHkGIX0
	MvGma+8ZXT2Zy8beRKrtl16MqdY1BlIyjXTna2y0N2ZfTI1AaeJGeUDu8eXHZBLe9t9U1SyYdCoCt
	7gjLBuwByD7JDkiAlzM1dLBpYKRu/NAjIKW+kgYnYISs6pN4XVjS66D4C/eODxsj6let5mhWSQSzF
	RJ55/594idCRmPEpV6pZzrZsYI6qrdbY/a+L0JONsT8N9TzDLzzXHBcx8PVtHt9cxb1vycyXmQ66b
	KY6ydsNlig8w6QWByum2siwL9MgbiGTfueQfZkDNZQc77WSIYbDb98FRKA1+8KVxkI5OqiLiWLmUM
	sJdEUPc6t8c41vDeQC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfqa-0000000Fna3-3vSI;
	Thu, 28 Nov 2024 14:50:24 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfqY-0000000FnZK-1ZTa
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 14:50:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1F062000F;
	Thu, 28 Nov 2024 14:50:10 +0000 (UTC)
Message-ID: <90533aa9-186a-4f75-b3c5-d93d6682056b@ghiti.fr>
Date: Thu, 28 Nov 2024 15:50:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
 <20241103145153.105097-14-alexghiti@rivosinc.com>
 <20241128-whoever-wildfire-2a3110c5fd46@wendy>
 <20241128134135.GA3460@willie-the-truck>
 <20241128-uncivil-removed-4e105d1397c9@wendy>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241128-uncivil-removed-4e105d1397c9@wendy>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_065022_562526_7BB11F8C 
X-CRM114-Status: GOOD (  15.60  )
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

On 28/11/2024 15:14, Conor Dooley wrote:
> On Thu, Nov 28, 2024 at 01:41:36PM +0000, Will Deacon wrote:
>> On Thu, Nov 28, 2024 at 12:56:55PM +0000, Conor Dooley wrote:
>>> On Sun, Nov 03, 2024 at 03:51:53PM +0100, Alexandre Ghiti wrote:
>>>> In order to produce a generic kernel, a user can select
>>>> CONFIG_COMBO_SPINLOCKS which will fallback at runtime to the ticket
>>>> spinlock implementation if Zabha or Ziccrse are not present.
>>>>
>>>> Note that we can't use alternatives here because the discovery of
>>>> extensions is done too late and we need to start with the qspinlock
>>>> implementation because the ticket spinlock implementation would pollute
>>>> the spinlock value, so let's use static keys.
>>>>
>>>> This is largely based on Guo's work and Leonardo reviews at [1].
>>>>
>>>> Link: https://lore.kernel.org/linux-riscv/20231225125847.2778638-1-guoren@kernel.org/ [1]
>>>> Signed-off-by: Guo Ren <guoren@kernel.org>
>>>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>> This patch (now commit ab83647fadae2 ("riscv: Add qspinlock support"))
>>> breaks boot on polarfire soc. It dies before outputting anything to the
>>> console. My .config has:
>>>
>>> # CONFIG_RISCV_TICKET_SPINLOCKS is not set
>>> # CONFIG_RISCV_QUEUED_SPINLOCKS is not set
>>> CONFIG_RISCV_COMBO_SPINLOCKS=y
>> I pointed out some of the fragility during review:
>>
>> https://lore.kernel.org/all/20241111164259.GA20042@willie-the-truck/
>>
>> so I'm kinda surprised it got merged tbh :/
> Maybe it could be reverted rather than having a broken boot with the
> default settings in -rc1.


No need to rush before we know what's happening,I guess you bisected to 
this commit right?

I don't have this soc, so can you provide $stval/$sepc/$scause, a 
config, a kernel, anything?

Does the polarfire soc provide Ziccrse?


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
