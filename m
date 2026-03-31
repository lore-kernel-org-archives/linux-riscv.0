Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF441061B32
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syLe2czuc4Yefxd/ITj2+JrOM0YAv0rsvFNH6s+wWQQ=; b=DmuV/cjhTiJWxP
	2mqvFsvdG83xk3PUffI2UOWJJqIylWwPTgD26GWQaBR0qwk8RTfuHof7eTvT8mwvgJ4OXdmEAeiBg
	T3BjfzqUYz51/e1FGw4sQG8SXcfziC6k/U1t4PdLhz5bYrM09veUhvpU+dlxXSWaqbr8W1jW+4v3X
	Jkfnqrl1rTsSxgIL7olWvLWLmniYGdKtdUrx69PVL4ZbK4ZyWPzGvYnJNlRFHujK9VcRXv4PwmEpc
	GOeT2aFuxvhwAoL/dzDgG3U55E/ovS6q6ghoEOuK/MkGDGy1UhY/NeMLqfwIphltQm+/vVT0uWU75
	HnX6cD+dj0o/6Ja7k7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XFL-0000000Cr6i-1MOE;
	Tue, 31 Mar 2026 11:26:59 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XFI-0000000Cr6K-2K4A
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 11:26:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a2ad56dbb2so3607786e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 04:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956414; cv=none;
        d=google.com; s=arc-20240605;
        b=cDg7dNp+ABiFw3TLjEXlAn/+T1uRjTPec0Odnh4Kzw4FN2WsWLvarOwHISMteWwkdn
         2BoLsDGWDWXTgQbe3NWlM+1nhm9UkVB+FfVi98H2jRfcQXYQdpqrswCp/ql4rUaFkX1v
         dUDttCPbrrmlo/J8ICri3EV6Dex29zE53LjAHT8DlkNMQLQyfT85hmyhhuSqiBpNRACE
         cVTdFSU1SMbxy74YrfA8SKkpLjuodcYcTPgkWmDIYlrB80dOgntmwVjGbcehv8rL5uNC
         J50t8euOZ4QmMwIHnBgOKOL/D/ZVD1lkMu9MphaRQj1liqhp1ZpQjCRaIa98HygicimV
         +vyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iP+XvAcB0McyuH4v01BHzzfnUMiwboyQfOJw5woEYVA=;
        fh=z7/P7Qo3FdTlRSUnc45uwdZl97ZLY9l0kNAWSfj0ZNA=;
        b=YC/7vCtCbDYW9ETqyTmQ7i9159I6tLDzNNwSKOkRYXGESo4hJ9Dbi79npkIEAJZR3L
         r02BWZeDFAq8dey4m3qwdaKbI+bq5jT8m7vA1F7dGC5cafosqNqIt4y+lie6AqelTn2B
         t07GI+GSbhaecLkhaUX6GYYkpdY76xqjPDwgLAk8p7GbUcMik5klaPOTHUNtnRlPlH0H
         EWasrfxC3JFcXN7CO1IFkUjG8/9bTQxzd7Blmp9lwoFonK6tUc7EAAfMlfplYmpN2LPc
         VAoQ2LjyGInN3oR/d/821ioQVt7TYVGQTQ8RD3VBSxYGGJpcyMi6YdjjV4oGbtMaAlzP
         Uv3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774956414; x=1775561214; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iP+XvAcB0McyuH4v01BHzzfnUMiwboyQfOJw5woEYVA=;
        b=RRYXPTWeG0GHpDhTTQOB4g6iZn4GE9KFVTiebg1BNfPabOpTpStwmGVNGK5jxqSJi5
         jROv/yR8n6n5fEd4626oYv6IEGiumhBr4B8IldZNBlCI/sLayhOByG2P+YNJNKJv3fYj
         gJzgSoi1oSTiUs8oNjAaS4nRTcPVmguqjV43vWACw0/U8JmPsbFrBltZecnp5Z9iKpjS
         HPpgdGkiZISeXi56zIr958TmKKZl1p2539OsMXH/jqIAVU51gFGHee/EafJnjXAfSlSW
         VJ9pnLrMseLs8eSFaRWAx2s3CAzpX+qV0z9xS+k3TMhcgY5zX7OUoknd8/esHj08J9jx
         vlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956414; x=1775561214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP+XvAcB0McyuH4v01BHzzfnUMiwboyQfOJw5woEYVA=;
        b=EeLxnd324U43SbrGR4SMSxjgy1ug/UlBwJAi0i88fNMAFg0mm7A4hCDTzgwrdErNV6
         oq8FqQjWYbLqqQw/OBTfvXhoh8rPB/l7hy0tfIA1CozPEGHd6jRve/DVjxim9fiNXxQ2
         g2PGn07/smmI6ZsgaDLEQxKan8MXxEWZhGJg56xe4KiAtaNelaG8xRHQyY+Cek6c6bYc
         xqHLv+N23r2893c7yL1XMacamh27d8twQJQfwX0qrpufDW/tuGLu2WtbVxWd+sIOP4rJ
         3yPgD4dGAwmgX6YvcJVJ54VrD1FyvtDjUsDGz4EnVPTAAKBSU/k8MuQPPnj8dInl9gLZ
         0Psg==
X-Forwarded-Encrypted: i=1; AJvYcCUgZGMcxO7OXSJAh81nYHwxNGjpPxbF3v9ESlB7iPY2ZvZqc2l3pzfUMIZHCfcg9n5fP8xzBMs1U3TwVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YywcLyMQRN0M10EAqU+vwe6pFLgKh/TOK+2zkBeNHojE0/TF0GU
	xVR4E0SSE5n6WRIgoSDJP5dpuXpR1L55Q+shIQnqsl/3SzBw39j4QsjWNYFAYWvE/roer4O7t+g
	Ip4QLsvT/R4mmnKsOFmDlgS7114k7700pUcvvZC0hsQ==
X-Gm-Gg: ATEYQzx6j9kgjkBmTQphkdmcMsPHGGUpog+EuGTazC38GVSRo3GhUBzBhX4x/iKaVWF
	lproUoTPeO1rHJmwVFT6wXyPtQiSd/K9x6ExSNLm2ip8XAtjLTaLTka0zkik4NsN7ndSIbOomHR
	90Wq+QJxcwXzTMRjQW71ouvIedTEKUPdCKNM59qw95RsPow79iBDoX+xPz1mM050hXvoqhI+73K
	jCKVI3KnYBPol81FDYQt8p3N0J+Yb2gA20yP/aCo54NsODgcctE0q/Sjzq//pK8W2DvuoG5/9mZ
	+IOxekX6
X-Received: by 2002:a05:6512:691:b0:5a2:beb2:d440 with SMTP id
 2adb3069b0e04-5a2beb2d489mr790442e87.22.1774956414346; Tue, 31 Mar 2026
 04:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com>
 <20260331-eager-kind-civet-62f60a@quoll> <CAPDyKFrafqhNbetL5kOzAFO526yUrJWa6mS_FPX-cw9bj2Mg4Q@mail.gmail.com>
 <1c1b12f2-b305-4341-8269-788fb9e11cdc@kernel.org>
In-Reply-To: <1c1b12f2-b305-4341-8269-788fb9e11cdc@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 13:26:18 +0200
X-Gm-Features: AQROBzCzMHq52lgKp4Q316ICmztzPT5EZmpknBt6jAeduwaEYdNsbbTouxZZ4hE
Message-ID: <CAPDyKFpXq7_UX52zH7MvvYJVdRML=zeWw0p3izG7_EHRA8Te2w@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_042656_638534_477BC53C 
X-CRM114-Status: GOOD (  16.93  )
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

On Tue, 31 Mar 2026 at 13:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 31/03/2026 12:58, Ulf Hansson wrote:
> >>> +        - default
> >>> +        - state_uhs
> >>
> >> Instead: uhs
> >
> > While I agree that "uhs" would be better, we have tried to stick with
> > "state_uhs" for legacy and consistency reasons with other mmc
> > controllers.
> >
> > No strong opinion though, what do you think?
> >
>
> I missed that it is already present in other places. Is the name coming
> from any other referenced schema like mmc-controller? Does the existing
> common driver code expect state_uhs?

No common schema or binding states that it must be "state_uhs".

It's all described on a per-controller basis, but I was thinking we
should perhaps make it common at some point.

>
> If yes, then go with state_uhs, if not then let's switch to new name.
> Old conventions in the bindings can be changed, we already do many
> things differently than 10 years ago (e.g. no underscores in node and
> property names).

Okay, let's go with solely "uhs" then.

At some point we should make this part of the common mmc-controller
bindings too.

>
> But followup question - the binding is called sdhci, so maybe sdhci
> common schema should be referenced?

Yes, that seems reasonable.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
