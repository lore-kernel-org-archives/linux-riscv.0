Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1751BC0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ud1NyuXzdRbIl/0EqCgdSLVdgY77WTx5oohPDtvXAK8=; b=M5Slwy9Ls66QrZ
	UPdRVoT34/NLcR2o/xl2Ot6QgP60emEI6Ct0T7nOrtU5LzbEjCWoKjrk9zHa9pNsJG7CvO/lBakqS
	m7/sdaOcrxKoHimFqoaG4h3mrp7+VbSiHTbbFhQbveXAzKrEw82n4Z8A8Oz2GY1g3yLFcuu55K28Q
	ssC14jAe4Gsb7pH9XQ4+C0WqFlLDwZdH9U8QlT6jNFGIVf1GKzf5GIjdbus9TubyXgPdXylw02lN9
	wHmV0RuT33zD0j4zdfK1u5bq21gMuef4Dq+oh9hZbyMCSpEBOCG9ssHpWOS58llQ9vVbUQLv99i7i
	ZUlX6+sTf+4yOn2pzg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkdL-005FNg-1N;
	Wed, 09 Aug 2023 14:57:59 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkdG-005FMV-2S
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:57:56 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-406b9bcad5dso35653531cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 07:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1691593070; x=1692197870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpMhr6QD+95gO3zovNgjrpdIT5cUPg1o1tOLgZJnwGY=;
        b=hLXQVlNLelozyJU+bMnYuq1dfWyKA32ocR+Yqn1lylxJDEsL6wr0oakubcd0IMsOhS
         NVqoyF2vVCIqlBuVQrG5aJE7INO9gJqQzauN7dyqUmmVUcqx9L+3sgjIjFX2QO2ClYJy
         rvFmhdqeL9nEFIvBLrUZ3m3uEBjmQRBpk9XK/ms2KoLHID/+dtoBpdjBErcu/OLHrQF1
         HyXFnoMmG2QhzyiCj0Z4W99t1UYCtTkmO79eup9BPRlQ0s+SFxkHR9C9+/n9yTI5x4Rz
         dtMyCPqw9hxolBatOIPRnHBRQHeBxUpZC/rydY1bBkD4SD8ZCtZv8QeM/QOAd6D+yhC0
         YY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691593070; x=1692197870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpMhr6QD+95gO3zovNgjrpdIT5cUPg1o1tOLgZJnwGY=;
        b=ibZ54Lcq5da81FDYFewFrLxaQWUjYHDKxuH4ZsL7mnCJModlYot023yB0yTgu2q5Fb
         jUC5RGjFEIxX/TTPk/EC51xccGF1oL738DURKn6WPj9mngTYPgkdPTAgIISJ1Sg6pg+a
         OLZUpLfB17arsMAP/xH7a7zDcBianECNsd95seZRy3kZMOHSKnIjfinz7H5331Do97ag
         XCqi15zWfG4Y8siSbVnSj0fgbu42bL/UpZ5au5s2nIjp76ueiwDt6hcPbDRI1Ck+QqM1
         WklFzRILySSKMCMa5PJOBu/6HDxH0em9T/0+dpu/00+GSB5YIhsmH+fEX+h4EHymJ00r
         bJ4w==
X-Gm-Message-State: AOJu0YxsZQ3kXgDNWDDfIfbdheGsAbLKvF4Iwgxh2r+uRmE1x289FoDV
	FUGQHGMdK6UgJn4stp3cZBavyA==
X-Google-Smtp-Source: AGHT+IF/Eb2IIrd1xEjQy4quw86/nLSkYTOnDYFOrxCFoJ5y6Vyhcm86eTM1GOzIdk8SC98VBkH6Aw==
X-Received: by 2002:ac8:4e47:0:b0:405:3dcf:1182 with SMTP id e7-20020ac84e47000000b004053dcf1182mr3857027qtw.50.1691593070645;
        Wed, 09 Aug 2023 07:57:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id w12-20020a05620a148c00b007671b599cf5sm4017361qkj.40.2023.08.09.07.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 07:57:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qTkdB-0053kn-JN;
	Wed, 09 Aug 2023 11:57:49 -0300
Date: Wed, 9 Aug 2023 11:57:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
	iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
Message-ID: <ZNOpbac4i5zfmHj4@ziepe.ca>
References: <d62ceb33620cab766d809e6bbf30eaf5b46bc955.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0r=2eqpy9wLjVt1U0J7=LpnJLcKV7N9d90jvCss=7+Fzg@mail.gmail.com>
 <CAK9=C2Vg9eR5LJPeqDDQ0pHZcrT5DOUzA8_wYEVEjfnhb6s8pw@mail.gmail.com>
 <CANXhq0oTrU_-OQroW7H+hvxcU7YROhkgdCF9g_WtPTzVFQL7gA@mail.gmail.com>
 <CAK9=C2XoQjPzZ5yB5jfTbee4-Pb8GgFAZRbfcMwMk9pyo39WxQ@mail.gmail.com>
 <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com>
 <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com>
 <CANXhq0pS_=YxgrxSKbdfrFdGcBduzk3LTyC4vp_hqoJTbX3e0g@mail.gmail.com>
 <ZMEO1kNGfGjN6kZM@ziepe.ca>
 <CANXhq0qMWS_j0n_aUO8BVFSedYCjuMM=Z_tsnK05ZhG+Ob6pqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0qMWS_j0n_aUO8BVFSedYCjuMM=Z_tsnK05ZhG+Ob6pqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_075754_797821_A37073A6 
X-CRM114-Status: GOOD (  15.96  )
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

On Thu, Jul 27, 2023 at 10:42:47AM +0800, Zong Li wrote:

> Perhaps this question could be related to the scenarios in which
> devices wish to be in bypass mode when the IOMMU is in translation
> mode, and why IOMMU defines/supports this case. Currently, I could
> envision a scenario where a device is already connected to the IOMMU
> in hardware, but it is not functioning correctly, or there are
> performance impacts. If modifying the hardware is not feasible, a
> default configuration that allows bypass mode could be provided as a
> solution. There might be other scenarios that I might have overlooked.
> It seems to me since IOMMU supports this configuration, it would be
> advantageous to have an approach to achieve it, and DT might be a
> flexible way.

So far we've taken the approach that broken hardware is quirked in the
kernel by matching OF compatible string pattners. This is HW that is
completely broken and the IOMMU doesn't work at all for it.

HW that is slow or whatever is not quirked and this is an admin policy
choice where the system should land on the security/performance
spectrum.

So I'm not sure adding DT makes sense here.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
