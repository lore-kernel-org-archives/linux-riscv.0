Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A08E9A02C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Feb 2026 00:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExJB+BxCbPToulsOnvcBqzskf4wpn9DRjOQgk1Ey3HI=; b=k0H5X8vuIRmcEn
	AVC4DTHI147b/2tWIJqVIKSwauw7EStPPsJUoZQVzLcSev7nlaMcXygcqHREBBXD6rZK7MBsKbdrS
	o5Yzk0w8UfYGdiDFhQMf1FwrTIUTpSi2I/ZtHYi222oQUPI+eYkwMDk4Puo+Ko0pv01WokjxgLWaL
	F/qd41jzDwplCOYXxH8H0q6cuf0rpp5Xrx2K7TrY7KN8aS6V7Lj9jRJDLtjgD0b1oAuYbkinszuRI
	k2j5GlQ2A2U98033ehkLUwYSb6o/IWFZNN4cVGTeQw9QrFGprK0bRnv3UtTcLnTLsVquade+IMVcx
	CMUMyFJVOzQSUlXWxXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsVXD-000000095kX-0ubH;
	Wed, 18 Feb 2026 00:35:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsVXA-000000095k7-04H9
	for linux-riscv@lists.infradead.org;
	Wed, 18 Feb 2026 00:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771374914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2GFKu2pbS4lNbKn6Jz4fUhg2OnmZkDZP9P6vjWAZkDc=;
	b=Qkb265rxBzDOP4OGZNlzl/wdPwfxqkqWpII2D6emQKX+Yl+itLWQftLFRmmBRnjrfGy4ST
	DrTCPmodQPrgeJF3nJxqJlmKB4DW89Od5gfSU5PDpD5yYrDIcPcr1ktVYK7f8mFcPh8wna
	9sjaxzNVw3vct73EH604WA9T63VsH7I=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-BL6oO16zP_-xeMiYoPo1rg-1; Tue, 17 Feb 2026 19:35:13 -0500
X-MC-Unique: BL6oO16zP_-xeMiYoPo1rg-1
X-Mimecast-MFC-AGG-ID: BL6oO16zP_-xeMiYoPo1rg_1771374912
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5033b62efa7so387839681cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Feb 2026 16:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771374912; x=1771979712;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GFKu2pbS4lNbKn6Jz4fUhg2OnmZkDZP9P6vjWAZkDc=;
        b=Waj/JB6Lv9wSXImlK6XK7r2kFdbONvN0SybG7Zgg7F4EZDxEuDlj6QUP8NmBP0SYv3
         k2qB+0u7/5nbSX1AK/w2ByK5LgkZ7xViud0u5GLh7h93jDvQUGrpPBLRvBjn/LJlJc+t
         tIGEZzZ2zDxCSHvORW2FhmPY9kfRmIfZJnJAsEEMIxWE95RVIYxjvHbaO5CGF67KAiVJ
         +2lsNj5d0uekMzgXW83clyzT+XpHCc1mwDELUaiei68Fy5t0b2YBo+CIsX0xzlS8PiUS
         MfIMpsTYdaWT0okGNs2mvzVcZXZhpDYyJqudf0uFwjQNFTxqBouFyQyCjNIqwRFUYhAC
         JfOA==
X-Forwarded-Encrypted: i=1; AJvYcCWIqC+VxqFAyknLBtbnbZUiazWXjoe3to7qMsFuP/rPDqln624T8vOqfRNO/EwvHTzhkKqpIYsSZHuUpw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp3T3Od9LjdvifHyYoWrjxFfXHr9cOSTPFGJ2aL2Wih5ntB0Gu
	DKwQTZMvkshyzdn+0jYURPj8ghJ3v8EABM4enCTVHt0mTUhJ5MEt/e+aqY4yDO2F6WO2toFvLPt
	WiaTDgf4c+trydNRBu51g/jVVXxiIwxNroitkLa/ACrBuckLhIhASNQRzu1oAmHxP2cn2YbBdxP
	h+mA==
X-Gm-Gg: AZuq6aKOgH3Wf61MfjqVjZ182hJW/iElpLA2o15cQIb5hBEAWU8xGFXdNjrQXrWWvv4
	SsxSUq+sLfwsYy7ra4w5f9GmLst2+HjVONnv2rvb61D7SpRGATfL4WtlU5iHPdCRu2GZblJ9UjS
	DOuxw/GPRZ/pd4YxrsxiT136t+CqzVYr6muQi3pPlLpR2KHVYU8/j3GGguZ2Fd+hUrdGsz+ch7s
	AI+k4e0o2thY1qk3ysbOwZsdhXU9UZ2T2Aw9la82qYT1QjUT55DQOQtwK8J8lYw8gdhxKoJMFYq
	h2AgiahBjaUDQdNO8XqfrohdOjJTR5ATbaIBf5hZHqJHHKSGqYy2+J8KtczJLTm7fTgQ4Z8Fbq0
	aXcQwb7eXAMCO+PK+SVTti6r9gGlZbWPkJooKMXt0zqe/GzL2xIRnh8OT
X-Received: by 2002:a05:622a:1443:b0:502:9abb:c919 with SMTP id d75a77b69052e-506e9153b78mr3429681cf.10.1771374912624;
        Tue, 17 Feb 2026 16:35:12 -0800 (PST)
X-Received: by 2002:a05:622a:1443:b0:502:9abb:c919 with SMTP id d75a77b69052e-506e9153b78mr3429291cf.10.1771374912045;
        Tue, 17 Feb 2026 16:35:12 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8aff6sm174993256d6.27.2026.02.17.16.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 16:35:11 -0800 (PST)
Date: Tue, 17 Feb 2026 19:35:09 -0500
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH v6 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aZUJPb2jQIx2evWN@redhat.com>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-3-cb46d6a59c73@oss.tenstorrent.com>
 <aZST4Yywv09u65MP@redhat.com>
 <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
 <aZT4RsGnu1qlZl-l@redhat.com>
 <CAEev2e8hwN1FBR6yMr_NeZrFx3BXNz88RHfHLhSM=GrpExsUyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEev2e8hwN1FBR6yMr_NeZrFx3BXNz88RHfHLhSM=GrpExsUyw@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fwphDbrr-onyzfjKrz0tJlg56Sz4t4vBWjJBhrJyZFQ_1771374912
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_163516_132939_2E07A713 
X-CRM114-Status: GOOD (  23.09  )
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

T24gVHVlLCBGZWIgMTcsIDIwMjYgYXQgMDU6Mjk6NTZQTSAtMDYwMCwgQW5pcnVkaCBTcmluaXZh
c2FuIHdyb3RlOgo+IEhpIEJyaWFuLAo+IAo+IE9uIFR1ZSwgRmViIDE3LCAyMDI2IGF0IDU6MjLi
gK9QTSBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IFdlIGhhdmUgYSBncm91cCBvZiBnYXRlIGNsb2NrcyB0aGF0IGhhdmUgYSBzaW5nbGUgZW5hYmxl
IGJpdCBzaGFyZWQKPiA+ID4gYW1vbmcgdGhlbSAoaW5zdGVhZCBvZiBpbmRpdmlkdWFsIGVuYWJs
ZSBiaXRzIGZvciBlYWNoIGNsb2NrKS4gV2UgbmVlZAo+ID4gPiB0byBrZWVwIHRyYWNrIG9mIHRo
ZSBudW1iZXIgb2YgY2xvY2tzIHdpdGhpbiBhIGdyb3VwIHRoYXQgaGF2ZQo+ID4gPiByZXF1ZXN0
ZWQgYW4gZW5hYmxlLCBhbmQgb25seSB1bnNldCB0aGUgYml0IGlmIGFsbCB0aGUgY2xvY2tzIGFy
ZQo+ID4gPiBkaXNhYmxlZC4gc2hhcmVfY291bnQgaXMgdXNlZCB0byBrZWVwIHRyYWNrIG9mIHRo
aXMuIEl0IGdldHMgdXBkYXRlZAo+ID4gPiBieSBlYWNoIGNsb2NrLiBIZW5jZSBpdCdzIGEgcG9p
bnRlciAoYW5kIHRoZSBtdXRleGVzIGFyb3VuZCBhY2Nlc3MgdG8KPiA+ID4gaXQpLgo+ID4KPiA+
IFRoZSBjb2RlIGN1cnJlbnRseSBoYXM6Cj4gPgo+ID4gc3RydWN0IGF0bGFudGlzX2Nsa19nYXRl
X3NoYXJlZF9jb25maWcgewo+ID4gICAgICAgICAuLi4KPiA+ICAgICAgICAgdW5zaWduZWQgaW50
ICpzaGFyZV9jb3VudDsKPiA+IH0KPiA+Cj4gPiBUaGF0IHBvaW50ZXIgaXMgZGVyZWZlcmVuY2Vk
IGxpa2UgdGhpcyBpbiBzZXZlcmFsIHBsYWNlczoKPiA+Cj4gPiAgICAgbmVlZF9lbmFibGUgPSAo
KmdhdGUtPmNvbmZpZy5zaGFyZV9jb3VudCkrKyA9PSAwOwo+ID4KPiA+IEkgZG9uJ3Qgc2VlIHdo
eSB0aGUgcG9pbnRlciBpcyBuZWVkZWQuIENhbiB5b3UgZHJvcCB0aGUgcG9pbnRlcgo+ID4gYW5k
IHRoZSBkZXJlZmVyZW5jZSBsaWtlIHRoaXM/Cj4gPgo+ID4gc3RydWN0IGF0bGFudGlzX2Nsa19n
YXRlX3NoYXJlZF9jb25maWcgewo+ID4gICAgICAgICAuLi4KPiA+ICAgICAgICAgdW5zaWduZWQg
aW50IHNoYXJlX2NvdW50Owo+ID4gfQo+ID4KPiA+ICAgICBuZWVkX2VuYWJsZSA9IGdhdGUtPmNv
bmZpZy5zaGFyZV9jb3VudCsrID09IDA7Cj4gPgo+IAo+IEluIHRoaXMgY2FzZSwgd291bGRuJ3Qg
ZWFjaCBhdGxhbnRpc19jbGtfZ2F0ZV9zaGFyZWQgZW5kIHVwIGdldHRpbmcKPiBpdHMgb3duIGNv
cHkgb2Ygc2hhcmVfY291bnQ/IFdoaWNoIGlzIG5vdCB3aGF0IHdlIHdhbnQuIE9yIG1heWJlIEkn
bQo+IG5vdCBxdWl0ZSB1bmRlcnN0YW5kaW5nIHdoYXQgeW91J3JlIHNheWluZy4KPiAKPiBFdmVy
eSB0aW1lIHdlIGNyZWF0ZSBhIGdyb3VwIG9mIHRoZXNlIHNoYXJlZCBnYXRlIGNsa3MsIHdlIGNy
ZWF0ZSBhCj4gcmVmY250IHZhcmlhYmxlIGxpa2UgdGhpcyBhbmQgcGFzcyB0aGUgdmFyIHRvIGFs
bCBjbGtzIHRoYXQgc2hhcmUgaXQuCgpPSywgSSBzZWUgbm93LiBUaGFua3MgZm9yIHRoZSBleHBs
YW5hdGlvbi4KCkJyaWFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
