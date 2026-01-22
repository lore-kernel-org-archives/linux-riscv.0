Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5FBD6CFA1
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 18:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctOmJRDnEgjXbcH50up9qrSJU/fmjpY01QpIS/QyVi8=; b=BrP+jirH6WP3W1
	4mNLWPHJJRuerYJSzg/B3uboRKkIEz0/fzI0rgDp8wo8a/SlGBMMtMLhulDcA+VPw6NpwDzXxK6em
	gAa0c2+zpPQLPdA7AZ57z8ZbSaq4xiG7v9ik9wJj1gQnfYYZYZwy8Xtj/E2OUZH3pK312grEZ6IJv
	kUTE2HbWvmUT/pcr1KJByF+qQ3jLR7lS5NqwbI3O3YCutK9GOntcYBCkc0ZrHzFqA9py6LHWpgxr6
	t9wZsR9mjJO/IRrSDSx7uu+o4SQTev5NwWj4hKiipAVGLgFePMaBrPa8wPPlK/fXzdNoW/fNtBWys
	gIRU46/2Y5f1u2YKwXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viz2Z-00000007bTl-0fej;
	Thu, 22 Jan 2026 18:04:19 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viz2W-00000007bTK-3336
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 18:04:18 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59dcdf60427so1531498e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 10:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769105054; cv=none;
        d=google.com; s=arc-20240605;
        b=NQpOud2bmVNFq6n2/4QZPw+nXwM1OV7EFflTUJIVQHIDSsefGKKyi/K1U+c2wTQpGz
         ypmVS+hf4hHdIlNjcZMu6qZxnCMB5hW8qFxppzICLrSpJzZcA+Muzhz1JDskpJGEgmP8
         BFTzJETuFC6tAiYqndVEv0ZMJcXxFCQd5KinjMxkJJ5FLdTN4zRnjMSK2eqPVfT0WW0K
         A5Ye4skJP0f8R+st+5/JMwU1csTT2j2OKhWzaX0/J8apX4GKDV4b5j6JrOOmbYJM0SFd
         /5eSJsMfY2wHPEzIF4tkV3FmO/dV44mXqEpjwL8hdgbOCnkizgjrjnwjXiLJeDWYl0QR
         OI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1dAdnI02pT5EuloFaObahJw7pcpTRooaOZFcQF4dsRc=;
        fh=l63Dh74k314U2RcB7HzeIjtATINRz/JmIv4kGoRYefc=;
        b=dd8B44jKWvUzrriTbBARqlaD2NOhX7RpWitJ2A4h26MbLAt9t7C6725eL1pt786pTW
         PBc1VTVuS9z1H4dpsgsFo61LUv1/JcPKdsqVsIMClnq2LGSF7i4FPuaPjW7CNvxwLF2r
         jqaIJ9do7uBhkriYIdfJEp7hUXyFccax7qVpH7X8fk8jL1xka1eEVEYFg0pcJnhOR6Sv
         FDYxEatcm8q5CGGk1cqKYDcuieHYZ/bN9UzKtFrvtpccM6jsDEDodQYCSTkq/6GRXSzL
         s6WeMSfGt43XKq4/GcVqd8QaTtOQ/nupoiuj4PuFezTM3SMwuMPu9DtpgcteztzmHmj9
         sQZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769105054; x=1769709854; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1dAdnI02pT5EuloFaObahJw7pcpTRooaOZFcQF4dsRc=;
        b=mzXWvMWA4oifdon3dfA+otYi4hWzpZx9XIEcpBR+GL79IWd5ksKtWl5HVm5yBgAZwJ
         jpqUekavZoQMaXR0siu3jGGQKU+vjKWcO6ITJkaDf6V33sFp8/gEMLrtBHoaOCJQtnTt
         MARwatyXOlOGMnyQg4RiHOv8vWpQ+TK0yL4061N0K4kms8yCpi6zKZ3yYVWz4oGSspbQ
         RnlMI9MZ03HAa+hyBBJF/JnzjXxTz2lhCqGlAFNAWyp0jLU7/m6u78OW5K8TotTvTtMM
         q2AEcTEFjLqMNimgeL1O7pJPOu4YWwkP0PUkUzzlalmNz2DaqyE6DDgGCwS09nJ/shMf
         UTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769105054; x=1769709854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dAdnI02pT5EuloFaObahJw7pcpTRooaOZFcQF4dsRc=;
        b=AvBlZy6mL+eluTxrgCT9DGXwkahbU94mS0RHt02jgono/coNr9lm9DC0Uj9ICF32O0
         Shyf84nnu5MhyOGS9xeFfgvKCvINc2JiwceZQwvNT8HkWNv/rq6y3s/4M2oDaURp09RP
         lrpnGA+GhNtYvsOiCSKo8N0AKa8dT3HAmQhNJ3YJWZGj5HVSqSHf+jkN5jPVlWKIkgZD
         rlG5kLnhJUbB6QbUvJNtsIaum6CCml6+JTbveZTi7gvwNaWRLGazHu/ybP0z+I0gzXkF
         MEaSSnliMvafS/uPXqxnXtbjS7lmn99sseQNN2FDrMnUQZHUJjQwg4pORodUv3qcGlQQ
         t4fw==
X-Forwarded-Encrypted: i=1; AJvYcCUMLfq0nYdZM6LXOwhJXguyxYOofWNJYgmEhspUvHq58nFuIHbsoz5/Ix+ERyFUx9yrKJXkGv7lcN7P2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxVANFFkFtX7Cw3CBDfEZ3qItP1LRmibR6nKJn9aqtoIhsQF+L
	94stUGY0wsnpGZ4npFOb0V19OddZ96mr3qSoL7gYit8Wk8yu0ApRPG2pZ2X/KIfIltcccxUzLYJ
	MM2fpuy9B5Wydmw2FeVEnhflMdW1DMmfLyTpSG2OlMg==
X-Gm-Gg: AZuq6aL4tfrsoI7nwryTk6TyVZKAvSW+l9EsC0Uljqtc+FE9Vv4vkmwWFfyO8iyvcG4
	RtvswS4/8U5OcyW09KyA/OQlAz1Lt25P1SiHMtWQpX01fOHKHaGXAeg4K5Lyb0O+yzluosG0XAI
	2Vg/oXJrK2P7UbwfJXVQJouMe5jAZxvj/Ze52PEudVd24+51F7Rz33SUir4YYIIMz7L6e6jNDdV
	QkuFLiKgyI8likaif9qsJv/LB8p1mHuwpZ2pZfKK7MGN5OJwBiRUyZmSbt2Z7pEIPjBaUjRrrO6
	HGTGrjg=
X-Received: by 2002:a05:6512:2513:b0:59d:e07e:8f38 with SMTP id
 2adb3069b0e04-59de48f58f7mr64524e87.10.1769105053659; Thu, 22 Jan 2026
 10:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20260122-07-k3-mmc-v2-0-3c3ffef25e94@kernel.org>
In-Reply-To: <20260122-07-k3-mmc-v2-0-3c3ffef25e94@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Jan 2026 19:03:36 +0100
X-Gm-Features: AZwV_Qi_ZbdqQa48xiUnmVYX5skEPfI-gSYl1dRWblEnVxVJaaRBzgmXmm23av4
Message-ID: <CAPDyKFrXNj-FwGvCet6rw3NA8zshLAi02AGPeUQ8zLy6iQ3uiw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: spacemit: Add support for K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_100416_817515_F2046868 
X-CRM114-Status: GOOD (  18.36  )
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

On Thu, 22 Jan 2026 at 10:38, Yixun Lan <dlan@kernel.org> wrote:
>
> Enable SDHCI controller support on new SpacemiT K3 SoC, while as before
> only the third controller and the eMMC device has been tested which using
> vendor K3 evb board. This board has not acquired support in mainline
> kernel, so I've omitted the DT part patches for now.
>
> The new SDHCI controller almost reuse the same IP as old K1 generation,
> while fixed the broken 64BIT DMA issue.
>
> Hi Ulf,
>  Any chance to queue this for v6.20? I know it's a little bit late,
> but the patch itself is quite simple and we've tested on evb board.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Changes in v2:
> - collect Rob's Ack
> - drop uncessary blank line
> - drop return check from of_device_get_match_data
> - Link to v1: https://lore.kernel.org/r/20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org
>
> ---
> Yixun Lan (2):
>       dt-bindings: mmc: spacemit,sdhci: add support for K3 SoC
>       mmc: sdhci-of-k1: spacemit: Add support for K3 SoC
>
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml       |  4 +++-
>  drivers/mmc/host/sdhci-of-k1.c                        | 19 +++++++++++++++++--
>  2 files changed, 20 insertions(+), 3 deletions(-)
> ---
> base-commit: 6cefff068d030786d63fa50970d6581c354630b2
> change-id: 20260112-07-k3-mmc-6ca01267e834
>
> Best regards,
> --
> Yixun Lan <dlan@kernel.org>
>

The series applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
