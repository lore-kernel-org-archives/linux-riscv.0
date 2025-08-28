Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42318CA0FF7
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AbMy3UBF6uXTnWKuYB+mM3WQbx2W/5Y/1Yfd8TL/+z0=; b=NlkMOu6U4hHcxg
	2M9AQtcyNava3fGSPiqGDmCwBxFR4ms2/Xb08cedsc7o6W6RXMRbddYIKfWy8LByHQSzwum7iRA/k
	enICCp1RYCp3Db/hELFATkACuvY4h0tsf+KvJ8M171InXD4UeXq5dLtcnJTeFMXpHJ94Z3LWSXgYq
	aFW8qAQ8c34B6sHdcbrIdybLmUN5c/t6aEe1D6XNbwCCBPGaImLerJ9ywklBYEUlZYjFrjRizIkOf
	TPnHQALEzTUwxlDzV60hbsOB9sl3yIS2FerlyIfOS6OySkQXZx/rY4zzcexfeIxXXrFkW0GV0sXPA
	Gi88Pm46toUF+vJmGthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLn-00000002QAu-3JI7;
	Thu, 28 Aug 2025 17:23:51 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbR1-00000001S9y-1IMv
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 12:08:56 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f4978bc0dso1081085e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Aug 2025 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756382933; x=1756987733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
        b=XmIldfyzKt+eI/9N2QWHt6Y1QxLjQg7uovqWMdHByCBl792SRZaOM+dH5+NeZL3UhM
         W/J6fkpd9CNn4jtQWVdEX+9hYdVO3LLioQTvq+icusJJtCPEeOzYWBAD6ipQp6d6H4Q+
         xdf0T9w1Eeh61AKf59KXPsd3H+8ve2mCVzV72LxkKsgqXLknntj+IonzV3TA8q32dyy3
         U337klulXVZXnnh7Y4UzTXCG4E/kmwvj74rZEjwua23OLTBX2la+gumRT3kkDKl34lw8
         d/tG/hIeU1VprCJ/cj7xlhmIhcR37dEEGTvqZ5LwtIskWMg+FiDMSIQ8xx26MbV9zGT/
         K+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756382933; x=1756987733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
        b=SION8U6LWUt+5UuoMb5cJxZq84xbglJZSQymRzU77uAus+F8KKRPigmf+z+aCk0j+R
         HXNpz0jdzfdv31NEuBASR4mJxXfVQwwt7vB3w3oQrWfO56zmRE/AhqP2nXNfmuaZfI2R
         tjOfxKZKdiO/1ExH1evfXYdrt4izTFfMmviuzRI9Pt3Ss0ZCEy/FMhV7Cjhc2vi60VJk
         pgb37yzF3J6QH3fYskftRq5Rivd9R+4JLg6xxgNfsZMhBMD9PeerqOVFUVk4hQRo19LX
         PgiRC/NskUk7frSOlZ+AuH5nE7132+tyv8vdMS3NT6eVPI+njp77Q6L6wUc0KSWDmjtV
         UxIg==
X-Forwarded-Encrypted: i=1; AJvYcCWYQKMZEc6iPJ7k3w/40gKNOwPuHUu4jhx4cb+joaI6DVWKYpjKTc+NuVgUGo6+JVyIoRuJGkGs2jLshg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTu/H1bErF+LIRgcYYMeFymyJMRHrMkh6aTWLOGmkAic/Ljpge
	bJKVhFgxrpC28j0+lXeqiknEVWpEwIbdTlKl7IXx5AcTLIfG7cFFNG4RTPdIjHdrpGp3yGu5q6i
	BO0pGnTlsjwT3YEoYaZS8+m/emCFRr8wiOV/N2e6dcw==
X-Gm-Gg: ASbGncvqopmWwVNd8DsnYcOIWyoj1g4v4eWGxP2WnAwr3mMvpphuyqsEMAdqjNYpbPP
	farsxezj8FB8VrxRuCd0so5yOnxlDnatvVBZbFlbo03rgXZhbjo9LV4BVEfoLHcvXiSc4IrOqMT
	5VBRtqH7EAyc5s7A3/Nw3WBOqbmI2Z/y77f0GKfJGo3OHcZvsOX2IsVK9+qplp94lCUGcSvgwMN
	YXxTrqyfcg5LlFgLg==
X-Google-Smtp-Source: AGHT+IFg3M1giQrPALPiOG52C1JhN5PlRo7Xbw3xLek1Xu/lN9fGos88k4kc0ylKwurf0xKqLRcKUK5Mrc5xQ4s7/mM=
X-Received: by 2002:a05:6512:6509:b0:55f:53bd:b137 with SMTP id
 2adb3069b0e04-55f53bdb50bmr2129835e87.31.1756382933088; Thu, 28 Aug 2025
 05:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 14:08:42 +0200
X-Gm-Features: Ac12FXys7kn8v1WW0NYPHPp9t-_9fYAtRAX-1QlGxBAnqlbjxr2PgRu8yVVv_Ow
Message-ID: <CACRpkdYnM98n3JLBwVnVD3BRf4qrg4g9aBDqL_2Qb_cao6f5yA@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>, 
	Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_050855_368469_361916DC 
X-CRM114-Status: GOOD (  11.31  )
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

T24gTW9uLCBBdWcgMjUsIDIwMjUgYXQgNDoyNuKAr1BNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPiB3cm90ZToKCj4gRnJvbTogS2VlcyBDb29rIDxrZWVzQG91dGZsdXgubmV0Pgo+Cj4gVGhl
IGtlcm5lbCdzIENGSSBpbXBsZW1lbnRhdGlvbiB1c2VzIHRoZSBLQ0ZJIEFCSSBzcGVjaWZpY2Fs
bHksIGFuZCBpcwo+IG5vdCBzdHJpY3RseSB0aWVkIHRvIGEgcGFydGljdWxhciBjb21waWxlci4g
SW4gcHJlcGFyYXRpb24gZm9yIEdDQwo+IHN1cHBvcnRpbmcgS0NGSVsxXSwgcmVuYW1lIENPTkZJ
R19DRklfQ0xBTkcgdG8gQ09ORklHX0NGSSAoYWxvbmcgd2l0aAo+IGFzc29jaWF0ZWQgb3B0aW9u
cykuCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1oYXJkZW5pbmcvMjAy
NTA4MjEwNjQyMDIud29yay44OTMta2Vlc0BrZXJuZWwub3JnIFsxXQo+IFNpZ25lZC1vZmYtYnk6
IEtlZXMgQ29vayA8a2Vlc0BvdXRmbHV4Lm5ldD4KPiAtLS0KPiBDYzogU2FtaSBUb2x2YW5lbiA8
c2FtaXRvbHZhbmVuQGdvb2dsZS5jb20+Cj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4KPiBDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4K
PiBDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+IENjOiBQdXJhbmph
eSBNb2hhbiA8cHVyYW5qYXlAa2VybmVsLm9yZz4KClllYWggdGhhdCB3YXMgbm90IGEgZ29vZCBu
ZXV0cmFsIG5hbWUgdG8gYmVnaW4gd2l0aC4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCkkgZG9uJ3Qga25vdyBhYm91dCBhbGwgdGhhdCBmdXp6
IHdpdGggcHJvdmlkaW5nIHRoZSBvbGQgc3ltYm9sLgpTZWVtcyBjb21wbGV4LiBGb2xrcyBhbnl3
YXkgaGF2ZSB0byBnbyBvdmVyIHRoZWlyIGNvbmZpZwpzeW1ib2xzIHdpdGggZXZlcnkgbmV3IGtl
cm5lbC4gQnV0IGlmIHBlb3BsZSBpbnNpc3QuIEknbSBmaW5lCmVpdGhlciB3YXkuCgpZb3VycywK
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
