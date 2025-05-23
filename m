Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F99C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:To:From:Date:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OERaKi8bgFLAoHtUWedt5Kw77PKlGXtJBaPt+1/7WcA=; b=RMh3nd0Sl6ndriStxKG3S/j4Ff
	7iC5Gn0ygeg4Vdaf8s3ZmHxPeYRxBQbTvvFZ1bJuroBk6Ky90jdvFMQbHKyJW2nGKnJHI7U0SFYm2
	ItKCEf4gur5mr6L3UvPnvzmg9g9r60XVMMyPdZo5vn2YcGUGKSznPuIVaX7A8QLOpanCTRMBc0qby
	Bw768D55I81FIOwP37TEdIRnONCt7nuw5PQARdS8dKljKxbYSNag0nLwno6GHdy2Ei4OwhnIVZ+xf
	GjVu14D3Jrcb0M0hTl3hLjBTWSF7jC9CiKmTgFDJSyFfesGSAn/7VOcZsEvp6gL7Jof71rfcGJlB+
	Siis22eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQxo-00000003kkc-0Eq1;
	Fri, 23 May 2025 11:53:24 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPtm-00000003czi-16ko
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:45:12 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 723F1114013B;
	Fri, 23 May 2025 06:45:08 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 23 May 2025 06:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747997108;
	 x=1748083508; bh=Y81e2LvO0vLhZIXHKU9Um3avzr/8nqz2ybjBlLZu/vI=; b=
	ImUeMeDrVo5WEB6TzbS3e4dogqfeJoqSBQV8qf1zgCxU+1kivr69gvO1AnWqnop2
	qb0TrsUcToTRB76TQxcSx+g9/IoXlkJi7MVrGU6cnOY1eHXqrua8beIfOLfp6VgE
	kJ66NiAGYZlsOvhBK6F0dMSaHXjsYkJzrb/FbhdqqMZtYZAGdY5OEKlSqyqe2tzf
	L5ynOYM46Pz1tYlBlrV1QgvlpVZRbspohwnN5J5usxgZAOJV1Vu3g+zfKO0j3ELv
	GGgfN9LntiQ+O0kh+XelMtVvEAAcv5e9mSSHF4nyBiORc2OuWENgToy5yBFOAKaR
	4qT/YfMikneT2MS7QE877Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1747997108; x=1748083508; bh=Y
	81e2LvO0vLhZIXHKU9Um3avzr/8nqz2ybjBlLZu/vI=; b=B+Fb1BTIYt3sXc7g4
	cztE/HtJJKQq99qO8iLskBT3dMeCpbqec2i69ICwQttKaErwMm9K5L8HaNCoMbnP
	/ud0qo6JT0RGMyKue80HRWieb9KzugiLgI4mKp04rqtSkgv5wH+n7iFvJgdmN7Lq
	bZbDOxOFsdd1i5KWtEa8AsyTEvGVj+xz4axrz/Wafuw4S9M9AzsXu2+1Wu5Ap+/U
	mjflV/nZ+BRNJcDf7Vy8nV2Vy2f73eStx5ROs5C31C8PDE1NIQ7JVkAVYUGXjxed
	IfstodzqF/M8dYYjE7Sqxpu/HuxSFM57yXmewjdzMdiA98lWuctQgNf7fU5IerV5
	Jp+pw==
X-ME-Sender: <xms:s1EwaENFjOZSZSANJ_xSGgjoTbMNAk27rBS4Cv4uLWxC_yZDyLtqxA>
    <xme:s1EwaK_LrWsRGLoV3VEyGzwBGFOEgqxFg1Gg66IMfFqYRR5aX9-xW0zOJTQF_GqlZ
    EWfD3zcX7AiprPLoak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekieehucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvffkjghf
    ufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoe
    grrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeektefgueefhfekhfej
    gefffeetffevuefhvdeijedtfedvteehfedtjeduffdvheenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehmrghrihhordhlihhmohhntghivghllhhosegr
    mhgurdgtohhmpdhrtghpthhtohepfigprghrmhhinhesghhmgidruggvpdhrtghpthhtoh
    eplhgvnhgssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhosh
    hinhgtrdgtohhmpdhrtghpthhtohepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgv
    sggsrdgtrgdprhgtphhtthhopehlihhnuhigqdgrtghpihesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:s1EwaLRLs3yc3EmwQAGnUuberBf2Mjb5nl6yH5rqM4PUoONA5_kLyQ>
    <xmx:s1EwaMtfLlV39O4d5X80twJEMpwOYKMuDogh7uycYHmOhNodrtqxlg>
    <xmx:s1EwaMfvNoThepEUYXlIBEhSXMSSRt1PEOXAVD628akT2l5q-dZykg>
    <xmx:s1EwaA1-K8Xsyja336JjMOxN5G-0G4XtOgVBwC0QmSmkVhEbueM-xw>
    <xmx:tFEwaFhjMgRjqJ5c5MAy9cXE0mFpY5m09n9fY12ujUvtu3nqbWIx7OhX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CDEF41060060; Fri, 23 May 2025 06:45:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tdd7d737077c6d117
Date: Fri, 23 May 2025 12:44:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Armin Wolf" <W_Armin@gmx.de>, "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, "Len Brown" <lenb@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Mark Pearson" <mpearson-lenovo@squebb.ca>, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Message-Id: <9fd12267-bfba-4f94-a132-b20c5be601b0@app.fastmail.com>
In-Reply-To: <91458376-dfc7-46fc-8523-aa176907d703@gmx.de>
References: <20250522141410.31315-1-alexghiti@rivosinc.com>
 <91458376-dfc7-46fc-8523-aa176907d703@gmx.de>
Subject: Re: [PATCH] drivers: acpi: Fix platform profile driver on !acpi platforms
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_034510_768928_ECB25EB4 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 22, 2025, at 22:04, Armin Wolf wrote:
> Am 22.05.25 um 16:13 schrieb Alexandre Ghiti:
>
> I already submitted a patch for this problem (see 
> https://lore.kernel.org/linux-acpi/a6d92cdd-4dc3-4080-9ed9-5b1f02f247e0@gmx.de/T/)
> that only disables the legacy sysfs interface while keeping the 
> class-based interface functional
> as it does not depend on ACPI at all.

Just for my understanding: what users of the platform profile are
there that work without ACPI? I see that CONFIG_ACPI_PLATFORM_PROFILE
is hidden under CONFIG_ACPI and cannot be selected in configurations
that turn off ACPI, so if that is an intended usecase, there is
probably still something wrong in Kconfig.

Should the driver be moved out of drivers/acpi to drivers/platform
in order to let non-ACPI platforms use it?

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
