Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCBCCF6497
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 18:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7KSqIpbWnb+4JGHDGTIXqnxwCzQTXWy/vlaT1BJwPs=; b=VjTBHjtixb7pk5
	9jareWdB+Y4ulylZLHkVqY9YyVzjyIHf1q4AX8VsVB1orPVWwNaWFikSDJGNgx1AjvO3B1BYLsjLP
	2JoPfNfWSH1YEV8gYy6WKuatQwXW9gIuTEyI/5PVKJj+HkAAA+oD0y+5htIu2311g6JR6G0NaLLnz
	B3YV0B7dCMGuawd5ebii+AaPICWSxM7ibOwbgqf3UMmH8ZZ93wMQYQNFRPRa9gYm4yx8gbSrOjeHg
	hBEA96Au5zlmeP6ER3Ye37ATCDSkh9whwVsCDUqhvvzOtDfsIumQONlaCCt4VXzzNaVFqTqmKrgB2
	SXSxpt7+4kuywkAPPTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suyvx-0000000FBfj-1b8d;
	Sun, 29 Sep 2024 18:46:17 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suyvu-0000000FBet-2tmB
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 18:46:15 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D0861418B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1727635567; bh=gmDrMhG7sZH9BFaRoq0xQy2ReKc1UDllwoB2/ScS7bg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lZotxcRko0b/kaguCB7QOUOHdFO+dglv00DzGLL76RO2fcOqPZ8iZGUv51MrgevXF
	 B2zNyaWqWPf3YQif0aO4mtlDMJ1uwuecCKbuBx6h/e9FJrVrj8xeXVsRFBRCzpDiSv
	 voRKBvo8/tiU4P6HM6DDepebPzwJxoUhDkcnWAubMgHgpZc8dC4kHzNU9DHmEIfC/n
	 ZqP99Pa77mIiDVkp44x8WwsrGa57UAIrGhRAV5MbH2Lh5UovaR2sRR57BXraWQAyRa
	 4Ngqrr+gDF68ZM3+ETcBhXDojGJTF8cPC4HL4mbsrcP7T1BLX12tdX7lyU1wuHcbUB
	 D+RPEo+Q7EK+A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D0861418B6;
	Sun, 29 Sep 2024 18:46:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, =?utf-8?Q?Cl?=
 =?utf-8?Q?=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, Charlie Jenkins
 <charlie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Fix typo MIMPLID -> MIMPID
In-Reply-To: <20240929153305.m8IHY_7l@linutronix.de>
References: <20240925142532.31808-1-namcao@linutronix.de>
 <87h6a3fw74.fsf@trenco.lwn.net> <20240929153305.m8IHY_7l@linutronix.de>
Date: Sun, 29 Sep 2024 12:46:02 -0600
Message-ID: <87ldzab8np.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_114614_756799_2466F950 
X-CRM114-Status: GOOD (  22.15  )
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

Nam Cao <namcao@linutronix.de> writes:

> On Wed, Sep 25, 2024 at 12:02:39PM -0600, Jonathan Corbet wrote:
>> Nam Cao <namcao@linutronix.de> writes:
>> 
>> > The macro that is really defined is RISCV_HWPROBE_KEY_MIMPID, not
>> > RISCV_HWPROBE_KEY_MIMPLID (difference is the 'L').
>> >
>> > Also, the riscv privileged specification names the register "mimpid", not
>> > "mimplid".
>> >
>> > Correct these typos.
>> >
>> > Signed-off-by: Nam Cao <namcao@linutronix.de>
>> > ---
>> > ask me how I found out..
>> >
>> >  Documentation/arch/riscv/hwprobe.rst | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
>> > index 85b709257918..fb0affa61eb9 100644
>> > --- a/Documentation/arch/riscv/hwprobe.rst
>> > +++ b/Documentation/arch/riscv/hwprobe.rst
>> > @@ -51,7 +51,7 @@ The following keys are defined:
>> >  * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
>> >    defined by the RISC-V privileged architecture specification.
>> >  
>> > -* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
>> > +* :c:macro:`RISCV_HWPROBE_KEY_MIMPID`: Contains the value of ``mimpid``, as
>> >    defined by the RISC-V privileged architecture specification.
>> 
>> You should be able to just say RISCV_HWPROBE_KEY_MIMPID() without the
>> :c:macro: markup and have the right thing happen.
>
> My .rst knowledge is limited, so I probably miss something obvious, but I
> couldn't get that to work.

It's not RST as such, it's an extension that we've added for th ekernel
build. 

> Do you mean something like below? The brackets do not seem to do anything
> and get treated as plain text.
>
> Sorry but you probably need to show me what to do exactly :(
>
> Best regards,
> Nam
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 85b709257918..4b4b4ef0e0f9 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -51,7 +51,7 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
>    defined by the RISC-V privileged architecture specification.
>  
> -* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
> +* `RISCV_HWPROBE_KEY_MIMPID()`: Contains the value of ``mimpid``, as
>    defined by the RISC-V privileged architecture specification.

Try it without the `backquotes`.

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
