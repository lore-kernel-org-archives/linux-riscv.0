Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313B6C5518F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1nmMVWNaVY5jthg7hWnDLYMq8q6iPvyvvCEPmpr9DQ=; b=N2SEJwaXqJAJmq
	4RZFJLwxPv71H1IlisxdN3SCDvrzCvxhecYHKmHOibpVb7vXmXb8NtwyTM5KXTWTIUv/koY2wYg55
	J3wWkO1aAZ2JO/TQeYomBEiAUKKUv+y3O7aW/96ZlGLwgcaFZwq/DRANuViKgIxghJZyXzQIaHmCg
	yybs8AhMA7ioA6/AX1gBFmtpY5u3nt5BMlfzFbD5xpO3br+1+xvvFKOriU1IEsLi9KH6d8tNs//l9
	wAZu9qvueIVSNfz2IbaLicHbpCnIovNjAV/8tfgBpGgL1QqLG6oLyfR9xslfNO3CDuD9CtoOcTHhF
	s34p7r8cnGQGwnjXxkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBin-00000001Sdk-0zm1;
	Tue, 04 Aug 2026 09:46:05 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBil-00000001SdO-1jFo
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 09:46:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc97653887so47798475ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 02:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785836762; cv=none;
        d=google.com; s=arc-20260327;
        b=PS3WdP/Zxr2DBBDYiaKHouYD8bPJymOvUEri9WrrdbKpFYLUtG8wg48ZQ47hC88HEq
         g7kDSEZQhPEhhjzEWEnzTCv+85UA7p8hVa6ItQ4AveOTuCQ+XdXMy/PRn+tLHPjboB8p
         C7vKVCYTw1VbbAh6Nc9i0JSp9lO5jjn4e06qQFziHxLrGpV92lipXYQTWZPYBKO1aRJk
         J995aZYJIrrCjswGZRQAshOgiWnk1MIDDSyRA6nmRyCtqiGXf/ttvoBE2bIlo0KpQ3n5
         eAaCGMErDuy8h1suxEgEdHw1eF66jttyris8kwdPHyoVfKVsxYpFuy/qdQlx3wLQ8UV2
         S7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
        fh=gIYHJdTMQplg7yKE84Ue62W6Y8OqKInANfnBUYVfjZc=;
        b=IvWCY1H2bXOD+VvV2UaaUaMfOX+QAgGKwUJ8L4AHbZ21DjX98XXJp9B01Q6AtHdQbA
         3H06qog2wEybdPb7/eJR68w2islg7FaRxubp9DG7G+2zt+jI1oH8i0V8MSkZzQrzer0n
         61HdI6M7aEYhktSMxrF720PGSpLyC7l3O7MrhzhonaNxx4L1e4xpLKaSgCznSfiqXo9M
         JQpxAg0jJRm/Pcr4JfAs08J5/U248slq/EqcTZMrjGovm5LqhMi5BK0Hek1cD7wwsQJ6
         tkhtI07F+ihTw2VY8Rlw4a6EpsLpbpbYhnOy4th7di7VoAFC7DTNHVCUfKs1U4CNOUk4
         Clfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785836762; x=1786441562; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
        b=Eqqa3kr20jo7IKL4ux1Dd9GYZHT4dqKZCiAG5d79dLIURaKM+yLApxJ7d4IM/ZT+fI
         lIisHf+2+e4K9nQEAdeSm6dvSLYzNz9JCKufmKjkcHADVyI2Ye68vkHyT2EIVELF2Qlv
         VtfY6J82+X82vasY2g9QT4mFT1s7RPHmynNW8wfhsX441o7PMpWM0Gl9qHauajIILUYP
         +bNQAXK0soAR2MmjVwCuAUi0lDhrWeCv+aVPyUw63ijJ0BW7lU5/7OzFHZD5Qn35NXqL
         LEIB5wJY7rNhDMR31I6U0j08S+Tm9t3FDGdx0ZAK3xgi9vxn7fZsJDdy2Nvwj1jYatJq
         v4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785836762; x=1786441562;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
        b=Up+EvUy7cc30SZPQ7e+dfLBb5VW0o60mrtAb+Q0g4S8+dT5kJwYQcCUVm9jVKRLrGK
         HxsewC/zq98k9LnGI0TKEGcG4DqT1Orq8+2XaFsK/3hFmcpBfkg36LXoNei8bpFVvh5S
         cGh6kd81x3k3AMW7b4Oo0tqaN9tjGDm6mi5Oab/GU+3ZoEOkOzK52GepyUzV2R+Q7g5j
         gh9+hdL/lnkNB57Jze1I0bMZnnfpKTiWA6lmejoT3vCPaIQVcnyUQmwy/RRkyOjOrkMH
         C9ZVMZmRB0astz1057Or4e3WprPI9C5d/1j2kuslGiNu9pcAoSHV0+9L7T5eNePLcGRR
         a6GA==
X-Forwarded-Encrypted: i=1; AHgh+RreSD66f4RvYvmrIkSiEtYlds2S535VF9k7lxg+p4JH4lvVjYvlp8Qp2AiHJcMqO2nMAjc+Un5Qa6T6qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV7/NA9BuAEz5l/4ZRb3TopBGH0rGZoENeF+ON3y3AZdoJN/kS
	4AKNMW1kP7jipKKK5klyJzGg0RvVo+hZucUNXNtdq7U4VA+y/eqeBeS8opK4+mA6lgxsxCdqCax
	S8T+hN8wzNN9XTlKcWzIIS6A9Pn5FlO0=
X-Gm-Gg: AR+sD13SLsc5am9WnI+sC2luTGxCUCvpjnbEZMgvJiGYHXenAk7N3heGOyl3RWc09a4
	w6OD+lZywN4npLrLWT5yfT9P+36riEm/L7mTIbhLA9xernr7z1c8zS0TdUImq+IQ5RYqeiI8S4l
	l3A1wfZsQ9L1LUrQc3/lddVuw48SD6u6hqEDM0IzZKe+wiN2tX3/cvMyAyQRfrXDjZKbh0cU2RA
	QCyvJhfWuxWMH1gYyDfWYzojAgnF1vildSU5ZCnU0ttdrp+7iFWNJGKOLTA6t6MrOiu+UIVrp4E
	Z08EyZR7nL+aPLcS32+dji6hxfSfVqpV3mjOeGZvictmSS2rxvDSJVbY5tK0gtRofvH9jJd7FAR
	FxsQ8iMEhiqemOZQyjwUu5wb5sbr0x2TBiY4Ad/UKc9A2lORuS4zDzRDpmQ==
X-Received: by 2002:a17:902:ea04:b0:2ca:3df2:919a with SMTP id
 d9443c01a7336-2d0524a6a14mr133306145ad.33.1785836762473; Tue, 04 Aug 2026
 02:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260804043036.22065-1-phucduc.bui@gmail.com> <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
In-Reply-To: <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 16:45:51 +0700
X-Gm-Features: AUfX_mzLmpOk076Xm-y3rQ56B_xdDiTseD6kbd_RoFN_z5sig_vDzkkt73AmOmY
Message-ID: <CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field initialization
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_024603_455812_EB40163F 
X-CRM114-Status: GOOD (  13.24  )
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

Hi Troy,

Thank you for your feedback.

>
> Initializing these fields conditionally preserves the existing
> capabilities for devices with both "tx" and "rx" DMA channels, while
> correctly disabling directions without a corresponding DMA channel. The
> added rate_min and rate_max assignments also preserve the existing rate
> constraints.
>

Yes, I agree. That's also the conclusion I reached after reading
rockchip_i2s_init_dai().

>
> With the current static initialization, channels_min is nonzero for both
> directions before dma-names is examined. snd_soc_dai_stream_valid()
> therefore considers capture valid even when the device only provides a
> "tx" DMA channel, which is permitted by the binding. The DMAengine PCM
> code may then create a capture substream without an RX DMA channel and
> fail during PCM creation.
>

I traced the probe path and confirmed that snd_soc_dai_stream_valid()
is called from soc_new_pcm().
However, I still couldn't see where a nonzero channels_min alone leads
to creating a capture substream
without an RX DMA channel.
To avoid confusion, I'm referring specifically to the DMA-based
configuration, not PIO mode.
Could you point me to the relevant call path?

Best regards,
Phuc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
