Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBC3CA9EDE
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 19:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKwTVTCkVHDnchqqKJKp1gIBfVZ0Ca0hZUYEoWLRpRI=; b=ellBQ3xH8CBw4p
	vQoh6ATul5fyQFLopD4qr4N+KcBPViy1mg3b1roWCEAqEo+AfFCkP5zAiWf8eLx/B9AZQNHeiWFaH
	Esu9723EhHx9F3UDZ0rdfuSQ+5BtLLRwnskZ68uWj5DiHeqtAS9wsBz+nGPXvAS3O5n/7+I1vqUOl
	9rTteeeWVplXq29Pl+PYOIdq6s1CeSaOzjQX8N7B3zVESp1Y6+/zTjIgTv9RH8lRyVpP5D79Ewy3W
	Z8GTbWIuMHpp8QZBNAjbFXpABPciR5OBDPk527WxAp0QaeG5AGXvkQTfgLSz7u7QO3yUOyedgovxK
	sI6UJpFpiuiUFAMuCh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLVZ-0000000BMmw-437z;
	Mon, 12 Oct 2026 19:16:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLVX-0000000BMlY-2Gkf
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 19:16:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a168355946so19428845e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 12:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791832581; x=1792437381; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CRfRncq4FuUqEgsh+Q7MKNhu4iIEz6/gs4z1N6qwQUY=;
        b=cACcqHq9th6piy+xff7q+uk6VjAHMXpw8FJ7FZn0hGzcWs8fGScHCfaJllabFHBTpO
         i3F95w72EqW8ufx8nuU5RzXI1U1YFQyJEugijEskgozI6BpaYv1k+7VQwKmkq46YaIys
         tF3+rA1Q9hXmgiEV6fT0wBgBOZtN3687renzzN+kdHyIta6JW8389WZ5to8nadHJzNYc
         0RYlMS0D+McZGfnDKZiOtGjPFWt7wonXW7kwHW6VOXjdRpGoC2uL4zgfLHANsbZeR5rF
         bY9ACzCLjIImG4L3l6Z8TaRbP+PK05I+BhG+862eOX20kiEalC6jhUSVRJVvkqzw0L/o
         d0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832581; x=1792437381;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRfRncq4FuUqEgsh+Q7MKNhu4iIEz6/gs4z1N6qwQUY=;
        b=sO3Dd5oxo4TdtmpId/Oz4ICLIcg2JR9BNAOGtubQMt5KgXKFpvenmrSApdNWIbEtGb
         cHtI3dOG95kEtdNFENl6foHlTrOwDAhvamXrh6adwwKtS+lacbPruNEIItTVzbEJCs5n
         EjNwy9QaC+IcWWuXkegZFmJrFEcVSvI5KlNJ2xPTfSScUe3dRGe5S94869//BabvSPM4
         OdLR7gG1/kof19+yBf5z8pbdnnVRtOPFqc0lQDzZfjmtd6NFW0ogU2x6LkOei67azDKA
         QNsDXBkJbcOV2hdg+D7Ac3ND9W52rJ1qouZ9QFnlqYaexq1/yQgRI1CbOQAB9HAyNb+z
         eEOA==
X-Forwarded-Encrypted: i=1; AKwUvBw2sx7NT174cBifhDIzm1QLWaPSfYqp318xo6ahTncS0LENFxeHO7U7bJ1nNntMyt3Fo3uzvZb1bMRvbQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKxa6taFnDjqQrJslyQ6lGc9Dnfg4CnCIec3JXSSfKfCr5JN6Hh
	Ea/vZ4rUEV8IcD9gnM7Ss3+TS/j7pq4qi4R+xC/FgwRyxxVN0acDtBaaa1iUju3Vads=
X-Gm-Gg: AYBFou3DVMS0sDw/US5R/pwxUqBL/174+h4aAXN40gsOoYlkKQCa7T5VTQ1gJNtm+sD
	ktqTgEhFQczYNi7enT25DBY9HIeHgbX8jb1g1FgUm7IF2if9eFCjOeGlTn9lxOeTEWtEEiWe0Nf
	gtVbTB9k8x+USZiKr0eeKnnJ4PPPknbLjdQjhhJ294Opfu2DVFXYwk+um550rqwejpqN103N07p
	oDRBi7KjI9q/WwAJHNxg1l0qd3yGDN+BXiiJAWaxSAs+QhQNUyU4YwWDQQZTKNqoK0VTc8+bBho
	mwrAE2LJl0c2LNMAWas0juoIhT5V1Mc/z00wXvGOooysQrPe5q9MXzxAUrjbSYl+beZ+248eKgR
	io15NR9lGsyruhbjY4Hbta4x+d6LjGA21bBl5iBO/6A0j80W9o6pves75h11gTmOza32w5aoIfB
	3bBNnRqy59P/IIuZI9CdnVXo2nBFRBOR5EmEO/TZbJFVMyeEJAObC9ecjrIIsdIqkSyP8ufbd7b
	GOKJ5b27pSgUUASxxUVHhn5T5kz
X-Received: by 2002:a05:600c:8b70:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a18e4a174amr194169405e9.7.1791832580955;
        Mon, 12 Oct 2026 12:16:20 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm478285355e9.8.2026.10.12.12.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:16:20 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261012-grass-guru-1ba876eda895@spud>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <179180050741.66744.3459927533880490879.b4-review@b4>
 <20261012-grass-guru-1ba876eda895@spud>
Date: Mon, 12 Oct 2026 21:16:19 +0200
Message-Id: <179183257960.266355.15581316876923702717.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=F1N9sc0phttKEroqTY7fq4cUBOZftvRnSXLYqSUrN14=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnjZhzV537/L/M+KX8bkkb84JgjbmKcnd7zSVXvGQ/5
 +/C/0awo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPx2sbIcMUr0nD6Uoazbr/u
 /xA7XB+v681zct+D7QsW+fbozLtpuZPhnxWT2QFppxW/hcrua0zme85ue+FEzqEHjZ7nmtNjjC9
 E8wMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_121623_610916_378F841A 
X-CRM114-Status: GOOD (  22.66  )
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

On 2026-10-12 20:03 +0100, Conor Dooley wrote:
> On Mon, Oct 12, 2026 at 12:21:47PM +0200, Jerome Brunet wrote:
> > > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > > subsystems:
> > 
> > Nothing really forces you to send them all together.
> > 
> > In the future, could you try to send one CRG driver at a time ?
> > 
> > It is fine to send big RFC to give context but after that, if you
> > can make you series smaller, it is generally a good idea to do so.
> > 
> > This helps us iterate on the series faster and then you can fold our
> > feedback in following series (instead of repeating the same comments
> > on multiple instances of the same thing) Thanks.
> > 
> 
> > Also your series does not apply on clk-next or -rc1 and no pre-requisite
> > are mentioned in this cover letter. Consider using b4 to point out
> > your pre-requisite if any
> 
> The dep should be the PR I sent to Brian, but I suspect what's happened
> here is that the MAINTAINERS parts of those patches (which I had dropped
> because they were all conflicting with my tree) didn't get reabsorbed
> into this series. Very annoying for review of course, even if it's a
> non-functional conflict. Of course rebase on top of clk-next would've
> highlighted that to the submitter!

Yes it was only the MAINTAINERS file which I did rebase to check if the rest
applied correctly.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
