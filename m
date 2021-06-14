Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8792C2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 16:32:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C20061245
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 16:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C20061245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIrCVKcGWp6/NKF5ixv/9RaiG5xopcCG5xQt+wbnYms=; b=Vl/YoHWB6YnKPi
	dDqCPuTPMBv1EsR7mVy2pb3UXX2TVt5PdO/zKoEMZyz7/PHSHETwP3zPslzds2lVmOKzxBJbjNFhT
	1U1QHkHstA79D1K5SwhMQQqUhfxCDux+WbR7rNb/l0oIyrVvBrW05zdBOqV2jJLwq46CON+1h0tH9
	PponQYTBIrQCyeivY4Yj4bDKXKYbQjCqvKzRTBu4GmUNnbpNgYekv5WSydJSwH0metOKdOBV/BpM2
	6x+FGERPeCripUaxhZ7VafCRnmwfSKQ+FXpI04ZIcF6erWm2jjsAyJnAL5q7ZA1wgnJmR+pry896K
	kBNfZ8QH4oUT9zo+UqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lspV0-00F9HT-C6; Mon, 14 Jun 2021 16:31:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lspUx-00F9Fb-8C
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 16:31:40 +0000
Received: by mail-ej1-x635.google.com with SMTP id he7so17481600ejc.13
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zlmxi2wCgt9WhbtdmvFXQwYxxvsh3PG6DG0dZOeCj8M=;
 b=oYEjwtSw1ps8mtrR4cJTl6qYja4hUIlPpys5trsCq74B+IRJcUtSedDyvxzUrqoLh3
 FM88Sjtn4wnILy4IKzv3XlCKVnKIRHfY2uFkvTXBpdak58ISgbzhIhOS4Yu2YVULKAJg
 l3dwAb0CeRU3GkiqtsrvCKYKBTeOo3Kx1SC/2HCyKmUmCzRMv5o9zOaBwlWWYO5tTfej
 /hsTtqtmD9tS8Kq1yMwRpBwv0ckkb9vtedPUugM/RHm5xS/N4Rof4lbNlq0xP/YBRCIR
 qZvJgrmJSg6gGVQk7jqVJZ3Q4bAM71hhZx3hcKIx/CFIgf/1iur2bVfOjeTcjNV2xU/2
 8/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zlmxi2wCgt9WhbtdmvFXQwYxxvsh3PG6DG0dZOeCj8M=;
 b=TEsf7wDRvMGbh12hzIv/NZQINTVmEByee/J6p192Ou5mgzWTGr0tT08kBrxXtiTy/4
 +e3r4NKaJoq4BM/P/O1ihNIGUaUuq1mgaJeMoUiibS6trUNNwXd6VKep/hUbRYfxDPV5
 kClyc80Vg5mf8SSbc73L0AumpKhAM8ZJJM7rLCh1DOEchgYmK+YicxsPATLRoKfHDxMM
 KKpfwA48KBsRAPrnqf6pI8zxSDs7C0/KjBNGdifPGCDtDbv8nMh+5dutasAHIdFZ+ofS
 9JjEPg1gWKjt9ygPsNj1pBqj50JWXawXwAIVhjsiPrkSXfUIB1xXs/917fPd7YYGrAMF
 OveQ==
X-Gm-Message-State: AOAM531RJKx4glIHFI00Z21/S5ugzQwpvrDxR+xDVHwljfWX3lZj1g2C
 scqDogdkaJC0nuz0aS4gKME=
X-Google-Smtp-Source: ABdhPJzHoirpErYXI6gCLkKFOD+VtOVFU/oE4C7pVu5IM7atl14XV25sRPwkvKtViQinTNnZPgFY4w==
X-Received: by 2002:a17:906:b754:: with SMTP id
 fx20mr15347815ejb.201.1623688293747; 
 Mon, 14 Jun 2021 09:31:33 -0700 (PDT)
Received: from kista.localnet (cpe1-4-249.cable.triera.net. [213.161.4.249])
 by smtp.gmail.com with ESMTPSA id h24sm7701239ejy.35.2021.06.14.09.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 09:31:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>, Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>, wefu@redhat.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Atish Patra <atish.patra@wdc.com>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: Re: [RFC PATCH v2 09/11] riscv: soc: Initial DTS for Allwinner D1
 NeZha board
Date: Mon, 14 Jun 2021 18:31:31 +0200
Message-ID: <4070697.crMumLFoW0@kista>
In-Reply-To: <CAJF2gTTfMAGbHv3PN_0BmA1pRqU1UvZny4mKg14AtWKjAm8=vw@mail.gmail.com>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <20210614153341.z2nkx6sazaahhjfd@gilmour>
 <CAJF2gTTfMAGbHv3PN_0BmA1pRqU1UvZny4mKg14AtWKjAm8=vw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_093139_342495_686539CC 
X-CRM114-Status: GOOD (  16.86  )
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

Dne ponedeljek, 14. junij 2021 ob 18:28:28 CEST je Guo Ren napisal(a):
> On Mon, Jun 14, 2021 at 11:33 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Jun 07, 2021 at 04:07:37PM +0800, Guo Ren wrote:
> > > On Mon, Jun 7, 2021 at 3:24 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > +             reset: reset-sample {
> > > > > +                     compatible = "thead,reset-sample";
> > > > > +                     plic-delegate = <0x0 0x101ffffc>;
> > > > > +             };
> > > >
> > > > This compatible is not documented anywhere?
> > >
> > > It used by opensbi (riscv runtime firmware), not in Linux. But I think
> > > we should keep it.
> >
> > This should have a documentation still.
> 
> Could we detail the above in [1]?

All DT nodes must be documented in
Documentation/devicetree/bindings folder in yaml format, so DTs can be machine 
verified.

Best regards,
Jernej

> 
> 1: https://github.com/riscv/opensbi/blob/master/docs/platform/thead-c9xx.md
> 
> >
> > Maxime
> 
> 
> 
> -- 
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
