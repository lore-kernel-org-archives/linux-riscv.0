Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F0CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 08:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A45E1603E5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 08:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A45E1603E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WS4vmR7kj9I2hDgchAVLITqhybnVM1yyZNRIC2HVcGY=; b=QzO7eB/CkOWGsC
	mQSlTu325iMI7mn3a0Q1xqHZXHDiDUqSo+H5xRgWz3iaes1GWPyUF4EJhAnltFpKXwC6rfetYw11x
	RJNL7kokcezocweEqPjdP03WmQqpg4fC2ObufFHra2x/XXY3VdyMI0/oPn503kVVAcx/kGdzBzKpi
	fHgtPwSPFiqm6tV5AWtOv9cR1EwyX0cbSZWopDb2/7Q/fgEA4wnf4nJelQDTxqirHbvMwPTRg20Ap
	OIYnZVqXhZbuPcHpSwYn+B/5Zqiq8lxxn2LlN2kHtDW8jP7qtxdN0a0iMoOjLJ4JsCL1YtZQD0wQx
	/VjCUgzWs5HxzYY0c93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZP6-00FWT2-34; Wed, 13 Oct 2021 08:14:24 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maY1N-00FCRL-Ls
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 06:45:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id x4so1141522pln.5
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w0j2Ihdi/0685L8FT6WteZp6O1hKULY2lNZfHOgIHSc=;
 b=ZVG9fseiMJi5y7uNc0U//uB9qmTc4gJH0ueiRXhntI+xclAF1mY0ZabBN0HENHjmuQ
 Wd2tZE7h7XcVk1DbOBPcKKRzFh73LE1iY97UMVdM/LDFC8CDxtoZ3SUXBlDw8iyhvu6V
 muglMpS8KRkUeK+EwwJZIYurw/HXNEkgWVJds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w0j2Ihdi/0685L8FT6WteZp6O1hKULY2lNZfHOgIHSc=;
 b=sOgPdwNFMXW9YkFRPkfeA4lbp/nBGre6MCrzgtXw1aIGbyZ0ww2DJv1C3xWn7/twmj
 KXT7gRi9nO/Sa5VAB+dK8wz5qyWs4Eq+NmxaoG/AuG0wvQQVuXLhskJNOKFKaiP0QUIJ
 1rYBr18OxeB+tUi4JhSak5ZSHrYs+XwIdg42CYvQHfmo4k1Rg0wE/PVTxj4XMmLk1rvU
 yb6LQa7lNIrSir4R6HeMTltyKFgb9yYSlELnpt/He+3GPFFN9nokGqlN5S/IyHRrcbCo
 GAtuIi60TDRLd1iZv7cdvs63BkjyJUrT3CTfzCNrR12HJV3Bl8qjO8Ebfs0oK+X5W+mr
 8i4g==
X-Gm-Message-State: AOAM5333KCQUEpVR6Bd8Qv40vm8xG7UU1oGaTkRTFVNGi1991htcxzcl
 UxdAfZhjoW82ZiidzqQUXzRsyA==
X-Google-Smtp-Source: ABdhPJzjo8AWROfTHh1Xk5YI6pRx05t7IBlItdI3oMMrcEgEqW1hgXJ6mKwWSXyPV/CEcnXRlFzD6Q==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
 oo15mr11233854pjb.169.1634107548649; 
 Tue, 12 Oct 2021 23:45:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i124sm13247931pfc.153.2021.10.12.23.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:45:48 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:45:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Chris Zankel <chris@zankel.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jonas Bonn <jonas@southpole.se>, Jonathan Corbet <corbet@lwn.net>,
 Julien Thierry <jthierry@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Marek <michal.lkml@markovi.net>, Michal Simek <monstr@monstr.eu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nick Hu <nickhu@andestech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Randy Dunlap <rdunlap@infradead.org>, Rich Felker <dalias@libc.org>,
 Richard Henderson <rth@twiddle.net>, Rob Herring <robh@kernel.org>,
 Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sami Tolvanen <samitolvanen@google.com>, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Vincent Chen <deanbo422@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Will Deacon <will@kernel.org>, William Cohen <wcohen@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 x86@kernel.org
Subject: Re: [PATCH 2/2] kbuild: use more subdir- for visiting subdirectories
 while cleaning
Message-ID: <202110122345.4B8FE35AED@keescook>
References: <20211013063622.548590-1-masahiroy@kernel.org>
 <20211013063622.548590-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_234549_800125_CAB69435 
X-CRM114-Status: GOOD (  14.12  )
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

On Wed, Oct 13, 2021 at 03:36:22PM +0900, Masahiro Yamada wrote:
> Documentation/kbuild/makefiles.rst suggests to use "archclean" for
> cleaning arch/$(SRCARCH)/boot/.
> 
> Since commit d92cc4d51643 ("kbuild: require all architectures to have
> arch/$(SRCARCH)/Kbuild"), we can use the "subdir- += boot" trick for
> all architectures. This can take advantage of the parallel option (-j)
> for "make clean".
> 
> I also cleaned up the comments. The "archdep" target does not exist.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

I like the clean-up!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
