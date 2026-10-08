Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BBDCA600A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYn3iQ10aCFLlUI/MhoLNl+kRrarQFbYSxZf5StKzFY=; b=2yS4Y5GvHFqyJ7
	bPdhUQEcs2bZbgtHXYXceSiH32n9nVEmMlcwAJ5BWhZKEXbbzPl0H96s1/Eewmg9m39DDAQeDzLU+
	oqDo6f3jz+wBQBC4EOmzbO6zdqOmI9S1cffKSX1vkmnhRP46g8DNflSBsSGUl2oi7UBSai0HsJd3a
	37mE/GMyp8LhZUNMHZp/n8xUkGNruOYH2KVo/pYTu5P6bf9X5ztxvTs2CrLM+v2D/W7xnHIh5PGKV
	9nGpYTgtgNCg00EKccuYuDVvrPMkKfzLUujxvKJuVCpL4Y53dWf6HLEA7T6v5nNc/7ObrS/XWq1Gi
	9lb0wHwgm4N4vnp5hC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjMy-00000003qnv-0997;
	Thu, 08 Oct 2026 08:20:52 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjMv-00000003qmx-2dZk
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 08:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=f+02SRQjVsyruBBOH2rFMcrG5d5kk7OJLtCYx/Hk4oE=; 
	b=qIxLCF/QxXzMTk8lXa6At1c596QKDAvp786bHbFiuzcoMfTd4O27ktRYjko4QEFPll8B5QiNvUQ
	KjGZLkLw9w2S1ILK199IhveDxcNy8oYIjU3nsJukTri5cRbTy16PJaBnvmzDYCu5NyV0Eg2wKh9fU
	wYgE9FNQX5ANkJlTFxjVlvjOomN2D4D8KppBmrsYoAjuCBnLSFZ18GXH9rh6RmPjKe2wg1xe9mVHh
	KVnUmsOMDu5PjsDG3ABak+ExL135uwuVuqZz2fyImsjiOMaOf2m1Z4y7i3evsCdIf7K/4IqlgBj/a
	AQlX307+j3t8F4NoSqi/b6qPSItUhRX3ZLeg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xEjMY-00000001nfj-1PAN;
	Thu, 08 Oct 2026 16:20:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 Oct 2026 19:20:26 +1100
Date: Thu, 8 Oct 2026 19:20:26 +1100
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
Message-ID: <asdSSjBML72-YaGq@gondor.apana.org.au>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-5-aousherovitch@rambus.com>
 <arNn_fjy4jamSitO@gondor.apana.org.au>
 <LV8PR04MB9006374FD8621EBF3C7E7F6CD7822@LV8PR04MB9006.namprd04.prod.outlook.com>
 <arn4XYwPYt6i2k7d@gondor.apana.org.au>
 <SJ0PR04MB8406AD1C92438FBCBA2EEED4D7962@SJ0PR04MB8406.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SJ0PR04MB8406AD1C92438FBCBA2EEED4D7962@SJ0PR04MB8406.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_012049_671692_92364A2B 
X-CRM114-Status: GOOD (  19.48  )
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

On Mon, Oct 05, 2026 at 05:04:25PM +0000, Ousherovitch, Alex wrote:
>
> > Please also elaborate what you mean by opaque checkpoint, does it
> > contain the entire hash state or not?
> 
> It holds everything needed to resume, but not in a portable layout.  The
> SAVE output is a fixed-size hardware container (600 bytes worst case)
> holding the core's internal state, the buffered partial block, the block
> counters, the mode and a CRC.  The state portion varies by algorithm:
> 
>   - SHA-3/SHAKE: the 200-byte Keccak state is stored as two shares (the
>     core is DPA/side-channel protected), so it is not the canonical
>     state.
>   - SHA-2: a single 64-byte register block plus the partial block and
>     byte count, in a hardware-internal layout.
>   - Keyed SHA-3 HMAC state cannot be saved by the hardware at all.

So it sounds like the info is there.  Is it possible to transform
this to the format that we use?

> None of these is the canonical export format the API needs, so the
> fallback/digest-only model above is the right fit and we are not pursuing
> incremental hashing upstream.

That's we have the export and import functions, to transcribe
the hardware hash state into a standard format.

> One process question, if you don't mind: we would like to fold as much as
> possible into v6 rather than spinning several revisions.  Have you had a
> chance to look at the rest of the series, or should we expect further
> comments on the remaining patches?  No rush at all -- it would just help
> us decide whether to post v6 now or hold it until the rest of your
> feedback has landed.

I would appreciate it if you can break the series into smaller
chunks.  Perhaps add the algorithms which are the least problematic
first.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
