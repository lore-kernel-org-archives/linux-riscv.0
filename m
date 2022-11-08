Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7301C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yMrnpPn4jfjjIPTduARa7EuwJriyoLqp+P+i8+qwuqg=; b=euelYR8wovfqw8yjkRw9W5gkX3
	j+Vt59SOYbQGyh0zm81R6A5xEp6/10WCCIlaX0eFPf3hzpeDxUXTimSSkl5vXCA4TDcl0yebuNdeH
	W8Mo/uq3TilA+2cTD150yCHWxwmKApG96y0X5SU3M0q2zDYwz2qBLXgqXx5JmCnHd6oYdj8jwzFyy
	pT6S+BZfhgAfni+FZtJYnWDI7KvZYjNT0e9tJ1st51YfliJ5ejuTK6VTL6sy+05ZVDz9PopTpgHGD
	4vdFrLzdKN6U/ktHdO6sjH62p+lgCLIT8cISRpIx2HAho41qDoHxOM2s3A42pZHiCt8KwClS8RW7E
	7e94F1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOsE-005gJe-1i; Tue, 08 Nov 2022 13:42:42 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOsA-005gJC-SQ
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 13:42:40 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A89A25C00E0
	for <linux-riscv@lists.infradead.org>; Tue,  8 Nov 2022 08:42:37 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 08 Nov 2022 08:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667914957; x=1668001357; bh=KhHdZKxWxz
	5qnyzbRbP0bRJtmXAnoBlvlc+sibXW0UM=; b=I3Kdl66mrRckRSNQxM6EjU0a6P
	GccswAgWJY6ZJ1srvOoSCKswLmU7P+nfQWjtufvP6fVOxxPOr0ARE/D/KDKCO+d+
	YPghQubodBvwdPX92S5Lj/GzFCSNabxl17V8dmL1i9E8cgu3z1Ol4R9XVSrxGvjT
	JjC5UbPlMRKGzRAfIqHGC2Wmc2J81yb6J+xWwPXomIpxHo/zzumT1RSkYLOhtz+2
	pWhXaxWB6Z35s3JUk2CbNwgs/igaw+/mSO4Lr4kpK6OsVWSlHKnvzlvk/6Ou4ecR
	DgcqCCrmtbHjZkFU2MpOgs5MOyJRi7AEZs3bdJ2kw9N00Wk3LyMJiDpQfw7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1667914957; x=1668001357; bh=KhHdZKxWxz5qnyzbRbP0bRJtmXAn
	oBlvlc+sibXW0UM=; b=p7JQgiZ8H5yFZiC55hJ/sx2b1HY37lj1qckXKBqhNKqO
	c3CnBn9PinpOV1gkQk2CblNIQx9elFIwCd7R5n9vsSj0Er4PWbvc4kA+DKPYAhO4
	F7HUbrwVB3mHGZzQdmrXrW4CDy7S5v1UlFNFqU+2j2+wrbXPLlRPOz4xBLX9gJ4Y
	BzBILN9ZLzOWfbhDq/rnW6l56G7QyICDjXo7BD8szK6zS8UqSx7umi3nYNkYLnqO
	7nLrGH51kW+D4omQOVE522FsQHbdzDwnuaz8E6csJob9EHIStW2luvYyRldypaF6
	lTHde5wvlYjiG4PFysf1E6LCAzpHA9Mhq5bL0uKT5w==
X-ME-Sender: <xms:zVxqY9lBHBY-7_UBE5cnSbhT5koeX28WNkzyD9CVvDOL6rbZJ3k1GA>
    <xme:zVxqY40bM_dJKS9cfQ8i_-dJ5ovmAmHoes_sTQFJXkwwvNnt2zc024uS1P3B4AGA3
    GQNXbcyHcTW8grrhro>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedtgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
    dtreertdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghr
    nhgusgdruggvqeenucggtffrrghtthgvrhhnpeffgeffuddtvdehffefleethfejjeegvd
    elffejieegueetledvtedtudelgfdugfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:zVxqYzrB3852k6zMB5R3QBKiyN4OzO1ooxT1ixrzDr9R04Zg9ZxzAw>
    <xmx:zVxqY9nNOs--pt82l8gTsG1Wr4MSaRg3hvku3msMKcrWtka3bnBhmA>
    <xmx:zVxqY71fSj9f-xxULXFl5L5LsUpZAJP_K3E6vhyLQDUuhxsXNJyhZQ>
    <xmx:zVxqY8CuNz68cOd3TwsZ8xSqP5S6QAIiS180nmFOHtV-edS58mgn3w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 722BAB60089; Tue,  8 Nov 2022 08:42:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <b3e107e1-475f-470f-be86-deb4bb68c9fe@app.fastmail.com>
In-Reply-To: <Y2paXPeC51GORPRX@wendy>
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
 <Y2lPHzaHvpWjEoll@spud>
 <f98d5faf-dd4e-46c0-ba55-9438615b434f@app.fastmail.com>
 <Y2paXPeC51GORPRX@wendy>
Date: Tue, 08 Nov 2022 14:42:16 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: linux-riscv@lists.infradead.org
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_054239_002414_6D211C20 
X-CRM114-Status: GOOD (  17.21  )
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

On Tue, Nov 8, 2022, at 14:32, Conor Dooley wrote:
> On Tue, Nov 08, 2022 at 01:51:37PM +0100, Arnd Bergmann wrote:
>> On Mon, Nov 7, 2022, at 19:31, Conor Dooley wrote:
>> 
>> I'd probably make separate entries here, at least for the
>> drivers/soc/microchip directory, I can see that being shared with
>> architectures other than RISC-V in the future
>
> (Added Nicolas to CC so that he's in the loop)
> Uh sure. It'd crossed my mind, but I filed it away in the "may happen
> some day" category. The arm stuff is going via the atmel directory at
> the moment so I was operating on the basis of "do it this way until
> something changes".
> Splitting is fine by me. As things stand, anything drivers/soc/microchip
> already CCs the linux-riscv list so maybe that can change alongside
> this.

Right, but I suppose there is a good chance of having more
crossover between microchip riscv/arm/mips drivers in the
future, and others like Renesas already have drivers/soc/
subdirectories that are shared.

>
> The one I was wondering about but forgot to mention was:
> Documentation/devicetree/bindings/riscv/
>
> It's mostly definitions of cpu, soc and board compatibles, so I figure
> it could go with the dt stuff - and it's covered by the generic RISC-V
> entry for the changes that reflect extensions etc.

Right, that works.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
