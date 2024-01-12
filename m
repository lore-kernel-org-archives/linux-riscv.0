Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2F2C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrRF/X9breTjZG3C8mUS5bLMYyw3qcR4LmrzaMRjHWw=; b=dJ0yvvFFtRPLCZ
	uwMaZEodiKh1kAlCP0nMkRVYfGhgWyCHBwRq2/si8/LAmx7ggohF+oN/Yo2GW20z19b7xYjOnr2sX
	sLooEwoJV4+M5b0ncyUSMbsr7cMMYrt5GwO+Vl9lmzf13umHAgsR9v18ksC6i6IB9goYGv/kDLwVY
	BqpmqlUrtR0v/0zYgQPwZXXM9xkXgfroTGihlMs4e4owZPh2T+sTFpBfmQnAvoRQGzQT6o9iBY1gk
	3EOmSa1A5jbCJ66rQvM9KjZgrWlGaFFgf/1AnPIOT+QQlwAP+C38nKgN6p+mVUxW3yAAkFeqoDPP5
	cky/1XfI8EA33Fn/uTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOK0T-003FrD-1B;
	Fri, 12 Jan 2024 16:03:41 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOK0P-003Fq6-2S
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 16:03:39 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so8005999e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705075416; x=1705680216; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlcumRuo3yPkbSOFFixN83g3X5t6YCh0ouJJ+9wMhrI=;
        b=V4d+agXR6Fs30FleQtahF74qUxIJ2zD9d3K42CjLeOof5PJXxe+LWUZLobpJDi1R68
         yLk4qPNgwO7xVuJtIyYaFqq6kXg0lZaN+6lRuSbECgM7XJ8y0BCRPbmVfFVWjNaWdEeq
         6S2C7PiUlCIwT9URJD8tymUGsJnmKWnai3pNY6RB9QkdejiZ+fopdqNNiI4xNAA9e66a
         iHht1eDe59Vr/APWPX7TNSth+YORc6g7GHPMGkDpXYZBNniNYg3Z1qU1UNgWkXg6Yv7F
         T9RgGPhpkGuP1LO+rn0o+tP5hYydzUM8p8Y+JhT/1t9kXSy93ZSGSDn6UXfxJ/9Py2Qa
         N1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705075416; x=1705680216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlcumRuo3yPkbSOFFixN83g3X5t6YCh0ouJJ+9wMhrI=;
        b=ncEOPfHlf7keNK5bkKSAw4rOr18vdt5k6WfhLhFRl8wb3vh/3m5FmJ8TXs2FrIQ1ls
         jkp9Fe4Ch/Va5cDPDHCbDYbEoqee3lKFKwMXmq5AhwqD1prMb3tyv30tzlhCa+ERvfWp
         BOVyxT8XENmSgz19R+OPpaIpTax/w/pBF8RLZguKGhx+wX0Smj/LurXni0WUVrRvxoPS
         gTFPXawbIchT+DoC4u3iiU0i9divFg0i3fNyO1JDt+M5s91jKvOONMttQCZsUGr8mkZU
         NcPp3Kd6LKE400du1dvyHDkSaj3tCPi3EciJaZns3NYh0wSga3os3PM4v6E3GhUa7HDb
         p+WA==
X-Gm-Message-State: AOJu0YyrZJi9+uceoOvTnN309VoIAqd71//7gDGWWY3amI9Eps9dXvOz
	vJ83S0f6Wf8Pv8wKoLEyqBiwEdcqUVR8VhoXQ1HAgoNvaO+zZ6yLgiZMwBp9Ass=
X-Google-Smtp-Source: AGHT+IEpgcpHLz9s49n5cCw5A/94fzWtAO8abbMFi1uga19CZdsKzOR19wfmGw1R9rTy/IWbJKP6UN4vASGV/yBzrRE=
X-Received: by 2002:a05:6512:3f2a:b0:50e:b2ac:829a with SMTP id
 y42-20020a0565123f2a00b0050eb2ac829amr562791lfa.32.1705075415595; Fri, 12 Jan
 2024 08:03:35 -0800 (PST)
MIME-Version: 1.0
References: <20240111131558.31211-1-andy.chiu@sifive.com> <170504103075.17535.16233182023874920613.git-patchwork-notify@kernel.org>
 <87o7dqsh80.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87o7dqsh80.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 13 Jan 2024 00:03:24 +0800
Message-ID: <CABgGipXYeE4J3226yoAU9J25eeP+vWofqL1mMYoD9axthJrk2Q@mail.gmail.com>
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de, peterz@infradead.org, 
	tglx@linutronix.de, ebiggers@kernel.org, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_080337_809776_44FE19F5 
X-CRM114-Status: GOOD (  22.27  )
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

T24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgMTE6MjnigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEFuZHksCj4KPiA+IEhlbGxvOgo+ID4KPiA+IFRoaXMgc2Vy
aWVzIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5leHQpCj4gPiBieSBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46Cj4gPgo+Cj4gSSdtIGdldHRpbmcgc29t
ZSBib290IGlzc3VlcyB3aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQgdG8gcmlzY3YvZm9yLW5leHQu
Cj4KPiBUaGUgZnVsbCBydW5zICh3aXRoIGxvZ3MpIGlzIGhlcmU6Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL2xpbnV4LXJpc2N2L2xpbnV4LXJpc2N2L2FjdGlvbnMvcnVucy83NDk4NzA2MzI2Cj4KPiBU
eXBpY2FsbHkgaXQgZmFpbHMgaW4gdHdvIHdheXM6Cj4gVWJ1bnR1IHJvb3RmczoKPiAtLTg8LS0K
PiBbIDQuMzQ2NDE0XSAoc2QtZ2VucylbNjhdOiBGYWlsZWQgdG8gZXh0cmFjdCBmaWxlIG5hbWUg
ZnJvbSAnJzogSW52YWxpZCBhcmd1bWVudAo+IFsgNC4zOTA4MzJdIHN5c3RlbWRbMV06IEZhaWxl
ZCB0byBmb3JrIG9mZiBzYW5kYm94aW5nIGVudmlyb25tZW50IGZvciBleGVjdXRpbmcgZ2VuZXJh
dG9yczogUHJvdG9jb2wgZXJyb3IKPiBbRVNDWzA7MTszMW0hISEhISFFU0NbMG1dIEZhaWxlZCB0
byBzdGFydCB1cCBtYW5hZ2VyLgo+IFsgNC40NDAxNjRdIHN5c3RlbWRbMV06IEZyZWV6aW5nIGV4
ZWN1dGlvbi4KPiAtLTg8LS0KPgo+IG9yOgo+IC0tODwtLQo+IFsgICAxNC45MDk5MTJdIChzZC1n
ZW5zKVs3MV06IEFzc2VydGlvbiAnIXN0cnZfaXNlbXB0eShkaXJzKScgZmFpbGVkIGF0IHNyYy9z
aGFyZWQvZXhlYy11dGlsLmM6MjExLCBmdW5jdGlvbiBleGVjdXRlX2RpcmVjdG9yaWVzKCkuIEFi
b3J0aW5nLgo+IFsgICAxNS4wMDg0ODBdIHN5c3RlbWRbMV06IEZhaWxlZCB0byBmb3JrIG9mZiBz
YW5kYm94aW5nIGVudmlyb25tZW50IGZvciBleGVjdXRpbmcgZ2VuZXJhdG9yczogUHJvdG9jb2wg
ZXJyb3IKPiBbRVNDWzA7MTszMW0hISEhISFFU0NbMG1dIEZhaWxlZCB0byBzdGFydCB1cCBtYW5h
Z2VyLgo+IFsgICAxNS4xMTE5ODldIHN5c3RlbWRbMV06IEZyZWV6aW5nIGV4ZWN1dGlvbi4KPiAt
LTg8LS0KPgo+IGFuZCBBbHBpbmUgd2l0aDoKPiAtLTg8LS0KPiBbIDAuMDM2NzAzXSBLZXJuZWwg
cGFuaWMgLSBub3Qgc3luY2luZzoga21lbV9jYWNoZV9jcmVhdGVfdXNlcmNvcHk6IEZhaWxlZCB0
byBjcmVhdGUgc2xhYiAncmlzY3ZfdmVjdG9yX2N0eCcuIEVycm9yIC0yMgo+IFsgMC4wMzkxOTVd
IENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDYuNy4wLXJjMS1kZWZj
b25maWdfcGxhaW4tZ2RmOTQ0NzA0MTgyZSAjMQo+IFsgMC4wNDA3NDRdIEhhcmR3YXJlIG5hbWU6
IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiBbIDAuMDQxOTc1XSBDYWxsIFRyYWNlOgo+IFsgMC4w
NDI4MTNdIFs8ZmZmZmZmZmY4MDAwNjdhND5dIGR1bXBfYmFja3RyYWNlKzB4MWMvMHgyNAo+IFsg
MC4wNDQ4MzJdIFs8ZmZmZmZmZmY4MDk0NTk4MD5dIHNob3dfc3RhY2srMHgyYy8weDM4Cj4gWyAw
LjA0NTcyNF0gWzxmZmZmZmZmZjgwOTUyMjE0Pl0gZHVtcF9zdGFja19sdmwrMHgzYy8weDU0Cj4g
WyAwLjA0Njg0MV0gWzxmZmZmZmZmZjgwOTUyMjQwPl0gZHVtcF9zdGFjaysweDE0LzB4MWMKPiBb
IDAuMDQ3NDI4XSBbPGZmZmZmZmZmODA5NDVlN2M+XSBwYW5pYysweDEwNi8weDI5ZQo+IFsgMC4w
NDc5OThdIFs8ZmZmZmZmZmY4MDE1ZjE0Yz5dIGttZW1fY2FjaGVfY3JlYXRlX3VzZXJjb3B5KzB4
MjBlLzB4MjU4Cj4gWyAwLjA0ODc4Nl0gWzxmZmZmZmZmZjgwYTA0NGRjPl0gcmlzY3Zfdl9zZXR1
cF9jdHhfY2FjaGUrMHgyYy8weDNjCj4gWyAwLjA0OTUyMV0gWzxmZmZmZmZmZjgwYTAzYTQ4Pl0g
YXJjaF90YXNrX2NhY2hlX2luaXQrMHgxMC8weDE4Cj4gWyAwLjA1NzgzMl0gWzxmZmZmZmZmZjgw
YTA3MDZjPl0gZm9ya19pbml0KzB4NDIvMHgxNjgKPiBbIDAuMDU4NzM3XSBbPGZmZmZmZmZmODBh
MDBkNzA+XSBzdGFydF9rZXJuZWwrMHg2YmEvMHg3M2EKPiAtLTg8LS0KPgo+IFRoZSBBbHBpbmUg
Ym9vdCBjYW4gYmUgZml4ZWQgd2l0aCBzb21ldGhpbmcgbGlrZToKPiAtLTg8LS0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0
b3IuYwo+IGluZGV4IGY5NzY5NzAzZmQzOS4uMGFjNzlhOWNkYmE1IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9y
LmMKPiBAQCAtNTMsNiArNTMsOSBAQCBpbnQgcmlzY3Zfdl9zZXR1cF92c2l6ZSh2b2lkKQo+Cj4g
IHZvaWQgX19pbml0IHJpc2N2X3Zfc2V0dXBfY3R4X2NhY2hlKHZvaWQpCj4gIHsKPiArICAgICAg
IGlmICghcmlzY3Zfdl92c2l6ZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiAgICAg
ICAgIHJpc2N2X3ZfdXNlcl9jYWNoZXAgPSBrbWVtX2NhY2hlX2NyZWF0ZV91c2VyY29weSgicmlz
Y3ZfdmVjdG9yX2N0eCIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmlzY3Zfdl92c2l6ZSwgMTYsIFNMQUJfUEFOSUMsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgcmlz
Y3Zfdl92c2l6ZSwgTlVMTCk7Cj4gLS04PC0tCgpTb3JyeSBmb3IgdGhhdCEgSSBmb3Jnb3QgdG8g
ZG8gYSBoYXNfdmVjdG9yKCkgY2hlY2sgYmVmb3JlIGNyZWF0aW5nCnRoZSBjYWNoZS4gSSBhbSBn
b2luZyB0byBzZW5kIGEgcGF0Y2ggdG8gZml4IGl0LgoKPgo+IGJ1dCB3aXRoIHRoaXMgImZpeCIg
aW4gcGxhY2UgSSBzdGlsbCBnZXQgVWJ1bnR1IGJvb3QgZmFpbHVyZXMuIFRvCj4gcmVwcm9kdWNl
IHRoZSBDSSBsb2NhbGx5Ogo+Cj4gICB8IGdpdCBmZXRjaCBodHRwczovL2dpdGh1Yi5jb20vbGlu
dXgtcmlzY3YvbGludXgtcmlzY3YgZTJhYWQ3NWIzNDBkNjViMGJlNGQxYTY4OWRiM2UxMGM2ZWQz
ZjE4ZQo+ICAgfCBnaXQgY2hlY2tvdXQgRkVUQ0hfSEVBRAo+ICAgfCBkb2NrZXIgcHVsbCBnaGNy
LmlvL2xpbnV4LXJpc2N2L3B3LWJ1aWxkZXItbXVsdGk6bGF0ZXN0Cj4gICB8IGRvY2tlciBydW4g
LWl0IC0tdm9sdW1lICRQV0Q6L2J1aWxkL215LWxpbnV4IGdoY3IuaW8vbGludXgtcmlzY3YvcHct
YnVpbGRlci1tdWx0aTpsYXRlc3QgYmFzaAo+ICAgfCAjIEluIGNvbnRhaW5lcgo+ICAgfCBiYXNo
IC1sCj4gICB8IG1rZGlyIC1wIC9idWlsZC9rZXJuZWxzL2xvZ3MKPiAgIHwgLmdpdGh1Yi9zY3Jp
cHRzL3Nlcmllcy9wcmVwYXJlX3Rlc3RzLnNoCj4gICB8IGNkIC9idWlsZC9teS1saW51eAo+ICAg
fCAuZ2l0aHViL3NjcmlwdHMvc2VyaWVzL2tlcm5lbF9idWlsZGVyLnNoIHJ2NjQgZGVmY29uZmln
IHBsYWluIGdjYwo+ICAgfCAuZ2l0aHViL3NjcmlwdHMvc2VyaWVzL3Rlc3RfcnVubmVyLnNoIHJ2
NjQgZGVmY29uZmlnIHBsYWluIGdjYyB1YnVudHUKPiAgIHwgLmdpdGh1Yi9zY3JpcHRzL3Nlcmll
cy90ZXN0X3J1bm5lci5zaCBydjY0IGRlZmNvbmZpZyBwbGFpbiBnY2MgYWxwaW5lCgpJdCdzIHdl
aXJkIHRoYXQgdGhlc2UgZXJyb3JzIGRvIG5vdCBzaG93IHVwIGluIG15IHRlc3QgZW52aXJvbm1l
bnQuIEkKd2lsbCB0cnkgdG8gcmVwcm9kdWNlIGl0IHdpdGggdGhlIHNjcmlwdCBhYm92ZS4KCj4K
PiBMb2dzIGluIC9idWlsZC90ZXN0cy9ydW5fdGVzdCoKPgo+IEknbGwgY29udGludWUgdG8gZGVi
dWcgaW4gdGhlIG1lYW50aW1lLgo+Cj4KPiBCasO2cm4KClRoYW5rcywKQW5keQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
