Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F87C5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cb4Av4u+DeReHmqB/mkpRpmyGwwcoNt8fspsiVzp0io=; b=A7IKwbnNTozRQK
	WFrZ1soxJNl0/c+TAaHPnigpXMTzl/VEjQH7FaeHgOBDunSiicX2L/24AQnsnY+d7KFxe5VB2wYQb
	XCgkXVWsUujeslnTx7da5USKTZGqo0jmAzRJcwsGiy+hQbb7JXdRv7d0iPGS5yTfXwLtt8cjMGkbV
	suZFW3WW1Ab1P9zmEGJN7WDLn4zieDDqImARJwq4XuKOQGKNRPZWmQzvlo4v+VihqxXtgYLxC2xgO
	Bjy1cQE+C4bBaw1AsYXaP4/AeDAbxqx8Wp1uTSi/oD+e/uBlvr98IfKvP9qrojNJpbcTBx/jXp33J
	Cp2bVxTDdUz7hecWZaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSEx-0000000B7eb-1Kzr;
	Tue, 03 Jun 2025 14:03:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS0a-0000000B5JJ-1mv0
	for linux-riscv@bombadil.infradead.org;
	Tue, 03 Jun 2025 13:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=; b=pbO+qoMuFoB20sMbrFR4LpAapC
	4hBaUDWZX1flQHIBnmFP2NUth5rGF3MPCgieN5OsT46DV67odi9CB9Yx4YPcw+vQw8/zhHc8YqZNM
	Eb3CfJnlRK4+ItKYg2bdSNS53pkvs4wdrVDZKovw9ANBiBq5oB+HIsEssW7e3Bk1bQsxF5Idg3ESR
	fzB1wGddcOPsNShPRdYFUcrrP555012WiRJnHo1BGOl5w7nVVDsEzp1hT9Joy1jmKE6y5wvXXFbbV
	vnUjsJ7U3deVUt4lRg3wTDxtTtkBxb/ikLnpky8x3xVUh3Rr2q8/una5jYJF5adGkgHI5NmB9Mt/t
	Mulha+CQ==;
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS0X-00000000lZt-1sck
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:48:51 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7d09f11657cso511584585a.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958525; x=1749563325; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
        b=aQBA1l0pR0YWIQXZWttLaAJCMmPZZLr+4zJBGF0AmHv+P7MSfmJA52FGl29Neib4Vp
         bY5sl3kt4n+YjAYp4bzVvIjD5M0gs2PKhmsLzqCPSoFmf6mq9K3KhEyr1mTgEDM1sQPP
         ag7DANIA7miFGBgY4mgJDErzQzhJCJnvUui2kYxIzSQZJzCAi12Aaw0+98sNhK59puaU
         sh8RSd3CfCEsPn/kHUS68ibBQgams1cEwqb8gdxD0wmvLvg1Bl9cE3ZJCByI7Bc4jYzH
         Vy58bZirD7FhiNdzouxOVutqNquVzDBchVHby86edLvhtQlGXldEIwV23CxF4Q94GCpo
         usfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958525; x=1749563325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
        b=R0r+BWyzc+SnH0wKDXR1hQrFBV46NQ8E5GxxMfxCvukHWc0uCAlcXZwVy5/55psoqZ
         jF1btgLSI0IKmRVAhRfnvC94zoHcU3VPe+/bs4yatDmpFCEzxTCSCoQJ+YD+xw/vwV3O
         2hOlw5ksPFp+i6m38sUhR+2CF2tDaOpgfoya3pO3B5izwspdwtQ2fm9y2sbtYRLCwP06
         Sk5WEUlvZHRH5MIfejfjJejoLfg1lHMVryjRahYuKpDVvc2MpU1Q2q7iHK4xOdXrDhkO
         zIai3v2vtRINRyE+SMNDiumkqBdTA1sS2/6KGWC0hNH42PyUhr9DRqvCZ+RNUhFnhy8n
         53Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVjdNzRNHv3/szsBscNMZGw/lRaqDQdfinkgVLzGoVmkyMjEO0L5IYhRUHjzmXuua6CmOgFuC3UTJayDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYrlBYJUkKjyp7IkhiXCx+iSTl/CP+z1OMpjty8PK31Q+VF+vD
	VgMU8Amb2EtzETXs5iCE5Pmzii+mSK+r3ZEpMupaF24pkMCUqVu11+Dg+FPeuYHOYTQ=
X-Gm-Gg: ASbGncs8s1i5i0RJmsB9QanIZdNeImKCKnCsoz/jKdGymSIqtT7c5FmsGRQRv6DFkon
	8RtZcJjfASwI3wUJNBV9911Kglulje/VhC3/v0vGdL2CIhDWDSrrKwmON8LGSWSIbouu3ErwjjH
	fmXqFPcYtgGiVZT2yapp99gYSsadfGZNRpDGlkeTqGx//uKFwkpC65RxQ0MBH/BUfIXi35N/Sai
	z/ucmIu1f4k08z5XKf1DJrJNum4/jZ26RwmZGZJ9g4vqYXfYrP2Y4GzHxqA0LbtOUU0XY7dh9zc
	UqOE478z7obL4+rYWIzOudDJUDNrS9Ymzns2hLEPQH0bCkLnajCpFEIdkBc0K4Y6BfWe9AmpMHt
	rBdfUIx3d9NtG9EHzpMBphM4t4JI=
X-Google-Smtp-Source: AGHT+IH3Vn4y24ccOnNjvyrMKRdXMvoXmINXxWtKUHHRDjsnlypx2qCEJce143rhCfMATkU1PKi1PQ==
X-Received: by 2002:a05:6214:27cb:b0:6fa:acc1:f077 with SMTP id 6a1803df08f44-6facebef794mr265266426d6.35.1748958525108;
        Tue, 03 Jun 2025 06:48:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a10e844sm842209085a.49.2025.06.03.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:48:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS0S-00000001hBt-0o7d;
	Tue, 03 Jun 2025 10:48:44 -0300
Date: Tue, 3 Jun 2025 10:48:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 08/12] mm/khugepaged: Remove redundant pmd_devmap() check
Message-ID: <20250603134844.GI386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_144849_572397_8A685E50 
X-CRM114-Status: UNSURE (   9.30  )
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

On Thu, May 29, 2025 at 04:32:09PM +1000, Alistair Popple wrote:
> The only users of pmd_devmap were device dax and fs dax. The check for
> pmd_devmap() in check_pmd_state() is therefore redundant as callers
> explicitly check for is_zone_device_page(), so this check can be dropped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/khugepaged.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
