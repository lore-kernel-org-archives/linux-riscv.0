Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A53CC88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEZQ5XjdzpM1udXOGqty07O7/Wc+dPFdl+1SgUZ0boQ=; b=WxbxtswWvV1UjA
	bX5IbsFCXJlCOSERbUSV23D7q3Ieu3UYHm/u/RwvJ3f5gEYyGgHldlAjRG2FWBmcqgze4Dhi7duBT
	Mc5z9ngvzltTRfn6pczl/SXVzMPHcBDL9jdQPTaKh6UQNqbGIxM/+ZcMixks527iMziHxAQnSUJbq
	Zecoq+Br0vIQAMRHJCBETHq8DuRw/lzDKGkRdQ4Zuzw3PU+ue9ZUm4+rZV8fpAjlzlX03cPUVrJk3
	oGSdX/fa4VHs0e70OFM6C5lXB42OIpr9OxxoyTboxPB+NrSHZLh9WOPRmy1xNjsfGFoQG+geX4Ndt
	hQqzhy5hIOxJTElGiYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PmT-00000005ovT-0vur;
	Tue, 15 Sep 2026 09:48:49 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PmR-00000005ouw-0Fzg
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 09:48:48 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43ac8d1dso17920377b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 02:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465725; cv=none;
        d=google.com; s=arc-20260327;
        b=WWS7CSBwsRHpdw8noJ8CFR8ld5sALpNZ/V3PMEtmcag9LTovAmX0QPgz4vTi6wdLWc
         xry94mODhnd5Y/bevR2diIYY6bHJAAA2zn8ex5vzR6U2KbbNJ1vQmJpPaEIn9yeaEU7I
         v+XbQMQaU0L6LPth985ZtYbEt5CnLt1UU6cypRH76fnsTMtY7g8BkIUwQzHAa62Ixoro
         gb6045kAOk9cxBxgewM9gQIjBkviSIEVmRoaT7u0dGE3ZBKCqZ9IznMdY6zitdpmBRL6
         J/2lylUBWhcjK9cW9FNvWb/ROMMu+RW2BYS2/tAF4sOFzGSqzQJ/zoWHN4y3dvzKYypF
         dQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xt/N1c2QTUTpESd5vWZaOt8vFR/C1nSv7TXwJ+U64JY=;
        fh=MCVHZKxbk2FnkdvpvUmwGOaEr6BMAI4Yi0BJ7lmnu3g=;
        b=a/TjEAzfKBHyTPUOubdB736ohucLehf2gEecBPhPwb+69P2gT8n6jrykg7lQ/kZmRB
         uZPGVn3i/u+tDbJNvnzg5HwHY7gScsvVNtKuC9WcC9nwyEfxm3C2n74HlnzHRSauy3jF
         /2cmJn+Xyrvii1jFYyfVp7oe3npAePJ+3Ap2vPGqkTDfeWSrfyyTtNkvWG3IEcCBc1DE
         DVIh04/Zyw5aRM079GzHqJknppMRqkAFAiA3hfnHNpnDPp99JSqR3ic5ahDC6Stz7YvB
         T5WJe2063wGqlOatGniUCkn+aWw+ulzL2aqgJWE5SdB7YDYpvi8d8meqXmKTe5cgVeij
         Pptg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465725; x=1790070525; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xt/N1c2QTUTpESd5vWZaOt8vFR/C1nSv7TXwJ+U64JY=;
        b=Z/qi0fvbEBWxca18hMv+grd0uflQUqVc/4iBxgM4IOdnsZR5ceL+zlDjZtKgpMRk7D
         PjL0ZbSIWVPybveSpkrDIN5jCZRQS/wxgDceWJuGueCxs3/Q12V6IQ3KOSaKG3E3oMm5
         VTzG20g00mGIhl9QG+5aWR5y3+pVEftb9GIe0FMl2UGk16CPRK98ZO76ikJ8873fEXi3
         UuxJ2wSFJ/Tn2qYJt0CFwRcRZ79G2O3UPaZonzByqXUoFXH/xTjedN/PbYjxOCKm9eE6
         2MlFbnsPxjIo474vCKXX67T3x2z12cMO5fWViyIO78Ho9O58V0Okzwyskli4StnAScsY
         GpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465725; x=1790070525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xt/N1c2QTUTpESd5vWZaOt8vFR/C1nSv7TXwJ+U64JY=;
        b=UisICeuAyPk6gCKWLfGhWswf2mk/EEJIgLzttvcfV8vRNOE73u06nSZviATwIIU32v
         MzMq90DAgjE/GA9gvvChC6oqFFdU0uOvXeyLFCUJVRCpyHqVLd5pyj5UrSyIq7/QvgR1
         4zF16fpNIXCO2Dor+yL+kNrYpmyGoiT7l4qHUEluZdG5TZG/9ALa7TkzMTSyrVIkhoHs
         q6P0tydjcovArHZDcJ1LYATd+SUhnFn8x+zNi6yuF8mx9OZt/gVofn2SSpnB7CVB9fkq
         OvHdAi+rSeDEhPZC2bA9aJtMY/Bt5iYKp64Bi72Kq7AbYHBVk3Uqg8/D5wQm05lxaeBg
         U9hA==
X-Forwarded-Encrypted: i=1; AKwUvBxvFDlGBQ0hsayhcTyMyWfIu9rZomfHUCrarukB0snTOTy+UPXMWiKCY8037+FpHV7BLGrE9KDoq99aPw==@lists.infradead.org
X-Gm-Message-State: AFuF++mMcRPkKhak3g6gguILE+f8TWLxBk4LL833Gn8T/7ReQEi050Jt
	/3tW3QZHGYu4WQuVC1IrsRU2efLRzUczu/PL/keLjrBun8mZ9XTRwVHAsBBgUHLOyj4nYzd4v7D
	zGrYOddARgIV5tFPS9BXdLE2Isr+Sicw=
X-Gm-Gg: AYBFou33l227r0i2ia1qkY7PsIJK7VBgaND/ywKCP9Mool3ZCk9zGbG20wPNrB73ayG
	WwA/cy7b6AjYhUQRU1FCmLB3lnLC9TEtEZstgVDwJZIumCXe+0Aj2XVbw4l6//1e61iCOsJi3T/
	HquSUjW3JwGxsm+1HLz750DrGfNt4te7AQoN4r5FDBs8stvPCjMIkCd0RnXVTjeqzqwSt+yi9Ia
	SFKnifzX+sSByJnOJkg/wf/KZWEsFAstXBT8ZzUGHNLbR/mj/swYHUHQ8Sg3KJG7dtIacDJkOja
	cL24sByAMpNqcb84vdr0ghAjG7oF4mc4sI1WZg7IsNWgSahn/3YNZMIMag==
X-Received: by 2002:a05:690c:9990:b0:884:b55c:1bf with SMTP id
 00721157ae682-88d19927a33mr17511267b3.0.1789465725204; Tue, 15 Sep 2026
 02:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org> <20260907155300.1411173-1-alan.tseng.cs@gmail.com>
In-Reply-To: <20260907155300.1411173-1-alan.tseng.cs@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 15 Sep 2026 11:48:34 +0200
X-Gm-Features: AcwNN1UPWo8A8KL1cUnWKRSOKo7pDITqyT1rjkjcajM5WYeVYYuEMRIWcJfeozY
Message-ID: <CABdCQ=Mi3M8vGCYjURicNWy-Bh22qN199jOdHA5rEfTzui2b_A@mail.gmail.com>
Subject: Re: [PATCH 6/7] mmc: sdhci-of-k1: Improve RX tuning window
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: dlan@kernel.org, adrian.hunter@intel.com, ulfh@kernel.org, 
	long.wan@linux.spacemit.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_024847_110809_3D199E51 
X-CRM114-Status: GOOD (  15.39  )
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

RWwgbHVuLCA3IHNlcHQgMjAyNiBhIGxhcyAxODowMCwgSHVuZy1DaHVuIFRzZW5nCig8YWxhbi50
c2VuZy5jc0BnbWFpbC5jb20+KSBlc2NyaWJpw7M6Cj4gU28gYSB0aHJlc2hvbGQgb2YgNTAgaXMg
Y29tZm9ydGFibGUgaGVyZS4gSXQgYWxzbyBzdXBwb3J0cyB5b3VyCj4gcmF0aW9uYWxlIGRpcmVj
dGx5OiBib290IC0yIHByb2R1Y2VkIGEgNS1jb2RlIHdpbmRvdyBhbmQgYm9vdCAtMQo+IHByb2R1
Y2VkIGEgMS1jb2RlIHdpbmRvdyBvbiBtbWMxLCBzbyB0aGUgbmFycm93LXdpbmRvdyBjYXNlIHRo
aXMKPiBwYXRjaCBndWFyZHMgYWdhaW5zdCBkb2VzIG9jY3VyIGluIHByYWN0aWNlLgoKQSBqdW1w
IGZyb20gYSBtaW5pbXVtIHdpbmRvdyBzaXplIG9mIDMgdG8gNTAgZGVsYXkgY29kZXMgaXMgcXVp
dGUgZHJhbWF0aWMuCkNvdWxkIHlvdSBjbGFyaWZ5IGhvdyA1MCB3YXMgY2hvc2VuPyBJcyB0aGVy
ZSBhIHNwZWNpZmljIGhhcmR3YXJlIHNwZWNpZmljYXRpb24sCnBoeSBkYXRhc2hlZXQgcmVjb21t
ZW5kYXRpb24sIG9yIHRlc3QgZGF0YXNldCBhY3Jvc3MgbXVsdGlwbGUgYm9hcmRzIHRoYXQKanVz
dGlmaWVzIHRoaXMgZXhhY3QgbnVtYmVyPwoKPiBNeSBxdWVzdGlvbiBpcyBhYm91dCB0aGUgZm9y
bSByYXRoZXIgdGhhbiB0aGUgdmFsdWUuIFRoZSB2ZW5kb3IKPiBkcml2ZXIgdGFrZXMgdGhpcyBz
YW1lIGxpbWl0IGZyb20gRFQsIHBlciBob3N0Ogo+Cj4gICBzZGhAZDQyODAwMDA6IHNwYWNlbWl0
LHJ4X3R1bmluZ19saW1pdCA9IDwweDMyPjsgIC8qIDUwICovCj4gICBzZGhAZDQyODA4MDA6IHNw
YWNlbWl0LHJ4X3R1bmluZ19saW1pdCA9IDwweDMyPjsgIC8qIDUwICovCj4KPiBTbyA1MCBtYXRj
aGVzIHdoYXQgU3BhY2VtaVQgYWxyZWFkeSBzaGlwcyAtLSBidXQgdGhlcmUgaXQgaXMgYQo+IHBl
ci1jb250cm9sbGVyIERUIHByb3BlcnR5LCBhbmQgdGhpcyBwYXRjaCB0dXJucyBpdCBpbnRvIGEg
Z2xvYmFsCj4gY29tcGlsZS10aW1lIGNvbnN0YW50LiBXYXMgdGhhdCBkZWxpYmVyYXRlPyBUaGUg
dmVuZG9yIGRlc2lnbiBpbXBsaWVzCj4gdGhlIHZhbHVlIGlzIGV4cGVjdGVkIHRvIG5lZWQgcGVy
LWJvYXJkIGFkanVzdG1lbnQsIGFuZCB3aXRoIGEgRml4ZXM6Cj4gdGFnIHRoaXMgd2lsbCBsYW5k
IGluIHN0YWJsZSwgd2hlcmUgYSBib2FyZCB3aXRoIGEgbmFycm93ZXIgd2luZG93Cj4gd291bGQg
Z28gZnJvbSAiYWRqdXN0IHRoZSBEVCIgdG8gInBhdGNoIGFuZCByZWJ1aWxkIHRoZSBrZXJuZWwi
Lgo+Cj4gVHdvIG9wdGlvbnMsIGlmIHlvdSB0aGluayB0aGUgY29uY2VybiBpcyByZWFsOiBrZWVw
IGl0IGFzIGEgRFQKPiBwcm9wZXJ0eSAobWF0Y2hpbmcgdGhlIGV4aXN0aW5nIGJpbmRpbmcpLCBv
ciBrZWVwIHRoZSBjb25zdGFudCBhcyBhCj4gZGVmYXVsdCB0aGF0IERUIGNhbiBvdmVycmlkZS4K
CkkgYWdyZWUgd2l0aCBIdW5nLUNodW4ncyBwb2ludCByZWdhcmRpbmcgY29uZmlndXJhdGlvbi4g
SGFyZGNvZGluZyA1MCBhcyBhCmdsb2JhbCBkcml2ZXIgY29uc3RhbnQgYXNzdW1lcyBhbGwgYm9h
cmRzIGFuZCB0cmFjZSBsYXlvdXRzIHdpbGwgYmVoYXZlCmlkZW50aWNhbGx5IHVuZGVyIHRoZXJt
YWwvcG93ZXIgdmFyaWF0aW9ucy4gRGVmaW5pbmcgdGhpcyBsaW1pdCBpbiB0aGUgRGV2aWNlClRy
ZWUgKG9yIGFsbG93aW5nIERUIHRvIG92ZXJyaWRlIGEgc2Vuc2libGUgZmFsbGJhY2sgZGVmYXVs
dCkgd291bGQgcHJldmVudApib2FyZHMgd2l0aCBzbGlnaHRseSB0aWdodGVyIHRvbGVyYW5jZXMg
ZnJvbSBicmVha2luZyBvciByZXF1aXJpbmcga2VybmVsCnJlYnVpbGRzIHRvIGJvb3QuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
