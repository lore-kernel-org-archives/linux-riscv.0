Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAADCD4F47
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhWDTBXge+AZzmVnbbzyQM9/keeMtv+PlJpsQ3IDj7w=; b=DyP5xDTKei1HWP
	SU8mhAefq16Cb5enKgGBbsiVHktb0UzYY92CgNv43tdKwRiY32+wgrxOGG5jyfErbcSqJlyD+sRJa
	70aYH92+IcinT1ERabiLoSQCxd6WDpJ4/0JCShFz9tkC07JprvjGU+xPB8S+DljcC58Q0ICYPcBYe
	db/Kt0VkX9OWcE/BhnlKcUrnFHqxLTnXlFnYomR86hNzEzkuht3UeJF2fR4PzNoqGyP9ptUHcv8gp
	qvAn9mtYnyynSncPeqMPmLfVpYBaCC/gVmo9+vJ0sVdG7pMvN5RETjd+CAAY2Rv1eCBk4YygEdoVi
	znDrblUf9kzEQ3ACNIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdc4-0000000CxAY-1so1;
	Sun, 17 May 2026 15:41:08 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdc1-0000000Cx9M-3a3k
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 15:41:07 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-69b8cdfcf50so674900eaf.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 08:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779032465; cv=none;
        d=google.com; s=arc-20240605;
        b=iBppvDd9VW/jTrjZRQhUB6mGYTGDAEVLtszXBDfSAED/T/fFlSMqi+2eQdgSiU/ptb
         pdvxj+fXI2zt8kovfxZGhNH5Y5Yzv3WvHWkjzB8kT3mrgtPlSi/2jJi3xHhLAo4zfVHd
         KrzoTUSz7S+ZxgvMIwxDsugGwD1gqtMfwVhAxa7YgolXREXDUHbqhom3dO1P3knl6m89
         4piNdFWzf9kdS72IGguZyAI8smdmu7IF88D8YZvtBeeuC/udka0vM745YrRjJnFgeu/P
         ybDA6kBEK0lCsfv4ByquvJVRouo+utJlG6Mt9SA92nbRpMw5PVbFlpWTwCew0buqaPl0
         Op5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0PlNFCE2Ddf3BbVrhfMNR8SsVsSBHNtjC+3F7OAG5Y=;
        fh=jiHFY12BxKX/uJpBVz4DSd8pUw67ItZJnbJxPEfr5tQ=;
        b=Cb3/BJWKI4zRDS0fczFeNX0pDcUalyqbnfE4Y5pA9VjHWVYocwCqM++08yKLzStj+N
         IZ4fp6/Ktlm1xaW8W4oCu8cO0Olf5TvjmjtbnuCt1bdnB3d6rbdB15lVGZj2rIu0C2Yz
         9QbHRDWOBWr+7NDAz3rbI1WdErQb91Rovpnrt1MTSUVfTC7NlCfShOsilprNrMDNjGOv
         R/ZF5bQi2RUMmZ67GTYSdkOY7CQQXFFMcpOPAfmk/nGeXYHGXtmIp1VnWpPJ2j//uYMz
         W+cTZuwei1fjW1kgh4vPpMdWR+00xBH0xuS+fG2loC8OmaV3JlbeIQqwH7PpzfBLxHtr
         RtVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779032465; x=1779637265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0PlNFCE2Ddf3BbVrhfMNR8SsVsSBHNtjC+3F7OAG5Y=;
        b=CRpBjWSNkosvytExgircEqqw8IN66xvhnP/XCxwDxqWaydqHMQ/QsUV5gpr9Xb8Ay6
         FNX8GYLSkUwUqhgGwBAexSnjRZz5yHbRm0HKcdlVTbzGN1wjRCSRpMd9R+I34Hs/7SSZ
         +Ake0zMzITLLA8aBRq6scLFC0/GBPX4axLqL3OKV8QaHJZsFyH9Gpd150yyFSq3FDGwZ
         4V+ocsBKvLj+TvKLJHjczv4fpxDbm6ydYq06dNG2WPe+c3AF5t4D2v636xyarWYPP1Jh
         yLyCzSH0EN85QRGMv89lD8BvFwgyZ9lk18dpqE8mEDBcgha7Vm5Q4Qu1svc5Q+0hs7Oa
         Icyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779032465; x=1779637265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0PlNFCE2Ddf3BbVrhfMNR8SsVsSBHNtjC+3F7OAG5Y=;
        b=r5QLGUyjXlv2sH1sYKKUbANeDuzqqCC2ZLzBjCXLuqDp3MPpJTX3phqjqqcGgzDmtt
         QdqzLrIUmrjivdYFhwk/uXaA2JBH/usaR3lKGIRpJP7dQ8NoCIooPuIgQJ3qlL3wc/QM
         TjddYq+Wg2M9IwlWoyGjAaLLtnCk7d7PnQPxrz4wQPcdDt/6ejYA82YxFwICCWC1cCIc
         RJioBRS5vlDVMLObn7oU+mRoA6dyduBAca8OdECFyQngGuNieZAsfU5fn3P47OiH9x3n
         ORm8ihk1f81AckR9ATBLrlujMZJegcPUtWQWZwo1Njn83GeXchU3RmaT0lm5Xl6wwy0z
         DwfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RNTCz2PepGqIG83ass32FVcL0LPQAIrFo0C8T34NdlomyTphjaL1w35lk4jWSk7SdGiZ8yIme7brqqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YznQ43WHtxNk1BGtotMrR0dHrelxiV5h0mvIfPWI+e3n5BQXDzV
	PBmrULq34Q3nIzbdPMWGKcIUG6ot+94f3SL6zixo03JIczCScIdcJvyhwbaDitaeNB53UTxn4HI
	AcS2JfmEhI50HRxGbrsaKz2CyNV6mK3XkZ+yemiUbwA==
X-Gm-Gg: Acq92OFe21nJn3AdMyUPJVDmj1POrIHlucSXIYeDbeMG3Yi3qun0bJ/Qto9Lm1/xmpP
	anOUZn413fXeDG052fi92tdmq7gOBuGVZxH4LvJqaAK+5z/6jf5plzNt81mCk/77jbapdlTcPLK
	7NCRX7rvOVaCmVON/fzCZjXHcKqYJICV9dcnujhKJLtxYZ6A6S4GLTf6KN2cJQIy8REXwEfLliK
	V6l8x3dHpMH8oHCnsnDy9/J+wxrSxIp2JZPQ504uo5NpDXWOZVqeQfzqTgUQyR933AzTbfhLqiL
	T9kbMnh/ZYW8xLRabqv2j/7vE9pThzfpZWTTcWTRnn8DXZcOzqOGu+naJqA9h1v4dbYPaxQ/UhM
	mFtv4wnNs7esrfoJIrttqa1SRwzpdykluX79+
X-Received: by 2002:a05:6820:1b05:b0:696:2674:8a18 with SMTP id
 006d021491bc7-69c943688ffmr7938889eaf.35.1779032464846; Sun, 17 May 2026
 08:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260517124414.420919-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260517124414.420919-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 17 May 2026 21:10:53 +0530
X-Gm-Features: AVHnY4LJK5mceV0jtKoEXm7BnXz6dh6qkKEbPTaVu6WNg2Byna91HbXT0gIv9pg
Message-ID: <CAAhSdy3JTPZACJyKTCVsQeiDf+shPn9qnn2eLa=7Yr+73HjqeQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix NULL pointer dereference in SBI v0.1
 SEND_IPI handler
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_084105_902097_D78E26F9 
X-CRM114-Status: GOOD (  17.99  )
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

T24gU3VuLCBNYXkgMTcsIDIwMjYgYXQgNjoxNOKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBTQkkgdjAuMSBTRU5EX0lQSSBoYW5kbGVyIGl0
ZXJhdGVzIG92ZXIgdGhlIGhhcnQgbWFzayBhbmQgY2FsbHMKPiBrdm1fZ2V0X3ZjcHVfYnlfaWQo
KSB0byBmaW5kIHRoZSB0YXJnZXQgdmNwdSBmb3IgZWFjaCBzZXQgYml0LiBXaGVuIGEKPiBndWVz
dCBwcm92aWRlcyBhIGhhcnQgbWFzayBjb250YWluaW5nIGJpdHMgZm9yIG5vbi1leGlzdGVudCB2
Y3B1X2lkcywKPiBrdm1fZ2V0X3ZjcHVfYnlfaWQoKSByZXR1cm5zIE5VTEwsIHdoaWNoIGlzIHRo
ZW4gdW5jb25kaXRpb25hbGx5Cj4gZGVyZWZlcmVuY2VkIGJ5IGt2bV9yaXNjdl92Y3B1X3NldF9p
bnRlcnJ1cHQoKSwgY2F1c2luZyBhIGtlcm5lbCBjcmFzaC4KPgo+IEZpeCB0aGlzIGJ5IGFkZGlu
ZyBhIE5VTEwgY2hlY2sgYmVmb3JlIGRlcmVmZXJlbmNpbmcgdGhlIHJldHVybiB2YWx1ZS4KPiBJ
ZiB0aGUgdGFyZ2V0IHZjcHUgaXMgbm90IGZvdW5kLCBza2lwIGl0IGFuZCBjb250aW51ZSBwcm9j
ZXNzaW5nIHRoZQo+IHJlbWFpbmluZyB2YWxpZCBoYXJ0cy4KPgo+IEZpeGVzOiBhMDQ2YzJkODU3
OGMgKCJSSVNDLVY6IEtWTTogUmVvcmdhbml6ZSBTQkkgY29kZSBieSBtb3ZpbmcgU0JJIHYwLjEg
dG8gaXRzIG93biBmaWxlIikKPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51
dEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIwMjVAaXNj
YXMuYWMuY24+Cj4gQXNzaXN0ZWQtYnk6IE9wZW5DbGF3OkRlZXBTZWVrLVYzLjIKCkxHVE0uCgpS
ZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlz
IGFzIGZpeCBmb3IgTGludXgtNy4xLXJjWAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IFYxIC0+IFYy
Ogo+IC0gQ2hhbmdlZCBicmVhayB0byBjb250aW51ZSB3aGVuIHZjcHUgaXMgbm90IGZvdW5kLCBh
cyBzdWdnZXN0ZWQgYnkKPiAgIEFudXAgUGF0ZWwuIE5vbi1leGlzdGVudCBWQ1BVcyBpbiB0aGUg
aGFydCBtYXNrIHNob3VsZCBiZSBpZ25vcmVkCj4gICByYXRoZXIgdGhhbiBhYm9ydGluZyB0aGUg
ZW50aXJlIFNFTkRfSVBJIG9wZXJhdGlvbi4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmlfdjAxLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV92MDEuYyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpX3YwMS5jCj4gaW5kZXggMTg4ZDVlYTViM2I4NS4uYzljMzIzZDQ1NzdhOSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV92MDEuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpX3YwMS5jCj4gQEAgLTU1LDYgKzU1LDggQEAgc3RhdGljIGludCBrdm1f
c2JpX2V4dF92MDFfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVu
ICpydW4sCj4KPiAgICAgICAgICAgICAgICAgZm9yX2VhY2hfc2V0X2JpdChpLCAmaG1hc2ssIEJJ
VFNfUEVSX0xPTkcpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBydmNwdSA9IGt2bV9nZXRf
dmNwdV9ieV9pZCh2Y3B1LT5rdm0sIGkpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
cnZjcHUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfdmNwdV9zZXRfaW50ZXJydXB0KHJ2
Y3B1LCBJUlFfVlNfU09GVCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDAp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAtLQo+IDIuMzQuMQo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
