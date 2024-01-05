Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92D3C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 16:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9iEsBg3+QlxMgNuRzW5y017ZY7R5qAnS999e/qjhfDg=; b=OzchFDGspE8Vu/MC2CMWHrUp21
	wDrtXmodDCEsenzh8ImolZA/5+VOYp7aG+d/qHj1p7qfobL4HSuLblyWGB+kJUdYKXDviril6TmDX
	hEW4ZSh8P3LezKZcoNQX5jCK2fGh9Y3jNBQWke7hf0vfKyS5RBztdrxcWO3/adBrSVzag6TSL8edz
	UWO23J4xYx2IMz79cXknsvkhbqNJVTanTV1zwRcAY6/BcoBIb++GaD4CIn/V5w5DTXabk5HWtel+k
	0kRfOdhTYdHqZ0eRt3YZR9+rysjN+KsTaZZM9+18Sn58SYt6ouEIz6WTGnXMO5F04V7MMfjuh5lhj
	kKnkW4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLn1V-00HJd7-0z;
	Fri, 05 Jan 2024 16:26:17 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLn1S-00HJch-0P
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 16:26:15 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id CFAD032000CC;
	Fri,  5 Jan 2024 11:26:09 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Fri, 05 Jan 2024 11:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1704471969; x=1704558369; bh=HP4Cm1a2Lt
	XuA5x+HCa9C/sYX1fx/+hKgxF2bH2PzqI=; b=kfDSSij8FBGOe3RytOGlVbsoPn
	QIZM6DMX111bQAqPDLwD2EF5m1DrqR98nntkT/s97otgGHhhb6rW8IVu+uR0Wruu
	dLvsR+w2kaWWIFUwsPmDf/fkJNCmF1sEG1vC40whlrKKcnEiZN9mdph0IyLoMiL/
	AGIrcZLgApSBCj4Cuye4JC9USwllXJ0waOOHkr6uAI4q+uWEHLXB0d2lE0yd5zso
	MG/d8gOzws+K86htUDkPtmcBofAyOCVbH1grexGMwTjfQ4TwZohWiFjG6MkLzKDM
	fNUfhE3F7okpa2HYV5uJdV/wcQjarN5lcsRR9EMFC+RmVu2KUdb5mBFEa/DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704471969; x=1704558369; bh=HP4Cm1a2LtXuA5x+HCa9C/sYX1fx
	/+hKgxF2bH2PzqI=; b=5khp3HywwKBVa3CYhDARk66sT/SdCgyFr0WvXApEWjhI
	yjJ6oFKp0HrbViV1mcd4646TtidHHl8G00CO39x+qcl9gMqPWTrdRypJMsDA7dYp
	xRvAVrfeZ+kjCbN834UQj/8Q6Pt8DasAweze4vqFDb22RlG4aLqCpn/BP0hcc2Cj
	txuS3HBKj7BXt6AIiTKrm7YCwwVkX+vXHX+oVYp9FLUeWmLKPyoNM7eObJjbX1O1
	mIuyYw0CFrlWKgSUw1pS39fBGwd9sTDtO2vZDRjFsvl1TVCts1+9mhscKA5XoCi0
	ArxzLyYBbFm/NxRqBFQFP4nD/dt4AktJgdtk5U/oIw==
X-ME-Sender: <xms:oS2YZXnWxoJEMVX5Fw5435ow1Ecn5upPLRIzXjRGm2SOYdU2kMoZJA>
    <xme:oS2YZa0j3ECG96EIddmiHFY5Z2p1TwRaqNDu6FVo-oLF8F7nBNHsh-BUW3f_G-EwT
    RW3FD8_5S-pAlQeDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegledgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuthgv
    fhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefgveejveehtddttefhteeuteevueekhfeffefgtedtvdeuuddt
    gfeigeetueefudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrg
    gurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepshhorhgvrghrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:oS2YZdr2pEZm87KHPiIJGLPx5dVLpFgxj55heM8EX9mAUa_B5bgoAg>
    <xmx:oS2YZfli4Cs55qM_3ur7Tf0gVzNpO9FKn3Efs7aZrS0ksziHmhgQ8g>
    <xmx:oS2YZV2eRa-8QBVNtt8E9ACTVapj2rHa4ea8S7ey4WWQjKuCnnz9ig>
    <xmx:oS2YZS9VZMzd8rOxTcW7VdwSr_PrOr9fUdjjAr-VhEwTh1D5fwrNiQ>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 169681700AE9; Fri,  5 Jan 2024 11:26:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <539fe616-830e-48e0-8ca3-2bbca3ee48d6@app.fastmail.com>
In-Reply-To: <d34bc284-12f0-49d9-8775-e1bc09e8c815@ghiti.fr>
References: <6924f053-580c-b2c3-4680-e613491d3377@cortus.com>
 <d34bc284-12f0-49d9-8775-e1bc09e8c815@ghiti.fr>
Date: Fri, 05 Jan 2024 11:25:46 -0500
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Alexandre Ghiti" <alex@ghiti.fr>, "Theo Z" <theo.zanibellato@cortus.com>,
 linux-riscv@lists.infradead.org
Subject: Re: Page Table A&D bits scheme
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_082614_360160_4C5006FA 
X-CRM114-Status: GOOD (  18.26  )
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

On Fri, Jan 5, 2024, at 4:33 AM, Alexandre Ghiti wrote:
> Hi Theo,
>
> On 05/01/2024 09:27, Theo Z wrote:
>> According to Privileged: 4.3.1 (p81)
>>
>> "Two schemes to manage the A and D bits are permitted:"
>>
>> * When a virtual page is accessed and the A bit is clear, or is 
>> written and the D bit is clear, a
>> page-fault exception is raised.
>
>
> At the moment, this is the only scheme that the kernel supports.

All versions of QEMU prior to 8.0.0 (released April 2023) implement the
second scheme exclusively, setting the A and D bits in PTEs automatically,
with no means for software to override.  Any kernel version which runs on
both pre-8.0.0 QEMU and hardware supports both schemes.

Support for RVA20 and later profiles requires scheme 1 to be in use at boot;
Svadu (as discussed) provides an RVA20-compatible opt-in for scheme 2, and
is supported by QEMU 8.0.0.

-s 

>>
>> * When a virtual page is accessed and the A bit is clear, or is 
>> written and the D bit is clear, the
>> implementation sets the corresponding bit(s) in the PTE
>
>
> This will be supported by the kernel when svadu support is merged in 
> the 
> kernel 
> (https://lore.kernel.org/linux-riscv/20231102120129.11261-1-yongxuan.wang@sifive.com/) 
> and in openSBI 
> (https://lists.infradead.org/pipermail/opensbi/2023-October/005768.html), 
> but it depends on openSBI FWFT extension.
>
>
>>
>> Which implementation does Linux is expected to work best with?
>>
>
> svadu will avoid a page fault so this will be the most performant 
> implementation.
>
>
>> (Unix kernel xv6 works with 2nd scheme only)
>>
>> Best regards,
>>
>> Theo Z
>>
>
> Thanks,
>
> Alex
>
>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
