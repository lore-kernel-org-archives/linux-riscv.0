Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2A7C27C4F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 22:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OG8GXdjLrr+wrvzKMIzzwZZ8TXjuwOyBi276RRNhlc0=; b=YEO/R6KiDV171k
	4CfPuSAzcHg4GawenaV1W4t1DzFXl/G+GCJ9U20+gFLXDCfYcG6kNOFYewBc1DdIotv3tP/a/O9Xv
	Z66UnLR8oWKhj+jj151otjqai/HWu4klnWvWGWzPIpO/vZvB5ln+7DzoA4fDX+bh/13i+PMpzpdp2
	xg2VxuktW+K+WrEHSbW9j8wDznQLx2IgmOhlG38qDQuSEehC1V9DB05SIKaBFa/9PzN4iU0QPMsl5
	X1cfenNktaLvcKXxY2BH/2ZqlGfWlrEgdYenZ4hy+MlnhkYWWgEpH92silD5XCxha0orfcmaGCDAi
	kA+fjMM7moST1ETrbGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnNs-00000006eq3-0Vl8;
	Mon, 10 Jun 2024 22:21:00 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnNo-00000006eoV-2va5
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 22:20:58 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7958133cca2so143937985a.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718058055; x=1718662855; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IK36WmyP6FxP12hNW+mAYXAuqO1K5/Xu82XpbAGcEYI=;
        b=ZLx902Aglk+yb3Udx55xg44kpdz7ng/eDHKDoCnOl6KK1pUJq5WwK5kpG8UeE7Y3Xk
         3g66+5G0o8UAImQhj7yVEc7hhq3eoW/Gc8vmtm/+G8bbd5zZ5SsEkFa278GZN1I7hH2V
         zauUJCpWKPDV+xLXpYs5Lvzhb+/pox/eqyvnBD9AeX9WoKUNrkFvvpJPV3gE3T+wie0j
         oiTUVEzIt8FV1FfxoGU4sLt0MVzS0XPE2iByQx+f/hyveLAYlA5R5XcEbl/4jH7jCLWA
         sdBm46gAxzLzerWVFJv2+gtKA3FwVpr9OKAJjui3Re/ZLv6jAriuBHnFoDC/lfucQNe7
         KLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718058055; x=1718662855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IK36WmyP6FxP12hNW+mAYXAuqO1K5/Xu82XpbAGcEYI=;
        b=jEWwbQmkGLasnzI+KKHVzlhQSIjwnNUp3itkpGS0FYzt/lyDkLskHO/HDdN7EQthGj
         E9sQbQFoTHuyytwUtdAAOSZXB91Y36quNS6jjcqPVQCEGn3O7b6l3kU0yigywJMbvqbC
         UqmSTAY1dkcPU385hDKcl/EruZvZ9bf0+fq7mUJrKE4hU4tlLl6CS9TZn3DwfitO97dV
         NzwmkAJMlZ0g2Df2RVsfHG1UZtt2B4hzPjp+5KLy250jMsh+pda+Q5dSLOHsMc+GGTx1
         O9B4H4YRY/UVwmDMq7Cf/iXHmRT/G4qdW0PRqhVxexCwM4Maq305EgF0GqJOnM1BDjW7
         RTfg==
X-Forwarded-Encrypted: i=1; AJvYcCX6rvZEkXzAupYET1mjdv0qfK/+iSfYNuBXizn3OMQqhFjeT+uqu7Q+1UnDlBA7wIh1d2FujWhXGBRgh5PRD55gphoWyuEsbyD8B2+FKYn1
X-Gm-Message-State: AOJu0YxDGihisTVFj6SlO9ZvQ5QIxLSMoW7gw+QNRC0fn+aWTbDEwLzv
	IfHOQX17rXlnYu07TxTXEjxD0cWuxOgDYKHN4sbX75fGoml4Bq+qPNj3+BzxrAI=
X-Google-Smtp-Source: AGHT+IHVjlKMfA9VJCEHaoVM/zmJJzh0SiPbzZERcL72L1VgK0N7xsovbpdRc0foi5BzwXCYoYpsjA==
X-Received: by 2002:a05:620a:4094:b0:796:5fd7:5219 with SMTP id af79cd13be357-797c2d9fffcmr157451985a.20.1718058054627;
        Mon, 10 Jun 2024 15:20:54 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7954f6f337dsm302830785a.42.2024.06.10.15.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:20:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sGnNj-00Ftbc-6y;
	Mon, 10 Jun 2024 19:20:51 -0300
Date: Mon, 10 Jun 2024 19:20:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v6 5/7] iommu/riscv: Device directory management.
Message-ID: <20240610222051.GO791043@ziepe.ca>
References: <cover.1716578450.git.tjeznach@rivosinc.com>
 <e18ec8ac169ae7f76e9044c26d0768e6469bad19.1716578450.git.tjeznach@rivosinc.com>
 <CANXhq0p4gERQeROSCSKqxnRZq9-fGfmROGV8JZyqFaenNpnsLA@mail.gmail.com>
 <20240610174934.GM791043@ziepe.ca>
 <CAH2o1u4c6ttUWTb1zrc8DScDMuDJJYR-tTHCPYW_3FV4uuQDtA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u4c6ttUWTb1zrc8DScDMuDJJYR-tTHCPYW_3FV4uuQDtA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_152056_768128_47DDF51F 
X-CRM114-Status: GOOD (  23.38  )
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
Cc: Zong Li <zong.li@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Jim Shu <jim.shu@sifive.com>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Vincent Chen <vincent.chen@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 10, 2024 at 11:48:23AM -0700, Tomasz Jeznach wrote:
> > Right, this is why I asked about negative caching.
> >
> > The VMMs are a prime example of negative caching, in something like
> > the SMMU implementation the VMM will cache the V=0 STE until they see
> > an invalidation.
> >
> > Driving the VMM shadowing/caching entirely off of the standard
> > invalidation mechanism is so much better than any other option.
> >
> > IMHO you should have the RISCV spec revised to allow negative caching
> > in any invalidated data structure to permit the typical VMM design
> > driven off of shadowing triggered by invalidation commands.
> >
> > Once the spec permits negative caching then the software would have to
> > invalidate after going V=0 -> V=1.
> >
> > Jason
> 
> Allowing negative cacheing by the spec (e.g. for VMM use cases) and
> documenting required invalidation sequences would definitely help
> here. 

Yes, you probably should really do that.

> I'm hesitating adding IODIR.INVAL that is not required by the
> spec [1],

If you expect to rapidly revise the spec then you should add it right
now so that all SW implementations that exist are
conforming. Otherwise you'll have compatability problems when you come
to implement nesting.

Obviously the VMM can't rely on a negative caching technique unless
the spec says it can.

> but this is something that can be controlled by a
> capabilities/feature bit once added to the specification or based on
> VID:DID of the emulated Risc-V IOMMU.

I'm not sure it really can. Once you start shipping SW people will run
it in a VM and the VMM will have to forever work without negative
caching.

My strong advice is to not expect the VMM trap random pages in guest
memory, that is a huge mess to implement and will delay your VMM side.

> Another option to consider for VMM is to utilize the WARL property of
> DDTP, and provide fixed location of the single level DDTP, pointing to
> MMIO region, where DDTE updates will result in vmm exit / fault
> handler. This will likely not be as efficient as IODIR.INVAL issued
> for any DDTE updates.

I don't know what all those things mean, but if you mean to have the
VMM supply faulting MMIO space that the VM is forced to put the DDTE
table into, then that would be better. It is still quite abnormal from
the VMM side..

My strong advice is to fix this. It is trivial to add the negative
caching language to the spec and will cause insignificant extra work
in this driver.

The gains on at least the ease of VMM implementation and architectural
similarity to other arches are well worth the effort. Otherwise I fear
it will be a struggle to get nesting support completed :(

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
