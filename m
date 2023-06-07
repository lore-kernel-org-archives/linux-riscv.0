Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49DDC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 08:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0a/dert6SKcOIjEl6aij9jqyf5NP6ru2qsQ4+IcbPA=; b=DXpA/Bs6fQHEDH
	zSmc7HvzICJ2rgmPITlWbjUWhdiKlb8JA6PMkYqtVCPwNUEthrUqT8p1Rk6yQ3CL165SsmhjWG07Q
	XV7NuN+KWbPt/Z7hnZn1Rec8YylzzoPvLsLB8ov/FAo/TSMLktrT6ZAysMRfOEur+8EeJinHxxcHd
	CzyNepUXFijEDVrtCP5ZdZ0USBughsdhiu/ABTh/g6HibxKzkLmlcqr5/U0kkSbOlZienopiMEcEs
	axr/+B8EJKgeB7B4XKmhrbtmgO6Wo7iACeFMEPwe5Wiu0y/bhKE2Q8eQELbKCXx57wlsUsTmhja4K
	jpq6cMyrKOudLMCVczhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6onk-0052O7-1T;
	Wed, 07 Jun 2023 08:45:56 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ong-0052JI-1h
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 08:45:54 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 795C0320097A;
	Wed,  7 Jun 2023 04:45:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 07 Jun 2023 04:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1686127544; x=1686213944; bh=Ik
	Di7QwNx6iJE0bqHUZciVFMTfDlg3S9jqMA7XfZt1Y=; b=LhwJuMwo6RO/JlCi0P
	+/suC/ngoczAEQfZSyFCOKn/UT7JYT0X1wsCRDk4IPh7fgflAVHu3hCRAWXWgo2s
	Rwmsj2EjL7V2P/eD4xUhbnC91/5EHcEG4RKEUh6JqmWRIziGcYRS2u/71vSYjyU1
	KKXCsk6bRqjFb0hBQn8Zh//3ryFo+tsIIzY+W9ksk1lnXeXz0SnP5GYpk/I339RR
	cAIwHt2zafobvBv/ReCk81clTVpQE5zYwV2nn/pdPM2crk2uhwf12sHqWOA82gNk
	KiW6EuD1nEKWcuLZd41DO89Hj8rwCZpVe0UxjoD62sUjB9XHGY9Hd0Tjm4H8M7WY
	wd0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686127544; x=1686213944; bh=IkDi7QwNx6iJE
	0bqHUZciVFMTfDlg3S9jqMA7XfZt1Y=; b=f9d9nXP5/Kr5sI/3jDd/+lOPV2am7
	7/F5AiF+v15j6Y1FGJfAPpe2GmH6ha8aabo7ob5t+uR0XRtoFQ4CoDaL5VGPZ6kv
	FFkqhdtGV6G2KKf3b2qWQ90CJMyM7Ier8WY8grcixoi1PdaGpKFURLDX3CCm5a9Q
	6aDsj8RlP5LgXWoUCHPV9uISYX32lzxZUlV5JxBczPTk2C7FheFKc8VMvz58NcFT
	sJ4BEc4Kk6SzJhNBhsLtBicO80DRNtkpU8+ZmJ/VkXLcX7B1PINhbPI2L4sb12S3
	HG/DKPTmydRFeTepMML047gN1M2ecYoDbadmc427CtLq0IEGOA04MAdmg==
X-ME-Sender: <xms:tkOAZLNxuSWWCUm5Pw2rD5cIho5ZHkdDkDU79a8S87KlAvFXwO56Yw>
    <xme:tkOAZF9XFv8fa5UByXGs-vztaD9Er73ejW75SvgkpUfF_wzFxbx-HwAuIiPM7sy0x
    wUZ0MJVQtDfp9HCc8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtgedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepjeeuieeuffefheeffeethfejhfefteeiueekudeihfegtdelveejuefhgfdt
    fedtnecuffhomhgrihhnpehmuhhslhdqlhhisggtrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:tkOAZKTl9pOm5IMUk0bH_h8J0-2AVlYV0KhZRNYPduZriz1yAoYREQ>
    <xmx:tkOAZPuKhAK6iuZKeYcwoYc24PiPUeQeLTlogXYo3w-nQRHoyiWhhw>
    <xmx:tkOAZDdz9CyIbqc9-lDUau8F1p_bedk4FULAFFRl_mh3IZUM5UXCLQ>
    <xmx:uEOAZP50cNVmjDrs7EsNKYWv6vLkyVaERF6TQPHK7KdYU-Q6Xedv2g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D6E39B60086; Wed,  7 Jun 2023 04:45:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <b80f021a-30b7-47e9-8455-3844be157cc2@app.fastmail.com>
In-Reply-To: <20230607051914.667047-1-falcon@tinylab.org>
References: <4fcdd08c-e6fb-40b7-9f2b-77f96e798b37@app.fastmail.com>
 <20230607051914.667047-1-falcon@tinylab.org>
Date: Wed, 07 Jun 2023 10:45:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>, "Willy Tarreau" <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Subject: Re: [PATCH v3 1/3] tools/nolibc: fix up #error compile failures with -ENOSYS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_014552_833295_1E7D177C 
X-CRM114-Status: GOOD (  20.91  )
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

On Wed, Jun 7, 2023, at 07:19, Zhangjin Wu wrote:
>> On Sat, Jun 3, 2023, at 11:01, Zhangjin Wu wrote:
>
> Yeah, agreed, we can clean up them one by one, If split them to their own
> syscalls, I have two questions (for Arnd, and Willy too):
>
> 1. do we need to add the corresponding library routines at the same time?
>
>   Use llseek() as an example, there will be llseek() and lsee64(). If off_t
>   would be converted to 64bit, then, they can be simply added as follows:
>
>     #define lseek64 lseek
>     #define llseek lseek
>
>   Or something like this:
>
>     static __attribute__((unused))
>     loff_t lseek(int fd, loff_t offset, int whence)
>     {
>     	return lseek(fd, offset, whence);
>     }
>
>     static __attribute__((unused))
>     off64_t lseek(int fd, off64_t offset, int whence)
>     {
>     	return lseek(fd, offset, whence);
>     }
>
>   This one aligns with the other already added library routines.
>
>   Which one do you like more?

lseek() is probably not a good example, as the llseek and lseek64
library functions are both nonstandard, and I'd suggest leaving them
out of nolibc altogether.

Are there any examples of functions where we actually want mulitple
versions?

> 2. If so, how to cope with the new types when add the library routines?
>
>   Still use the above llseek() as an example, If not use '#define' method,
>   We may need to declare loff_t and off64_t in std.h too:
>
>     #define off64_t off_t
>     #define loff_t off_t
>
>   Or align with the other new types, use 'typedef' instead of '#define'.

If we do want to include the explicit off64_t interfaces from glibc,
I'd suggest doing it the same way as musl:
https://git.musl-libc.org/cgit/musl/tree/include/unistd.h#n201

>
>> This patch is a step in that direction though, so I think that's
>> totally fine.
>
> Thanks, so, can I pick your Reviewed-by for the first two patches? I'm ready to
> send v4 now ;-)

Yes, please do.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
