Return-Path: <SRS0=iP4V=U3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C67C4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 08:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58DD72063F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 08:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h5bIMRds";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="oWJtgVZN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58DD72063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guiYR8fwraP4j2knvZfcGi9xmj3QR5QngEWA0sn7x9E=; b=h5bIMRdslGUv3i
	lEwk1fAZoxm720rKeMgeJ7oT4vBibiYIIh6vtFkpgsX0P3Wu8ckwDqRjNAXSrKXlZ2jC2FwRnh5Y/
	9Pnv2g0z1ukN6dbpj64RPQ/gCV1ykykEwX8F+ZSff1CXCW2F+LoUz8DCdum/NlVcHTSeqhc6K4xx2
	FgH+XoV6TK8IX+wBsOIHaa8q0p4QC4h+deSPQWG/x7ppJo5DQzoHmdVW5wis3BwgPzPqro2GqPNOR
	WPN16kWG/mMbrbmRJkXF4rWU0AXHiKds/l5w8xgIAUexarTyoWunUu2VlBhDvsCYvx+sy46ExVQpG
	jkuyz2PbBImsFgJcuxLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hglz1-0008UY-Rm; Fri, 28 Jun 2019 08:11:47 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hglyy-0008Ti-GX
 for linux-riscv@lists.infradead.org; Fri, 28 Jun 2019 08:11:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id v14so5277190wrr.4
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2019 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCpTxAtx7Gox0ly/Rcn3VhBaBe6jzaTmlpMDWghDd2s=;
 b=oWJtgVZN08S4wJBdsnW+t4Elfr9LOla1+FSdzldR1D6cuJ3Xv5/Ryg5Fb0/vbJ0Ing
 ZnynuxI7rt3N/ro9D4RaP/0iu61Wphu+OlSVrlixlsLWYKePEhL9MASSBWCbBFXzRCct
 lRJNZZ1CPQY8iOzW35XSVqcDsUferC+85xjMZ372aHYapyZCLVKBQ19LYdomqVIYYklC
 YG6b+wlXEM6wh9ghNYkoMiem2laH7vBvrK0TTTtaRacRSLACpESrmHp042ogzVoJR9ma
 mRr8jUVZ+UN68cC0FD7x5uMtP8LFsf/2HNSXXgCWc9eoFLzfPGNCRIwpbulrR3YaU1Xm
 mHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCpTxAtx7Gox0ly/Rcn3VhBaBe6jzaTmlpMDWghDd2s=;
 b=XJd1UvpeOKXElOt3OL8k/vFfT6uUHSJ2hYoL7vhgHxhS2Bav9Zve3efaMUVtunar5D
 02ec7pUnzdoF38rUHcZeiMDznwT575jYoNL23YIES1I4cIhb2Z/K2x2LjjGjRc/J4gPb
 06XbIzHBA0OHvB7XeC5hzqLcJpVcIimILS8e8s6r9MKOb6IHCRzcBJPRguvSOp3YRuzo
 20c44Lx6HdBpyjvCb5iYDNd9LQGYIu7zMCs/rMBq3+8GwRzZYi9oOaI9mXBtnEU3+Uxt
 0zfm0d9IXvHfT6SlnOGGrEujQ4o30DzwIw6XIMfmDAj/3s3yeQaqNHUd/aYHKPhnorXL
 sMJQ==
X-Gm-Message-State: APjAAAUB7pCTmf4lnPGtPn/Qlj5nRjusz8QrdtJI4UcL0bo8qfBdbvXF
 BCKf2+Q52AJrjUBCQ620+8DFUm3pKZVrgw4GSlUspQ==
X-Google-Smtp-Source: APXvYqwIHDQTuc4pFKBzJyIpELPHJPv9W42ioKjX7g7/9eAllOX9o9vmpzm5Ixuos4IMh7Q3N3sKSw2VVAlkJFN+PDA=
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr6935070wrt.227.1561709502166; 
 Fri, 28 Jun 2019 01:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAHOvCC7EtFcYQDAQoenP7RdwW-4FQEex4FG5jLR2W0m+Q8t__Q@mail.gmail.com>
 <20190523095214.GD23850@rapoport-lnx>
 <CAHOvCC72URVWs8RswjqeewKn0rnoik2OespWkt+d+RNhdTHOAg@mail.gmail.com>
 <alpine.DEB.2.21.9999.1906272304180.3867@viisi.sifive.com>
 <20190628061138.GB9834@infradead.org>
In-Reply-To: <20190628061138.GB9834@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Jun 2019 13:41:29 +0530
Message-ID: <CAAhSdy21+qPp5NGrAsxEV_pzA65qe4ER=rQZfz2RNQrs6piG5Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: using page table index in setup_vm()
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_011144_577718_4785E41A 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 JaeJoon Jung <rgbi3307@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 28, 2019 at 11:41 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Jun 27, 2019 at 11:04:56PM -0700, Paul Walmsley wrote:
> > Hi
> >
> > On Thu, 23 May 2019, JaeJoon Jung wrote:
> >
> > > Thanks for your professional advice.
> > > I'd like to take your appropriate suggestion.
> >
> > Are you planning to repost this patch with the new patch description?
>
> Note that this is going to confict with Anups bigger rework of the
> area.

Yes, it does conflict. Thanks for catching.

Refer,
https://patchwork.kernel.org/patch/10980791/

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
