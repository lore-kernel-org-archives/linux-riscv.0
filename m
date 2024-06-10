Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FA6C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 17:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1C0Oc3aZ5OUn1xIjU2+acReC4FGpJuG/DxY09je1ug8=; b=xfHcOPi4/Cgiyi
	iKLkUx8Lra62IkAJQpG4tp37WuPvKBL3a8KNi2z52xlCwroY2R9uqYYOsTo1EOglGSv82+AuO7/TS
	9gHRV4ikQYCF05KodHOaOwCOr9JKZW7vlbDFUrbjZTwQytUVkmm3V9Z6hBuYiLYcO/NpL0jSuztj7
	LVvRBdhy2VDQQUivdFkSukAcVf1MvaN+fcR++L+5kZvhEzSjpLVOFf5pDa+PVuLcNjjzNZcWDEjOl
	hQkIbuavbufs+iKGaSwmNBcQwoZyKcR8Sf1mp/ctj1UrOwypr8sm1ljptgngZDDN1ENyqEYKElmfI
	bQzEZTTgDAHPV4buCkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGj9K-00000006209-24Oi;
	Mon, 10 Jun 2024 17:49:42 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGj9G-000000061zS-1lOf
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 17:49:39 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-62a0849f5a8so46528187b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718041776; x=1718646576; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rLnQ2l5LC4vBk1KAktpJMA8+PgPoixo2FswnJOlP1yg=;
        b=Sl6se0fMZaa9JgzOGarO7/yE6cF6/hA4I+itcqtbsAt5PxV0RP5/5FfDxGlWRehAPy
         P6EG4KyIVCfrh5WGjvHZ70yBUOwOvOxsANykq89iwGypsVkUxzTZo1lrV5Yz+GvkQevC
         SLMPGoNGrcwotdHJ5VE/UUJGom7KlqR1s1qHn86X1+Vqz1M7VCrkcAEFEh5d1PAUw6Ny
         iFNwlyjrZrsbJEIu74VkCk1xoUIyG+O1isyyk+ZSPfm7dq2pq8xQ3br5gC9o7KHhWZbB
         Ek4HkGaoWmJeeyuXPpqDQDPIcCojUUuG+7l+luJyHHYB5yNnDg7YUjsQXlGB1WsT/wIC
         456Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718041776; x=1718646576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLnQ2l5LC4vBk1KAktpJMA8+PgPoixo2FswnJOlP1yg=;
        b=DweA/EQpYlno9I4+5jPXd3mmhSF3hKC9Vr4ePWvZS0gqphJJ3BvZYoDfxnDW1fa40U
         S7GROWeq8ewoWsLI1G830em6cmqJJNcVIKlFdggWJkrlH61XSaCxD/ClzkCZuJz0fQt2
         Tn2FlW8pmkgVnfDz+x84r8dMkyX01We7aYxL7ZjIt8AyjKVhv/IZRDP+tizK8IYmliQk
         hK27iiYtZkOJE33vBOiP0U/bZmN/vDXzCDvIAmtz4FcK8HHeUmWAjM+B5sPH39dgh3Ii
         fdsrk0i8DLUbSTraNuJQcWyTqcg1EyPKhHpAnKERxWAmhgYCgMjSoss5De5DXcwNoPM+
         pCyg==
X-Forwarded-Encrypted: i=1; AJvYcCU1wiG3oR582H24J545koM8haqij8U2OZgw7eklzgTuQKs1YeBCur+YUa0QMqnWbMgUVMeTWyWvkdHXl/nqdvtG4jEaAGQpHe+tHfRNkkQc
X-Gm-Message-State: AOJu0Yz1W5gaVfE9sVqd6WIwSTBfOCOuhvjA+xK7I/EZyt7mlqX6zNoe
	kz+1LPhVV6PSL7cF1s9Dkx2MCdF8h+++ZV2Yl05o2+hRPhRX1TCfr0DW1/InQ3w=
X-Google-Smtp-Source: AGHT+IFe8OwLGzvnbALaK/BDvvOAZwFQVf4gWc79kKkP946QP6T5IhIBj387LfKTGJKnPwAn+7jYYg==
X-Received: by 2002:a05:690c:72f:b0:627:7ff0:fb4e with SMTP id 00721157ae682-62cd55f3aa3mr88716287b3.26.1718041776199;
        Mon, 10 Jun 2024 10:49:36 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04fa1a628sm48037996d6.136.2024.06.10.10.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 10:49:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sGj9C-00Etv9-1y;
	Mon, 10 Jun 2024 14:49:34 -0300
Date: Mon, 10 Jun 2024 14:49:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v6 5/7] iommu/riscv: Device directory management.
Message-ID: <20240610174934.GM791043@ziepe.ca>
References: <cover.1716578450.git.tjeznach@rivosinc.com>
 <e18ec8ac169ae7f76e9044c26d0768e6469bad19.1716578450.git.tjeznach@rivosinc.com>
 <CANXhq0p4gERQeROSCSKqxnRZq9-fGfmROGV8JZyqFaenNpnsLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0p4gERQeROSCSKqxnRZq9-fGfmROGV8JZyqFaenNpnsLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_104938_493932_3F2D8FFC 
X-CRM114-Status: GOOD (  19.43  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Jim Shu <jim.shu@sifive.com>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Vincent Chen <vincent.chen@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 31, 2024 at 02:25:15PM +0800, Zong Li wrote:

> > +static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
> > +                                    struct device *dev, u64 fsc, u64 ta)
> > +{
> > +       struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> > +       struct riscv_iommu_dc *dc;
> > +       u64 tc;
> > +       int i;
> > +
> > +       /* Device context invalidation ignored for now. */
> > +
> > +       /*
> > +        * For device context with DC_TC_PDTV = 0, translation attributes valid bit
> > +        * is stored as DC_TC_V bit (both sharing the same location at BIT(0)).
> > +        */
> > +       for (i = 0; i < fwspec->num_ids; i++) {
> > +               dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
> > +               tc = READ_ONCE(dc->tc);
> > +               tc |= ta & RISCV_IOMMU_DC_TC_V;
> > +
> > +               WRITE_ONCE(dc->fsc, fsc);
> > +               WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
> > +               /* Update device context, write TC.V as the last step. */
> > +               dma_wmb();
> > +               WRITE_ONCE(dc->tc, tc);
> > +       }
> 
> Does it make sense to invalidate the DDTE after we update the DDTE in
> memory? This behavior will affect the nested IOMMU mechanism. The VMM
> has to catch the event of a DDTE update from the guest and then
> eventually go into the host IOMMU driver to configure the IOMMU
> hardware. 

Right, this is why I asked about negative caching.

The VMMs are a prime example of negative caching, in something like
the SMMU implementation the VMM will cache the V=0 STE until they see
an invalidation.

Driving the VMM shadowing/caching entirely off of the standard
invalidation mechanism is so much better than any other option.

IMHO you should have the RISCV spec revised to allow negative caching
in any invalidated data structure to permit the typical VMM design
driven off of shadowing triggered by invalidation commands.

Once the spec permits negative caching then the software would have to
invalidate after going V=0 -> V=1.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
