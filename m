Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9645C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 00:01:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 769F32076E
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 00:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdJdfeqM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 769F32076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OvcFTLLZ9/l6+sbtMhj/WBjAgc8zTvHDrMMncOHDWbQ=; b=pdJdfeqMn4UIM1aHM2J/9kP7U
	0vlWJX0jWvSiUruINm10COTKOrluDf68WGVZX9p31VhqgA+GHF0othfgbHJn9R4NVU1+OuGtEEuIx
	/G+eOoObAVbDz7HBn+GxMFRD8pMFqdikTuype4gU/nc/dJr3s1OxqIXJtsP9OS1/nmjkn6gJEU2Xl
	bTCMsGcBkl65QELutkY7gEAonD6/Ik0V56ThCTrSr7GOiw6IKfPRgKOcsSntvRmbxbocgqIIGgm1c
	UB371Zw/f5jp6htp3X3my1nt74xTFT+iimRxSLiDE6DRg6982jnBSLmO+y91ys8mrAcKa/Kb/yGD7
	56xQrWW3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0ZWS-00018t-FB; Wed, 29 Jul 2020 00:00:40 +0000
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0ZWP-00017e-81; Wed, 29 Jul 2020 00:00:38 +0000
Received: by mail-pg1-f196.google.com with SMTP id w2so13234726pgg.10;
 Tue, 28 Jul 2020 17:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V9WqMZ97j3+53daSNfhsHBQoaaEy2kmohpeoSYJwCfQ=;
 b=gG6wYKNRzQ7Lc8iV68B9UC57IC3mu+yc32yt96ttMooxCIGoRhoUSxaMSjXkan+kCd
 YGvxBh3hW+7LoGmmVolD9eYr0N19reYyZUVQQ++8gHGhKiQhZYO+/cgBPMlDy5pRAoxR
 Vrmp7h6Tvg5LkgBkppa2FpSOFAhCnTNa53gtqx5ENiV3Kx4nYnfr+rio+FUwKxEZjg/P
 KzxNqN+FNRp9cY8wHJh5GDYpSnWzRq6UclgfaDDumbtb3Hga6E2Mevo7pL+toTI+a2vR
 IOjgcvescs+PfaGspFo3Xqmspf5xPrmAi6HA+JXoWPei0Kj9WoYF2kN6fh6MDajxZhpS
 kLWw==
X-Gm-Message-State: AOAM531Z/QpU/d07e8vPYCD5dY8FhwEspAqDZQLTbwpUdLH8gHc5fdZy
 LeD/Y+MysPd9bClSeAONKNg=
X-Google-Smtp-Source: ABdhPJyFmGfdKxBOVYNB0K3oYpdOdGvgaS6f+zykhySlRqWDjKCdtOoWyxd3+w1bPIRhQIyPPc3YTg==
X-Received: by 2002:a63:6e08:: with SMTP id j8mr26766982pgc.187.1595980834535; 
 Tue, 28 Jul 2020 17:00:34 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id c134sm172298pfc.115.2020.07.28.17.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 17:00:34 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 0E2E040945; Wed, 29 Jul 2020 00:00:31 +0000 (UTC)
Date: Wed, 29 Jul 2020 00:00:30 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: Add and use a generic version of devmem_is_allowed()
Message-ID: <20200729000030.GI4332@42.do-not-panic.com>
References: <20200709211925.1926557-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709211925.1926557-1-palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_200037_307604_9EA47F7C 
X-CRM114-Status: GOOD (  16.60  )
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
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com, ardb@kernel.org,
 catalin.marinas@arm.com, linus.walleij@linaro.org, brendanhiggins@google.com,
 elver@google.com, glider@google.com, zong.li@sifive.com,
 mchehab+samsung@kernel.org, linux-riscv@lists.infradead.org,
 alex.shi@linux.alibaba.com, will@kernel.org, dan.j.williams@intel.com,
 linux-arch@vger.kernel.org, uwe@kleine-koenig.org, alex@ghiti.fr,
 takahiro.akashi@linaro.org, paulmck@kernel.org, masahiroy@kernel.org,
 linux@armlinux.org.uk, krzk@kernel.org, rppt@linux.ibm.com,
 bgolaszewski@baylibre.com, clabbe@baylibre.com, kernel-team@android.com,
 pmladek@suse.com, zaslonko@linux.ibm.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, rostedt@goodmis.org,
 broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com, gregory.0xf0@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, changbin.du@intel.com, james.morse@arm.com,
 mhiramat@kernel.org, akpm@linux-foundation.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 09, 2020 at 02:19:20PM -0700, Palmer Dabbelt wrote:
> As part of adding STRICT_DEVMEM support to the RISC-V port, Zong provided an
> implementation of devmem_is_allowed() that's exactly the same as the version in
> a handful of other ports.  Rather than duplicate code, I've put a generic
> version of this in lib/ and used it for the RISC-V port.
> 
> I've put those first two patches on riscv/for-next, which I'm targeting for 5.9
> (though this is the first version, so they're unreviewed).  The other three
> obviously depend on the first one going on, but I'm not putting them in the
> RISC-V tree as I don't want to step on anyone's toes.  If you want me to take
> yours along with the others then please say something, as otherwise I'll
> probably forget.
> 
> I've put the whole thing at
> ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git -b
> generic-devmem .

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
