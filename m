Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8187CC5DF7D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 05:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R42v6K3NK6WU5x2c/4B/+BbatPL42Q0eSEKlrchGdVs=; b=kJ7lOdza82a2Nq
	N1d5Qd/mvfmX089l0n82x3aDWZLgkBa/EviqqzzFRU2wbOv89HdZ1zUFwUJc81wVHLvjTAS0rnZN/
	ozi/fa4gbB9QYJMOMIwVdWSDzowvp0lBK7Bw73eNK+bwOMQRwb0w9gKdBL1ke4tcYxHUeufYiu3BS
	wznFsjic7rSeG35L3dz0DjCPyCcTzKvbXANvYhs7bUN/ec6Xbl0GeYgES+RCowImoRlaNtmqLKiW5
	M8bV6M331m2/EzN6t2JBuzbiQgg3r6CbOWA4Xwj/4P81xabpCr3WbNjfIH2zi/VB/oopLg6A0ezMJ
	BGsAMa8pOgqncdxnGZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxHdU-0000000CYYh-0Bwl;
	Fri, 21 Aug 2026 05:17:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxHdQ-0000000CYXs-0neU
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 05:17:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so11657875e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 22:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787289462; cv=none;
        d=google.com; s=arc-20260327;
        b=sPQpERbMvmDMidoXcvclWjK+9PW0I1lQZffNxP8vsHtJzet+xwG4FEXNUN5vf+sAU8
         AyMEj+f0b4jG4/ATbBR6xXNR65C/nSGh1xZiV2r84OOkP7YpM7uFq1SZIHdWJyruMsXW
         J+BkRtF3MwAkFH3jVCOHlLiRUAIjuN80urGMnqlpcgqy+L5Zi4m+leDbx5ACWL7sbXBG
         EXpIezEpEXhoHlpOGyHCX+Bbgos6494moHGoN87Z3l9Hlja4rZiyc8KLfxxIpxSKgrqp
         1pPx/8lwm4iKTBWFRZ5Kkd8CyCZ3Ld28m+87gVAOhlX7It8EWN+Yf+r2GyNG+sWtdlRh
         c7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=13mpJllH/Zvzc6cEE176TorQISQiQzdps6jTNyvGa88=;
        fh=SC8KtVToQdm2sDYSISlm4yVeYgoZkHNDOb5zjw7sK6g=;
        b=jNZgo6ucEZOK1WpSzAp04PDKRuUD0Ox7bo8usRul4VUmHDwvfkMjh2n6eGS5xyPjBC
         rZDYJQQayQviuREwYCa4DNFB7l0dX0TkOdlJ6OkbjI6if17yQHQFlZvDpXnAr2EyNNfw
         qR/SAhq5I4SlBMBucLOFvFL702LPrhPxN1yCO7Ca6ieDt0whk9CV8WwcX9VWECVvM/6e
         /q9NviISlFDlufuGrNHpl6t6s0gcP6CK2Q7R3w4mJZHRn/IviPy/lA3ebgJtOtl+QBGA
         /GuJ1n3CC7Dz8VTAXWVn1girP7mKiIrAIK34Xae0mm++iKcbg6P1fTCwqkCWyo6SKVr0
         Jy4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787289462; x=1787894262; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=13mpJllH/Zvzc6cEE176TorQISQiQzdps6jTNyvGa88=;
        b=mLpyN4LV0wZa+v8dIOQdxh9luYZgEMAxUuaZY00qugtaWvXJa3/UVdk6oxpNnn7X8M
         q9MG4aFhXbHYiYlq42kyBuyx4+3iaIKN4UioFaUuZwfCmzwPxVVP6Z9LvtSofqAQz4Pv
         A4DZSD4mZhq67a+sC6WFNllA0aJx7IVpOi+t8pEOautvLAdBlrk8AN5foMBfO3osdqC8
         odCNCBLito9p2PxN6kbE2kgpl+VIiYQL7GRK8s4xTLRles4rqGVrFrJYXMzwvEysI9XV
         om0KsQwIQ3U3zOJvBSoBwX71A/joi0bPVXXEjD3cITV3aH/BNdzRDp7TEeWo8W2RGA94
         Clrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787289462; x=1787894262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13mpJllH/Zvzc6cEE176TorQISQiQzdps6jTNyvGa88=;
        b=Rk0ZZmD696WktmKYFlc1tP3nsu+Vh2DJF54CYGblrIZ1qxq3LVmWddqTACD8PpBsGi
         wk94vPvSZHH7UxhlJwY6rlkBmN1iYh5Tpo3WPt5tCDF50IYA11REpqBJMYZbFCy9NDD+
         Y9JHp1Vym3C0dO/F/uYq+Xoi+vnVJ538AsPu7RQYOLnjmZAA+Gcr3EN/P8BsBZi63dAX
         Lxe6A026+gNaDMea/2YrwzXk2Pe4d9usTP6XhFN/sTkazSY7MDhZ3JG+YyEINrF1Gg3e
         tb6vHDjGRfyCUe31zQTzQuFV28h69/o1tTP08AZcVgEpRPKlm2Ne/OpHIS4Q6yQb7mjp
         BQGw==
X-Forwarded-Encrypted: i=1; AHgh+RpSyI2Wdf9mEDU+m2fdxGPDVqz1brE/fIU0mCQzJSQw8zGkc9wzJQnri9dsqUFbTSgq+rJ1yigr4sJsPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsKghO3SM35kV6mNHqkEVf6MfWlOrgAbrMF0G+VgyS7A8JJc/m
	s936cdePs+ayAZrDH15G4XMp2jZX5oK/9q5WRHVrk99i948cFIpa2h/Kfd7kYsvjMcrGXiy5RqI
	dS5ETdHhUwIc4TzE76+jOQKGqUgE3Gv4fKpBeyUdjHQ==
X-Gm-Gg: AR+sD13B7wg7RL8o9L+52fFq+nSBdb0OlcrNwbO9SXf2hEmfk9T+/sDOMvi/xJ8l6Hk
	siFFsgA1JYSAeoz2xXI60cWZWgxptvfZXaULrJ/U5sMTl9RlF6XyphDypKMkssnWc8F0NE34TFA
	o5SIggWAkQIqtz0krqVJz6cBYYlYhTWG3yez7ohu/1kMlkLKc66hSahwIlngNEzxZ3T8BLQM+wa
	4w9nsB5TS89i/x++366zrkij6j2PuUqjg/Muex4Dwc/dw/a+v0RtPEsVKKlfYIamaMRFw0fJuVb
	gbUSQOg9J/z1lHwNMg5u75G1VIcZJ2N+JRq8vdJG8P0mb1BOL2dp/YNf874+Cb7XhSzsaE19atv
	rlzxKweQm/8XomeMqQIgCfBQfn33SgI1ruhxSJyBr0XSgZ8SgKDrBAQlfxwP1fYE=
X-Received: by 2002:a05:600c:8b63:b0:499:7f37:cb74 with SMTP id
 5b1f17b1804b1-499b06a36demr94909825e9.1.1787289462039; Thu, 20 Aug 2026
 22:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260721073612.137259-1-xb@ultrarisc.com> <CAAhSdy3kDmRxcT_+dOpcUVAkvZ-F0kWdQett+mTy93gPDkwS+Q@mail.gmail.com>
 <178728288861.534500.12009100192281293732@ultrarisc.com>
In-Reply-To: <178728288861.534500.12009100192281293732@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Aug 2026 10:47:28 +0530
X-Gm-Features: AcwNN1VyOTE5mxX9-Emhx7eOr0LfPk9cSJYrSJElhptVzuqH563CP-bjvH7fuKc
Message-ID: <CAAhSdy1shnw8-4yNVtsO8tJdebGYdX9n2mJyhoMQ9KpuitsMoA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
To: Xie Bo <xb@ultrarisc.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_221744_246183_0ED3259B 
X-CRM114-Status: UNSURE (   7.76  )
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

T24gRnJpLCBBdWcgMjEsIDIwMjYgYXQgODo1OOKAr0FNIFhpZSBCbyA8eGJAdWx0cmFyaXNjLmNv
bT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gVGhlIGlzc3VlIHJlcG9ydGVkIGJ5IFNhc2hpa28g
aGFzIGJlZW4gYWRkcmVzc2VkIGluIHYyIGJ5IHVzaW5nCj4gbXV0ZXhfbG9ja19raWxsYWJsZSgp
IGFuZCByZXR1cm5pbmcgLUVJTlRSIHdoZW4gdGhlIGxvY2sgYWNxdWlzaXRpb24gaXMKPiBpbnRl
cnJ1cHRlZC4KPgo+IHYyOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA4MTAtaW1z
aWMtYXR0ci1yYWNlLXYyLTEtMDBlZDk1YWQzMjFlQHVsdHJhcmlzYy5jb20KPgoKU3VyZSwgSSB3
aWxsIGNvbnNpZGVyIHRoaXMgYXMgZml4IGZvciA3LjMKClJlZ2FyZHMsCkFudXAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
