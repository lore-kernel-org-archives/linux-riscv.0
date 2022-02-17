Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A81AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIB+kdDwMFCoEQOYBQSFwNL31frSa5evWBU00uIwsqk=; b=eJ8Is8eZ6fHcw2
	Rr12vr3cQDDyPpBJAiXooinA4Wbn6aK0OS7VKsYh9+wBFXh/d2D0DqCfjsiOT1IeU6xheuv4LOxYB
	vfALcgNmEOjUAobK35WM8xKEdReDup3EzGCG0Vla4fdsOmYPawOgYSNQ6ggyIKD3BnAjT+Cgs19jv
	BAOJXmhuusD3a1pxh2iPqkJnC7EM6PhY5Z+DzUJ5K4uu2fKOpWBzKC6nf06KENu0p4iNrlZpgPzDh
	ejwbiPIJtwdIYo4tpXhpaiSXV46kOKjXb1KW6bu1hY421KjzhUL3/iy7EelBRu9CDq6lPveSOVB7+
	Y6rR+xHu2PHtM/9um0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKeRD-009yo3-KY; Thu, 17 Feb 2022 10:55:03 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKeRA-009ynK-SG
 for linux-riscv@lists.infradead.org; Thu, 17 Feb 2022 10:55:02 +0000
Received: by mail-pj1-x1032.google.com with SMTP id qe15so5191337pjb.3
 for <linux-riscv@lists.infradead.org>; Thu, 17 Feb 2022 02:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fnwcqhh2WiJm+E2KIQNPJuGkoPvnjSJ+UBtZWNW9CHc=;
 b=Cesm3oQNnw/my6XDNUnTjVHK/VKYNXbSaAMCwD9OODC79yTE0JATBJuCuLdz2ZuMEX
 vYjXEpoSoohhTuNzqszr9E3C2UdO5E3MT+sVktzQW6Rck54mkh3ZRqwUReS4qIbqPucV
 GCySJJm6Rq90E0fBDJqc+OIAeX8yjgFzZnGhspsFZ2h1HAh+HOBqVGEPz4IWYWki4Sx3
 /820XTBrj11tk1q6TS/E6QJYevrUBd04UquRaaU3N7NfVlX3GpbATqCCg4IHZDp1ECGR
 HuVq+OIiaX2U4FJe7zashtP0fxAiYg93Y+jm12FQ7a0pXTeFegEAIu5vKBf4LbZxtYq3
 ALxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fnwcqhh2WiJm+E2KIQNPJuGkoPvnjSJ+UBtZWNW9CHc=;
 b=E9LT4mOluWqI2C5H2fkHc4H+7PtLzOrQR+SeabQzndAXV7rbucSbK4oKnGzUwDmrcA
 nYvTwDsLEzTsjK7/mQpm2S3i8U78vRMQ/UFQw3xknBKgAtinPGVG29OsbG9LJsJ3hKMf
 pp6MvL8D+8qBEDrbDvol4YNOzK5CUgb+PaAGMddqmAaATMyc1GYfugaA5xuJc7CrEaX1
 0gISFMNwz/Vg4UXfZL4qHPRJ+j0+mKS/OWPdIGiK3V8kft9kZ7e2yyETzvNwFDeyWxk1
 INcAavmK7jQE2HTwmFlmj4LkxmxHFSG0x1lJnUOMw09X7vbceB21D/zo5z0IHYpQasfD
 ir9Q==
X-Gm-Message-State: AOAM531FGMODtIEOvmTsD5G70/F3v6zTa4kLfkctLzlQhY7nvfYhxuFV
 EnkOhl+OB1Ryhn+CCQrjlW0AqQ==
X-Google-Smtp-Source: ABdhPJyqYiv4ku/c/Cu0cd/Ah85FRKAie0Vzan4s13zN7vGnIECKh344pF3tvaNTHF8UA9ka3rVvIA==
X-Received: by 2002:a17:90b:4c4a:b0:1b7:9c92:1cbe with SMTP id
 np10-20020a17090b4c4a00b001b79c921cbemr6604071pjb.229.1645095299834; 
 Thu, 17 Feb 2022 02:54:59 -0800 (PST)
Received: from sunil-ThinkPad-T490 ([49.206.7.17])
 by smtp.gmail.com with ESMTPSA id l8sm50606835pfc.187.2022.02.17.02.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:54:59 -0800 (PST)
Date: Thu, 17 Feb 2022 16:24:50 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <apatel@ventanamicro.com>, stable@vger.kernel.org
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
Message-ID: <20220217105450.GA20183@sunil-ThinkPad-T490>
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
 <877d9xx14f.fsf@igel.home>
 <9cd9f149-d2ea-eb55-b774-8d817b9b6cc9@gmx.de>
 <87tud1vjn4.fsf@igel.home>
 <49d3aeab-1fe6-8d17-bc83-78f3555109c7@gmx.de>
 <87pmnpvh66.fsf@igel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pmnpvh66.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_025500_943366_F5AFACFC 
X-CRM114-Status: GOOD (  15.37  )
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

On Mon, Feb 14, 2022 at 12:09:05PM +0100, Andreas Schwab wrote:
> On Feb 14 2022, Heinrich Schuchardt wrote:
> 
> > On 2/14/22 11:15, Andreas Schwab wrote:
> >> On Feb 14 2022, Heinrich Schuchardt wrote:
> >>
> >>> set_boot_hartid() implies that the caller can change the boot hart ID.
> >>> As this is not a case this name obviously would be a misnomer.
> >>
> >> initialize_boot_hartid would fit better.
> >>
> >
> > Another misnomer.
> 
> But the best fit so far.

Can we use the name init_boot_hartid_from_fdt()? While I understand
Heinrich's point, I think since we have "_from_fdt", this may be fine.

I didn't rename the function since it was not recommended to do multiple
things in a "Fix" patch. If we can consider this as not very serious
issue which needs a "Fix" patch, then I can combine this patch with the
RISCV_EFI_BOOT_PROTOCOL patch series. 

Hi Ard, let me know your suggestion on how to proceed with this.

Thanks
Sunil
> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
