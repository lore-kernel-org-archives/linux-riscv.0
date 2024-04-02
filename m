Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58929CD128A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 02:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALtNDCDtqDa6Plhh5c6+YuMzxnDCbwV4UOAlopxMOO4=; b=R8DFU6pFzDbElw
	2gIIqX1phPPArzheCEaHLbajIkY/Kw8DsFXd1xz0u7krV5kcdFS3om82Z9pb2lcJPhJMB9ytSFjzL
	JinGzi/KRozuzSVs4BiKMjN+VL25zYrmjRP1jBniHuR8hJTCOH4ay9GYJKnNKODmioTmyC27qkHGZ
	A3jXb6V45WlOBJ6iOS7xj/RW8jad8kPzm1hZhG40nHqY1Zwer+f+FDphLpZZRMEQSl4mof7Kmr5cU
	IKtnhDflbf3KhqyKs9anZUPUZrs5B3G6PHc+xRAMZn3Ib/ZY6YOsCQhEGbZA4TXZpUKHnOn2pkWLY
	n/cYwXWH+I38jysPeamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrTZa-00000009Pph-0ieZ;
	Tue, 02 Apr 2024 02:08:26 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrTZW-00000009Pp1-04X5
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 02:08:24 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6151d79db7bso3401447b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 19:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712023699; x=1712628499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aO2nKjxSM3VMmgCum0y14ZLXUnNoa4kf/yRJ6eyJhQc=;
        b=I5aM6mpfmPW3XbN6DCmr8uJhiv643Veth6m1TX8lh5Zm4rQ7o7rZBydIeOB4fp25Y2
         pAEcHBgc9W0eVRBWoRV677KDyCZBkGxDlFudSoPBpwhfL2NkWNPwrpAZAvlFaKxhz/dr
         f9bw+ePPj0BFRxWACpkcNHN0AN05EB5FCxGjLI9vRqad5Ymrhnd/robCgv6CJGvvEfEM
         vZnGKdZ1QBQpKpeDUwe9cGVwRvDuSexs2OWuEAU8n4dmBa4wOC+NcGMj5pzx/DdhtMIC
         6UyVMjUZsHapl31Ue9n5RqXz5Y/FoGQDrmo3SkYujD1lsoHNge80ZSiqYwovzuihrUv/
         zUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712023699; x=1712628499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aO2nKjxSM3VMmgCum0y14ZLXUnNoa4kf/yRJ6eyJhQc=;
        b=b2xfiKF+oNQxhWsiRS09S4FRyDDWIXsu2odSZWIm2NyAtzjd7bC08UvvwdTvpX1+vS
         2a8uM6J8V+VV29/k9AaD3mBiFeR/p23VgFiCda9u+KKM2qe2ETaDTVP8zEj464gjFodf
         18svdikU7baYGbul+et97plINl/2DhmCoAaXJ/d5EIaIeMDsK2YaV82Rh7GuokhXz5Oj
         g9LbG829Z3+GYp2Ev8R/PJbo6A0b/QgoDOUyHrMFpkdwNuYEIwlQExrWcIiaXhgZlnal
         Q+3Aj7oeYCSBlXe+rcibyvf0N2RvAu+IrXgYO4B61EFj2DKbvn2//uSGzpRu07yGLYu5
         t8PA==
X-Gm-Message-State: AOJu0YzQv93uYCYLrIlQKtx3gKzpx75jBkFCOPncpBp0/ROSnT8CjyEm
	v8ccKlTgYwMcZBDgm0JSTftpFNwK8kbuHbGiJX6LR0ibk/K0qArQ5kYuEahco3RHpG2DKwG2eyz
	gVS2NiQ9oabV6ilVju2N7OKKz8IMOhj0Vob6szA==
X-Google-Smtp-Source: AGHT+IH3DILv5+78c1GHhnyaPQm/r0jIaMiTrNrIh4LNwLDk/VMmQxGRZ3ndmVTuyIWK1baCoGbKbbm8kZWFSv0sI0s=
X-Received: by 2002:a81:7788:0:b0:610:973f:3877 with SMTP id
 s130-20020a817788000000b00610973f3877mr9996133ywc.35.1712023699215; Mon, 01
 Apr 2024 19:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-3-nylon.chen@sifive.com> <f5ukvah2ujko2iht3pd5jxq5kaukbs5z3pn5s7qwcnx4aqr3yv@mwtbwkcfa44a>
In-Reply-To: <f5ukvah2ujko2iht3pd5jxq5kaukbs5z3pn5s7qwcnx4aqr3yv@mwtbwkcfa44a>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 2 Apr 2024 10:08:08 +0800
Message-ID: <CAHh=Yk8MXy73d8M1J5bVu4spDMbjQDneVTqA=Ts=SGPDO7PXMQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] pwm: sifive: change the PWM algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, thierry.reding@gmail.com, 
	vincent.chen@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_190822_095408_4AC8043E 
X-CRM114-Status: GOOD (  25.16  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4g5pa8IDIw
MjTlubQz5pyIMTnml6Ug6YCx5LqMIOS4iuWNiDI6MTblr6vpgZPvvJoKPgo+IE9uIFRodSwgRmVi
IDIyLCAyMDI0IGF0IDA0OjEyOjMwUE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiBUaGUg
YGZyYWNgIHZhcmlhYmxlIHJlcHJlc2VudHMgdGhlIHB1bHNlIGluYWN0aXZlIHRpbWUsIGFuZCB0
aGUgcmVzdWx0Cj4gPiBvZiB0aGlzIGFsZ29yaXRobSBpcyB0aGUgcHVsc2UgYWN0aXZlIHRpbWUu
Cj4gPiBUaGVyZWZvcmUsIHdlIG11c3QgcmV2ZXJzZSB0aGUgcmVzdWx0Lgo+ID4KPiA+IFRoZSBy
ZWZlcmVuY2UgaXMgU2lGaXZlIEZVNzQwLUMwMDAgTWFudWFsWzBdCj4gPgo+ID4gTGluazogaHR0
cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlLzFhODJlNjAwLTFmOTMtNGY0MS1iMmQ4
LTg2ZWQ4YjE2YWNiYV9mdTc0MC1jMDAwLW1hbnVhbC12MXA2LnBkZiBbMF0KPiA+Cj4gPiBDby1k
ZXZlbG9wZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IENvLWRldmVsb3BlZC1ieTogVmlu
Y2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFZp
bmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBO
eWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3B3
bS9wd20tc2lmaXZlLmMgfCAxMCArKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
d20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiBpbmRleCBlYWJk
ZGI3Yzc4MjAuLmE1ODZjZmU0MTkxYiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1z
aWZpdmUuYwo+ID4gKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiBAQCAtMTEwLDkg
KzExMCwxMCBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVfZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hp
cCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBwd21fc3RhdGUgKnN0YXRlKQo+ID4gIHsKPiA+ICAgICAgIHN0cnVj
dCBwd21fc2lmaXZlX2RkYXRhICpkZGF0YSA9IHB3bV9zaWZpdmVfY2hpcF90b19kZGF0YShjaGlw
KTsKPiA+IC0gICAgIHUzMiBkdXR5LCB2YWw7Cj4gPiArICAgICB1MzIgZHV0eSwgdmFsLCBpbmFj
dGl2ZTsKPiA+Cj4gPiAtICAgICBkdXR5ID0gcmVhZGwoZGRhdGEtPnJlZ3MgKyBQV01fU0lGSVZF
X1BXTUNNUChwd20tPmh3cHdtKSk7Cj4gPiArICAgICBpbmFjdGl2ZSA9IHJlYWRsKGRkYXRhLT5y
ZWdzICsgUFdNX1NJRklWRV9QV01DTVAocHdtLT5od3B3bSkpOwo+ID4gKyAgICAgZHV0eSA9ICgx
VSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEgLSBpbmFjdGl2ZTsKPiA+Cj4gPiAgICAgICBz
dGF0ZS0+ZW5hYmxlZCA9IGR1dHkgPiAwOwo+ID4KPiA+IEBAIC0xMjMsNyArMTI0LDcgQEAgc3Rh
dGljIGludCBwd21fc2lmaXZlX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVj
dCBwd21fZGV2aWNlICpwd20sCj4gPiAgICAgICBzdGF0ZS0+cGVyaW9kID0gZGRhdGEtPnJlYWxf
cGVyaW9kOwo+ID4gICAgICAgc3RhdGUtPmR1dHlfY3ljbGUgPQo+ID4gICAgICAgICAgICAgICAo
dTY0KWR1dHkgKiBkZGF0YS0+cmVhbF9wZXJpb2QgPj4gUFdNX1NJRklWRV9DTVBXSURUSDsKPiA+
IC0gICAgIHN0YXRlLT5wb2xhcml0eSA9IFBXTV9QT0xBUklUWV9JTlZFUlNFRDsKPiA+ICsgICAg
IHN0YXRlLT5wb2xhcml0eSA9IFBXTV9QT0xBUklUWV9OT1JNQUw7Cj4gPgo+ID4gICAgICAgcmV0
dXJuIDA7Cj4gPiAgfQo+ID4gQEAgLTEzOSw3ICsxNDAsNyBAQCBzdGF0aWMgaW50IHB3bV9zaWZp
dmVfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+
ID4gICAgICAgaW50IHJldCA9IDA7Cj4gPiAgICAgICB1MzIgZnJhYzsKPiA+Cj4gPiAtICAgICBp
ZiAoc3RhdGUtPnBvbGFyaXR5ICE9IFBXTV9QT0xBUklUWV9JTlZFUlNFRCkKPiA+ICsgICAgIGlm
IChzdGF0ZS0+cG9sYXJpdHkgIT0gUFdNX1BPTEFSSVRZX05PUk1BTCkKPiA+ICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gPgo+ID4gICAgICAgY3VyX3N0YXRlID0gcHdtLT5zdGF0ZTsK
PiA+IEBAIC0xNTksNiArMTYwLDcgQEAgc3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiA+ICAgICAgIGZyYWMg
PSBESVY2NF9VNjRfUk9VTkRfQ0xPU0VTVChudW0sIHN0YXRlLT5wZXJpb2QpOwo+ID4gICAgICAg
LyogVGhlIGhhcmR3YXJlIGNhbm5vdCBnZW5lcmF0ZSBhIDEwMCUgZHV0eSBjeWNsZSAqLwo+Cj4g
SXMgdGhpcyBzdGlsbCB0cnVlIG5vdyB0aGF0IHdlIGtub3cgdGhhdCBQV01fU0lGSVZFX1BXTUNN
UCBpcyB0aGUKPiBpbmFjdGl2ZSB0aW1lIGluIGEgcGVyaW9kPyBJZiB5b3UgZml4IHRoYXQsIHRo
ZSBzYW1lIGNsYWltIGluIHRoZSBoZWFkZXIKPiBvZiB0aGUgZHJpdmVyIG5lZWRzIGFkYXB0aW9u
LCB0b28uCkkgYmVsaWV2ZSB0aGUgc3RhdGVtZW50IGlzIHRydWUsIGJ1dCBJIGRvbid0IGtub3cg
d2hpY2ggcGFydCB0aGUKZHJpdmVyIGhlYWRlciBmaWxlIHJlZmVycyB0by4KPgo+ID4gICAgICAg
ZnJhYyA9IG1pbihmcmFjLCAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCkgLSAxKTsKPiA+ICsg
ICAgIGZyYWMgPSAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCkgLSAxIC0gZnJhYzsKPgo+IEkg
bGlrZSB0aGUgYWRkaXRpb25hbCB2YXJpYWJsZSBpbiBwd21fc2lmaXZlX2dldF9zdGF0ZSgpLiBD
YW4geW91IHBsZWFzZQo+IGFkZCBvbmUgaGVyZSwgdG9vPwpnb3QgaXQKPgo+ID4gICAgICAgbXV0
ZXhfbG9jaygmZGRhdGEtPmxvY2spOwo+ID4gICAgICAgaWYgKHN0YXRlLT5wZXJpb2QgIT0gZGRh
dGEtPmFwcHJveF9wZXJpb2QpIHsKPgpUaGFuayB5b3UgZm9yIHRha2luZyB0aGUgdGltZSB0byBo
ZWxwIG1lIHJldmlldyBteSBpbXBsZW1lbnRhdGlvbi4KCk55bG9uCj4gQmVzdCByZWdhcmRzCj4g
VXdlCj4KPiAtLQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8
IFV3ZSBLbGVpbmUtS8O2bmlnICAgICAgICAgICAgfAo+IEluZHVzdHJpYWwgTGludXggU29sdXRp
b25zICAgICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
