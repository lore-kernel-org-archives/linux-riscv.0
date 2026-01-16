Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739C4C98305
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 21:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5tBs2bhrF4yRrorKc2O7QJAjnsVLcCKy/sbwWuEhMw=; b=4dN92GHRTYS1JU
	nOlQJr9xi6Ciq23pJY8Nt53k6YXMBc2H1am2Rnm210SrRe2jH9794BaT2tt0rdJ0Cn3+EViKopG+X
	GhkYNaSvsp/g/fJl1Oit0VmZlEJ8uZRvdCDn6cOXDIkfQCirM92oyySa6kRDqhY7BTkEqFLbBLPuD
	cldpKb1ia6YHQQ71hQmeQwfQ5kdSMKfumrMONX7JnxTO2aHsEHND8MAMUgEJht2m1aN+BQ8BPh/rW
	W/fI1ZZ52Fp7P4EosYp4gLTZYkTNEfiCQvC52LiDID5PEp1185iUUxRKEivI4OrfIrPb7Y2emdL9E
	Uc95gyTnGToA7C+RtOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrgX-0000000Ewji-2CQG;
	Fri, 16 Jan 2026 21:48:49 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrgV-0000000EwjH-0NPo
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 21:48:48 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6446fcddf2fso2324014d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 13:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768600126; x=1769204926; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mY05kIgIMl2dh4w/PgKOxyQ2I8chWiVdB03iWdA4Tog=;
        b=GA8FOqeZXhVvz2Rr0fuu+xsxOgHZ1g36Mi6UvziejesBhwZBb3YFZhIF3Vi0yKagmn
         5G1vQnX6QoCoQLbNH7dUPCF9IsxSdQnMs+zeVL0jkwsmzD3KfyxiS6bTAt0+yYL4LiIv
         vjlcTA0umU+roz0xzGLDoxMNE+Suo10ham6R1HyEzrReaBmNO8xUrVT8ISOaHn21edLu
         H6W6GiIgAcQbN2GUMrXdf5dLrtJyomdMFYAUMCIS8EqUuquTxRs6IrCky2SwVKJ4xxBD
         f832RKZ80wZycLWGGC7x5Fr5u6EH3jjGDO3kWICoNSYmOXymvL/S0jJ02490bI+6ugzB
         bOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768600126; x=1769204926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mY05kIgIMl2dh4w/PgKOxyQ2I8chWiVdB03iWdA4Tog=;
        b=N4iNS6OEIK2gIssM4MpBHMM0Zy1Zc1PlvYxVhoRExUfvLZusxMFpn1Ll8foKFuxrat
         hvKJ2z5bKem1COjkde03Zo9ZLkGoSL73R8NSZCSLUOO7pq78lUXqdyTIv9I0RaMqI8Mv
         uA4kJgr4NJ+2s/3mCoSTGp4EHwbiSiizZoQBUntc6Oiysh6lrTAu3qH7efxs+mqpfIbI
         kLtXTFrxA99HuKwiaj3x9+mga7e2KYu2IMGDxBJlwJnse+dKRYFWOvs/oehJQcGWKKg1
         T5Qd34JeRPDh82d+Aj/bAPk8jOFIfkB3OqNg5S1G08fiVyHvRD33SgEpAW3ypa6lxN4Z
         m2QA==
X-Forwarded-Encrypted: i=1; AJvYcCUh9WSLM1Pk0tqlzxuSfn6mlOG2nvx4bvFSnWAlaSXZpFaxu3SBSokLSuxHF2aA27KEgk+doRVN8Sx6gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+0RRRMG5G2932h4AhdQWqmkBIg3ki+lJrs8GKorbWT3L6fxJI
	bZ6zxjr5QJR1P6gb4Ts/X6bMnS3W7gWFLcGbMcg9JMXYwRvSMBbjKpun4eb1ryEXvhnFaQTrVdS
	pyr029SWP0wQI9zetumHufaIliCvV/oM8tRoi+dXgCw==
X-Gm-Gg: AY/fxX4yV30cXujP9JxhURzRviIzNLQfzlDz8XWT8bS35rjez7WNHa+8AqED4ejWmbJ
	uYmfwJpySmvxEmAtafx1GZ4xiNFZ+vU84XbEXhHo7qyCqNBlPC6/8UeOh1qGPSVUG/LC/gTHiO9
	t2jmH/B3EPql4uLeE1ivbEV7un8x4DaaVqpwkUoopRhbfhB4OGKspYMkkKWIh3z8slVdqTq3DW3
	wlHuNAZRXXeBFGXxlna1dJoRPFDYN6p4gtD0l22U2m+RczTX+bM0emFrwS5fPCtLfwmv9IcZUT2
	MeTSVFCp6rEFWCPZgSVTZTG+ybseOUymoqsUJ6g4DVu0y/i/2Dl9dlT9c6i+
X-Received: by 2002:a05:690e:4191:b0:63f:ab00:1a07 with SMTP id
 956f58d0204a3-649164f2191mr3364006d50.49.1768600125896; Fri, 16 Jan 2026
 13:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com> <20260116040329.GA1375823-robh@kernel.org>
In-Reply-To: <20260116040329.GA1375823-robh@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:48:34 -0600
X-Gm-Features: AZwV_QioGa-4X2KzI3YnQR765ca18KetbCGwv9R3-erpeNxDeN2zkJbwLVpqjgI
Message-ID: <CAEev2e8dRFD4FVyoNs6Eo-Qrvp4oKAQ96YTOyN5HUWVKVDUjuA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
To: Rob Herring <robh@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_134847_133836_5A1C0CE0 
X-CRM114-Status: GOOD (  15.49  )
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

SGkgUm9iLAoKT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgMTA6MDPigK9QTSBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKClNlZW1zIGxpa2UgdGhlcmUgd2FzIGEgc21hbGwgdHlw
byBpbiB0aGUgZXhhbXBsZSAoc3ljb24gaW5zdGVhZCBvZgpzeXNjb24pIGFuZCB5b3VyIGJvdCBj
YXVnaHQgdGhhdC4gSSdsbCBmaXggdGhhdC4KCj4gPiAgLi4uL3RlbnN0b3JyZW50L3RlbnN0b3Jy
ZW50LGF0bGFudGlzLXN5c2Nvbi55YW1sICAgfCA1OCArKysrKysrKysrKysrKysrKysrCj4KPiBG
aWxlbmFtZSBzaG91bGQgbWF0Y2ggY29tcGF0aWJsZS4KPgo+IElmICJSQ1BVIiBpcyB3aGF0IHRo
ZSBoL3cgYmxvY2sgaXMgY2FsbGVkIGFuZCBzdWZmaWNpZW50IHRvIGlkZW50aWZ5IGl0LAo+IHRo
ZW4gZHJvcCB0aGUgInN5c2Nvbi0iIHBhcnQuCgpUaGlzIGh3IGJsb2NrIGhhcyBjb250cm9sIHJl
Z2lzdGVycyBmb3IgY2xvY2sgYW5kIHJlc2V0IGZvciB0aGUgU29DLgpUaGlzIGJsb2NrIGlzIGlu
c3RhbnRpYXRlZCBtdWx0aXBsZSB0aW1lcywgd2l0aCBlYWNoIGluc3RhbnRpYXRpb24KY29udHJv
bGxpbmcgY2xvY2tzL3Jlc2V0cyBmcm9tIGEgZGlmZmVyZW50IHN1YnN5c3RlbS4gSSBvcmlnaW5h
bGx5CnBsYW5uZWQgdG8gYWRkIHRoZXNlIGxhdGVyIG9uLCBzbyB5b3UnZCBoYXZlIDQgZGlmZmVy
ZW50IGNvbXBhdGlibGVzCmxpa2UgInRlbnN0b3JyZW50LGF0bGFudGlzLXN5c2Nvbi17cmNwdSxo
c2lvLHBjaWUsbW19Ii4KCkluc3RlYWQsIEkgZ3Vlc3MgSSBzaG91bGQgYWRkIGFsbCA0IGluIHJp
Z2h0IG5vdyAodGhlIGNsb2NrIGRyaXZlcgpwYXRjaGVzIGRvbid0IHN1cHBvcnQgYWxsIGN1cnJl
bnRseSkuCgpJcyB0aGUgY3VycmVudCBmaWxlIG5hbWUgb2theSBmb3IgdGhhdAoodGVuc3RvcnJl
bnQsYXRsYW50aXMtc3lzY29uLmgpPyBJIGJhc2VkIHRoaXMgb2ZmIHRoZSBzcGFjZW1pdC1rMQpj
bG9jay9yZXNldCBjb250cm9sbGVyIFsxXSwgc28gaXQgd291bGQgbG9vayB2ZXJ5IHNpbWlsYXIg
dG8gdGhhdC4KCj4gPiArICAiI2Nsb2NrLWNlbGxzIjoKPiA+ICsgICAgY29uc3Q6IDEKPiA+ICsg
ICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgU2VlIDxkdC1iaW5kaW5ncy9jbG9jay90ZW5zdG9y
cmVudCxhdGxhbnRpcy1zeXNjb24uaD4gZm9yIHZhbGlkIGluZGljZXMuCj4KPiBCZSBjb25zaXN0
ZW50IHdpdGggdGhlIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgZmlsZSBuYW1lLgoKSSB3aWxs
IHNxdWFzaCBkb3duIHRoZSBkdC1iaW5kaW5ncyBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGludG8g
b25lCnRoYXQgYWRkcyBib3RoIHRoZSBjbG9jay1jZWxscyBhbmQgcmVzZXQtY2VsbHMgdG8gdGhp
cyBlbnRyeS4gRm9yIHRoZQpjbG9jay9yZXNldCBpbmRpY2VzLCBzaG91bGQgSSBqdXN0IHVzZSBh
IHNpbmdsZSBmaWxlIChzYXkKZHQtYmluZGluZ3Mvc29jL3RlbnN0b3JyZW50LGF0bGFudGlzLXN5
c2Nvbi5oKSBvciBzZXBhcmF0ZSBmaWxlcyBmb3IKY2xvY2sgYW5kIHJlc2V0PwoKPiA+ICsgICAg
Y2xvY2tzIHsKPiA+ICsgICAgICBvc2NfMjRtOiBjbG9jay0yNG0gewo+ID4gKyAgICAgICAgY29t
cGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4gPiArICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8
MjQwMDAwMDA+Owo+ID4gKyAgICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gIm9zY18yNG0iOwo+
ID4gKyAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+ID4gKyAgICAgIH07Cj4gPiArICAgIH07
Cj4KPiBEcm9wIHRoaXMgbm9kZS4gTm90IHJlbGV2YW50IHRvIHRoZSBleGFtcGxlLgoKVW5kZXJz
dG9vZAoKWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE4LjIvc291cmNl
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mvc3BhY2VtaXQvc3BhY2VtaXQs
azEtc3lzY29uLnlhbWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
