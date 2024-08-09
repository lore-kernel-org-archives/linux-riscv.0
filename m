Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76305C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 18:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxpPN32pFZH3mnnxdRAC8Wosic6inlhP009i4joNdSw=; b=C2XR8nzE4EdG3p
	H2LrGPrVSQ7Q0Idb3nFi3fR+p+ba65Fs0Zs7jgy3lW7L0JzXoyEg+mk/BuWhVKeixrt27h55yousN
	u6n4j3oQDHkkbs5VjQw95//PbYjpETttvgQ5aY3GLnk5J+9UwCVHkM2wAu5rTo8GtvqgBfwInbjSV
	XBp4ZalRql6Pr/6LyPB3DFTJh6mzc4lwbw/+Nu5+ZAWrzBnO89y5MC/rJLuV+uURCNBHcwNAlXmLa
	x7LztCPDD04UVRUIerEHtoJ/y056NQ4l1baCwe1l72DM0Vz3E0SLZYYmdw3L1UKsh5XDYPX9l56Ib
	xcAcIzUACpicebffM34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUmk-0000000CGa5-3UGs;
	Fri, 09 Aug 2024 18:56:23 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scUmh-0000000CGZT-3oei
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 18:56:21 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7c3d8f260easo267488a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 11:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723229779; x=1723834579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3Qkeo+W250W1kX4t1UlG+kDZd1Dez1YmJ5bcZ/eiIA=;
        b=w9kbaWnUWJFy23O8J/HP32xwQYsn2AtLvb1Z9E5XUxRoV3fAb8MSqhv33/881Ppoxb
         2TG7/nh5B6aPwzAp1vHiyFGqnlwrsWb804Mhv2gh3tDm7GbClH1fTKuyjEc3tGKP9FhF
         DJPo4S8bdjpv02VOUxCDoV76fsOtDVj2nQ3hDSUPKlcdo03fwJlYnnG2zG0QIBkrf4ar
         VmsptiY0p6mr1Tm1dOpil44s+DYe7CNE7sSBtmGYuaEmQUL38ramTvmCoCypsAgAvcSn
         gI8+Sc7EzgUTgDt8X5jCVEw6xR7xfrj8B6QbVhINr2aME5bocFttIfRrx0JGk5dj0kNw
         nSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723229779; x=1723834579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3Qkeo+W250W1kX4t1UlG+kDZd1Dez1YmJ5bcZ/eiIA=;
        b=RY9Ka2OqIFeVpG3HxACUsjXOw6tbwoGS94bVVP5jAuIevy1YzeJO+Xazh3b5qAqQt9
         NF2l1/C6anNXfJwhcWzL3cQAZjHm1wCKr/u1KgzZ3I4MzhTfqy+nyrB06Vu4xP+mqdW/
         fhWF23tDKKhiHN1hXLisPAYowt85qAy082VxJW1QIuAThRra29RAF7BKvNhrx3QgGdeu
         4+PYxpsvTBhMLtKx8w6jMpQLx1+sm3jkNewTlOVWN3Z7C3Zwh9rAfP2IBKxFLS10bIFu
         UMkBE2tIjrFswxUuXOwpz6dNdlirkMtpj5zRkTvXnUkytiInLMamIGyPrpu/oelBFA1a
         H7ig==
X-Forwarded-Encrypted: i=1; AJvYcCUzuSfKVDm/fIboHH0VuvL6FtHu6aMJlkUX4qcDQ3rsACV6TUSI9vq9LeY4JKVOeKpr3/TyJ1ngatsoVLAvIFnCQDBDw9lVEOi0ZYbJQV6A
X-Gm-Message-State: AOJu0Yx90AW2KOdRjWuK5/NAEdaD7UML15OWOpvHDKuvgz5KCDhg41ur
	TW7mSzlUM6uvdF8n5LpUl52lddl+jOYJyiLpaxxzhNXX1S5gttNqL4cLuk87R0o=
X-Google-Smtp-Source: AGHT+IFtri4zHq80gWpj0M+3oaa0JsIqMB6/Nz/RW24XYkQW7jPd+vTe5dieCHLB32pMTRX192P1wA==
X-Received: by 2002:a17:902:e54c:b0:1fd:d55b:df26 with SMTP id d9443c01a7336-200ae61452dmr35328755ad.61.1723229778955;
        Fri, 09 Aug 2024 11:56:18 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:c486:937c:35d4:b6a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb7ee40fsm924035ad.14.2024.08.09.11.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 11:56:18 -0700 (PDT)
Date: Fri, 9 Aug 2024 11:56:14 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Rob Herring <robh@kernel.org>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: Add Zicclsm ISA extension
 description.
Message-ID: <ZrZmTvJgyQ5nB70H@ghost>
References: <20240809162240.1842373-1-jesse@rivosinc.com>
 <20240809162240.1842373-3-jesse@rivosinc.com>
 <20240809181536.GA976083-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809181536.GA976083-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_115619_971095_D1948683 
X-CRM114-Status: GOOD (  14.63  )
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

On Fri, Aug 09, 2024 at 12:15:36PM -0600, Rob Herring wrote:
> On Fri, Aug 09, 2024 at 12:22:40PM -0400, Jesse Taube wrote:
> > Add description for Zicclsm ISA extension.
> > 
> > Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > V1 -> V2:
> >  - New patch
> > V2 -> V3:
> >  - No changes
> > V3 -> V4:
> >  - No changes
> > V4 -> V5:
> >  - No changes
> > V5 -> V6:
> >  - No changes
> > V6 -> V7:
> >  - No changes
> > V7 -> V8:
> >  - Rebase onto 2d1f51d8a4b0 (palmer/for-next)
> 
> Please also put the version in the subject. '-vN' is the git-send-email 
> option to do it for you.
> 
> Rob
> 

These patches were originally part of a different series [1] but are no
longer related to that series so I had asked Jesse to spin these off into a
different series. These version tags probably should not have been left
on here when made into this new series though.

- Charlie

Link:
https://lore.kernel.org/lkml/20240726163719.1667923-1-jesse@rivosinc.com/
[1]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
