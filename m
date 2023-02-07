Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8786AC636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 06:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsclvscUafh4SQbUBIBZdyDG1FcG7ZRVe0XRPw6wgrs=; b=S/6Gh7m8GB/ORb
	6KOFF1NxCq+W2SZlZgVTOjeuaUlJzaGpXfKBk/1Mdwtlxp49ZIALym16fO47pzY0g6OQc9RTtYu4l
	+c+NfmyU8v88kHXoE+ic9a03cPfydpHJtCSIiPw+ezSNKnZi+coLeBlM6q8qEbdBBXb+m8iIoO19h
	XjA+5sXC28mFvpOcHPJ7v1vyfNkaRDOEA5q/Wq7eiMWs1oICeiGB+HtVR8u5D9lXbsIY3m2pmDWWW
	11iFgNm3+/dD9RU8rrM+XOdVwRtJuka9cxyCrEaFWUu4wZBMZ8Hnt6D+utwL4090mnR4vXNsmX/1T
	7qJubOtN/EVFeNbKMoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHWk-00Azmy-Ih; Tue, 07 Feb 2023 06:32:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHWh-00AzmB-Dw
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 06:32:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3EE1611C6;
	Tue,  7 Feb 2023 06:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06F5C433D2;
	Tue,  7 Feb 2023 06:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675751542;
	bh=BM31iNLFopS5FV6b55CPDvqToJbz28aRbpAuedR3Wg0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PaGOfHg8GAh6cLctTj+gwXlACn71B6RQGviIMwip2g/oq7XsohntDT9cHKQLfn0OU
	 ZsWEARVAVvOxE3lZ7MeDaExdM1B9gfE0+mdMugyt9zDF+daBT5sNsBQER1o2ljJ0t1
	 iycJPdO62eaWALdOvzCeayx4TICusi6vEbbIRprTM8JV5X0QlnwyC/tbI/4EQ9wHdl
	 +e9gldY2f4bmCX3vpWmMF4hqkeIFqQQvHGt8I4nwtSP8WJ0Qqo0MI9g751FujEkjiH
	 v/XUIdIVUNa58m+9jG5U6nWlLf3x5TduQodDtfYkLvfYgY3kpe8aQmWlGRiUBxf7t7
	 4tqErvkByrhAQ==
Date: Tue, 07 Feb 2023 06:32:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>, Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
User-Agent: K-9 Mail for Android
In-Reply-To: <Y+HsE397cY4HF+5K@kroah.com>
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-3-evan@rivosinc.com> <Y+HsE397cY4HF+5K@kroah.com>
Message-ID: <C3C21677-5250-4120-9A4F-24945C1EE51B@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_223223_529268_7C0F4562 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Dao Lu <daolu@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey Evan, Greg,


On 7 February 2023 06:13:39 GMT, Greg KH <gregkh@linuxfoundation.org> wrote:
>On Mon, Feb 06, 2023 at 12:14:51PM -0800, Evan Green wrote:
>> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
>> system call that quite does this, so let's just provide an arch-specific
>> one to probe for hardware capabilities.  This currently just provides
>> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
>> the future.
>
>Ick, this is exactly what sysfs is designed to export in a sane way.
>Why not just use that instead?  The "key" would be the filename, and the
>value the value read from the filename.  If the key is not present, the
>file is not present and it's obvious what is happening, no fancy parsing
>and ABI issues at all.

https://lore.kernel.org/linux-riscv/20221201160614.xpomlqq2fzpzfmcm@kamzik/

This is the sysfs interface that I mentioned drew
suggested on the v1.
I think it fits ~perfectly with what Greg is suggesting too.

>
>Bonus is that you will also properly document all valid key/value pairs
>in Documentation/ABI/ when you do this, so it reinforces what the code
>should be doing correctly.
>
>thanks,
>
>greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
