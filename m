Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7516CC04A94
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 11:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMH1t/O+963mdyUA/Gl5A+UwZSQ0pZ6J8qoNLX9DJ4o=; b=q8vw1ElI/VsDc2
	yUd7CfiLkuZu9GY+l8xxayTmJml5SlQggFu1P0RPWZ/TLuo6cpaJdSF1o/4SNFG5KDlPVL+19yjby
	Iin2pI+JWIWwFyvRKeD7AKsxR6gA1QdJ08vAu+BPT4CJEF2QpFJrAPnQMgv2zWlPtE323SyalP6Qy
	UmrzMgx2JRW4HvcjKXG13rJv2JVyppUPDIA29oydKTTlWmZszcF72IKgp89dQ1uWsPtWDjTnIc2PG
	U3WZhIwUTmYbauFFmbsuhgEyviLb0WTLqutophZoVgJnL41GmrXC12vxjXEkmg+eGzv3OwBLVHxmF
	VMgxRTKuqmbSeIGlg0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLDZ-0035x7-1e;
	Fri, 28 Jul 2023 11:01:09 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLDV-0035rt-1d;
	Fri, 28 Jul 2023 11:01:07 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 108A65C0066;
	Fri, 28 Jul 2023 07:00:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 28 Jul 2023 07:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1690542053; x=1690628453; bh=aG
	D+6R9Vm1NeP/bPyAZllb14ByPMwMXIFJA/NEvaiVE=; b=cotDhuNDr0YdeeMx0d
	UpVXUIPz1hjY4yYy/dnA3e1r/9d7E5GYLiavPpr1gDeCaFX/Q5kR+i4TIsK5giXU
	+ChoeRBuD40R5J1YrTcQROznGofNtQ+1+gtWR2SLzB6QnMgqUjJ1GHsZmhZE1mA8
	1n9PSX7M4PTwn11+XxyijK95PLvq28uN4ddc28p/Db7p2PlbLdd1wn8Jzp9i5nNK
	9nP+49kfaWjxlPGvas7o1wR4c/se1lUmbAdrvQensjSjozaYOjlQM1rs3HjlyU0h
	42CHkbCNhCOyNVVo+UgnO8Uipx3b93AuT/LnPI9lzCrYho2RCKU0bV8zyCFzhEpF
	VTCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690542053; x=1690628453; bh=aGD+6R9Vm1NeP
	/bPyAZllb14ByPMwMXIFJA/NEvaiVE=; b=RdzJctVvatl9LSxuHLnm32ABwvRoN
	nKW167qdMmXWS7lhYWvDRZgRMl2yLjJr2LzFu/5RrcmOSuyBYMMIcs1gZwRenqAX
	pwxwVF8X6DohznfsBzA1TpgdjFvXpUZ+D5N4Hw+1mMbXJSFRIypv5h5oFyIXyZRL
	SpevCyzvT+mbMaSr2Nr5wJIhm8qJBUSwpj7CxVUQecyLIfPR9CZDKeG1RmxpQrpl
	MyS4KNXqOoBJfhbksYFudgOMY1bOBv7xN8uDj8ZIKsFw9qhFPgF0hUFJYjID4UmN
	q6U+4/qs3kiGxaRhqKkqIZZ+U6wHjsAZYupQ3jcdDUWXR2X9ebjfFOLBg==
X-ME-Sender: <xms:45_DZDzl-pkPwwvUPnWtK80ePiDVAQi5snbDEC0bKkqedn2MFuVrbQ>
    <xme:45_DZLSeDZ1pPDBejWqVMzOZn9TnBFuzQOizZ3SVdTXWadshN_kSX4UN4-0QOnH1D
    nvQ3qR8F9cNWyOaubM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieeigdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:45_DZNWisnhG9YvxOULy6tvJlnL15A_qQhWq5SEafh2H9Epg0SMlKg>
    <xmx:45_DZNgemvn5LVUemNdLo8ut5g-TGREvi00HMdOsounjYZpokJDDGw>
    <xmx:45_DZFD2uLncDi4ocuQHBPD8DJsKsFGponOSn6ck4UElnLQLKOUT8w>
    <xmx:5Z_DZJ3q0-pertTRaIwzKz0yKDc-qy5BpHmJ6EgEW9-wbKGOLqEngw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 40AB5B60089; Fri, 28 Jul 2023 07:00:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <1777400a-4d9c-4bdb-9d3b-f8808ef054cc@app.fastmail.com>
In-Reply-To: <20230727213648.GA354736@dev-arch.thelio-3990X>
References: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
 <1687443219-11946-2-git-send-email-yangtiezhu@loongson.cn>
 <20230727213648.GA354736@dev-arch.thelio-3990X>
Date: Fri, 28 Jul 2023 13:00:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v3 1/2] asm-generic: Unify uapi bitsperlong.h for arm64, riscv and
 loongarch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_040105_619054_FE9D2D96 
X-CRM114-Status: GOOD (  24.77  )
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

On Thu, Jul 27, 2023, at 23:36, Nathan Chancellor wrote:
> Hi Tiezhu and Arnd,
>
> On Thu, Jun 22, 2023 at 10:13:38PM +0800, Tiezhu Yang wrote:
>> Now we specify the minimal version of GCC as 5.1 and Clang/LLVM as 11.0.0
>> in Documentation/process/changes.rst, __CHAR_BIT__ and __SIZEOF_LONG__ are
>> usable, it is probably fine to unify the definition of __BITS_PER_LONG as
>> (__CHAR_BIT__ * __SIZEOF_LONG__) in asm-generic uapi bitsperlong.h.
>> 
>> In order to keep safe and avoid regression, only unify uapi bitsperlong.h
>> for some archs such as arm64, riscv and loongarch which are using newer
>> toolchains that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
>> 
>> Suggested-by: Xi Ruoyao <xry111@xry111.site>
>> Link: https://lore.kernel.org/all/d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site/
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Link: https://lore.kernel.org/linux-arch/a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com/
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---

>
> I think this change has backwards compatibility concerns, as it breaks
> building certain host tools on the stable releases (at least 6.4 and
> 6.1, as that is where I noticed this). I see the following error on my
> aarch64 system:
>
>   $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- 
> mrproper defconfig prepare
>   In file included from /usr/include/asm/bitsperlong.h:1,
>                    from /usr/include/asm-generic/int-ll64.h:12,
>                    from /usr/include/asm-generic/types.h:7,
>                    from /usr/include/asm/types.h:1,
>                    from tools/include/linux/types.h:13,
>                    from tools/arch/x86/include/asm/orc_types.h:9,
>                    from scripts/sorttable.h:96,
>                    from scripts/sorttable.c:201:
>   tools/include/asm-generic/bitsperlong.h:14:2: error: #error 
> Inconsistent word size. Check asm/bitsperlong.h
>      14 | #error Inconsistent word size. Check asm/bitsperlong.h
>         |  ^~~~~

Thanks for the report. I'm still struggling to figure out what
exactly is going wrong here, and if this is a bug in the patch
I merged, or an existing bug that now causes a build failure instead
of some other problem.

> A reverse bisect of 6.4 to 6.5-rc1 points to this patch. This Fedora
> rawhide container has kernel-headers 6.5.0-0.rc2.git0.1.fc39 and the
> error disappears when I downgrade to 6.4.0-0.rc7.git0.1.fc39. I have not
> done a ton of triage/debugging so far, as I am currently hunting down
> other regressions, but I figured I would get an initial report out,
> since I noticed it when validating LLVM from the new release/17.x
> branch. If there is any additional information I can provide or patches
> I can test, I am more than happy to do so.

One thing I think is going wrong here is that scripts/sorttable.c is
meant to run on the host (arm64) but includes the target (x86)
orc_Types.h header and the kernel-internal asm/bitsperlong.h instead
of the uapi version. The sanity check in the kernel-side header
is intended to cross-check the CONFIG_64BIT value against the
__BITS_PER_LONG constant from the header.

My first guess would be that this only worked by accident if the headers
defaulted to "#define __BITS_PER_LONG 32" in and #undef CONFIG_64BIT"
when include/generated/autoconf.h, but now the __BITS_PER_LONG value
is actually correct.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
