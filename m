Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2199DC282CD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=timKdeH7vVSI8YcBpZbIyPlSU+BDp3BLQSGVxhyMvJI=; b=HsJyvjRz5KMR3G
	oqhcCdkKwwliBtgov54NISSGjWZYaAJ8OXWQRb6gcgvzAU3Zc4Yry0t7lUtBwc3aMpu9bibMa3S6m
	SP7T4/1RiTU0lF2bssx+t724ubLEU0+W6VI6Cb0qB/15Fpwfut1UnhnkiglSIf1Fx2qw+5kF1trRd
	aLWp2kaBbeb9hfkJTkOlOJ3aJWkelXYTr5sfgXPMsqt/29i+Y/NqW4DKfwDzozDSCneY+jiuTjiBg
	Nsk0U29fFppotOusUsL/0p/DB/ckkbc437aiIle8GHR4WlqaQNTh9q2Ew2c3/QQXm9km+JmhbUMTo
	JmJqQ+n60ap7XTlgQ4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6LU-000000010cf-0NyQ;
	Mon, 03 Mar 2025 14:00:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5vd-00000000wAw-3gmk
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 13:33:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3910e101d0fso532211f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 05:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741008831; x=1741613631; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98OQ8wvaJ9wtoqY/FnFWTw/2aTBVHaqyurEF1+7THsM=;
        b=nnBZLfULe6qgnTcnyfdsh2Wdoveis1fvfchH4BrtS9KBL43+Qwo6IE+EsGh51kO5bc
         rxBZSOU9vpDurYEcs27mN8C7fjV+JLbM4USo5ac/M3XRpTfgl7y9Rj/WkEtmGaCm5CZx
         W6EK4cKeVPsnZuFK1g7HBcC9jDSjftsT0N5WotI/JK1F3MWQCiHV+Gfdi64S+8AlGfVl
         91LfgBatGXhnZXKwOZmf3fblPdKU4HjuCwBW0prnFLjxF8XGT0U6Ro6+/UgoJCYtY4zc
         eePR/FOumc+93+Bbt7sJJnAVRfccWjF7e8y/xRqbEPRURtWKVtLFVePlFglxBkdMRS61
         Xpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008831; x=1741613631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98OQ8wvaJ9wtoqY/FnFWTw/2aTBVHaqyurEF1+7THsM=;
        b=fv8gZzpmNE23iNJOlvJuaUP+Zc/W/IWSGYUlx7g9Rwh4I4R3uQDMtrtmpiQGBrxbGp
         Ik56h9eJsMCnNyAvbYPA1JvkWfiR45uyEFo4YMXnRAJhdU8CJJV7qKSIxbdFs2sTyp1x
         TujnHQi8hTtVxsBj8OzrYGDaxGICS8E/RXoL/r9biy2M2LNw2mQKvM8c+McqPYhAToOx
         7Sz3Ict+UXGBSRYa+j67EHm2QnOaC0F4YR6rPnOVxKryajppsXKR4zAi0qhWR9d3JVoN
         L+K5H3JlCSE596lyF56cNmUgL3zYpQDDpwOvHBpUwOL+ks2ZuacE6M7t3zBTsozMlxsC
         260w==
X-Forwarded-Encrypted: i=1; AJvYcCW0/EO/fAL8U5aLHxOsNXiNbhYbKAOngf0iwSxrqlaQGz2Iy/R2GyBIFibVRSNWvsQUYZ79Tei6QU8zoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2og2Es35dAY+SiXM8UcYBghogy1OASmpgmRnS0N6xA2h1U7OO
	4M2yw3WJ24+VdeWZADy6RLTHrgQhNQ5jkFsPulBKoOYZB9oLiZXnB9vNxCVpMhxKMaMLvBmcwY8
	Epqgs3UoV+Nwez4dYsm51PO16FCqPBnQ+6Lb+
X-Gm-Gg: ASbGncvvlf9zpDOHyyHxQ84zKsOLwWJLC9YG0naUKP92fnY+dFfGoS4tM4btaq3EtrM
	GCiIW1GgyWk4rdzYIFHyHWYZARkilkGJkncZAaIH9dVmzkTHvFWoL7d1N3zVvxhfzvxjCOLkJs1
	oYsVWRZ22nKPrfdtKhkjZVjMSaT0SVUeGoaSx0rl2SN5lOidEP0mHSuR3f
X-Google-Smtp-Source: AGHT+IE8JWpQtarWwp+2hNt/MR6epGuJDDazTrc2gMvmQUZSN/QRsDdQQeOGHqHvxcXWjRP0+QCxyieUoVOMPKqMUFM=
X-Received: by 2002:a05:6000:1f8a:b0:390:fc83:a070 with SMTP id
 ffacd0b85a97d-390fc83a160mr6688529f8f.0.1741008831435; Mon, 03 Mar 2025
 05:33:51 -0800 (PST)
MIME-Version: 1.0
References: <20250213135759.190006-1-fujita.tomonori@gmail.com> <20250213135759.190006-6-fujita.tomonori@gmail.com>
In-Reply-To: <20250213135759.190006-6-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 14:33:39 +0100
X-Gm-Features: AQ5f1JoT3yLvXrcqi1UY1px9Dirgxz3oFETPYn_JBDKUcmKVulP6_KvtwihScxI
Message-ID: <CAH5fLgjX9hh+QRrKggOKr+6p+UwqHSavzu4UXy9iGNL2wSJXtg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
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
X-CRM114-CacheID: sfid-20250303_053353_924694_851B8F9B 
X-CRM114-Status: GOOD (  23.80  )
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

T24gVGh1LCBGZWIgMTMsIDIwMjUgYXQgMzowMeKAr1BNIEZVSklUQSBUb21vbm9yaQo8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgd2Fybl9vbiBhbmQgd2Fybl9vbl9v
bmNlIG1hY3Jvcy4gV3JhcHBpbmcgdGhlIEMncyBXQVJOXyogYW5kIEJVR18qCj4gbWFjcm9zIGRv
ZXNuJ3Qgd29yayBzbyB0aGlzIHVzZXMgdGhlIGFzc2VtYmx5IGNvZGUgZXhwb3J0ZWQgYnkgdGhl
IEMKPiBzaWRlIHZpYSBBUkNIX1dBUk5fQVNNIG1hY3JvLiBMaWtlIHRoZSBzdGF0aWMgYnJhbmNo
IGNvZGUsIHRoaXMKPiBnZW5lcmF0ZXMgdGhlIGFzc2VtYmx5IGNvZGUgZm9yIHJ1c3QgYXQgY29t
cGlsZSB0aW1lIGJ5IHVzaW5nIHRoZSBDCj4gcHJlcHJvY2Vzc29yLgo+Cj4gZmlsZSgpISBtYWNy
byBkb2Vzbid0IHdvcmsgZm9yIHRoZSBSdXN0IGlubGluZSBhc3NlbWJseSBpbiB0aGUgc2FtZQo+
IHdheSBhcyBfX0ZJTEVfXyBmb3IgdGhlIEMgaW5saW5lIGFzc2VtYmx5LiBTbyB0aGUgY29kZSB0
byBoYW5kbGUgYQo+IGZpbGUgbmFtZSBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgQyBhc3NlbWJseSBj
b2RlIChzaW1pbGFyIHRvIHRoZQo+IGFybTY0L2xvb25nYXJjaCBhc3NlbWJseSkuCj4KPiBTaW1p
bGFybHksIEFSQ0hfV0FSTl9SRUFDSEFCTEUgaXMgYWxzbyB1c2VkIGF0IGNvbXBpbGUgdGltZSB0
bwo+IGdlbmVyYXRlIHRoZSBhc3NlbWJseSBjb2RlOyBvYmp0b29sJ3MgcmVhY2hhYmxlIGFub3Rh
dGlvbiBjb2RlLiBPbmx5Cj4gYXJjaGl0ZWN0dXJlcyB0aGF0IHVzZSBvYmp0b29sICh4ODYgYW5k
IGxvb25nYXJjaCkgbmVlZCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEZVSklUQSBUb21vbm9yaSA8
ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4KPiAtLS0KPiAgcnVzdC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsrCj4gIHJ1c3Qva2VybmVsLy5naXRpZ25v
cmUgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gIHJ1c3Qva2VybmVsL2J1Zy5ycyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwMCArKysrKysrKysrKysrKysrKysKPiAgcnVz
dC9rZXJuZWwvZ2VuZXJhdGVkX2FyY2hfcmVhY2hhYmxlX2FzbS5ycy5TIHwgICA3ICsrCj4gIHJ1
c3Qva2VybmVsL2dlbmVyYXRlZF9hcmNoX3dhcm5fYXNtLnJzLlMgICAgICB8ICAgNyArKwo+ICBy
dXN0L2tlcm5lbC9saWIucnMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICA2
IGZpbGVzIGNoYW5nZWQsIDEyNSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBy
dXN0L2tlcm5lbC9idWcucnMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJ1c3Qva2VybmVsL2dlbmVy
YXRlZF9hcmNoX3JlYWNoYWJsZV9hc20ucnMuUwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcnVzdC9r
ZXJuZWwvZ2VuZXJhdGVkX2FyY2hfd2Fybl9hc20ucnMuUwo+Cj4gZGlmZiAtLWdpdCBhL3J1c3Qv
TWFrZWZpbGUgYi9ydXN0L01ha2VmaWxlCj4gaW5kZXggOGZjZmQ2MDQ0N2JjLi5hMjk1YjY1YzQz
ZjMgMTAwNjQ0Cj4gLS0tIGEvcnVzdC9NYWtlZmlsZQo+ICsrKyBiL3J1c3QvTWFrZWZpbGUKPiBA
QCAtMzQsNiArMzQsOSBAQCBvYmotJChDT05GSUdfUlVTVF9LRVJORUxfRE9DVEVTVFMpICs9IGRv
Y3Rlc3RzX2tlcm5lbF9nZW5lcmF0ZWQubwo+ICBvYmotJChDT05GSUdfUlVTVF9LRVJORUxfRE9D
VEVTVFMpICs9IGRvY3Rlc3RzX2tlcm5lbF9nZW5lcmF0ZWRfa3VuaXQubwo+Cj4gIGFsd2F5cy0k
KHN1YnN0IHksJChDT05GSUdfUlVTVCksJChDT05GSUdfSlVNUF9MQUJFTCkpICs9IGtlcm5lbC9n
ZW5lcmF0ZWRfYXJjaF9zdGF0aWNfYnJhbmNoX2FzbS5ycwo+ICtpZm5kZWYgQ09ORklHX1VNTAo+
ICthbHdheXMtJChzdWJzdCB5LCQoQ09ORklHX1JVU1QpLCQoQ09ORklHX0JVRykpICs9IGtlcm5l
bC9nZW5lcmF0ZWRfYXJjaF93YXJuX2FzbS5ycyBrZXJuZWwvZ2VuZXJhdGVkX2FyY2hfcmVhY2hh
YmxlX2FzbS5ycwo+ICtlbmRpZgo+Cj4gICMgQXZvaWRzIHJ1bm5pbmcgYCQoUlVTVEMpYCB3aGVu
IGl0IG1heSBub3QgYmUgYXZhaWxhYmxlLgo+ICBpZmRlZiBDT05GSUdfUlVTVAo+IEBAIC00ODEs
NSArNDg0LDEwIEBAICQob2JqKS9rZXJuZWwubzogJChzcmMpL2tlcm5lbC9saWIucnMgJChvYmop
L2J1aWxkX2Vycm9yLm8gXAo+ICBpZmRlZiBDT05GSUdfSlVNUF9MQUJFTAo+ICAkKG9iaikva2Vy
bmVsLm86ICQob2JqKS9rZXJuZWwvZ2VuZXJhdGVkX2FyY2hfc3RhdGljX2JyYW5jaF9hc20ucnMK
PiAgZW5kaWYKPiAraWZuZGVmIENPTkZJR19VTUwKPiAraWZkZWYgQ09ORklHX0JVRwo+ICskKG9i
aikva2VybmVsLm86ICQob2JqKS9rZXJuZWwvZ2VuZXJhdGVkX2FyY2hfd2Fybl9hc20ucnMgJChv
YmopL2tlcm5lbC9nZW5lcmF0ZWRfYXJjaF9yZWFjaGFibGVfYXNtLnJzCj4gK2VuZGlmCj4gK2Vu
ZGlmCj4KPiAgZW5kaWYgIyBDT05GSUdfUlVTVAo+IGRpZmYgLS1naXQgYS9ydXN0L2tlcm5lbC8u
Z2l0aWdub3JlIGIvcnVzdC9rZXJuZWwvLmdpdGlnbm9yZQo+IGluZGV4IDZiYTM5YTE3OGYzMC4u
ZjFkN2Y0MjI1MzMyIDEwMDY0NAo+IC0tLSBhL3J1c3Qva2VybmVsLy5naXRpZ25vcmUKPiArKysg
Yi9ydXN0L2tlcm5lbC8uZ2l0aWdub3JlCj4gQEAgLTEsMyArMSw1IEBACj4gICMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPgo+ICAvZ2VuZXJhdGVkX2FyY2hfc3RhdGljX2JyYW5j
aF9hc20ucnMKPiArL2dlbmVyYXRlZF9hcmNoX3dhcm5fYXNtLnJzCj4gKy9nZW5lcmF0ZWRfYXJj
aF9yZWFjaGFibGVfYXNtLnJzCj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCj4gZGlmZiAt
LWdpdCBhL3J1c3Qva2VybmVsL2J1Zy5ycyBiL3J1c3Qva2VybmVsL2J1Zy5ycwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi43ZmZkOWNiMWFkNzUKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcnVzdC9rZXJuZWwvYnVnLnJzCj4gQEAgLTAsMCArMSwxMDAgQEAKPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArCj4gKy8vIENvcHlyaWdodCAo
QykgMjAyNCBGVUpJVEEgVG9tb25vcmkKPiArCj4gKy8vISBTdXBwb3J0IGZvciBCVUdfKiBhbmQg
V0FSTl8qIGZ1bmN0aW9uYWxpdHkuCj4gKy8vIQo+ICsvLyEgQyBoZWFkZXI6IFtgaW5jbHVkZS9h
c20tZ2VuZXJpYy9idWcuaGBdKHNyY3RyZWUvaW5jbHVkZS9hc20tZ2VuZXJpYy9idWcuaCkKPiAr
Cj4gKyNbbWFjcm9fZXhwb3J0XQo+ICsjW2RvYyhoaWRkZW4pXQo+ICsjW2NmZyhhbGwoQ09ORklH
X0JVRywgbm90KENPTkZJR19VTUwpKSldCj4gK21hY3JvX3J1bGVzISB3YXJuX2ZsYWdzIHsKPiAr
ICAgICgkZmxhZ3M6ZXhwcikgPT4gewo+ICsgICAgICAgIGNvbnN0IEZMQUdTOiB1MzIgPSAkY3Jh
dGU6OmJpbmRpbmdzOjpCVUdGTEFHX1dBUk5JTkcgfCAkZmxhZ3M7Cj4gKyAgICAgICAgLy8gU0FG
RVRZOiBKdXN0IGFuIEZGSSBjYWxsLgo+ICsgICAgICAgICNbY2ZnKENPTkZJR19ERUJVR19CVUdW
RVJCT1NFKV0KPiArICAgICAgICB1bnNhZmUgewo+ICsgICAgICAgICAgICAkY3JhdGU6OmFzbSEo
Y29uY2F0ISgKPiArICAgICAgICAgICAgICAgICIvKiB7c2l6ZX0gKi8iLAo+ICsgICAgICAgICAg
ICAgICAgIi5wdXNoc2VjdGlvbiAucm9kYXRhLnN0cjEuMSwgXCJhTVNcIixAcHJvZ2JpdHMsIDFc
biIsCj4gKyAgICAgICAgICAgICAgICAiMTExOlx0IC5zdHJpbmcgIiwgIlwiIiwgZmlsZSEoKSwg
IlwiXG4iLAo+ICsgICAgICAgICAgICAgICAgIi5wb3BzZWN0aW9uXG4iLAoKSXQgbG9va3MgbGlr
ZSB5b3UncmUgZG9pbmcgdGhpcyBzbyB0aGF0IHlvdSBjYW4gcmVmZXJlbmNlIHRoZSBmaWxlbmFt
ZQp3aXRoICIxMTFiIiwgYnV0IGNvdWxkIHlvdSBkbyB0aGlzIGluc3RlYWQ6Cgpjb25zdCBfRklM
RTogJlt1OF0gPSBmaWxlISgpLmFzX2J5dGVzKCk7Ci8vIFBsdXMgb25lIGZvciBudWwtdGVybWlu
YXRvci4Kc3RhdGljIEZJTEU6IFt1ODsgMSArIF9GSUxFLmxlbigpXSA9IHsKICAgIGxldCBtdXQg
Ynl0ZXMgPSBbMDsgMSArIF9GSUxFLmxlbigpXTsKICAgIGxldCBtdXQgaSA9IDA7CiAgICB3aGls
ZSBpIDwgX0ZJTEUubGVuKCkgewogICAgICAgIGJ5dGVzW2ldID0gX0ZJTEVbaV07CiAgICAgICAg
aSArPSAxOwogICAgfQogICAgYnl0ZXMKfTsKCmFuZCB0aGVuIHVzZQoKYXNtISgKICAgIGNvbmNh
dCEoCiAgICAgICAgIi8qIHtzaXplfSAqLyIsCiAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYh
KCJPQkpUUkVFIiksCiIvcnVzdC9rZXJuZWwvZ2VuZXJhdGVkX2FyY2hfd2Fybl9hc20ucnMiKSks
CiAgICAgICAgaW5jbHVkZSEoY29uY2F0IShlbnYhKCJPQkpUUkVFIiksCiIvcnVzdC9rZXJuZWwv
Z2VuZXJhdGVkX2FyY2hfcmVhY2hhYmxlX2FzbS5ycyIpKSk7CiAgICBmaWxlID0gc3ltIEZJTEUs
CiAgICBsaW5lID0gY29uc3QgbGluZSEoKSwKICAgIC4uLgopOwoKd2l0aAo6Omtlcm5lbDo6Y29u
Y2F0X2xpdGVyYWxzIShBUkNIX1dBUk5fQVNNKCJ7ZmlsZX0iLCAie2xpbmV9IiwKIntmbGFnc30i
LCAie3NpemV9IikpLAoKVGhhdCB3b3VsZCBiZSBhIGxvdCBzaW1wbGVyIHRvIHVuZGVyc3RhbmQg
dGhhbiB3aGF0IHlvdSBhcmUgZG9pbmcuCgoKQWxpY2UKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
