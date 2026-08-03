Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFA5C55162
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 04:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cC09ykNoF5edTHMa1ff91ndi5VVcVdT6hg4/uxvC0D8=; b=oaC3cTxuX067ic
	Gl1VqjqL3hoTz7oGs5BtTvtPujM5Qv41gkgaLnRMB8DR3WfnjSebgn9HaB9YJjEd4ugfjues8RmiB
	8SsLBG1v1Si+rrvq/DkSnijS4HcLppStSefvPWQstH+TlYO9Eh6BqD3wRJg+LdV6hV35f/uMBY63o
	Llx01H30/Cmi5oxtpz9HLlW5b2dPuLDRX+EQfF5ilbvSWb2nMbBYluexZzF/nqh2HWeNq3wcXfkTz
	xK+WvBI6REGqUoon69zTq3kF+OvFYyHjDXNQE9EoJnwQs5Mkrj1Dn0cuM6SUR+rbUYwQ4+PVFi3ZZ
	g3HgwpnmrXi9zf/Sc8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjwC-0000000GHBm-1Tfk;
	Mon, 03 Aug 2026 04:06:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjw9-0000000GHBA-1j4a
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 04:06:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cc61541f8cso40970195ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 02 Aug 2026 21:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785729960; cv=none;
        d=google.com; s=arc-20260327;
        b=AHnX0tlhBWHY+6PTiuPkTJD00OAlOrnHvwANWjiJL+K0cETzaN/TeO3vi+5cWq98dj
         pNMz8q4I4SQluLnbD8KlUtBipvpwRiOIH+QUnYamX8qucd0zhnUC22zRI3GuabIDzyAr
         doguui6zPf+EulcuMEipFKyprFrrg4BXRYf7Ey601kfvOLws3oF+nMTW63XRbJeljIQY
         Hgv18vXusE+lNOPG6IE0iuJno5U27w9JJEwH5V+l9sl8T13yaBVWWzP+god6zxddHQGq
         B8tTAXSXtHgWHLmn+8fiA5vnhA8nOn0UeVYwehWiaBhRiX+SnZxp2f+VcxwqoIDiHOcg
         mtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZkrSKBKR4XV+e30AnWADztQMFm1oiGp+NcTdBitQDeY=;
        fh=E/zH/325FK0NAOK8Mi92GIlYccHVjlaqBHFpK4V5WXs=;
        b=RzJBqEZ7PmCBLZklQGnm/lwQVanEg8BjAZPf+abhSoO46cL1loPH1ZhnWn3yd4WJvl
         NFbKmK0bWetzXr6Sus1njFp9mbQeiKHUZC9bM77gCVRclJnIZP/U3ug3yiVEomqQHFAb
         1yRLODymoc2WbOXAu6stl0Jx4hdV1X4GIF3qALPFIMHsEwa2efhJnIZijSnxwDypjLWl
         elfNVttCpcvzei9lTfE4tNheO+qif6vofI0yALU/VFa+RgkmEoo3jnNfvo6ke3IOTKWQ
         x/yHf8jBxTScGLeGfUQjFeFvzK8IwPoTeYMF0gkBR3cam79CXYbjp+zgyZaLht4J2Nwy
         kbrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785729960; x=1786334760; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkrSKBKR4XV+e30AnWADztQMFm1oiGp+NcTdBitQDeY=;
        b=rowGUC3nEAoFnrrus5vUmz3KjJoNmTLOfs7lWGn/lvbTnzFv56vJsM5DdtFsMDQFhO
         Ica2B28cR1Lvoi4WXJIT2V01tWNH89f6BQ0tJ8HZ56B8admj80lTE58fuOiE9v3iTxXh
         JYsN8kj7+zEZ6JdQDpKEajzthBvUXJFnIueURsGwahOqRTlElT5kfBVDrz7T786cLiQS
         GfGI1GaHH9t+5m/loALeySMCBlny8PCyZMxdjeDt8AO9HFKsiucZdsxS8Enh9NJkHOkO
         xzp3tHhpo+tkL/qDiDk5gJkiL4ik13EM0Scwc6UStU2Il4LENL46KJ00ic4KULWwx79X
         lbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785729960; x=1786334760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZkrSKBKR4XV+e30AnWADztQMFm1oiGp+NcTdBitQDeY=;
        b=TfdDinLMBd7M0vLS+AvUez1ECN1y1j27XcOps2qjmCCqi7J4BpXs47KWxCinBGnWaM
         DL5JVZuYlB9GBAD8j0QeGpAoLrgfJ6jFNtoNL2gWcT/648C83vckKCFdOrz/aEGWdwES
         F3GPPoXdLHfwQ73+JHBMXfqhqyoyl395f9qL0nkYXdAJMZoK8alRSsii60hbtfMMC0Ky
         Y4/kmHfxwYhlyyxskRcFNU7SSpwQbD/5danTyIzq894dnfvLGpyqnTjiYD9s2DCppJ6R
         +yNqVHVRAw91jXTJ25YED/w0nfdX3Xzon7v8e8n6qlSn2BWaHWeBAhgjRgDPT1VsmpJK
         Bv4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqxl0v20+13bFHz/Oq1r6THN/E/c8//dh7wNUrH+NXSTsLZxmrJcNIlGxImCYJSCEkPpR2CfIM0UjvKyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/gha56v4NCIN9ZFX+3LQFkFcIsbk7Bvar4lz92FQ3z6A+MTVT
	K7UcLCf8NmPeGFNFnYPe209RJB5M09n82B7zRx0eQWyC1B5/xGjog8PkvIjee5LCXwKuwiSuEg7
	EWuqHIK1PmbaqX7fClQxwOR1toWDoKgQ=
X-Gm-Gg: AR+sD102yWbkcfjEj/sztbqnpnctjIlssRT6eIXa0a4E+Iam8RhRu/AHu5qRF7YJNXz
	EWaf9h6LgynCTRX4CA8OLGse6wveKtg2HqYQN92yejhte3itJ8QJAfysK6Ev/ijbpJebcuueGja
	2qOWYFYKHr4yBC8Q8Na2H7/3hSRZZi+O0PXadYuQVLfK0XxZ8gWQlFKrrwSk1ehruwpLx7q3s16
	bkWk1YbRHnA4chhobNW4RpM5LBn3ayE/5RGZZLtUWsrqpq5VxOOTEdo9iE/k7GLvXOH05zU1PHR
	lxg82sMNNSEzSPvRVDScnIcuOUNp9CpLYv9eEcjLk+yEFCOe2nvGJGUS5hoLO68ZFYyjmxZ8TPi
	5QbKWEu1mG1GQw6DOVyTSxdUZJr6bRArO7/7BjVTzJSKeXPzDJ135Q96O
X-Received: by 2002:a17:902:ebc6:b0:2c6:8d95:fd7e with SMTP id
 d9443c01a7336-2d047d1e722mr119237785ad.6.1785729959704; Sun, 02 Aug 2026
 21:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
In-Reply-To: <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 3 Aug 2026 11:05:47 +0700
X-Gm-Features: AUfX_mwmWkehn7fn21ZthpV8C77-8fEL16i2_UDhIMxxkiWDLccefzmHbHrgzbY
Message-ID: <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_210601_458979_839355C7 
X-CRM114-Status: GOOD (  14.11  )
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

> > The current caller does check the return value before using dp, so this
> > isn't an active bug. Still, initialize *dp to NULL upfront as a defensive
> > measure, consistent with how core helpers like _snd_pcm_new() handle
> > their optional output parameters.
>
> If devm_kmemdup() fails, spacemit_i2s_init_dai() returns -ENOMEM. The
> sole caller checks the return value and returns immediately, so it never
> accesses dai on that path. On success, dp is non-NULL and *dp is assigned
> before the function returns.
>
> Therefore, I do not see a path where initializing *dp to NULL has any
> effect. Could you clarify what case this change is intended to handle?


My intention was to make the API a bit more defensive. While the current
implementation only has one failure path,  spacemit_i2s_init_dai() may
grow additional error paths in the future. Initializing *dp to NULL ensures
it is left in a well-defined state on any failure.

It would also avoid leaving dai uninitialized if a future caller accidentally
skipped checking the return value before using it.

Best regards,
Phuc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
