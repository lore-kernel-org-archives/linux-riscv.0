Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49849C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 07:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rn/MzP1oOYYAmEXLoQV9dn6NmUW0fnHUbfgDpz9e+sA=; b=bI9gjg40Ylf3wm
	CHEbCpkHRjaZollu/JLIUPOa73X+W3RlocdL//nde57dMyJpMTaABcHR72vfTutCFe1iCJyTZuP11
	N3MUsUEySw2bZMFnEGaqRPPznAcauE70OmQQlSB1LFECmxdmFpccimrZs/anYk55wWZ4ttq2eQUu1
	eQXVnodKJnkOoIcpsRAZKnab0qI2lgif9cS+hQUf8MMp9p3+xbS9VrO/u8Gzu4r1qL8T7iPBz7l/t
	m3UlO4bhb3BOAoPtqqKB9D91CjOiHZ+Bvw6YCffj0yICU8dX0NN+VxStIt6Tf+tu7ihLwTcHiDKq+
	Szlw1XVQfbUUqpMTG4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Y1p-0059UC-Ut; Fri, 09 Dec 2022 07:42:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Y1n-0059LH-6Y
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 07:42:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id ay8-20020a05600c1e0800b003d0808d2826so5259812wmb.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 23:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tKo3MYw0O4BLJ3HdSLt/WbLQxAo7BhVnRV8007qKkjA=;
        b=NtecGVuhQCVRNppuEICg1JtvHlZv5plJb26iv0P/WWI4OHjjVryXQUwm+TBW30d9e4
         rgxkFnzhGoqeVeEMri7aT5213H+4P6qQ8Iu7E0CKJDMdc4MCfyDEmByYKAjZSRmizjPg
         zn6ZDyd4jWBvGTmN3hjCDjspTh30NqeRx7xs2r63EFWn+csOxIAApASueNstzQk6Ru6W
         rzwdshpaY7tCnisqQFAzK0W4BNwl54Y/sXcHXERvbnxokrJwDPIkaCN7wMHIlE15/5Vg
         1IP31GL4BvpP9xHOOvZ/NNMkREJKppaTa5mzIxqEqlCL4f/22J3V1aTpuqRA22k4dI3G
         aDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKo3MYw0O4BLJ3HdSLt/WbLQxAo7BhVnRV8007qKkjA=;
        b=30Zox6hgtsorDnaoSw/P2HZgUjy60SV9hSlVJYSDE6fhKEg1lR7WAOKOCqC+D/+WNy
         9eRplqH3zTfSuImtxCHAFkdfzPbM9Di5Zx0CJicO/sFiahdbqVpcAOSVQsw7kfSGoMBT
         +uXdbS7TFwDQV2cQ9gyEasJIl4Tky16geXRZDET9tIx+s8VeXxCpu/uytGXuwpF/aVXl
         PYY/dGDkRRGYSvnDnxBCRrlHtPbnSTdcjaolImPfZzAzW6z0x+djhV4Kt4HJd22CZ8Gy
         2svTrj3oml4EKjw3sBZeWOYBfCJYwo+BjPZNZhE8mdBtM8gWhOKVySaHS905DS7P9Qy7
         HQ+g==
X-Gm-Message-State: ANoB5pnVd18yyl1KA6FI/7HmM2GJ6fu9lveiDp1FapG7zaFGSD8ChaTP
	m4NHcOpGLw3LWPjrDLN7aHuP5Q==
X-Google-Smtp-Source: AA0mqf79P3WQBfC2EaQ19M4FsECW1ADuwzLlc/u7d91DBciiDh/lwB8em8qy8GurCC2WOxxwwRXiAw==
X-Received: by 2002:a05:600c:4f05:b0:3cf:85af:6a4a with SMTP id l5-20020a05600c4f0500b003cf85af6a4amr5208616wmq.25.1670571756240;
        Thu, 08 Dec 2022 23:42:36 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c2ca100b003cf37c5ddc0sm960151wmc.22.2022.12.08.23.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 23:42:35 -0800 (PST)
Date: Fri, 9 Dec 2022 08:42:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
	palmer@dabbelt.com, jeff@riscv.org
Subject: Re: [PATCH v9 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <20221209074229.iexrvp5hkuq3qz2l@kamzik>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-2-panqinglin2020@iscas.ac.cn>
 <Y5Dfog2HYhejuDX8@spud>
 <ae8753cd-038c-ecaa-3a39-72cf1340d764@iscas.ac.cn>
 <28494e11-8f4d-7466-13d7-12e22f8f67fe@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28494e11-8f4d-7466-13d7-12e22f8f67fe@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_234239_334692_2041953C 
X-CRM114-Status: GOOD (  23.72  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 09, 2022 at 01:34:42AM +0800, Qinglin Pan wrote:
...
> > > > +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> > > > +#define HUGE_MAX_HSTATE=A0=A0=A0=A0=A0=A0=A0 (2 + (NAPOT_ORDER_MAX=
 -
> > > > NAPOT_CONT_ORDER_BASE))
> > > > +#else
> > > > +#define HUGE_MAX_HSTATE=A0=A0=A0=A0=A0=A0=A0 2
> > > > +#endif
> > > =

> > > This is coming from a place of *complete* ignorance:
> > > If CONFIG_RISCV_ISA_SVNAPOT is enabled in the kernel but there is no
> > > support for it on a platform is it okay to change the value of
> > > HUGE_MAX_HSTATE? Apologies if I've missed something obvious.
> > =

> > :(
> > You are right. If CONFIG_RISCV_ISA_SVNAPOT is enabled, HUGE_MAX_HSTATE
> > will always be 3 whether has_svnapot() is true or false. I will try to
> > fix this.
> =

> I am really expecting that HUGE_MAX_HSTATE can change according to the
> platform situation when CONFIG_RISCV_ISA_SVNAPOT is enabled. But it
> seems impossible to achive this with a minor patch. Because this value
> is used as some static allocated arrays' length (for example, hstates in
> mm/hugetlb.c:52) in arch-independent code :(
> =

> This immuture HUGE_MAX_HSTATE value will cause no functional error but
> it really makes some objects used only partially when
> CONFIG_RISCV_ISA_SVNAPOT is enabled but the platform has no svnapot
> support :( I am not sure whether this patch can be accepted with this
> feature? Or any other helpful idea to fix this problem?
> =

> Please let me know if I ignore any information about it.

I agree that the only problem appears to a waste of memory, particularly
if cgroups are enabled. I don't see any easy solution either. Maybe a
warning in the Kconfig text would be sufficient?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
