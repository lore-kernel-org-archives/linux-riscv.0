Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8880C2FC08
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 22:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GdWKbTbc4RF9BlAjwa2+qlWjXb8wyt4qpMbrYWt4/P8=; b=zHeLpX5ZTNE6CP
	neWLfL/7ySemDaoEIPU3Cd+ydlhkff9114bHJf/eMK7FAHOLPROXV/L74dTiJegTzZ/w2CEJTgPIq
	Njg2TZK89oBZULSZolq72PDoZuBf6rc+C5bL96x13d2xkqZZjREE7ylDJ1yxjtVpg0RL6tQtO0R0+
	uhiCG/qhbX1FeEG2EtSIxb5RSqqQbkPz3+Elygth9vfIzFCMhJdxlfZJ37k3tZOpotCzonTvRY/9+
	CBZcBTmnFjVnpzZ+LLDs/TkG4DlSxQ+2CxrivtyUfTocRU7V8mzNalhWstdHxi6LmNCMC8ojtgJIm
	3B3E7ARDG/fOArMEZaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj5M1-004KIi-03;
	Wed, 20 Sep 2023 22:07:29 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj5Lx-004KHq-1k
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 22:07:27 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c127ac7255so4772781fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 15:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695247641; x=1695852441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMHnNUDR4rdrJ/Sjh/Zz+/KrtpcpGoqoGFFo+AVdj7Y=;
        b=JXcYd8HXs0HUWyc4/uFqck3vskGW+mguyxOLvqBEI0yqeqY426snRFVqIXMwFXKoI9
         QT1orsXDNBep/78e+ZOaCPe71Wdr8ClDwttFW4WLoBeg968Se55web5kCFNUb8b4ETy/
         IfWxcSZUP4Q+k0QSTS4vUBxlEIVUp8OEgcHCU2AAseBZgQiFyMolhdTivY5uOnNtqkuO
         OPWt2h1JcftLwHRU6QdfFg/HmicgF7ZdmHJqZ/WwpvFjoo8CsN4dLIyaQ4W2kSwCHH+a
         uJXhXI/MAeqDJuboom1WchO7x93y8+edBwoIvA2mKTI3k8pmDsMNMamF/8i1qb7BgDJc
         M1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695247641; x=1695852441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMHnNUDR4rdrJ/Sjh/Zz+/KrtpcpGoqoGFFo+AVdj7Y=;
        b=WxWx9uvxNL6ELI/jd3qL11D1Dv2jfOHcsaCG2ObD9UwfLF/j6U9xGkzR5lUQ3+Kdy7
         gDNpWAyiw9rtWX7BpCcoIpkBgfyjUM5Ce9uJyyBxBdnY8WPMFzKVUVd8z96sg7eJPDrr
         57NpZQvbEtFVMx2+6JabVQV4hk6p1nTW3xZFwZQ2wmTKx2LlCCK4R7lfSmAtVo8kfMuW
         oOpM+GObKv+zWk6yNTo+GXA5aZJGHAgNphD/W2JXklURlzNNI7LRyGcujGu5l1v8U8CC
         gBAM6+ATX93jfKKEnlv29L4QcpWvdGMWJ5cfNxz3jQmr5p0EdS7vvlA9/d+QQ6OonMTP
         WW0A==
X-Gm-Message-State: AOJu0YxoF4dStEloaHnW07V/3ENrwsfB3ujxyCbPIySIYVj2XxRRR7xK
	/6FcYkJa8jrQN382HffKPXN3ATcvN9zlAp3OC+U2Sw==
X-Google-Smtp-Source: AGHT+IFEQWNBua1LeGExmJljv17ReDSbqJL7YO/liZwmZGcbuTBnpj1M1PeKTdKhUxrsOVoVKD65POOpOGR3MXxoqlA=
X-Received: by 2002:a2e:920e:0:b0:2c0:20e3:9903 with SMTP id
 k14-20020a2e920e000000b002c020e39903mr3111836ljg.49.1695247641246; Wed, 20
 Sep 2023 15:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230920193801.3035093-1-evan@rivosinc.com> <20230920-98a392b40f88c69e852e2c88@fedora>
 <CAOnJCUK7KTO0n_8wDYDxh2ULtEvMWF-re2dEX6nng_tX1AGgPw@mail.gmail.com>
In-Reply-To: <CAOnJCUK7KTO0n_8wDYDxh2ULtEvMWF-re2dEX6nng_tX1AGgPw@mail.gmail.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 20 Sep 2023 15:06:45 -0700
Message-ID: <CALs-HsuurXBZ2p=jYKvPq6ZMScugm5rBchttD6Wv9Mtupfx3NQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
To: Atish Patra <atishp@atishpatra.org>
Cc: Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Marc Zyngier <maz@kernel.org>, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_150725_806395_32C9D6CB 
X-CRM114-Status: GOOD (  39.62  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjoyN+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRp
c2hwYXRyYS5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjowNOKAr1BN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gWW8sCj4gPgo+
ID4gT24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMTI6Mzg6MDFQTSAtMDcwMCwgRXZhbiBHcmVlbiB3
cm90ZToKPiA+ID4gUHJvYmluZyBmb3IgbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgdGFrZXMgYWJv
dXQgMC4wNiBzZWNvbmRzLiBPbiBhCj4gPiA+IHN5c3RlbSB3aXRoIDY0IGNvcmVzLCBkb2luZyB0
aGlzIGluIHNtcF9jYWxsaW4oKSBtZWFucyBpdCdzIGRvbmUKPiA+ID4gc2VyaWFsbHksIGV4dGVu
ZGluZyBib290IHRpbWUgYnkgMy44IHNlY29uZHMuIFRoYXQncyBhIGxvdCBvZiBib290IHRpbWUu
Cj4gPiA+Cj4gPiA+IEluc3RlYWQgb2YgbWVhc3VyaW5nIGVhY2ggQ1BVIHNlcmlhbGx5LCBsZXQn
cyBkbyB0aGUgbWVhc3VyZW1lbnRzIG9uCj4gPiA+IGFsbCBDUFVzIGluIHBhcmFsbGVsLiBJZiB3
ZSBkaXNhYmxlIHByZWVtcHRpb24gb24gYWxsIENQVXMsIHRoZQo+ID4gPiBqaWZmaWVzIHN0b3Ag
dGlja2luZywgc28gd2UgY2FuIGRvIHRoaXMgaW4gc3RhZ2VzIG9mIDEpIGV2ZXJ5Ym9keQo+ID4g
PiBleGNlcHQgY29yZSAwLCB0aGVuIDIpIGNvcmUgMC4KPiA+ID4KPiA+ID4gVGhlIG1lYXN1cmVt
ZW50IGNhbGwgaW4gc21wX2NhbGxpbigpIHN0YXlzIGFyb3VuZCwgYnV0IGlzIG5vdwo+ID4gPiBj
b25kaXRpb25hbGl6ZWQgdG8gb25seSBydW4gaWYgYSBuZXcgQ1BVIHNob3dzIHVwIGFmdGVyIHRo
ZSByb3VuZCBvZgo+ID4gPiBpbi1wYXJhbGxlbCBtZWFzdXJlbWVudHMgaGFzIHJ1bi4gVGhlIGdv
YWwgaXMgdG8gaGF2ZSB0aGUgbWVhc3VyZW1lbnQKPiA+ID4gY2FsbCBub3QgcnVuIGR1cmluZyBi
b290IG9yIHN1c3BlbmQvcmVzdW1lLCBidXQgb25seSBvbiBhIGhvdHBsdWcKPiA+ID4gYWRkaXRp
b24uCj4gPiA+Cj4gPiA+IFJlcG9ydGVkLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5l
bC5vcmc+Cj4gPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL21obmctOTM1
OTk5M2QtNjg3Mi00MTM0LTgzY2UtYzk3ZGViZTFjZjlhQHBhbG1lci1yaS14MWM5L1QvI21hZTli
OGY0MDAxNmY5ZGY0Mjg4MjlkMzMzNjAxNDRkYzUwMjZiY2JmCj4gPiA+IEZpeGVzOiA1ODRlYTY1
NjRiY2EgKCJSSVNDLVY6IFByb2JlIGZvciB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIikKPiA+ID4g
U2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cj4gPiA+IFJldmll
d2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gPiBUZXN0
ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+Cj4gPiA+
IC0tLQo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiAgLSBSZW1vdmVkIG5ldyBnbG9i
YWwsIHVzZWQgc3lzdGVtX3N0YXRlID09IFNZU1RFTV9SVU5OSU5HIGluc3RlYWQKPiA+ID4gICAg
KEppc2hlbmcpCj4gPiA+ICAtIEFkZGVkIHRhZ3MKPiA+ID4KPiA+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3B1ZmVhdHVyZS5oIHwgIDIgKy0KPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyAgICAgIHwgMjIgKysrKysrKysrKysrKysrKystLS0tLQo+ID4gPiAgYXJjaC9y
aXNjdi9rZXJuZWwvc21wYm9vdC5jICAgICAgICAgfCAxMSArKysrKysrKysrLQo+ID4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ID4gPiBpbmRleCBkMDM0NWJkNjU5Yzku
LmIxMzk3OTYzOTJkMCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
cHVmZWF0dXJlLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJl
LmgKPiA+ID4gQEAgLTMwLDYgKzMwLDYgQEAgREVDTEFSRV9QRVJfQ1BVKGxvbmcsIG1pc2FsaWdu
ZWRfYWNjZXNzX3NwZWVkKTsKPiA+ID4gIC8qIFBlci1jcHUgSVNBIGV4dGVuc2lvbnMuICovCj4g
PiA+ICBleHRlcm4gc3RydWN0IHJpc2N2X2lzYWluZm8gaGFydF9pc2FbTlJfQ1BVU107Cj4gPiA+
Cj4gPiA+IC12b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MoaW50IGNwdSk7Cj4gPiA+ICtpbnQg
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzcyh2b2lkICp1bnVzZWQpOwo+ID4gPgo+ID4gPiAgI2VuZGlm
Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ID4gaW5kZXggMWNmYmJhNjVkMTFhLi40MGJi
ODU0ZmNiOTYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ID4gQEAgLTU1
Niw4ICs1NTYsOSBAQCB1bnNpZ25lZCBsb25nIHJpc2N2X2dldF9lbGZfaHdjYXAodm9pZCkKPiA+
ID4gICAgICAgcmV0dXJuIGh3Y2FwOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiAtdm9pZCBjaGVja191
bmFsaWduZWRfYWNjZXNzKGludCBjcHUpCj4gPiA+ICtpbnQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
cyh2b2lkICp1bnVzZWQpCj4gPiA+ICB7Cj4gPiA+ICsgICAgIGludCBjcHUgPSBzbXBfcHJvY2Vz
c29yX2lkKCk7Cj4gPiA+ICAgICAgIHU2NCBzdGFydF9jeWNsZXMsIGVuZF9jeWNsZXM7Cj4gPiA+
ICAgICAgIHU2NCB3b3JkX2N5Y2xlczsKPiA+ID4gICAgICAgdTY0IGJ5dGVfY3ljbGVzOwo+ID4g
PiBAQCAtNTcxLDcgKzU3Miw3IEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcyhpbnQgY3B1
KQo+ID4gPiAgICAgICBwYWdlID0gYWxsb2NfcGFnZXMoR0ZQX05PV0FJVCwgZ2V0X29yZGVyKE1J
U0FMSUdORURfQlVGRkVSX1NJWkUpKTsKPiA+ID4gICAgICAgaWYgKCFwYWdlKSB7Cj4gPiA+ICAg
ICAgICAgICAgICAgcHJfd2FybigiQ2FuJ3QgYWxsb2MgcGFnZXMgdG8gbWVhc3VyZSBtZW1jcHkg
cGVyZm9ybWFuY2UiKTsKPiA+ID4gLSAgICAgICAgICAgICByZXR1cm47Cj4gPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPgo+ID4gRHVtYiBxdWVzdGlvbiBtYXliZSwgYnV0IEkgYW0gbGlt
aXRlZCBzZXR1cCB3aXNlIGF0IHRoZSBtb21lbnQgZHVlIHRvCj4gPiBhIGhhcmR3YXJlIGZhaWx1
cmUgd2hpY2ggbWFrZXMgY2hlY2tpbmcgc3R1ZmYgaGFyZCwgd2h5IHRoZSBzaWduYXR1cmUKPiA+
IGNoYW5nZT8gUmVxdWlyZW1lbnQgZm9yIG9uX2VhY2hfY3B1KCk/Cj4gPgo+Cj4gUmVxdWlyZW1l
bnQgZm9yIHNtcF9jYWxsX29uX2NwdS4KClJpZ2h0LgoKPgo+ID4gPiAgICAgICB9Cj4gPiA+Cj4g
PiA+ICAgICAgIC8qIE1ha2UgYW4gdW5hbGlnbmVkIGRlc3RpbmF0aW9uIGJ1ZmZlci4gKi8KPiA+
ID4gQEAgLTY0MywxNSArNjQ0LDI2IEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcyhpbnQg
Y3B1KQo+ID4gPgo+ID4gPiAgb3V0Ogo+ID4gPiAgICAgICBfX2ZyZWVfcGFnZXMocGFnZSwgZ2V0
X29yZGVyKE1JU0FMSUdORURfQlVGRkVSX1NJWkUpKTsKPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4g
PiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nf
bm9uYm9vdF9jcHUodm9pZCAqcGFyYW0pCj4gPiA+ICt7Cj4gPiA+ICsgICAgIGlmIChzbXBfcHJv
Y2Vzc29yX2lkKCkgIT0gMCkKPiA+ID4gKyAgICAgICAgICAgICBjaGVja191bmFsaWduZWRfYWNj
ZXNzKHBhcmFtKTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gLXN0YXRpYyBpbnQgY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19ib290X2NwdSh2b2lkKQo+ID4gPiArc3RhdGljIGludCBjaGVja191bmFsaWdu
ZWRfYWNjZXNzX2FsbF9jcHVzKHZvaWQpCj4gPiA+ICB7Cj4gPiA+IC0gICAgIGNoZWNrX3VuYWxp
Z25lZF9hY2Nlc3MoMCk7Cj4gPiA+ICsgICAgIC8qIENoZWNrIGV2ZXJ5Ym9keSBleGNlcHQgMCwg
d2hvIHN0YXlzIGJlaGluZCB0byB0ZW5kIGppZmZpZXMuICovCj4gPiA+ICsgICAgIG9uX2VhY2hf
Y3B1KGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfbm9uYm9vdF9jcHUsIE5VTEwsIDEpOwo+ID4gPiAr
Cj4gPiA+ICsgICAgIC8qIENoZWNrIGNvcmUgMC4gKi8KPiA+ID4gKyAgICAgc21wX2NhbGxfb25f
Y3B1KDAsIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MsIE5VTEwsIHRydWUpOwo+ID4gPiAgICAgICBy
ZXR1cm4gMDsKPiA+Cj4gPiBXaHkgZG9lcyB0aGlzIGZ1bmN0aW9uIHJldHVybiBhbiBpbnQgaWYg
aXQgY2FuIG9ubHkgcmV0dXJuIDA/Cj4gPgoKVGhpcyBpcyBhIHJlcXVpcmVtZW50IG9uIHRoZSBp
bml0Y2FsbF90IGZ1bmN0aW9uIHBvaW50ZXIgdHlwZS4KCj4KPiBTaG91bGQgd2UgZGVmaW5lIGEg
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19ib290X2NwdSB0byBhdm9pZCB0aGUgcmV0dXJuCj4gdHlw
ZSBjaGFuZ2UgPwo+IFdlIGNhbiBhbHNvIGdldCByaWQgb2YgdGhlIHVudXNlZCBwYXJhbWV0ZXIg
aW4gdGhlCj4gY2hlY2tfdW5hbGlnbmVkX2FjY2VzcyBmdW5jdGlvbi4KCkkgZG9uJ3QgdGhpbmsg
aXQgbWF0dGVycyB0b28gbXVjaCBlaXRoZXIgd2F5LiBJbiBteSBtaW5kIGl0IHNvcnRhCnNoaWZ0
cyB0aGUgYmFsbGFzdCBhcm91bmQgYnV0IGRvZXNuJ3QgcmVhbGx5IGRlY3JlYXNlIGl0LgoKPgo+
IEkgYWxzbyBub3RpY2VkIG9uX2VhY2hfY3B1IGludm9rZXMgdGhlIGZ1bmN0aW9uIHdpdGhpbiBw
cmVlbXB0X2Rpc2FibGUvZW5hYmxlLgo+IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Mgd2lsbCBpbnZv
a2UgaXQgYWdhaW4uIEl0J3MgcHJvYmFibHkgaGFybWxlc3MKPiBidXQgdGhlcmUgaXMgbm8gbmVl
ZCBmb3Igbm9uLWJvb3QgY3B1cy4KPgo+IFdlIGNhbiBqdXN0IGhhdmUgcHJlZW1wdF9kaXNhYmxl
L2VuYWJsZSBhcm91bmQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzcwo+IGluIHRoZSBjaGVja191bmFs
aWduZWRfYWNjZXNzX2Jvb3RfY3B1IGZ1bmN0aW9uLgoKSXQgaXMgaGFybWxlc3MuIEkgaGF2ZW4n
dCB3YWxrZWQgZnVsbHkgdGhyb3VnaCBzbXBfY2FsbF9vbl9jcHUoKSwgYnV0CkknZCBiZSBpbnR1
aXRpdmVseSBxdWl0ZSBzdXJwcmlzZWQgaWYgcHJlZW1wdGlvbiB3ZXJlIGVuYWJsZWQgb24gdGhv
c2UKY2FsbGJhY2tzIHRvbyAoYXMgeW91J2QgYmUgc2F5aW5nICJydW4gbXkgZnVuY3Rpb24gb24g
dGhpcyBjcHUsIGJ1dCBubwpndWFyYW50ZWUgaXQgd2lsbCBzdGF5IHRoZXJlISIpLiBTbyBpbiB0
aGVvcnkgSSBzaG91bGQgYmUgYWJsZSB0bwpyZW1vdmUgdGhlIHByZWVtcHRfZGlzYWJsZS9lbmFi
bGUgZW50aXJlbHkuIEFzIGEgc2lkZSBub3RlOiBJIGFkZGVkCnRoZSBzbXBfY2FsbF9vbl9jcHUo
KSBiZWNhdXNlIEkgY291bGRuJ3QgY29udmluY2UgbXlzZWxmIHRoZSBpbml0Y2FsbHMKd291bGQg
c3RheSBvbiBjcHUgMC4gSW4gcHJhY3RpY2UgdGhleSBhbHdheXMgc2VlbSB0byBiZS4KCgotRXZh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
