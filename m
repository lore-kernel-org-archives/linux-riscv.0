Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A55BC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qxv/H8gZAHOHAZU2/Nrw7w0CyohDEp6zh8q2jEvG2qc=; b=Dpaug9bwh5e7rx
	lwIkVhExO7m7PpChIRh+jNW57aHIZTisEtzk2DSKlvY1fTVXMmojgRsSqXybg9HL8IkDgmRjFd60N
	Ja70uXBmB9CL69h8IOxlYkCDtR1SMCiVR4dA+97aXgFcEZERk/jZ9QN61DxsHsoGKR3gQhWLzPSUk
	rqXApLqS9MOOd101Zg2g5wLKu4tvH2unYvceucefwF1xYjFdnwp6MiGnNfPQOQ7o50atCd2625/yS
	kAzkAoB4U6Lo0DtwoU7MK9rDw+xDeUSdoqTfQ4tcDzs7RcRqrwGUzuSxAKgqU75jeul31ETFC0AiY
	+rLOFC3wd4BGAF31CDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9ev-006G9Q-25;
	Fri, 31 Mar 2023 07:58:53 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9es-006G7O-0X
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:58:52 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id F15D35C01C0;
	Fri, 31 Mar 2023 03:58:46 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 03:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680249526; x=1680335926; bh=wH
	aFZh9Hjt71v1c/Rx3QN0Gf6IAjxia8M9ANG/7PiMU=; b=alX5bdCEDMDEuYnsGY
	iucLQv7b+7i/49as9dH58EZpEOY5EJ7tFCR6CH3KYDHdqaTUDBSrN9ix6SxTvOuK
	RXVYmGGDuIANQthZQpO5ycyI/bhajwGTOh0seZjerEpGD4BK0LgrTR/OKxjUec1X
	myW5ESxHyfLX44jhpKE8ASdQN/drjHC39jbNDhOtz/XuYPssieX2lQ+BRDJ7b7Jl
	wDzM9HVU+vFtBfkmpg8u5T6QWmNzDeBtLcFMvwGfA9JVaqCWAUWLjBYOaujQLEfe
	9W1pkxpXoc5X0WOQoEknBmMUWr26duTk3tr6FerxFCew9a4RxhrQhppGvuSc22Ii
	eTpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680249526; x=1680335926; bh=wHaFZh9Hjt71v
	1c/Rx3QN0Gf6IAjxia8M9ANG/7PiMU=; b=lOFo7bxKojH/ePY7knlvBmje9OV5V
	gAk/zPc9PytSlgFWPVulRG9PaF9ZIk/PUiFNe9cmHu8N9oPwKSOJOjkfBAvM/suG
	fFt1herjaPgjtkgOCQZh9gQiGVljbAdoJTtSLbYtiwCcLrZDOy3tJTY9UWRC/VsX
	AXdldjgnbBVEqkPd2dyd9uZckb/9RpjhwmzGc/3VqC695dBqPCLQlc6aIUKkSYTt
	2K2+EIk2L2EKKo5BCd6iGv7CCh2sOd/K+jzVhzV7D57+sZa3G4jQ9C/MPlQUsk6L
	Vi30Fw2QlVhMVfk68pIJjneX1Amp8uq1aKX1hJykno83ZxhCRgC884o/Q==
X-ME-Sender: <xms:tpImZFe0R5LrJjfZVziAaclxa3r3gUK2RftkazW6Abe0mgk2XuItPQ>
    <xme:tpImZDMPuK6H_FxYZlXtgaLYbb5td-oTgJLXyx7ovk4DldqHNzhvLFmj_U4XQe0jj
    dVavPtsveYX25Gww0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeitddguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:tpImZOiiavZKiAdFLvHv21kMcSBx5Nmsq3z0G444kPGg53uBE8YR4A>
    <xmx:tpImZO84h1zvkCjOtw8iH-yt0-Wco_jCxImi07LPYgHj-OQRNMa4-w>
    <xmx:tpImZBu8Ud1zpxVhotDPQlb5kQdk1VxBHvejmkemGuJA-trhf2zGHA>
    <xmx:tpImZBOP00k0sZkgqZYLG4AwRG_aWQenGN2-v3KvCkqAzgbyP4WR9Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 08457B6008D; Fri, 31 Mar 2023 03:58:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <887fe1ff-0bb7-485d-a7ef-262bab808c31@app.fastmail.com>
In-Reply-To: <c63bace6-1046-4428-97ba-6f12fd119dc6@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com>
 <c63bace6-1046-4428-97ba-6f12fd119dc6@spud>
Date: Fri, 31 Mar 2023 09:58:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor.Dooley" <conor.dooley@microchip.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, guoren <guoren@kernel.org>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Samuel Holland" <samuel@sholland.org>, linux-riscv@lists.infradead.org,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function pointers
 for cache management
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_005850_734471_8BD5F864 
X-CRM114-Status: GOOD (  11.12  )
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

On Fri, Mar 31, 2023, at 09:54, Conor Dooley wrote:
> On Thu, Mar 30, 2023 at 11:34:02PM +0200, Arnd Bergmann wrote:
>> On Thu, Mar 30, 2023, at 22:42, Prabhakar wrote:
>> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
>> > +#ifdef CONFIG_ERRATA_THEAD_CMO
>> 
>> I would rename this to not call this an 'ERRATA' but
>> just make it a driver. Not important though, and there
>> was probably a reason you did it like this.
>
> I think what was discussed in a prior iteration was that we'd leave
> refactoring the T-HEAD bits into a driver for a subsequent work.

Ok, makes sense.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
