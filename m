Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A1DC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppoVTCWOM1Fx2zNbbkD7hSP5mD9i2bZt7PtM5m+UFjw=; b=ZYXFXgFYVt0Tu5
	HKSy3y3Mfb2gZSeWP5s0qCijIuVnW1JCZz1aKFb2BqcOU6T5xolU/F8YlxC8szKGQ6X9+dIGFCW+k
	7AnnqFOPXt60sI9eLrKN99Fj+4bpa4UMTpCCgpb4gnKvHG9OwESZ3UCJRmfO+MDfMphxCF/2vprW4
	aWTf2oB6oc+u5pDl0PmzionYWeRPmQoEbeezWdX/85dC0cJ5NsFW1rWZ4B+jrJ6ALsquFj3pfOhaC
	gWHOD7IuSN6swOftdkaOAFrFxS13cEDkjh0nEUgf6Kx2ayffi0OGcIAgNrU9Ac8ZUMG1tCVZV7jD7
	TsnQdiOJI/gbdiKfh6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VO5-002Gon-2m;
	Fri, 26 May 2023 11:13:37 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VO3-002Gme-02
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 11:13:36 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id B087C5C02A5;
	Fri, 26 May 2023 07:13:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 26 May 2023 07:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1685099607; x=1685186007; bh=+1
	8KTealJLeomxP83iUYPUtTDn9OVxN2b+ZOdMcxvhk=; b=nnjCAIoLe7xGWK1YuI
	Xang8XbZjzLFWCpoWixBEa3RX0P4a8BOHaxOC/EL5zq5BnHvgKnL66zyrEmNkImr
	TFSAHbFTGY7MlB+ACRAzLM5Izbgiec24cJ/t7008U5TB+YNsd/eHksWl4gLh+Swn
	h5QJofJowBPPuHzj/0A8D5NsasOKT4KsczDAPbYGi3UETp8z82gt4C2muNvyNCFJ
	Z7Zk5UJS6fi9qxDg3MF8nyxmDi7YHEmKPxSd3ifcorwAFSVkIrq98jgB+RQBGCrI
	pCMfA1CkVL4Takj7tx6g3btUl+NGS9LxNKYUwKQa64bmznE8zFz6C3v3VDFIFUlC
	hXyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685099607; x=1685186007; bh=+18KTealJLeom
	xP83iUYPUtTDn9OVxN2b+ZOdMcxvhk=; b=aAb2jxFdPzrHMAOwME7yp/30F6SbL
	w4YY0CjNjVVv9a4Y/JY5Dx9TAdIN4IhD+MAwIhkS2eHI2PbZPhjXsEQUPFTC+QtN
	pbvbiGDztsZDAoApSVR4fKt6z2w2g52qhi+QLA1NA9XmTnAFzy5MdXzstgGKkHs3
	4BYAR63r8O24yvBFgblgBXZJo3eM0LKcdJ3zOKzjlvYycl6zEDfQrDH/P5g6+ruF
	zy/pSJWhtPFBDkJlH2a9lZ1DRlJT7KcELfgdVad64KKOGq0izJ5624A/Oy/BKwXR
	LlRlQoCGJbi4YpbRyaDEJ9Ph7g3NDOOoXlTrQ2uTMz9w9bOTP8JjOwjyw==
X-ME-Sender: <xms:VpRwZC2S5KTaQ62euVeI2Iru8fFItByL29XmCKDP05HUzWhXkR1Zmg>
    <xme:VpRwZFHHGKAP-gr9K7MB1jAoQqWnkUGBw7faEd3c2xc1m24pcE9yabMJyu_RLNU2i
    Cl4cHWJWLE6tC9QDoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejledgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:VpRwZK77q2EPZn_tpVGMTPK0ZF1abrg4sPQI14SPqlAY7T33KKmLyA>
    <xmx:VpRwZD3po0ckUAFEljiBunNdbxxx_5Y5wp5rcqwnS-4EhIDXMw3IhQ>
    <xmx:VpRwZFHh1uqiEnpbQB6NVP-p4sopCFl-MGm0J6E9Yi7JilqPM7MIDg>
    <xmx:V5RwZOOl0DpxATfFluZzxCG7I7quRudGHZ059zQbm8IRZflp_WT9Kw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 069CCB60089; Fri, 26 May 2023 07:13:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <70cf0d8f-ea8e-43b6-9b99-739562ea865d@app.fastmail.com>
In-Reply-To: <20230526110001.150368-1-falcon@tinylab.org>
References: <bf3e07c1-75f5-425b-9124-f3f2b230e63a@app.fastmail.com>
 <20230526110001.150368-1-falcon@tinylab.org>
Date: Fri, 26 May 2023 13:13:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Willy Tarreau" <w@1wt.eu>
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_041335_119520_93E18F24 
X-CRM114-Status: GOOD (  21.28  )
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

On Fri, May 26, 2023, at 13:00, Zhangjin Wu wrote:
>> On Wed, May 24, 2023, at 19:59, Zhangjin Wu wrote:
>> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
>
> I have applied this method for ppoll_time64 and clock_gettime64 too,
> this method can save several duplicated lines for us, I have prepared v2
> patches locally for them. 

Ok, that addresses my concern about the possible bugs.

>> I would just use __kernel_timespec64 unconditionally and then
>> use __NR_pselect6_time64 on all 32-bit architectures here,
>> but use __NR_pselect6 on 32-bit architectures.
>>
>
> The 2nd 32-bit you mean is 64-bit?

Yes, sorry for the typo.

> This is related to the timespec64/time64_t definitions as you commented
> in another reply. I will learn how to use the one from
> <linux/time_types.h>, it may require to clean up the existing files in
> tools/include/nolibc/ at first.

Ok, thanks.

>> I think we can also kill off the oldselect and newselect 
>> cases, using pselect6/pselect6_time64 unconditionally here,
>> and no longer care about building against pre-5.1 kernel
>> headers, at least for the copy of nolibc that ships with the
>> kernel.
>
> As Willy commented in another reply, users may want to copy the recent
> one and use them with an old kernel, even if want to drop them, a
> standalone patch may be preferable.

Fair enough. I checked the old versions and see that 5.1 in May 2019
was the first one to include the time64 system call definitions, though
5.6 from March 2020 was the first version that I consider fully working
with time64.

I don't know how common it is to copy nolibc into other projects,
but requiring a three year old kernel might be a little too aggressive
here. They could copy from 6.1-stable to keep the fallback (and miss
rv32) if we do this, but a better cutoff may be Dec 2025 when
linux-5.4 has its "projected EOL" date and one last LTS with the
fallback (linux-6.16 or so) gets released.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
