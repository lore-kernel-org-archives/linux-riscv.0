Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F2BE9A03B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 23:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goJ0oWj4GzD7Wlp9m1XejpsqMp5M0Uakq+AMvzTCzLQ=; b=2hRddvM4jk/gTk
	bDLVQTvWVBy7StUlxqGQJQESE5UV6spn/U3dAWCVejm7cfe/D5t3F6PyvNP6lWNgUL5CfPun86Olu
	EYSc6bY28FKjies2Hhh38dwxNMtaPuH9XOuMxpVLvFezNP8nYhv61Ti3nZ+gfpxwhp1qGGBDXWvVD
	D3JEFUzmePiDoyWa5e8KPbWOw2CWrJY4/O0JmwubJCE12ez5tmRJKoQeJ6eeqEXPSNHoHaMgmSlf7
	TfE6hQ3XTUJ8b+z3Ja+Gro04H9bqALlneAFwwT1Ry+zvBm4iCrTBmnNGuEQg9a6cky4hqImibjeq1
	QAQYiQRVe6pOD8EEtNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsUPB-000000092Q4-1e52;
	Tue, 17 Feb 2026 23:22:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsUP8-000000092PK-29Ae
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 23:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771370572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pu6xIl0G77mqVnN/koO35p0gUExl94drv061er+Ef0k=;
	b=ecwZpaI5Mm4TTYGeG+jmn90YidJVoJDKooacmRpKn9/On0VAFIG9nY/uGWAbCShEzk2621
	FVoLZtb4Qb6MmJFLHFIwxu+3TdfHxNQho6McQW6f5Sc2wmPjUSGG1FZdftcPwaGXSGDEg3
	gQhfmHFz8Ycb1w1SGgeLGWqKNjzZCN4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-k2kg9fM-OMmpANfMCLTQgg-1; Tue, 17 Feb 2026 18:22:51 -0500
X-MC-Unique: k2kg9fM-OMmpANfMCLTQgg-1
X-Mimecast-MFC-AGG-ID: k2kg9fM-OMmpANfMCLTQgg_1771370570
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4e37a796so2438665985a.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Feb 2026 15:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771370570; x=1771975370;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pu6xIl0G77mqVnN/koO35p0gUExl94drv061er+Ef0k=;
        b=vzvx5E6YLdBhGLgr33ZZcwBVT+OP+lX92OIPTzbJ3sCz7GhZieOGPpS5Ot5pWSSZs3
         PDLlGwq9NUFUyNvjCmWG7uv8jkgMl/546bp3z2rQeO8IxsOq2AhljrRFVcWfGuW163hb
         /X7sYyAkEck3viX9tqY2PoE40rosdppmxmfKuF24U66MU1XGA0b7fgO9m9SmodQSI66s
         VX7i+CjRf4LBUpmLzcY+Vei3Ssqw0Sqq9/dR9LLy95k4OybGIv7U4+5Lz3TVFkuAHl9y
         UKOX84aJjzLqcv719Jm8B5XVl+XS8JKRyK5K0MvB1Jd+IK3xoNyhW56YaCfjTpqrfqaO
         +PCg==
X-Forwarded-Encrypted: i=1; AJvYcCVepoKnMzqD19KHDpGb8UBCZ+vKZrLInyq+v3jXup1pqvgER05yT2InGui4u32eMndtWHWItQa1G1Hhcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YztlyH5HRh3KidEYQUu0rgA4jYLus1b3rexDVkwMurHbUEEOvZq
	5Q7KQdkX5KpsAjCXCoGxRcAGQ09nrBDOMP9kqNothlEQCB8wG1Ort4y9byc6wIiWdppAf4qkllr
	MGVpasD+AyVUE7OwQuDpW3+VcotyI81H5L5M0+EEao52Yi9HiJ4XpUiyu45TwX3kQGFcrtQ==
X-Gm-Gg: AZuq6aL1ES4SCj47oHmdO3equ0CUnLC/2NGcjuY/7RcFReSqEqwmkOhg+IbVvaLtiIS
	2knnM8lRJ7M8vzD+3w06Xej2jeZ4UCGqjpCLP0keLMcFYpkUXCi3Jk+xige5h5UEBPJ/cxk94mG
	xphVRUOFjX69CvC6huSD/Uvmc5UkiYbElIUHIs2chlaqmEaGAoJv5a+vXk8Bq+Ft9moX8uF2q5z
	PJlMMgjVeyV3JvKChMh8nUQPaU+9hKJEjEIxLyLPg7fI7H/0duVrHjkYBGWwgOIPSFIsW6BqZIJ
	eLoLqEBoWvNIFh8jC7rIepmq8egKC3EN1LkMos8vG8DwOzDhgpslncQkFIet7SUVVl0Ta2EylaN
	6zMH3EBipUhq0vYbdCry0
X-Received: by 2002:a05:620a:450f:b0:8c6:ae78:f750 with SMTP id af79cd13be357-8cb74029a2dmr17236985a.14.1771370570414;
        Tue, 17 Feb 2026 15:22:50 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8c6:ae78:f750 with SMTP id af79cd13be357-8cb74029a2dmr17232885a.14.1771370569874;
        Tue, 17 Feb 2026 15:22:49 -0800 (PST)
Received: from redhat.com ([2600:382:8113:e835:467d:eb0a:6604:e0dc])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cdd1541sm178290736d6.49.2026.02.17.15.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 15:22:49 -0800 (PST)
Date: Tue, 17 Feb 2026 18:22:46 -0500
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
Message-ID: <aZT4RsGnu1qlZl-l@redhat.com>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-3-cb46d6a59c73@oss.tenstorrent.com>
 <aZST4Yywv09u65MP@redhat.com>
 <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEev2e_XjxD3kHbOxVYwbf0Q0cwEr96dSQ3hWZE9eLdgeXhs4g@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0p0kgW-ZSNIqAei_bhvUARfisA7zNoI6-lRrITcw4qk_1771370570
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_152254_648243_0DBADB7F 
X-CRM114-Status: GOOD (  27.17  )
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

SGkgQW5pcnVkaCwKCk9uIFR1ZSwgRmViIDE3LCAyMDI2IGF0IDA1OjEyOjM4UE0gLTA2MDAsIEFu
aXJ1ZGggU3Jpbml2YXNhbiB3cm90ZToKPiBPbiBUdWUsIEZlYiAxNywgMjAyNiBhdCAxMDoxNOKA
r0FNIEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPiB3cm90ZToKPiA+IE9uIE1vbiwg
RmViIDE2LCAyMDI2IGF0IDA0OjE2OjM0UE0gLTA2MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90
ZToKPiA+ID4gQWRkIGRyaXZlciBmb3IgY2xvY2sgY29udHJvbGxlciBpbiBUZW5zdG9ycmVudCBB
dGxhbnRpcyBTb0MuIFRoaXMgdmVyc2lvbgo+ID4gPiBvZiB0aGUgZHJpdmVyIGNvdmVzIGNsb2Nr
cyBmcm9tIFJDUFUgc3lzY29uLgo+ID4KPiA+IC4uLmNvdmVycyBjbG9ja3MuLgo+IAo+IFRoYW5r
IHlvdSBmb3IgeW91ciBjb21tZW50cy4gSSB3aWxsIGFkZHJlc3MgdGhlIHR5cG9zIGFuZCBhZGQg
dGhlCj4gc3RhdGljIG1vZGlmaWVyIGZvciB0aGUgZGlmZmVyZW50IHZhcmlhYmxlcyB0aGF0IHlv
dSBzdWdnZXN0ZWQuCj4gCj4gPiA+ICsKPiA+ID4gK3N0cnVjdCBhdGxhbnRpc19jbGtfZ2F0ZV9z
aGFyZWRfY29uZmlnIHsKPiA+ID4gKyAgICAgdTMyIHJlZ19vZmZzZXQ7Cj4gPiA+ICsgICAgIHUz
MiBlbmFibGU7Cj4gPiA+ICsgICAgIHVuc2lnbmVkIGludCAqc2hhcmVfY291bnQ7Cj4gPgo+ID4g
V2h5IGlzIHRoaXMgYSBwb2ludGVyPyBDb3VsZCB0aGlzIGp1c3QgYmUgYSBwbGFpbiB1bnNpZ25l
ZCBpbnQgc2luY2UKPiA+IGFsbCBvY2N1cnJlbmNlcyBvZiB0aGlzIGFyZSBkZXJlZmVyZW5jZWQ/
Cj4gCj4gV2UgaGF2ZSBhIGdyb3VwIG9mIGdhdGUgY2xvY2tzIHRoYXQgaGF2ZSBhIHNpbmdsZSBl
bmFibGUgYml0IHNoYXJlZAo+IGFtb25nIHRoZW0gKGluc3RlYWQgb2YgaW5kaXZpZHVhbCBlbmFi
bGUgYml0cyBmb3IgZWFjaCBjbG9jaykuIFdlIG5lZWQKPiB0byBrZWVwIHRyYWNrIG9mIHRoZSBu
dW1iZXIgb2YgY2xvY2tzIHdpdGhpbiBhIGdyb3VwIHRoYXQgaGF2ZQo+IHJlcXVlc3RlZCBhbiBl
bmFibGUsIGFuZCBvbmx5IHVuc2V0IHRoZSBiaXQgaWYgYWxsIHRoZSBjbG9ja3MgYXJlCj4gZGlz
YWJsZWQuIHNoYXJlX2NvdW50IGlzIHVzZWQgdG8ga2VlcCB0cmFjayBvZiB0aGlzLiBJdCBnZXRz
IHVwZGF0ZWQKPiBieSBlYWNoIGNsb2NrLiBIZW5jZSBpdCdzIGEgcG9pbnRlciAoYW5kIHRoZSBt
dXRleGVzIGFyb3VuZCBhY2Nlc3MgdG8KPiBpdCkuCgpUaGUgY29kZSBjdXJyZW50bHkgaGFzOgoK
c3RydWN0IGF0bGFudGlzX2Nsa19nYXRlX3NoYXJlZF9jb25maWcgewoJLi4uCgl1bnNpZ25lZCBp
bnQgKnNoYXJlX2NvdW50Owp9CgpUaGF0IHBvaW50ZXIgaXMgZGVyZWZlcmVuY2VkIGxpa2UgdGhp
cyBpbiBzZXZlcmFsIHBsYWNlczoKCiAgICBuZWVkX2VuYWJsZSA9ICgqZ2F0ZS0+Y29uZmlnLnNo
YXJlX2NvdW50KSsrID09IDA7CgpJIGRvbid0IHNlZSB3aHkgdGhlIHBvaW50ZXIgaXMgbmVlZGVk
LiBDYW4geW91IGRyb3AgdGhlIHBvaW50ZXIKYW5kIHRoZSBkZXJlZmVyZW5jZSBsaWtlIHRoaXM/
CgpzdHJ1Y3QgYXRsYW50aXNfY2xrX2dhdGVfc2hhcmVkX2NvbmZpZyB7CgkuLi4KCXVuc2lnbmVk
IGludCBzaGFyZV9jb3VudDsKfQoKICAgIG5lZWRfZW5hYmxlID0gZ2F0ZS0+Y29uZmlnLnNoYXJl
X2NvdW50KysgPT0gMDsKClsgc25pcCBdCgo+ID4gSG93ZXZlciwgYmlnZ2VyIHF1ZXN0aW9uIGlz
IGlmIHRoaXMgbWVzc2FnZSBzaG91bGQgYmUgZHJvcHBlZCBlbnRpcmVseT8gSWYKPiA+IHRoaXMg
Y29uZGl0aW9uIG9jY3VycywgYW4gZXJyb3IgaXMgbG9nZ2VkIGhlcmUsIGFuZCBhIHNlY29uZCBt
ZXNzYWdlIHdpbGwgYmUKPiA+IGxvZ2dlZCBpbiBhdGxhbnRpc19wcmNtX3Byb2JlKCkgYmVsb3cu
Cj4gPgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gKyAgICAg
ICAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICBjbGtfZGF0YS0+aHdzW2NvbW1v
bi0+Y2xraWRdID0gaHc7Cj4gPiA+ICsgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICBjbGtfZGF0
YS0+bnVtID0gbnVtX2Nsa3M7Cj4gPiA+ICsKPiA+ID4gKyAgICAgcmV0ID0gZGV2bV9vZl9jbGtf
YWRkX2h3X3Byb3ZpZGVyKGRldiwgb2ZfY2xrX2h3X29uZWNlbGxfZ2V0LCBjbGtfZGF0YSk7Cj4g
PiA+ICsgICAgIGlmIChyZXQpCj4gPiA+ICsgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWls
ZWQgdG8gYWRkIGNsb2NrIGhhcmR3YXJlIHByb3ZpZGVyICglZClcbiIsCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICByZXQpOwo+ID4KPiA+IFNob3VsZCB0aGlzIG1lc3NhZ2UgYWxzbyBiZSBk
cm9wcGVkIGFzIHdlbGw/Cj4gCj4gU28geW91J3JlIHN1Z2dlc3RpbmcgdGhhdCB3ZSBqdXN0IHBy
aW50IGEgc2luZ2xlIGVycm9yIG1lc3NhZ2UgaW5zdGVhZAo+IG9mIG11bHRpcGxlLiBJIGNhbiBj
aGFuZ2UgaXQgdG8gYmUgbGlrZSB0aGF0LgoKWWVzLCBhbmQgc291bmRzIGdvb2QhCgpCcmlhbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
