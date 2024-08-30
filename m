Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC16CA0EE1
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 07:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWFxdobRH8ipeX1XIuq1aJDn9XN3ndIE9AXzC1Gj1Ok=; b=0xcmKHvdxjtPSg
	wCmMLucvIEIz8TN6tUDhTYTaHIWprM0oJePwId72WAt5KinqSFaxdKUSCiizkJY8ZCJiyvhU61Xhg
	hAEhvksQuBezT+qodXCdh+5kMXPBGOMaDpz2Y/ZWyjUTymvLekbF5IS+DVtVq/ZVA88jMv/pGiWlh
	JhPCtkI4Nv2k7xN4x21LAjWyKfWjY6Pum3NZkwgk+HQdWItdNz+vWS4cOCcTeo4XbaQ7FR1tf2OKF
	TkOGe5C1pDD/GGs0iqp30Wp6VoEovd/eVIPpT4AbXZDL1fgjMCygBXpxVwSVYs+CInci6M3ZL0Dkd
	285hVH/JAqrhOHbqiVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvd4-000000051m9-0wVm;
	Fri, 30 Aug 2024 07:01:06 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjucX-00000004sFb-2Uuj
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 05:56:30 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3df0fc40271so478762b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 22:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724997388; x=1725602188; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jErUDJYJZrdtSGs3YNEXW8T8pZ8TEPOPqQ7j0f/EK1I=;
        b=coI+4T6Ajuzzz5D0EqpDtAFDHPuR/eN7CBn8ZWEfUpsU0czRKPzaX0r1YO7+khVUi0
         jS+gsB4eW8DDbOeprt58vjLbp7zDNIXnjEDHoiNq6q8Y/VI78wSLWHtfo2/0+YPIVXVI
         SSwGDsMwIzX8RXnwKoaYHyyrLLvSbfTMY1/eJoZb9LcLPc1quLKrk1l9S6FN1nkvrflZ
         Mn/RiOYVhJ6/pO/84JJDypEkq2Hmy0IEM0oQbniN9N/7y+dyN59nh8WnMPYXichQqHTr
         KVVp26G1coIr4e3xF+nfQubslRE7YeF38DdtboSv6k9mUP1/sCB5Muu78JEH3Z75gxLN
         uKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724997388; x=1725602188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jErUDJYJZrdtSGs3YNEXW8T8pZ8TEPOPqQ7j0f/EK1I=;
        b=V0zxRVDZOM/iLLvc4TkpNvWacbTzG/aJv1Nt29u6MSkdf2F7qsu8IlWHekRCoPWDO3
         THxb+RCxyaVPe5ixzSnk6DrLz04injTnTfplOGZ7ZCOuTT0hyKAw1Tikq8orSUbmSUAd
         /ku70HADBrEX0eltlLtR+0mQd5Zo+VdqjjDOEnxAiRFefU1I6VSYOwhqJhGat002+j2g
         rB4h57OBXN4RQmTYa+aTYII1Qk2xWKvOWZwPM6sllEcUW7Cc4j/u/3mvRCd0v3NUotl5
         wNqA6cfx2yHE8F8WYh6aUp1zgjeypqwFFfa+2XhO/3GHWgoyKVESUpXQsKrtQTX2W9Fq
         +cGw==
X-Forwarded-Encrypted: i=1; AJvYcCXwLVO/6a1tbigVbVlq+9gYrnH3hWGR6vEqsw0+HMPYCAaOj5v7VmXMXAdcPfeMGYuRDQjLde6nusM4yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfECjJ2Fo7wOiqzckQP3kpCNbWotFaGMiwnQBbx8TTW6s0uwot
	APi0OXd6HrAPeFIgqXXyrfRT5720qie/sdp7p+O3kNygL931Iz7D1ejlFFOrPUC+Q9p3xKdsFRb
	TbVZ2j7lnhBvDJYEMfzVdG4rkphtnkB11zj4mFg==
X-Google-Smtp-Source: AGHT+IHA3E7d2Q5u8iuUQE6FpOiZI0dlWkCb5KtpOqR2HgEH/0+z5Vbpq2htdz0jpr0UjNRAEK7twhGJkx21tqu8hgU=
X-Received: by 2002:a05:6808:1692:b0:3de:13bf:3092 with SMTP id
 5614622812f47-3df05d8557fmr4797666b6e.24.1724997387915; Thu, 29 Aug 2024
 22:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240829033904.477200-1-nick.hu@sifive.com> <20240829033904.477200-3-nick.hu@sifive.com>
 <CAK9=C2Xui8c0b55WrZxCZYqK=AFmiPT+nG8d_E0d7SpamwvO-Q@mail.gmail.com>
 <CAKddAkCoZy=uid5gVzUg-zwhBxX_EZCbFR18521N3142MPv=jw@mail.gmail.com> <CAK9=C2VbF2JKSfJLVEV4SYQFxr+gmpBTjtK6DuVFSbEAjRmFOA@mail.gmail.com>
In-Reply-To: <CAK9=C2VbF2JKSfJLVEV4SYQFxr+gmpBTjtK6DuVFSbEAjRmFOA@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 30 Aug 2024 13:56:17 +0800
Message-ID: <CAKddAkAbf7VJ-dZ_PWsDstTKgTobA_UCYK+vix1ovc-BSMOyJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] time-riscv: Stop stimecmp when cpu hotplug
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_225629_661144_4CDE6873 
X-CRM114-Status: GOOD (  31.36  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW51cAoKT24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMjo0OeKAr1BNIEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDI5LCAyMDI0IGF0
IDExOjUz4oCvQU0gTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBI
aSBBbnVwCj4gPgo+ID4gT24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMToxOOKAr1BNIEFudXAgUGF0
ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBB
dWcgMjksIDIwMjQgYXQgOToxMOKAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBTdG9wIHRoZSBzdGltZWNtcCB3aGVuIHRoZSBjcHUgaXMgZ29p
bmcgdG8gYmUgb2ZmIG90aGVyd2lzZSB0aGUgdGltZXIKPiA+ID4gPiBpbnRlcnJ1cHQgbWF5IHBl
bmRpbmcgd2hpbGUgcGVyZm9ybWluZyBwb3dlciBkb3duIG9wZXJhdGlvbi4KPiA+ID4gPgo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+ID4gPiAt
LS0KPiA+ID4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMjIgKysrKysr
KysrKysrKysrLS0tLS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2
LmMKPiA+ID4gPiBpbmRleCA0OGNlNTBjNWY1ZTYuLjlhNmFjYWE4ZGZiMCAxMDA2NDQKPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiA+ID4gPiArKysgYi9k
cml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiA+ID4gPiBAQCAtMzIsMTUgKzMyLDE5
IEBACj4gPiA+ID4gIHN0YXRpYyBERUZJTkVfU1RBVElDX0tFWV9GQUxTRShyaXNjdl9zc3RjX2F2
YWlsYWJsZSk7Cj4gPiA+ID4gIHN0YXRpYyBib29sIHJpc2N2X3RpbWVyX2Nhbm5vdF93YWtlX2Nw
dTsKPiA+ID4gPgo+ID4gPiA+ICtzdGF0aWMgdm9pZCByaXNjdl9jbG9ja19zdG9wX3N0aW1lY21w
KHZvaWQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVAs
IFVMT05HX01BWCk7Cj4gPiA+ID4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQp
KQo+ID4gPiA+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QSCwgVUxPTkdf
TUFYKTsKPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiAgc3RhdGljIHZvaWQgcmlzY3ZfY2xv
Y2tfZXZlbnRfc3RvcCh2b2lkKQo+ID4gPiA+ICB7Cj4gPiA+ID4gLSAgICAgICBpZiAoc3RhdGlj
X2JyYW5jaF9saWtlbHkoJnJpc2N2X3NzdGNfYXZhaWxhYmxlKSkgewo+ID4gPiA+IC0gICAgICAg
ICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19NQVgpOwo+ID4gPiA+IC0gICAg
ICAgICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+ID4gPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVBILCBVTE9OR19NQVgpOwo+ID4g
PiA+IC0gICAgICAgfSBlbHNlIHsKPiA+ID4gPiArICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX2xp
a2VseSgmcmlzY3Zfc3N0Y19hdmFpbGFibGUpKQo+ID4gPiA+ICsgICAgICAgICAgICAgICByaXNj
dl9jbG9ja19zdG9wX3N0aW1lY21wKCk7Cj4gPiA+ID4gKyAgICAgICBlbHNlCj4gPiA+ID4gICAg
ICAgICAgICAgICAgIHNiaV9zZXRfdGltZXIoVTY0X01BWCk7Cj4gPiA+ID4gLSAgICAgICB9Cj4g
PiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+ICBzdGF0aWMgaW50IHJpc2N2X2Nsb2NrX25leHRfZXZl
bnQodW5zaWduZWQgbG9uZyBkZWx0YSwKPiA+ID4gPiBAQCAtMTI2LDcgKzEzMCwxMSBAQCBzdGF0
aWMgaW50IHJpc2N2X3RpbWVyX3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gPiA+
Cj4gPiA+ID4gIHN0YXRpYyBpbnQgcmlzY3ZfdGltZXJfZHlpbmdfY3B1KHVuc2lnbmVkIGludCBj
cHUpCj4gPiA+ID4gIHsKPiA+ID4gPiAtICAgICAgIGRpc2FibGVfcGVyY3B1X2lycShyaXNjdl9j
bG9ja19ldmVudF9pcnEpOwo+ID4gPiA+ICsgICAgICAgaWYgKHN0YXRpY19icmFuY2hfbGlrZWx5
KCZyaXNjdl9zc3RjX2F2YWlsYWJsZSkpCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJpc2N2X2Ns
b2NrX3N0b3Bfc3RpbWVjbXAoKTsKPiA+ID4gPiArICAgICAgIGVsc2UKPiA+ID4gPiArICAgICAg
ICAgICAgICAgZGlzYWJsZV9wZXJjcHVfaXJxKHJpc2N2X2Nsb2NrX2V2ZW50X2lycSk7Cj4gPiA+
ID4gKwo+ID4gPgo+ID4gPiBOb3QgZGlzYWJsaW5nIHJpc2N2X2Nsb2NrX2V2ZW50X2lycSBoZXJl
IGZvciBTc3RjIHdvdWxkIG5vdwo+ID4gPiBjYXVzZSByaXNjdl90aW1lcl9zdGFydGluZ19jcHUo
KSB0byB1bm5lY2Vzc2FyaWx5IGVuYWJsZSBpdAo+ID4gPiB3aGVuIHRoZSBDUFUgaXMgcG93ZXJl
ZC11cC4KPiA+ID4KPiA+ID4gSSB0aGluayB0aGUgYmVsb3cgY2hhbmdlIGlzIHN1ZmZpY2llbnQg
Zm9yIHRoaXMgcGF0Y2g6Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291
cmNlL3RpbWVyLXJpc2N2LmMKPiA+ID4gYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2
LmMKPiA+ID4gaW5kZXggNDhjZTUwYzVmNWU2Li41NDZmZDI0OGY0ZmYgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gPiArKysgYi9kcml2ZXJz
L2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiA+ID4gQEAgLTEyNyw2ICsxMjcsMTEgQEAgc3Rh
dGljIGludCByaXNjdl90aW1lcl9zdGFydGluZ19jcHUodW5zaWduZWQgaW50IGNwdSkKPiA+ID4g
IHN0YXRpYyBpbnQgcmlzY3ZfdGltZXJfZHlpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gPiA+
ICB7Cj4gPiA+ICAgICAgICAgZGlzYWJsZV9wZXJjcHVfaXJxKHJpc2N2X2Nsb2NrX2V2ZW50X2ly
cSk7Cj4gPiA+ICsgICAgICAgLyoKPiA+ID4gKyAgICAgICAgKiBTdG9wIHRoZSB0aW1lciB3aGVu
IHRoZSBjcHUgaXMgZ29pbmcgdG8gYmUgb2ZmbGluZSBvdGhlcndpc2UKPiA+ID4gKyAgICAgICAg
KiB0aGUgdGltZXIgaW50ZXJydXB0IG1heSBiZSBwZW5kaW5nIHdoaWxlIHBlcmZvcm1pbmcgcG93
ZXItZG93bi4KPiA+ID4gKyAgICAgICAgKi8KPiA+ID4gKyAgICAgICByaXNjdl9jbG9ja19ldmVu
dF9zdG9wKCk7Cj4gPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiBUaGUg
c2JpX2V4aXQoKSBvZiBPcGVuU0JJIHdpbGwgZGlzYWJsZSBtdGltZWNtcCB3aGVuCj4gPiBzYmlf
aHNtX2hhcnRfc3RvcCgpIHNvIHRoZSBtdGltZWNtcCB3aWxsIGJlIGRpc2FibGVkIHR3aWNlIGlm
IHRoZXJlIGlzCj4gPiBubyBTU1RDLgo+ID4gSG93IGFib3V0IGFkZGluZyBhIFNTVEMgYXZhaWxh
YmxlIGNoZWNrIGJlZm9yZSB0aGUgcmlzY3ZfY2xvY2tfZXZlbnRfc3RvcD8KPgo+IEN1cnJlbnRs
eSwgT3BlblNCSSB1c2VzIG10aW1lY21wIG9ubHkgZm9yIGltcGxlbWVudGluZwo+IFNCSSB0aW1l
IGV4dGVuc2lvbiBidXQgaW4gdGhlIGZ1dHVyZSwgT3BlblNCSSBtaWdodCBpbXBsZW1lbnQKPiBh
IHBlci1oYXJ0IHRpbWVyIGV2ZW50IGxpc3QgdG8gYWxsb3cgTS1tb2RlIHRpbWVyIGV2ZW50cy4K
Pgo+IERvbid0IGFzc3VtZSBpbiB3aGF0IGVudmlyb25tZW50IHRoZSBkcml2ZXIgaXMgcnVubmlu
Zy4KPgo+IEl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIGRyaXZlciBpcyBydW5uaW5nIHVuZGVyIGEg
aHlwZXJ2aXNvcgo+IHdoaWNoIG9ubHkgcHJvdmlkZXMgU0JJIHRpbWUgZXh0ZW5zaW9uIGFuZCBk
b2VzIG5vdCB2aXJ0dWFsaXplCj4gU3N0YyBleHRlbnNpb24uCj4KSSBzZWUsIFRoYW5rIHlvdSBm
b3IgdGhlIGV4cGxhbmF0aW9uIQoKPiA+Cj4gPiAgIC8qCj4gPiAgICAqIFN0b3AgdGhlIHRpbWVy
IHdoZW4gdGhlIGNwdSBpcyBnb2luZyB0byBiZSBvZmZsaW5lIG90aGVyd2lzZQo+ID4gICAgKiB0
aGUgdGltZXIgaW50ZXJydXB0IG1heSBiZSBwZW5kaW5nIHdoaWxlIHBlcmZvcm1pbmcgcG93ZXIt
ZG93bi4KPiA+ICAgICovCj4gPiBpZiAoc3RhdGljX2JyYW5jaF9saWtlbHkoJnJpc2N2X3NzdGNf
YXZhaWxhYmxlKSkKPiA+ICAgICByaXNjdl9jbG9ja19ldmVudF9zdG9wKCk7Cj4gPgo+CkknbGwg
dXBkYXRlIHRoaXMgb25lIGluIHRoZSBuZXh0IHZlcnNpb24uCgo+IFJlZ2FyZHMsCj4gQW51cAoK
UmVnYXJkcywKTmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
