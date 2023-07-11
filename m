Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBF8EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 23:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgT8XxkqqCCDibOuxnlNF74az10zeA7t4bjHfS+D0UE=; b=z9EOP8w97PSkyS
	BhLPkdxIaDyopgQgr8TVcQUGGNkHzfb26KpVyp/5azNgLEnsMq/9RW0oDCU2eck5eNY/tzrE68low
	0xmb2Q2h4M6il257UufmbADpXhS2gUxjNLkgVAIEGdY6Bnux1LYmi9hnJfj8sIDwa1+nru3FdMSTC
	nduy/nj3uz/Al7K9HhzNZQdslL6Su3KVad3diOjI42S4h+KHcExY6Tcrxz1nkjByBiCrVlHZYlL+t
	zWLFcV6FRWy8ODjzZdm2LLI/urrtltkjGKyLW7aEkUzKXLg+ztehI1Kzj385coZfPjsFlmdglXHh9
	Tal22CMJjJXCaSHRrXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMmw-00G3sj-1G;
	Tue, 11 Jul 2023 23:28:58 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMms-00G3rV-1c
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 23:28:56 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 9A4E4320091A;
	Tue, 11 Jul 2023 19:28:47 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute1.internal (MEProxy); Tue, 11 Jul 2023 19:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1689118127; x=1689204527; bh=Qk
	480Cju6SmeRzg2rYBse8OkO4zCrxLYXJOc7D6RYwQ=; b=kxXb42NpaWW+cHvDk0
	9tDTG8Shzm2fI5EkJDP6lGSpgk2dnUvgvvP6AAADD1vzO2Oa1WaS2m8c4fOTnmF9
	fKTTW7w6tK+B16xL7DZVlZ4nwNXSz3x6mIdSVeOfu3SAnaXkJiXjfd6pWSQ/+4a6
	s+H3mRrvU3zFFjErvQsU3wm+cmcuyV/Zfv6XwfeaBlWt+OYl83EjSPf02xKmC12w
	aPWWDB5adz9HKuVgw/RIq9Zgeuh89pI9xtQJ/YvygUi8rVgyYr1c+a7qrjjVG2Bm
	6B0I91DsEBmyv3m8HjM9ZZrXO7JW6naGwZ0hN8LBvqcHouGxxpe6V6xQMzTylLnX
	DVJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1689118127; x=1689204527; bh=Qk480Cju6SmeR
	zg2rYBse8OkO4zCrxLYXJOc7D6RYwQ=; b=EI7ilGADKvuMigj38QVEMWejEPjtq
	C9uXlKIqto+DlE8FDJzs/sI0026SCFORHz+08xJoEXdtJZb1Z6NddpMJBhHHe98S
	LRQGFN39OhYdSXcsLEfp4ISDw5MRX5Nctdh4yjGJ6af/6SE178eZ5eDH04trDvKn
	eTefXf4DMd3JqIGWERcxbdWt/esNcXvLeRMPOWOUfT91EoIcn9oUnh2xWONXCfHx
	QsvyoD2gsCxQGB6XJr/xllzVpwC9jGUJw9BLDc2uGkPAJNs5NLTQTkXMVqj1/pNA
	TiX3H3Cs+Cli/sBlx2ib9RmKY739FZPSsFvR29+BiW8Du25fqONmzrxlA==
X-ME-Sender: <xms:ruWtZDE6Ob68emoMsrV9SOfCzCv77dimOeK9UFuklPtRkHbfYGvksA>
    <xme:ruWtZAXpx9Pvj5HBcYocvwBJ512ZE8xsSR_UnFBYkwwHJqMzGSB3k7q1IeUIucd1b
    RoIO1fPz1yroSwy5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfedugddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuthgv
    fhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejueehgedtueetgefhheejjeeigffhieefjeehuddvueegtdfh
    heevgfeggfektdenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsohhrvggrrhesfhgr
    shhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ruWtZFINdeVy2Tu7AFvjCQh5HLPtp41lNBD9P5BWs7DwZezURBZM2Q>
    <xmx:ruWtZBHESYX33_ZX2cdWtqo081vGLJZoYKxZL_WY_k5XX6aJnxSs2Q>
    <xmx:ruWtZJWFf8Dc8EXhuDLdDfLeKQr71vJdeqgJlhRWSwA8qPMWkI8zeA>
    <xmx:r-WtZIfgFADk3lWllqWaYK9UyBemtvNq-6lngyFHo7R8iuqu_QhZ6Q>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DB8D0A60076; Tue, 11 Jul 2023 19:28:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <33dd566f-adfc-4148-9bef-362935ddb606@app.fastmail.com>
In-Reply-To: <20230711225212.11542-1-palmer@rivosinc.com>
References: <20230711225212.11542-1-palmer@rivosinc.com>
Date: Tue, 11 Jul 2023 19:28:25 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Palmer Dabbelt" <palmer@rivosinc.com>, "Conor Dooley" <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: RISC-V: Re-word the I extension binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_162854_584613_DCB61314 
X-CRM114-Status: GOOD (  20.74  )
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

On Tue, Jul 11, 2023, at 6:52 PM, Palmer Dabbelt wrote:
> I'd argue this changes the definition of the I binding, as there was
> more than just the counters that got split out (CSRs and fence.i at
> least).  We haven't released these bindings yet, so IIUC it's OK to
> change the definition still.
>
> I think this matches the original intent, or at least what the
> implementation does.
>
> Fixes: aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml        | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml 
> b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..31ec244bd32f 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -67,13 +67,11 @@ properties:
>        anyOf:
>          # single letter extensions, in canonical order
>          - const: i
> -          description: |
> -            The base integer instruction set, as ratified in the 
> 20191213
> -            version of the unprivileged ISA specification.
> -
> -            This does not include Chapter 10, "Counters", which was 
> moved into
> -            the Zicntr and Zihpm extensions after the ratification of 
> the
> -            20191213 version of the unprivileged specification.
> +          description:
> +            The base integer instruction set, as specified by the 2.2
> +            version of the unprivileged ISA specification, formally 
> known as
> +            the user-level ISA.  This definition of I includes various
> +            extensions that were later split out.

Nitpick: the 2.2 unprivileged ISA uses the pre-ratification memory model
(essentially Alpha), which is much weaker than the memory model in 20191213.

-s

> 
>          - const: m
>            description:
> -- 
> 2.40.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
