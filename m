Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8FACD5BBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDWUP0IFrPeOi/5eUNgaLfVWzQskMQr62pSj0qCZr+c=; b=0dmyagr6XRfoDh
	BMN81CdpQLwBb5o9oSckGAzx4ZBcldTRQAYZuxB9onPbFROnsFNUx9gTpdXZaGifN4w4thw7NnLPF
	R4YszU2q/dmzod2SGqn/8tgqFmCj9KSpnpQAXAODxCUJmgo4pZfmEnc1HSrpFYzLOSCZhQ0mN/1f0
	kjX2n76odXInlmFT1gNPU4/H4baszxgexeimkXN99i/L+w5W1I3GFX8HOfCz6fwMeihFSnObEgvg3
	evQ73qi+1EP/+P3rS0mLX34JnvdZ8YNzJluXG8koRs3/GnWyNhe6cwshjoxfV/hThIPzXe1ybhxGM
	5ty+sD4F4dcGx3Y/zJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRcS-0000000Gom6-0VpM;
	Mon, 25 May 2026 09:29:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRcP-0000000GolN-1jwe
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 09:29:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE04F445C7
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 09:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1CD1F01561
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779701344;
	bh=Q8SY8TH6SQ1E0PGo117ZsQRk+yPGIg2/ZOb5kgafIpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bxaGw4mo+B7pdpcyMGGuiRvyLpvX6yF2qHWETADmDDRVdxlCciutGYSDLY/jJlGnV
	 UsYHEIRqsy1SBMpFeizua5B/HXEdtBBs8oU77itpn3LUV4x5nZzbrnkX+qhYd7KGYR
	 StN6Elkz+mK6n0aMdydSqCtpnWC1T082DuUt97cJUjg5SbMYv0RPaqjr8QIj9esVpm
	 ifX+pN3v+jPUxyGyp0Wz9aA2AxhkV3EOF2u9PUO03EcpGaWoG/832BtKwon+JYnZwL
	 o4SoGR8cZaY/K3PbJJTQ2UVENosx8OQaDDXCEQ1l+WMGpjkEvtsfAGnOtW4ohVICMr
	 ijKPvtL0tGG6g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso3832512e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 02:29:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ84HkmbTRRWtRy8OUf13Lc5Rmn0JqmVnLO/ekRldTrFaVh2HWolhcFg9UsqfOd6IIAtlkhYxqQ1okrwPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbUFId98zwaWARIFXIRCbEbQCMXCbMdqDad5VCmJg4LtMqMZCs
	tAr9bW9UvfpItEBSxRw1mpwyLhwHoKM7DrQYnweI67UZ1whR4roav+n3vAF+5xz2cWrA6cF+rUJ
	xF16rtn/n+OX7sWnQM6D5PoxczZuEutY=
X-Received: by 2002:a05:6512:3404:b0:5a8:99fe:59eb with SMTP id
 2adb3069b0e04-5aa323bffbemr3540548e87.41.1779701343399; Mon, 25 May 2026
 02:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com> <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 11:28:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
X-Gm-Features: AVHnY4JttAtjIvgHSdcMJb9NJ7l-9I7y04Sk14HfxnxLQyKX2p__ILu25C6cl_Q
Message-ID: <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_022905_495723_F62808D4 
X-CRM114-Status: GOOD (  13.80  )
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

SGkgSmlhLAoKdGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gRnJpLCBNYXkgMTUsIDIwMjYgYXQg
MzoxOOKAr0FNIEppYSBXYW5nIHZpYSBCNCBSZWxheQo8ZGV2bnVsbCt3YW5namlhLnVsdHJhcmlz
Yy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IEppYSBXYW5nIDx3YW5namlhQHVsdHJh
cmlzYy5jb20+Cj4KPiBBZGQgcGluY3RybCBkcml2ZXIgZm9yIFVsdHJhUklTQyBEUDEwMDAgcGlu
Y3RybCBjb250cm9sbGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmlhIFdhbmcgPHdhbmdqaWFAdWx0
cmFyaXNjLmNvbT4KClBsZWFzZSB3cml0ZSBhbiBlbGFib3JhdGUgY29tbWl0IG1lc3NhZ2Ugd2l0
aCBzb21lIGRldGFpbHMgYWJvdXQKdGhlIGhhcmR3YXJlIGFuZCBpdCdzIGhpc3RvcnkgZXRjLgoK
KC4uLikKCj4gK3N0cnVjdCB1cl9sZWdhY3lfcHJvcF9kYXRhIHsKPiArICAgICAgIHN0cnVjdCB1
cl9waW5fdmFsICpwaW5fdmFsczsKPiArICAgICAgIHVuc2lnbmVkIGludCAqZ3JvdXBfcGluczsK
PiArICAgICAgIHVuc2lnbmVkIGludCBudW1fcGluczsKPiArfTsKCj4gK3N0YXRpYyBpbnQgdXJf
bGVnYWN5X3BhcnNlX3Byb3Aoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnByb3BuYW1lLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHVyX2xlZ2FjeV9wcm9wX2RhdGEgKnByb3Ap
Cj4gK3N0YXRpYyBjb25zdCBjaGFyICp1cl9sZWdhY3lfZ2V0X2Z1bmN0aW9uX25hbWUoY29uc3Qg
c3RydWN0IHVyX3BpbmN0cmxfbWF0Y2hfZGF0YSAqbWF0Y2hfZGF0YSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBtb2RlKQo+ICtzdGF0aWMgaW50
IHVyX2xlZ2FjeV9jb25mX3RvX2NvbmZpZ3Moc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LCB1
MzIgY29uZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyAqKmNvbmZpZ3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCAqbnVtX2NvbmZpZ3MpCj4gK3N0YXRpYyBpbnQgdXJfbGVnYWN5X2FkZF9waW5j
b25mX21hcHMoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBpbmN0cmxfbWFwICoqbWFwLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpyZXNlcnZlZF9tYXBz
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpu
dW1fbWFwcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCB1cl9sZWdhY3lfcHJvcF9kYXRhICpwcm9wKQo+ICtzdGF0aWMgaW50IHVyX2xlZ2FjeV9k
dF9ub2RlX3RvX21hcChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGluY3RybF9tYXAgKiptYXAsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpudW1fbWFw
cykKCldoYXQncyB1cCB3aXRoIGFsbCB0aGlzIGxlZ2FjeSBzdHVmZj8KCldoYXQgaXMgdGhpcyBh
IGxlZ2FjeSBvZj8KCkkgdGhvdWdodCB0aGlzIHdhcyBhICpuZXcqIGRyaXZlciBzbyBob3cgY2Fu
IGl0IGJlICJsZWdhY3kiPwoKPiArc3RhdGljIGludCB1cl9nZW5lcmljX2R0X25vZGVfdG9fbWFw
KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucF9jb25maWcsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwaW5jdHJsX21hcCAqKm1hcCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpudW1fbWFwcykK
PiArewo+ICsgICAgICAgcmV0dXJuIHBpbmNvbmZfZ2VuZXJpY19kdF9ub2RlX3RvX21hcChwY3Rs
ZGV2LCBucF9jb25maWcsIG1hcCwgbnVtX21hcHMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFBJTl9NQVBfVFlQRV9JTlZBTElEKTsKPiArfQoKSG0gSSB0
aGluayBDb25vciBoYXMgbmV3IGhlbHBlcnMgZm9yIHRoaXMgc28geW91IGRvbid0IG5lZWQgdG8g
d3JhcAppdCBsaWtlIHRoaXMuCgo+ICtzdGF0aWMgdm9pZCB1cl9kdF9mcmVlX21hcChzdHJ1Y3Qg
cGluY3RybF9kZXYgKnBjdGxkZXYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHBpbmN0cmxfbWFwICptYXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IG51bV9tYXBzKQo+ICt7Cj4gKyAgICAgICBwaW5jdHJsX3V0aWxzX2ZyZWVfbWFwKHBjdGxk
ZXYsIG1hcCwgbnVtX21hcHMpOwo+ICt9CgpDYW4ndCB5b3UganVzdCBhc3NpZ24gcGluY3RybF91
dGlsc19mcmVlX21hcCBkaXJlY3RseSB0byB1cl9waW5jdHJsX29wcz8KCllvdXJzLApMaW51cyBX
YWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
