Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074BDCA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 02:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbUKVuHbQuDin8s/kycl9FulcFAk6Z2bEVF/tWx+Tng=; b=HVDkwihzj4oLh+
	T3TCWJ+2BCJBqu5XmM4V7WJfY+Lwcffkx7U1yw0nSo/kk1r7rhL6V436T5nqQ4cUPbiGup5uwl8Qh
	dlY68O1ysPXzBjAtNYaafWee34QhFUK7qrmXBQHgxLsgF60BX4vLsZkJX6+CV5rYi0Sqp0WJPF/Pz
	SM2kfpH+Wsosl/kinJZKWl3NhzKv/f6Dizbt1/s5y2j2627szUL57uxyo5l90A+OZmAXm1gO8jDyV
	LGEt+nbEfvrl18AJh/xGdhwV8W15ORuDpIGnED2H3sTyjQd8E1eBUTVTseYSjhblzMtILvwBJS0Qa
	en5Ecp6ap4DmrJxxLKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfsuj-001sjB-1g;
	Tue, 12 Sep 2023 02:14:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfsug-001sev-2P
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 02:14:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso56451955e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 19:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694484835; x=1695089635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UYT8P+Az/aDX+thtBtGmohMlRv8wMTglFHJw+7ZRyA=;
        b=aTVcP2efD5LxTuRenlrSZHspaExogYR6O++pRjKspFFIdS2Stjxap5UpxNngyWuD8j
         wv5XaXZIfxBZVjiFh45AIzZ+hh9fYchg3SF8JTaDxufsrHRSI6LLFDCwm7RIndpy4xE5
         EHws6z0s1qWkFN3lmVP9K3Gy3p7d2MEhZUQBqG/xdHglfxqINBualVTXZi4oQDEKAATi
         MWdUpWjd3ls7DV/ft6z0tY/doDmKktFquCgwAsCr+lmBnvppv4OJDQ2Ywo5/XOhFQCue
         3IGHEZ8CHnXQ3rRN6RT+tnbZ9S5NDZ95xqX+0vhrJjJ/UJQM1Vq7hewKdFPfHEAWQI/S
         S3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694484835; x=1695089635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UYT8P+Az/aDX+thtBtGmohMlRv8wMTglFHJw+7ZRyA=;
        b=aUfAS5h7MuIBP4ZhuIN2FRV7JmNtO9z7kMce5mztgp77ZFKlH629NSkL0Pk3jMEQVi
         tM9ywoIAqV10LO/LCyj4hlDUrTsSVVpYPghYkm5NVgUC1LlZBz+oZ6s6UDN9v639dhcE
         7U9s9VF+BxN+r6RnBqvs9LM3zbLHEEsew+VUzFLPlqiyV//iOBgp6kphY8eFIfwl4VZY
         6S+PXZmJk7djDNllV/quUFpnb3AzT/FDHZiTydQWxOzqGd5kq+OFhpRdRdariY5bS+8D
         DN8omFOFuFb/InTZT1jZP1ydOUDQ/o0odSoTvWEzWKTkQOJZ3VipL3PJNFGYLKJv0QZ5
         jdGQ==
X-Gm-Message-State: AOJu0Yy96qsZnc1Koc1EAc3yKaRwgnnKuzXmo6hKJy5NKEIA17bd+w4v
	K6MrhvpXBvZht5HIzUGqaUf++PjUvnGwiAm1B43N9A==
X-Google-Smtp-Source: AGHT+IFEBw3uGqO4onJjhH/X7HaKsAARQJMJLAntaYOU/ktDH6byKAC8HTddWq98Y57uIdBtG512WvaoNRzU06e1coE=
X-Received: by 2002:a1c:7719:0:b0:400:2dc5:2006 with SMTP id
 t25-20020a1c7719000000b004002dc52006mr9174781wmi.36.1694484834642; Mon, 11
 Sep 2023 19:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230901123043.73700-1-cuiyunhui@bytedance.com>
 <878r9hvn3m.fsf@all.your.base.are.belong.to.us> <CAEEQ3wnDAJOMo2SZAB23aZgOhBKPmZegC9E048YJaFhiXEkA-A@mail.gmail.com>
 <87r0n8pmso.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87r0n8pmso.fsf@all.your.base.are.belong.to.us>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 12 Sep 2023 10:13:43 +0800
Message-ID: <CAEEQ3wkPnoyB-35Q3_=Re8EXe3Et330oE8zGrT3DQvuAxaTv1w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5] riscv: add userland instruction dump to
 RISC-V splats
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	jszhang@kernel.org, andy.chiu@sifive.com, dave.hansen@linux.intel.com, 
	elver@google.com, glider@google.com, cyphar@cyphar.com, 
	kirill.shutemov@linux.intel.com, keescook@chromium.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_191402_806239_D9A85675 
X-CRM114-Status: GOOD (  22.68  )
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

SGkgQmrDtnJuLAoKT24gU2F0LCBTZXAgOSwgMjAyMyBhdCAyOjAx4oCvQU0gQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0
ZWRhbmNlLmNvbT4gd3JpdGVzOgo+Cj4gPiBIaSBCasO2cm7vvIwKPiA+Cj4gPiBPbiBGcmksIFNl
cCA4LCAyMDIzIGF0IDI6NDXigK9BTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3
cm90ZToKPiA+Pgo+ID4+IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cml0
ZXM6Cj4gPj4KPiA+PiA+IEFkZCB1c2VybGFuZCBpbnN0cnVjdGlvbiBkdW1wIGFuZCByZW5hbWUg
ZHVtcF9rZXJuZWxfaW5zdHIoKQo+ID4+ID4gdG8gZHVtcF9pbnN0cigpLgo+ID4+ID4KPiA+PiA+
IEFuIGV4YW1wbGU6Cj4gPj4gPiBbICAgIDAuODIyNDM5XSBGcmVlaW5nIHVudXNlZCBrZXJuZWwg
aW1hZ2UgKGluaXRtZW0pIG1lbW9yeTogNjkxNksKPiA+PiA+IFsgICAgMC44MjM4MTddIFJ1biAv
aW5pdCBhcyBpbml0IHByb2Nlc3MKPiA+PiA+IFsgICAgMC44Mzk0MTFdIGluaXRbMV06IHVuaGFu
ZGxlZCBzaWduYWwgNCBjb2RlIDB4MSBhdCAweDAwMDAwMDAwMDAwNWJlMTggaW4gYmJbMTAwMDAr
NWZiMDAwXQo+ID4+ID4gWyAgICAwLjg0MDc1MV0gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5v
dCB0YWludGVkIDUuMTQuMC1yYzQtMDAwNDktZ2JkNjQ0MjkwYWE3Mi1kaXJ0eSAjMTg3Cj4gPj4g
PiBbICAgIDAuODQxMzczXSBIYXJkd2FyZSBuYW1lOiAgLCBCSU9TCj4gPj4gPiBbICAgIDAuODQx
NzQzXSBlcGMgOiAwMDAwMDAwMDAwMDViZTE4IHJhIDogMDAwMDAwMDAwMDA3OWU3NCBzcCA6IDAw
MDAwMDNmZmZjYWZkYTAKPiA+PiA+IFsgICAgMC44NDIyNzFdICBncCA6IGZmZmZmZmZmODE2ZTlk
YzggdHAgOiAwMDAwMDAwMDAwMDAwMDAwIHQwIDogMDAwMDAwMDAwMDAwMDAwMAo+ID4+ID4gWyAg
ICAwLjg0Mjk0N10gIHQxIDogMDAwMDAwM2ZmZmM5ZmRmMCB0MiA6IDAwMDAwMDAwMDAwMDAwMDAg
czAgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4gPiBbICAgIDAuODQzNDM0XSAgczEgOiAwMDAwMDAw
MDAwMDAwMDAwIGEwIDogMDAwMDAwM2ZmZmNhMDE5MCBhMSA6IDAwMDAwMDNmZmZjYWZlMTgKPiA+
PiA+IFsgICAgMC44NDM4OTFdICBhMiA6IDAwMDAwMDAwMDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAw
MDAwMDAwIGE0IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4+ID4gWyAgICAwLjg0NDM1N10gIGE1IDog
MDAwMDAwMDAwMDAwMDAwMCBhNiA6IDAwMDAwMDAwMDAwMDAwMDAgYTcgOiAwMDAwMDAwMDAwMDAw
MDAwCj4gPj4gPiBbICAgIDAuODQ0ODAzXSAgczIgOiAwMDAwMDAwMDAwMDAwMDAwIHMzIDogMDAw
MDAwMDAwMDAwMDAwMCBzNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+PiA+IFsgICAgMC44NDUyNTNd
ICBzNSA6IDAwMDAwMDAwMDAwMDAwMDAgczYgOiAwMDAwMDAwMDAwMDAwMDAwIHM3IDogMDAwMDAw
MDAwMDAwMDAwMAo+ID4+ID4gWyAgICAwLjg0NTcyMl0gIHM4IDogMDAwMDAwMDAwMDAwMDAwMCBz
OSA6IDAwMDAwMDAwMDAwMDAwMDAgczEwOiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4gPiBbICAgIDAu
ODQ2MTgwXSAgczExOiAwMDAwMDAwMDAwZDE0NGUwIHQzIDogMDAwMDAwMDAwMDAwMDAwMCB0NCA6
IDAwMDAwMDAwMDAwMDAwMDAKPiA+PiA+IFsgICAgMC44NDY2MTZdICB0NSA6IDAwMDAwMDAwMDAw
MDAwMDAgdDYgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4gPiBbICAgIDAuODQ3MjA0XSBzdGF0dXM6
IDAwMDAwMDAyMDAwMDAwMjAgYmFkYWRkcjogMDAwMDAwMDBmMDAyODA1MyBjYXVzZTogMDAwMDAw
MDAwMDAwMDAwMgo+ID4+ID4gWyAgICAwLjg0ODIxOV0gQ29kZTogZjA2ZiBmZjVmIDM4MjMgZmEx
MSAwMTEzIGZiMDEgMmUyMyAwMjAxIDAyOTMgMDAwMCAoODA1MykgZjAwMgo+ID4+ID4gWyAgICAw
Ljg1MTAxNl0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGlu
aXQhIGV4aXRjb2RlPTB4MDAwMDAwMDQKPiA+PiA+Cj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5o
dWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+PiA+IC0tLQo+ID4+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMgfCAxOSArKysrKysrKysrKysrKysrLS0tCj4gPj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPj4gPgo+ID4+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jCj4gPj4gPiBpbmRleCBmNzk4Yzg1M2JlZGUuLjkyM2I0OWMzODk4NSAxMDA2
NDQKPiA+PiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+PiA+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+PiA+IEBAIC0zMyw3ICszMywxOSBAQCBpbnQgc2hv
d191bmhhbmRsZWRfc2lnbmFscyA9IDE7Cj4gPj4gPgo+ID4+ID4gIHN0YXRpYyBERUZJTkVfU1BJ
TkxPQ0soZGllX2xvY2spOwo+ID4+ID4KPiA+PiA+IC1zdGF0aWMgdm9pZCBkdW1wX2tlcm5lbF9p
bnN0cihjb25zdCBjaGFyICpsb2dsdmwsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4+ID4gK3N0
YXRpYyBpbnQgY29weV9jb2RlKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1MTYgKnZhbCwgY29uc3Qg
dTE2ICppbnNucykKPiA+PiA+ICt7Cj4gPj4gPiArICAgICBpZiAoIXVzZXJfbW9kZShyZWdzKSkK
PiA+PiA+ICsgICAgICAgICAgICAgcmV0dXJuIGdldF9rZXJuZWxfbm9mYXVsdCgqdmFsLCBpbnNu
cyk7Cj4gPj4gPiArCj4gPj4gPiArICAgICAvKiBUaGUgdXNlciBzcGFjZSBjb2RlIGZyb20gb3Ro
ZXIgdGFza3MgY2Fubm90IGJlIGFjY2Vzc2VkLiAqLwo+ID4+ID4gKyAgICAgaWYgKHJlZ3MgIT0g
dGFza19wdF9yZWdzKGN1cnJlbnQpKQo+ID4+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVQRVJN
Owo+ID4+ID4gKwo+ID4+ID4gKyAgICAgcmV0dXJuIGNvcHlfZnJvbV91c2VyX25vZmF1bHQodmFs
LCBpbnNucywgc2l6ZW9mKCp2YWwpKTsKPiA+Pgo+ID4+IEhtbSwgSSB0aGluayB5b3UgbWlzc2Vk
IHRoZSBhY3R1YWwgcHJvYmxlbSBpbiBbMV0uIEknbSBzdGlsbCBnZXR0aW5nOgo+ID4+Cj4gPj4g
ICB8ICAgQ0hFQ0sgICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPj4gICB8IGFyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmM6NDY6NDQ6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFyZ3Vt
ZW50IDIgKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlcykKPiA+PiAgIHwgYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHMuYzo0Njo0NDogICAgZXhwZWN0ZWQgdm9pZCBjb25zdCBbbm9kZXJlZl0gX191c2Vy
ICpzcmMKPiA+PiAgIHwgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzo0Njo0NDogICAgZ290IHVu
c2lnbmVkIHNob3J0IGNvbnN0IFt1c2VydHlwZV0gKmluc25zCj4gPj4KPiA+Cj4gPiBIb3cgZGlk
IHRoZSB3YXJuaW5ncyBhYm92ZSBjb21lIGFib3V0PyBJIGRvbid0IGhhdmUgb25lIGxvY2FsbHku
IFdoYXQKPiA+IGlzIHlvdXIgcmlzYy12IGdjYyB2ZXJzaW9uPwo+Cj4gSXQncyBmcm9tIHRoZSAi
c3BhcnNlIiB0b29sLiBQYXNzICJDPTEiIHRvIG1ha2UuIFVuZm9ydHVuYXRlbHkgUlYgc3BhcnNl
Cj4gbmVlZHMgdG8gYmUgYnVpbHQgbWFudWFsbHk6IGh0dHBzOi8vZ2l0aHViLmNvbS9Db25jaHVP
RC9zcGFyc2UKPgo+ICB8IG1ha2UgQVJDSD1yaXNjdiBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGlu
dXgtZ251LSBDPTEgVz0xIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLm8KCkkgdXNlZCBzcGFyc2Ug
dG8gY2hlY2sgbG9jYWxseSBhbmQgZm91bmQgdGhhdCB0aGVyZSB3ZXJlIGluZGVlZAp3YXJuaW5n
cy4gSSdsbCBwb3N0IHY2IHRvIHNvbHZlIGl0LgoKClRoYW5rc++8jApZdW5odWkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
