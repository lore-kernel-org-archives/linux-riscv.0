Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E2FC77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rEi9oADNgCa5zmUegW816f8GdwmqgIyAEtBhSlAOGk=; b=GQSX2vXgCHzUsS
	VL5zUWhc01ybZRVC6RDCiffaSnihRn9ZNo5oxR1ZkTvSqbPPnxTxZ1fLG8OCO2FU3F2LIB/IgNSLJ
	oIf1D6I9WkfiDj9ONjxrPExyYqzXGQ/aKkS128aC94YtPIQNknehJtCtpxunjgZNaqoQjGdlv0XTZ
	ByJumLS2iY+l2LFst+O4ihXxW8JQJ9anz4+CK+gKg3ZHucI7RaIFqyOzOBU094i5TIzc/KIP5vC16
	gUOl2b2QYoOqWTuhrXPk2Ncg9BnlZcb1KBx2KqUv4Nv+RcewVPGOFFogVzHDz05hICd3R+jcdyVAN
	adppb5vwfCMJkizXh9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vyd-00DFTX-17;
	Tue, 30 May 2023 09:49:15 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vya-00DFRZ-1f
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 09:49:14 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2af98eb6ef0so45287351fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 02:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685440149; x=1688032149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akFeIP35hj3g/G+iX6470TrZtzvrlyZ/wSZAMe9T/g0=;
        b=ZkFDkzFUsH5KXBNpXNmt1EMKU1KBzFwY6BpSvt1ArrWqjTb5rdDoNDbTNikXR7huGt
         fQJ6xgJyPw6unI3NCW/2oyq8/4vrcRNTvfVYqmyCskwmZv6pbW9adBOxkb3ibrjO5KFV
         Kli4o68Zk7WRZ1ciGWzoGbq1zIakSAfD3OO3vpkJP23/k064hLH8WUctLUjUn0Juu9SQ
         d0+vDwAQGbKrGSFaeyOMywktq84h6iJ+Rx+usDQi374pKPXwYVLKQQ9gmlGL2hc4o+7H
         Fq/aDxotAYvY8Q+wAKC5qPI8ArZRhSFmzhUpspui7mPSqFty1ftrzV4tHkQmDVp1N/Ty
         4zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685440149; x=1688032149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akFeIP35hj3g/G+iX6470TrZtzvrlyZ/wSZAMe9T/g0=;
        b=S6eLc1EtqKrKEhX+Io133KnkONT+l9K1hflIni8n6p7uxVlvjLho5PIDrOBBoLS6p8
         wJbh0IOZArWmvbl2dJetlXzYuroKMBO+hLMQEv638FN1Les8gEv9G93rfC6xj7USnTku
         ljTA9PRCWoQ0ofmim9ysNaCXaiCSn1cDhYP6rjnT9bp5KK+Hr4zgXfM6Q6E3Qnd/iO9j
         b7rOCQtxXFc0ZK7KT6V1E3Nm8NOUb+JLkSmkUK5empjcsWMeZaa/1SfYdUuEZhks9HKj
         d/b64WS/M27o8+xSv06VbsrPCZY8+K8sETgAIGLoLhtzR4royrmX4PqU+wbhbR5UB28+
         i2mg==
X-Gm-Message-State: AC+VfDw5H2K+4JTuooOT0za0sQnhcSym36xOMPO4H2prNf4YcHg+PgJN
	2l7RzekbsOz3gKBMuQqiJdwyWx4deD2yhhUZeam0jKGebz8pZHfEDSByrg==
X-Google-Smtp-Source: ACHHUZ5YWqP22yH/TFgEMZysIl3zCGKuxwVw9dO0MFanWlPnZpSLAEzO0Xhx6Xxury2RcCwUjqyiKc8DzcOxVy2dsaI=
X-Received: by 2002:a2e:a445:0:b0:2a9:ee54:9fad with SMTP id
 v5-20020a2ea445000000b002a9ee549fadmr476463ljn.7.1685440149056; Tue, 30 May
 2023 02:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230529073845.2859178-1-guoren@kernel.org> <20230529-jasmine-amigo-6d01f6852b35@wendy>
 <CAJF2gTRSoZbexqka=_7nf4+dHZW2FGf++BiTMypfTbeoGAbUiA@mail.gmail.com> <CAJF2gTTzUfp7xDr8myA+xMcxGNEQ+XLEYMfoR91NShdBAQMu7Q@mail.gmail.com>
In-Reply-To: <CAJF2gTTzUfp7xDr8myA+xMcxGNEQ+XLEYMfoR91NShdBAQMu7Q@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 30 May 2023 17:48:58 +0800
Message-ID: <CABgGipXu7iq-J5v6GVMPrnHiGVLuMxabB0_hPb+o+04T2MAwpw@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fixup modules compile error
To: Guo Ren <guoren@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, paul.walmsley@sifive.com, palmer@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_024912_598544_8E5A6EF8 
X-CRM114-Status: GOOD (  28.06  )
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMjo1MuKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDMwLCAyMDIzIGF0IDEwOjU54oCvQU0gR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgTWF5IDI5LCAyMDIz
IGF0IDk6NDPigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBNYXkgMjksIDIwMjMgYXQgMDM6Mzg6NDVBTSAtMDQw
MCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+Cj4gPiA+ID4gU29tZSAua28gYWxzbyBuZWVkIHRo
ZSByaXNjdl92X3VzZXJfYWxsb3dlZCBzeW1ib2wuCj4gPiA+ID4KPiA+ID4gPiBFUlJPUjogbW9k
cG9zdDogInJpc2N2X3ZfdXNlcl9hbGxvd2VkIiBbYXJjaC9yaXNjdi9rdm0va3ZtLmtvXQo+ID4g
PiA+IHVuZGVmaW5lZCEKPiA+ID4gPiBtYWtlWzNdOiAqKioKPiA+ID4gPiBbL2hvbWUvZ3VvcmVu
L3NvdXJjZS9rZXJuZWwvbGludXgvc2NyaXB0cy9NYWtlZmlsZS5tb2Rwb3N0OjEzNjoKPiA+ID4g
PiBNb2R1bGUuc3ltdmVyc10gRXJyb3IgMQo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jp
c2N2L2tlcm5lbC92ZWN0b3IuYyB8IDEgKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gPiA+ID4gaW5kZXggMWM0YWM4
MjFlMDA4Li4zYWUwODgxNmQ2MDggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdmVjdG9yLmMKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4g
PiA+IEBAIC0xMjksNiArMTI5LDcgQEAgYm9vbCByaXNjdl92X3VzZXJfYWxsb3dlZCh2b2lkKQo+
ID4gPiA+ICB7Cj4gPiA+ID4gICAgICAgcmV0dXJuIHJpc2N2X3ZfZ2V0X2N1cl9jdHJsKGN1cnJl
bnQpID09IFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxfT047Cj4gPiA+ID4gIH0KPiA+ID4gPiArRVhQ
T1JUX1NZTUJPTChyaXNjdl92X3VzZXJfYWxsb3dlZCk7Cj4gPiA+Cj4gPiA+IElzIHRoZXJlIGEg
cmVhc29uIHRoYXQgdGhpcyBzaG91bGQgbm90IGJlIEVYUE9SVF9TWU1CT0xfR1BMKCk/Cj4gPiBH
b29kIHF1ZXN0aW9uLCBidXQgSSBqdXN0IGZvbGxvdyBvdXIgYXJjaC9yaXNjdiBoYWJiaXQsIG1h
eWJlIHdlCj4gPiBzaG91bGQgY2hhbmdlIGFsbCBvZiB0aGF0IGluIGFub3RoZXIgcGF0Y2guCj4g
Pgo+ID4g4p6cICBsaW51eC1zNjRpbHAzMiBnaXQ6KHM2NGlscDMyKSDinJcgZ3JlcCBFWFBPUlRf
U1lNQk9MICBhcmNoL3Jpc2N2IC1yIHwgd2MgLWwKPiA+IDY2Cj4gPiDinpwgIGxpbnV4LXM2NGls
cDMyIGdpdDooczY0aWxwMzIpIOKclyBncmVwIEVYUE9SVF9TWU1CT0xfR1BMICBhcmNoL3Jpc2N2
IC1yIHwgd2MgLWwKPiA+IDE1Cj4KPiBXaHkgIU1PRFVMRV9MSUNFTlNFKEdQTCkgbW9kdWxlcyBj
b3VsZG4ndCB1c2UgcmlzY3Zfdl91c2VyX2FsbG93ZWQ/Cj4gU2VlbXMgRVhQT1JUX1NZTUJPTF9H
UEwgaGFzIG1vcmUgbGltaXRhdGlvbnMuCj4KPiA6YzpmdW5jOmBFWFBPUlRfU1lNQk9MX0dQTCgp
YAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiBEZWZpbmVkIGluIGBgaW5jbHVk
ZS9saW51eC9leHBvcnQuaGBgCj4KPiBTaW1pbGFyIHRvIDpjOmZ1bmM6YEVYUE9SVF9TWU1CT0wo
KWAgZXhjZXB0IHRoYXQgdGhlIHN5bWJvbHMKPiBleHBvcnRlZCBieSA6YzpmdW5jOmBFWFBPUlRf
U1lNQk9MX0dQTCgpYCBjYW4gb25seSBiZSBzZWVuIGJ5Cj4gbW9kdWxlcyB3aXRoIGEgOmM6ZnVu
YzpgTU9EVUxFX0xJQ0VOU0UoKWAgdGhhdCBzcGVjaWZpZXMgYSBHUEwKPiBjb21wYXRpYmxlIGxp
Y2Vuc2UuIEl0IGltcGxpZXMgdGhhdCB0aGUgZnVuY3Rpb24gaXMgY29uc2lkZXJlZCBhbgo+IGlu
dGVybmFsIGltcGxlbWVudGF0aW9uIGlzc3VlLCBhbmQgbm90IHJlYWxseSBhbiBpbnRlcmZhY2Uu
IFNvbWUKPiBtYWludGFpbmVycyBhbmQgZGV2ZWxvcGVycyBtYXkgaG93ZXZlciByZXF1aXJlIEVY
UE9SVF9TWU1CT0xfR1BMKCkKPiB3aGVuIGFkZGluZyBhbnkgbmV3IEFQSXMgb3IgZnVuY3Rpb25h
bGl0eS4KPgo+IEZvciBrdm0gaXMgb2theToKPgo+IE1PRFVMRV9BVVRIT1IoIlF1bXJhbmV0Iik7
Cj4gTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+Cj4gU28sIEkgd291bGQgbGVhdmUgdGhlIGRlY2l0
aW9uIHRvIEFuZHkuIElmIGhlIGRpZG4ndCB3YW50IGl0IHVzZWQgd2l0aAo+IG90aGVyIG5vbi1n
cGwgbW9kdWxlcywgY2hvb3NlIHRoZSBFWFBPUlRfU1lNQk9MX0dQTC4KCkRvIHlvdSBoYXZlIGFu
eSB1c2UgY2FzZSBmb3IgZXhwb3J0aW5nIHRoaXMgZnVuY3Rpb24gdG8gbm9uLUdQTApsaWNlbnNl
ZCBtb2R1bGVzPyBJIGV4cG9ydGVkIHRoZSBmdW5jdGlvbiB3aXRoIEVYUE9SVF9TWU1CT0xfR1BM
KCkgaW4KdjIwWzFdIGJlY2F1c2UgSSB0aG91Z2h0IG1vc3QgbWFpbnRhaW5lcnMgd291bGQgYWNj
ZXB0IEdQTCByYXRoZXIgdGhhbgpub24tR1BMIG9uZS4gQW5kIGl0IHNlZW1zIG1vc3QgZHJpdmVy
cyB3b3VsZCBuZXZlciBjYWxsIHRoaXMgZnVuY3Rpb24KYW55d2F5LgoKPgo+ID4KPiA+ID4KPiA+
ID4gSSBmaWd1cmUgQW5keSB3aWxsIHJvbGwgdGhpcyBpbnRvIHRoaXMgbmV4dCByZXZpc2lvbi4K
ClRoZSBmaXggZm9yIHRoaXMgaGFzIGJlZW4gaW5jbHVkZWQgaW4gdjIwWzFdLiBIb3dldmVyLCBJ
IGFsc28gY2hhbmdlZAp0aGUgZnVuY3Rpb24gbmFtZQpzL3Jpc2N2X3ZfdXNlcl9hbGxvd2VkL3Jp
c2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9hbGxvd2VkLy4KCj4gPiA+Cj4gPiA+IENoZWVycywKPiA+
ID4gQ29ub3IuCj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gQmVzdCBSZWdhcmRzCj4gPiAgR3VvIFJl
bgo+Cj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KClsxXTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjMwNTE4MTYxOTQ5LjExMjAzLTIxLWFuZHkuY2hpdUBzaWZpdmUu
Y29tLwoKQ2hlZXJzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
