Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A608C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 02:00:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55DD2086A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 02:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZU24puE8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P1d7QUMG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55DD2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIczgPNEJTLF5G2+LHmE/x0EgYYI2YaMqWj2oBnZ5U0=; b=ZU24puE8fkPgWj
	blD6iXefiJEHfcmYeFvnwDtaJN78z0q8+t0Pzaw9a8LxkzvRHlxkyPvqPSL9dqn8b8I84yzlRgoq+
	NFOpvFQgOlQD/xUXiUIh8lnpDDgB9tI7H0xbpiaZsLuPmsRDFBhL/ic9PcFds+zoCUs0lhDjDtTXe
	ElGU6fvZbFbhvTzDqwswjSuF9rrUcWG3swadVCl9muRpTk7+ik48i95IiOY3HYSX8K1LDVoBtYrBe
	AR7jD02TzJn/tHO780RNiSFpBcw5ERYKezApBpyS1vSdu8yCEhP3H4fxsTHbN0NNvotKBFnwldH8N
	bI6QqjFtLCmA7hZSa/Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKD9G-00086r-1F; Wed, 07 Nov 2018 02:00:50 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKD9F-00086i-Bj
 for linux-riscv@bombadil.infradead.org; Wed, 07 Nov 2018 02:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/K7OFvi1YwAAxl+DRJ4EPogH+3Vo3+lwjNXw+PIw0+c=; b=P1d7QUMG3LkRSmP+0TCiS90RL
 PLqdKRK2aXA9xmuG5oIl7uAShwYH6oU+0gUCEqniN0t8WPVjAXZcSV8al8hxznFKQHSKiGjoXMf/t
 SrCgYN2bomfTfdvmGj4G1kFpwW4Pi0HyN9LzOJP4YbQSqgloft5rStDFtSzoZjCTdrABMO6ARl35y
 uE6MOQXckz34tw9CuM5u+bPSE1gzhERGx1ud5a8mYEeg/txDkbM65BIM9dQg+n2G9O3hfhIC1Oq1K
 kzL7x924gOupGbOtCOEVNLm1RJbQx4UmUFuDa0zyy7oTkFlJNJcosOFt7BVr5kyOKvAeDbFqvJ7lH
 OuVlp/ntg==;
Received: from utopia.booyaka.com ([74.50.51.50])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKD9B-0001Th-1v
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 02:00:47 +0000
Received: (qmail 30180 invoked by uid 1019); 7 Nov 2018 02:00:30 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 7 Nov 2018 02:00:30 -0000
Date: Wed, 7 Nov 2018 02:00:30 +0000 (UTC)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
In-Reply-To: <154152561238.88331.13239370518226908068@swboyd.mtv.corp.google.com>
Message-ID: <alpine.DEB.2.21.999.1811070159350.29982@utopia.booyaka.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com>
 <20181020135024.28573-3-paul.walmsley@sifive.com>
 <154152561238.88331.13239370518226908068@swboyd.mtv.corp.google.com>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_210045_170355_42C91A81 
X-CRM114-Status: GOOD (  13.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 paul@pwsan.com, Megan Wachs <megan@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107020030.NSY-zVGiBxeIsL75I0hC2dMYkSYgLZ3s0NZ-lzTi1eg@z>

On Tue, 6 Nov 2018, Stephen Boyd wrote:

> Quoting Paul Walmsley (2018-10-20 06:50:23)
> > diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> > new file mode 100644
> > index 000000000000..d7c1e83fa5ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> > @@ -0,0 +1,43 @@
> > +SiFive FU540 PRCI bindings
> > +
> > +On the FU540 family of SoCs, most system-wide clock and reset integration
> > +is via the PRCI IP block.
> > +
> > +Required properties:
> > +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time this
> > +              file was written, only one value is supported:
> 
> I don't think we need the "As of the time" sentence. It will become out
> of date almost immediately so why not just say "The list of supported
> values is:"?

Adopted this change.  Thanks for the review.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
