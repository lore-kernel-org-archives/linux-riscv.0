Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4035FC55182
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 03:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmF7baGqwPaMOG916xkJWMAJ1xW6OCVz2QzkPoImvhA=; b=kE6m4r+avkkvJk
	sUDB9bfbeMshbLsy9E8OpfGkZk5w84qk3i97C0BzzXdnWUk0XVgKjgxpPLhT221STzuaz8T/d907a
	QqRywKkYrDYj7/zO14nQONYb1JJr/Bg57/hxBOwz1TAiwJLIiOy2DxE5xm1pAacmKJiBkdKcGUIKv
	OqA40d0L37+LpCOEv2dYmfmeEiuBdgbXaS5qhRQZOlPQW7rymP3eI2yO/3EZ0rFdOMoRY8CVLLYk9
	KGImMCH+r8M0HY9nueSSDgYZGaaaev+rt2UzVU8FJ87lJ1TsLlSSHws7Wld4kdldyRg0ImW87cUrB
	Rl1buY8ids6/jO13xkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5yu-00000000vut-31IJ;
	Tue, 04 Aug 2026 03:38:20 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5yr-00000000vuK-2VHQ
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 03:38:19 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8487214ad2bso5776442b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 20:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785814697; cv=none;
        d=google.com; s=arc-20260327;
        b=DoXG+5D0nRFggOYWW2hvlgN8MewdXqtrMst7RVAHn6pm8GxvvqsHorHHhlTTHCmPQc
         pUC35ouDSCD5qqsHHf5vr+p63L/x8GdrNVIvWTEmXD2ejwYSkAHzFuU13Af9Y0HRhgs8
         rdrb/ue1Qn+K2zRNKABi9/w+kFpaPu5HdCMcFzffqxJBRhAL5PtW6uDbipNDaIKeEiG0
         TOunHO+9OdioM6EEiEeDPotj8IfDtHl7Y+K/bWr4jXEMZFuBJ1SY6veHNCpEQH0DW7zs
         bcQOhNyNMzwur9G3nKtG9Pn3jwQEp7V9tIj9GGLw6CNG0ZvLPw6u8k3M7FvLnFRmUrSS
         Q9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
        fh=gygR3RXKC0PqS0RCFAf7MBA9sdFzWE4AJZ71Pa9V41A=;
        b=V5tMPvKeFfLDrCLKzpdzots5Cq5RBnvzA3LxhjNgBRhVPJY+St9ahcEAkVst2cYJdW
         odBZUDVOgk1Fvim7Vwa7cr6mcWCm8XfTsE3t/afnB8mmdEiEcDYRONfDlF9TZtT5kaIT
         HXnQwBJT2kuPytgCwYc0WPvGgKCLTa+HSD5pGiPVfizdmUdclZ0VTAmp1bwZIf/RbS2f
         27+IHr71WY8MsG1r7CUpfE/nWkRedJ9/puKd8fA2z7jWYr4AkP00aA9GwHrPtNU4snr4
         3mboxzZo98eZzlVnCLYysb49a/uhpxoqWoF/ARDAA6rtsY/838lyK3LIKjb5l4Tolad/
         /tDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785814697; x=1786419497; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
        b=WzQSMhNPGZklbqSFUUGXtBxjJ4mXupaef4cBlCqYMEJY4/ore+5uDovfx74UlDl8xz
         tgvzHHvDh9CTOaA67gUBE7U59pCyRFS/vFW16THRjuoCFYegNEl8y9Vo3fAp1wvHFRuY
         QPIh9yHBBaJCDWU844WM7INz8zDVII3Q7S7TAklvMXu47OXW+CIz9IIiBvkaR1vh6L8M
         Z/Tp3sQOqOcxGmiWWam+IGu7xxNIJxvCA1scrw8WdwioWv96Do70o87zwdAFdrrGNo1K
         cQEWedNugI9cpYlUHEJok6YzjoAnnvyeVjBQh5RT37/bLaF7sH+LaVT2wjJ2uK0TIwJj
         mrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814697; x=1786419497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
        b=PCd15OK7ImX8NlclR+Z2s32GpbONg5LCqco0TPydQp1lrmZhkoCFiEGPYLtiJ8+/FQ
         t6CZ4F1uOwEi/p+r0AjKi9vLBNiCTkp3PVo2tl4R1tGZoIXsjnVX/D5mY58odub+1Sfx
         4+XZlDRA5shrUCZWvftbjrQwl3+gC0s7j4ICtCjZIFkVo/9fB9RgfQjt27KJgbG57lW/
         jPppa6FVGWJMQpHEBGmiAq1xXdG7QamHNtxcGcnBJ4c+E13pLoJP+6w3VQMEj4C9NXZd
         4ZY6QWzrwec7V9bkTpeNZw+xPb9pSAYu4bRaEFkUPwHveMSbO3e6TT4/Zdpomr0ZIN/D
         8abg==
X-Forwarded-Encrypted: i=1; AHgh+RqYgsVHihUdoY65cxr5F6zdqRLXwwe0VK08MkK/CruK7UryrVSGfy327V9oSkzwhT4Fl/cIHklN7Bb/Aw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuqOUQmnTbnWFzeSt6SstGBx2sO3zoxt1TQfooaoanmHBVHa1g
	NByBNZfXTCEBtKphTUCm5fxqiJbNgI/FyTETSDKH6FQ2BYgqgZ+MxE0miEZJlglNUucSfmNo6E8
	yXJ8hwGgnf51AaTrEaKesI3fjxMILKhk=
X-Gm-Gg: AR+sD12el5GQmzF8/fVQto3EZ9WlbYf8YHIx6VF6s5h6gBeWQM7WvmI8eu6LViZv3yJ
	WdvmCmbRN4CcMECgPdmqnVJG8iK38Djy+N6K54fL4BfbAqsUoCoiAljwuYshCfXq0E8Rv8P1a73
	NGdXjOWsPT3MeQQz88/wyObWflkpngty0cKXI84nIqQHZnY7RAXpHRnO+edxiME7ZBXEt4BHNyX
	wdGDlfb/leEbPOZ8cQqwM9Qsj4yAgvBIQjnHR7ujHAwNsx96XHQiuY7t7surZS6CjTi3nlSZWIi
	bTTEP685CJ++eUcmnz5/LhcOAU+/OxpAkWxx1ImtaYof3o+KjGWNNKriK6zzXNLzh0sTWV0iV7r
	GxL3GfV7lrkeYQg80ubKxBgJZ1LcSodQHSLh7bJKL0sdKzT4kvZNO8NCGQnaP0snU1SE=
X-Received: by 2002:a05:6a00:12c9:b0:84a:6e0d:692d with SMTP id
 d2e1a72fcca58-84ee4920b3fmr11591322b3a.46.1785814696703; Mon, 03 Aug 2026
 20:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com> <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
 <DKF3O1FTBV9M.M82B257B0WI2@linux.spacemit.com>
In-Reply-To: <DKF3O1FTBV9M.M82B257B0WI2@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 10:38:05 +0700
X-Gm-Features: AUfX_mwUhKeIhKcbOnxSm2msaY0Gt-2eSKlA6n-4fwTFNHrQX2Itl5fTDkBIuYY
Message-ID: <CAABR9nGA0dft+MpoPJvvCYvDnZq0OKSNoF10+QUMxEakvz+2Ew@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_203817_976148_82AD70EA 
X-CRM114-Status: GOOD (  12.56  )
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

> I still do not think this initialization is necessary. Currently,
> spacemit_i2s_init_dai() has exactly one failure path: devm_kmemdup() fails
> and the function returns -ENOMEM. The sole caller checks that return value
> and exits immediately.
>
> A caller that continued after ignoring the error would itself be incorrect
> and should not be accommodated. The helper is also static and has only this
> one caller, so there is no current API contract that requires the output to
> be initialized on failure.
>
> I suggest dropping this patch.

I agree. I'll drop this patch from the series.

Best regards,
Phuc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
