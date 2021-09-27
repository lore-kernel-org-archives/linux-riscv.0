Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743DFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 15:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B216044F
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 15:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39B216044F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1xI82c7F2W+sqb0r5SkHg+Fbu+LdsHXbmW9KDpvRMQM=; b=J9r2RwYDft4gFV6mWb6Vmbegnm
	WEaMsqB81IwlyNOH5BE0Bp1NwttGftzXAUcUKEceS4YyVyOnblYGl0fNIlVPiEHkYKq2lGIakVCGm
	OdN2Ju4rkJBgPUeXr5GDMiuy50C5HtlTZjtqDGUXJc7I2CYTx5bXDfmL1IDJSRkQF9nUdtmLXr01l
	IPvxXLwmxLO+KFpEkW69Bg0Hl4Pu19eIEv0cDNwp1FZ9u085HBFn1i9wdXhVgEcnZKa7RXDJTncV4
	tsCTo3sAJkw/i0XQ7cRLsciElZJnEXlh5YRrp8pM/PtqWz0Ju/nIDb+L/X9c8AL7/CRGRIzYWp1Sy
	ttNrqXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUste-003FmW-N4; Mon, 27 Sep 2021 15:50:26 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUstb-003Fl7-LD
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 15:50:25 +0000
Received: by mail-qk1-x72f.google.com with SMTP id p4so37453896qki.3
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fK+4h0EJwaMSD2x6rftGtPSuMDA+UA4oyDqS/nR5n+Y=;
 b=4a9djPzWZoJLHohJqhkJeRLkGcHG+3whETng6oB6w2eknFpjSghW/f/LyprRuEtWUk
 0otZMjDGKMxcTdyvy6y1Zn/JsGx7cniRXOjN0T6vehAqCHXwltcE5LblNIKrQSSLZJHa
 ROUjkLikM9LpUfdqE3KPD0TPwGUGCzmEsoJ+0Em2Htw5e581JTJKzYM4SWqynxXNncQ1
 eivj6kQr2J68GjoDBQK7wLmSB1Ss5CGk1eXAUgTlvjLDoYhXhH1OPrxSxuTRFEym0fC2
 LckZlozhH9dL8l/LBPv0EVKABoR56AJ684262bIrrea/E5dfYezfQjFYcLpu8Dxm5Nb0
 /tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fK+4h0EJwaMSD2x6rftGtPSuMDA+UA4oyDqS/nR5n+Y=;
 b=wA4tD0jXArvo5Z17AvAp63mBiJ51nL4a09wmIBPSawCDP8Nz+R2uZw6Aux3ZdU4gTJ
 AkWaorQZx59jFlUV3ywP0MMMbmYop31CClNGAJUgngbwgjv7GtbWMhK7QPx3CULSRhYp
 S52ylUtWkfuCvXOAn0AqzjTPadSvWjlYpj6usQHeVeYyzCtbBkSK1+B79QWrbcnzH3zX
 YXTeuDTtJErZRa83twJXTJwhPh9k73p1TJDab1GhFczYPJ0b20DN6+kZWgv2zYrX7tf3
 Uiq2RlUHmEybEWi2w8OLi8ff4aaobZK7F7x03/IApxEpOPDy57ChHlYNRk6lm7Mh9I3M
 ricg==
X-Gm-Message-State: AOAM533vWX3Ue2RgPeo1WVjbEyNkrTrjEthrg4/KVEdZ4oaGovjKw7rJ
 RaEq+mQqIgMJ4yBwyzmafdudubUGZ6tEPQ==
X-Google-Smtp-Source: ABdhPJza755zYYRa3JVKPjIslZcj1wxM5Cw10Fvq6ZNuWT9ELHFtaJfbmqql1geu77PL5dtxv/8ZVQ==
X-Received: by 2002:a37:6350:: with SMTP id x77mr662950qkb.356.1632757821000; 
 Mon, 27 Sep 2021 08:50:21 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r139sm12707785qke.84.2021.09.27.08.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 08:50:20 -0700 (PDT)
Date: Mon, 27 Sep 2021 08:50:20 -0700 (PDT)
X-Google-Original-Date: Mon, 27 Sep 2021 08:50:10 PDT (-0700)
Subject: Re: Status of the various RISC-V specification and policy
In-Reply-To: <CAOnJCULY28Q+ucvNp8Kds6ZJOqb46c8bdg9SyV58g+VQ6_MiYA@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, u-boot@lists.denx.de, ahs3@redhat.com,
 pbonzini@redhat.com, Christoph Hellwig <hch@lst.de>, drjones@redhat.com,
 xypron.glpk@gmx.de, 
 tekkamanninja@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 ksankaran@ventanamicro.com, 
 ptomsich@ventanamicro.com, anup@brainfault.org, stephano@riscv.org,
 markhimelstein@riscv.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-1cbc22a8-5c74-4ab8-91b4-4b092592385e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_085023_792591_8944A960 
X-CRM114-Status: GOOD (  16.07  )
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

On Tue, 21 Sep 2021 17:20:17 PDT (-0700), atishp@atishpatra.org wrote:
> Hi All,
> Please find the below email from Stephano about the freeze announcement for
> various RISC-V specifications that will be part of privilege specification
> v1.12.
> All the review discussions are happening in the isa-dev mailing list. The
> review period will be open for 45 days ending Sunday October 31, 2021.
>
> I just want to highlight the fact that the *H*, *V, SvPBMT, CMO extensions
> are frozen now. *This will help us merge some patches that have been
> present in the mailing list for a while.
>
> Here are the ratification policy and extension life cycle documents present
> in the public. If you have any questions regarding this, please check with
> Mark/Stephano (cc'd).
>
> Ratification policy:
> https://docs.google.com/document/d/1-UlaSGqk59_myeuPMrV9gyuaIgnmFzGh5Gfy_tpViwM/edit
>
> Extension life cycle:
> https://docs.google.com/presentation/d/1nQ5uFb39KA6gvUi5SReWfIQSiRN7hp6z7ZPfctE4mKk/edit#slide=id.p1

I'm still buried after Plumbers, but one of the bits on my TODO list was 
to look throught the new definitions for frozen and stable.  Nothing in 
this extension life cycle talks about the point at which compatibility 
will be maintained, which was really the central point behind frozen 
before.

Are there more concrete definitions somewhere?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
