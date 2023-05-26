Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9115CC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ho5zveD1EUv4Y3chmmJdAgh7hbgdnvh4rR36/jow0c4=; b=la3FDSGanA+CF/
	cPj2XTZysdYD305x0KJqzALRfkRvAQ9ToRXIl9akooUk0X8IriW/O2Pi+SakC1sUcpOFwLaDSw9/O
	FscvylJChQuGDD1IIQO8LLNJDTJztjze7FkSO51c3HFPwpbSNVvYBnmuGGfvHlM/ZCuFgS5XC7glW
	OJ5Zl62Q5PZD2Z/7BR2zZlrlJVK0CX9r5c3z9VpkJM1Sa1q5semrO7XM+eLDfG9urJwilAn7dUnSx
	RJvN9grHRWWc64BvNGGIKl3gLKnGqw+g0TQdqJogQNpgb2X0WGTAnzXd3wmxEBUqc+5axkT5M9ee9
	mJ15OplreemUVXFAaZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tbj-001lKC-33;
	Fri, 26 May 2023 09:19:35 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tbg-001lHR-1a
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 09:19:34 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id ECBC55C021C;
	Fri, 26 May 2023 05:19:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 26 May 2023 05:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1685092766; x=1685179166; bh=7G
	DRh3ZRtvXA1AP8xmUjwAEMYIgzrOgpqeDLLW8DVMA=; b=QNRJqhd8JDQBvrxjgH
	C3W9ZgRebT5fh6g9hfUXNEzFcMBXCvzIF0+pSNyLN43oVAIW4X6pjOiHF5/CqDZP
	sujSLWh8K/Ctm8dJnggiGMtlL9swPnn/w+H1v+ZIeq2BHvkHe1eOcSu+/tJEPIOj
	57gn/MNGXyyQA2IW0UMOxADc73X7nFzl8wwXOqCZtF+WfL3xPmBaUWUDSV+5oPFx
	1aHE/8Bo3g9ho8rUzQezWZcWX89f31EZNYramR3YodC1sfUDKFqbvsaOnPdB6CA0
	TvXoBsE8RRKof2ZceyLjfibb/TswPPolZbHwsLvXTDVbTmolH9sPGFkZ1R3bpA3A
	09KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685092766; x=1685179166; bh=7GDRh3ZRtvXA1
	AP8xmUjwAEMYIgzrOgpqeDLLW8DVMA=; b=q3i8xU+hCxik0BXDPR22bPdr6SMGz
	CwDbizR10U6AJ+fkGnL4IEZaXUyB45hYOn75+A1kUjGblDSwhJ+XYoW5Rab8c0uc
	05eOtO4rBtqtoTcskUIOHXfm/dfd2EGHLMF6bz91olD3XdMj+96mczL1yurUxy/B
	z8R3j1DIptKMzzpvfSm+5lBD49aELDa1DJTReJ7AYfhaAWpd9islOdOhY3WCMpfW
	S1NevX63elhpK4QhYwpKGYbnKXI1CYnf8QJfiRbe38VRDwlasVLU2xh7AXIOeQ0k
	eRbrxD60tJItOxJhUBYFO5XFdQIzQVKWDkwXezU5B7NxfvcRtInpsgXtQ==
X-ME-Sender: <xms:nXlwZOZxS0XeogehhAMWIjhQ3c_rBojXPsBRmWl7Zt-Bfp0zI2doHA>
    <xme:nXlwZBY_cgW0GTD3mW0XEgegbpMQOYhIJE_sNL0TWprz0ZJUCCD4eb6yotJaHC1Bp
    jqEJSUF6LGZGEgqNis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejledgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:nXlwZI_4-iliokdg6BM_ro56b3spoap7rAkywL-VcaB3XBKzSF6Mwg>
    <xmx:nXlwZAq748Uyep9u8JF-SskyxjG4xDuXJ5YUdRQAMGF7SdFMw4boNw>
    <xmx:nXlwZJpjfTFjRQQ8FJV68g9tg82LoNzfFw5e_xuBYqIayFmTUOsnHg>
    <xmx:nnlwZCBeVvyAYwaUPEO8X-Kgf1PL28NVXH7--zLIihlsBycNYKt7ig>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C5810B60086; Fri, 26 May 2023 05:19:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <bf3e07c1-75f5-425b-9124-f3f2b230e63a@app.fastmail.com>
In-Reply-To: <9359ab11b52ef7c1799337f475e1e27c0cb00e3b.1684949268.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
 <9359ab11b52ef7c1799337f475e1e27c0cb00e3b.1684949268.git.falcon@tinylab.org>
Date: Fri, 26 May 2023 11:19:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>, "Willy Tarreau" <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, thomas@t-8ch.de
Subject: Re: [PATCH 11/13] tools/nolibc: sys_select: riscv: use __NR_pselect6_time64
 for rv32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_021933_172453_553897E9 
X-CRM114-Status: GOOD (  10.19  )
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

On Wed, May 24, 2023, at 19:59, Zhangjin Wu wrote:
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index c0335a84f880..00c7197dcd50 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -1041,8 +1041,13 @@ int sys_select(int nfds, fd_set *rfds, fd_set 
> *wfds, fd_set *efds, struct timeva
>  		struct timeval *t;
>  	} arg = { .n = nfds, .r = rfds, .w = wfds, .e = efds, .t = timeout };
>  	return my_syscall1(__NR_select, &arg);
> -#elif defined(__ARCH_WANT_SYS_PSELECT6) && defined(__NR_pselect6)
> +#elif defined(__ARCH_WANT_SYS_PSELECT6) && (defined(__NR_pselect6) || 
> defined(__NR_pselect6_time64))
> +#ifdef __NR_pselect6
>  	struct timespec t;
> +#else
> +	struct timespec64 t;
> +#define __NR_pselect6 __NR_pselect6_time64
> +#endif

Overriding the __NR_pselect6 constant seems wrong here, this can
easily lead to more bugs, as pselect6 and pselect6_time64 are
not compatible because of the different arguments, so anything
using the constant after including sys.h will be broken.

I would just use __kernel_timespec64 unconditionally and then
use __NR_pselect6_time64 on all 32-bit architectures here,
but use __NR_pselect6 on 32-bit architectures.

I think we can also kill off the oldselect and newselect 
cases, using pselect6/pselect6_time64 unconditionally here,
and no longer care about building against pre-5.1 kernel
headers, at least for the copy of nolibc that ships with the
kernel.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
