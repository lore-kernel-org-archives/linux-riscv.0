Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D89CC636D6
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QuIGAFIU17K1KG4QNHWrbGAN2ov6Ew2xKPrAW7BZu8=; b=ORrdYafG79hIxr
	agacwa2qxtMNQo91xqL+ynXSVxAcdpA/94AUUOIUwK5ZyZIdXWjukChVz155WtKkITJCnj22x9YB1
	1jWdVxuAzFfvmValQ6/ja40CshigtB+JVdDeFAxzdX78iI6DoyvBQedCVvaTUVnGy9L/mHhcNymlD
	6J3ZgYkUrzZaLDhSn5yXfq+fCTH5x1NHLFepmRNWOXKRYpe/kcy4rdJShb+7amsdOMfNjbQeVWdpw
	udpGiYs5xrzAnL/OFE8d+GMYWVQJXPpv52c9N33krbBRhFerhS0y2jttACz9D2UZe7PELQmaXnW4v
	8bKZOfGH0QXCsi21W93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8SC-00AnFI-SS; Wed, 01 Feb 2023 08:26:52 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8S9-00AnDn-T8
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 08:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1675240000; bh=nIEY4apzyLlyWFMN72KR8ORW9CNCVCN52QajOPlyYwo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VPbZynhqGh8Fux9ayguXVNCM6bnaXXcO187d7jL4CZqaFNFIF0N2zApIFbsHKtTMf
	 AViITUDbyHXy+NU3W+G8mqkxUMFiLL0B+/8/gt8Z/lHK+/Gh/5sSYksLv6ySorWyGn
	 gO9yYQ8wGx+a23gxllvS2/80f75hSwh8G/Jna69BkDHyA3SEcATIoH8dtw20UyU71R
	 B4jfJ0TmF0cgdaimLhFjAPZIaJNU47BC9OyCCX8Gxd7+TnVMKYyL6cLH3GprMiCHnA
	 QbWmCIqyeD8gjThlyq03xUO2Z+3uTjm06Bd20v4AkdCckmdTTgbfJeYH3ZprRRQh9A
	 Z5g0cG8OBbCkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.144.73]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6ll8-1pH7Hh12fm-008NFj; Wed, 01
 Feb 2023 09:21:07 +0100
Message-ID: <8f60f7d8-3e2f-2a91-c7a3-6a005d36d7d3@gmx.de>
Date: Wed, 1 Feb 2023 09:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
References: <Y9lz6yk113LmC9SI@ZenIV>
 <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
 <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
X-Provags-ID: V03:K1:VJjTp2f4w/U81CommQGsYVR97pmOEtKM3VseSorFkmrHtlYdJlM
 i3Tn8DYOGFSfdC+kVEAZ0/IKHCB6dV9MUVaLeSV1syyJGt/YgCAusweR1VWRBoG96dAULMC
 7oCXZgwWBpRp9fHxaFIphLkLoDyKW85fn6rXhNHvEAJUaen/R5RUsxaDTzom7JmQCtVmh9U
 U8Z1CE/kj+ng0pE19O48g==
UI-OutboundReport: notjunk:1;M01:P0:pk/EaYZa3ow=;PSdogfIcGiTiYm6jFODM5/F57Sy
 WljTgmftL+dBkFulyVRwmpqrTQnIeslbXQPaKGUcrd2qnJQbz6wSZd3laUy1GmRROUAZ+3viw
 FwoxMb6aIdoTQljoZ3ghgYYedepNS36W6G77UJw+eOIF1bAwmqBjWsJiduBNvDbve8QByzHi7
 +kHJhEiqDH6FVl8cmUkHALwR7HRl8IqNI4jBm6sGArY1500bZAd13iDa997W7IDxRq0vZWXZr
 F9+w8qNUfeLgiTVP7mFXKrdNjBUSh1qtIRpcw3/m2oFDQ6F+Ih5r5Bsz65DRkLhcdaJCrIQo1
 9QC24n1LXuYL1u9GlB72Z4b38KpazU2b53mpSBdQAV8Y9p8evjTnu6ADpjS/KoAdFv7eMhc+7
 rx31BnxMrMVRH7o9yKd9TYUc52PZetUxocgNARBqVdDKIxeI7GG+sIMftz9trB3hvf8mzoKGE
 pQ2FolV43kITUMkk35ogl54AHbbIYKL5hwglJXuGMCzXocaEJcfCqAVNv2anx5xS83IxmxTrU
 QjG1ujG99zNaggnu3DaD0rFdaX5SezTEn9mgfC2xT9kqEOoLHEwh0RRzw80ud6HzNTT6Zo0+t
 QKkmc2LA/4glbgxIspPCiZ9FuBdsI5FDrFlUSkZpjYEi7Zyt8I6wXl+yOZcpPLjO7YRzE4iRO
 FEMViYGQcY7TF8ZaGj3xL8Xg2eMKJBypcnOYHTV7uiiB9CxyX+Xha+U6p4C5HAmfeieFy2biM
 ius6GoyCW0LomcKUKKatJSh5njHS7eGOp5tvUPvhfGly2Rz+JvfiR/GbWGRumEDUnF5pgqlPG
 O9Rt+JX+DpVLz7so+tMYDl5k7NndHcfoHwZCXoRl0mmXvFWkMih7tAjV8enZMWm8evIeANgb5
 aABS/gOAVG9iaogXWnAFDu1pT6B2jo4mvPbaTeUmwiqRwZ0vMXwNT34ePsp/x+Rdm1jeqF86G
 F13D7Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_002650_266072_2DB6B7BC 
X-CRM114-Status: GOOD (  22.45  )
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

On 1/31/23 22:19, Linus Torvalds wrote:
> On Tue, Jan 31, 2023 at 1:10 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>>
>> Umm...  What about the semantics of get_user() of unmapped address?
>> Some architectures do quiet EFAULT; some (including alpha) hit
>> the sucker with SIGBUS, no matter what.
>
> I think we should strive to just make this all common.
>
> The reason alpha is different is almost certainly not intentional, but
> a combination of "pure accident" and "nobody actually cares".
>
>> Are we free to modify that behaviour, or is that part of arch-specific
>> ABI?
>
> I'd just unify this all, probably with a preference for existing
> semantics on x86 (because of "biggest and most varied user base").
>
> That whole "send SIGBUS even for kernel faults" is certainly bogus and
> against the usual rules. And I may well be to blame for it (I have
> this memory of disliking how EFAULT as a return code didn't actually
> return the faulting address). And realistically, it's also just not
> something that any normal application will ever hit.  Giving invalid
> addresses to system calls is basically always a bug, although there
> are always special software that do all the crazy corner cases (ie
> things like emulators tend to do odd things).
>
> I doubt such special software exists on Linux/alpha, though.
>
> So I wouldn't worry about those kinds of oddities overmuch.
>
> *If* somebody then finds a load that cares, we can always fix it
> later, and I'll go "mea culpa, I didn't think it would matter, and I
> was wrong".

AFAICS, the only applications which really care about the return
code are
- testsuites like LTP (i.e. the fstat05 testcase)
- some (not just debian) packages execute tests at the end of the
   build process and verify the return codes, i.e. libsigsegv.

The differences between the architectures is currently often taken care
of via #ifdefs, so if the return code is harmonized across platforms
it would at least help to simplify such testcases.

Helge

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
