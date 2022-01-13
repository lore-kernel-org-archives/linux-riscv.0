Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B061C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jan 2022 09:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=poKfos2MZGQfRSsUJRxqiFt054MGS3mhT/4rfNmuqH8=; b=IkPeX7g+MJjK57
	fGq1Yxt2iIwFwfQTiAah1ITMymdJhsgSEeQcjX8muKs9aN9fbc4Y0oNu8uUTEtMEKedyVpqZf/GLU
	igoNzl2hOJGJnZQ6stx7gTDyjMw/9zIiR7vItyPcA3Rq2KB1BTGe2D0KuiBkvirFRsL+LvTbfigUT
	D37YsuWX59Osbq4VN9fAULutpcqSYQzkSz2Egb1UdyDooiadi72eBgYw9eT8ivyTU5S+c9wmiCgxP
	0E/EqBCWOVwSVPny0WsoQsC0RPlzVRxeBUdo5j11rG4OBvCKrMiVA57XkXbuU/MpF7mgy3V2KlQ9a
	0Xoml70/taBjkgUeAr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wtB-005L4W-3I; Thu, 13 Jan 2022 09:59:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wt8-005L44-FO
 for linux-riscv@lists.infradead.org; Thu, 13 Jan 2022 09:59:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id l15so8874705pls.7
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 01:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/26NmKCFdyFkfIiYJcFH/G1Do9NYxnWEGC+wrY85oow=;
 b=WCQbK9tb/CELR4t9ZnbpBvsCy5s7SHqg+xxKvUWwoAzQ5TaZ7YQLrPC1KRVfFn51kG
 tdrqkuqCRKnaOmTP2wQNNzpcDlsvjHS5cvyRmSWd2zt6a/9qgHNGXgmwKr1wo8CQ+aaD
 te7jCk8QcYzZi1kfkeAx2XjL8CZzDx0MoIBqvnBkYOJm4/zLruXdAAXLvYHEZHSWJK3X
 OtW8Ap9kq+nnSeBEREiMmnhlTFpWLBspLFrdzohZowrJu8Vl5d9wUesxRxjzgnyRucqU
 In9ZE/sMFGhgfw10M+8+WHzS0vuHmTeZCJgOLjkwRSgyNmosMOa4GzLU3+6sLV44rapL
 FrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/26NmKCFdyFkfIiYJcFH/G1Do9NYxnWEGC+wrY85oow=;
 b=W7Jkh8lSNFmZ69qXj/2pQWOpkdKou81c5cq8YVjyM6D0ifAfF5hF+QlLCrwv2/PVX+
 KStXopuL5QWeThZJMxkdQ791z7Lh3hp/60FfUqYoyYC4bcbMiR7C9w7kZKNhCaV80VFq
 wT/zSE0U6bEx2OK4ikLiZfzZbqZpF6L/XFU+EZAhShTy5To6op0qTrFIFP3r6bP/zZYz
 2VC73plG+4ePHR9J7037adLxJtp+BgoPvQ001VIBMKGFcAuRr0bZ2Z3w/iLVllEkHQZq
 GMoj6lppTV5iKZQXikK/en2sDpiZ/vcx9cVPRTu2owuX1M7sGE9g58skktKQThayg5Q/
 CeKg==
X-Gm-Message-State: AOAM5316+0qRy6RJvxfZxsAEQu+RskmsKlwjvCBdZQw+ngLWuXxgBk69
 2ceuAHDiEL8PElbuyroFczC9vA==
X-Google-Smtp-Source: ABdhPJwYDTa3QZM6NO0s4giY1kLRonHMH/lFt4RIS0Gi1GfyiEYzWgKzU+T2dl0IdmUF7YYLRfb+Lw==
X-Received: by 2002:a17:90a:de01:: with SMTP id
 m1mr13809371pjv.215.1642067961546; 
 Thu, 13 Jan 2022 01:59:21 -0800 (PST)
Received: from sunil-ThinkPad-T490 ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id y131sm2270889pfb.158.2022.01.13.01.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 01:59:21 -0800 (PST)
Date: Thu, 13 Jan 2022 15:29:13 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Abner Chang <abner.chang@hpe.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: Question regarding "boot-hartid" DT node
Message-ID: <20220113095913.GA17107@sunil-ThinkPad-T490>
References: <6fccad4e-b579-25ed-6bf3-2fb2a968b243@canonical.com>
 <c758bae4-3578-f062-edfd-f5835ae525fe@gmx.de>
 <CAOnJCUJ6Aoh7881HOSifQTc61+vCTVjxnYORfWM_WGLJQCugRg@mail.gmail.com>
 <7416157e-50d1-3664-7df0-2a45e29cd8c1@canonical.com>
 <CAAhSdy1DOnEGpxPQF7juUSyBTyx9W8KsH8exTpOmTLOnNCMJqg@mail.gmail.com>
 <CAOnJCU+taK16cnfnQtk3QM3s-f4RCUTWENAPe8Nhs-8L29vKew@mail.gmail.com>
 <d7f57c7f-a02c-c245-e1ef-af30bc9f6998@canonical.com>
 <CAMj1kXHXFXSojAUz6EDeoTkqD5AxeFTffA=RyTu5JnsAsAHsfg@mail.gmail.com>
 <20220113094448.GA15466@sunil-ThinkPad-T490>
 <CAMj1kXFU2TeywomSK5anCUihu1Ts-=OwSDEAJS5hq+vRc82c5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXFU2TeywomSK5anCUihu1Ts-=OwSDEAJS5hq+vRc82c5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_015922_539713_2103B77D 
X-CRM114-Status: GOOD (  12.76  )
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

On Thu, Jan 13, 2022 at 10:50:11AM +0100, Ard Biesheuvel wrote:
> > Hi Ard,
> >    Here is the draft EFI_RISCV_BOOT_PROTOCOL specification.
> >    https://github.com/riscv-non-isa/riscv-uefi/releases/download/0.3/EFI_RISCV_PROTOCOL-spec.pdf
> >
> >    If you are fine with this, we can freeze this spec. Thanks a lot for
> >    your help on this.
> 
> Please don't use the EFI_ prefix, it is reserved for protocols that
> are defined in the UEFI or PI specifications.

Oh OK. I didn't know that. TCG2 protocols also start with EFI prefix. Is
that a mistake?

Would "RISCV_EFI_BOOT_PROTOCOL" be better?

Thanks
Sunil
> 
> Other than that, this looks fine to me.
> 
> -- 
> Ard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
