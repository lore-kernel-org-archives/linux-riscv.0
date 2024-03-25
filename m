Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8088DC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RssXfCMlARIzHLlCJUB9nJjJ10D0Pk1z0Qwk7CDPMDY=; b=IRazAkueSe5j8g
	WgLzcQ8vL4u+v0q4U3eIhtvXHnjj5S8jBeM+h5Cj+fOdzjm/cBfdYvmDAH+FP24Vz6MIEhCdHn4Gg
	QV1HgPGQazHRDk1RYNjTSJs5D7BSlIrkIo4uU4bdMvRJz5bWpSP7JgkfENOtRgSvfhENOvmuSEsGH
	4RLLq9J5VNOlss+1GrD9dZsPMaq1Wa98vPmwi1o1iUs7QMUf7GqCusnD3zcuF0gjJZK6oIvfhwg6i
	/8pEXqkfqdwdMvDTmL0G3r0p2gsjm6wkLq9Oi6lIQclHryWdB0IsFivWYGY2FvCJ7u2QlnusDIi8q
	pvBsNjkpAZLMqDMsUZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooem-00000001ENW-0SiF;
	Mon, 25 Mar 2024 18:02:48 +0000
Received: from wfhigh6-smtp.messagingengine.com ([64.147.123.157])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooeh-00000001EKr-381w
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 18:02:45 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 67A5D18000B3;
	Mon, 25 Mar 2024 14:02:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 25 Mar 2024 14:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711389755; x=1711476155; bh=MZ8i+Gw+8U
	GRptvTYhnegZ3s5XeZTdAEd0vXFYyBJzU=; b=VEbwH/ZOjXX+6S7+y28Yyc+vWh
	Ca3MEk4YxNwb4JxA0pyWCeXBL3vAle5gi06OoeGki82Ie7LQdXk9n5GK2GW55mql
	nLmqXwC4hshhdsEGA/K1nk+h6K4AODag0IvFFzhl4aQ9BJOME6U/e1fZj1tp4EBG
	sD00QoVswMY6HvkZjafP+T8piL2yAFjVEoQBudVHuoWEMb+Lmbp0wyrN8SzDjh+P
	BE7Bk0sAbbqrQcm8RSeVzxFzabGwYZhWMHazr3NyMddCg67R04fJNfFrnShZaI6F
	WNoPquXpDSHD8xSYetuhQ/rc9A7Jf3nkfy9eEqnp6ZP0Cja2z9qsQxaK2VtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711389755; x=1711476155; bh=MZ8i+Gw+8UGRptvTYhnegZ3s5XeZ
	TdAEd0vXFYyBJzU=; b=DuwM5x/Rn+rxyTOAQOoNhmPfZJ4KGAm63mFOUDozt+Ob
	g9Ro3gpszcmkCZ+ZW7UQtWxZLo9gxE8dL3WyM7zDNFynjxGeURELyiI3V7oocqJ0
	BEG59jkhks0VzPAbX2Ca9Ygb1rUsX2GGI46jVOeSV94gMw2gSyUsZA98P/NmQSvj
	p7aWN7aO4IzJG0Lx9b35xnOL+WFgPj10LtBAmgOG6/VDxe4qZHB7mHNFpLLBFM8+
	TWWd+Bp/V3VtiOF/6JcAtlFXboYIrhP4xGpD7Tnr4pFwWiRQVFc4xzxmrOr9PDcw
	F7In0ielSZEvfnoysg5q9vZRv+StTODJVsCRepSAlg==
X-ME-Sender: <xms:O7wBZmZS2Yc5u3MAUARmODwOLObuSmzHtufAokbGzOz97nuNV5Iqow>
    <xme:O7wBZpbVjcn29EifG7tL_9vS4qWCzuKBu_aHcIt3IM9V4OhyL7MQb3gjDKg5uxVkY
    TT1C1f67qsLXAICkZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:O7wBZg8N8TBButbyzPSQbH_wtxgHkTx9XSA03qUtwlPI5rqhag8SGw>
    <xmx:O7wBZop1FbmeL24HRxYUCdkvt6OxCVDhJ_8oTbvazQzLsIzXOZkwig>
    <xmx:O7wBZhrMOFnF_PIpTrY9AO29f-0VAVk5ohB7n79_EVvs2ku8DKyowg>
    <xmx:O7wBZmTfbDmy6niO6Rb-rrD3nXnSECylwgOd3MqtOFG46ZLgyycPfQ>
    <xmx:O7wBZgclbJGPimIKrGmA7WJgBmutgU6M8zfAG5sj4OYzmbNn_ZPqMd9Xshw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 03979B6008D; Mon, 25 Mar 2024 14:02:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-332-gdeb4194079-fm-20240319.002-gdeb41940
MIME-Version: 1.0
Message-Id: <eeccbc9f-7544-42c9-964f-2b4c924c2b2f@app.fastmail.com>
In-Reply-To: <ZgGosOiW6mTeSnTL@FVFF77S0Q05N>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
 <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
 <ZgGosOiW6mTeSnTL@FVFF77S0Q05N>
Date: Mon, 25 Mar 2024 19:02:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Rutland" <mark.rutland@arm.com>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: "David Laight" <David.Laight@aculab.com>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Charlie Jenkins" <charlie@rivosinc.com>, guoren <guoren@kernel.org>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Kemeng Shi" <shikemeng@huaweicloud.com>,
 "Matthew Wilcox" <willy@infradead.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Xiao W Wang" <xiao.w.wang@intel.com>, "Yangyu Chen" <cyy@cyyself.name>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_110243_958858_F601B21F 
X-CRM114-Status: GOOD (  12.25  )
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

On Mon, Mar 25, 2024, at 17:39, Mark Rutland wrote:

> Using a compile-time constant TASK_SIZE_MAX allows the compiler to generate
> much better code for access_ok(), and on arm64 we use a compile-time constant
> even when our page table depth can change at runtime (and when native/compat
> task sizes differ). The only abosolute boundary that needs to be maintained is
> that access_ok() fails for kernel addresses.

As I understand, this works on arm64 and x86 because the kernel
mapping starts on negative 64-bit addresses, so the highest user
address (TASK_SIZE = 0x000fffffffffffff) is still smaller than the
lowest kernel address (PAGE_OFFSET = 0xfff0000000000000).

If an architecture ignores all the top bits of a virtual address,
the largest TASK_SIZE would be higher than the smallest (positive,
unsigned) PAGE_OFFSET, so you need TASK_SIZE_MAX to be dynamic.
It doesn't look like this is the case on riscv, but I'm not sure
about this part.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
