Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F89E9A03E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 23:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JpLKnieMHZA7AxRhLYOev2yWau8x84IKJIqvJ7ksws=; b=NWB0rwGUWaM+ky
	KAvNRX9ESRRVd353kf87kEqOx4C97DzoSiTq0FI20reQjHXwIMsy9FZ8dePHBRI80pVSkGyIp5hCb
	lMNTKjDT+ermd4WZvKau8P/8qR4m51FI9v0D+IzCzPWu00r7N2ZOU/dpVVSwCN0OfUvAkib6cR924
	ViRb374HLr9svAY+wleGNrBjj2yzoIEDjrq7C9H/Ub/inNlMFt6+IqnI07ahPijl3liWlrHcdJBqP
	2c4mu5lhiTfent7XioLce5l1akFC62d47yQwLXjVk6m9ARlCPm2Ke2nA46kziWydfQVtmHwvlnzzD
	3mSHc21/5b4qg37Rm4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsUWD-000000092nT-1Jb0;
	Tue, 17 Feb 2026 23:30:13 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsUW9-000000092n1-1HLG
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 23:30:11 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-64ae222d87dso4899958d50.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Feb 2026 15:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771371008; cv=none;
        d=google.com; s=arc-20240605;
        b=B18yBS+DK0JylvlZwlUReHOBlekhu4R1luNUmGOhal0gyiC7byhyjdhiWQzTlC71ag
         cEs+vbeoDBtra5qGZdo9oPULkxSTPsahD2FX9hjSTYqgOHORJd3/AdY7Ug/tzy6wS6g8
         DK3E3Lw+YSCFbJQBLrYhAYOJ42qwls74Jhl0EuZicxhz2ib5AzvJWbsxSN7+uGyfGqXD
         nyizGUf9bm4pTaBj7X+p01eC8MQyjhSBl0GO+jFvVhK1Gc7RmRSPOarVzcT4W4SdDpni
         7WMaTrV9bp4IdLbCMGfEJHkv2BCljr+LIybZxjHKIktAxhtdqkC9mkbnrVSWvPrjAlS4
         rb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RTnOou82ckQE54SQrVzimf0IaJoxyiz9fz7f1nWejVk=;
        fh=AP4v6C8sjFkghz6Zphy+erndOKhFV8KFr2YHzHTfezk=;
        b=EbLiLKBREAjZuYoFqBVmBZN5nrsDvheIVNNs4POURVC1yVdK0jLKLXRRorFoGX9rqb
         NyKDAiIdRSDOgLhx2sVqxi4JuOh4aQkSi1KayhiB6SVnS9C+dXQDsY14mvqgF/GrxfI1
         ubj/pzUJ5qHiOmDngJmDbL1EEzWGWf8V3ArlE9dVS4MmPXjazQE59ggObm3r00FEpOvd
         RNJVqPkrkUhD9ItfKvHyeu8ErgSJFynuc93uTLeYbWVmWXgyStpYr5fyuXlA4bC+YxzF
         N/E7gXkumy+CvKSM6xFmK0Pzs1A0xwq/BSChLuh4ePLP3snqr/3aCp1jhMa6uOlYUp4/
         G17Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771371008; x=1771975808; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTnOou82ckQE54SQrVzimf0IaJoxyiz9fz7f1nWejVk=;
        b=dK2x2bagbdpaGaew6uvhXxTeFYqK5YRdRCIloWAewZKnBJH4oLSnSrpJKDrDwKe0PM
         WdrCR9ukXPUzBhw4X9cscSOtObn2rziMjEsGoPeTvjH42N+ZZod5FeoYyEeczoRk/dsA
         TWV9s0vxsCKBmUnrJT8D45FI4aTEchST2+Fj1cWBwBLS8gxhGRrjzLT7v6coieTuDDo+
         3VkmJs7ZyIx5NJtDXb37nKotqgOdMSkVbN5VxoPAxAqFrWyur/qWz0SnhKkL+ubfH9eT
         jBrtJ4f6en/JNs4189vfidd6nNUvqO1gZPy1BTu41Wx3HkS3H2ROrkAQAF43aNLOx94o
         mrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771371008; x=1771975808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTnOou82ckQE54SQrVzimf0IaJoxyiz9fz7f1nWejVk=;
        b=uunpJhfaU8jFA13fX24NxH/d6RbywRMn4pKBW2zWiwiORaNX5nFUU4ivCQx2Gz1KWx
         NuKIjl2TYZ6M+ndE/zhJiHtbxEJ8aubZ1rH0un6L3aMMeydoHTugkNUZ7U8G9IxI45XJ
         B3A/vvgd4aMenz9SC7LpuJ6OT93JiU3eR/WuGyc9U4teMWoeUyiqDz5w6coV7GKOsW5X
         0p3il3zBEUfKk3S6IwCqlYUhhGn2WNHfCt5nLHB5F6bsfnE1sAcSZYy/IbvAqoEzCF3m
         BV1wr6GKtsrEvay/ZCmkqMKLKBqRolSBhu8bf2UK1dTir31W05nBcC1ZDrH7SlxN/7GP
         wIxw==
X-Forwarded-Encrypted: i=1; AJvYcCUQLw+okzOv8M3u/Sxkt17FydPIPWTd59r5XDdXueH5Fic9LJSIbBsnBLZa1conMjVyr7FY/bqPPZceVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwONpUwQMtrnDkZAjdDkcrdA+GT6iPVf44LdtWdIF0L8GSyc5tV
	tWMzmoMc0G7AvxKiujQRJr7XByykvRurcBUOhGfx4hU8Lp05fl07Jy1mCVEIwAwnnUyIfstms+G
	XgZp5cSztYfJF5ON/BC2n9Se43iHaqFiG4MLASioUPg==
X-Gm-Gg: AZuq6aL+wtTwUedSBMdOvaW5Kt1MBmroZzPSJ5yNNbNOGO0WFnMNffMZJntGd9TK/B5
	MUVSR8wKWy25J1MxtHnNIb2pDnruz3QCYcGAUZD/PnfJfd9IWivILBI0E3NdmQW5g/9P4IOYVAz
	ByGl8Ig7WrQssfY5MSjXveJ1zfQpQeQPEF9cLLkokKqmQpdaGA9Y5UEt5rnwmhvBnLN1yEpFmb4
	g5/hYW61BRe/1/hcdWqeY1AfZIRlJ+XkLJDwEaFFyjwZ/ayKFjY6FMznQriPNIw3sFdcNH8UN90
	+bXW2TNdLRVBbj7CKgIq52CTrZDozGFNI0ndrTlAcQYtfczOYslE80tc6HcOXshY6NL6sfgs
X-Received: by 2002:a05:690e:400a:b0:64a:e543:cabd with SMTP id
 956f58d0204a3-64c556c9ad7mr114487d50.70.1771371007641; Tue, 17 Feb 2026
 15:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-3-cb46d6a59c73@oss.tenstorrent.com>
 <aZST4Yywv09u65MP@redhat.com> <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
 <aZT4RsGnu1qlZl-l@redhat.com>
In-Reply-To: <aZT4RsGnu1qlZl-l@redhat.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 17 Feb 2026 17:29:56 -0600
X-Gm-Features: AaiRm52TAk-yyamOoXmwj8fFo7BsCbo2w-ZlTEB2IeiGt4tNj-r_C0lIrKQFA3c
Message-ID: <CAEev2e8hwN1FBR6yMr_NeZrFx3BXNz88RHfHLhSM=GrpExsUyw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] clk: tenstorrent: Add Atlantis clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_153009_352891_709550B3 
X-CRM114-Status: GOOD (  15.97  )
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

SGkgQnJpYW4sCgpPbiBUdWUsIEZlYiAxNywgMjAyNiBhdCA1OjIy4oCvUE0gQnJpYW4gTWFzbmV5
IDxibWFzbmV5QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IFdlIGhhdmUgYSBncm91cCBvZiBn
YXRlIGNsb2NrcyB0aGF0IGhhdmUgYSBzaW5nbGUgZW5hYmxlIGJpdCBzaGFyZWQKPiA+IGFtb25n
IHRoZW0gKGluc3RlYWQgb2YgaW5kaXZpZHVhbCBlbmFibGUgYml0cyBmb3IgZWFjaCBjbG9jayku
IFdlIG5lZWQKPiA+IHRvIGtlZXAgdHJhY2sgb2YgdGhlIG51bWJlciBvZiBjbG9ja3Mgd2l0aGlu
IGEgZ3JvdXAgdGhhdCBoYXZlCj4gPiByZXF1ZXN0ZWQgYW4gZW5hYmxlLCBhbmQgb25seSB1bnNl
dCB0aGUgYml0IGlmIGFsbCB0aGUgY2xvY2tzIGFyZQo+ID4gZGlzYWJsZWQuIHNoYXJlX2NvdW50
IGlzIHVzZWQgdG8ga2VlcCB0cmFjayBvZiB0aGlzLiBJdCBnZXRzIHVwZGF0ZWQKPiA+IGJ5IGVh
Y2ggY2xvY2suIEhlbmNlIGl0J3MgYSBwb2ludGVyIChhbmQgdGhlIG11dGV4ZXMgYXJvdW5kIGFj
Y2VzcyB0bwo+ID4gaXQpLgo+Cj4gVGhlIGNvZGUgY3VycmVudGx5IGhhczoKPgo+IHN0cnVjdCBh
dGxhbnRpc19jbGtfZ2F0ZV9zaGFyZWRfY29uZmlnIHsKPiAgICAgICAgIC4uLgo+ICAgICAgICAg
dW5zaWduZWQgaW50ICpzaGFyZV9jb3VudDsKPiB9Cj4KPiBUaGF0IHBvaW50ZXIgaXMgZGVyZWZl
cmVuY2VkIGxpa2UgdGhpcyBpbiBzZXZlcmFsIHBsYWNlczoKPgo+ICAgICBuZWVkX2VuYWJsZSA9
ICgqZ2F0ZS0+Y29uZmlnLnNoYXJlX2NvdW50KSsrID09IDA7Cj4KPiBJIGRvbid0IHNlZSB3aHkg
dGhlIHBvaW50ZXIgaXMgbmVlZGVkLiBDYW4geW91IGRyb3AgdGhlIHBvaW50ZXIKPiBhbmQgdGhl
IGRlcmVmZXJlbmNlIGxpa2UgdGhpcz8KPgo+IHN0cnVjdCBhdGxhbnRpc19jbGtfZ2F0ZV9zaGFy
ZWRfY29uZmlnIHsKPiAgICAgICAgIC4uLgo+ICAgICAgICAgdW5zaWduZWQgaW50IHNoYXJlX2Nv
dW50Owo+IH0KPgo+ICAgICBuZWVkX2VuYWJsZSA9IGdhdGUtPmNvbmZpZy5zaGFyZV9jb3VudCsr
ID09IDA7Cj4KCkluIHRoaXMgY2FzZSwgd291bGRuJ3QgZWFjaCBhdGxhbnRpc19jbGtfZ2F0ZV9z
aGFyZWQgZW5kIHVwIGdldHRpbmcKaXRzIG93biBjb3B5IG9mIHNoYXJlX2NvdW50PyBXaGljaCBp
cyBub3Qgd2hhdCB3ZSB3YW50LiBPciBtYXliZSBJJ20Kbm90IHF1aXRlIHVuZGVyc3RhbmRpbmcg
d2hhdCB5b3UncmUgc2F5aW5nLgoKRXZlcnkgdGltZSB3ZSBjcmVhdGUgYSBncm91cCBvZiB0aGVz
ZSBzaGFyZWQgZ2F0ZSBjbGtzLCB3ZSBjcmVhdGUgYQpyZWZjbnQgdmFyaWFibGUgbGlrZSB0aGlz
IGFuZCBwYXNzIHRoZSB2YXIgdG8gYWxsIGNsa3MgdGhhdCBzaGFyZSBpdC4KCnN0YXRpYyB1bnNp
Z25lZCBpbnQgcmVmY250X3FzcGk7CkFUTEFOVElTX0dBVEVfU0hBUkVEX0RFRklORShDTEtfUVNQ
SV9TQ0xLLCBxc3BpX3NjbGssIG5vY2NfY2xrX211eCwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTFNJT19CTEtfQ0dfUkVHLCBCSVQoMCksICZyZWZjbnRfcXNwaSwgMCk7CkFUTEFOVElTX0dB
VEVfU0hBUkVEX0RFRklORShDTEtfUVNQSV9IQ0xLLCBxc3BpX2hjbGssIG5vY2NfZGl2Ml9jbGss
CiAgICAgICAgICAgICAgICAgICAgICAgICAgIExTSU9fQkxLX0NHX1JFRywgQklUKDApLCAmcmVm
Y250X3FzcGksIDApOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
