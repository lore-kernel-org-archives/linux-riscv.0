Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69308C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 18:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D60120830
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 18:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AmQeEqNw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bSr7MxHC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D60120830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pF05j04LHGDVSWr3pZoqmaKoCGaMijNIye9AJy0A99A=; b=AmQeEqNwhU4W1W
	jnpixDd9rvKoykUpa/6fKdks4ZPQFmbPztIk0cExd72/K4KbFPqTKuJMzV+ouzfWsllsUaILqa7NQ
	9vLoFJeYdeMVHmKhR0WMgmhFfPhpLzpRL9qR0PcH3CkYdmxRHW5347mKNSOERfl4kWHDuWs+i2Ctj
	WPVr+FdA719sak3nq45CaPcsLrZeNpyyryc7SAL/UI5aORXuZ8wZqbIVglqTEUSlnKSXBbLCgi0L+
	zrqGnPeZcQ2FbWvXbzpACL0obD7bGn+8YP6P8eri5cG8HQ2+qUBqRlKwt6D4XCq6C2kilb7DFLv63
	zP8KtEy2O3USBjVyWKDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEHwp-0006mg-Ip; Wed, 10 Apr 2019 18:27:47 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEHwm-0006mG-Ar
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 18:27:45 +0000
Received: by mail-ua1-x942.google.com with SMTP id v7so1104761uak.13
 for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2019 11:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EWEqtNllEvpYJI4SR8SxraijSXCc4AK8CwC4R1aamEI=;
 b=bSr7MxHCBXn6h0g3WRGDyc2DhbuqqkdN6kW4p22Hos+GjTZLWrFrQlrp7jWHR6ShdZ
 2uemyxpXrWgr4x5PSuKplueV9Xenc396YezASzbUdmimeusHUAsVR9xEc9/Ce4YVvdd/
 +FKf9Ta+3vfdBUTnObARr7b4AQUoa15vGEWKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EWEqtNllEvpYJI4SR8SxraijSXCc4AK8CwC4R1aamEI=;
 b=e5Vi89OA3l/6SMgeBV95L63XjHaSAXJv2Ft5rYSyblmHknBucYuioghmTtCrA54mGz
 uXvClEjpigYJuILTrifS07BbV4nhYHIUSunnkp2r+Zahnn5MCgKN1xlec99UfokV5K6C
 F6zIUwBFkgP5GOGqSx0Zt1R04u5wI1T7Y6pDkhHulNiQGL8wXdUNRzHTsx5CdGGHyIw6
 6VzZdaaGaFUY7n5Rx2XpAJo3p37cqTH0jk542/pTvPLUbeIgiV++e5eCsofLSyGp30qn
 DWpgyguXp5B+I9h6UCt4c4bBj1uymq1mkmL0SlXLLBoGjCPRXUsgYJq8IZKEAIMqMS9D
 kiWA==
X-Gm-Message-State: APjAAAWwlTEbQiyZEFdPP/xezUBTJq812AeumWb7rfyQJbjGUT135Svr
 zCPs0vfcznWjyCl+ehB/paTwWb7noBU=
X-Google-Smtp-Source: APXvYqwuTn0H70bHstTRISusL0AahnZNnh6YVxP/OjhvePO2sj954wCEuY+AbqdpaJkgJsjPfInxOw==
X-Received: by 2002:ab0:6419:: with SMTP id x25mr15686993uao.86.1554920861571; 
 Wed, 10 Apr 2019 11:27:41 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41])
 by smtp.gmail.com with ESMTPSA id f73sm2554816vsd.1.2019.04.10.11.27.39
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Apr 2019 11:27:39 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id o10so1927948vsp.12
 for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2019 11:27:39 -0700 (PDT)
X-Received: by 2002:a67:7816:: with SMTP id t22mr24096520vsc.115.1554920858548; 
 Wed, 10 Apr 2019 11:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190404055128.24330-1-alex@ghiti.fr>
 <20190404055128.24330-3-alex@ghiti.fr>
 <20190410065908.GC2942@infradead.org>
 <8d482fd0-b926-6d11-0554-a0f9001d19aa@ghiti.fr>
In-Reply-To: <8d482fd0-b926-6d11-0554-a0f9001d19aa@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 10 Apr 2019 11:27:27 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKt8f7=DKrvcPg-NUJGbc-vanMNojfDsEiBt3vP05G4oQ@mail.gmail.com>
Message-ID: <CAGXu5jKt8f7=DKrvcPg-NUJGbc-vanMNojfDsEiBt3vP05G4oQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64, mm: Move generic mmap layout functions to mm
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_112744_402843_F031DD85 
X-CRM114-Status: GOOD (  12.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 Paul Burton <paul.burton@mips.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2019 at 12:33 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> On 04/10/2019 08:59 AM, Christoph Hellwig wrote:
> > On Thu, Apr 04, 2019 at 01:51:25AM -0400, Alexandre Ghiti wrote:
> >> - fix the case where stack randomization should not be taken into
> >>    account.
> > Hmm.  This sounds a bit vague.  It might be better if something
> > considered a fix is split out to a separate patch with a good
> > description.
>
> Ok, I will move this fix in another patch.

Yeah, I think it'd be best to break this into a few (likely small) patches:
- update the compat case in the arm64 code
- fix the "not randomized" case
- move the code to mm/ (line-for-line identical for easy review)

That'll make it much easier to review (at least for me).

Thanks!

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
