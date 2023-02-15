Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AD7C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ankA2TTrlIJH7I/HQdwm2j+xPpTO7uzpQSl3f5D75f4=; b=qGbTeKKS+OkBkn
	XdF/ycnAVW/im3k573qbJwjd7qXuzoC5p/MI2Jg0FqLi8dccTn5UEMN7UbwuYpthPuWwlGB/g3Qql
	OxiZ5rWUTTZVtyGLnby79pup5vWI4PEaX+v+rk6zfdQz9lWXt2bX8XNLk7XFH1xxUBuZWxvDufn2q
	OFOINn78oZBJL+Mdu5h8YMs4R0X5ZmM4paDchp0DBAdanfu32cjUNQGz1SL2Jml05z55tNq8lc34S
	tI+XbPAXWXa+0tD2qEtelOZtjYcMbNp5WwWyznsX7SBUUx1sVvv5ibOxU4gtyyc66LTi4toTfnRbs
	VbEh7B33nmLbFlfoV7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSEXN-005NGs-4Z; Wed, 15 Feb 2023 09:57:17 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSEXK-005NFc-90
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 09:57:15 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E2DD25C00A6;
	Wed, 15 Feb 2023 04:57:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 15 Feb 2023 04:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1676455030; x=1676541430; bh=nFeJxTBUgb
	5KP8tqA7gwc+SzCIoEFi7EP1xam7CPn6o=; b=R9VV2G0tfo+W5W7Uiqf9dCwN9b
	vsYcgDxJE703unAhmKnCEqaH71+qjJHLmgCCjaX2W4qs+pPw74ORN1PiduTiH4Qg
	0qtvN1kHBbRgueC9lB4Wzbrh6PI7EsIfOCUrgK5lkCXX5ZYIgvowRt0KvCSIlX5P
	OJb9XikC1JyUNFbjuWhJ0DbreEU9k+AkOoSWSrJ/hj9fQXksTPn0Tl4ZveI8yKsT
	8wpYkBE/O75Pg2dXbGgKs24iVGfnQKYfO9YJvspbyBTHLK3kX0tHjGwCAXhqOMGG
	mS3AfxwndT+qnrEV2CL8yCOTqYZw/iYSznp0LPE4oWUoKzdZ8wkOxPwSkkzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676455030; x=1676541430; bh=nFeJxTBUgb5KP8tqA7gwc+SzCIoE
	Fi7EP1xam7CPn6o=; b=E4a9qktWux3mPni6zVoGt+uu5niuAJB5bINwihUQe86n
	PBB8NzKFY6AYNg/U8B4QcDVBQl7RsbjGslvf5JvoH6kqfM5w0MXKZQllzee5PMag
	ml7TSzl9klsGnjE2alLtVmW8QgfygxVMfcdqyzgiE3kUHFOPh3aDs/lJbPl2CEy0
	ghy7ghuunNr56uLJcHcu9XsxuybExcsXb+yD+vaea6qPA3biasz/CociMsEjSkoH
	bStjSeH8rdWP2vaCZ/pBz0iKcWSfS2au+OpppLEF2df8L0gMSWf7snmodcboaFaG
	iqCd93lU3acCUusPmWjMvh2ivBh7cDfxyeZAXXGuJA==
X-ME-Sender: <xms:dazsY9saUYDQ2qWStjqUaF9Tw7k-YAzGvPeEWItGkuExjRvcsYW3YQ>
    <xme:dazsY2dNg3RNnF9YYdfDm0MHwiEktN8tDX-ZLZmWFZrAdc0X5TccxE6zpD-Zx5XSu
    b4Wko863cwMym6hfCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:dqzsYwzXxjfjPI2WSX94sA35YSIy3j0b8V0z_hyz_ygC94BXhRqoCQ>
    <xmx:dqzsY0PE0VAfDdGEVNZFpiCR6cVls7cEmSegAoKNymENW1yO6gvDwQ>
    <xmx:dqzsY9-GrCPt-cfnwBr9K6FOlkpG6B_3Zagh9A0yAij5t3fna0HR7w>
    <xmx:dqzsY9_8VetotDc0fnuqrHl8p8ckU0b-GKvBCLurvsFw-4ANZS3nSQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E8F24B60086; Wed, 15 Feb 2023 04:57:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com>
In-Reply-To: <20230206201455.1790329-3-evan@rivosinc.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
Date: Wed, 15 Feb 2023 10:56:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Evan Green" <evan@rivosinc.com>, "Palmer Dabbelt" <palmer@rivosinc.com>
Cc: "Conor Dooley" <conor@kernel.org>, "Vineet Gupta" <vineetg@rivosinc.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, slewis@rivosinc.com,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Andrew Bresticker" <abrestic@rivosinc.com>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Anup Patel" <apatel@ventanamicro.com>, "Atish Patra" <atishp@rivosinc.com>,
 "Bagas Sanjaya" <bagasdotme@gmail.com>,
 "Celeste Liu" <coelacanthus@outlook.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>, "Dao Lu" <daolu@rivosinc.com>,
 guoren <guoren@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Ruizhe Pan" <c141028@gmail.com>,
 "Sunil V L" <sunilvl@ventanamicro.com>,
 "Tobias Klauser" <tklauser@distanz.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_015714_404611_83193E3C 
X-CRM114-Status: GOOD (  11.50  )
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

On Mon, Feb 6, 2023, at 21:14, Evan Green wrote:
> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> system call that quite does this, so let's just provide an arch-specific
> one to probe for hardware capabilities.  This currently just provides
> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> the future.
>
> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>

I'm not sure I understand the problem with
AT_HWCAP. While the bits in AT_HWCAP and AT_HWCAP2
are limited, I don't see us running out of new
AT_* words to use for additional bits. Presumably
the kernel would already have to know about the
name of each supported HW feature and could assign
a unique bit number to them.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
