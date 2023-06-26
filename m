Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA3FEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5iEjhiMfKVWdPbfwvgb8ai2V6Ipa3Fw0KkAMBzhqOg=; b=XZyti0FPWaD+8z
	jnTrnjbyWtXKvzCS1alInindgUK4vtvbpnAWJudmhW+wF5/4oBng0hguebm7IPPq6VAejppKJ+mie
	N4TQi+mINK2m7hJVzj9Ua6sR1+sfK/Vapo2yU3oimlT+rJDXANEKQ/As9KE7xXlcAYUx9O0urP9R+
	uMH+PF4Sud1vIYlqoJ1WNEsLWzAmZzlMERyo6FZDyOvLklrfKSt8A/lFaJmLMt0sljbRHJ1MfWEJM
	MckOnM9ucpHRIePQckYpQgspZH+RnEmYX5k8GIsz75laMVTYkEWaB+rWUN0dYlLIBxAT5fC+bRFmu
	pb+SFrGBcJSIEbic2AWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDp61-00Aei0-2h;
	Mon, 26 Jun 2023 16:29:45 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDp5y-00Aeh4-1d
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 16:29:43 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51d9128494cso1677216a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 09:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687796980; x=1690388980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CHrRqR2fSQ0++NtikS97CS9zylaxWqTRq+BBNV6q+Y=;
        b=W8WrJGCEHXQnHtNsnm/hELx31f1i1QjnfVRY4u5Vf1FFj8+/sEyhRitqj48mUB8SZA
         4CE2x6GicrJ+2hQgMxVd5+H6eUGkKo4a69xEh7oWA8SzHydEqqyftVYhCKylZf7LX8kH
         NBFQDLuLfFkTEuOnTlbL5qVgMghQjlvWrz7/hrDMP4rvNFdcLU4um9Hr0BueEPVU12/V
         H+m6QgR0tu33YW5cnykWyu2mcebU7bS3cVigbMuBcEZcPDDZZ+ChnudSsozvljPi1gju
         KkIEwJoewwOYqKC4Rk1MYuYhR0y5z8tCkQIMR8fQomC3kIGJJmp7lf64OVdnSj7U/7EM
         8tfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687796980; x=1690388980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CHrRqR2fSQ0++NtikS97CS9zylaxWqTRq+BBNV6q+Y=;
        b=Fs2ocLdyn2IeziVe1IOKwfRx9Hu7/2tc57lod8ZcSBvMPE/FwXoZi/WSP/wdHb/rux
         oHKUJHvZG7+EWdlpeQmrOKFiOYc8jbSyLs9ZYfmgHvZ+QfUYHEjAjq48hpTyKZNYdJXx
         qOk1VGmJgB76WeTgzCg321TW0iJdO2ywRrnRCGgtWQdyOjYtbJt/pBGC9B7lLvuInR85
         fu2UkVqHk8hZaWWB7Cjlpd/KBfP4/9xqYKjOTLOeg3SwUClMhS/07IBS3jcybmhKALx3
         08sWobPKxFVGI7oIvv3NAnWkGBSwbbiN1+eBvBbmeSyoxe1lyK9X0jhO88sIPUTv2jD+
         4zBw==
X-Gm-Message-State: AC+VfDyISii/G6PEDE7465hvqWsVKN+ZWnr3A9DCNrgZqAg8WYQRdHHg
	Ih0o5AdSlkNnyuJN3nsUNiEhOw==
X-Google-Smtp-Source: ACHHUZ6/O3Wkr5wbKrnbncEmhxHSeWiEksIyWcweInJx7/EUTGKrdhwfj47TMDyD3lIq1lzA4J9Mbw==
X-Received: by 2002:a05:6402:4c9:b0:51a:327d:f065 with SMTP id n9-20020a05640204c900b0051a327df065mr20581604edw.13.1687796980030;
        Mon, 26 Jun 2023 09:29:40 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u12-20020a05640207cc00b0051bf998b25fsm2984500edy.44.2023.06.26.09.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:29:39 -0700 (PDT)
Date: Mon, 26 Jun 2023 18:29:38 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 2/9] RISC-V: drop a needless check in print_isa_ext()
Message-ID: <20230626-285e425abaadb83dd37d97fd@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-skydiver-frown-659b982a43ad@wendy>
 <20230626-67e571e6d9f02c28a09dab33@orel>
 <20230626-jitters-spiral-68e941d0ad3f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-jitters-spiral-68e941d0ad3f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_092942_541561_6CA47390 
X-CRM114-Status: GOOD (  22.89  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 05:08:28PM +0100, Conor Dooley wrote:
> On Mon, Jun 26, 2023 at 05:19:08PM +0200, Andrew Jones wrote:
> > On Mon, Jun 26, 2023 at 12:19:40PM +0100, Conor Dooley wrote:
> > > isa_ext_arr cannot be empty, as some of the extensions within it are
> > > always built into the kernel.
> > 
> > This is only true since commit 07edc32779e3 ("RISC-V: always report
> > presence of extensions formerly part of the base ISA"), right? If
> > so, it might be nice to call that commit out in this commit message.
> 
> Per my last mail, where I commented on the origins of some of this code,
> there were no multi-letter extensions when this code was first added.
> When the first multi-letter ones did get added, it was Sscofpmf - that
> doesn't have a Kconfig symbol to disable it, so I think this has been
> redundant for a long time.
> 
> Apart from the ones I recently added, there's a fair few others that
> are not gated & should always be present.
> It's probably not clear from the comment, but this check is for whether
> the kernel supports extensions, not whether the system it is running on
> does. I guess I should expand on that in my commit message.

That part I understood, but I was thinking it'd be nice to call out when
the first extension was added which cannot be disabled by a config to
provide extra evidence that it's safe to remove the check.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
