Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417A8C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 23:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMhDA1Cgt3ZWQ9O/GLWpt1QKQgWwZIisJJVmiCPzdYU=; b=R57h0gDbDY5Dej
	9QFkGOmvhh+f2VtnNFK4O8DvK8SP0FdOF2ffs4ZcctRO7co6kE3HtZtc41L5IFw5Kp8EfXC1M/eso
	fQv3ePKwjzPAymo1y6JtlRydTg1+8vZ06Y9GtExyZqD4a6xtOLEJXzdZxj+m2S189OTJ/wy7zDS6r
	PEK7owYXlOfKQoqSL+ixpY73rNgCV8DtH1WDj+kQtoKu1VF/3cQqabaJSR/qpQ//wWaMaOoSkvPPp
	LhdkR5CC6IbF4UNUxZrQTdJFnasavCXqJ1LqZf3TucoJuqRq0wJr/AyMD5bkLtxYaFazNiWYQkZ3f
	lOj/2q869JS+J2hHjfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rORCO-004Gtq-02;
	Fri, 12 Jan 2024 23:44:28 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rORCJ-004GqE-1G
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 23:44:25 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2cd5b467209so65858491fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 15:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1705103061; x=1705707861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ao22g8SE+SCQO5FocxYUg5Y/fOEd09Z5JYkiaEBGenk=;
        b=cvo2xpGjusmNCe9vj8qyYDAbs67Qg5Y+bI+Rn0Ic2GSAQJeh6JSQ8EolkNodxBCzSp
         5LSrJM+nmwJvJo65j3X1e70dNKjhiL8DxrnqCNX6PuMjEfkkCD9y00prWlYq9LS1dSlP
         rvWBOQ2Ko3O6SPlV2PBnGf8DcSq9ujjeo53ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705103061; x=1705707861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ao22g8SE+SCQO5FocxYUg5Y/fOEd09Z5JYkiaEBGenk=;
        b=HZksezbwrge7KJM6nWiV6vI/oPD/5kBmpCZvd8v/FGt0K11onZpt2K3d2adg/7yQPb
         9OJnCtx54jnKfZKhC6UwDVVbpABIw6TuhGKNgb52jkskhOay9XC99Mm7FubPIhOCw9Ey
         /50FAgCWSpo5i+Uox8Okt/beGBAkOm7NKyP87fDNf1b7+IVoEl4Lheczq9DhBShf9FQ3
         72YwfdHfe9p3ke892DRt5xhKXBfF9+jXYRm3Ss0REX5OkdX0BnufNY7UB7qNyWzHR+WD
         O/NosHFFvyhFZ1f12uPMyOw4K0MaIbMBmioXN/H3FvRgOMdq6qNI7n2101r0YKyEJ8le
         ygnQ==
X-Gm-Message-State: AOJu0Yw0+HGWCwQdPTy+owFIfLLE9xwqQjn5Sjk2WvMAlMusqPEn/PdC
	0na+c1xVFvYBB+tQxfXoXL0SnEIZH5yimvQiXp4DtKrijgcI
X-Google-Smtp-Source: AGHT+IHI7ywsV+fD9Gr/cA4gFCTeftXlfz+IEzwto5Cqz7c12ZJRt4oUXNh36gnywJ2pR7pW+AGwuuXRMdvQtIZ4YNc=
X-Received: by 2002:a2e:8481:0:b0:2cd:7ac4:f9b5 with SMTP id
 b1-20020a2e8481000000b002cd7ac4f9b5mr1032757ljh.14.1705103059822; Fri, 12 Jan
 2024 15:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20240110073917.2398826-1-peterlin@andestech.com>
 <20240110073917.2398826-3-peterlin@andestech.com> <CAAhSdy1KLSFBA_vD+NX15wuiOsz5QadQWj4ZWOK11qfL1LuHqA@mail.gmail.com>
In-Reply-To: <CAAhSdy1KLSFBA_vD+NX15wuiOsz5QadQWj4ZWOK11qfL1LuHqA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 Jan 2024 15:44:08 -0800
Message-ID: <CAOnJCU+-GZVUUBXxm=biqLjqJwL+AR=PR7_gBAVHUqPPQ2G9og@mail.gmail.com>
Subject: Re: [PATCH v7 02/16] irqchip/riscv-intc: Allow large non-standard
 interrupt number
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_154423_436194_716B0A93 
X-CRM114-Status: GOOD (  26.59  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>, samuel@sholland.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, Randolph <randolph@andestech.com>, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, paul.walmsley@sifive.com, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, chao.wei@sophgo.com, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMTAsIDIwMjQgYXQgNzoxMeKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMTAsIDIwMjQgYXQgMToxMOKAr1BNIFl1
IENoaWVuIFBldGVyIExpbgo+IDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3cm90ZToKPiA+Cj4g
PiBDdXJyZW50bHksIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgUklTQy1WIElOVEMgZHJpdmVy
IHVzZXMgdGhlCj4gPiBpbnRlcnJ1cHQgY2F1c2UgYXMgdGhlIGhhcmR3YXJlIGludGVycnVwdCBu
dW1iZXIsIHdpdGggYSBtYXhpbXVtIG9mCj4gPiA2NCBpbnRlcnJ1cHRzLiBIb3dldmVyLCB0aGUg
cGxhdGZvcm0gY2FuIGV4cGFuZCB0aGUgaW50ZXJydXB0IG51bWJlcgo+ID4gZnVydGhlciBmb3Ig
Y3VzdG9tIGxvY2FsIGludGVycnVwdHMuCj4gPgo+ID4gVG8gZnVsbHkgdXRpbGl6ZSB0aGUgYXZh
aWxhYmxlIGxvY2FsIGludGVycnVwdCBzb3VyY2VzLCBzd2l0Y2gKPiA+IHRvIHVzaW5nIGlycV9k
b21haW5fY3JlYXRlX3RyZWUoKSB0aGF0IGNyZWF0ZXMgdGhlIHJhZGl4IHRyZWUKPiA+IG1hcCwg
YWRkIGdsb2JhbCB2YXJpYWJsZXMgKHJpc2N2X2ludGNfbnJfaXJxcywgcmlzY3ZfaW50Y19jdXN0
b21fYmFzZQo+ID4gYW5kIHJpc2N2X2ludGNfY3VzdG9tX25yX2lycXMpIHRvIGRldGVybWluZSB0
aGUgdmFsaWQgcmFuZ2Ugb2YgbG9jYWwKPiA+IGludGVycnVwdCBudW1iZXIgKGh3aXJxKS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdSBDaGllbiBQZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVj
aC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogUmFuZG9scGggPHJhbmRvbHBoQGFuZGVzdGVjaC5jb20+
Cj4KPiBMb29rcyBnb29kIHRvIG1lLgo+Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+Cj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+ID4gLS0tCj4gPiBDaGFuZ2Vz
IHYxIC0+IHYyOgo+ID4gICAtIEZpeGVkIGlycSBtYXBwaW5nIGZhaWx1cmUgY2hlY2tpbmcgKHN1
Z2dlc3RlZCBieSBDbMOpbWVudCBhbmQgQW51cCkKPiA+IENoYW5nZXMgdjIgLT4gdjM6Cj4gPiAg
IC0gTm8gY2hhbmdlCj4gPiBDaGFuZ2VzIHYzIC0+IHY0OiAoU3VnZ2VzdGVkIGJ5IFRob21hcyBb
MV0pCj4gPiAgIC0gVXNlIHByX3dhcm5fcmF0ZWxpbWl0ZWQgaW5zdGVhZAo+ID4gICAtIEZpeCBj
b2Rpbmcgc3R5bGUgYW5kIGNvbW1pdCBtZXNzYWdlCj4gPiBDaGFuZ2VzIHY0IC0+IHY1OiAoU3Vn
Z2VzdGVkIGJ5IFRob21hcykKPiA+ICAgLSBGaXggY29tbWl0IG1lc3NhZ2UKPiA+IENoYW5nZXMg
djUgLT4gdjY6IChTdWdnZXN0ZWQgYnkgQW51cCBbMl0pCj4gPiAgIC0gQWRkIHJpc2N2X2ludGNf
KiBnbG9iYWwgdmFyaWFibGVzIGZvciBjaGVja2luZyByYW5nZSBpbiByaXNjdl9pbnRjX2RvbWFp
bl9hbGxvYygpCj4gPiAgIC0gQWR2ZXJ0aXNlIHRoZSBudW1iZXIgb2YgaW50ZXJydXB0cyBhbGxv
d2VkCj4gPiBDaGFuZ2VzIHY2IC0+IHY3Ogo+ID4gICAtIE5vIGZ1bmN0aW9uYWwgY2hhbmdlCj4g
Pgo+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNj
di9wYXRjaC8yMDIzMTAyMzAwNDEwMC4yNjYzNDg2LTMtcGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbS8j
MjU1NzMwODUKPiA+IFsyXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGlu
dXgtcmlzY3YvcGF0Y2gvMjAyMzEyMTMwNzAzMDEuMTY4NDc1MS0zLXBldGVybGluQGFuZGVzdGVj
aC5jb20vIzI1NjM2NTg5Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlu
dGMuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW50Yy5jCj4gPiBpbmRleCBlOGQwMWIxNGNjZGQuLmIxM2ExNmIxNjRjOSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gPiArKysgYi9kcml2
ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ID4gQEAgLTE5LDE1ICsxOSwxNyBAQAo+ID4g
ICNpbmNsdWRlIDxsaW51eC9zbXAuaD4KPiA+Cj4gPiAgc3RhdGljIHN0cnVjdCBpcnFfZG9tYWlu
ICppbnRjX2RvbWFpbjsKPiA+ICtzdGF0aWMgdW5zaWduZWQgaW50IHJpc2N2X2ludGNfbnJfaXJx
cyBfX3JvX2FmdGVyX2luaXQ7Cj4gPiArc3RhdGljIHVuc2lnbmVkIGludCByaXNjdl9pbnRjX2N1
c3RvbV9iYXNlIF9fcm9fYWZ0ZXJfaW5pdDsKPiA+ICtzdGF0aWMgdW5zaWduZWQgaW50IHJpc2N2
X2ludGNfY3VzdG9tX25yX2lycXMgX19yb19hZnRlcl9pbml0Owo+ID4KPiA+ICBzdGF0aWMgYXNt
bGlua2FnZSB2b2lkIHJpc2N2X2ludGNfaXJxKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gIHsK
PiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBjYXVzZSA9IHJlZ3MtPmNhdXNlICYgfkNBVVNFX0lS
UV9GTEFHOwo+ID4KPiA+IC0gICAgICAgaWYgKHVubGlrZWx5KGNhdXNlID49IEJJVFNfUEVSX0xP
TkcpKQo+ID4gLSAgICAgICAgICAgICAgIHBhbmljKCJ1bmV4cGVjdGVkIGludGVycnVwdCBjYXVz
ZSIpOwo+ID4gLQo+ID4gLSAgICAgICBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKGludGNfZG9t
YWluLCBjYXVzZSk7Cj4gPiArICAgICAgIGlmIChnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKGlu
dGNfZG9tYWluLCBjYXVzZSkpCj4gPiArICAgICAgICAgICAgICAgcHJfd2Fybl9yYXRlbGltaXRl
ZCgiRmFpbGVkIHRvIGhhbmRsZSBpbnRlcnJ1cHQgKGNhdXNlOiAlbGQpXG4iLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2F1c2UpOwo+ID4gIH0KPiA+Cj4gPiAgLyoK
PiA+IEBAIC05Myw2ICs5NSwxNCBAQCBzdGF0aWMgaW50IHJpc2N2X2ludGNfZG9tYWluX2FsbG9j
KHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sCj4gPiAgICAgICAgIGlmIChyZXQpCj4gPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Cj4gPiArICAgICAgIC8qCj4gPiArICAgICAgICAq
IE9ubHkgYWxsb3cgaHdpcnEgZm9yIHdoaWNoIHdlIGhhdmUgY29ycmVzcG9uZGluZyBzdGFuZGFy
ZCBvcgo+ID4gKyAgICAgICAgKiBjdXN0b20gaW50ZXJydXB0IGVuYWJsZSByZWdpc3Rlci4KPiA+
ICsgICAgICAgICovCj4gPiArICAgICAgIGlmICgocmlzY3ZfaW50Y19ucl9pcnFzIDw9IGh3aXJx
ICYmIGh3aXJxIDwgcmlzY3ZfaW50Y19jdXN0b21fYmFzZSkgfHwKPiA+ICsgICAgICAgICAgIChy
aXNjdl9pbnRjX2N1c3RvbV9iYXNlICsgcmlzY3ZfaW50Y19jdXN0b21fbnJfaXJxcykgPD0gaHdp
cnEpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gPiAgICAgICAg
IGZvciAoaSA9IDA7IGkgPCBucl9pcnFzOyBpKyspIHsKPiA+ICAgICAgICAgICAgICAgICByZXQg
PSByaXNjdl9pbnRjX2RvbWFpbl9tYXAoZG9tYWluLCB2aXJxICsgaSwgaHdpcnEgKyBpKTsKPiA+
ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4gQEAgLTExNyw4ICsxMjcsNyBAQCBzdGF0aWMg
aW50IF9faW5pdCByaXNjdl9pbnRjX2luaXRfY29tbW9uKHN0cnVjdCBmd25vZGVfaGFuZGxlICpm
bikKPiA+ICB7Cj4gPiAgICAgICAgIGludCByYzsKPiA+Cj4gPiAtICAgICAgIGludGNfZG9tYWlu
ID0gaXJxX2RvbWFpbl9jcmVhdGVfbGluZWFyKGZuLCBCSVRTX1BFUl9MT05HLAo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcmlzY3ZfaW50Y19kb21h
aW5fb3BzLCBOVUxMKTsKPiA+ICsgICAgICAgaW50Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0
ZV90cmVlKGZuLCAmcmlzY3ZfaW50Y19kb21haW5fb3BzLCBOVUxMKTsKPiA+ICAgICAgICAgaWYg
KCFpbnRjX2RvbWFpbikgewo+ID4gICAgICAgICAgICAgICAgIHByX2VycigidW5hYmxlIHRvIGFk
ZCBJUlEgZG9tYWluXG4iKTsKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOWElPOwo+ID4g
QEAgLTEzMiw3ICsxNDEsMTAgQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2Nv
bW1vbihzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZm4pCj4gPgo+ID4gICAgICAgICByaXNjdl9zZXRf
aW50Y19od25vZGVfZm4ocmlzY3ZfaW50Y19od25vZGUpOwo+ID4KPiA+IC0gICAgICAgcHJfaW5m
bygiJWQgbG9jYWwgaW50ZXJydXB0cyBtYXBwZWRcbiIsIEJJVFNfUEVSX0xPTkcpOwo+ID4gKyAg
ICAgICBwcl9pbmZvKCIlZCBsb2NhbCBpbnRlcnJ1cHRzIG1hcHBlZFxuIiwgcmlzY3ZfaW50Y19u
cl9pcnFzKTsKPiA+ICsgICAgICAgaWYgKHJpc2N2X2ludGNfY3VzdG9tX25yX2lycXMpCj4gPiAr
ICAgICAgICAgICAgICAgcHJfaW5mbygiJWQgY3VzdG9tIGxvY2FsIGludGVycnVwdHMgbWFwcGVk
XG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmlzY3ZfaW50Y19jdXN0b21fbnJfaXJx
cyk7Cj4gPgo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPiBAQCAtMTY2LDYgKzE3OCwx
MCBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2luaXQoc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlLAo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gICAgICAgICB9Cj4gPgo+
ID4gKyAgICAgICByaXNjdl9pbnRjX25yX2lycXMgPSBCSVRTX1BFUl9MT05HOwo+ID4gKyAgICAg
ICByaXNjdl9pbnRjX2N1c3RvbV9iYXNlID0gcmlzY3ZfaW50Y19ucl9pcnFzOwo+ID4gKyAgICAg
ICByaXNjdl9pbnRjX2N1c3RvbV9ucl9pcnFzID0gMDsKPiA+ICsKPiA+ICAgICAgICAgcmV0dXJu
IHJpc2N2X2ludGNfaW5pdF9jb21tb24ob2Zfbm9kZV90b19md25vZGUobm9kZSkpOwo+ID4gIH0K
PiA+Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgoKClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRp
c2hwQHJpdm9zaW5jLmNvbT4KCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
