Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD36EC4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 22:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ov0zuAleHstYabrCiR6TtYmBSi63yLZyHX+cFclL/4U=; b=gLnJqjD1nsmbSB
	TNGQk9cjmmfZ+6VHZ3Ny4A3wshn9moitguwdXW5AxQM9smwP3JKYkEIr8bx6nWoXWy9Rir4n7MtsU
	CaBTM/4InKsA2CbPjhhWIkcUn7XJL7gWLLL4n1YqA7ESQT/OLc8qWm0RFa1pzr55M7n1PwgOy/4ve
	+r76v0djBEwZkUVm2pTUjFNOlVkhdnM7zIS9aLabFreYCbOheNO9EiKf9gPjHLM8KbGRIJu0pl/lZ
	e7D/VDnnjdWmhy/lNNwBTOzg+gVBYs+YfDnDRx2kkmeKzIPdRKNCgSbzds42Vac9Ho09XNUCw9H+E
	EMHoF4TMw1OWV4mIAh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUVQ-00000000iwc-2AmT;
	Thu, 16 Jul 2026 22:24:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUVN-00000000ivy-3awL
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 22:24:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so35849925ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 15:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240672; x=1784845472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PybPTeqqbJDW21nWTn74STz945nRwE+oCCkAETAhAs=;
        b=Q15sBP9glTHTUNEqiKKKqeccwwvL0PS4uLREXJ31hxdDkYePpDiSU1H4lofOpl43+R
         718/cn0BXt9sJsA06+zr9tqNOYcnXIcwTtHBJ9DYHnmnNJe5a7vnypKJ6RBv+MOiQhm1
         xlAkf7V2dEKODHVoXys1ravcjfQLzaJUPEruiA6+fGk36m7IY7zTY45IsScNHIVvE9KF
         gCRcX24FRe7vG2c0UhVKl6XPsd9WAQK+sWw9WMlOK+QlEYdSQL8or56iXOKyMBQxL3mX
         X3QL66ilZPqyhj+PI5CDHisyt536jBu1rqJBcQjZ20wozO9Q8Cd5hvRJ36O4BzVNbvZz
         Dyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240672; x=1784845472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PybPTeqqbJDW21nWTn74STz945nRwE+oCCkAETAhAs=;
        b=UGrZPYzi+nN2+77+cQp845Ixsw4bMvzi/Bw6oAlYZO9dxM4NiD2RdfUt2Bg0dQVjPd
         /fbTwNKRjeEMId5PvwLspLcB2KaO1cm/Q+/lH5J7fZe//dp9+c36dJ60yStlPy4gKrLf
         MikVHTUFsHydzGVZ1bQZTuj8g4nM4F0DKRGfdN8/IDBRnGQBj+IBV6o+E9IPE4lOxcgP
         /E80/g2wRR3ADBdemGRu3lVtpXL9Ff133o/VyreNnEIJuZj4h0YQNUyKzGZ+oz5pCjVj
         2/y7+AK5oTpSdeTLiNHOW846z3TfDG0dEv3h4UTiQfUqX6oollIgAO8AxIjMOUsnFAnk
         4X7g==
X-Forwarded-Encrypted: i=1; AHgh+Rovnkk2TypVqa30AbQGcNPQKMo5jVv+YO7B1ot+Ht92QjFcX6w2rleGvJ5pzWALpvCqpl/EzHKtrHG26w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoLqlcusylyVnHVAHCsr+/9es5nklhgW85tSfRkHGt/XZWKxfT
	a90aY9jQfxmyHBJLHAHf1Dt4rsly3xLgtUYxPHIqWB8Bo7YLdqEqINsx
X-Gm-Gg: AfdE7ckXRpI7SxfI+8o723OvVh0NYOQpveBUVh85ENLMKblky4Y3L6XVN8BdtJ9H3uQ
	Rd6jGtBscrrucjYf74ZVEl6zCeApOFe0PsTPDch4/kVzJMYZvOrndmVvmY8XEqn47G2ZoQAGYOK
	fcww2Ut/79S235Cwr0y21wc3ojTq0dHZlrDoX67jVVvjcvAQAZRk1x+q8CBSGYWnf5pMUm7w/IS
	d5Qs/QjuxJGSfjTTpYft7qnPS70RemF86id8U//4EotsFPGf+hnYw5zNfVrnrByfK87nUDS4Z0b
	ilTSoRd1zVVZMY98I1ERMjETWHHkbxG9QRc/4b/ikaxuDC2cqndMQYXaFS5Nc5ag/Z3eBmBAPJB
	oaMWQGwh9E9j6KowdEkHIf79ieeLidybuXqqNpyeqx7ta/HEj6l5dpQ==
X-Received: by 2002:a17:903:3c46:b0:2ca:17a8:cfce with SMTP id d9443c01a7336-2cf2ec27781mr13004505ad.29.1784240672371;
        Thu, 16 Jul 2026 15:24:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4341a37sm12337420c88.12.2026.07.16.15.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:24:31 -0700 (PDT)
Date: Fri, 17 Jul 2026 06:23:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
Message-ID: <allZOmTRIvot39Gj@inochi.infowork>
References: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
 <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
 <e7a43955e41c4dbdb864e89edc3d9fe6@realtek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7a43955e41c4dbdb864e89edc3d9fe6@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_152433_903696_5F0454CB 
X-CRM114-Status: GOOD (  15.80  )
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

On Thu, Jul 16, 2026 at 09:22:17AM +0000, Ping-Ke Shih wrote:
> Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> wrote:
> > The Spacemit K3 Pico ITX Board has a RTL8852BE pcie card behind a PCIe
> > root port, but the SoC doesn't have any 32 DMA addreseses which the
> > rtw89 seems to use by default. Enable 36 bit DMA ability that the driver
> > has when this particular root port is detected so that the driver can
> > probe on this SoC.
> > 
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> 
> This patch looks good to me:
> 
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
> 
> But I wonder how this patchset goes via which tree. I'm happy to merge
> them into rtw tree and then wireless-next tree if people can ack
> patch 1/2.
> 
> 

These IDs are from my patchset.
https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/

I think Anirudh can move this ID and add them to the pci_ids.h
directly, And I can adjust my patch to depend on this. It still
needs some improvement to be merged.

Regards,
Inochi



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
