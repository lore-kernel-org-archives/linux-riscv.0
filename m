Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D94DC4829D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+Dbye+rlfL21/pJK2lsbxNc9VUrP9KaEPTUVog8J8M=; b=ky8M368dygkav0
	LBWCSJEgWXsFg0+m43j+v9DK9bu654hEujdu2k+l1HXK+nI+H+VH1kSzyGpa7tj2QmsDONsvj6Jzz
	8iMqFBOVsEu2OV1MrzXz0HJvPs9Szsbj99bDYy5Cji18FEiOPzeF39h3Di4pgF1Yl6BHIE40GhnvH
	ka3EA8ImfsKlPw2XlR3U34tOkVXnsXhoPHJZ/E/lxJoYVN5UhPeNQk1H/GkSVcOtvtxBJX1UEuWus
	0WbfIrXGdu1Sn++blFuPhR6c1pbnYC6fIuVfFComKM0zq3iUXPqPc1Yf2KzRzx7H91iZyuA2ockqN
	/FUBCHKgIX6KFBi5+8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIjB-000000073Er-09rO;
	Tue, 06 Feb 2024 10:30:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHhR-00000006h82-1WOo
	for linux-riscv@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R8r9psvandqJ07ZF90QtVTVKq/Y9rSgNYXnuqiW3t60=; b=BpgzpURs5d2iqbF1IfhSn1QhPC
	darkgfuUA3tcbGuIzKJiKvEnmN0aPChbinY/TFzVLRN+JhRiMMUSR4wC46CBq+kvm4I+5DeQk6xAh
	E0xcaiiwwPeFF/pr8IIDtRShBJ1KXIMSPRSWu1Qr/FjO86xpWaNT3UQs/ceKYv8PHVhBPrysvAc3x
	ehiRpdoeVm6AoZhEN44cwwgUag0y5UI9PrWZRmXSkG4dVxJu0PWg6/Md1bSQmfiBjHKgL3Lr22mWb
	bJaX/fsYC/MqrmibLBCLt/ZpFYpEUjE4hkZdSQnoDNittHQPqP0UmYnRKvU0V4GFe+oz3OGShm+5I
	kmRBZYXQ==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHhM-0000000CRJr-29gd
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 09:25:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d3ae9d1109so10960005ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Feb 2024 01:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707211498; x=1707816298; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R8r9psvandqJ07ZF90QtVTVKq/Y9rSgNYXnuqiW3t60=;
        b=Q2qtzKANcSbYLCwjb/8jUIuo7J5+GNGdd3+AwNNRUBIirwTuym/EoQlFJSzgzzHxMP
         1uEoMilnsHoWMvg/yOincRavhbGKxhcf6CDRKPh9VC39ihM9olpePN4B0ntA+Me2NCH+
         aRj6hGlI1WFfkYwGmxNjTGYTxOLrXN9FcAYqJ550hoEVmIqmMZJmnC8uB8z+vQhQKYUv
         NZOQjGJP6md0nhA058ufuxFCGgARw0Fo+lwFaLxVeFnyu+uNZaVkIXnkO8aBprJXOcOR
         mSZEJh6YRvD310RFL7RohVhiz2Y+WKrEAE+emWG3DTQgrGjjXUffEIdKTYV+dXkrKov8
         MYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707211498; x=1707816298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8r9psvandqJ07ZF90QtVTVKq/Y9rSgNYXnuqiW3t60=;
        b=eyOSrXTdpqbxEIwR3IxuW2DK7d+nff1rMgzpSKZmJqoJT3wfg4r4KRwFBK7iViqlIU
         L74BvFlJpUtGyjchvIIOJgQ8rI49Q9k8yLRwQ5bnDxhuesmp/dtcS1HzYaOKjRub6YkR
         m+B0cNzQzaLjiOv8zDj1ElhBUBzt0Z7dJVuCmFIMvtl0gGWh93ja2gow7mgIMUv3Dnxe
         yZcntCFCdkSKY9SBvvE4xzMd0vLIGlsUU6rPY0Q1ZZF/btrzBeWnviS3+qPRsHvLIo2K
         6kMVchEjRtrqFAiiV3LQzUqJkROk7hVr3+yDOQVNTcV6VRlpeKX/Z2xitLvJtoMAf5Rp
         bBFg==
X-Gm-Message-State: AOJu0Ywd8VTPsyiCPtZ54ffkybR7Wt5WV5zoP9cGR3wAx/rG/xvBk17L
	fUazbRgoPWO4fFZo1XSO+qY2t0sfX7ETFuU64JvZQyvTMTuirXze9qN/LovMn7A=
X-Google-Smtp-Source: AGHT+IEyWQ/Tdp7OhsXODjgzE6QvJ6i+EwJdHXr+0N64oDh9My4/IcabB4BRaQg/teyOL6XTGHR9kg==
X-Received: by 2002:a17:902:ec8a:b0:1d5:efd6:20f with SMTP id x10-20020a170902ec8a00b001d5efd6020fmr2289192plg.1.1707211497690;
        Tue, 06 Feb 2024 01:24:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVIzuoQFU0lBMGRFz1/ZSjCVIWe8aszIpAeYlO3KU1WZQl34maPzJhby59uoO5k/xzRpgCtChE/GKINEO8rM/E1wJK3Ax51vo5U//jFZX2EaiGBDyItOewtQUJiKRGkkpGgZx5+hmYdHoe32vv7taCW7lm6dMLE/js1Z72YtPzRlDfFRFoGkLPtMuxBoXG1qiXeM07GDdbPhxaCLZE5GFGx4DMY/ThoDDO4awnE56qoXpnpW5/cOpA52OhOUPU3ZfTP5XgyBK9TQcCz3zeloPa1X06MXACOAHyfNo9TZQsKcsw3uBPnGu2v2eTAYjLREFJvqZ+pyrZo8SOaY0K8cZ7DLofWFWA=
Received: from ?IPV6:2a01:e0a:999:a3a0:20a2:d2ee:941a:156e? ([2a01:e0a:999:a3a0:20a2:d2ee:941a:156e])
        by smtp.gmail.com with ESMTPSA id ky12-20020a170902f98c00b001d8a80cbb15sm1353566plb.238.2024.02.06.01.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 01:24:57 -0800 (PST)
Message-ID: <32cfb8d2-7ea1-44da-8739-2cbe2b597b60@rivosinc.com>
Date: Tue, 6 Feb 2024 10:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: export VA_BITS
To: Jessica Clarke <jrtc27@jrtc27.com>, Stefan O'Rear <sorear@fastmail.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel@vger.kernel.org, Robin Ehn <rehn@rivosinc.com>
References: <20240201140319.360088-1-cleger@rivosinc.com>
 <ZbxUUsKdKIPI8Fb/@ghost> <701d3350-93d3-4235-aaf7-04c6492420a7@rivosinc.com>
 <5657c211-531b-4890-8c52-182b7b4eae7c@app.fastmail.com>
 <5A2420B9-6039-445B-B2C3-77F13EDD77BA@jrtc27.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <5A2420B9-6039-445B-B2C3-77F13EDD77BA@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_092501_099042_315A11E4 
X-CRM114-Status: GOOD (  27.00  )
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

CgpPbiAwNC8wMi8yMDI0IDAxOjIyLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiBPbiAzIEZlYiAy
MDI0LCBhdCAxMDo0MCwgU3RlZmFuIE8nUmVhciA8c29yZWFyQGZhc3RtYWlsLmNvbT4gd3JvdGU6
Cj4+Cj4+IE9uIEZyaSwgRmViIDIsIDIwMjQsIGF0IDM6MjIgQU0sIENsw6ltZW50IEzDqWdlciB3
cm90ZToKPj4+IE9uIDAyLzAyLzIwMjQgMDM6MzIsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPj4+
PiBPbiBUaHUsIEZlYiAwMSwgMjAyNCBhdCAwMzowMjo0NVBNICswMTAwLCBDbMOpbWVudCBMw6ln
ZXIgd3JvdGU6Cj4+Pj4+IFNvbWUgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyAoT3BlbkpESyBmb3Ig
aW5zdGFuY2UpIHVzZXMgdGhlIGZyZWUgYml0cwo+Pj4+PiBpbiBwb2ludGVycyB0byBpbnNlcnQg
YWRkaXRpb25hbCBpbmZvcm1hdGlvbiBmb3IgdGhlaXIgb3duIGxvZ2ljLgo+Pj4+PiBDdXJyZW50
bHkgdGhleSByZWx5IG9uIHBhcnNpbmcgL3Byb2MvY3B1aW5mbyB0byBvYnRhaW4gdGhlIGN1cnJl
bnQgdmFsdWUKPj4+Pj4gb2YgdmlydHVhbCBhZGRyZXNzIHVzZWQgYml0cyBbMV0uIEV4cG9ydGlu
ZyBWQV9CSVRTIHRocm91Z2ggaHdwcm9iZSB3aWxsCj4+Pj4+IGFsbG93IGZvciBhIG1vcmUgc3Rh
YmxlIGludGVyZmFjZSB0byBiZSB1c2VkLgo+Pj4+Cj4+Pj4gbW1hcCBhbHJlYWR5IHN1cHBvcnRz
IHRoaXMgd2l0aG91dCBhIG5lZWQgZm9yIGFwcGxpY2F0aW9ucyB0byBrbm93IHRoZQo+Pj4+IHVu
ZGVybHlpbmcgaGFyZHdhcmUuIElmIGEgaGludCBhZGRyZXNzIGlzIHBhc3NlZCBpbnRvIG1tYXAs
IGl0IHdpbGwgbmV2ZXIKPj4+PiByZXR1cm4gYW4gYWRkcmVzcyB0aGF0IHVzZXMgbW9yZSBiaXRz
IHRoYW4gdGhlIGhpbnQgYWRkcmVzcy4gSSBkZXNpZ25lZAo+Pj4+IGl0IHRoYXQgd2F5IHNvIHRo
YXQgc29tZXRoaW5nIGxpa2UgdGhpcyB3YXNuJ3QgbmVjZXNzYXJ5Lgo+Pj4KPj4+IE9rIGV2ZW4g
dGhvdWdoIHByb2JpbmcgdGhpcyBraW5kIG9mIHRoaW5nIGlzIHByb2JhYmx5IG5vdCB3aGF0IG1t
YXAgaXMKPj4+IG1lYW50IHRvIGRvLiBJTUhPLCBwcm9iaW5nIHRoaXMgdGhyb3VnaCB0aGUgcmVn
dWxhciBod3Byb2JlIGludGVyZmFjZSBpcwo+Pj4gcHJvYmFibHkgbW9yZSBjb2hlcmVudCBidXQg
bWF5YmUgUm9iaW4gKHdoaWNoIG5lZWRzIHRoaXMgaW5mb3JtYXRpb24pCj4+PiBjYW4gcmVseSBv
biB0aGF0Lgo+Pgo+PiBCb3RoIG9mIHRoZXNlIGFyZSB1c2VmdWwsIHNlcGFyYXRlbHkgYW5kIGlu
IGNvbmp1bmN0aW9uLgo+Pgo+PiBod3Byb2JlIGFsbG93cyBhcHBsaWNhdGlvbnMgd2hpY2ggY2Fu
IGFkYXB0IHRvIGRpZmZlcmVudCBWQSBzaXplcyB0byBsZWFybgo+PiB3aGljaCBpcyBpbiB1c2Ug
cHJpb3IgdG8gYWxsb2NhdGluZyBtZW1vcnkuCj4+Cj4+IG1tYXAgaGludHMgYWxsb3cgYXBwbGlj
YXRpb25zIHdoaWNoIHJlcXVpcmUgYSBmaXhlZCBsaW1pdCBvbiB0aGUgVkEgc2l6ZSB0bwo+PiBl
eHByZXNzIHRoYXQgbGltaXQgYXQgdGhlIHBvaW50IG9mIHJlcXVpcmVtZW50LCB0aGUgaGludCBj
YW4gYmUgc2V0IGJhc2VkIG9uCj4+IHRoZSBod3Byb2JlIHJlc3VsdCB0byBleHBsaWNpdGx5IGlu
ZGljYXRlIGl0cyB1c2UuCj4gCj4gTmVpdGhlciBpcyBhbiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMg
Y29uY2VwdCB0aG91Z2guIElmIHlvdSB3YW50IHRvCj4gZXhwb3NlIGEgbm90aW9uIG9mIFZBIGJp
dHMgdG8gdXNlcnNwYWNlIHRoZW4gaXQgc2hvdWxkIHByb2JhYmx5IGJlIGRvbmUKPiBpbiBhIG1v
cmUgZ2VuZXJpYyBtYW5uZXIgdGhhbiB0aGUgUklTQy1WLXNwZWNpZmljIGh3cHJvYmUgc3lzY2Fs
bCwKPiBwcm9iYWJseSBhcyB0d28gbnVtYmVycywgbG93IGFuZCBoaWdoIGJpdHMgKGlhNjTigJlz
IHJlZ2lvbnMgbWF5IGJlIGdvbmUsCj4gYnV0IHNwYXJjNjQgc3RpbGwgaGFzIGJvdGggaGFsdmVz
IG9mIHRoZSBhZGRyZXNzIHNwYWNlIHByZXNlbnRlZCB0bwo+IHVzZXJzcGFjZSwgd2l0aCB0aGUg
c3RhY2sgaW4gaGlnaC9uZWdhdGl2ZSBtZW1vcnkpLgoKQWdyZWVkLCB0aGlzIGlzIG5vdCBhcmNo
aXRlY3R1cmUgc3BlY2lmaWMuIFRoZSBpbml0aWFsIGdvYWwgd2FzIHRvCmV4cG9zZSBTVnh4IGV4
dGVuc2lvbnMgd2hpY2ggYXJlIGhhcmR3YXJlIHNwZWNpZmljIGJ1dCBpdCBzZWVtZWQgd3JvbmcK
c2luY2UgdGhpcyBpcyBzb21lIFMtbW9kZSBleHRlbnNpb24uIEJ1dCBtYXliZSB3ZSBjYW4gZ28g
YmFjayB3aXRoCmV4cG9zaW5nIHRoZXNlIGV4dGVuc2lvbnMgcmF0aGVyIHRoYW4gVkFfQklUUy4K
CklmIGV4cG9zaW5nIFZBX0JJVFMgaXMgc3RpbGwgIHVzZWZ1bCBmb3Igb3RoZXIgYXJjaGl0ZWN0
dXJlcywgbWF5YmUKZXhwb3NpbmcgYSBtYXNrIG9mICJ1c2VkIiBiaXRzIGNvdWxkIGJlIG1vcmUg
ZmxleGlibGUuIFdoaWNoIG1lY2hhbmlzbQp0byB1c2UgdG8gZXhwb3NlIHRoYXQgaXMgYW5vdGhl
ciBwcm9ibGVtLiBzeXNjb25mKCkgbWlnaHQgYmUgYSBnb29kIGZpdApzaW5jZSBpdCBhbHJlYWR5
IGV4cG9zZXMgcGFnZSBzaXplLgoKQ2zDqW1lbnQKCj4gCj4gSmVzcwo+IAo+PiAtcwo+Pgo+Pj4g
Q2zDqW1lbnQKPj4+Cj4+Pj4KPj4+PiAtIENoYXJsaWUKPj4+Pgo+Pj4+Pgo+Pj4+PiBMaW5rOiBo
dHRwczovL2dpdGh1Yi5jb20vb3Blbmpkay9qZGsvYmxvYi9tYXN0ZXIvc3JjL2hvdHNwb3Qvb3Nf
Y3B1L2xpbnV4X3Jpc2N2L3ZtX3ZlcnNpb25fbGludXhfcmlzY3YuY3BwI0wxNzEgWzFdCj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4+
Pj4KPj4+Pj4gLS0tCj4+Pj4+IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAg
fCAzICsrKwo+Pj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCAgICAgIHwgMiAr
LQo+Pj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCj4+Pj4+
IGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgfCAzICsrKwo+Pj4+PiA0IGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1l
bnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4+Pj4+IGluZGV4IGIyYmNjOWVlZDlhYS4u
NmYxOThjNmVkNGYwIDEwMDY0NAo+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yv
aHdwcm9iZS5yc3QKPj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0Cj4+Pj4+IEBAIC0yMTAsMyArMjEwLDYgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZp
bmVkOgo+Pj4+Pgo+Pj4+PiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxP
Q0tfU0laRWA6IEFuIHVuc2lnbmVkIGludCB3aGljaAo+Pj4+PiAgIHJlcHJlc2VudHMgdGhlIHNp
emUgb2YgdGhlIFppY2JveiBibG9jayBpbiBieXRlcy4KPj4+Pj4gKwo+Pj4+PiArKiA6YzptYWNy
bzpgUklTQ1ZfSFdQUk9CRV9LRVlfVkFfQklUU2A6IEFuIHVuc2lnbmVkIGxvbmcgd2hpY2gKPj4+
Pj4gKyAgcmVwcmVzZW50IHRoZSBudW1iZXIgb2YgYml0cyB1c2VkIHRvIHN0b3JlIHZpcnR1YWwg
YWRkcmVzc2VzLgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3By
b2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+Pj4+PiBpbmRleCA2MzA1
MDdkZmY1ZWEuLjE1MGE5ODc3YjBhZiAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od3Byb2JlLmgKPj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3By
b2JlLmgKPj4+Pj4gQEAgLTgsNyArOCw3IEBACj4+Pj4+Cj4+Pj4+ICNpbmNsdWRlIDx1YXBpL2Fz
bS9od3Byb2JlLmg+Cj4+Pj4+Cj4+Pj4+IC0jZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSA2
Cj4+Pj4+ICsjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSA3Cj4+Pj4+Cj4+Pj4+IHN0YXRp
YyBpbmxpbmUgYm9vbCByaXNjdl9od3Byb2JlX2tleV9pc192YWxpZChfX3M2NCBrZXkpCj4+Pj4+
IHsKPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4+Pj4+IGluZGV4IDlm
MmE4ZTNmZjIwNC4uMmE1MDA2Y2RkYjdiIDEwMDY0NAo+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmgKPj4+Pj4gQEAgLTY3LDYgKzY3LDcgQEAgc3RydWN0IHJpc2N2X2h3
cHJvYmUgewo+Pj4+PiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTlNVUFBPUlRF
RCAoNCA8PCAwKQo+Pj4+PiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9NQVNLICg3
IDw8IDApCj4+Pj4+ICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJWkUg
Ngo+Pj4+PiArI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9WQV9CSVRTIDcKPj4+Pj4gLyogSW5j
cmVhc2UgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4gYWRkaW5nIGl0ZW1zLiAqLwo+Pj4+Pgo+
Pj4+PiAvKiBGbGFncyAqLwo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPj4+Pj4gaW5kZXgg
YTdjNTZiNDFlZmQyLi4zMjg0MzU4MzZlMzYgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19od3Byb2JlLmMKPj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYwo+Pj4+PiBAQCAtMjAyLDYgKzIwMiw5IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfb25l
X3BhaXIoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4+Pj4+IGlmIChod3Byb2JlX2V4dDBf
aGFzKGNwdXMsIFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPWikpCj4+Pj4+IHBhaXItPnZhbHVlID0g
cmlzY3ZfY2Jvel9ibG9ja19zaXplOwo+Pj4+PiBicmVhazsKPj4+Pj4gKyBjYXNlIFJJU0NWX0hX
UFJPQkVfS0VZX1ZBX0JJVFM6Cj4+Pj4+ICsgcGFpci0+dmFsdWUgPSBWQV9CSVRTOwo+Pj4+PiAr
IGJyZWFrOwo+Pj4+Pgo+Pj4+PiAvKgo+Pj4+PiAgKiBGb3IgZm9yd2FyZCBjb21wYXRpYmlsaXR5
LCB1bmtub3duIGtleXMgZG9uJ3QgZmFpbCB0aGUgd2hvbGUKPj4+Pj4gLS0gCj4+Pj4+IDIuNDMu
MAo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+Pj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+Pgo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
