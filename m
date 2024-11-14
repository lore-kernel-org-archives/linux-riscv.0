Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C071D637D6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 02:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8jFT5pBGotwua4Pmn7kuXYROWEGfLdkRoYNrNIQZ3o=; b=bMhzCrso8LgYiZ
	zSw0WQ0+pzUqIydpE+uoJCqlPeL+KuZ7Yy68meezlXG23xFGIOJpjLAAeY9Am8S99wQSMYokIDR2z
	V94bE1oX37J/rKq3URQC6gPElwYZJ286qmlBjChMZROrVn3WYKqwoxbmmR82cgXHwiANwhk4BrAVK
	lFrqkBlB3bjP37GsKZ45sgW4JxJdVkkYHXc/fjm/OFL0og83DZ+//ZWiwEots+pm+aHk/0/3q5jp8
	83b7IvES7cpdSt+Oxm8RAT0cOtoa5juVKW9ZiseCsuHgiwm5u9jycRe7IixesE4YF3dMFZ0uZGUR7
	63Ia19o0IkMOiU3EWNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPXS-00000008XpT-1DQz;
	Thu, 14 Nov 2024 02:24:54 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPXO-00000008XnB-1tWG
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:24:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c693b68f5so862105ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 18:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731551089; x=1732155889; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bOcIjTHmkKYE/MldB59+Mp7THVJA1dMXMhLp3+u7Zpk=;
        b=iP99BbOz56ErSDvLKZ5rQy5NbZ8Ued2wlGvIxWRKS4nOsT90lLdtjw95RjnIoAGyxo
         PBxI1gi7nYHpOdjrqDBBUGsqSGHX4O1j+l7Ae0OETBcPJX5vmTyH++myss5SnP/fq2GC
         xue/Xtcg1pRbeX3psfKcrjmWmEr9PKVvkPbsyoz22F/77jc925NIpHksmLCAwrQUq9UC
         Y7jbLPkNvYKlVTivfgqmVvNDf+3NFC+L5FLFGMHl7iko1GPGmfDv5xkRAyQ8cNN5SKp2
         ZJxXq5aAx3FROcLybAGrGOHZRRXuu69l5bAOl/rSuSY+Lw5r1EpIPZjJPGUM+QqCodiw
         i6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731551089; x=1732155889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOcIjTHmkKYE/MldB59+Mp7THVJA1dMXMhLp3+u7Zpk=;
        b=EQzatul90dhXTGdXfZ5PCacYhwUenxKas1I3EM7wAPrE18ctzDBEV6VKXY6uCCdoVd
         bgloSGZ9dVD8TgB0QABs+9gpO4KripacoFadbEcu7S7M2l6IoNfd/CPDG1dAu24i0BRD
         mXhkAcY9nS4ZqS/mQM4E8y2U2Y82tknpFXItERWRkbWknMw7xOu4ve4aWKRPFaSqAW7r
         /047aUQ8OsmG6ILjKPex0booHrMN/OJsbxJpVmhVd5xVkeKynFgUMB0tStCwzIcKANwd
         BBFpccx+6iXWZOQzHOzEZdOdv1oEJYQafMEeuPexyc7/cKUmGVZJPjVdCqSg2MWhn8rR
         5gRw==
X-Forwarded-Encrypted: i=1; AJvYcCXCnx/eLgQUq/tOraoZRjK5p1re5w9YTJiEkgDoIHxgFuMvAiEo1tTkz8lDYc1Mi339ljAlDz1oVCyXOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWcItgbMR6rLEK3AeqlzAyYZKEFetmdRMvnJyojPiy2DsveiFE
	TyBsHh+DrNz6bwpXpaHtEIJ7iY3xLKaTbrFVuErLXSGvZ7dj6trCedoxwkC5ei8=
X-Google-Smtp-Source: AGHT+IFIy/N8ljrKihYLsmstk+E2hofbr+iVsyyNJcXN7lh1fccE1mzDgwapJOQoIdXEKN3f21A9eg==
X-Received: by 2002:a17:903:2a8e:b0:20b:6d71:4140 with SMTP id d9443c01a7336-211b5d2a3b4mr74048485ad.44.1731551089470;
        Wed, 13 Nov 2024 18:24:49 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c2d520sm439875ad.29.2024.11.13.18.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:24:48 -0800 (PST)
Date: Wed, 13 Nov 2024 18:24:45 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v10 05/14] riscv: vector: Use vlenb from DT for thead
Message-ID: <ZzVfbS8-NizjKkst@ghost>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
 <20240911-xtheadvector-v10-5-8d3930091246@rivosinc.com>
 <tencent_2EF88DF37C4B82B2DA0B8E49B85C312E2108@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_2EF88DF37C4B82B2DA0B8E49B85C312E2108@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_182450_663007_2B5D1ED2 
X-CRM114-Status: GOOD (  27.56  )
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

T24gU3VuLCBOb3YgMTAsIDIwMjQgYXQgMDM6MzQ6NTRBTSArMDgwMCwgWWFuZ3l1IENoZW4gd3Jv
dGU6Cj4gSGkgQ2hhcmxpZSwKPiAKPiBJIGhhdmUgdGVzdGVkIHRoaXMgcGF0Y2hzZXQgd2l0aCBn
aG9zdHdyaXRlIHJlYmFzZWQgdG8gbGludXggY29tbWl0IGRhNDM3M2ZiY2YgKCJNZXJnZSB0YWcg
J3RoZXJtYWwtNi4xMi1yYzcnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9yYWZhZWwvbGludXgtcG0iKSBbMV0gb24gbXkgRDEgTmV6aGEgYm9hcmQsIHdp
dGggZGVmY29uZmlnICsgQ09ORklHX0VSUkFUQV9USEVBRF9HSE9TVFdSSVRFPW4sIEkgZ290IHRo
aXMgbWVzc2FnZSBkdXJpbmcgYm9vdDoKPiAKPiBbICAgIDAuMDI3NTg0XSBLZXJuZWwgcGFuaWMg
LSBub3Qgc3luY2luZzogX19rbWVtX2NhY2hlX2NyZWF0ZV9hcmdzOiBGYWlsZWQgdG8gY3JlYXRl
IHNsYWIgJ3Jpc2N2X3ZlY3Rvcl9jdHgnLiBFcnJvciAtMjIKPiBbICAgIDAuMDM4MDU3XSBDUFU6
IDAgVUlEOiAwIFBJRDogMCBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNi4xMi4wLXJjNi0w
MDMxMC1nYjI3NmNmNjlkZjI0LWRpcnR5ICMxMQo+IFsgICAgMC4wNDcyNDBdIEhhcmR3YXJlIG5h
bWU6IEFsbHdpbm5lciBEMSBOZXpoYSAoRFQpCj4gWyAgICAwLjA1MjAwN10gQ2FsbCBUcmFjZToK
PiBbICAgIDAuMDU0NDM0XSBbPGZmZmZmZmZmODAwMDcxNzI+XSBkdW1wX2JhY2t0cmFjZSsweDFj
LzB4MjQKPiBbICAgIDAuMDU5ODA2XSBbPGZmZmZmZmZmODA5ZjY4MzQ+XSBzaG93X3N0YWNrKzB4
MmMvMHgzOAo+IFsgICAgMC4wNjQ4MzNdIFs8ZmZmZmZmZmY4MGEwNDBmMD5dIGR1bXBfc3RhY2tf
bHZsKzB4NTIvMHg3NAo+IFsgICAgMC4wNzAyMDZdIFs8ZmZmZmZmZmY4MGEwNDEyNj5dIGR1bXBf
c3RhY2srMHgxNC8weDFjCj4gWyAgICAwLjA3NTIzM10gWzxmZmZmZmZmZjgwOWY2ZGI2Pl0gcGFu
aWMrMHgxMGMvMHgzMDAKPiBbICAgIDAuMDgwMDAwXSBbPGZmZmZmZmZmODAxN2I1YTA+XSBfX2tt
ZW1fY2FjaGVfY3JlYXRlX2FyZ3MrMHgyNGEvMHgyYjYKPiBbICAgIDAuMDg2NDEzXSBbPGZmZmZm
ZmZmODBjMDRjNjg+XSByaXNjdl92X3NldHVwX2N0eF9jYWNoZSsweDU2LzB4ODQKPiBbICAgIDAu
MDkyNTY2XSBbPGZmZmZmZmZmODBjMDQyODg+XSBhcmNoX3Rhc2tfY2FjaGVfaW5pdCsweDEwLzB4
MWMKPiBbICAgIDAuMDk4NDYwXSBbPGZmZmZmZmZmODBjMDdkMDI+XSBmb3JrX2luaXQrMHg2OC8w
eDFhOAo+IFsgICAgMC4xMDM0ODZdIFs8ZmZmZmZmZmY4MGMwMGVkMj5dIHN0YXJ0X2tlcm5lbCsw
eDc3ZS8weDgyMgo+IFsgICAgMC4xMDg4NzBdIC0tLVsgZW5kIEtlcm5lbCBwYW5pYyAtIG5vdCBz
eW5jaW5nOiBfX2ttZW1fY2FjaGVfY3JlYXRlX2FyZ3M6IEZhaWxlZCB0byBjcmVhdGUgc2xhYiAn
cmlzY3ZfdmVjdG9yX2N0eCcuIEVycm9yIC0yMiBdLS0tCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9jeXlzZWxmL2xpbnV4L3RyZWUveHRoZWFkdmVjdG9yXzIwMjQxMTEwCj4gCj4gT24gOS8x
Mi8yNCAxMzo1NSwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gIGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gPiBp
bmRleCA2ODJiM2ZlZWU0NTEuLjk3NzVkNmE5YzhlZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3ZlY3Rvci5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+
ID4gQEAgLTMzLDcgKzMzLDE3IEBAIGludCByaXNjdl92X3NldHVwX3ZzaXplKHZvaWQpCj4gPiAg
ewo+ID4gIAl1bnNpZ25lZCBsb25nIHRoaXNfdnNpemU7Cj4gPiAgLQkvKiBUaGVyZSBhcmUgMzIg
dmVjdG9yIHJlZ2lzdGVycyB3aXRoIHZsZW5iIGxlbmd0aC4gKi8KPiA+ICsJLyoKPiA+ICsJICog
VGhlcmUgYXJlIDMyIHZlY3RvciByZWdpc3RlcnMgd2l0aCB2bGVuYiBsZW5ndGguCj4gPiArCSAq
Cj4gPiArCSAqIElmIHRoZSB0aGVhZCx2bGVuYiBwcm9wZXJ0eSB3YXMgcHJvdmlkZWQgYnkgdGhl
IGZpcm13YXJlLCB1c2UgdGhhdAo+ID4gKwkgKiBpbnN0ZWFkIG9mIHByb2JpbmcgdGhlIENTUnMu
Cj4gPiArCSAqLwo+ID4gKwlpZiAodGhlYWRfdmxlbmJfb2YpIHsKPiA+ICsJCXRoaXNfdnNpemUg
PSB0aGVhZF92bGVuYl9vZiAqIDMyOwo+IAo+IFRoZW4sIEkgcGF0Y2hlZCBoZXJlIHdoaWNoIHJl
cGxhY2VzICJ0aGlzX3ZzaXplIiB3aXRoICJyaXNjdl92X3ZzaXplIi4gVGhlIGtlcm5lbCBib290
cyBub3JtYWxseSBhbmQgSSBjYW4gc2VlIOKAnHh0aGVhZHZlY3RvciIgaW4gL3Byb2MvY3B1aW5m
by4KPiAKPiBIb3dldmVyLCB3aGVuIEkgdHJ5IHRvIHJ1biB0aGUgInZfZXhlY19pbml0dmFsX25v
bGliYyIgdGVzdCwgdGhlIGtlcm5lbCBwYW5pY3Mgd2l0aCB0aGVzZSBvdXRwdXRzOgo+IAo+IFsg
IDk3OC43ODg4NzhdIE9vcHMgLSBpbGxlZ2FsIGluc3RydWN0aW9uIFsjMV0KPiBbICA5NzguNzg4
ODk3XSBNb2R1bGVzIGxpbmtlZCBpbjoKPiBbICA5NzguNzg4OTA4XSBDUFU6IDAgVUlEOiAxMDAw
IFBJRDogNDYxIENvbW06IHZfZXhlY19pbml0dmFsXyBOb3QgdGFpbnRlZCA2LjEyLjAtcmM2LTAw
MzEwLWdiMjc2Y2Y2OWRmMjQtZGlydHkgIzEyCj4gWyAgOTc4Ljc4ODkyNF0gSGFyZHdhcmUgbmFt
ZTogQWxsd2lubmVyIEQxIE5lemhhIChEVCkKPiBbICA5NzguNzg4OTI5XSBlcGMgOiBkb190cmFw
X2VjYWxsX3UrMHg1Ni8weDIwYQo+IFsgIDk3OC43ODg5NTZdICByYSA6IF9uZXdfdm1hbGxvY19y
ZXN0b3JlX2NvbnRleHRfYTArMHhjMi8weGNlCj4gWyAgOTc4Ljc4ODk3NF0gZXBjIDogZmZmZmZm
ZmY4MGEwNGFmZSByYSA6IGZmZmZmZmZmODBhMGU3NDIgc3AgOiBmZmZmZmZjNjAwM2ZiZWIwCj4g
WyAgOTc4Ljc4ODk4M10gIGdwIDogZmZmZmZmZmY4MTcxNzA4MCB0cCA6IGZmZmZmZmQ2MDcyM2Iz
MDAgdDAgOiBmZmZmZmZmZjgxMDAxMjY4Cj4gWyAgOTc4Ljc4ODk5MV0gIHQxIDogZmZmZmZmZmY4
MGEwNGFhOCB0MiA6IGZmZmZmZmZmODEwMDEyYTggczAgOiBmZmZmZmZjNjAwM2ZiZWUwCj4gWyAg
OTc4Ljc4OTAwMF0gIHMxIDogZmZmZmZmYzYwMDNmYmVlMCBhMCA6IGZmZmZmZmM2MDAzZmJlZTAg
YTEgOiAwMDAwMDAwMDAwMDAwMDVkCj4gWyAgOTc4Ljc4OTAwN10gIGEyIDogMDAwMDAwMDAwMDAw
MDAwMCBhMyA6IGZmZmZmZmZmZmZmZmZmZGEgYTQgOiAwMDAwMDAwMDAwMDAwMDAzCj4gWyAgOTc4
Ljc4OTAxNV0gIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6IDAwMDAwMDAwMDJhZGI1ZmUgYTcg
OiAwMDAwMDAwMDAwMDAwMDVkCj4gWyAgOTc4Ljc4OTAyMl0gIHMyIDogMDAwMDAwMDAwMDAxMDhh
OCBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOiAwMDAwMDAwMDAwMDAwMDA4Cj4gWyAgOTc4Ljc4
OTAzMF0gIHM1IDogMDAwMDAwM2ZiNDJhYjc4MCBzNiA6IDAwMDAwMDJhZGI1ZmU0MjAgczcgOiAw
MDAwMDAyYWRiNWZiOWUwCj4gWyAgOTc4Ljc4OTAzOF0gIHM4IDogMDAwMDAwMmFkYjVmZTQ0MCBz
OSA6IDAwMDAwMDJhZGI1ZmU0MjAgczEwOiAwMDAwMDAyYWRiNTcyYWQ0Cj4gWyAgOTc4Ljc4OTA0
Nl0gIHMxMTogMDAwMDAwMmFkYjU3MmFkMCB0MyA6IDAwMDAwMDNmYjQzYzVlM2MgdDQgOiA2MjJm
NzI3Mzc1MmYzZDVmCj4gWyAgOTc4Ljc4OTA1M10gIHQ1IDogMDAwMDAwMmFkYjVmZDVhMSB0NiA6
IDAwMDAwMDAwMDJhZGI1ZmYKPiBbICA5NzguNzg5MDYwXSBzdGF0dXM6IDgwMDAwMDAyMDE4MDAx
MDAgYmFkYWRkcjogMDAwMDAwMDA1ZTBmYjA1NyBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMgo+IFsg
IDk3OC43ODkwNjldIFs8ZmZmZmZmZmY4MGEwNGFmZT5dIGRvX3RyYXBfZWNhbGxfdSsweDU2LzB4
MjBhCj4gWyAgOTc4Ljc4OTA4Nl0gWzxmZmZmZmZmZjgwYTBlNzQyPl0gX25ld192bWFsbG9jX3Jl
c3RvcmVfY29udGV4dF9hMCsweGMyLzB4Y2UKPiBbICA5NzguNzg5MTEzXSBDb2RlOiBhMDczIDEw
MDcgMDA2ZiAxYTYwIDcwNTcgMGMzMCA1N2ZkIDE3ZmUgNzdkNyAwYzMwIChiMDU3KSA1ZTBmCj4g
WyAgOTc4Ljc4OTEyM10gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4gWyAg
OTc4Ljc4OTEzMV0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbiBp
biBpbnRlcnJ1cHQKPiBbICA5NzguOTM3MTU4XSAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qg
c3luY2luZzogRmF0YWwgZXhjZXB0aW9uIGluIGludGVycnVwdCBdLS0tCj4gCj4gSXMgc29tZXRo
aW5nIHdyb25nIHdpdGggbXkgc2V0dXA/CgpUaGFua3MgZm9yIHJlcG9ydGluZyB0aGlzISBJIGp1
c3Qgc2VudCBvdXQgYSBuZXcgdmVyc2lvbiB3aXRoIHRoZSBmaXguClNvbWV0aGluZyB3ZW50IHdy
b25nIHdpdGggdGhlIF9fcmlzY3Zfdl92c3RhdGVfZGlzY2FyZCgpIGFuZCB3YXMKdHJpZ2dlcmlu
ZyB0aGlzIGZhaWx1cmUuIEkgaGF2ZSB0ZXN0ZWQgdGhhdCB0aGlzIG5ldyB2ZXJzaW9uIGlzIGFi
bGUgdG8KcGFzcyB0aGUgdGVzdGNhc2UuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDI0MTExMy14dGhlYWR2ZWN0b3ItdjExLTAtMjM2YzIyNzkxZWY5QHJpdm9zaW5jLmNv
bS9ULyN0CgotIENoYXJsaWUKCj4gCj4gVGhhbmtzLAo+IFlhbmd5dSBDaGVuCj4gCj4gPiArCQly
ZXR1cm4gMDsKPiA+ICsJfQo+ID4gKwo+ID4gIAlyaXNjdl92X2VuYWJsZSgpOwo+ID4gIAl0aGlz
X3ZzaXplID0gY3NyX3JlYWQoQ1NSX1ZMRU5CKSAqIDMyOwo+ID4gIAlyaXNjdl92X2Rpc2FibGUo
KTsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90
aGVhZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVuZG9yX2V4dGVuc2lvbnMvdGhlYWQuYwo+ID4g
aW5kZXggMGYyN2JhZjhkMjQ1Li41MTlkYmY3MDcxMGEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZC5jCj4gPiBAQCAtNSw2ICs1LDcgQEAKPiA+
ICAjaW5jbHVkZSA8YXNtL3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkLmg+Cj4gPiAgICAjaW5jbHVk
ZSA8bGludXgvYXJyYXlfc2l6ZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9jcHVtYXNrLmg+Cj4g
PiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gPiAgICAvKiBBbGwgVC1IZWFkIHZlbmRvciBl
eHRlbnNpb25zIHN1cHBvcnRlZCBpbiBMaW51eCAqLwo+ID4gQEAgLTE2LDMgKzE3LDEzIEBAIHN0
cnVjdCByaXNjdl9pc2FfdmVuZG9yX2V4dF9kYXRhX2xpc3QgcmlzY3ZfaXNhX3ZlbmRvcl9leHRf
bGlzdF90aGVhZCA9IHsKPiA+ICAJLmV4dF9kYXRhX2NvdW50ID0gQVJSQVlfU0laRShyaXNjdl9p
c2FfdmVuZG9yX2V4dF90aGVhZCksCj4gPiAgCS5leHRfZGF0YSA9IHJpc2N2X2lzYV92ZW5kb3Jf
ZXh0X3RoZWFkLAo+ID4gIH07Cj4gPiArCj4gPiArdm9pZCBkaXNhYmxlX3h0aGVhZHZlY3Rvcih2
b2lkKQo+ID4gK3sKPiA+ICsJaW50IGNwdTsKPiA+ICsKPiA+ICsJZm9yX2VhY2hfcG9zc2libGVf
Y3B1KGNwdSkKPiA+ICsJCWNsZWFyX2JpdChSSVNDVl9JU0FfVkVORE9SX0VYVF9YVEhFQURWRUNU
T1IsIHJpc2N2X2lzYV92ZW5kb3JfZXh0X2xpc3RfdGhlYWQucGVyX2hhcnRfaXNhX2JpdG1hcFtj
cHVdLmlzYSk7Cj4gPiArCj4gPiArCWNsZWFyX2JpdChSSVNDVl9JU0FfVkVORE9SX0VYVF9YVEhF
QURWRUNUT1IsIHJpc2N2X2lzYV92ZW5kb3JfZXh0X2xpc3RfdGhlYWQuYWxsX2hhcnRzX2lzYV9i
aXRtYXAuaXNhKTsKPiA+ICt9Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
