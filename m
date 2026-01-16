Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3A7C98305
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 21:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4s/kp3eS63yDQQVD6LnX/EbCpvg8fElkFwQETYCvROA=; b=dxYOV1E+RcESKt
	JN5JIonFZ8CqeVKbZ2LsW9XuRFg5EEREGjBe36o7WjqA3f0E37U3ONub9dH67ACBSdFBMdmbT9rZC
	8PquHq59Z3VGw9c3akzOqeMgh+yOsXFfaHJRTmmT3ByKtpbzNt7VGPQqSNbrbdIduY183y3eSHRNX
	xwqgy4ZP/P1L1k9CJPyyCQCHGdt6b+3Q/WMO0EIdTOMwca6Vo5WWjmN9M/Myg08jRNbvGYeV60307
	6Zbo7m0dYEL2vV6caC18vxANMmIHVFNE5q7K5KulMWTxuqKdngDMFjfi2+bbRWKVmVsO8C+mPfCAc
	6hEImL33/apftsjBPt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrfZ-0000000Ewej-0hV7;
	Fri, 16 Jan 2026 21:47:49 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrfX-0000000EweP-1xtH
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 21:47:48 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-647374e4cccso2199984d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 13:47:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768600066; cv=none;
        d=google.com; s=arc-20240605;
        b=f/oB1oSq/b4MYOh5j5rPRtlixVDv86gv/Nwj17HQtN2WWUrmQOrJ7ql708m2s/4GU9
         /krctNoeOHH/k1tNjhl5t75Nl82jCKePxVn4PO6gCXVY+W4rADkZc0ymAPZ2ngOqOJF6
         a90zq+/mKF5PslTEXUfNp8bfMYFOPV0rFpUfNeOvDZHs85stCqrlZQi6w9DBrRvKCVv3
         Q9fC05AEhXDyj6ULtdGuxnZBwro5MW7WrKjCvxvvL09Fbl/aVTvog2pV6/AMredED3A6
         rTbis7Bfby+2RE1Eenh7/xmPFUTPRw0b6WCPrDzb6UtdXlOI6lli5lH3z9vPDof+t+bd
         W0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tsi2Uutd+qnFT/ht+Sd1qAbadQZ8wkdaqUZCkUYgK4s=;
        fh=SrykbbSPyaAQPUdJ8lvlyP90kV1QoqGG6yfcA6rG4lg=;
        b=cfhYp07W4w9qRDH7flpDgw1GrHNbBnR6rp7pU85YR13tk2aqtPh7qeJ6vSKbLPJTIQ
         zj7G6q64GbriGhQug0E07cqCPq+RntfYwyvod6IKW3BElDVg+jay0oevri7qUdltaaBm
         FBp9mzU8+Db1zbRdZ0xez1YPy5N9x0KwHSxVT+sW/l48a/YvFGUpRzw8U33Bln/Inn4t
         gqE0rD5QedSDwWBz2KLDYqTUnipCWosC6fGSXclyqzhvSFMbKVrzl5DX4DkvtvcRH3kZ
         XcYbMvASDpPJDTzsVl8s2bVe/e7IO38Lgfj7nqo9gwii6rOa5dh6AkZ875DH6khXkDPe
         syUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768600066; x=1769204866; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsi2Uutd+qnFT/ht+Sd1qAbadQZ8wkdaqUZCkUYgK4s=;
        b=NAEbMxW00XU1kNOch4Hwlg/gImqPiUT80py9pEQbU5vCko+3Ja2HyhOL1oQJ37C3Et
         BJRWtUzoAG7roko4AngKrZH2NWfiaxxPFXIc6nMoMR4MK4iN1Hk2N4C9COZrVV9YRxlt
         EqSUJFxfGIP+zjztL7MqFiGy1mIUFxQ9X55XJZF2vGqlLFSNLyaHQXh+SwkQNAITrU4J
         JkttZiM9fCV5iRJIpr+hblJua7Xtw0VdHvumY7s0NpeBDQ2EmU52XaGfK9Vr+qxSvwRX
         Zpdo406oKKRxV6KxO+NT2nwsUcGBbG0VaIXKM+ap6hs6S/92lcEguyQN1GLSOr2ITIFk
         46Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768600066; x=1769204866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tsi2Uutd+qnFT/ht+Sd1qAbadQZ8wkdaqUZCkUYgK4s=;
        b=CzkhLVyM4KOnGuFEK8n20GxRPHfLs65I//mfybkataTZKYUc619M2nWuoUOo1E52jB
         LMEyaoszI2vSGDji0lLsJ1Nw5PkzNNFatzeFjvgNu8uGgg4D54QPP13nlVv6wq/qvuG4
         Rlt9wMx67Mqq5IgyfWAiKgmPRCeqm/APl6wx9GUiThj+Xa3o/1WUpq+iyR9NYOAc1DKS
         xGW2a/jm3WTk1PLRJc/oazHuWMcEwVLLC7ueVLravVZ4/Kk3ARdORiwL5danNVCM5BLD
         0kIJNrEG+LPMRC2Cqa+GEcg+LEV8NAZsKSL7dpzFrEBcYAmE7r6Pb/4SGcWjR1rK4bQ/
         0Gng==
X-Forwarded-Encrypted: i=1; AJvYcCU4qAQNgRECtmrvTnH7a4b0+XshSP3aO3arxghGaRR+6UbzIlXiuvDiA43CpZK6Rpuhrt1ihHzsvGdNqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIX7K2G1dqrVT4ibLRgUbL0+DEiNZYTmN/jXNDjye0G5VPqeGO
	u+IUqL+D3L0jNdJUlcGOTRZBlU03nqiKyZ/TYSTOgUdZuti4WmOiTBwyRczS5x8ve6TfeURQwIX
	/LbCumajwXfA3ugI4wl+jnCeFe0yVxvVhyMpKDNt6Tg==
X-Gm-Gg: AY/fxX7EvuGSKcZuJr32lNl7h/SCmSedp7ik1gN584cFRGjxCZ8gRHhx5v8Y/OXVmNv
	nEITZswqGp3pOKRW4JJ7PzMD1xVgWwrzufp7nOqtU+qd83o6dcjdEzkWN1BRsYFRn6EurMi3eK8
	UtvyYMAE9vT/Fxl8DoK3T2YwfpyuNc3jmX/Jfeo9SXsi+HAPcLp/JlpX4U770PGLatwfWz7wNW5
	am5BFxkRvO7N+4MFqZxwegxeJcYeaQdSPSClRuIgXiXNX5ZBizs22ybtxlpd18KogYkQw09pGvw
	ol0u2y9sskt/xBcY1x8q/+0CYTd83Lrnr3BB8IoJA1nGwrCbmqEuF0RfPGwH
X-Received: by 2002:a05:690e:b8c:b0:63c:e3eb:20d2 with SMTP id
 956f58d0204a3-649164f7687mr3897690d50.52.1768600066108; Fri, 16 Jan 2026
 13:47:46 -0800 (PST)
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com> <20260116-sloppy-daffodil-ferret-b5cebb@quoll>
In-Reply-To: <20260116-sloppy-daffodil-ferret-b5cebb@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:47:35 -0600
X-Gm-Features: AZwV_Qj2Tu0a6isqrKjnGKdfFtIqrr7An-1ySaWl55wpht_7I4E-0awxisTnF4Q
Message-ID: <CAEev2e9wHvVGAhQJidpTNLyWPuMD91_p25V6QeCizm8Yh-qtTQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_134747_516289_C8EAFD48 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mLAoKT24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMzowNOKAr0FNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFNvIG5vdCByZWFsbHkgYSBz
eXN0ZW0gY29udHJvbGxlciwgYnV0IG1heWJlIGEgY2xvY2sgY29udHJvbGxlciAtIHBsYWNlCj4g
aXQgdGhlcmUuIE90aGVyd2lzZSBIRVJFIHlvdSBleHBsYWluIHRoZSByZXN0IG9mIHRoZSBmdW5j
dGlvbnMgb2YgdGhpcy4KPgo+IFlvdSBzaG91bGQgcG9zdCBjb21wbGV0ZSBiaW5kaW5ncywgY29t
cGxldGUgZGVzY3JpcHRpb24gb2YgeW91cgo+IGhhcmR3YXJlLgoKVW5kZXJzdG9vZC4gVGhpcyBi
bG9jayBkb2VzIGJvdGggY2xvY2sgYW5kIHJlc2V0LiBJIHdpbGwgYWRkIHRoZQpjb21wbGV0ZSBk
ZXNjcmlwdGlvbiBvZiB0aGlzIGJsb2NrIHRvIHRoZSBiaW5kaW5ncyBpbiBhIHNpbmdsZSBjb21t
aXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
