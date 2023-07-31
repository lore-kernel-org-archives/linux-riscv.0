Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902B1C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yd98JhCdpnYtKesvUvhBH3nPh7OnfdQ8eGwTrm32nZE=; b=I9dHDjsE6zwEWj
	hn/LeoMvDASGkcLiNvGwWDns037h8t1/2D7Z2mIUcsLEfORArYHZNIJQ2qECoZizoYuOZ34+M7YOK
	COuCfXoV1boCSvFjql5awho3kv2+9gTflBMlu85FysSPN1HVnrFGL7YlE0d4RhAr5DA6AUzFXw5rn
	YS6nYegBGrqjtRV5N8d96kkfsehqniyjCBuGCJFPEaA0P8+tl6lyTssg9nm43ziP8icglTJtKpNd7
	GbuIImAaNdAOVnG2PkGMqiJN+bxA/2O+MX9/iVJZRE6AcR92l7b6XTNbgh++a1dmPiMkG2sjhgH3K
	V3dh2UlkAE8b9FEKSamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVL8-00GVws-1U;
	Mon, 31 Jul 2023 16:01:46 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVL4-00GVvz-29
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 16:01:44 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C96BC5C006E;
	Mon, 31 Jul 2023 12:01:37 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 31 Jul 2023 12:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1690819297; x=1690905697; bh=d5
	dF3/UEnHkJTXw+9iMGuzyye12DF3XcugC4tBkJDDU=; b=m0kNMmJmwpdMk9chUj
	Nv47pJkPnChzBqAd6DmYtxnmKj8N2cnzD9rAbIC5oOiCG1970Tj0H0JG2F3ma+X8
	fLlXR+Brrw6bOfWXs1VdFOopemuq088FhpAxOjx00xcGSOP6AMMF7uzowenBruCZ
	g5GXrFh+meQ1HKFYRJEDNgFVxKl2qEMaCqq75kqhcNT9+j1mgtE3zoYdHYomaMvk
	4/1CciGNH/94Rk6GRiO4yQywuGljf4ZzdNLySgf1v83xB49hA+TtYzjWoXZcPPnZ
	QSATIzdpRxYso0zZq0+oph+qDifZPdPPT3DMrzg2QeCvP6US1+IWhx5rHpiX/W2p
	yQrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690819297; x=1690905697; bh=d5dF3/UEnHkJT
	Xw+9iMGuzyye12DF3XcugC4tBkJDDU=; b=Tb1mOB+s43WvrIiDpGmlcvMLu8434
	YfNGjrSQDwygtj1XXkRvC7p+1WqeWmsf4jDCzEhikiUT2H7rAtvsyv8jv6uspwdN
	yjyIFcGD0hwrz7Fl2eCcnPR8U7/SX9ZVUlna1ZmUdkJYcpE/HuUG+M5aVy0YbGUB
	X5Ld2xYbruwfkPmsME8BbQPcgFVqcXYYs4ON7wS0NZiSX8YUX/aZ5OtAcvWVljzi
	Ldf8BEozpDUgwU2I6oFUFELIM4r31t56cMUrsOFih2kd5RGijziCJjU757EMHV+o
	KVVBjOsCWvx9I77SuL9LjUVqgPNwcKv7YbglWGIGUvJNiBR9BFqRHX1cg==
X-ME-Sender: <xms:3trHZC9LlanB8jArCNsV04YyeOgDFeZImBJ7BDxQ_B02VJ-mD7kooA>
    <xme:3trHZCtZZ6_9ydxxnjzOhH6m8WHjAkKxXgnubZupSfM18frTAhcN4aGV9VZXydC93
    2a8gBPBHhn6kEIAclc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjeeggdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:3trHZIDxIf6E1MzJcCXi5ok_er88S2F7m5gAUUJPplTWNHHhQmgfug>
    <xmx:3trHZKc_UJqqB8QjXrRfzY-MVn3MYDCmX6YVvCsKhsgLkP2ZGusS_A>
    <xmx:3trHZHPokom41T-Zan2EXJx0fTw530OGM5mFfq0KmluUF-XslDUvvw>
    <xmx:4drHZCE-DX7boRJ-NF9q3Jnqy41iEV_O1xdMal0pELSjSAopxs8iAw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 597ABB6008F; Mon, 31 Jul 2023 12:01:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <dd614e72-dc04-4dd1-b2c8-b16166c3c21b@app.fastmail.com>
In-Reply-To: <ZMfWuHPdcHuIeUHQ@xhacker>
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230702203429.237615-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZMZ6XB6gX2kFd/Nt@xhacker>
 <CAJM55Z8vF8_xq0QyByLUGM2W-8m6R-_6SdOFdLETV7J-yo5DMQ@mail.gmail.com>
 <92c00ddb-e956-4861-af80-5f5558c9a8f5@app.fastmail.com>
 <CAJF2gTTRHzT+CEtb1LVYdfCorVUdLvCh_eMxrmC=xjdQ_JS6Sg@mail.gmail.com>
 <8b3466e4-a295-4249-bd05-2edbf7b3f6e3@app.fastmail.com>
 <ZMfWuHPdcHuIeUHQ@xhacker>
Date: Mon, 31 Jul 2023 18:01:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: guoren <guoren@kernel.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Emil Renner Berthing" <emil.renner.berthing@canonical.com>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Samuel Holland" <samuel@sholland.org>, linux-riscv@lists.infradead.org,
 "Christoph Hellwig" <hch@infradead.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v10 3/6] riscv: mm: dma-noncoherent: nonstandard cache operations
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_090142_796570_D4C9EAD7 
X-CRM114-Status: GOOD (  15.47  )
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

On Mon, Jul 31, 2023, at 17:43, Jisheng Zhang wrote:
> On Mon, Jul 31, 2023 at 07:39:30AM +0200, Arnd Bergmann wrote:

>> >> Not just the flushing, but also loading back the invalidated
>> >> cache lines afterwards is just very expensive. I don't think
>> >> you would be able to measure a difference between the static
>
> I read this as: the cache clean/inv is so expensive that the static
> key saving percentage is trivial, is this understanding right?
>
> this could be measured by writing a small benchmark kernel module
> which just calls cache clean/inv a buf(for example 1500Bytes)in a loop. 

While you can trivially measure the cost of the clean/inv operation,
I think the higher cost is the fact that the cache lines are
invalidated and have to be reloaded when accessing the data the next
time. So if the loop test shows that the static key is not worth
it, that is a clear answer, but if it shows that the cache operation
itself is cheap, that does not automatically mean that the
static key makes a difference compared to a cache miss.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
