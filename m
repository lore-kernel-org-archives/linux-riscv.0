Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD7DC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkxkcD//YzNF2BBFSX+7metMOZS5E1VFiKnvKQ8dcAo=; b=RVB4e5tahgh04R
	D67oqMXok/z6lSizpyPFk0oYjt2BZenjlL7rYUsFkQLSrMxa3IpjfmHEEtRS0n5OMiYL0nw1oiyEo
	Oo5FDsGqxX0vb7sGwJ2eqLO3cwgUXmnNEkL183nBJ8mZhU0lybWEqcqCJ5M5fQ77P9LXUmNsJae1g
	tbBX4NH/QTqB4P3DR38b6ouceOfex5I4UVPCuQMxE9W6UrAVYjaFO7EJ47HlmSl0j89+/AlrQoom7
	4OeVot83o4OBi4yc2D/F+ttEgOUGPNIgtTbjXi7OftOu5ikfsLYb5vJj1WkZgtwsRF8oTPifnbekr
	KbQIe86omjVDXd7A04TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DWz-00000007Gnx-1ihi;
	Tue, 22 Apr 2025 13:19:21 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ci8-0000000769r-0DIg
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 12:26:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736c1138ae5so4467441b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 05:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745324807; x=1745929607; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9WpxPhhtI0tv8acTJTkX27lGaWBDufWmxeLB5TCpcOY=;
        b=IXOtrdooIjDjemYeET5pFt66BiaP8ApSG+ZDUZqu3zhUugN/ySxtcH6JO6SjVyIjix
         ZHJ7FddhVZsI9x/uP6QsgORqRvLUMqtOzWOId/XD3SjC/JBepoLUc9TQRWJlIoIzmFJ+
         1QujJVmN50SD9DyTsefsZKl8BscqxSVgmBxHBp78aIa9AZMGCPgjPQcn/3RxCAMxhXCL
         jWx85SxP8YP1jBNjTOfb/ADIJvagmQOtKpZvvIvSxZ3qDKSFaf+HH9ki3ig2BrO9amD5
         prt25D4cQCQrD+cD0q98ezNAyDen+b4kydgVHyTPgUz9CcKbNGyeEYuniBtXqfdWNbmY
         wlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745324807; x=1745929607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WpxPhhtI0tv8acTJTkX27lGaWBDufWmxeLB5TCpcOY=;
        b=HGKVSxhKX4B/Ewphoizk9LYmxIL7rMQjtRNvhZfxdsCseWtM2pEF0QP3PelXxA3IB5
         Evv/LG9Do0bYL7SfHImQjj2ibpvp5My4lB6IWbRovbIXrHbgip9iLtCXyr96+pHPlzpj
         GDhy6pRzmkm3PVpv+AN3n8/+K7WD+fuEsnn897u5MFEyJL6fowGJ5qPvb6g7xEoN48JC
         86v3BQ7bHLwJQOTA5ZXheN8W0IWNAyojXYvlgQX2+u+5XD/lrk91307Hq3KlwM1KaZjg
         tqNOoXvJ1aPjG1mRFPitR5LO1MiH5fUuColLFn3qLztrqX/vzjpVEMWRZnMIYExDOKOl
         Yl9A==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+fK+GomiFVgCybLhZ+KvArM2PQzSqAU2DzSq2bpdakDARW+5gUHrC7xpPL6Tx7Je+4xhOoKGcw0ILQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAoDIJQwwqgDmM4WkpZkZvBVJZYXTqxMkJGgkPhoaGcEsZZaiR
	ZojLAQ+FWRzpqU3uBtv+WtWyBScha8YSgWsf0URZyCOhD5QBW2QAEnzktJELSCw=
X-Gm-Gg: ASbGncuhdbeJIGa9rwYTuEKST+SbINovtNF7/XnWJ9X/Lpf5NBbdWwihuQnl1bg4Z7U
	rZvYBY/IGGxy00P6s8w2wgB3qBO0MQj5ckmB8gJ1ZxlBLmG4mIXCIj0O/Ys2+vbcHeqIdS6b0vx
	sFcEYwRzF+mJkSJSxaJVmDh3tb38P1OkE4qmSqWUEIwbfkbqQDctFvmJOI80DWB7vV23/xsQLyW
	PmO7x7Qvn+cTxv2JLtaH9fVf74Fot6Qpb4UDwAJUp66xp3pg1ik3gIAl7ayYJkptFRasFjJMDzR
	g0MQSEFA9kKsV/IpHM+fq9qJ9xdsWVK+HMsacJ2oKFXAbd/mujvYsANNLMkTw4+6WjWcbiIu1YA
	Lhx+Li7ST3A==
X-Google-Smtp-Source: AGHT+IE0G/bhySn5dFs4NG10U9hH5GrpSnoHbsOXXW2kvsx0u/k+6aJGLwWHt3Ba28Q1C2PZqy1syQ==
X-Received: by 2002:a05:6a20:12cd:b0:1f5:92ac:d6b7 with SMTP id adf61e73a8af0-203cbc05557mr22264643637.4.1745324807191;
        Tue, 22 Apr 2025 05:26:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beb00sm8735522b3a.14.2025.04.22.05.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 05:26:46 -0700 (PDT)
Message-ID: <4b950430-6f12-4b4d-a516-e09a38b83ff0@rivosinc.com>
Date: Tue, 22 Apr 2025 14:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: export Zabha extension
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250421141413.394444-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250421141413.394444-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_052648_350061_BB2EBAD4 
X-CRM114-Status: GOOD (  14.38  )
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

CgpPbiAyMS8wNC8yMDI1IDE2OjE0LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gRXhwb3J0IFph
YmhhIHRocm91Z2ggdGhlIGh3cHJvYmUgc3lzY2FsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9i
ZS5jICAgICAgIHwgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3Vt
ZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+IGluZGV4IGY2MGJmNTk5MTc1NS4uYTQ5
OThhZDJkZmUwIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2Jl
LnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+IEBAIC0y
NzEsNiArMjcxLDEwIEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiAgICAqIDpj
Om1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUNCT01gOiBUaGUgWmljYm9tIGV4dGVuc2lvbiBp
cyBzdXBwb3J0ZWQsIGFzCj4gICAgICAgICByYXRpZmllZCBpbiBjb21taXQgM2RkNjA2ZiAoIkNy
ZWF0ZSBjbW9iYXNlLXYxLjAucGRmIikgb2YgcmlzY3YtQ01Pcy4KPiAgCj4gKyAgKiA6YzptYWNy
bzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkFCSEFgOiBUaGUgWmFiaGEgZXh0ZW5zaW9uIGlzIHN1cHBv
cnRlZCBhcwo+ICsgICAgICAgcmF0aWZpZWQgaW4gY29tbWl0IDQ5ZjQ5Yzg0MmZmOSAoIlVwZGF0
ZSB0byBSYWZpZmllZCBzdGF0ZSIpIG9mCj4gKyAgICAgICByaXNjdi16YWJoYS4KPiArCj4gICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IERlcHJlY2F0ZWQuICBSZXR1
cm5zIHNpbWlsYXIgdmFsdWVzIHRvCj4gICAgICAgOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZ
X01JU0FMSUdORURfU0NBTEFSX1BFUkZgLCBidXQgdGhlIGtleSB3YXMKPiAgICAgICBtaXN0YWtl
bmx5IGNsYXNzaWZpZWQgYXMgYSBiaXRtYXNrIHJhdGhlciB0aGFuIGEgdmFsdWUuCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gaW5kZXggM2MyZmNlOTM5NjczLi5mY2ExNWYy
YmY2ZjMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUu
aAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiBAQCAtODEs
NiArODEsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7Cj4gICNkZWZpbmUJCVJJU0NWX0hXUFJP
QkVfRVhUX1pJQ0JPTQkoMVVMTCA8PCA1NSkKPiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRf
WkFBTU8JCSgxVUxMIDw8IDU2KQo+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUxSU0MJ
KDFVTEwgPDwgNTcpCj4gKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pBQkhBCQkoMVVMTCA8
PCA1OCkKPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQo+ICAjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQo+ICAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJKDEgPDwgMCkKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19o
d3Byb2JlLmMKPiBpbmRleCAyNDlhZWM4NTk0YTkuLmVkMzEyMzM5NmE5NiAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc3lzX2h3cHJvYmUuYwo+IEBAIC05Niw2ICs5Niw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVf
aXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gIAkJICogcHJlc2VuY2UgaW4g
dGhlIGhhcnRfaXNhIGJpdG1hcCwgYXJlIG1hZGUuCj4gIAkJICovCj4gIAkJRVhUX0tFWShaQUFN
Tyk7Cj4gKwkJRVhUX0tFWShaQUJIQSk7Cj4gIAkJRVhUX0tFWShaQUNBUyk7Cj4gIAkJRVhUX0tF
WShaQUxSU0MpOwo+ICAJCUVYVF9LRVkoWkFXUlMpOwoKSGkgQWxleCwKCkxvb2tzIGdvb2QgdG8g
bWUsCgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoK
VGhhbmtzLAoKQ2zDqW1lbnQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
