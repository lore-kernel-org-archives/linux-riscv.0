Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8272C0219B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gWd5LOz4u5HdGezvJ/q6sAbdNti3fJjuJuvLE3vd40=; b=4LEFSXOY3rFG15
	LXqhqWy8AE/0+G0u2Ct/QxxokRAjLi0ay4TMkg+bl/DEnK1XskiHtpHuaN3MORwguaWce9Rsc/nN+
	GurVBu+Dysrifw7dlskQjxto7J7OLYrwPDAdpT+1kxYF4sJFQD935HiyJ8Z7CkeDnSJ+Vhrxy/eiP
	kATxQM6INIItp1P0vsIlkmDjYt4AosYsbzA8JS4xjFhJFrjm7trv+S2SdKt1OpW0c4sFwoIAhtiaM
	uDErfa06Z90++2cx8JUK57LYH4/SnxVKwFR1T8q96gI4CBelF1czmrP0P++y7esDMSfLTSmp01qx2
	JioY8VcSfKKU/u70lL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSYP-0000000AZte-3ATa;
	Fri, 07 Feb 2025 17:54:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSO1-0000000AXJ6-48MP
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 17:43:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43622267b2eso23537365e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 09:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738950208; x=1739555008; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IetCQx0BtEm/B71PL9JFs54qQSQD4i7yGXxs4Re/YLo=;
        b=B8Os8/suqqwsSw11icm9MSpNjEXEWwo8ef/u41bpywe+WRls1A/1MLut9zACWtYd/U
         qVfW3xKwBl5YNxqFRJTZiUsxZD3O2nctKlA0vvCQceJEo2etzK/xO8Vlnx5y/akpMMhY
         4h3x0lV6h+/5ZlOtR0GG/UvFxdZpYNuFprZUYlHb1GoaiXP3UWy18TbIo0eTlMwBz9O1
         BX6oShNl0gk9QookVUAvzWHBXVpyOkXIC/NrfX9WeMnv1Rp3qI/OGGV6yFvprxWixWCC
         MGpD7G2Hl4PCVhoZHVsJr2bYM3TnnL5MURKeM3p7+mCWOO1mk/Xnt/uzRPrVR9eOHHB3
         wABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950208; x=1739555008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IetCQx0BtEm/B71PL9JFs54qQSQD4i7yGXxs4Re/YLo=;
        b=nqOHFKECkp41VLIKcIdIe4ljDZimiQymLEHWp7BMoxr+mDMjAmZXPtn3xnuteXNTfd
         sAMmO0PHJhxcb19ZYwez0PrcCXn3ceRPWO3YCezV7nCTomeLWdQBXw8+aOWmlXNLYV9a
         HJqsuy0nHSSrM/dxxyicmRB0JYJdfuduR+V70g0BNXTqEn48AledRQNu3smZS2hWg+eh
         uw6KppnD9RmFt4urJnESVdxlNU7OGa1wyFE/U6d1bj/Bco1j/yuiRULwZKTMethNi05B
         QW3Z2aQ8ewRmryCSAzvYQPcK90bx26DcJFGa9WlSRkpb9KPBiprqO04azsMlxaeVP0rp
         pecA==
X-Gm-Message-State: AOJu0YyXSWkOnXPIh1QiRB5LSDlsaqIXWPSWMNYFLNDOsR7ipoNhdhBq
	aFinp6Futv2i3v4yYhCVmAXF9f69fjOKPO1Cc6sxNvlVXPQogWJBZbCoPufeDwU=
X-Gm-Gg: ASbGncvOTjd3J+xBjgMd+HTpRZ3KfLbNXHFBXPlOEWe8JMB9g2hvN3znKjpxvtSkXdX
	xvFSs8udKLcH/PKbdvsstVtoXz1IDE/3njreM8o6GUoafVmC/hIe5hx6zkXhA5uLN1ANEziQIwl
	e35ZF01/AcICUfCxOtmf58vm4Cad9f9smt9qFcpnvzwoe3oR7d/S+na63ByyyATGa7XxW1r8i84
	CBF00W2deCYzkmm4xd0jG5lFyEGcXZgOlfSt83ca755IHeqjeKQ++lpsEBqpkkVpky2BmfKXxe9
	2mo3az5/Bem+GR901w1aRQsRVh6sLlGhdrKMVZF/AlxPL46uMbKUQPnRNSFD
X-Google-Smtp-Source: AGHT+IFZAkbPMDhch3CHM1MWaqe+44k/0uA7F84dwm4WQWejM1tHjBHdsK2TtZv0OcHNrDfRBy217g==
X-Received: by 2002:a05:600c:3552:b0:438:a1f5:3e38 with SMTP id 5b1f17b1804b1-439249c75c3mr41835255e9.30.1738950208480;
        Fri, 07 Feb 2025 09:43:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f61ca4sm62393345e9.1.2025.02.07.09.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:43:28 -0800 (PST)
Message-ID: <fdabae33-a1df-41f7-9e1f-9973f252599a@rivosinc.com>
Date: Fri, 7 Feb 2025 18:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-13-ajones@ventanamicro.com>
 <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>
 <20250207-f0e7e2b868ef3e9f2a174f29@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207-f0e7e2b868ef3e9f2a174f29@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_094330_279521_3EB250B0 
X-CRM114-Status: GOOD (  16.97  )
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

CgpPbiAwNy8wMi8yMDI1IDE4OjA4LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gRnJpLCBGZWIg
MDcsIDIwMjUgYXQgMDU6NDc6MjhQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAwNy8wMi8yMDI1IDE3OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBXZSBzaG91
bGRuJ3QgcHJvYmUgd2hlbiB3ZSBhbHJlYWR5IGtub3cgdmVjdG9yIGlzIHVuc3VwcG9ydGVkIGFu
ZAo+Pj4gd2Ugc2hvdWxkIHByb2JlIHdoZW4gd2Ugc2VlIHdlIGRvbid0IHlldCBrbm93IHdoZXRo
ZXIgaXQncyBzdXBwb3J0ZWQuCj4+PiBGdXJ0aGVybW9yZSwgd2Ugc2hvdWxkIGVuc3VyZSB3ZSd2
ZSBzZXQgdGhlIGFjY2VzcyB0eXBlIHRvCj4+PiB1bnN1cHBvcnRlZCB3aGVuIHdlIGRvbid0IGhh
dmUgdmVjdG9yIGF0IGFsbC4KPj4+Cj4+PiBGaXhlczogZTdjOWQ2NmUzMTNiICgiUklTQy1WOiBS
ZXBvcnQgdmVjdG9yIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgaHdwcm9iZSIpCj4+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+Pj4gLS0tCj4+
PiAgYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jIHwgNiArKysrLS0K
Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVk
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKPj4+IGluZGV4
IGI3YThmZjdiYTZkZi4uMTYxOTY0Y2YyYWJjIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKPj4+IEBAIC0zNjcsMTAgKzM2NywxMiBAQCBzdGF0
aWMgdm9pZCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2VzcyhzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
KndvcmsgX19hbHdheXNfdW51cwo+Pj4gIAo+Pj4gIHN0YXRpYyBpbnQgcmlzY3Zfb25saW5lX2Nw
dV92ZWModW5zaWduZWQgaW50IGNwdSkKPj4+ICB7Cj4+PiAtCWlmICghaGFzX3ZlY3RvcigpKQo+
Pj4gKwlpZiAoIWhhc192ZWN0b3IoKSkgewo+Pj4gKwkJcGVyX2NwdSh2ZWN0b3JfbWlzYWxpZ25l
ZF9hY2Nlc3MsIGNwdSkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1VOU1VQUE9S
VEVEOwo+Pj4gIAkJcmV0dXJuIDA7Cj4+PiArCX0KPj4+ICAKPj4+IC0JaWYgKHBlcl9jcHUodmVj
dG9yX21pc2FsaWduZWRfYWNjZXNzLCBjcHUpICE9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9W
RUNUT1JfVU5TVVBQT1JURUQpCj4+PiArCWlmIChwZXJfY3B1KHZlY3Rvcl9taXNhbGlnbmVkX2Fj
Y2VzcywgY3B1KSAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1VOS05PV04pCj4+
PiAgCQlyZXR1cm4gMDsKPj4+ICAKPj4+ICAJY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3Nf
ZW11bGF0ZWQoTlVMTCk7Cj4+Cj4+IEhpIEFuZHJldywKPj4KPj4gV291bGRuJ3QgaXQgYmUgZWFz
aWVyIGp1c3Qgbm90IHRvIHJlZ2lzdGVyIHRoZSBob3RwbHVnIGNhbGxiYWNrIGluIGNhc2UKPj4g
IWhhc192ZWN0b3IoKSA/IEluIHdoaWNoIGNhc2UganVzdCBzZXQgYWxsIHBvc3NpYmxlIGNwdXMK
Pj4gdmVjdG9yX21pc2FsaWduZWRfYWNjZXNzIHRvIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9W
RUNUT1JfVU5TVVBQT1JURUQKPj4gYXQgc3RhcnR1cC4KPiAKPiBXZSBjb3VsZCBkbyB0aGF0LCBi
dXQgSSBoYXZlIGFub3RoZXIgdXNlIGZvciB0aGUgaG90cGx1ZyBjYWxsYmFjayB0aGF0Cj4geW91
J2xsIHNlZSBuZWFyIHRoZSBlbmQgb2YgdGhlIHNlcmllcy4KCk9rLCBJIHNhdyBwYXRjaCA3Lzku
CgpCVFcsIHdoYXQgaGFwcGVuZWQgdG8gcGF0Y2ggOCA/IEkgdGhvdWdodCBpdCB3YXMgaW4gbXkg
c3BhbSBidXQgZXZlbgpsb3JlLmtlcm5lbC5vcmcgZG9lcyBub3QgaGF2ZSBpdDoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTAyMDcxNjE5MzkuNDYxMzktMTEtYWpvbmVz
QHZlbnRhbmFtaWNyby5jb20vVC8jdAoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhhbmtzLAo+
IGRyZXcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
