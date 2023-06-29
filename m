Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B079AC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuO4sCpar5acOfZKao77rWeci4D3TevhmpkRXbvJCEI=; b=Gt8tGBxg3fj74j
	Qdkjra5CJpkSOWYnrsqc6EA71JQtblpNrsv0/XQrZwNlJ7ghOSqaXp0KXQpYBBuL61YGONyOGWnjL
	aC+vMt6ucKk7hHlIR8sqGvQGbYG2vC9bERp8QlvOflyzkHfCv7Z6725mlD+mSZ0JQuqAsRD19DRnQ
	AM862L4ck3+6eSIw3w9uzWDywguwz4cXXNhCco3w/3tx9wuk7ETLHwZne8n5avd1qxHJ62SueNvJ7
	iiiX/yjMXIre/oiEAYS5ixssXFI4e47i7omlhLJXIefJTmMcHK0eYpB5w2hcCz02+qIQOsuh1p08o
	6MihfYWFmzI6TDvO0qFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qErb5-001BJy-1P;
	Thu, 29 Jun 2023 13:22:07 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qErb2-001BIi-0q;
	Thu, 29 Jun 2023 13:22:05 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id D62232B00081;
	Thu, 29 Jun 2023 09:22:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 29 Jun 2023 09:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1688044920; x=1688052120; bh=sQ
	O+tpzU86Ruad95sakzckO3PnIV53aaJirVNNGwiuo=; b=4uqnQG/Z1UuyNyyAek
	0XEemltl5YoKfbuyK7idzOfGbk2sj8tW5sPhftwy7vAcMTe/lNT1CqLxPHHTqxXl
	b+N4aIXSme583rtEDLHRQQE5RZfTFsD+lTdYY9RefCbOfAlhciUTlKT5u2JXw4I4
	ztOXsWSrHvNADHnJ68PH1ClsbIkWEIcWMVseJvPUcBCt/bCpX9x+rZSZZO6oAAQb
	x9SWYdHJXxBC2SICSWUYB8JczQyliaPFo8FiWTtVLKrXWw/KnLs9i/+IAnqxZm8k
	yqkPPTEwfMl+/IelpxRjc4jeyf7SfLboZoIPnpuMmrGUGm6Jvxy4MC7RByrwgGdC
	yACQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688044920; x=1688052120; bh=sQO+tpzU86Rua
	d95sakzckO3PnIV53aaJirVNNGwiuo=; b=IbgfMem7uDuQxpPEGhflBncHobvLW
	vpdJgB9HlfrxSWZohr0Jpjmu+TTjCXIaQB0uQ+13MlfVT0itNPNX4vwmIqNieKC6
	gPv4iflQLslU6lXHYDAvAm799+KHkiXlvXfZM777AHY2iwxEls+3U9z2bO1yeOef
	wFpfTxWZmsHuvogMZSyJmnFyjemy8yi74cXqbPUy2ZTBAZ4KqNqWtoYlOjGYmlQy
	PMPbNhtV1XvXdYg2lSN5WBQIEaNfObSZgMdkW8nfVQEunQCLpApHo/cwzRobpAQN
	ZuHALvp9USqwqc7dcNooNTZaYpKwAFukGjJYFDScEYkfK4BGpwxbvs5wA==
X-ME-Sender: <xms:eIWdZK2mhUMZoeD5ScJng_-Mw9sdRxOEu_Lgqc28dk7bZK70NYedTw>
    <xme:eIWdZNGBGclYv6j7-IGwscmhWxPIRk4Bebhe_u_lemBUmyA0MfekuVd4tn5XkkmLX
    tzaa5AupcGn4LfNDF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:eIWdZC5kimzqKYQ1BPs7CvQbOgpGEss3M0RxRwWrIroNsq9V3om0TA>
    <xmx:eIWdZL1nORBRiFJwbEufwbgzn_wdP_V0r9RSWhxWObhMpewEM8zlHA>
    <xmx:eIWdZNG9JECFzRVSW1lGw4WP0yMQisPFaCR0eAsEec1IlVvAdRAh7Q>
    <xmx:eIWdZPlLPgVMB-Zms1gBZ7XMicph5Ie9iaKcHZPRTF7XioY1Fsly84JuoI4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F305FB60086; Thu, 29 Jun 2023 09:21:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <0dbbdfc4-0e91-4be4-9ca0-d8ba6f18453d@app.fastmail.com>
In-Reply-To: <d3de124c-6aa8-e930-e238-7bd6dd7929a6@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-8-tzimmermann@suse.de>
 <80e3a583-805e-4e8f-a67b-ebe2e4b9a7e5@app.fastmail.com>
 <d3de124c-6aa8-e930-e238-7bd6dd7929a6@suse.de>
Date: Thu, 29 Jun 2023 15:21:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Kees Cook" <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Juerg Haefliger" <juerg.haefliger@canonical.com>
Subject: Re: [PATCH 07/12] arch/x86: Declare edid_info in <asm/screen_info.h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_062204_331663_129C10B2 
X-CRM114-Status: GOOD (  14.29  )
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

On Thu, Jun 29, 2023, at 15:01, Thomas Zimmermann wrote:
> Am 29.06.23 um 14:35 schrieb Arnd Bergmann:
>> On Thu, Jun 29, 2023, at 13:45, Thomas Zimmermann wrote:
>>> The global variable edid_info contains the firmware's EDID information
>>> as an extension to the regular screen_info on x86. Therefore move it to
>>> <asm/screen_info.h>.
>>>
>>> Add the Kconfig token ARCH_HAS_EDID_INFO to guard against access on
>>> architectures that don't provide edid_info. Select it on x86.
>> 
>> I'm not sure we need another symbol in addition to
>> CONFIG_FIRMWARE_EDID. Since all the code behind that
>> existing symbol is also x86 specific, would it be enough
>> to just add either 'depends on X86' or 'depends on X86 ||
>> COMPILE_TEST' there?
>
> FIRMWARE_EDID is a user-selectable feature, while ARCH_HAS_EDID_INFO 
> announces an architecture feature. They do different things.

I still have trouble seeing the difference.

> Right now, ARCH_HAS_EDID_INFO only works on the old BIOS-based VESA 
> systems. In the future, I want to add support for EDID data from EFI and 
> OF as well. It would be stored in edid_info. I assume that the new 
> symbol will become useful then.

I don't see why an OF based system would have the same limitation
as legacy BIOS with supporting only a single monitor, if we need
to have a generic representation of EDID data in DT, that would
probably be in a per device property anyway.

I suppose you could use FIRMWARE_EDID on EFI or OF systems without
the need for a global edid_info structure, but that would not
share any code with the current fb_firmware_edid() function.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
