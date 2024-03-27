Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC11C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ED87SZZc93VLRSYmw6dT3rryRXLBiIkaSDAyCTeYlx0=; b=DOmvuFa28D+IeE
	S4nFhhP7Fco994otvGhH5Pow3665gHozu9XYuPBg0/X2n+pDT5SiGxmBsiGXzWHfaKGmQr1TSUv3u
	fkym6X/x0QIxDcpG676U2lmnpxWE4R3WJfrdgjE4U4f1r55BVkm6nJQ4zJ20+X7yTpZ8diVR5Vwtl
	1pPyhzo2Njr9y1gWwxQxqdT7A7JSTxJHmU9//KHJOW7UkAlZ5cEU1yi6rSijX04/vpw8lxmwzAdaP
	OqnhlkLllYzjuhzPwKy7FMurszukEVqQ0VBvMRvt7Wk9RUeV5gRsZDogy1bwjFQwyS+Aj0fwfZEU4
	VCQRnf0rcRQhAWYghjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpW54-0000000A4Ws-0N65;
	Wed, 27 Mar 2024 16:24:50 +0000
Received: from fout3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpW50-0000000A4VQ-3oIA
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:24:48 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 2FB7C13800FB;
	Wed, 27 Mar 2024 12:24:46 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 27 Mar 2024 12:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711556686; x=1711643086; bh=UJopeHJafE
	4ynfWtKbtH+jOMtVdeecw64vT8RHYoSKU=; b=M8nw22BC5Jc6+YgGuZEEJHvgN4
	1WOtgveuzMq7F6eio77K833JalfQamnyFEaIeMDkcfaShNkDrqb0Tbd+nnYg3JWq
	fElG/TQMmXXy37K1pNMbywmzpCEHBp1QKTOfRrQlopoHnE4TJwxuX9NpT4nuk/V3
	DSS3MEazBuMY/8pjB29eFv1kvtICVcqGkiXkqDiQARw8M7E7TWYqkrBiUwrBodhN
	QRceIB8K2huC6Ihwe7hBQAHmV/zaNr3ZGljJwJVNqNIjppPGbfQGhJEBt7g3ZukM
	cXnrIScFo1WNmhDnFLsE3Kqh1W47H8a45YsLk7ozzHUu0KZnMykljmIqisgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711556686; x=1711643086; bh=UJopeHJafE4ynfWtKbtH+jOMtVde
	ecw64vT8RHYoSKU=; b=CSiI6ZpSwvSyqoStta4K13T/abyCW/44QncUg7Vzkt9O
	oerf2IGlqIVFvp+vb7BEcB9iYjEq1Og4okuF51TIM+vZkEbMawKsAvXlrTlOeYDW
	e+DfnwIwHVN0P22dtfTO5mFIeXGhrhpSfW8ieDK/7jESovzdgrghJLUqeQqM+zFa
	ToB7XXhdCBMd/wDEb1Uo0FXjBlNNVY/q58eIZvryRrn7Ga5s4Spp9B5V5r12cp5P
	8kGNgOYE4E/GsStIfbFu2VjrcQ+kSHYEQ+5qgcgmWBv+ixYeoiCTAWHDeU0atx2o
	cr5dxkU1sASLyb3/Xboy4pc91J5UJ7AqWiQmiEn+Nw==
X-ME-Sender: <xms:TUgEZqRr8K37HEj5tFh8GOVaaIg30nG_pTYe2Fgy8avFR4VQyLaZwA>
    <xme:TUgEZvxIOcvqU0yBw568TD3OAq0yitFpBv2rW8K16cpV2R6DWux4F7IH4xfR8bUWi
    DJJyjNqEIaHJGaeoIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduiedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:TkgEZn3TpsYY11f55HqU56zfF7zOIATMr7kIkcV-BuhtdLwJ1pVI3Q>
    <xmx:TkgEZmDGKRmeZUHbrX8T_IxTv4O-MS8JhkkZvAcNUfetQ1YeStQckQ>
    <xmx:TkgEZjh7x5ttRSheLHLMKuLd6py0hG8JwBP8IL_uROzwCBRrn9Ibzw>
    <xmx:TkgEZipjKjWX4P6JZvujqTiFZCfpl-yoRIIKXUPrMkuYOArQ5uUl0Q>
    <xmx:TkgEZuUBoPzIp3eI1Ad3vEG-MHJ23shuBE9kCNZF6_ooT5d1L9YrGA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E8D73B6008D; Wed, 27 Mar 2024 12:24:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-328-gc998c829b7-fm-20240325.002-gc998c829
MIME-Version: 1.0
Message-Id: <c6a7c834-8b86-4463-9022-1f32f048de6a@app.fastmail.com>
In-Reply-To: <20240327143858.711792-2-samuel.holland@sifive.com>
References: <20240327143858.711792-1-samuel.holland@sifive.com>
 <20240327143858.711792-2-samuel.holland@sifive.com>
Date: Wed, 27 Mar 2024 17:24:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: "Mark Rutland" <mark.rutland@arm.com>,
 "David Laight" <David.Laight@ACULAB.COM>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 1/2] riscv: Remove PGDIR_SIZE_L3 and TASK_SIZE_MIN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_092447_045731_32467B02 
X-CRM114-Status: UNSURE (   6.96  )
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

On Wed, Mar 27, 2024, at 15:38, Samuel Holland wrote:
> TASK_SIZE_MIN is unused since commit 085e2ff9aeb0 ("efi: libstub: Drop
> randomization of runtime memory map"). PGDIR_SIZE_L3 is only used in the
> definition of TASK_SIZE_MIN.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
