Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D8AE77181
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/r8kZBsaWcB7VMb7wbDRQFIEY3uBoZLfaJkFpG2WFsU=; b=MlPG0c+bGRNEav
	kMCZW/u/FQ5HMayHwF2KHBTEkjjWSN1gTZGX8vhzjlZijKkxWKKdjBoZtUOwOsywsIJppeG2sGcXY
	NdcUsTSLJdwtS7UtqOgGgzERGYXDYA5n4QZrmV+5gS/DSWZa8oU6CemnWAdryOvAONpmp03blbQzm
	jvCMEjgcFe89R87JyG6SVah008/MNDdeO9d2gX7ICA7HL9wF8/6aCADrbGZZ0ZPCaSHqQuZtSyfQz
	NgSrptm2WGNt6d1O45L+KcPvYteLE35jGc7VkeQaJv7wDwyvHccmo5tpCqP6s7nyu2drXgWcI2p+2
	O/G3KOTC91IEu9gvUMNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbta-00000007UBx-2MTJ;
	Mon, 09 Dec 2024 11:25:46 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbtX-00000007UBU-36f4
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 11:25:44 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-725dbdf380aso1039870b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 03:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733743543; x=1734348343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHA4rrhpw4mCY6t+0KbwKHvWRS59L5Y67TgqrsNDQ+Y=;
        b=JzNrUQhVYlMF3iRb05MqtJ3CNocrA9lu+n9W94VVcoP4hAe/oSniq+6UfXNivCb1OQ
         4Zizz3jsVBwxGe/9BcI1hdHWce5CuQTQRlnFfvwiv6VfuV9kBNl3LLWoKKEtxWZl3PYa
         HiDRhYdDvJSayKJEkdSUqoce80ytE/e7IzOASLo8jmD3v7wa3ok+bcxhk6He97rfq7bp
         LBjFQ87IquQE83k4/TUUOwhT+zGNxNSdqU0Kl/qYGnxzYEsej0eHrzAOAWi5i+20GOTp
         C2lA5umZRCXYmUjnxdHXmboa5gKoAqzmb3sBQKffwaUumiHgXMte4i9LkhiuxAeHH9zB
         t7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733743543; x=1734348343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHA4rrhpw4mCY6t+0KbwKHvWRS59L5Y67TgqrsNDQ+Y=;
        b=gt2cIra/WDdDswN9BoJZhSnk/GYx+f70MkKqiHK09W8bln5N1EcfwgkvxKjPSWh90T
         qx1JcTAsWy2TZhamHMUhTLgKS8xBRRDSOxkbrsklczwCfs0ndTA3c0FPIf0pQaHW7N2Q
         0wpXqvapq5sdGZsZv3MsK7pAYLiO9VutyVY4CTFJQbHNGv+VsQ85jJ/MHnjPks78wg7B
         fEP64qNB1dph5sh0mY+6+TD1wSMcNSF5xrn310KejiDgaQNkczp7qfUW72wjUyggpUD6
         kb6oJH/G5Bg+I8aTHYC4Ua4vBUnvZ4oCQTRPlupa0NNnQrnJkpbW1w3STcc2K3qmzzRK
         +XjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKp2jeDhNXlnM5wQ+iH54eg48cL24sqUhXUUKDG/UChTbjj56aCDzMAH4lolJDMm/gbz5TKnTD8Xxv3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBKITQ0dFo2Bt2gvpwXxwwe2Cb5wwxJgqOQUrE8olcs7p+BZK+
	5tTkfD8MUJDJLpPwirhsRLGO77TDvHJaBYVX/NqoTiIBImUXrwCC7uXwpxvZ51uFcizFn1lHt81
	mPVlRmr+qwTnfveyvnXvlb34pRkNtg7/x1w0V9Q==
X-Gm-Gg: ASbGncuTiDxwv20kmS4j/brwK8F0QpBdlxBi3yuGahKUNBRMF5QMdpLiyBTDgmS9OYX
	gazu/WQXdZVyLjY2LJhDLXCp4kQ1rOto+qPvpgxxE/hi7
X-Google-Smtp-Source: AGHT+IG8bMdzF45gcwEEZOjAJoVHDLPDa6nJ81G1ZY5gzgAVgddnasKv7aHmuriiRk3f+tGQFELcJ98uM8ovGQvjKJg=
X-Received: by 2002:a05:6a21:999c:b0:1e1:a716:3157 with SMTP id
 adf61e73a8af0-1e1b1ad1142mr49912637.17.1733743542812; Mon, 09 Dec 2024
 03:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20241209095113.41154-1-luxu.kernel@bytedance.com> <87v7vtw234.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87v7vtw234.fsf@all.your.base.are.belong.to.us>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 9 Dec 2024 19:25:32 +0800
Message-ID: <CAPYmKFtq4zT4Jk0QyGnZacQJ=6JY-kgQuiGYrbjsfDE+r36QBA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] riscv: mm: Fix the out of bound issue
 of vmemmap address
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, alexghiti@rivosinc.com, 
	bjorn@rivosinc.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_032543_786719_884840DC 
X-CRM114-Status: GOOD (  29.09  )
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

SGkgQmrDtnJuLAoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQuIElzIGl0IE9LIHRvIGludHJvZHVj
ZSB0aGUgbmV3IGFuZCB1bnVzZWQKdmFyaWFibGUgJ3ZtZW1tYXBfc3RhcnRfcGZuJyB3aGVuIENP
TkZJR19TUEFSU0VNRU1fVk1FTU1BUCBpcwpkaXNhYmxlZD8KCk9uIE1vbiwgRGVjIDksIDIwMjQg
YXQgNzowM+KAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4g
TWlub3Igbml0cyBiZWxvdzsgVG9vIG1hbnkgaWZkZWZzLgo+Cj4gWHUgTHUgPGx1eHUua2VybmVs
QGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKPgo+ID4gSW4gc3BhcnNlIHZtZW1tYXAgbW9kZWwsIHRo
ZSB2aXJ0dWFsIGFkZHJlc3Mgb2Ygdm1lbW1hcCBpcyBjYWxjdWxhdGVkIGFzOgo+ID4gKChzdHJ1
Y3QgcGFnZSAqKVZNRU1NQVBfU1RBUlQgLSAocGh5c19yYW1fYmFzZSA+PiBQQUdFX1NISUZUKSku
Cj4gPiBBbmQgdGhlIHN0cnVjdCBwYWdlJ3MgdmEgY2FuIGJlIGNhbGN1bGF0ZWQgd2l0aCBhbiBv
ZmZzZXQ6Cj4gPiAodm1lbW1hcCArIChwZm4pKS4KPiA+Cj4gPiBIb3dldmVyLCB3aGVuIGluaXRp
YWxpemluZyBzdHJ1Y3QgcGFnZXMsIGtlcm5lbCBhY3R1YWxseSBzdGFydHMgZnJvbSB0aGUKPiA+
IGZpcnN0IHBhZ2UgZnJvbSB0aGUgc2FtZSBzZWN0aW9uIHRoYXQgcGh5c19yYW1fYmFzZSBiZWxv
bmdzIHRvLiBJZiB0aGUKPiA+IGZpcnN0IHBhZ2UncyBwaHlzaWNhbCBhZGRyZXNzIGlzIG5vdCAo
cGh5c19yYW1fYmFzZSA+PiBQQUdFX1NISUZUKSwgdGhlbgo+ID4gd2UgZ2V0IGFuIHZhIGJlbG93
IFZNRU1NQVBfU1RBUlQgd2hlbiBjYWxjdWxhdGluZyB2YSBmb3IgaXQncyBzdHJ1Y3QgcGFnZS4K
PiA+Cj4gPiBGb3IgZXhhbXBsZSwgaWYgcGh5c19yYW1fYmFzZSBzdGFydHMgZnJvbSAweDgyMDAw
MDAwIHdpdGggcGZuIDB4ODIwMDAsIHRoZQo+ID4gZmlyc3QgcGFnZSBpbiB0aGUgc2FtZSBzZWN0
aW9uIGlzIGFjdHVhbGx5IHBmbiAweDgwMDAwLiBEdXJpbmcKPiA+IGluaXRfdW5hdmFpbGFibGVf
cmFuZ2UoKSwgd2Ugd2lsbCBpbml0aWFsaXplIHN0cnVjdCBwYWdlIGZvciBwZm4gMHg4MDAwMAo+
ID4gd2l0aCB2aXJ0dWFsIGFkZHJlc3MgKChzdHJ1Y3QgcGFnZSAqKVZNRU1NQVBfU1RBUlQgLSAw
eDIwMDApLCB3aGljaCBpcwo+ID4gYmVsb3cgVk1FTU1BUF9TVEFSVCBhcyB3ZWxsIGFzIFBDSV9J
T19FTkQuCj4gPgo+ID4gVGhpcyBjb21taXQgZml4ZXMgdGhpcyBidWcgYnkgaW50cm9kdWNpbmcg
YSBuZXcgdmFyaWFibGUKPiA+ICd2bWVtbWFwX3N0YXJ0X3Bmbicgd2hpY2ggaXMgYWxpZ25lZCB3
aXRoIG1lbW9yeSBzZWN0aW9uIHNpemUgYW5kIHVzaW5nCj4gPiBpdCB0byBjYWxjdWxhdGUgdm1l
bW1hcCBhZGRyZXNzIGluc3RlYWQgb2YgcGh5c19yYW1fYmFzZS4KPiA+Cj4gPiBGaXhlczogYTEx
ZGQ0OWRjYjkzICgicmlzY3Y6IFNwYXJzZS1NZW1vcnkvdm1lbW1hcCBvdXQtb2YtYm91bmRzIGZp
eCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4K
PiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oICAgIHwgIDQgKysrKwo+
ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgIDQgKysrLQo+ID4gIGFyY2gv
cmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrCj4gPiAg
MyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wYWdlLmgKPiA+IGluZGV4IDcxYWFiYzVjNjcxMy4uYTFiZTFhZGNmYjg1IDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4gPiBAQCAtMTIzLDYgKzEyMywxMCBAQCBzdHJ1
Y3Qga2VybmVsX21hcHBpbmcgewo+ID4gIGV4dGVybiBzdHJ1Y3Qga2VybmVsX21hcHBpbmcga2Vy
bmVsX21hcDsKPiA+ICBleHRlcm4gcGh5c19hZGRyX3QgcGh5c19yYW1fYmFzZTsKPiA+Cj4gPiAr
I2lmZGVmIENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUAo+Cj4gTm90IG5lZWRlZCwgYW5kIHNob3Vs
ZCBiZSByZW1vdmVkLgo+Cj4gPiArZXh0ZXJuIHVuc2lnbmVkIGxvbmcgdm1lbW1hcF9zdGFydF9w
Zm47Cj4gPiArI2VuZGlmCj4gPiArCj4gPiAgI2RlZmluZSBpc19rZXJuZWxfbWFwcGluZyh4KSBc
Cj4gPiAgICAgICAoKHgpID49IGtlcm5lbF9tYXAudmlydF9hZGRyICYmICh4KSA8IChrZXJuZWxf
bWFwLnZpcnRfYWRkciArIGtlcm5lbF9tYXAuc2l6ZSkpCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKPiA+IGluZGV4IGQ0ZTk5ZWVmOTBhYy4uZTJkYmQ0YjlhNjg2IDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBAQCAtODcsNyArODcsOSBAQAo+ID4gICAqIERl
ZmluZSB2bWVtbWFwIGZvciBwZm5fdG9fcGFnZSAmIHBhZ2VfdG9fcGZuIGNhbGxzLiBOZWVkZWQg
aWYga2VybmVsCj4gPiAgICogaXMgY29uZmlndXJlZCB3aXRoIENPTkZJR19TUEFSU0VNRU1fVk1F
TU1BUCBlbmFibGVkLgo+ID4gICAqLwo+ID4gLSNkZWZpbmUgdm1lbW1hcCAgICAgICAgICAgICAg
KChzdHJ1Y3QgcGFnZSAqKVZNRU1NQVBfU1RBUlQgLSAocGh5c19yYW1fYmFzZSA+PiBQQUdFX1NI
SUZUKSkKPiA+ICsjaWZkZWYgQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQCj4KPiBEaXRvLCBwbGVh
c2UgcmVtb3ZlLgo+Cj4gPiArI2RlZmluZSB2bWVtbWFwICAgICAgICAgICAgICAoKHN0cnVjdCBw
YWdlICopVk1FTU1BUF9TVEFSVCAtIHZtZW1tYXBfc3RhcnRfcGZuKQo+ID4gKyNlbmRpZgo+ID4K
PiA+ICAjZGVmaW5lIFBDSV9JT19TSVpFICAgICAgU1pfMTZNCj4gPiAgI2RlZmluZSBQQ0lfSU9f
RU5EICAgICAgIFZNRU1NQVBfU1RBUlQKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2lu
aXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBpbmRleCAwZThjMjBhZGNkOTguLmU3YzUy
ZDY0N2Y1MCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiArKysgYi9h
cmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTMyLDYgKzMyLDkgQEAKPiA+ICAjaW5jbHVkZSA8
YXNtL251bWEuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3BndGFibGUuaD4KPiA+ICAjaW5jbHVkZSA8
YXNtL3NlY3Rpb25zLmg+Cj4gPiArI2lmZGVmIENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUAo+Cj4g
Tm90IG5lZWRlZCwgcGxlYXNlIHJlbW92ZS4KPgo+ID4gKyNpbmNsdWRlIDxhc20vc3BhcnNlbWVt
Lmg+Cj4gPiArI2VuZGlmCj4gPiAgI2luY2x1ZGUgPGFzbS9zb2MuaD4KPiA+ICAjaW5jbHVkZSA8
YXNtL3RsYmZsdXNoLmg+Cj4gPgo+ID4gQEAgLTYyLDYgKzY1LDEzIEBAIEVYUE9SVF9TWU1CT0wo
cGd0YWJsZV9sNV9lbmFibGVkKTsKPiA+ICBwaHlzX2FkZHJfdCBwaHlzX3JhbV9iYXNlIF9fcm9f
YWZ0ZXJfaW5pdDsKPiA+ICBFWFBPUlRfU1lNQk9MKHBoeXNfcmFtX2Jhc2UpOwo+ID4KPiA+ICsj
aWZkZWYgQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQCj4gPiArI2RlZmluZSBWTUVNTUFQX0FERFJf
QUxJR04gICAoMVVMTCA8PCBTRUNUSU9OX1NJWkVfQklUUykKPiA+ICsKPiA+ICt1bnNpZ25lZCBs
b25nIHZtZW1tYXBfc3RhcnRfcGZuIF9fcm9fYWZ0ZXJfaW5pdDsKPiA+ICtFWFBPUlRfU1lNQk9M
KHZtZW1tYXBfc3RhcnRfcGZuKTsKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICB1bnNpZ25lZCBsb25n
IGVtcHR5X3plcm9fcGFnZVtQQUdFX1NJWkUgLyBzaXplb2YodW5zaWduZWQgbG9uZyldCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX3Bh
Z2VfYWxpZ25lZF9ic3M7Cj4gPiAgRVhQT1JUX1NZTUJPTChlbXB0eV96ZXJvX3BhZ2UpOwo+ID4g
QEAgLTI0Myw2ICsyNTMsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9p
ZCkKPiA+ICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfWElQX0tFUk5FTCkpCj4gPiAgICAg
ICAgICAgICAgIHBoeXNfcmFtX2Jhc2UgPSBtZW1ibG9ja19zdGFydF9vZl9EUkFNKCkgJiBQTURf
TUFTSzsKPiA+Cj4gPiArI2lmZGVmIENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUAo+ID4gKyAgICAg
aWYgKCFJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVMKSkKPiA+ICsgICAgICAgICAgICAgdm1l
bW1hcF9zdGFydF9wZm4gPSByb3VuZF9kb3duKHBoeXNfcmFtX2Jhc2UsIFZNRU1NQVBfQUREUl9B
TElHTikgPj4gUEFHRV9TSElGVDsKPiA+ICsjZW5kaWYKPiA+ICsKPgo+IFBsZWFzZSBmb2xkIHRo
aXMgaW50byB0aGUgaWYtc3RhdGVtZW50IGFib3ZlLCBlLmcuOgo+ICAgfCAgICAgICAgIGlmICgh
SVNfRU5BQkxFRChDT05GSUdfWElQX0tFUk5FTCkpIHsKPiAgIHwgICAgICAgICAgICAgICAgIHBo
eXNfcmFtX2Jhc2UgPSBtZW1ibG9ja19zdGFydF9vZl9EUkFNKCkgJiBQTURfTUFTSzsKPiAgIHwg
I2lmIGRlZmluZWQoQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQKQo+ICAgfCAgICAgICAgICAgICAg
ICAgdm1lbW1hcF9zdGFydF9wZm4gPSByb3VuZF9kb3duKHBoeXNfcmFtX2Jhc2UsIFZNRU1NQVBf
QUREUl9BTElHTikgPj4gUEFHRV9TSElGVDsKPiAgIHwgI2VuZGlmCj4gICB8ICAgICAgICAgfQo+
Cj4KPiBCasO2cm4KCkJlc3QgUmVnYXJkcywKClh1IEx1CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
