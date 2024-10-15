Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3415D2169C
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0C1+HrhoSPNau8yF4NOD/x578ujbd6CiKNbH5p5CEc=; b=hywvgbAYjPRxWX
	7mIX30uFxw/G3wzSd8srwx60sBniLiRGWB997b4e3FOjCv48ofKV3MRpTTP8cEtwwQQdsjkpJ4gJn
	+2f3H5VVqovNFKlqdIA7odLceuM5MiJ1lDUgrhxAhHxsfjId25txyqdn2qdJJuKfQKrtkqNhPhsi2
	xmjzp5nQETjiCVGI9Tm607j5Lo/dOJMYYIeAyZBi2R1lHhNEJ++w/xlCCA8425kd3rVWp2zoTGmKn
	/sLIWVSoQtHNlmPIAGpeOi+dAZhJ0ddFFE0Y3F56hekZMmXxByk/L+Sf5KBVSJJC7tg7SmdlO7Wrn
	edbgnHswNjGCd2Tq7sPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hOk-00000008J1S-2yWr;
	Tue, 15 Oct 2024 13:15:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gOx-000000087Mh-3rFo
	for linux-riscv@bombadil.infradead.org;
	Tue, 15 Oct 2024 12:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5kR93BfcYG8S010p0eA+geMSLv40hGuP+w3xQj67PSI=; b=WttrRJ3tgbrSNJ5oC0aOpIA2M/
	bXrlZWjvTTsOQh5ImA6Hazv/brSOa+MJm1DeAjMrgsfgvb7gmnVKmZ0lScufLiMlt3xoR0tr29itq
	xhHJpq66m/UT9+EgBcRhPOeHyI6gjtlSgufJe5PUxKCw97d/8jc2ZeT0LCMb9km8kg04LRK5LlPUd
	BFMwytzKvWMOGciPTEIAEdFiGex+tM9K7FQyHeJt9R8E7Ps/dkzNPbYkHt2LoDmWd4N6vOT1d05Jj
	ROr/XJuie1me/vTMeuLLA9wfrD3/n6DRgrIj1VZ0HuJ8pjTqnz5j/uhgrkLABGSQRBltFQ8C+ibAA
	ovMM49Ig==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gOv-00000006YH2-0OCV
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 12:11:46 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e188185365so4064154a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728994301; x=1729599101; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5kR93BfcYG8S010p0eA+geMSLv40hGuP+w3xQj67PSI=;
        b=nsFk2qEuwtoJgAj2f1pDVyFxThvtnum3k6n/6uLEvgi3smz7To28OzoqlXFnzTC0K5
         dgyViKkSu0PHwlTEVbAgtO69G/fNaIiXgn70DZYVRXDImLwyoUr+P0Qi8YEer8PKQTJf
         uUIoPytgVcKWrCPcVsKg09DXcsfqeKUhsplAGInoqJSXVL5LPilldpKkFwKiKBqUuM2X
         Q/ye0SqDZaFuRRuPhaeVWK4TMvJUMLp9VAnZw5LxVlPdili2V8lknAZZaa6k+bLPnr3D
         kERTaHsXXHiwNRlnC6xuEfAWrUBO0RcgTCrCth6TJLUSl/T10Bvk+dJ3+KUbLkUTgyzx
         c2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728994301; x=1729599101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kR93BfcYG8S010p0eA+geMSLv40hGuP+w3xQj67PSI=;
        b=k8n9lSdGnb0Bry8TYj3aLBbAb4P3RVbAh7TMbcD4DXFwSrYwbhQK15HEuoQoUD1CGv
         zdn3VcrWYCLOUZSoBR4H2spaBK2IaAjGZ4rhZwpk/3GSHlZeaCPRXV9g+xUdgjJ2xfQq
         9W/j/p8eEb27+KFpFkupShJjiJRPV47UnlvMV55LWib3YAtjX+RW4YTVBAIZxOxAdh/k
         3iBk0NclAYDn46txOSp6SLWW+FkujQC6IOt4VBxM/GfnsgYKTvZb7nPhGv3UJGVpvzVi
         deE90/q5gOQKp01TeCU1/A3syd52ojcsIUsVH/SdLUwR3Xx57HQRvMWSdD9siqkjSOLV
         xm0w==
X-Forwarded-Encrypted: i=1; AJvYcCXmVVqin1qv/lMyKbRtnodX7iSkEUt6SntDP7yFAo8zdxCgbIwD7cOPvjlPCee7rRaa9ZChIwCxK1gajg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdipUZpuFSuotVKoU+OjFxSQ881+qC4C5UnG/03BItNIZ1giIw
	hHAc6k+h3JD3mb4p0zmOcsQacv4aRj7tmT2Dt5QZgWmGzGtxD+H4
X-Google-Smtp-Source: AGHT+IFIzl/30qM45epLPZCQITKrZBt1dkSO9qHNajeeKYGWRShGqz/Kq+Gs+dPNUskAsu4ChEg+zg==
X-Received: by 2002:a17:90a:8cc:b0:2e2:c64c:a1c9 with SMTP id 98e67ed59e1d1-2e2f0b2b844mr16980466a91.24.1728994301311;
        Tue, 15 Oct 2024 05:11:41 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392f62f09sm1552323a91.35.2024.10.15.05.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:11:41 -0700 (PDT)
Date: Tue, 15 Oct 2024 20:11:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Guo Ren <guoren@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jinyu Tang <tangjinyu@tinylab.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
Message-ID: <fzwgavmdfdm6ffzqggdfcf7p6d7vbnrsmt6vxc2whx6t6e4pif@mjvchtdmgh54>
References: <20241009224410.53188-1-inochiama@gmail.com>
 <20241009224410.53188-3-inochiama@gmail.com>
 <87ldyqfxm0.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ldyqfxm0.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_131145_247005_C12EA9EE 
X-CRM114-Status: GOOD (  10.88  )
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

On Mon, Oct 14, 2024 at 06:38:47PM +0200, Thomas Gleixner wrote:
> On Thu, Oct 10 2024 at 06:44, Inochi Amaoto wrote:
> > +config THEAD_C900_ACLINT_SSWI
> > +	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
> > +	depends on RISCV
> > +	select IRQ_DOMAIN_HIERARCHY
> 
> Lacks
>         select GENERIC_IRQ_IPI_MUX
> 
> Other than that this looks good.
> 
> Thanks,
> 
>         tglx

Thanks, I will update it.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
