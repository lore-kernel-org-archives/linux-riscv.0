Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8650FCCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 23:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxMBp2Bkv4LkzIIfDv7NxTw29JhUeML7xyjUJmvaFzE=; b=rHqUITv+Idctge
	qIuWKdpZv9XONK01xiZW+pmABsj4GIquhi9icENuG8kxwCnG7/XvxZ4MqgINiX53wblUuPCj4yjFx
	8qDemrlawKe4olJORG5qeg9HeVUyKXfgOEEsyFKm/mfXJrSOciTrg6FdEtD3PihR3GtDeWJvJsAqh
	J4cysv0I2WpJybeeINIvlnpgmxQqmXBWvROjXs/yQST6cpoatYLZgsTfacDnAdUO4fy67Up461/oS
	6n1wM29yVT+lrIWWmq8v9984oN80jXmsezPX//c9qgKRoThA20kjP+JYyaS+8/DK6U54X9AnNI8GA
	f3TRo6uGF7rb89pRvdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQHk-0000000Ck9E-1c9B;
	Tue, 04 Nov 2025 23:17:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQHh-0000000Ck8K-1Pin
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 23:17:55 +0000
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 14C743F2B3
	for <linux-riscv@lists.infradead.org>; Tue,  4 Nov 2025 23:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762298261;
	bh=MieDiTn7THEoDLo56I7CJ2MsB1+PBRPE6P2QhMPLZHs=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ejrqH4JuNNIuxf1SwwwzyzfctN8Q9NeWPR0GliQAdyjnIjM0XWMTirJ17Jq+zp/Yi
	 0/7N1BUimF+Z8vGmarv/pFxaiH5s1ZJeq4GbLM+MCez5L8WpIxRDeHORX1vfS4crA5
	 TeGngRklVoLvZHZEGaDDdP0iFPouS9pxgpeD2cnwdh3h7ETvZLxwW/z83ruZAhOtg+
	 z/0RFlcZMLxomzcKpmbO0NwELLN9ORKjDBHJsReMLlwPQMFWJiml7i9pkqrLCRR2+T
	 2fHv94yf9ySeYkOh4F6z/CCPG2FV8xRCw1mdknlEFJ49tgaB0K7S29z/ce3k9U1iCG
	 80XZ6i17X0SwZ1ZBoepW5HIacUxU303/mdjG0p9Eae13xFULKgrZPeXJUw3FBv4mmr
	 hdA9nkQcIJbZak1Otgz+ZZ07U0yNUHIVKUwDiNnxTxZ+KGTm57z1E4pv6NPKgCfPu2
	 KTrOPx1rndd9Z81lmwoXzF1nuPnw7ZGpkeT9x4Zdmd7s6cVkOG4fOCUvLg1uOO+T7J
	 OXaMpKq/61WGOiZ4exhj7NRIguRQPw3qxqLaNKdII268ihY4PvpERk3RroRlx26f0C
	 OkPLnyPsbvrxLTnspfaJgyZFSAYqfvqyubJuFTATfe85HGPxwphAhBMJAKGapRD7P+
	 cYeYVq2xK+PMMa0YkVwqYe3E=
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5db98e105a6so11869485137.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Nov 2025 15:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762298260; x=1762903060;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MieDiTn7THEoDLo56I7CJ2MsB1+PBRPE6P2QhMPLZHs=;
        b=wqDFTPptDqRR7fLaY+g+sJWI6Yo5nPNUc8CrPBYEGVmTeb7RkrSAgA241uGr5Q7S3j
         /dvH94CY3IUnyTg3UWNXR0xIy5a6qD8w83d/zEz3sbhymoBCa3fznJj053gnQeTjthrf
         5DcEJt5m2gJZoBfySL6H2kC7gvy2xPBIRMmdn4hzxq3BNxJKO5zQM+JCDxBu4EwrGv8W
         sH5sH4l0pYTjjXDdy4AzFKdMv5SePXohtK11KVfcJ7SclfmSMd3gfeYL+NLbrTtcyvWl
         cI8HnKTqoIfWl+0H1MphhKMTHJkhLcHhMPF+thMx3yD+uCmFatM6WMTB7VJ5YhGtJwLi
         4QiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxxkrEhTOAVSm8WS8FhlnLX4wMBDbI+Vee5oCdg9cQOhbb6ZWZeZpnqWLk6LEE/43BrspcHLcIecfyvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHzeK4n0hm5yv/yE1HfKJbfuRBAEubbwJ8S6mKo4pnG4XYtqN2
	dxUAOZ7S795WLiccIvZmv2r3ue/bQsdd1biRF6e2YE0WaUiAj38sUjr6I2hfVBtMxw6zV/07ZXa
	olvn7ktPCGPoT/KYqnmjCG0do5VlYl3S2YwUocoN+S7lqaqjobokFhGIZe8QjcSjOoMaOiDI/WZ
	6KUgbHDaS5igc4mRuuwyoceJ4XRBb/nW8LqJYjz6pJIFQhvWAKIrAfGQ78K2tw
X-Gm-Gg: ASbGncv1bImynxttq+kaUp29eWil5wZcVkz03bkj7QZ01CSGDYoT3h7eAuF0Hvhv/JG
	693vtJGJdDW+KaFW9PzhuNHI9kbWIDvIxz6Z5Ka3ZkcOQij72B2znb65gt/3E6zahniIWW4DsdP
	x2AZAOljvwGG3DuDZOXiIl8gO9eU9GGb0tTFuH3vvCQ/CVzbMmCDu07gkfgAFEjJgoZTrJR8qIx
	6ijZu9l//yPObRD
X-Received: by 2002:a05:6102:cd4:b0:5db:f615:1821 with SMTP id ada2fe7eead31-5dd88eeef01mr457153137.10.1762298259781;
        Tue, 04 Nov 2025 15:17:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoHJV28+m0O+BSg3fXLgJ4lIxTta5GR6qyYEyZXdo/8e+k0QHarJS9aGAH8XnODBhuWUXhpivbkMok0TRUXPk=
X-Received: by 2002:a05:6102:cd4:b0:5db:f615:1821 with SMTP id
 ada2fe7eead31-5dd88eeef01mr457147137.10.1762298259304; Tue, 04 Nov 2025
 15:17:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Nov 2025 08:17:38 +0900
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Nov 2025 08:17:38 +0900
MIME-Version: 1.0
In-Reply-To: <1-v1-d3317b0ee398+50-iommu_pt_riscv_jgg@nvidia.com>
References: <1-v1-d3317b0ee398+50-iommu_pt_riscv_jgg@nvidia.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 5 Nov 2025 08:17:38 +0900
X-Gm-Features: AWmQ_bk2LB2NgRroD72443NwkSJ3-qzEbig-zU0asUuN_-pMFocKpMUHzSTaoCs
Message-ID: <CAJM55Z8SyipTBG8G2wU2euvJhzcjJDp4B8fjm2Djwoonz8xf-g@mail.gmail.com>
Subject: Re: [PATCH 1/5] iommupt: Add the RISC-V page table format
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Cc: lihangjing@bytedance.com, Xu Lu <luxu.kernel@bytedance.com>, 
	patches@lists.linux.dev, xieyongji@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_151753_764884_B52B879C 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

Quoting Jason Gunthorpe (2025-11-04 20:00:40)
> diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
> index 96f8a6a7d60e10..10b8250659b98b 100644
> --- a/include/linux/generic_pt/common.h
> +++ b/include/linux/generic_pt/common.h
> @@ -151,6 +151,21 @@ enum {
>         PT_FEAT_AMDV1_FORCE_COHERENCE,
>  };
>
> +struct pt_riscv_32 {
> +       struct pt_common common;
> +};
> +
> +struct pt_riscv_64 {
> +       struct pt_common common;
> +};
> +
> +enum {
> +       /*
> +        * Support the 64k contiguous page size following the Svnapot extension.
> +        */
> +       PT_FEAT_RSICV_SVNAPOT_64K = PT_FEAT_FMT_START,

Is RSICV (not RISCV) on purpose?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
