Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9952C9833E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 05:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bijYir1ul8nn/8JZal4zazJdEW+yCUZ8FIvl+D8moxA=; b=GYiKVwW+GINnjp
	p+hGKHVSN3jqN/TYMevkaCJ+0EjUN2XjIDGmJGPYNnheBBzSgGopccibHwvSfaIyffbabKIRcz4Oh
	UhU28INXlocGdD8jHGRtQBjgy1GuPvQzxoLp+8N0Aiqk6ZPfPWrnaq4fAcn7AVk/LSOYp3Jq9R4uh
	Ernw1vyLUMq1XasMq0dca9Q+4SG52Chjrl+hXwZ5UQx9h9Y4vo0tyLvnp8zyFMcPdZCINmacFrinn
	WlJEKNy6Ul26ONyX628IpM2sio45Xe54CLCAL438hcWEep6Gz63NgL2p2xC/8RIwYl3ePXUgzv3Zu
	4WBWnoYpOmnhOyXdCabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3kK-0000000HLpS-0gil;
	Mon, 28 Sep 2026 05:17:48 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3kH-0000000HLor-0qEh
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 05:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=g0urVNX8ATEeOHGXP86K6LmXYM7IrN5hrV8PI7/e+Bk=; 
	b=dFMmu984dAtawQ423gsVyUC4zFZWVprPabJ0C+rVE9whvBqO8AgEKSe30ieqccgf2TP+pXT6RjP
	3FflfBCIRHkUB8IQZcLcXAtwk9qyw+LX1BBBLuHrElqAvYHO7n/k+toyUP6oQNI+L4wqc0FsQGjUf
	cMuVr6oWRqa59fs3XU+Ij/DkBGDJAmvZ1d1aLTexcjlFMQOagnpklv4gJlxk4cjO4NPMzgqkGROaP
	TkOhCfnmm1iACvdIxUIXKjdLNw8niOmqwn+o5pIVGt/K/z9Evsh1x0N9mg/XJ/d7KiJ5ymii7XOYq
	3T5Xgm1QUu7ZS8oY0wlBTnrQG8Q5gVKVLtPw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xB3jp-00000000w9f-3e6c;
	Mon, 28 Sep 2026 13:17:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Sep 2026 15:17:17 +1000
Date: Mon, 28 Sep 2026 15:17:17 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Ousherovitch, Alex" <aousherovitch@rambus.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"Krishnamoorthy, Saravanakrishnan" <skrishnamoorthy@rambus.com>,
	Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Wittenauer, Joel" <Joel.Wittenauer@cryptography.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Nguyen, Thi" <thin@rambus.com>
Subject: Re: [PATCH v5 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Message-ID: <arn4XYwPYt6i2k7d@gondor.apana.org.au>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-5-aousherovitch@rambus.com>
 <arNn_fjy4jamSitO@gondor.apana.org.au>
 <LV8PR04MB9006374FD8621EBF3C7E7F6CD7822@LV8PR04MB9006.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LV8PR04MB9006374FD8621EBF3C7E7F6CD7822@LV8PR04MB9006.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_221745_247033_0E3AF9E9 
X-CRM114-Status: GOOD (  15.29  )
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

On Wed, Sep 23, 2026 at 08:50:55PM +0000, Ousherovitch, Alex wrote:
>
> - shake128/256, cshake, kmac and poly1305 have no matching provider
>   registered in this tree, so the allocation fails and the transform can't
>   be created at all. NO_FALLBACK is required to instantiate them.

Hang on, if an algorithm isn't even implemented in generic C for
the Crypto API, then it should not be implemented by a driver
either.

The reason these algorithms aren't in the Crypto API is because
they have no users.

So please drop them.

> - sha2, sha3 and sm3 do have a software provider, so the transform loads,
>   but the auto-fallback can't stand in for the hardware on the streaming
>   path: our exported state is the opaque HW save/restore checkpoint, not
>   the canonical state, so a multi-part export/import round-trip through the
>   fallback misinterprets it (and for SHA-2/SHA-3 the statesize exceeds
>   HASH_MAX_STATESIZE, so ahash_do_req_chain() returns -ENOSYS). A one-shot
>   digest could still use the software provider, but a fallback that only
>   covers one-shot and corrupts streaming isn't usable.

Sorry, that is not supported by our API.  If you cannot export the
hash state in a compatible format, then you will have to switch over
to fallbacks and only support digest operations.

Please also elaborate what you mean by opaque checkpoint, does it
contain the entire hash state or not?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
