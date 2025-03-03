Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17564C282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mASRiEhYfwQsmCavvEUd8M1UtyBxfnwuxjceuK6UMzg=; b=qEzBmC49TtoQhV
	I+o4+cgjMyf5mlh3lf7MhfbNrTcfdvnLbrhTHl4DriVax/nRv3wsZ915jN0+ocaiy6n5Vcjfx427b
	VDLtm52/LnoBJBzex32WiE9LqdnD1QzYQTmm8cJCLBYbBDF4PLFi8w4zRfo/8YQcomV5ne8kYrbu+
	nu96Y9H8rinbJkTmo3/XpHuXQSzreUiBdhxalLDZ/SPxj8Hnbr/HC+SafQTWBw7+8g7dJB58Xx3mb
	8mZK+6gN8iHfABppBZQ2zklCh1TWe7NTJq8kRJdj8bNDPMJq7n2sVAFmiqN7+sYKpB8pDXOXTRKhl
	nBWlR9XQENcb32uMgo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0Da-0000000HQqZ-3hqM;
	Mon, 03 Mar 2025 07:28:02 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0DY-0000000HQp6-01Jt
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 07:28:01 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-71e10e6a1ceso977047a34.0
        for <linux-riscv@lists.infradead.org>; Sun, 02 Mar 2025 23:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740986879; x=1741591679; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqQf+xJ+QQAO3X5FgRqwqBs+4VjeomCIEb383qkkc70=;
        b=YiO+Ku6+Httq798eClWnJWy8yvh5kZz4RhCuVGPi5Z5qYN1v0tLNSkAOYDk92VcdS6
         2PLhL/tyTwL4oiJiaTFpS4L1bl6TTq5ZDBkWZn8dwEGb5RjNfXKjnW3Hx6J2kss2daYq
         IYGEfT/YMGbcMRVfZWjSbcijJ6FqYdrIRyo8XHV53+ehLplPm6OJMpmTCFnI8AGR1DOc
         KhIWrd4NHQuL/U6bECy5pvyl5hL6mAbbcar/30Fk1a1ec1jJmYOrkNIncM6jBlfDbe2+
         nnXwpPePmp5SdC+eqDeeCgsssFaNdJANUgNQ2eJflW4ZyQUupdaBQsHbkB5lFMqVBwz3
         e9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986879; x=1741591679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqQf+xJ+QQAO3X5FgRqwqBs+4VjeomCIEb383qkkc70=;
        b=sZ78G9CseXVVbMTl9c1OfxmRe7aX1NRQugqx6UU70RKCSn0v12nRZ7x7QhuOX5hRcl
         s1T5rRr0cAxbctaKBVuq7T+bXhoEXLFgtvIBxJJEWLvGmYLL7ga/BRvKL5U9fSY58AoV
         4pIXmkTeBbdCWrLyZK+W1SYJl5uCP3kycJyiWeNR74GLBlIRIiOFRMu5y5DmoiGMkltV
         U8mirbxts5qEeW7vgx/il5jtQ6HAnchwuDdR4Jepo0zB207Otx6KE4jxrLvl3WaniErH
         A7/TzSQuUXsKbVig4sPTuRYoWX23A8llbK/myjpQ954n7JUy02IAsfwkzTwZi0nfIiPV
         hv4g==
X-Forwarded-Encrypted: i=1; AJvYcCULc/j8ZZrswlCzuTMXh3dsss7XPH6F5OmfaajWM91733wv1dSX7QY+VfEdDDKSC+NUqKwg9x8Yao0aFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGO4U8+Dd21Ec9tuMvUNd4FBCtDXHQ2mUtsgSLeKscKWmdPk2i
	pyJD65AkKnDD3Y2AwCCTPHOWZ+teDoyG2xfs9TIDbseZbg9WS/NlAC4eSBdm0RvzRLvj/4xO72U
	Rw+PfJAtHg/06EYwqfA8+eKqhgHROduH4pBzNAQ==
X-Gm-Gg: ASbGnctJPkLC1xcDwOezLYZKlgvpdy5Uj8skmgbI8HNBpI/wVN9MxabqOI4T4ZjIFqK
	9xbJKcU6CdY3BgLp3Kv0I7HRvoEiMGxHBsJPtyEnki3yem290tXnzWlZpHB3jJ+EydLS4wRaQ16
	TU5SxqzIQayRGxg4Kqyn2EnTjzfC6u
X-Google-Smtp-Source: AGHT+IGdGihCdXsHvPy1HB+Hi01lhvTlT2V3S/bXdVPc4cd4/qzcouwXquivhfRUZCtj9S8/0Uw/BjeV/TL6JLeNSuQ=
X-Received: by 2002:a05:6830:348d:b0:727:3380:66ce with SMTP id
 46e09a7af769-728b830562fmr6634750a34.25.1740986878930; Sun, 02 Mar 2025
 23:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20250201110607.34766-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=uYad7UAedSU4M_L277v=RQGWHpJQwOW-p7W6=hcijsQ@mail.gmail.com>
 <CAHVXubhW9b6fw8ZvHtn7zmyRSUVt-3JjmFbE-_L42wZ9W6=vKA@mail.gmail.com>
 <CAEEQ3wmAxF=PkRt_pKFZE5-r9w1SMY7YQtco2mCyE+vus7vufg@mail.gmail.com> <CAHVXubiHhDgC4=T7xCxK9hoCG7R2KZ46LRPmS8rgYuT7EiQDcg@mail.gmail.com>
In-Reply-To: <CAHVXubiHhDgC4=T7xCxK9hoCG7R2KZ46LRPmS8rgYuT7EiQDcg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 3 Mar 2025 15:27:48 +0800
X-Gm-Features: AQ5f1JrsGJklPaO7yuMRDKV0ZqC70eeIlZ0wPBsVlz4-JWSVixlDQ5gxzrmW-PQ
Message-ID: <CAEEQ3wk9MWBG_neU5Ez9if9UcSsv9Q-EMm0gA2vjt8527rUujQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: print hartid on bringup
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: apatel@ventanamicro.com, atishp@rivosinc.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com, 
	jassisinghbrar@gmail.com, takakura@valinux.co.jp, 
	valentina.fernandezalanis@microchip.com, ruanjinjie@huawei.com, 
	charlie@rivosinc.com, conor.dooley@microchip.com, haibo1.xu@intel.com, 
	andybnac@gmail.com, ke.zhao@shingroup.cn, tglx@linutronix.de, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_232800_043102_B90238BB 
X-CRM114-Status: GOOD (  26.33  )
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

SGkgQWxleCwKCk9uIEZyaSwgRmViIDI4LCAyMDI1IGF0IDQ6MTnigK9QTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpLAo+Cj4gT24g
RnJpLCBGZWIgMjgsIDIwMjUgYXQgNzo0MeKAr0FNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbGV4LAo+ID4KPiA+IE9uIFdlZCwgRmViIDI2
LCAyMDI1IGF0IDEwOjU44oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgWXVuaHVpLAo+ID4gPgo+ID4gPiBPbiBUaHUsIEZl
YiAyMCwgMjAyNSBhdCAxOjU04oCvUE0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5j
b20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgQWxsLAo+ID4gPiA+Cj4gPiA+ID4gR2VudGxl
IHBpbmcuIEFueSBjb21tZW50cyBvbiB0aGlzIHBhdGNoPwo+ID4gPiA+Cj4gPiA+ID4gT24gU2F0
LCBGZWIgMSwgMjAyNSBhdCA3OjA24oCvUE0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEZpcm13YXJlIHJhbmRvbWx5IHJlbGVh
c2VzIGNvcmVzLCBzbyBDUFUgbnVtYmVycyBkb24ndCBsaW5lYXJseSBtYXAKPiA+ID4gPiA+IHRv
IGhhcnRpZHMuIFdoZW4gdGhlIHN5c3RlbSBoYXMgYW4gZXhjZXB0aW9uLCB3ZSBjYXJlIG1vcmUg
YWJvdXQgaGFydGlkcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkg
Q3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGFy
Y2gvcmlzY3Yva2VybmVsL3NtcC5jICAgICB8IDIgKysKPiA+ID4gPiA+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9zbXBib290LmMgfCA0ICsrKysKPiA+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9zbXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jCj4gPiA+ID4gPiBpbmRleCBkNThi
NWU3NTEyODYuLmU2NTBkZWM0NDgxNyAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NtcC5jCj4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYwo+ID4g
PiA+ID4gQEAgLTQ4LDYgKzQ4LDggQEAgRVhQT1JUX1NZTUJPTF9HUEwoX19jcHVpZF90b19oYXJ0
aWRfbWFwKTsKPiA+ID4gPiA+ICB2b2lkIF9faW5pdCBzbXBfc2V0dXBfcHJvY2Vzc29yX2lkKHZv
aWQpCj4gPiA+ID4gPiAgewo+ID4gPiA+ID4gICAgICAgICBjcHVpZF90b19oYXJ0aWRfbWFwKDAp
ID0gYm9vdF9jcHVfaGFydGlkOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBwcl9pbmZv
KCJCb290aW5nIExpbnV4IG9uIGhhcnRpZCAlbHVcbiIsIGJvb3RfY3B1X2hhcnRpZCk7Cj4gPiA+
ID4gPiAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+ICBzdGF0aWMgREVGSU5FX1BFUl9DUFVfUkVBRF9N
T1NUTFkoaW50LCBpcGlfZHVtbXlfZGV2KTsKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zbXBib290LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiA+ID4g
PiA+IGluZGV4IGUzNmQyMDIwNWJkNy4uYmViYTBlZmIwMGI5IDEwMDY0NAo+ID4gPiA+ID4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zbXBib290LmMKPiA+ID4gPiA+IEBAIC0yMzEsNiArMjMxLDEwIEBAIGFzbWxpbmth
Z2UgX192aXNpYmxlIHZvaWQgc21wX2NhbGxpbih2b2lkKQo+ID4gPiA+ID4gICAgICAgICByaXNj
dl9pcGlfZW5hYmxlKCk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICBudW1hX2FkZF9jcHUo
Y3Vycl9jcHVpZCk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHByX2luZm8oIkNQVSV1
OiBCb290ZWQgc2Vjb25kYXJ5IGhhcnRpZCAlbHVcbiIsIGN1cnJfY3B1aWQsCj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgY3B1aWRfdG9faGFydGlkX21hcChjdXJyX2NwdWlkKSk7Cj4gPiA+ID4g
PiArCj4gPiA+ID4gPiAgICAgICAgIHNldF9jcHVfb25saW5lKGN1cnJfY3B1aWQsIHRydWUpOwo+
ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgLyoKPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiAyLjM5
LjIKPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gWXVuaHVpCj4gPiA+
Cj4gPiA+IElJUkMgdGhhdCdzIGEgZGVidWcgZmVhdHVyZSB3aGVuIHlvdSBjYW4ndCByZWFjaCB1
c2Vyc3BhY2UgYW5kIHVzZQo+ID4gPiBjcHVpbmZvLCBzbyB3aGF0IGFib3V0IHVzaW5nIHByX2Rl
YnVnKCkgaW5zdGVhZD8KPiA+Cj4gPiBVc2luZyBwcl9kZWJ1ZyBuZWVkcyBlbmFibGluZyAjZGVm
aW5lIERFQlVHIGluCj4gPiBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYW5kIGFkZGluZyBs
b2dsZXZlbD04IHRvIGNtZGxpbmUsIG5vdAo+ID4gY29udmVuaWVudC4KPgo+IFlvdSBjYW4gYWxz
byB1c2UgYSBrZXJuZWwgY29tbWFuZCBsaW5lIHBhcmFtZXRlciB0byBlbmFibGUgYQo+IHByX2Rl
YnVnKCkgc3RhdGVtZW50Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3Qv
YWRtaW4tZ3VpZGUvZHluYW1pYy1kZWJ1Zy1ob3d0by5odG1sI2RlYnVnLW1lc3NhZ2VzLWR1cmlu
Zy1ib290LXByb2Nlc3MKClVtbSwgaXQgd29ya3MuIEknbGwgdXBkYXRlIHYyLgoKPgo+IEFsZXgK
Pgo+ID4gQ2FuJ3QgYWx3YXlzIGNhdCAvcHJvYy9jcHVpbmZvIGJlZm9yZSBydW5uaW5nIGluIHVz
ZXIKPiA+IG1vZGUuCj4gPiBJdCdzIHRydWUgdGhhdCBwcl9pbmZvIHByaW50cyBhIGxhcmdlIGFt
b3VudCBvZiBpbmZvcm1hdGlvbiBpbiB0aGUKPiA+IHN0YXJ0dXAgbG9ncywgZXNwZWNpYWxseSB3
aGVuIHRoZXJlIGFyZSBtYW55IENQVSBjb3Jlcy4KPiA+Cj4gPiBEbyB5b3UgaGF2ZSBhIGJldHRl
ciBzb2x1dGlvbj8KPiA+Cj4gPgo+ID4gPiBUaGFua3MsCj4gPiA+Cj4gPiA+IEFsZXgKPiA+Cj4g
PiBUaGFua3MsCj4gPiBZdW5odWkKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
