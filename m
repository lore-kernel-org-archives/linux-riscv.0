Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAECC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5qdvCokw9z05rclPOTll87VKzkaRLSeTn1QcaMt0iQ=; b=YjZ4pQSCIAU3S1
	ZgJYnP1zWkEKFGlx04x1Pj/EmKjdirgcBD+eRmGTw6pp7jxR2SdO7YkJKh8YJl5pr7SxfRRh/Nuy+
	OeS3qOGj8+czGTON1cjTx1GhbCa+dW5XYoVaddY4sWk8nnkiM0fXg1yw6hEF4nZCikZ+oZR4x7hiS
	7xh37VjueB3hSRTFvewUQA90YVKV1Y7PDq5BD3T5TlNn4K3a6IyxKFx76oo3oDCHanFnbGKpEoD9H
	oJE50mxgjfNLdes00dj6iANirnN20NneNs54ZjzbaTjvijucb/36EMTieMLDlGi6B1/VaDBTGoRJF
	NfGWQ7EXVlK0mIw7CZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRJb-00000002GUq-2dcb;
	Thu, 18 Apr 2024 12:56:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRJY-00000002GTI-29M5
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:56:34 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ecee1f325bso801406b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1713444989; x=1714049789; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZGKtTtTKQ/7Znmul1mkHwdqYW0+SJZLEn1PqGOozb0=;
        b=ADLB4l1D0LvtrrMbbs9VNBCmcsOOMlE17n4tTbVbZCkMYeAA7u6okKfpd9MlWJU6HE
         DP8r4Jxw4HE1FCpO8Q1kK7RcbjeVfI1StFXCs6RGobicJ26b/SiMz6EQLnKsxyrELxBS
         ztO4+zPSofcrX8UcWmRjWyLXPfNCMZP51+8n9rnFTr1gcNJTu1fxWiTPUcZ4qRHcSxUt
         3s6DI+5nBNWCl8er7+YVVTJxMGAQ/2AFVjsl0SV8S3DOZuZG9LgH0ygQlVEC8b1yZldU
         y4JPDOtOv4XRJUkWM5TFfIGzw+3ixWQ7Ek06gIObhzXXGS2w5u7ObxcyXnOBTDcx7+WX
         Uu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444989; x=1714049789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZGKtTtTKQ/7Znmul1mkHwdqYW0+SJZLEn1PqGOozb0=;
        b=wZ2W2wzpIXQYplU0UN5QSC1dcUp0K4s4OmHATZ6vc4NunA5ZNvPm8AywO623sEmJFU
         pfyxL5A0h4oSrIESYB1NBie90jUHZOgeTpk4nKaKJnqn5uGQ3u7PX7HKMnxD9cXS7UBP
         dUEdtF4j+5qlvXV/X3FEwknh0cjHx70krpShP4cnjM4bJhOx5OYXbo5CwH/ABLfWvKgg
         CewoOyhiHcw7DT3b7jWheV91HZ18UiIUr2d4VlB6mFaO8txYbO5Ta1YpbB1g0cGTjM4k
         fv+rDkKA5XIXDCuZfgQjQtjWVyIBitnP+tOpzezxblk6fPQiQEyCROb01VCL6tUiLM+p
         vulA==
X-Forwarded-Encrypted: i=1; AJvYcCWJYI37GX32o2CBkqxBvpuP99VUcTuVjPoyV0ZUfh4E9a4sr5CFYnDaQ2cLQiDHsBtW55bvCwZs02f2NT4hz37xvj2hL5i/DQSXa9R3V5Md
X-Gm-Message-State: AOJu0Yyibl4m4TiRZ3HT0nASrLcMhtHeEZ1nDMijsDRMXVehTb4VWNTd
	zfjr1eaN9NTf/5wJoXi4Q5p1Phhc1CfrvGXKpEz149AoW7my+8SReq10pdriSqWOUduiW2MQEKq
	hr2ptUC8IKpNo4HjnjkFDCZSe5F5789gP0uFApA==
X-Google-Smtp-Source: AGHT+IG6GxtpQKCYpAgXP5AnlMz+qAxDgM5gYopI2HcArvrJJoes+Kwuta+YB1wkg7pyxgzIbNPpXoDjsP+/f2Sk9Zw=
X-Received: by 2002:a05:6a00:189b:b0:6ed:1c7:8c61 with SMTP id
 x27-20020a056a00189b00b006ed01c78c61mr3623550pfh.12.1713444988686; Thu, 18
 Apr 2024 05:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <CAEg0e7gDk6SFRh4oF0KsA7xZoMr7RuZXFWL8qD7rmM2cBDLwcg@mail.gmail.com> <CAPYmKFsQQPCd-34GArHfC-Sv8PCYHgmZxprK3WHKnJquQDoXiQ@mail.gmail.com>
In-Reply-To: <CAPYmKFsQQPCd-34GArHfC-Sv8PCYHgmZxprK3WHKnJquQDoXiQ@mail.gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 18 Apr 2024 14:56:17 +0200
Message-ID: <CAEg0e7hpjAec=2k+PwJeb0WezmJCFdUD=HbCiGe7+RxKgPHgtg@mail.gmail.com>
Subject: Re: [External] Re: [RFC 0/2] riscv: Idle thread using Zawrs extension
To: Xu Lu <luxu.kernel@bytedance.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	andy.chiu@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lihangjing@bytedance.com, 
	dengliang.1214@bytedance.com, xieyongji@bytedance.com, 
	chaiwen.cc@bytedance.com, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_055632_574290_385483D5 
X-CRM114-Status: GOOD (  23.05  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMjo0NOKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDg6MjbigK9QTSBD
aHJpc3RvcGggTcO8bGxuZXIKPiA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PiB3cm90ZToK
PiA+Cj4gPiBPbiBUaHUsIEFwciAxOCwgMjAyNCBhdCAxOjUw4oCvUE0gWHUgTHUgPGx1eHUua2Vy
bmVsQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBp
bnRyb2R1Y2VzIGEgbmV3IGltcGxlbWVudGF0aW9uIG9mIGlkbGUgdGhyZWFkIHVzaW5nCj4gPiA+
IFphd3JzIGV4dGVuc2lvbi4KPiA+Cj4gPiBUaGlzIG92ZXJsYXBzIHdpdGggdGhlIGZvbGxvd2lu
ZyBzZXJpZXM6Cj4gPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMxNTEzNDAw
OS41ODAxNjctNy1ham9uZXNAdmVudGFuYW1pY3JvLmNvbS8KPgo+IEhpIENocmlzdG9waC4KPiBU
aGFua3MgZm9yIHlvdXIgcmVwbHkhCj4gQWN0dWFsbHkgb3VyIHBhdGNoIHNlcmllcyBpcyBkaWZm
ZXJlbnQgZnJvbSB0aGlzLiBUaGUgd29yayBmcm9tIHlvdXIKPiBsaW5rIGZvY3VzZXMgb24gcHJv
dmlkaW5nIHN1cHBvcnQgZm9yIFphd3JzIGFuZCBpbXBsZW1lbnRpbmcgc3BpbmxvY2sKPiB1c2lu
ZyBpdCwgd2hpbGUgb3VyIHdvcmsgZm9jdXNlcyBvbiBpbXBsZW1lbnRpbmcgaWRsZSB0aHJlYWQg
dXNpbmcKPiBaYXdycyBhbmQgYWNjZWxlcmF0aW5nIElQSSB0byBpZGxlIGNwdS4gT2YgY291cnNl
LCB0aGUgSVNBIFpBV1JTCj4gY29uZmlnIHBhcnQgY2FuIGJlIG1lcmdlZC4gV2Ugd2lsbCByZWZp
bmUgb3VyIGNvZGUgaW4gdGhlIG5leHQgdmVyc2lvbgo+IHRvIHJlZHVjZSBjb2RlIGNvbmZsaWN0
cy4KClllcywgSSd2ZSBzZWVuIHRoYXQgdGhpcyB0YXJnZXRzIGFub3RoZXIgb3B0aW1pemF0aW9u
LCBidXQgdGhlIGJhc2ljClphd3JzIHN1cHBvcnQKd291bGQgYmUgaWRlbnRpY2FsIHRvIHRoZSBv
dGhlciBwYXRjaHNldCAoZXZlbiBpZiBpdCBpcyBub3QpLgpJIHdvdWxkIHByb3Bvc2UgdGhhdCB3
ZSB3b3JrIG9uIGEgYmFzaWMgWmF3cnMgc3VwcG9ydCBwYXRjaHNldCB0aGF0IGludHJvZHVjZXMK
dGhlIEtjb25maWcsIERUUyBhbmQgaHdwcm9iZSBwYXJ0cyAoYSBzdWJzZXQgb2YgQW5kcmV3J3Mg
cGF0Y2hzZXQpLgpPbmNlIHRoaXMgaXMgbWVyZ2VkLCBhbGwgb3RoZXIgb3B0aW1pemF0aW9ucyBj
YW4gYmUgYnVpbHQgdXBvbiBpdAooc3BpbmxvY2tzLCBpZGxlIHRocmVhZCwgZ2xpYmMgQ1BVIHNw
aW5uaW5nKS4KSWYgdGhpcyBwcm9wb3NhbCBpcyBmaW5lIGZvciB0aGUgbWFpbnRhaW5lcnMvcmV2
aWV3ZXJzLCB0aGVuIEFuZHJldyBjb3VsZCByZXNlbmQKdGhlc2UgYmFzaWMtc3VwcG9ydCBwYXRj
aGVzLgoKQlIKQ2hyaXN0b3BoCgoKPgo+ID4KPiA+IEJSCj4gPiBDaHJpc3RvcGgKPiA+Cj4gPiA+
Cj4gPiA+IFRoZSBaYXdyc1swXSBleHRlbnNpb24gaW50cm9kdWNlcyB0d28gbmV3IGluc3RydWN0
aW9ucyBuYW1lZCBXUlMuU1RPIGFuZAo+ID4gPiBXUlMuTlRPIGluIFJJU0MtVi4gV2hlbiBzb2Z0
d2FyZSByZWdpc3RlcnMgYSByZXNlcnZhdGlvbiBzZXQgdXNpbmcgTFIKPiA+ID4gaW5zdHJ1Y3Rp
b24sIGEgc3Vic2VxdWVudCBXUlMuU1RPIG9yIFdSUy5OVE8gaW5zdHJ1Y3Rpb24gd2lsbCBjYXVz
ZSB0aGUKPiA+ID4gaGFydCB0byBzdGFsbCBpbiBhIGxvdy1wb3dlciBzdGF0ZSB1bnRpbCBhIHN0
b3JlIGhhcHBlbnMgdG8gdGhlCj4gPiA+IHJlc2VydmF0aW9uIHNldCBvciBhbiBpbnRlcnJ1cHQg
YmVjb21lcyBwZW5kaW5nLiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuCj4gPiA+IHRoZXNlIHR3byBp
bnN0cnVjdGlvbnMgaXMgdGhhdCBXUlMuU1RPIHdpbGwgdGVybWluYXRlIHN0YWxsIGFmdGVyIGFu
Cj4gPiA+IGltcGxlbWVudGF0aW9uLWRlZmluZWQgdGltZW91dCB3aGlsZSBXUlMuTlRPIHdvbid0
Lgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBpbXBsZW1lbnRzIGlkbGUgdGhyZWFkIHVz
aW5nIFdSUy5OVE8gaW5zdHJ1Y3Rpb24uCj4gPiA+IEJlc2lkZXMsIHdlIGZvdW5kIHRoZXJlIGlz
IG5vIG5lZWQgdG8gc2VuZCBhIHJlYWwgSVBJIHRvIHdha2UgdXAgYW4gaWRsZQo+ID4gPiBDUFUu
IEluc3RlYWQsIHdlIHdyaXRlIElQSSBpbmZvcm1hdGlvbiB0byB0aGUgcmVzZXJ2YXRpb24gc2V0
IG9mIGFuIGlkbGUKPiA+ID4gQ1BVIHRvIHdha2UgaXQgdXAgYW5kIGxldCBpdCBoYW5kbGUgSVBJ
IHF1aWNrbHksIHdpdGhvdXQgZ29pbmcgdGhyb3VnaAo+ID4gPiB0cmFuZGl0aW9uYWwgaW50ZXJy
dXB0IGhhbmRsaW5nIHJvdXRpbmUuCj4gPiA+Cj4gPiA+IFswXSBodHRwczovL2dpdGh1Yi5jb20v
cmlzY3YvcmlzY3YtemF3cnMvYmxvYi9tYWluL3phd3JzLmFkb2MKPiA+ID4KPiA+ID4gWHUgTHUg
KDIpOgo+ID4gPiAgIHJpc2N2OiBwcm9jZXNzOiBJbnRyb2R1Y2UgaWRsZSB0aHJlYWQgdXNpbmcg
WmF3cnMgZXh0ZW5zaW9uCj4gPiA+ICAgcmlzY3Y6IFVzZSBaYXdycyB0byBhY2NlbGVyYXRlIElQ
SSB0byBpZGxlIGNwdQo+ID4gPgo+ID4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAg
ICAgICB8ICAyNCArKysrKysrCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWlkbGUu
aCAgIHwgIDExICstLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAg
fCAgIDEgKwo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICAzMSAr
KysrKysrKysKPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc21wLmggICAgICAgfCAgMTQg
KysrKwo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgICAgICAgICAgICB8ICAgNSArKwo+
ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICB8ICAgMSArCj4gPiA+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgIHwgMTAyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYyAgICAgICAgICAgIHwg
IDM5ICsrKysrKystLS0tCj4gPiA+ICA5IGZpbGVzIGNoYW5nZWQsIDIwNSBpbnNlcnRpb25zKCsp
LCAyMyBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi4yMC4xCj4gPiA+Cj4gPiA+
Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
PiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
