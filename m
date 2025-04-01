Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A66C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3+wtMLpXoZqklrdGSKo84PSLl5OdSs0CklfGgU8jww=; b=NB9r9lqtp0s+KL
	wa4cTSo2vYn2DUXu+GwF2JiU/IuWMBFfUqWMGbPrPXBndLaqHTdRbzo64SLGiRh93O/CwvouanwTr
	QCkQXiyOX3M5iHfd2Jq923/ZVhBKu2Hke7YFw0+bImbn9YuaNrZPsund6XZMhELCN9H0dewr432CN
	pF0eTuL9vvS7BSpiBARJeGA5dUrHCitjH6ZN+2FrmS9qnASv96ELzsdwzlrNfWIHPuuflosHRYETn
	bXS672HXsrTz+brc2aP3oUnNVlnDX1GD0DZ4nJzofsfMctFO45jjgqYn4U5MNVaEp8Bhxs4jhEEsB
	HnH+Yx4TtJr74Ftihmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcqQ-00000003cet-0H8N;
	Tue, 01 Apr 2025 14:44:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcqM-00000003ce3-3gA7
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 14:44:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-223fb0f619dso105887605ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743518637; x=1744123437; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spmdYh5iTMHiWJde+8Fl/6vRQmlnAOCyfRLFHTdbiq4=;
        b=WNQsPQgQj50vrbrjArqzsUj592Y29+lGgeFtiyv0RZwvbsgEjgpzxxlO9Kij1X+SVl
         ZxXgqaFj9wmrOXXeLBdWiYhhV53RzTAlclOsWAcOsqMd3q56+it8kcIjN3BAciX17UTI
         b/SoEsNXACfN4d3tk3nReU7iC3pVst/0WXzUo7MEl/nNZLvK/DL3wClNI52hLbPV7Awd
         nrQWqp0L04g5yRZh5ICLlDuX4GBri7PGq4lckzbZHOCmDRvaVkjE85FKSAkqY90jZFGX
         v3PlkZMP2oudmFEifYEFgXznGq+EfZTBTeWHurMIXC+89ZhLFPy4olThhQKEbo93yQoQ
         ghtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518637; x=1744123437;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=spmdYh5iTMHiWJde+8Fl/6vRQmlnAOCyfRLFHTdbiq4=;
        b=EpDScaKQ7t6R0S7GK5Cq2yOa2IK7eaEux7ZjjKErnBy3IaV0ErvNxRRfR/iWrcZj3J
         hy151lG1iXuOBuiunBI3brybW4uHK2VQIIflEYbMGc34cI4YhtnJdITv8C7Ytf5RuGBL
         zSI2FZfYsdPHYGxfrGhs//U9kQ8/p2LxlTZCQv3nSjbahFGacmlEr3Sxvxf9YBHGGDl0
         N0uwRS/etQ7llim9xXrXdBfqAABCaEAmwjAeera1N1ow/YGTRIanlBUU1OTrg+hxBPNg
         6dLcVXEtEyrFJv8Pha2GptQXWHMxiAntqvLsAV6hEpyYgocvFH9k0EqyPfpTk+y9tX8O
         h7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdEUmDBGV/ttr7Oh83gOvuAtM3hQoLydju4oIye89695Hlv+doIRDoiCExH+VJ0NRY6c8RmRHSa8aaqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPzK9r2DwTTXO9RRFZvHthDwAuc98VVTgu8CVYtGTULNcvhNQU
	d/OKVMc+6khHhXxpjgqhJf4SiJR6Wc+y7Dk0aINPQKD6GLmokkoA
X-Gm-Gg: ASbGncvDbmhidmcp9ad6Z31UTgQx1Pe5HidTw8MvYz78vv2viUWIVx062XWzxWE3BXE
	r2GsIj5PZpBQkt5tOZKG0sqZSHr48m+egV9mFkaWWlpRaNhAxDD7HtTSQX5jYr2M1vylBgnAeSr
	4ZAhiycIkHLNC0ptqJsio8x10sU7FMJ20iwwQTwejvMeq51cejlwejbid+e0M0x2/C08dpbA4KR
	8laHFnUf9v+hxpy5IdlE+G3rtzH8hbLHdA9ZTGisw7KA33L4r12AoycVsZp4AWvCenA5yuzGTZ7
	niNOUo5FdBFQzGxLoBdAQ8qeGKd5Lguz4ci33A==
X-Google-Smtp-Source: AGHT+IGsbUh6DxXIIDAIc+hYNcWrRaxqqBY9nNJl1ZK31CCY9lO+b/4ITi+8JpWodsXphv4cIkxwaA==
X-Received: by 2002:a17:902:ce12:b0:226:3781:379d with SMTP id d9443c01a7336-2295c0ed130mr48778565ad.33.1743518637565;
        Tue, 01 Apr 2025 07:43:57 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1db99esm89014855ad.159.2025.04.01.07.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 07:43:57 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 01 Apr 2025 11:43:54 -0300
Message-Id: <D8VDRV58EWSK.MKGI5JBD8RX6@gmail.com>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>, "Hans de Goede"
 <hdegoede@redhat.com>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 <ibm-acpi-devel@lists.sourceforge.net>,
 <platform-driver-x86@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Damian
 Tometzki" <damian@riscv-rocks.de>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix NULL pointer
 dereferences while probing
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
 <455d5e7d-6f1e-a0a0-773b-85c26418bf54@linux.intel.com>
In-Reply-To: <455d5e7d-6f1e-a0a0-773b-85c26418bf54@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_074358_915751_515A39E4 
X-CRM114-Status: GOOD (  18.69  )
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

SGkgSWxwbywKCk9uIFR1ZSBBcHIgMSwgMjAyNSBhdCA4OjI0IEFNIC0wMywgSWxwbyBKw6Rydmlu
ZW4gd3JvdGU6Cj4gT24gU3VuLCAzMCBNYXIgMjAyNSwgS3VydCBCb3JqYSB3cm90ZToKPgo+PiBT
b21lIHN1YmRyaXZlcnMgbWFrZSB1c2Ugb2YgdGhlIGdsb2JhbCByZWZlcmVuY2UgdHBhY3BpX3Bk
ZXYgZHVyaW5nCj4+IGluaXRpYWxpemF0aW9uLCB3aGljaCBpcyBjYWxsZWQgZnJvbSB0aGUgcGxh
dGZvcm0gZHJpdmVyJ3MgcHJvYmUuCj4+IEhvd2V2ZXIsIGFmdGVyCj4+IAo+PiBjb21taXQgMzhi
OWFiODBkYjMxICgicGxhdGZvcm0veDg2OiB0aGlua3BhZF9hY3BpOiBNb3ZlIHN1YmRyaXZlciBp
bml0aWFsaXphdGlvbiB0byB0cGFjcGlfcGRyaXZlcidzIHByb2JlLiIpCj4+IAo+Cj4gTmV4dCB0
aW1lLCBwbGVhc2UgaW5jbHVkZSB0aGVzZSBpbnRvIHRoZSBwYXJhZ3JhcGggZmxvdyBub3JtYWxs
eSBvYmV5aW5nIAo+IHRoZSBub3JtYWwgcGFyYWdyYXBoIGZvcm1hdHRpbmcuIEkgY2hhbmdlZCB0
aGVtIGluIHRoaXMgY2FzZS4KClRoYW5rcywgd29uJ3QgaGFwcGVuIG5leHQgdGltZS4KCj4KPj4g
dGhpcyB2YXJpYWJsZSBpcyBvbmx5IHByb3Blcmx5IGluaXRpYWxpemVkICphZnRlciogcHJvYmlu
ZyBhbmQgdGhpcyBjYW4KPj4gcmVzdWx0IGluIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgo+
PiAKPj4gSW4gb3JkZXIgdG8gZml4IHRoaXMgd2l0aG91dCByZXZlcnRpbmcgdGhlIGNvbW1pdCwg
cmVnaXN0ZXIgdGhlIHBsYXRmb3JtCj4+IGJ1bmRsZSBpbiB0d28gc3RlcHMsIGZpcnN0IGNyZWF0
ZSBhbmQgaW5pdGlhbGl6ZSB0cGFjcGlfcGRldiwgdGhlbgo+PiByZWdpc3RlciB0aGUgZHJpdmVy
IHN5bmNocm9ub3VzbHkgd2l0aCBwbGF0Zm9ybV9kcml2ZXJfcHJvYmUoKS4gVGhpcyB3YXkKPj4g
dGhlIGJlbmVmaXRzIG9mIGNvbW1pdCAzOGI5YWI4MGRiMzEgYXJlIHByZXNlcnZlZC4KPj4gCj4+
IEFkZGl0aW9uYWxseSwKPj4gCj4+IGNvbW1pdCA0M2ZjNjNhMWU4ZjYgKCJwbGF0Zm9ybS94ODY6
IHRoaW5rcGFkX2FjcGk6IE1vdmUgSFdNT04gaW5pdGlhbGl6YXRpb24gdG8gdHBhY3BpX2h3bW9u
X3Bkcml2ZXIncyBwcm9iZSIpCj4+IAo+PiBpbnRyb2R1Y2VkIGEgc2ltaWxhciBwcm9ibGVtLCBo
b3dldmVyIHRwYWNwaV9zZW5zb3JzX3BkZXYgaXMgb25seSB1c2VkCj4+IG9uY2UgaW5zaWRlIHRo
ZSBwcm9iZSwgc28gcmVwbGFjZSB0aGUgZ2xvYmFsIHJlZmVyZW5jZSB3aXRoIHRoZSBvbmUKPj4g
Z2l2ZW4gYnkgdGhlIHByb2JlLgo+PiAKPj4gUmVwb3J0ZWQtYnk6IERhbWlhbiBUb21ldHpraSA8
ZGFtaWFuQHJpc2N2LXJvY2tzLmRlPgo+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvQ0FMPUIzN2tkTDFvclNRWkQyQTNza0RPZXZSWEJ6Rl9fY0pKZ1lfR0ZoOUxaTzNGTXN3QG1h
aWwuZ21haWwuY29tLwo+PiBGaXhlczogMzhiOWFiODBkYjMxICgicGxhdGZvcm0veDg2OiB0aGlu
a3BhZF9hY3BpOiBNb3ZlIHN1YmRyaXZlciBpbml0aWFsaXphdGlvbiB0byB0cGFjcGlfcGRyaXZl
cidzIHByb2JlLiIpCj4+IEZpeGVzOiA0M2ZjNjNhMWU4ZjYgKCJwbGF0Zm9ybS94ODY6IHRoaW5r
cGFkX2FjcGk6IE1vdmUgSFdNT04gaW5pdGlhbGl6YXRpb24gdG8gdHBhY3BpX2h3bW9uX3Bkcml2
ZXIncyBwcm9iZSIpCj4+IFRlc3RlZC1ieTogRGFtaWFuIFRvbWV0emtpIDxkYW1pYW5AcmlzY3Yt
cm9ja3MuZGU+Cj4+IFNpZ25lZC1vZmYtYnk6IEt1cnQgQm9yamEgPGt1dXJ0YkBnbWFpbC5jb20+
Cj4KPiBBcHBsaWVkIHRvIHRoZSByZXZpZXctaWxwby1maXhlcyBicmFuY2guCgpUaGFuayB5b3Uh
Cgo+Cj4+IC0tLQo+PiBIaSBhbGwsCj4+IAo+PiBUaGUgY29tbWl0IG1lc3NhZ2UgaXMgcHJldHR5
IHNlbGYtZXhwbGFuYXRvcnkuIEkgaGF2ZSBvbmUgcXVlc3Rpb24KPj4gdGhvdWdoLiBBcyB5b3Ug
Y2FuIHNlZSBpbiB0aGUgY3Jhc2ggZHVtcCBvZiB0aGUgb3JpZ2luYWwgcmVwb3J0Ogo+PiAKPj4g
TWFyIDI5IDE3OjQzOjE2LjE4MDc1OCBmZWRvcmEga2VybmVsOiAgPyBhc21fZXhjX3BhZ2VfZmF1
bHQrMHgyNi8weDMwCj4+IE1hciAyOSAxNzo0MzoxNi4xODA3NjkgZmVkb3JhIGtlcm5lbDogID8g
X19wZnhfa2xpc3RfY2hpbGRyZW5fZ2V0KzB4MTAvMHgxMAo+PiBNYXIgMjkgMTc6NDM6MTYuMTgw
NzgxIGZlZG9yYSBrZXJuZWw6ICA/IGtvYmplY3RfZ2V0KzB4ZC8weDcwCj4+IE1hciAyOSAxNzo0
MzoxNi4xODA3OTIgZmVkb3JhIGtlcm5lbDogIGRldmljZV9hZGQrMHg4Zi8weDZlMAo+PiBNYXIg
MjkgMTc6NDM6MTYuMTgwODA0IGZlZG9yYSBrZXJuZWw6ICByZmtpbGxfcmVnaXN0ZXIrMHhiYy8w
eDJjMCBbcmZraWxsXQo+PiBNYXIgMjkgMTc6NDM6MTYuMTgwODEzIGZlZG9yYSBrZXJuZWw6ICB0
cGFjcGlfbmV3X3Jma2lsbCsweDE4NS8weDIzMCBbdGhpbmtwYWRfYWNwaV0KPj4gCj4+IFRoZSBO
VUxMIGRlcmVmZXJlbmNlIGhhcHBlbnMgaW4gZGV2aWNlX2FkZCgpLCBpbnNpZGUgcmZraWxsX3Jl
Z2lzdGVyKCkuCj4+IFRoaXMgYm90aGVycyBtZSBiZWNhdXNlLCBhcyB5b3UgY2FuIHNlZSBoZXJl
Ogo+PiAKPj4gIDExOTggICAgICAgICAgICAgICAgIGF0cF9yZmstPnJma2lsbCA9IHJma2lsbF9h
bGxvYyhuYW1lLAo+PiAgMTE5OSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmdHBhY3BpX3BkZXYtPmRldiwKPj4gIDEyMDAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmZrdHlwZSwKPj4gIDEyMDEgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnRwYWNwaV9yZmtfcmZraWxs
X29wcywKPj4gIDEyMDIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYXRwX3Jmayk7Cj4+IAo+PiB0aGUgTlVMTCBkZWZlcmVuY2UgaGFwcGVucyBpbiBsaW5l
IDExOTksIGluc2lkZSB0cGFjcGlfbmV3X3Jma2lsbCgpLiBJCj4+IHRoaW5rIHRoaXMgZGlzYWdy
ZWVtZW50IG1pZ2h0IGJlIGR1ZSB0byBjb21waWxlIHRpbWUgb3B0aW1pemF0aW9ucz8KPgo+IEhv
dyBkaWQgeW91IG1hcCBpdCB0byBsaW5lIG51bWJlcnM/IElzIGl0IGp1c3QgYWJvdXQgZGlmZmVy
ZW5jZSBpbiB0aGUgCj4gY29tcGlsZWQgYmluYXJpZXMgdGhhdCByZXN1bHRzIGluIGRpZmZlcmVu
dCBsaW5lIG51bWJlcnM/CgpPaCAtIEkganVzdCBtYW51YWxseSBmb2xsb3dlZCB0aGUgZHVtcCB0
cmFjZSBpbiBzZWFyY2ggb2YgdGhlIGZpcnN0Cmluc3RhbmNlIG9mIGEgTlVMTCBkZXJlZmVuY2Uu
IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIGluc2lkZQp0aGlua3BhZF9hY3BpIHdlIGRvIHJl
YWNoIHJma2lsbF9yZWdpc3RlcigpLCB3aGljaCBpcyBsaW5lCgogMTIyNyAgICAgICAgIHJlcyA9
IHJma2lsbF9yZWdpc3RlcihhdHBfcmZrLT5yZmtpbGwpOwoKYW5kIEkgaW1hZ2luZSB0aGUgUklQ
IGhhcHBlbnMgd2hlbiBkZXZpY2VfYWRkKCkgdHJpZXMgdG8gZ2V0IGEgcmVmZXJlbmNlCnRvIHRo
ZSBwYXJlbnQgb2YgdGhlIGFsbG9jYXRlZCByZmtpbGwgZGV2aWNlLiBCdXQgaXQncyB3ZWlyZCBi
ZWNhdXNlIHdlCnNob3VsZG4ndCBldmVuIHJlYWNoIDEyMjcsIGFzIHRoZSBOVUxMIGRlcmVmIGZp
cnN0IGhhcHBlbnMgYXQgMTE5OS4KCk5VTEwgZGVyZWYgaXMgVUIgc28gSSBndWVzcyBpdCBtYWtl
cyBzZW5zZT8KCkJUVyBJIGdvdCBhbGwgdGhlc2UgbGluZSBudW1iZXJzIHVzaW5nIHRoZSBiYXNl
IGNvbW1pdC4KCi0tIAogfiBLdXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
