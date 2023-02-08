Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6CCC636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvo7BUF/x/SgQyxrBcHvEjGu7dNa0rAvnQCE53oWA9Q=; b=b/sY3QKDWVs7PW
	RS3YSEBlUU+sIV5YmlVChC/sE0NAhHHd4dyQs7TM+ZJrQHQ02Po43RtDf1sxEIf83cGPH/E3i6MQn
	ZjBx+OXnK+TDRFBGKiAvkOzVAi6zUAgu7JP9ZqJYfbb0jmxGbri/IQ5XkpoVIUUGXwT6TFaTegk+9
	bg+lK/vPfXnns0xsagH52EKSJTfuKMGVrURvwifGWZvxtt/AZ0e7mXbCp8yBcqlptYq91tM5pk8wv
	oQg287GXj8dyLIB/3WFcRyuLyDi8u2egNx+nq2KNvH/2AocvveEyjJY8AgTsP2JDT235Jyb35cbed
	SUUSgpO9ahmFdD8yZ7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjp8-00Fddb-T1; Wed, 08 Feb 2023 12:45:18 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjp5-00FdcS-TS
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 12:45:17 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-189-p1NzTKurMx-XOzJkMOJ9Kw-1; Wed, 08 Feb 2023 12:45:12 +0000
X-MC-Unique: p1NzTKurMx-XOzJkMOJ9Kw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Wed, 8 Feb
 2023 12:45:10 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Wed, 8 Feb 2023 12:45:10 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Rob Herring' <robh@kernel.org>, Evan Green <evan@rivosinc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	"vineetg@rivosinc.com" <vineetg@rivosinc.com>, "heiko@sntech.de"
	<heiko@sntech.de>, "slewis@rivosinc.com" <slewis@rivosinc.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 4/6] dt-bindings: Add RISC-V misaligned access
 performance
Thread-Topic: [PATCH v2 4/6] dt-bindings: Add RISC-V misaligned access
 performance
Thread-Index: AQHZOxZ0HOszyZvzhUaVsFXdLDVyyK7E/WfQ
Date: Wed, 8 Feb 2023 12:45:10 +0000
Message-ID: <4bd24def02014939a87eb8430ba0070d@AcuMS.aculab.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-5-evan@rivosinc.com>
 <20230207170550.GA3719881-robh@kernel.org>
In-Reply-To: <20230207170550.GA3719881-robh@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_044516_237064_61AAC6D0 
X-CRM114-Status: GOOD (  19.23  )
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

From: Rob Herring
> Sent: 07 February 2023 17:06
> 
> On Mon, Feb 06, 2023 at 12:14:53PM -0800, Evan Green wrote:
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > This key allows device trees to specify the performance of misaligned
> > accesses to main memory regions from each CPU in the system.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > ---
> >
> > (no changes since v1)
> >
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml
> b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index c6720764e765..2c09bd6f2927 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -85,6 +85,21 @@ properties:
> >      $ref: "/schemas/types.yaml#/definitions/string"
> >      pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
> >
> > +  riscv,misaligned-access-performance:
> > +    description:
> > +      Identifies the performance of misaligned memory accesses to main memory
> > +      regions.  There are three flavors of unaligned access performance: "emulated"
> > +      means that misaligned accesses are emulated via software and thus
> > +      extremely slow, "slow" means that misaligned accesses are supported by
> > +      hardware but still slower that aligned accesses sequences, and "fast"
> > +      means that misaligned accesses are as fast or faster than the
> > +      cooresponding aligned accesses sequences.
> > +    $ref: "/schemas/types.yaml#/definitions/string"
> > +    enum:
> > +      - emulated
> > +      - slow
> > +      - fast
> 
> I don't think this belongs in DT. (I'm not sure about a userspace
> interface either.)
> 
> Can't this be tested and determined at runtime? Do misaligned accesses
> and compare the performance. We already do this for things like memcpy
> or crypto implementation selection.

There is also an long discussion about misaligned accesses
for loooongarch.

Basically if you want to run a common kernel (and userspace)
you have to default to compiling everything with -mno-stict-align
so that the compiler generates byte accesses for anything
marked 'packed' (etc).

Run-time tests can optimise some hot-spots.

In any case 'slow' is probably pointless - unless the accesses
take more than 1 or 2 extra cycles.

Oh, and you really never, ever want to emulate them.

Technically misaligned reads on (some) x86-64 cpu are slower
than aligned ones, but the difference is marginal.
I've measured two 64bit misaligned reads every clock.
But it is consistently slower by much less than one clock
per cache line.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
