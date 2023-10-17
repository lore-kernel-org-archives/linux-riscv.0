Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9FBCDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVoad2X/C3Tw1xa3ltG47/NfaJE7Gl+NYBDLpZPJkm8=; b=jRGSvALtWVGW/o
	X0vV3bOOiNx6YbGQn+q3qu2OXTg5TGsdXm7gDqkGlT0Jo5eQhNgr0eVhf2OtPhxiSBhlloLLr0JYx
	ZAl0SaT1wG5lB1hBxSb3RMiS9I34xIcYfa/2kt58YJifQt+UmMGkF0o7GAc0MxJIhPZzgTo4U6Lue
	ZP0z1bJkEmkkh3ZgW7kXfJsrwIbyI9oBbDsSlYmVQEU5kYsBF5NCMvlhjaT6hND0vn16gWYtnB8jy
	0bT1g65MJVGKb1f5BijcQEoEnbCwn6zLDj8FLXkYXBkQLIDjDYDkkTgPOAUwahuZrQyHhtxv7MKA/
	ncU762nh/k1QzMnYpJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqku-00DD5m-19;
	Tue, 17 Oct 2023 20:33:32 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqkr-00DD4S-24
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 20:33:31 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id CDA843200961;
	Tue, 17 Oct 2023 16:33:23 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 17 Oct 2023 16:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1697574803; x=1697661203; bh=cg
	bPgTwtbWNC/kz5R2sNNRcl3eQ5WTXZbD/ST4Jxbxs=; b=oURQgf2xAoP9T/KP/K
	rjdiyvH+PMU9nyFZWwf0GIKwhSAnnKGxreOxvHftu1NRJoVPs+xoF26hMXTQ1yYW
	+aj0FycJnG1A7b0oGgOBJgv0OByB9rh1MqfxNtpjiAmPGzmRBKMX0yyNKhsZidmC
	3O93wWx4+3YiI9ETshW9Un7Li9A9jZT3fD2kZuoav3AN85Jv5b86Sss1aHVj4+oU
	P3yyJS1EiGteNhu49ZilKVAt1pwGI3/Qhi7LdW/uwzus659hiKWK+E/6eQMwfDUu
	F4pwJZCe4wPCAw3eUYqjVoegGP9YDbxATq13yyuWMwYD8YJrvciUo9GVv7Q5mxLa
	eDrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697574803; x=1697661203; bh=cgbPgTwtbWNC/
	kz5R2sNNRcl3eQ5WTXZbD/ST4Jxbxs=; b=Vpdu6sY5QvhVCx6gwaNoiJ0J6NcSV
	Zq6z4FW62Y+xg3RZidXgnwF28Uhs8wz9BHEhkQVlTCYDkTBjSVDseCBokbUZ9zPs
	9nGTHeLKQA88vLgs+h6cdqW3GhYk+MYkL4W0X6/sGgLVpR9TcQ0VRwx/PKcxZ5wB
	MP2gmP8Lo5EUgMnwMi68eVLFj7GoACIzQ6+Qzeqdwk8j23VFTulGuxB0XTLXwjeM
	EysLNY6zf6JG7u6lU7Qk4Xli2NFXZy3xjoaXit8UEK3qohSd4PKORuDJ0rn1WceB
	AZiEuESuJhRtW7v3Mv5qbUS5wKU0ko6w+2lwplRD0EZXTLmz6IV2X+iJA==
X-ME-Sender: <xms:ku8uZRrMd4VAcuWPQ-YWR-TUjFKqaKIJRzXyz4pnsAhap8wJNWuHOA>
    <xme:ku8uZTpfT3EhuPrmheeW4eXAo4nLpNOYE3QHvDX4v4hlQoKdxKDFzaisk5ZNk-Evf
    A9ir2BUID4d-U0fQXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjedvgddugeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ku8uZeP_MZu0HcSiE0FPN6XeBwUmutE4zwPbQ9o6lSiCALkL885PrQ>
    <xmx:ku8uZc5RVwSM7k6HQfoiQp5W0WUuvxkUjnPjhwkDKXMpZhPbpP1qKA>
    <xmx:ku8uZQ6t2JYfWLg9Q93As-Hd-FptvYojnraVpYUM9akFWkA9rjmqgw>
    <xmx:k-8uZQx7OMiL7bQzd00Wr-r5VxAf4bZB_FksYcXsmZGoaRqY1A1YRQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DFAA2B60089; Tue, 17 Oct 2023 16:33:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <21a226f5-5e68-4b54-9768-98f10e3fb417@app.fastmail.com>
In-Reply-To: <ZS6x18XEJXmB7FFL@xhacker>
References: <20230912072232.2455-1-jszhang@kernel.org>
 <20230912-trailing-pampered-52738ec6f009@spud> <ZQHSLdPufI6CXApg@xhacker>
 <20230913-faster-spotted-9df41a0d7787@spud>
 <20230920-pesky-stalemate-88f5036b8084@wendy> <ZQwL6fxi6IkUEIMc@xhacker>
 <20230921-4a1fe80384e083c67f38dc27@fedora> <ZS1uiXORq2IRPnId@x1>
 <ZS6x18XEJXmB7FFL@xhacker>
Date: Tue, 17 Oct 2023 22:33:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jisheng Zhang" <jszhang@kernel.org>,
 "Drew Fustini" <dfustini@baylibre.com>, soc@kernel.org
Cc: "Conor Dooley" <conor@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>,
 "Fu Wei" <wefu@redhat.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_133329_709673_7F7AB44B 
X-CRM114-Status: GOOD (  18.18  )
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

On Tue, Oct 17, 2023, at 18:09, Jisheng Zhang wrote:
> On Mon, Oct 16, 2023 at 10:10:33AM -0700, Drew Fustini wrote:
>> On Thu, Sep 21, 2023 at 11:08:28AM +0100, Conor Dooley wrote:
>>
>> Hi Jisheng, I'm writing the cover letter for v2 of my th1520 mmc series
>> and I am wondering if this dma-noncoherent patch is in any tree yet?
>
> Hi Drew,
>
> I forget this patch. Thanks for reminding.
>
> Hi Arnd
>
> This is the only one dt fix for thead SoC, can you please pick it up
> for the upcoming -rcN? I knew soc people can directly ask for pick
> up for only one fix in the past. Let me know if I need to generate a
> formal PR.

Applied to the fixes branch now, thanks.

There is no need for a pull request if you have just a single patch.

Just a few things to consider:

- For both patches and pull requests, make sure you have soc@kernel.org
  as the primary recipient so I know that I'm the one to apply them
  and see them in https://patchwork.kernel.org/project/linux-soc/list/
  I get Cc'd on a lot of patches and would otherwise not know if you
  are looking for them to be applied or reviewed.

- Since there is no tag description, add a comment under the '---'
  line asking for the patch to be applied directly, and say if
  this is a bugfix for the current release or if it should be
  queued for the next release.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
