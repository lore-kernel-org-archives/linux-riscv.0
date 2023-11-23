Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E7C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yw/no3nL6YA3OT1oGq17FLC4PIdhPct3eZ2R3HH8l4M=; b=WrWLU3pDA6Wk8V
	p7lUUeFzzoDydAXB8Q0Y24Hpo2C+DFQ+p8QoeIfDNAQTdB4lCBp/aWfjdH4h/zlE4EG2gGO/WuhSW
	wZ6uCOglQ2XEsBA3ojCMzcwHfp8/32ZsQJ+jAESw+Sx+6DIaaGG3En5mEjmoyVI2ROktIaifcb1XD
	PtLuViZsT6Ywf6fke2lLN3I+IPShFe1TmalMbdEeRq7sBNLYyvKbEPyhuOJVceY24iDKX/KyGNv4Y
	7UuHcg/K55M5qasPebwVSCux/4bCa06OPqU4cL0eg1m5GU2OSYfQbMuqAmg90CSB2tiayI6FjEA54
	N33cShTMkpq0zcbd+XeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r64Iz-0043lz-1a;
	Thu, 23 Nov 2023 07:39:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r64Iw-0043kn-0d;
	Thu, 23 Nov 2023 07:39:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7CADDCE0F09;
	Thu, 23 Nov 2023 07:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6F8C433C8;
	Thu, 23 Nov 2023 07:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700725154;
	bh=dnmMd/Gc51YGnbhok9mTHLUrlL/9RJjKE3NYV+vKfVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CQQ3yDjiaKQqXGl+F6WcMG1ruJBisZBke27GVjPRyHrQlhGpCyvtEUrGUWSpj4hCk
	 8ZqRP+sP3sSSqHK2zhMDkB0WGWRRPV3y+hFZogyl8aOCzDOoClk0xEMFgiBGc/oFmz
	 0IRp62rFN9A1VDadsEyDaD0ETrwL9TdooE7LzY4naj9tMp6UnzsBzgS7ajz/1Ghwr9
	 9mgK6xbwT+xtfo/UMTJ2bpznMC9sUmUxU6WY43I0Uurps2e/P9mxE/ba2a3GIAwAlA
	 LOLhilZLVDO2sd7yLrNdgdKY/pXI3UkhyjUUqKD3hWhpFmlOPXke2dKDX1bh2/HbHv
	 UdIzPBThbuZHA==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1f94b07b6b3so425365fac.2;
        Wed, 22 Nov 2023 23:39:14 -0800 (PST)
X-Gm-Message-State: AOJu0YxiRVZCy3Ic7pdJVed8oqmWYQ/o/FwaEoEIDjHY3d84hiyqCX1w
	FMGWQlKdBeQLkeBf8Tlgd3uTC4wESAVP7Yu8EgQ=
X-Google-Smtp-Source: AGHT+IE/aHZ2CqZK023YoKIf3yCJ3PHVdOqmqOE42F0qp4WJHAcnHX3ZkplDwoELnnYLxCAA2La8Da6akCN0EmpAj1w=
X-Received: by 2002:a05:6870:6c0a:b0:1f0:d96:8d9c with SMTP id
 na10-20020a0568706c0a00b001f00d968d9cmr6123126oab.9.1700725154090; Wed, 22
 Nov 2023 23:39:14 -0800 (PST)
MIME-Version: 1.0
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Nov 2023 16:38:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
Message-ID: <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
To: Rob Herring <robh@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_233918_610882_B9ADB880 
X-CRM114-Status: GOOD (  19.00  )
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

T24gVGh1LCBOb3YgMjMsIDIwMjMgYXQgNzoxMuKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IHRvIHNldCB0aGUgZHRj
IGV4dHJhIHdhcm5pbmcgbGV2ZWwgb24gYSBwZXIKPiBhcmNoIG9yIHBlciBwbGF0Zm9ybSAoZGly
ZWN0b3J5IHJlYWxseSkgYmFzaXMuCj4KPiBUaGUgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIHdhcyBq
dXN0IGEgc2ltcGxlIHBlciBkaXJlY3Rvcnkgb3ZlcnJpZGUgZm9yCj4gU2Ftc3VuZyBwbGF0Zm9y
bXMsIGJ1dCBDb25vciBhc2tlZCB0byBiZSBhYmxlIHRvIGRvIHRoaXMgZm9yIGFsbCBvZgo+IHJp
c2N2Lgo+Cj4gRm9yIG1lcmdpbmcsIGVpdGhlciBJIGNhbiB0YWtlIHRoZSB3aG9sZSB0aGluZyBv
ciB0aGUgcmlzY3YgYW5kIHNhbXN1bmcKPiBwYXRjaGVzIGNhbiBnbyB2aWEgdGhlaXIgbm9ybWFs
IHRyZWVzLiBUaGUgYWRkZWQgdmFyaWFibGUgd2lsbCBoYXZlIG5vCj4gZWZmZWN0IHVudGlsIG1l
cmdlZCB3aXRoIHBhdGNoIDIuCj4KPiB2MToKPiAgLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMzExMTYyMTE3MzkuMzIyODIzOS0xLXJvYmhAa2VybmVsLm9yZy8KPgo+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCgoKVGhlcmUgd2VyZSBz
b21lIGF0dGVtcHRzIGluIHRoZSBwYXN0IHRvIGVuYWJsZSBXPTEgaW4gcGFydGljdWxhciBzdWJz
eXN0ZW1zLApzbyBoZXJlIGlzIGEgc2ltaWxhciBjb21tZW50LgoKQWRkaW5nIGEgbmV3IHdhcm5p
bmcgZmxhZyB0byBXPTEgaXMgYWx3YXlzIHNhZmUgd2l0aG91dCBkb2luZyBhbnkgY29tcGlsZSB0
ZXN0LgoKV2l0aCB0aGlzIHNlcmllcywgaXQgd291bGQgbm90IGJlIHRydWUgYW55IG1vcmUgYmVj
YXVzZSBhIG5ldyB3YXJuaW5nIGluIFc9MQp3b3VsZCBwb3RlbnRpYWxseSBicmVhayByaXNjdi9z
YW1zdW5nIHBsYXRmb3Jtcy4KCkxpbnVzIHJlcXVpcmVzIGEgY2xlYW4gYnVpbGQgKGkuZS4gemVy
byB3YXJuaW5nKSB3aGVuIFc9IG9wdGlvbiBpcyBub3QgZ2l2ZW4uCgoKCgoKCj4gUm9iIEhlcnJp
bmcgKDQpOgo+ICAgICAgIGtidWlsZDogTW92ZSBkdGMgZ3JhcGhfY2hpbGRfYWRkcmVzcyB3YXJu
aW5nIHRvIFc9Mgo+ICAgICAgIGtidWlsZDogQWxsb3cgYXJjaC9wbGF0Zm9ybSBvdmVycmlkZSBv
ZiBkdGMgd2FybmluZyBsZXZlbAo+ICAgICAgIHJpc2N2OiBkdHM6IEFsd2F5cyBlbmFibGUgZXh0
cmEgVz0xIHdhcm5pbmdzCj4gICAgICAgYXJtL2FybTY0OiBkdHM6IHNhbXN1bmc6IEFsd2F5cyBl
bmFibGUgZXh0cmEgVz0xIHdhcm5pbmdzCj4KPiAgYXJjaC9hcm0vYm9vdC9kdHMvc2Ftc3VuZy9N
YWtlZmlsZSAgfCAgMyArKysKPiAgYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvTWFrZWZpbGUg
fCAgMyArKysKPiAgYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgfCAgMyArKysK
PiAgc2NyaXB0cy9NYWtlZmlsZS5saWIgICAgICAgICAgICAgICAgfCAxNiArKysrKysrKystLS0t
LS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
PiAtLS0KPiBiYXNlLWNvbW1pdDogYjg1ZWE5NWQwODY0NzFhZmI0YWQwNjIwMTJhNGQ3M2NkMzI4
ZmE4Ngo+IGNoYW5nZS1pZDogMjAyMzExMjItZHRjLXdhcm5pbmdzLTk2OGZmODNhODZlZAo+Cj4g
QmVzdCByZWdhcmRzLAo+IC0tCj4gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPgoKCi0t
IApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
