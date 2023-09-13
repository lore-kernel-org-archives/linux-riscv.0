Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8931EDEC4E
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39+K8HFrtAHMo/HkGu+1z5VvmDShA8PmMgsiYhvKVOk=; b=O3FEpQ5mAoGqbu
	ZzbP6umZ2uziK7jgAlBZP3nP182jQ6TfazVbd0jFKTtdsgtwYVEzMWQERi6w83HZmI6ZzxDOZZf2f
	ZKLB75ORkZXjZUDdUKryQ9hZfxtzpx763phxIxGkG0Bh2y9Sfywjbh+mndHBaTKAzGZF5q9aMaaPf
	/MlVRQGs+FDpd15ntKgJ0cyH8YxLj5x7Bd3lXNLJU8vMK58y4VUA9aZ0jQG1h9wGFi8qvnPDMGY5G
	MEEZ9ZLBWQlMun4ORP0FqkFqnEa2pGcmdfuI9mjxN0UTE5Ae4uxy6ezGQKdm8kSYmAkNWTCyvyX7M
	0cKCriYrKnYXCZT09HQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPMD-005u50-0E;
	Wed, 13 Sep 2023 12:52:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPM8-005u3w-1R
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 12:52:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B43EE6194D
	for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 12:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E17DC433A9
	for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694609551;
	bh=D2yTmI5mmzTW+iHmuYtFAVHVgFprFMquzoJG0XHk9mY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jLbYg9+lvwvF9g6Gzkp32rLzFct1AYEvyFblrgfdogy3rFxqbyRNys4dniNEV2uY5
	 nOe5Uz3nolhE3FN39BV/UqGkWDbU4ziXFzFWK6u3xLWpElf/wkqfKZg75txI3/Xdl1
	 u2aVr3lYI5QcjC8PEEAnMVH/i2l25qtLPa5KssBR/umBr395+GeU1u7dgSHF4+nMld
	 Jc6iurwNwapx7fV0M4ByfPLNdLGNpswYYe8Gol96hkHCT7wu3X1mV56n9E+C+hEXq0
	 0BYlIzcAxZJt0l8+Urs6wHHPXm5OAVzYdAoC9xpvcxlU1+jpgItMkzmY7R7ICI6TC/
	 9rSlusN9Qdzag==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2bfb17435e4so17780211fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 05:52:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YySm9dsszDCy2oWh7c57ehJPV2fePTVZ5LmHGcwDDQJ/PAr5C8p
	GEHuaIsf9sajcXCMc8a1o+RV3K/Vwbiw0GnHYQA=
X-Google-Smtp-Source: AGHT+IGLa36Mv9VZMwcFAm7pr5KGpJYN8bFmsK6RHp2UXPGlGeRTY2NMaKQac0gjfg8fITbp0O+QfICTV/S409jzbrQ=
X-Received: by 2002:a2e:9f06:0:b0:2bd:beb:4aca with SMTP id
 u6-20020a2e9f06000000b002bd0beb4acamr2237707ljk.13.1694609549439; Wed, 13 Sep
 2023 05:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910082911.3378782-5-guoren@kernel.org>
 <f091ead0-99b9-b30a-a295-730ce321ac60@redhat.com> <CAJF2gTSbUUdLhN8PFdFzQd0M1T2MVOL1cdZn46WKq1S8MuQYHw@mail.gmail.com>
 <06714da1-d566-766f-7a13-a3c93b5953c4@redhat.com> <CAJF2gTQ3Q7f+FGorVTR66c6TGWsSeeKVvLF+LH1_m3kSHrm0yA@mail.gmail.com>
 <ZQF49GIZoFceUGYH@redhat.com>
In-Reply-To: <ZQF49GIZoFceUGYH@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Sep 2023 20:52:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTHdCr-FQVSGUc+LapkJPmDiEYYa_1P6T86uCjRujgnTg@mail.gmail.com>
Message-ID: <CAJF2gTTHdCr-FQVSGUc+LapkJPmDiEYYa_1P6T86uCjRujgnTg@mail.gmail.com>
Subject: Re: [PATCH V11 04/17] locking/qspinlock: Improve xchg_tail for number
 of cpus >= 16k
To: Leonardo Bras <leobras@redhat.com>
Cc: Waiman Long <longman@redhat.com>, paul.walmsley@sifive.com, anup@brainfault.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_055232_575864_D1211CED 
X-CRM114-Status: GOOD (  34.76  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgNDo1NeKAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAxMiwgMjAyMyBhdCAwOToxMDowOEFN
ICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgOTowM+KA
r1BNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBP
biA5LzEwLzIzIDIzOjA5LCBHdW8gUmVuIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgU2VwIDExLCAy
MDIzIGF0IDEwOjM14oCvQU0gV2FpbWFuIExvbmcgPGxvbmdtYW5AcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gPiA+ID4+Cj4gPiA+ID4+IE9uIDkvMTAvMjMgMDQ6MjgsIGd1b3JlbkBrZXJuZWwub3JnIHdy
b3RlOgo+ID4gPiA+Pj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
ID4gPiA+Pj4KPiA+ID4gPj4+IFRoZSB0YXJnZXQgb2YgeGNoZ190YWlsIGlzIHRvIHdyaXRlIHRo
ZSB0YWlsIHRvIHRoZSBsb2NrIHZhbHVlLCBzbwo+ID4gPiA+Pj4gYWRkaW5nIHByZWZldGNodyBj
b3VsZCBoZWxwIHRoZSBuZXh0IGNtcHhjaGcgc3RlcCwgd2hpY2ggbWF5Cj4gPiA+ID4+PiBkZWNy
ZWFzZSB0aGUgY21weGNoZyByZXRyeSBsb29wcyBvZiB4Y2hnX3RhaWwuIFNvbWUgcHJvY2Vzc29y
cyBtYXkKPiA+ID4gPj4+IHV0aWxpemUgdGhpcyBmZWF0dXJlIHRvIGdpdmUgYSBmb3J3YXJkIGd1
YXJhbnRlZSwgZS5nLiwgUklTQy1WCj4gPiA+ID4+PiBYdWFuVGllIHByb2Nlc3NvcnMgd291bGQg
YmxvY2sgdGhlIHNub29wIGNoYW5uZWwgJiBpcnEgZm9yIHNldmVyYWwKPiA+ID4gPj4+IGN5Y2xl
cyB3aGVuIHByZWZldGNoLncgaW5zdHJ1Y3Rpb24gKGZyb20gWmljYm9wIGV4dGVuc2lvbikgcmV0
aXJlZCwKPiA+ID4gPj4+IHdoaWNoIGd1YXJhbnRlZXMgdGhlIG5leHQgY21weGNoZyBzdWNjZWVk
cy4KPiA+ID4gPj4+Cj4gPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGlu
dXguYWxpYmFiYS5jb20+Cj4gPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KPiA+ID4gPj4+IC0tLQo+ID4gPiA+Pj4gICAga2VybmVsL2xvY2tpbmcvcXNw
aW5sb2NrLmMgfCA1ICsrKystCj4gPiA+ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gZGlmZiAtLWdpdCBhL2tl
cm5lbC9sb2NraW5nL3FzcGlubG9jay5jIGIva2VybmVsL2xvY2tpbmcvcXNwaW5sb2NrLmMKPiA+
ID4gPj4+IGluZGV4IGQzZjk5MDYwYjYwZi4uOTZiNTRlMmFkZTg2IDEwMDY0NAo+ID4gPiA+Pj4g
LS0tIGEva2VybmVsL2xvY2tpbmcvcXNwaW5sb2NrLmMKPiA+ID4gPj4+ICsrKyBiL2tlcm5lbC9s
b2NraW5nL3FzcGlubG9jay5jCj4gPiA+ID4+PiBAQCAtMjIzLDcgKzIyMywxMCBAQCBzdGF0aWMg
X19hbHdheXNfaW5saW5lIHZvaWQgY2xlYXJfcGVuZGluZ19zZXRfbG9ja2VkKHN0cnVjdCBxc3Bp
bmxvY2sgKmxvY2spCj4gPiA+ID4+PiAgICAgKi8KPiA+ID4gPj4+ICAgIHN0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgdTMyIHhjaGdfdGFpbChzdHJ1Y3QgcXNwaW5sb2NrICpsb2NrLCB1MzIgdGFpbCkK
PiA+ID4gPj4+ICAgIHsKPiA+ID4gPj4+IC0gICAgIHUzMiBvbGQsIG5ldywgdmFsID0gYXRvbWlj
X3JlYWQoJmxvY2stPnZhbCk7Cj4gPiA+ID4+PiArICAgICB1MzIgb2xkLCBuZXcsIHZhbDsKPiA+
ID4gPj4+ICsKPiA+ID4gPj4+ICsgICAgIHByZWZldGNodygmbG9jay0+dmFsKTsKPiA+ID4gPj4+
ICsgICAgIHZhbCA9IGF0b21pY19yZWFkKCZsb2NrLT52YWwpOwo+ID4gPiA+Pj4KPiA+ID4gPj4+
ICAgICAgICBmb3IgKDs7KSB7Cj4gPiA+ID4+PiAgICAgICAgICAgICAgICBuZXcgPSAodmFsICYg
X1FfTE9DS0VEX1BFTkRJTkdfTUFTSykgfCB0YWlsOwo+ID4gPiA+PiBUaGF0IGxvb2tzIGEgYml0
IHdlaXJkLiBZb3UgcHJlLWZldGNoIGFuZCB0aGVuIGltbWVkaWF0ZWx5IHJlYWQgaXQuIEhvdwo+
ID4gPiA+PiBtdWNoIHBlcmZvcm1hbmNlIGdhaW4geW91IGdldCBieSB0aGlzIGNoYW5nZSBhbG9u
ZT8KPiA+ID4gPj4KPiA+ID4gPj4gTWF5YmUgeW91IGNhbiBkZWZpbmUgYW4gYXJjaCBzcGVjaWZp
YyBwcmltaXRpdmUgdGhhdCBkZWZhdWx0IGJhY2sgdG8KPiA+ID4gPj4gYXRvbWljX3JlYWQoKSBp
ZiBub3QgZGVmaW5lZC4KPiA+ID4gPiBUaHggZm9yIHRoZSByZXBseS4gVGhpcyBpcyBhIGdlbmVy
aWMgb3B0aW1pemF0aW9uIHBvaW50IEkgd291bGQgbGlrZQo+ID4gPiA+IHRvIHRhbGsgYWJvdXQg
d2l0aCB5b3UuCj4gPiA+ID4KPiA+ID4gPiBGaXJzdCwgcHJlZmV0Y2h3KCkgbWFrZXMgY2FjaGVs
aW5lIGFuIGV4Y2x1c2l2ZSBzdGF0ZSBhbmQgc2VydmVzIGZvcgo+ID4gPiA+IHRoZSBuZXh0IGNt
cHhjaGcgbG9vcCBzZW1hbnRpYywgd2hpY2ggd3JpdGVzIHRoZSBpZHhfdGFpbCBwYXJ0IG9mCj4g
PiA+ID4gYXJjaF9zcGluX2xvY2suIFRoZSBhdG9taWNfcmVhZCBvbmx5IG1ha2VzIGNhY2hlbGlu
ZSBpbiB0aGUgc2hhcmVkCj4gPiA+ID4gc3RhdGUsIHdoaWNoIGNvdWxkbid0IGdpdmUgYW55IGd1
YXJhbnRlZSBmb3IgdGhlIG5leHQgY21weGNoZyBsb29wCj4gPiA+ID4gc2VtYW50aWMuIE1pY3Jv
LWFyY2hpdGVjdHVyZSBjb3VsZCB1dGlsaXplIHByZWZldGNodygpIHRvIHByb3ZpZGUgYQo+ID4g
PiA+IHN0cm9uZyBmb3J3YXJkIHByb2dyZXNzIGd1YXJhbnRlZSBmb3IgdGhlIHhjaGdfdGFpbCwg
ZS5nLiwgdGhlIFQtSEVBRAo+ID4gPiA+IFh1YW5UaWUgcHJvY2Vzc29yIHdvdWxkIGhvbGQgdGhl
IGV4Y2x1c2l2ZSBjYWNoZWxpbmUgc3RhdGUgdW50aWwgdGhlCj4gPiA+ID4gbmV4dCBjbXB4Y2hn
IHdyaXRlIHN1Y2Nlc3MuCj4gPiA+ID4KPiA+ID4gPiBJbiB0aGUgZW5kLCBMZXQncyBnbyBiYWNr
IHRvIHRoZSBwcmluY2lwbGU6IHRoZSB4Y2hnX3RhaWwgaXMgYW4gYXRvbWljCj4gPiA+ID4gc3dh
cCBvcGVyYXRpb24gdGhhdCBjb250YWlucyB3cml0ZSBldmVudHVhbGx5LCBzbyBnaXZpbmcgYSBw
cmVmZXRjaHcoKQo+ID4gPiA+IGF0IHRoZSBiZWdpbm5pbmcgaXMgYWNjZXB0YWJsZSBmb3IgYWxs
IGFyY2hpdGVjdHVyZXMuLgo+ID4gPiA+IOKAouKAouKAouKAouKAouKAouKAouKAouKAouKAouKA
ouKAogo+ID4gPgo+ID4gPiBJIGRpZCByZWFsaXplIGFmdGVyd2FyZCB0aGF0IHByZWZldGNodyBn
ZXRzIHRoZSBjYWNoZWxpbmUgaW4gZXhjbHVzaXZlCj4gPiA+IHN0YXRlLiBJIHdpbGwgc3VnZ2Vz
dCB5b3UgbWVudGlvbiB0aGF0IGluIHlvdXIgY29tbWl0IGxvZyBhcyB3ZWxsIGFzCj4gPiA+IGFk
ZGluZyBhIGNvbW1lbnQgYWJvdXQgaXRzIHB1cnBvc2UgaW4gdGhlIGNvZGUuCj4gPiBPa2F5LCBJ
IHdvdWxkIGRvIHRoYXQgaW4gdjEyLCB0aHguCj4KPiBJIHdvdWxkIHN1Z2dlc3QgYWRkaW5nIGEg
c25pcHBldCBmcm9tIHRoZSBJU0EgRXh0ZW5zdGlvbiBkb2M6Cj4KPiAiQSBwcmVmZXRjaC53IGlu
c3RydWN0aW9uIGluZGljYXRlcyB0byBoYXJkd2FyZSB0aGF0IHRoZSBjYWNoZSBibG9jayB3aG9z
ZQo+IGVmZmVjdGl2ZSBhZGRyZXNzIGlzIHRoZSBzdW0gb2YgdGhlIGJhc2UgYWRkcmVzcyBzcGVj
aWZpZWQgaW4gcnMxIGFuZCB0aGUKPiBzaWduLWV4dGVuZGVkIG9mZnNldCBlbmNvZGVkIGluIGlt
bVsxMTowXSwgd2hlcmUgaW1tWzQ6MF0gZXF1YWxzIDBiMDAwMDAsCj4gaXMgbGlrZWx5IHRvIGJl
IGFjY2Vzc2VkIGJ5IGEgZGF0YSB3cml0ZSAoaS5lLiBzdG9yZSkgaW4gdGhlIG5lYXIgZnV0dXJl
LiIKR29vZCBwb2ludCwgdGh4LgoKPgo+IE90aGVyIHRoYW4gdGhhdCwKPiBSZXZpZXdlZC1ieTog
TGVvbmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPgo+Cj4KPiA+Cj4gPiA+Cj4gPiA+IFRo
YW5rcywKPiA+ID4gTG9uZ21hbgo+ID4gPgo+ID4gPiA+PiBDaGVlcnMsCj4gPiA+ID4+IExvbmdt
YW4KPiA+ID4gPj4KPiA+ID4gPgo+ID4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gQmVzdCBSZWdhcmRz
Cj4gPiAgR3VvIFJlbgo+ID4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
