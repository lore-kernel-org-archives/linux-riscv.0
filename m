Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36144C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhgiJwhin/WQYfAKjFmA26k7jRbiucL4aRnBneGkUfQ=; b=RWt+cuudnFPd91
	1avAFroUC988Nv8EDsiKI2MZxoI5YLJBUZhJbk/EjSnpFsW4DYKLg3uahoBSoK2NC0I7B5wnebeFX
	vVTm/iqEifMXMnPkT6ZeXitFA5DiPanC1wGPwgbUJXK4NR1fKKUQmq/uuPqfDQF06QotmYso/cUsW
	rVGrpxc0hDiLm4PmzejQxk3d8AnYfHSINkX98okWCrFm6Zrz/SAaToqaE3RbFB/sXlH0Jg9r5uM3U
	IC7MRAH1GwhTUZB3ISL4psvDzSAMtXrmMsHxneJSci+6lryb5P2fuZd+GoiY5nXeZ30E7Mc1aG/IJ
	0dCNSmY8i3+V1iPaMmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0Lr-00000002s98-29Xe;
	Fri, 16 Feb 2024 15:42:11 +0000
Received: from fhigh4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0Ln-00000002s7i-394q
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 15:42:09 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7E5CD11400B1;
	Fri, 16 Feb 2024 10:42:04 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Fri, 16 Feb 2024 10:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1708098124; x=1708184524; bh=sUxjDTmnmG
	gAl2CwI/6tSDR1ZH3j5RSpbJn+uyf5Z1k=; b=ZuspdC6ULYqPpjDbug1L1BO9M0
	y97ssMlKCIs63CQCwhr7wnd5YtxtUV5MDcZdwuUTuvw62Lg3NEpN5I50Da+tC4X8
	UGXgVLPqbVge/IwHjjy1ltXTV0/DbFobkc/iVwdZMFypCv/xF8dtJPLNo1HKn7u9
	CT3doUkUzeRBq/k+lr+URzGuNShi8soKUXlliAynBMIvZER407o60B3UWjzG//uG
	yVu8Q9FhQK+w/BUaEQd10mLGxUekO4hHXDdmzMqkMeR2cY/ORBvUTCJJkB4Qtl4V
	mxonLR8kJ9gHiJCJ44PI+Oel1r13EXLuI7Rv+cO9ffQe9p4qNKpUWxksIHCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1708098124; x=1708184524; bh=sUxjDTmnmGgAl2CwI/6tSDR1ZH3j
	5RSpbJn+uyf5Z1k=; b=CdpuErccI8WCZEtHbmtA5kRBEv8/H16Hf7+IkEJhaKc7
	ZU91a6PSs2lf/fF6cXSWTw2lvLLLrojjDpmdVuBQPKFbEw7DKtWPn8s+7DNQ62+0
	HLvUP+4Q1c2MXZXSM7PbtSwB/DFxebztDvivGujZ0GZzOUcGU2mfC7upnBJmK32r
	BSAF+GL+LXdg/cDOD7dupq6mMphym3gC64NA0NYwnGpisC0TAFfaih9/0qQI0XCk
	icNL9VHjkxvey+kPMxh/SQvMvB2yXrdpoIAeiQjTSqnskLh4EYSvh2ClKajwmDjG
	+UMZO4gUJoQ44NWxfIwZ+xeCRbaKkVGy2hcMQjxPbg==
X-ME-Sender: <xms:TILPZVue59Wm_fswr80hlYOic2knwPbIh6T7V21-8zD0iCWafZmA5A>
    <xme:TILPZedKvlkWmyIH0NC8cKxPtc3Ko4BS1luEp5TXeWpGw8yB5ufUR_1GZK2y7iLCk
    lFNYrWt3bWIPmM3eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuthgv
    fhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejueehgedtueetgefhheejjeeigffhieefjeehuddvueegtdfh
    heevgfeggfektdenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsohhrvggrrhesfhgr
    shhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:TILPZYzGpYN5iZmIF7Xz88mqp6ndTTW2vN-S_wJLztyZTrOk73bXjw>
    <xmx:TILPZcO96rMeOMp02vucsrpn5orH_glWnR7TarDV6rcPxqlnKmvLOQ>
    <xmx:TILPZV_Cd8cwXYOoufHJsKUXqQcypAQQitJj4CWwfnA_zJetQjGhSw>
    <xmx:TILPZYkzXE5hWx4TEuyAIpNdZCvTwW3up4DuMC0fFNHdEDBkod27rA>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 36A631700096; Fri, 16 Feb 2024 10:42:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <4931a861-551f-43b7-bc9d-a48810b686e5@app.fastmail.com>
In-Reply-To: <20240215-icy-oblong-67adb68a4074@spud>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-3-samuel.holland@sifive.com>
 <20240213-88c9d65fd2b6465fc4793f56@orel>
 <20240215-icy-oblong-67adb68a4074@spud>
Date: Fri, 16 Feb 2024 10:41:43 -0500
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Conor Dooley" <conor@kernel.org>,
 "Andrew Jones" <ajones@ventanamicro.com>
Cc: "Samuel Holland" <samuel.holland@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2 2/4] dt-bindings: riscv: Add ratified privileged ISA
 versions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_074208_169554_0AFB3289 
X-CRM114-Status: GOOD (  19.66  )
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

On Thu, Feb 15, 2024, at 8:14 AM, Conor Dooley wrote:
> On Tue, Feb 13, 2024 at 03:25:44PM +0100, Andrew Jones wrote:
>> On Mon, Feb 12, 2024 at 07:37:33PM -0800, Samuel Holland wrote:
>
>> Note, QEMU doesn't add these extensions to the ISA string yet, but I think
>> it should start, particularly the profile CPU types which should ensure
>> all the profile's mandatory extensions are added to the ISA string in
>> order to avoid any confusion.
>
> Something to note about these "mandatory extensions" that are names for
> things we already assumed were present - they're utterly useless and any
> DT property should note their absence, not presence, in order to be of any
> use. Anything parsing a DT cannot see "svbare" and gain any new
> information, since the lack of it could be something that predates the
> definition of "svbare" or something without "svbare".

This is consistent with the way we handle other extensions that are assumed
at compile time - if you build with RISCV_ISA_C=y, omitting "c" from
riscv,isa-extensions will not cause an error.

It's also the case for any extension whatsoever that if that extension is
not present in the device tree, no information is provided.

It might be useful for diagnostic purposes to have a "binding version"
somewhere to indicate which extensions _would_ be documented; not sure if
there is already a mechanism for this.  For extensions that the kernel has
a hard requirement on like svbare, see above.

> Shit, but that's exactly why I deprecated riscv,isa.

If zicsr and zifencei were broken out from i today, there would not be a
problem, because i as specified by riscv,isa-extensions would refer to a
specific version that included zicsr and zifencei with a new name for the
new, smaller version of i.

It's not working here because privileged architecture versions aren't (yet)
included in riscv,isa-extensions.

-s

> Cheers,
> Conor.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Attachments:
> * signature.asc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
