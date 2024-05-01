Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F48DC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmBrBKLyJAfV3pWKVaxodnwf1/+d5zgCEWx/uyMFDZc=; b=P6cxkoKtdq+ifn
	+gntHDiy/qQzeVYGtHLir87SORSmyEyHObmIjTDQt93XVxLcpmj9QLbDdiqmBHLVkXmGy22Gk+UnL
	Foa8Lk0EJuEEgxOcM51Uq1RnWsLsnCrVAZRCk2uHc9eieggD6o/dqnl85aoDv4t1Eb072s1G7fZ5r
	3PI//zOGRWGjxJYjfr1eXhOCWj0afMtjCGUEJZLUsftKZVBEK1mW/E384kYC8ifmP4VrlyeUO0Tfr
	m1deuKN0w5/mgJ0TTysHRI8wOh3G4y97xNwxDhHPwymUcjo3e+qsYYWtHDrsxbbZIwU7VVhOjMrF0
	DY/rwRbhI1HY3XJCd23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2CUH-0000000A5AU-3OFS;
	Wed, 01 May 2024 16:07:17 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2CUE-0000000A57r-2C81
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 16:07:15 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-790f699eb2cso304169985a.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714579629; x=1715184429; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBhqEyKuT9SGbY1gPylDuVYK6xBEaByxvLrKFZiA8D8=;
        b=QhzzBkP0eMP+xAJU22kAOiPPzlcz7ersnNDCwpfSZ2GTQHjcxOnaDFqLYqJAhKFWW0
         3Jf+ZmMdTHBA0BNAzyRDgQyML816baN017809Ft8ymEkWKIa/XZutjN2w4PGPrk6JKZf
         NU1nCJQ2yVfFgYEhoDLIdBy8fDpG8wBHrbpeCCXB2x4KMsybk93tIvDPvFcKpel7Db7i
         kDoMyyAYaQH3tGKTQtkeKLzP2CdTLImDid4QAz+RhK6/61V2tEJ652oOQzI0npfJeuuA
         AT8mvQQyhoKAHuihUdMNKpbdtkhCxDjKQAw9U6m5mz+qoZCmITKNdzeeSytkumfJFu7T
         rYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714579629; x=1715184429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBhqEyKuT9SGbY1gPylDuVYK6xBEaByxvLrKFZiA8D8=;
        b=KPJquGpvrCNmMu/tZqdiMnaj2T21peFepgCGkGVkmXIR3lwC/mEYUBgdpi2atArPYG
         1mLhtBW+S0alDIGGQfUGouxMOa8UvlOlKKM8ERCsFBevZFS3T0c2qBtJg3GnmXyN/luk
         sFxoc660a6JNr3qTMz00sXNJ00xB8N1x2R+UkVwVOhA0iGQhoaUX4CT89l8oB4EFCoVQ
         e2OItbCxImhDmcBAA/iI8DZrGl/2QgqccKz1r2KWzSKXbejXXdUsJyzgaLh6W5O/lULO
         nvFNNE3yr4RwKWL9VrACc2lkSQIEH5zogI1U2DaXT8mEO0sb3nTMCZ76OLzsM6cnqd2H
         VoiA==
X-Forwarded-Encrypted: i=1; AJvYcCUROvj+D1lSjWi1okUdpYtgNH2AVABs3tQsIE/WrOuIwc3dHXt6Q8LqiJpNq+cpIw17/QWQ3QGITp3ICyvRDNPkAedS8mi0GFjay3cJwHJm
X-Gm-Message-State: AOJu0YxJwIEgKu4LS097T79CRIYSdFLmJyer0oY7gznnA1Xi7CLCLRpu
	kbcglJm5gVuITgGWe/JaGwGqso52ie00AFGCt0LJ9fcfRA6TMWLNLoxBCWWT0fA=
X-Google-Smtp-Source: AGHT+IEIToKXo0oiLD8614cnvRWTKlqp8YbwZyKQg7eanOTB8s3Hn6dt4BqjP2UpzNxDw9ZcGXsFhg==
X-Received: by 2002:a05:620a:2059:b0:78e:e7dc:fd3b with SMTP id d25-20020a05620a205900b0078ee7dcfd3bmr2822573qka.73.1714579629470;
        Wed, 01 May 2024 09:07:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id n6-20020a05620a294600b00790eb55fd58sm3512214qkp.129.2024.05.01.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:07:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s2CU8-00DuqC-5D;
	Wed, 01 May 2024 13:07:08 -0300
Date: Wed, 1 May 2024 13:07:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v3 0/7] Linux RISC-V IOMMU Support
Message-ID: <20240501160708.GF1723318@ziepe.ca>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_090714_684185_D1D1B071 
X-CRM114-Status: GOOD (  12.39  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 30, 2024 at 01:01:50PM -0700, Tomasz Jeznach wrote:
> This patch series introduces support for RISC-V IOMMU architected
> hardware into the Linux kernel.

It seems in reasonable shape now, at least in terms of implementing
the domain logic.

It would be nice if you'd run it through clang-format and correct some
of the minor misformatting it will point out. We still like to have a
80 col line limit in most cases. There are many overages here that
aren't well justified.

And you could consider the nitpicky style advice to use 'reverse
christmas tree' for the variable declarations like most of the
subsystem is trending toward.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
