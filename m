Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5544C4708F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E708F61074
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E708F61074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=l2TNzfrnh2qIAWBRQMM+Eia6qS58LpPmoQVvioldV7Q=; b=Hss9bLKp4I8oZbPHJ5GHIINzQe
	hfEmYuFob7H7rsxbNw/sGHvk3VRRbmJa0JGCSVgBxJI8dLG92LuPQC/r7Ds+ZaI+6Jq6DlmP5ByN8
	z0Tt2tVe4/06hbivtBZ74PWw36pg6IrrrV2yk2PBuIZhhCOmCtDX/YpD/PdY2Dn8AOb0QfZeBdUAR
	BewTlAPyFm/WNPr9dHyyVJB7BNUift1dnZq8Ds18eHtya2KAEJVlkViuYgOcDlSoc1t3W3SeflI54
	Lc89Mc3beCDHtQ6GHYsd5LWg2pOAqcutlM6NcpFWVtQurl8eop9Ic3iMOuei+7UH1TVfNYoS5fS/T
	Oi5Gkisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln8hR-008c87-W1; Sat, 29 May 2021 23:49:02 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln8hN-008c7R-HU
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 23:49:01 +0000
Received: by mail-pg1-x531.google.com with SMTP id f22so5455033pgb.9
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 16:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aCLcnsFehA0whsoi8QGqBncN2kvRCW6NwZZHWI5dQsk=;
 b=gat21H51KtiR21Pf7oinfjVK2dvETUnZA1Iy3FS/Zl2brmeGIZevrbHXw9ZGDVeH3v
 ltOkzhUsLvGODIgQgXqenHFPKTbVHJEB2KBkJISdurFqqs6ot+HSDFeFhlkmWwr36svc
 uloy3+uU7cYAG5gcOLxTHZDAhUIfoZ9+sewJpB5yFr/II+zFrv3lxj/mbK+K3PmAr2HZ
 TvIvishUvOmsx9yhjbF/6mYWEi7vZ5znnjDfOCoV4HHQo2DKH57Mrnc5hRfuBN9noIdw
 p5EhcRjpYe4O2H20ZN8NPB+qRc1dzpPrKbE0TkEWGYM/9rnI3vQSs2EPk2YACOpQK+To
 9RhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aCLcnsFehA0whsoi8QGqBncN2kvRCW6NwZZHWI5dQsk=;
 b=jmHyaRA0p9NGVBUWM203e1CrA0y0oYL0yTVyBnsAqUXD3TavCwoyT7oi1RYzvbP06Y
 OEzZ944CAmb8ZGt+2zKsuZvAWmNanyHiRffzJCG0QBe9q8WaSXwh7qB5d0dj2sv5OSgH
 B3pu7ldEfdFAb673qclp8OWeAPYG49/6Snk10IdfRS2K2N4agO1pkHFF46fIr3b2CT9n
 7cegHnrpKyDmdoJ84rK2j1Xk2zs17taG0w4je+pyE+T0YhmlK5kUriO0L9Yniubx2+fk
 XM11dwl10e46AQCYq5z2NKtOwSBFvtGMdVBeLPSKMxJhH9PgEye/N3d+WC4Ek4cLye0D
 COgQ==
X-Gm-Message-State: AOAM533Tcjg5HGAaS8cxWnEe0mwua0P29B2ykLg9ZERnVJ8eVEdLCncP
 Cx4AveHjMfoJW+8qQ24RavwJVh2ubDKe8w==
X-Google-Smtp-Source: ABdhPJyRRlUumHZb7inq+fGcEvXCyZDFT/wx2DDwxonUMxrGIkmatPbjXBwBXHjfcQhcYbCZbz+d6A==
X-Received: by 2002:a63:79c3:: with SMTP id
 u186mr16020640pgc.203.1622332136621; 
 Sat, 29 May 2021 16:48:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j20sm7181239pfj.40.2021.05.29.16.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 16:48:56 -0700 (PDT)
Date: Sat, 29 May 2021 16:48:56 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 16:48:52 PDT (-0700)
Subject: Re: [PATCH] riscv: remove unused SBI helpers and exports
In-Reply-To: <CAAhSdy1zYdEgAVtePY9weOvzbnZ86DupWzoUKSn3Q98FDt50Ng@mail.gmail.com>
CC: Christoph Hellwig <hch@lst.de>, pbonzini@redhat.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-76155150-9e67-4125-a970-d805d38c7831@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_164857_657184_2EBF3A9C 
X-CRM114-Status: GOOD (  17.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 27 May 2021 06:24:10 PDT (-0700), anup@brainfault.org wrote:
> On Thu, May 27, 2021 at 6:47 PM Christoph Hellwig <hch@lst.de> wrote:
>>
>> On Thu, May 27, 2021 at 03:15:09PM +0200, Paolo Bonzini wrote:
>> >>> -EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
>> >> All sbi_remote_hfence_xyz() calls are used by KVM RISC-V module.
>> >>
>> >
>> > Why aren't all these added by the series that add the module (not talking
>> > about KVM only)?
>>
>> Yes, that is the way to do it.
>
> Actually SBI v0.2 RFENCE extension defines all these calls hence Atish
> added it as part of SBI v0.2 patches.
>
> All sbi_remote_hfence_xyz() are primarily for hypervisors only.

We took them early as a way to help make it easier to handle the KVM 
patches, as at the time these were the only things touching files 
outside of arch/riscv/kvm.

I know the general rule is to only take code with callers, but these are 
defined by the SBI so I figured we'd make everyone's lives a bit easier 
by just keeping them around.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
