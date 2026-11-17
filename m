Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8349606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TJ3tq2pZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1dxmMiJdRf7YyU0DbO9ssEB2u3ftxWlPCDL7hPMLoq0=; b=TJ3tq2pZYrFmrprAMjWII7pwHB
	gpMGV7g0FcYF8e+/KyfJmuJa34UwyNyXBDGGZy2AdQddzh0G4kj67QCEPZYMA4JJg+oMmBYSL9Qzy
	MQJxE1S3VvI9r0pR+RCldDWOZQPmbbfj2AJEGh9SIchVUoqfZ8v3Mw+vtKX137vpLM3EvK9bfCb1t
	oDQN5WpMu3temHcy/NedAR5Obo/JP/vN6yz/cc8lyaxq/WxOmE+mXejYnxxD6kEwe2EAGlgq9W9d3
	ShvQJbG3s2yZTnBJDnOIg5yBjWI7QlvXfMY+AEJNWxEmC7/w1+Bj5luZ+JR/b2SsqjrErm7MtFqFX
	/TQwnVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFNW-000000053Z9-20EX;
	Tue, 17 Nov 2026 09:21:26 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFNT-000000053Xl-0LAX
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:21:24 +0000
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AH9KrIs066268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 17:20:53 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 17:20:53 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 17:20:53 +0800
Date: Tue, 17 Nov 2026 17:20:49 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <jic23@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 12/19] dt-bindings: cache: andestech: update schema
 for generic LLC support
Message-ID: <avwcZfHRZvGMVMkB@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-13-minachou@andestech.com>
 <20261113-emporium-provolone-0e7b0e39c97a@spud>
 <20261116-crazy-adventurous-cockatrice-61c62b@quoll>
 <20261116-deduct-emphasize-b2482186cfcb@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261116-deduct-emphasize-b2482186cfcb@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AH9KrIs066268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_012123_603382_5B4FA41B 
X-CRM114-Status: GOOD (  32.07  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 06:00:43PM +0000, Conor Dooley wrote:
> > > >  select:
> > > > @@ -21,18 +22,23 @@ select:
> > > >        contains:
> > > >          enum:
> > > >            - andestech,ax45mp-cache
> > > > +          - andestech,llcache
> > > >  
> > > >    required:
> > > >      - compatible
> > > >  
> > > >  properties:
> > > >    compatible:
> > > > -    items:
> > > > -      - enum:
> > > > -          - andestech,qilai-ax45mp-cache
> > > > -          - renesas,r9a07g043f-ax45mp-cache
> > > > -      - const: andestech,ax45mp-cache
> > > > -      - const: cache
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - andestech,qilai-ax45mp-cache
> > > > +              - renesas,r9a07g043f-ax45mp-cache
> > > > +          - const: andestech,ax45mp-cache
> > > > +          - const: cache
> > 
> > Illogical split of patches. If this was to stay, then THIS commit is the
> > reason to rename so rename would happen here, not in some time in the
> > future. Same for everything you do.
> > 
> > Organize your patches correctly, not doing things half-baked... but
> > anyway do not rename files just because you added one compatible.

Hi Krzysztof, Conor,

Thanks for the reviews.

My understanding is that the file should not be renamed at all, rather
than having the rename squashed into this patch, so I will keep
andestech,ax45mp-cache.yaml in v3. Please let me know if I misread
that.

> > 
> > 
> > > > +      - items:
> > > > +          - const: andestech,llcache
> > > > +          - const: cache
> > > 
> > > Device specific compatibles are mandatory. I would accept this patch
> > > with a
> > >           - not: {}
> > >             description: Need a SoC specific compatible
> > > like the safexcel eip binding.
> > 
> > But why all others cannot use ax45mp as fallback? Is this really a
> > generic block among multiple generations of SoCs?
> 
> I think it's fairly likely that it is.
> I do like having constraints that restrict cache-sets etc to what the
> device can actually do, but using ax45mp as a fallback doesn't prevent
> that, since the constraints are really set by the soc.
> > 
> > What sort of arguments from contributors are to support that?
> > 
> > 

The L2 cache controllers of the Andes 25/27 series (A27L2, AX25MP, ...)
and of the 45 series are separate implementations, but they follow a
common Andes register interface: the configuration, control, error,
CCTL command, access line and status are at the same offsets and
behave the same way. The driver is written against this common
interface only. All the SoCs this series targets use it:
the AX45MP in RZ/Five and QiLai, and the A27L2 in Allwinner V821.

The A27L2 does not have the AX45MP's controller, so using
andestech,ax45mp-cache as its fallback would suggest that it does.
andestech,llcache is meant to describe the common interface instead,
and the driver only needs to match it.

Would it be fine to keep andestech,llcache if I add the "not: {}"
placeholder for the SoC specific compatible, as Conor suggested? If so,
I will do that in v3, and the V821 cache compatible will come with the
V821 devicetree series from Allwinner.

> > > >  
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -44,13 +50,11 @@ properties:
> > > >      const: 64
> > > >  
> > > >    cache-level:
> > > > -    const: 2
> > > > +    enum: [2, 3]
> > > >  
> > > > -  cache-sets:
> > > > -    enum: [1024, 2048]
> > > > +  cache-sets: true
> > > >  
> > > > -  cache-size:
> > > > -    enum: [131072, 262144, 524288, 1048576, 2097152]
> > > > +  cache-size: true
> > 
> > 
> > See writing bindings. Widest constraints stay here.
> 
> I think how this should be done probably depends on just how much
> variance there is intended to be. How many more configurations do you
> envisage here Mina, and do they follow a similar scheme of being
> multiples of 128 KiB?
> 
> 

Yes, the cache size is configured per SoC as a power of two multiple of
128 KiB, up to 8 MiB on the AX45MP and up to 2 MiB on the A27L2, and
the number of sets ranges from 128 to 8192. So there is a fixed, small
set of configurations, and in v3 I will list these values at the top
level.

Best regards,
Mina

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
