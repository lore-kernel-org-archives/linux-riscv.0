Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015A4C369A2
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 14:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGw1VYU75cTcza3bNNf2Rq3Jhwog5DNQdRIHAEoicn0=; b=tUSqtafCreUhYd
	qz48rn0SH08DJG+CVa8mZv311WDDDFzNEIGke/j9rcz4RR2bJfEEdWgYa2jU0RVxB8HUX52eqgTSJ
	PbebXkxMqEIBOJKLHpvcjfI3pmH+Yv123lClsCKEyQIEk44MQOnTr8DkQQ3rxpoMdFUXG+yA9olsT
	/bJ7bSZuEFtZSGZFzHdTdd8y1ocCv6VGBo3uY5TZpG/OvpO6SfTgU8R+SLJo+p4UOYQ4RRjqK5vcA
	XyfnfmfC6vmViLU8nJD0V71m+WVI5G/cBni6HyAAt1ev4sHuh9TOrWOXeKVgevW9xSy/dK1Jao0d7
	5ZCDXcv2UUPuo+nRJ2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29ZL-00000004JOy-3XoP;
	Tue, 08 Apr 2025 14:04:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29Qf-00000004HhA-3ggt
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 13:55:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3965c995151so2802888f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744120551; x=1744725351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKIKzdAk3P2Y6YQbz9/8N2BLD9HfzvL0US6679wvjAc=;
        b=38lECjLypBuEn0p42UjDXNsgcGdmzE+04x9XodYe1K2jlcpNwiIiUB+gF5vKmTttf8
         qHZ4HkjUnSmHMCo6MT105SPL6ZoK2YQ87rWa8orvmnF6Fo0KM0xcsOL6UA6r/AwWLqzy
         kmZwV5954TcB3evieDukGK2ITq+bVjT3dPh3j1RoSnwdFNN6POSQIPr7tQm4zE+uMAS9
         pgg8KpsHT3vNSZxkW/1YWQ5E6IX06YNL2qSOAfrcOxcpnrNs7MjJWANv5mcEhvn8HfHm
         H+SnolLxkKBpPDv64fIVvtcvHL4hdfHNHVQKJqwrrO2gBOCyZobS5WAZoc9TjO5FSMYU
         8TqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120551; x=1744725351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKIKzdAk3P2Y6YQbz9/8N2BLD9HfzvL0US6679wvjAc=;
        b=a1uo+V92hTIBXqTfzDoNGJiKv79BEl8WOGnd9oDmQdUwlN48xJu2NatRaH2EjZdA4T
         tDIiUduhTbmBiwxO8HmJrBUHMs+cUFcJa52/FkhxBulETk9o0lsp304c7YzSM2jqkGJ3
         R7MZvKBrogmQUjA5SWV+9VnpJcz/yjLwtR4ufk55cF8bv22z5dV6YBLpwTc0Z21Rn5D8
         gz+ZOFaIQd/PDILTE7qtgUaqszq00caV2y5KAjXZ71H9dK92wgcq2TILXLt/zfxli5OX
         xeTiYZpuWjH1YPqOaFlGQQD42UfO2e0CQds1s8/rV6RJbVEwRJV9fL4b8qPZAMoi8jKV
         9N/g==
X-Forwarded-Encrypted: i=1; AJvYcCVMfiAhGBvscdhdGUR2rpUII3mcEfSUM42+2Oh4pOY02ZnpXuWGfgX+k63s8lUGAHXHMGcnz410gKuRRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLvFKwfCy0OfIdsOo4p9O2E/98IQzh3i72OMz8XbWSI4yz1D1w
	dagoB8rOrOpvhHmHUzn1LTuLQoRT1eaP04qH9wBGxOC2u0UJ+pteLnR8vfkONMDa/v658Mrdnc2
	xyJsqbqnyfohOSORBnHLNa0sGFzZEBykvXWdg
X-Gm-Gg: ASbGncuuC8VgFM9SW6EWWyF9oa3yGbXhYjJ2hqhgrBGmxuoTxjZ/+g7wcUa2LyiMbcC
	IBYbRJ9M/IWpaI+fXvk+HOUAiklTMuL7Q+Pu9zVf9zcS729hzYajI7U37n0y7gsu8eKLUL1dFzO
	qZqgU6/M5IZXFPGwVhvIb26JullEA+r5GnykU1xt+YoENFQR40HKmMczS/
X-Google-Smtp-Source: AGHT+IGe1he6VcB1HjanCrhxVAfQjIesMa6esygphkYmjhBdMP180Rn3O9/cuFUiPeqzOl258PSQo96dNzHqinw3Rqo=
X-Received: by 2002:a05:6000:1888:b0:39a:c80b:8288 with SMTP id
 ffacd0b85a97d-39d6fc83ac7mr10495756f8f.33.1744120551236; Tue, 08 Apr 2025
 06:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250305110814.272792-1-fujita.tomonori@gmail.com> <20250305110814.272792-5-fujita.tomonori@gmail.com>
In-Reply-To: <20250305110814.272792-5-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Apr 2025 15:55:38 +0200
X-Gm-Features: ATxdqUHiYJtkNt0G-spjemExiwLroDOvAjC-UywxGL0GYlMeas4Df-5aHcFmNEQ
Message-ID: <CAH5fLgiDx5CQQMv=k=ejFYGM=ey1-dgQ44s1Ej1k2+mL7vnZaA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] rust: Add warn_on macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_065553_909974_512DAE1E 
X-CRM114-Status: GOOD (  19.34  )
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

T24gV2VkLCBNYXIgNSwgMjAyNSBhdCAxMjoxMOKAr1BNIEZVSklUQSBUb21vbm9yaQo8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgd2Fybl9vbiBtYWNybywgdXNlcyB0
aGUgQlVHL1dBUk4gZmVhdHVyZSAobGliL2J1Zy5jKSB2aWEgYXNzZW1ibHkKPiBmb3IgeDg2XzY0
L2FybTY0L3Jpc2N2Lgo+Cj4gVGhlIGN1cnJlbnQgUnVzdCBjb2RlIHNpbXBseSB3cmFwcyBCVUco
KSBtYWNybyBidXQgZG9lc24ndCBwcm92aWRlIHRoZQo+IHByb3BlciBkZWJ1ZyBpbmZvcm1hdGlv
bi4gVGhlIEJVRy9XQVJOIGZlYXR1cmUgY2FuIG9ubHkgYmUgdXNlZCBmcm9tCj4gYXNzZW1ibHku
Cj4KPiBUaGlzIHVzZXMgdGhlIGFzc2VtYmx5IGNvZGUgZXhwb3J0ZWQgYnkgdGhlIEMgc2lkZSB2
aWEgQVJDSF9XQVJOX0FTTQo+IG1hY3JvLiBUbyBhdm9pZCBkdXBsaWNhdGluZyB0aGUgYXNzZW1i
bHkgY29kZSwgdGhpcyBhcHByb2FjaCBmb2xsb3dzCj4gdGhlIHNhbWUgc3RyYXRlZ3kgYXMgdGhl
IHN0YXRpYyBicmFuY2ggY29kZTogaXQgZ2VuZXJhdGVzIHRoZSBhc3NlbWJseQo+IGNvZGUgZm9y
IFJ1c3QgdXNpbmcgdGhlIEMgcHJlcHJvY2Vzc29yIGF0IGNvbXBpbGUgdGltZS4KPgo+IFNpbWls
YXJseSwgQVJDSF9XQVJOX1JFQUNIQUJMRSBpcyBhbHNvIHVzZWQgYXQgY29tcGlsZSB0aW1lIHRv
Cj4gZ2VuZXJhdGUgdGhlIGFzc2VtYmx5IGNvZGU7IG9ianRvb2wncyByZWFjaGFibGUgYW5vdGF0
aW9uIGNvZGUuIEl0J3MKPiB1c2VkIGZvciBvbmx5IGFyY2hpdGVjdHVyZXMgdGhhdCB1c2Ugb2Jq
dG9vbC4KPgo+IEZvciBub3csIExvb25nYXJjaCBqdXN0IHVzZXMgYSB3cmFwcGVyIGZvciBXQVJO
IG1hY3JvLgo+Cj4gVU1MIGRvZXNuJ3QgdXNlIHRoZSBhc3NlbWJseSBCVUcvV0FSTiBmZWF0dXJl
OyBqdXN0IHdyYXBwaW5nIGdlbmVyaWMKPiBCVUcvV0FSTiBmdW5jdGlvbnMgaW1wbGVtZW50ZWQg
aW4gQyB3b3Jrcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEZVSklUQSBUb21vbm9yaSA8ZnVqaXRhLnRv
bW9ub3JpQGdtYWlsLmNvbT4KCk92ZXJhbGwgbG9va3MgcmVhc29uYWJsZS4gQSBmZXcgbml0cyBi
ZWxvdzoKCj4gKyNbbWFjcm9fZXhwb3J0XQo+ICsjW2RvYyhoaWRkZW4pXQo+ICsjW2NmZyhhbGwo
Q09ORklHX0JVRywgbm90KENPTkZJR19VTUwpLCBub3QoQ09ORklHX0xPT05HQVJDSCkpKV0KPiAr
I1tjZmcoQ09ORklHX0RFQlVHX0JVR1ZFUkJPU0UpXQo+ICttYWNyb19ydWxlcyEgd2Fybl9mbGFn
cyB7Cj4gKyAgICAoJGZsYWdzOmV4cHIpID0+IHsKPiArICAgICAgICBjb25zdCBGTEFHUzogdTMy
ID0gJGNyYXRlOjpiaW5kaW5nczo6QlVHRkxBR19XQVJOSU5HIHwgJGZsYWdzOwo+ICsgICAgICAg
IGNvbnN0IF9GSUxFOiAmW3U4XSA9IGZpbGUhKCkuYXNfYnl0ZXMoKTsKPiArICAgICAgICAvLyBQ
bHVzIG9uZSBmb3IgbnVsbC10ZXJtaW5hdG9yLgo+ICsgICAgICAgIHN0YXRpYyBGSUxFOiBbdTg7
IF9GSUxFLmxlbigpICsgMV0gPSB7Cj4gKyAgICAgICAgICAgIGxldCBtdXQgYnl0ZXMgPSBbMDsg
X0ZJTEUubGVuKCkgKyAxXTsKPiArICAgICAgICAgICAgbGV0IG11dCBpID0gMDsKPiArICAgICAg
ICAgICAgd2hpbGUgaSA8IF9GSUxFLmxlbigpIHsKPiArICAgICAgICAgICAgICAgIGJ5dGVzW2ld
ID0gX0ZJTEVbaV07Cj4gKyAgICAgICAgICAgICAgICBpICs9IDE7Cj4gKyAgICAgICAgICAgIH0K
PiArICAgICAgICAgICAgYnl0ZXMKPiArICAgICAgICB9Owo+ICsgICAgICAgIC8vIFNBRkVUWTog
SnVzdCBhbiBGRkkgY2FsbC4KPiArICAgICAgICB1bnNhZmUgewo+ICsgICAgICAgICAgICAkY3Jh
dGU6OmFzbSEoY29uY2F0ISgKPiArICAgICAgICAgICAgICAgICIvKiB7c2l6ZX0gKi8iLAo+ICsg
ICAgICAgICAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJPQkpUUkVFIiksICIvcnVzdC9r
ZXJuZWwvZ2VuZXJhdGVkX2FyY2hfd2Fybl9hc20ucnMiKSksCj4gKyAgICAgICAgICAgICAgICBp
bmNsdWRlIShjb25jYXQhKGVudiEoIk9CSlRSRUUiKSwgIi9ydXN0L2tlcm5lbC9nZW5lcmF0ZWRf
YXJjaF9yZWFjaGFibGVfYXNtLnJzIikpKTsKPiArICAgICAgICAgICAgZmlsZSA9IHN5bSBGSUxF
LAo+ICsgICAgICAgICAgICBsaW5lID0gY29uc3QgbGluZSEoKSwKPiArICAgICAgICAgICAgZmxh
Z3MgPSBjb25zdCBGTEFHUywKPiArICAgICAgICAgICAgc2l6ZSA9IGNvbnN0IDo6Y29yZTo6bWVt
OjpzaXplX29mOjo8JGNyYXRlOjpiaW5kaW5nczo6YnVnX2VudHJ5PigpLAoKVGhlIGluZGVudGF0
aW9uIGhlcmUgaXMgb2RkLiBTaG91bGRuJ3QgdGhlIGFyZ3VtZW50cyBiZSBpbmRlbnRlZCBvbmUg
bW9yZT8KCj4gKyAgICAgICAgICAgICk7Cj4gKyAgICAgICAgfQo+ICsgICAgfQo+ICt9Cj4gKwo+
ICsjW21hY3JvX2V4cG9ydF0KPiArI1tkb2MoaGlkZGVuKV0KPiArI1tjZmcoYWxsKENPTkZJR19C
VUcsIG5vdChDT05GSUdfVU1MKSwgbm90KENPTkZJR19MT09OR0FSQ0gpKSldCj4gKyNbY2ZnKG5v
dChDT05GSUdfREVCVUdfQlVHVkVSQk9TRSkpXQo+ICttYWNyb19ydWxlcyEgd2Fybl9mbGFncyB7
Cj4gKyAgICAoJGZsYWdzOmV4cHIpID0+IHsKPiArICAgICAgICBjb25zdCBGTEFHUzogdTMyID0g
JGNyYXRlOjpiaW5kaW5nczo6QlVHRkxBR19XQVJOSU5HIHwgJGZsYWdzOwo+ICsgICAgICAgIC8v
IFNBRkVUWTogSnVzdCBhbiBGRkkgY2FsbC4KPiArICAgICAgICB1bnNhZmUgewo+ICsgICAgICAg
ICAgICAkY3JhdGU6OmFzbSEoCj4gKyAgICAgICAgICAgIGNvbmNhdCEoCj4gKyAgICAgICAgICAg
ICAgICAiLyoge3NpemV9ICovIiwKPiArICAgICAgICAgICAgICAgIGluY2x1ZGUhKGNvbmNhdCEo
ZW52ISgiT0JKVFJFRSIpLCAiL3J1c3Qva2VybmVsL2dlbmVyYXRlZF9hcmNoX3dhcm5fYXNtLnJz
IikpLAo+ICsgICAgICAgICAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJPQkpUUkVFIiks
ICIvcnVzdC9rZXJuZWwvZ2VuZXJhdGVkX2FyY2hfcmVhY2hhYmxlX2FzbS5ycyIpKSk7Cj4gKyAg
ICAgICAgICAgIGZsYWdzID0gY29uc3QgRkxBR1MsCj4gKyAgICAgICAgICAgIHNpemUgPSBjb25z
dCA6OmNvcmU6Om1lbTo6c2l6ZV9vZjo6PCRjcmF0ZTo6YmluZGluZ3M6OmJ1Z19lbnRyeT4oKSwK
ClNhbWUgdGhpbmcgaGVyZS4KCj4gKyAgICAgICAgICAgICk7Cj4gKyAgICAgICAgfQo+ICsgICAg
fQo+ICt9Cj4gKwo+ICsjW21hY3JvX2V4cG9ydF0KPiArI1tkb2MoaGlkZGVuKV0KPiArI1tjZmco
YWxsKENPTkZJR19CVUcsIENPTkZJR19VTUwpKV0KPiArbWFjcm9fcnVsZXMhIHdhcm5fZmxhZ3Mg
ewo+ICsgICAgKCRmbGFnczpleHByKSA9PiB7Cj4gKyAgICAgICAgLy8gU0FGRVRZOiBKdXN0IGFu
IEZGSSBjYWxsLgo+ICsgICAgICAgIHVuc2FmZSB7Cj4gKyAgICAgICAgICAgICRjcmF0ZTo6Ymlu
ZGluZ3M6Ondhcm5fc2xvd3BhdGhfZm10KAo+ICsgICAgICAgICAgICAgICAgJGNyYXRlOjpjX3N0
ciEoOjpjb3JlOjpmaWxlISgpKS5hc19wdHIoKSBhcyAqY29uc3QgOjpjb3JlOjpmZmk6OmNfdWNo
YXIsCj4gKyAgICAgICAgICAgICAgICBsaW5lISgpIGFzIGkzMiwKPiArICAgICAgICAgICAgICAg
ICRmbGFncyBhcyB1MzIsCj4gKyAgICAgICAgICAgICAgICA6OmNvcmU6OnB0cjo6bnVsbCgpIGFz
ICpjb25zdCA6OmNvcmU6OmZmaTo6Y191Y2hhciwKCldoeSB1bnNpZ25lZCBjaGFyPyBJIHRoaW5r
IHRoaXMgc2hvdWxkIGJlIDo6a2VybmVsOjpmZmk6OmNfY2hhciB0bwp1dGlsaXplIHRoZSBjdXN0
b20gaW50ZWdlciB0eXBlIGRlZmluaXRpb25zIGluIGtlcm5lbCByYXRoZXIgdGhhbiB0aGUKZmF1
bHR5IG9uZXMgaW4gY29yZS4KCihNYXliZSAkY3JhdGUgcmF0aGVyIHRoYW4ga2VybmVsKQoKQWxp
Y2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
