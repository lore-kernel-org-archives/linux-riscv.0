Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE8C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZsT+u5qNSL+vYZnJsRmwIpSTfk2bl9G/I2t9LYHxmo=; b=Sn+TNRlndp+PFd
	MWTJebFW0/hnv+NuwY2KvCFtXG5kyaYn0mfhtDhjzYqeybAwV61HxoOVZ5gR+phe66+Yq2mIZ8fQm
	izW66R0vZGFXq/w/ydk72JX+Wv8rSqGYLXz/9tZY7K8zi7uT1rnlMlVGpnxClVuYt01foDFNSF+B8
	RBRLNLYvhZJ0LC3wgHKyxyOILyleb7K5g5JpmSRZT9sP5tDh2CJ/VRGvl+u3M9+wNnI/0LtNIAxK1
	dFjvsAkJ62+ZSKOvddXqY4ILOQqHiHgQyJueJXfOafu/Rw1P/IwMB/UyzbHZQfp8UwKC9j5VjmwxD
	opGvDxjUHAxsdVQAOc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZvA-00000003hwW-1PG2;
	Wed, 24 Apr 2024 10:32:12 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZv7-00000003hvT-29O7
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:32:11 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so9566462e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713954726; x=1714559526; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=69da6UXz2pFiDL31edeqzPN31G6ffxNroQ0Z2N+KdsQ=;
        b=Nrv766vJ8e6wWAHyMsR30WBHYRseUBniV0fFZgpnZClPPkCxTA29gKlR+mYMlKeLnq
         wErezrSyifuXw/giY+sDIHrKV/+mdr7ZIJFsG0WT1sJh9oIWVv3Fd81RLKNiGYOwF57b
         Cg+G8Yc5ITM4bIaGQhg09LCuyt5jRWLByacty71vmRrlrdQQBX4zakel5hlv4/hCMpu7
         45HIpiXs32vxmYPi7PzUadd9Q44EwJvJ/DzhSI2AYjjFmxGbjOaW8JUbnXolxfsE1MZB
         +UugJwUf9QmrY8xeW33xMMU94oNXwAaC2wyeMCe+VwRN9Z8XvKbi6NKNF0F4JHo7d1zs
         ElWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713954726; x=1714559526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69da6UXz2pFiDL31edeqzPN31G6ffxNroQ0Z2N+KdsQ=;
        b=J1eJaqq2s+BTZyWXnDP53qBjfztRc/N0QZ72W8f63iuTxnQr/DcA8NsqxeFPQkdjhT
         hvvRe3pQ2SCh+HxyQDHYeitTayfR7rwtdaqbNy0Nz6b+X9l/y2ACeAVDWvJUAAWa/Z9I
         RlCR2K17FYSdlveA1KQqG3wR+2eZdXRY4PlKnAIkeOAMCgvG2B1ZKraGUJuVH/Z+knFo
         KRTkurtKlDGxyz3RARVl4f2Q8v3scMJJ3A3P8J31Z9gDpGyvMYYj9pyAxYZ/xWwjVubJ
         51iaqZMgwh3HI7zphhK1zxKVu1NN1scilzJ1vBSBBx4bmj6zJAWI+HMhpZh6ugXZ7KPe
         h8tg==
X-Forwarded-Encrypted: i=1; AJvYcCXSKcRjPDQu35wWqC+hRIDD27pyBYfCvX2wgBjUAAF023JXD9wOcTWSbS7WYHqc2HU3JBw7YYtLD9yOUyEL5kC1cb3Tmdbq+6qbTODUoPiI
X-Gm-Message-State: AOJu0Yy1nkT3SBJBPfCLfh+jBK56CgcU/o9WGH9vyHAqgOWiSj8TVJV8
	0+EOqReD3nhUvaHPA4WSzjFyI3CVi3yWyRcYoSdAH/a6uWp0HwFvV/apgcVyLNQRQytGZFji2f7
	UcIM=
X-Google-Smtp-Source: AGHT+IEcj0tdrrmR8cPhcTUlqc6Z+F7kWLT0j9ptexs5NM6zhH3y23MG/ibcIMnGQ8n53KYceeEqdw==
X-Received: by 2002:a05:6512:793:b0:51a:affe:252e with SMTP id x19-20020a056512079300b0051aaffe252emr1747408lfr.37.1713954726126;
        Wed, 24 Apr 2024 03:32:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z2-20020a17090665c200b00a55bbc4fd16sm3274471ejn.48.2024.04.24.03.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 03:32:05 -0700 (PDT)
Date: Wed, 24 Apr 2024 12:32:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, anup@brainfault.org, 
	atishp@atishpatra.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, heiko@sntech.de, David.Laight@aculab.com, parri.andrea@gmail.com, 
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <20240424-c24522c332fcaced37339045@orel>
References: <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
 <ZibmfbLnGCb9gmow@ghost>
 <20240423-ed9ddb701be1df4a25e29f31@orel>
 <Zif3VZALGtLtl3D3@ghost>
 <ZigPN/iJ/gLT4DOD@ghost>
 <20240424-0e571b29835610c24409762b@orel>
 <CAEg0e7gYteAbHyQCvodO=Mh20qpW4oM9Lm42efNJvz=9muQO-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7gYteAbHyQCvodO=Mh20qpW4oM9Lm42efNJvz=9muQO-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_033209_610507_2C5AD417 
X-CRM114-Status: GOOD (  52.20  )
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

T24gV2VkLCBBcHIgMjQsIDIwMjQgYXQgMTE6MjM6MDBBTSArMDIwMCwgQ2hyaXN0b3BoIE3DvGxs
bmVyIHdyb3RlOgo+IE9uIFdlZCwgQXByIDI0LCAyMDI0IGF0IDk6MzTigK9BTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEFwciAy
MywgMjAyNCBhdCAwMzo0Mjo0N1BNIC0wNDAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiA+
IE9uIFR1ZSwgQXByIDIzLCAyMDI0IGF0IDAyOjAwOjUzUE0gLTA0MDAsIENoYXJsaWUgSmVua2lu
cyB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIEFwciAyMywgMjAyNCBhdCAxMDo0NjowMUFNICswMjAw
LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gPiBPbiBNb24sIEFwciAyMiwgMjAyNCBhdCAw
NjozNjo0NVBNIC0wNDAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFN1
biwgQXByIDIxLCAyMDI0IGF0IDEyOjIwOjAzUE0gKzAyMDAsIEFuZHJldyBKb25lcyB3cm90ZToK
PiA+ID4gPiA+ID4gPiBPbiBGcmksIEFwciAxOSwgMjAyNCBhdCAxMjo0MDowMVBNIC0wNDAwLCBD
aGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiA+ID4gPiAuLi4KPiA+ID4gPiA+ID4gPiA+IFdoYXQg
d291bGQgYmUgdGhlIHB1cnBvc2Ugb2YgYSB2ZW5kb3IgaW1wbGVtZW50aW5nIFdSUy5OVE8gKGFu
ZCBwdXR0aW5nCj4gPiA+ID4gPiA+ID4gPiBpdCBpbiB0aGUgRFQpIHRoYXQgbmV2ZXIgdGVybWlu
YXRlcz8gVGhlIHNwZWMgc2F5cyAiVGhlbiBhIHN1YnNlcXVlbnQKPiA+ID4gPiA+ID4gPiA+IFdS
Uy5OVE8gaW5zdHJ1Y3Rpb24gd291bGQgY2F1c2UgdGhlIGhhcnQgdG8gdGVtcG9yYXJpbHkgc3Rh
bGwgZXhlY3V0aW9uCj4gPiA+ID4gPiA+ID4gPiBpbiBhIGxvdy0gcG93ZXIgc3RhdGUgdW50aWwg
YSBzdG9yZSBvY2N1cnMgdG8gdGhlIHJlc2VydmF0aW9uIHNldCBvciBhbgo+ID4gPiA+ID4gPiA+
ID4gaW50ZXJydXB0IGlzIG9ic2VydmVkLiIgV2h5IGlzIHRoaXMgd29yZGluZyBmb3IgV1JTLk5U
TyBub3Qgc3VmZmljaWVudAo+ID4gPiA+ID4gPiA+ID4gdG8gYXNzdW1lIHRoYXQgYW4gaW1wbGVt
ZW50YXRpb24gb2YgdGhpcyBpbnN0cnVjdGlvbiB3b3VsZCBldmVudHVhbGx5Cj4gPiA+ID4gPiA+
ID4gPiB0ZXJtaW5hdGU/Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gV2UgY2FuIGludm9rZSBzbXBfY29uZF9sb2FkX3JlbGF4ZWQoYWRkciwgVkFMIHx8IGFueXRo
aW5nX3dlX3dhbnQoKSkuIFRoaXMKPiA+ID4gPiA+ID4gPiBtZWFucyB3ZSBtYXkgbm90IGV4cGVj
dCBWQUwgZXZlciB0byBiZSB3cml0dGVuLCB3aGljaCBydWxlcyBvdXQgInVudGlsIGEKPiA+ID4g
PiA+ID4gPiBzdG9yZSBvY2N1cnMiLiBBcyBmb3IgImFuIGludGVycnVwdCBpcyBvYnNlcnZlZCIs
IHdlIGRvbid0IGtub3cgd2hpY2ggb25lCj4gPiA+ID4gPiA+ID4gdG8gZXhwZWN0IHRvIGFycml2
ZSB3aXRoaW4gYSAicmVhc29uYWJsZSIgYW1vdW50IG9mIHRpbWUuIFdlIG5lZWQgdG8ga25vdwo+
ID4gPiA+ID4gPiA+IHdoaWNoIG9uZShzKSwgc2luY2UsIHdoaWxlIHdycy5udG8gd2lsbCB0ZXJt
aW5hdGUgZXZlbiB3aGVuIGludGVycnVwdHMgYXJlCj4gPiA+ID4gPiA+ID4gZ2xvYmFsbHkgZGlz
YWJsZWQsIHdlIHN0aWxsIG5lZWQgdG8gaGF2ZSB0aGUgaW50ZXJydXB0KHMpIHdlIGV4cGVjdCB0
byBiZQo+ID4gPiA+ID4gPiA+IGxvY2FsbHkgZW5hYmxlZC4gQW5kLCB0aGUgaW50ZXJydXB0cyBz
aG91bGQgYXJyaXZlIGluIGEgInJlYXNvbmFibGUiCj4gPiA+ID4gPiA+ID4gYW1vdW50IG9mIHRp
bWUgc2luY2Ugd2Ugd2FudCB0byBwb2xsIGFueXRoaW5nX3dlX3dhbnQoKSBhdCBhICJyZWFzb25h
YmxlIgo+ID4gPiA+ID4gPiA+IGZyZXF1ZW5jeS4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IFNvLCB3ZSBuZWVkIGZpcm13YXJlIHRvIHByb21pc2UgdG8gZW5hYmxlIGV4Y2VwdGlvbnMgaWYg
dGhlcmUgYXJlbid0IGFueQo+ID4gPiA+ID4gPiA+IHN1Y2ggaW50ZXJydXB0cy4gT3IsIHdlIGNv
dWxkIHJlcXVpcmUgaGFyZHdhcmUgZGVzY3JpcHRpb25zIHRvIGlkZW50aWZ5Cj4gPiA+ID4gPiA+
ID4gd2hpY2ggaW50ZXJydXB0KHMpIHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBlbmFibGVkIGJlZm9y
ZSBjYWxsaW5nIHdycy5udG8uCj4gPiA+ID4gPiA+ID4gTWF5YmUgdGhlcmUncyBhbHJlYWR5IHNv
bWUgd2F5IHRvIGRlc2NyaWJlIHNvbWV0aGluZyBsaWtlIHRoYXQ/Cj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gPiA+ID4gZHJldwo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBBaGggb2theSBJIGFtIGNhdWdodCB1cCBub3cuIFNvIHRoZSB3b3JkaW5nIHdlIGFyZSBs
b29raW5nIGF0IGluIHRoZQo+ID4gPiA+ID4gPiBzcGVjIGlzOgo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiAiV2hlbiBleGVjdXRpbmcgaW4gVlMgb3IgVlUgbW9kZSwgaWYgdGhlIFZUVyBiaXQgaXMg
c2V0IGluIGhzdGF0dXMsIHRoZQo+ID4gPiA+ID4gPiBUVyBiaXQgaW4gbXN0YXR1cyBpcyBjbGVh
ciwgYW5kIHRoZSBXUlMuTlRPIGRvZXMgbm90IGNvbXBsZXRlIHdpdGhpbiBhbgo+ID4gPiA+ID4g
PiBpbXBsZW1lbnRhdGlvbi1zcGVjaWZpYyBib3VuZGVkIHRpbWUgbGltaXQsIHRoZSBXUlMuTlRP
IGluc3RydWN0aW9uIHdpbGwKPiA+ID4gPiA+ID4gY2F1c2UgYSB2aXJ0dWFsIGluc3RydWN0aW9u
IGV4Y2VwdGlvbi4iCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhhdCdzIHdoYXQgdGhlIGh5cGVydmlz
b3Igc2hvdWxkIHByb21pc2UgdG8gZG8gd2hlbiB0aGVyZSdzIG5vIG90aGVyCj4gPiA+ID4gPiBn
dWFyYW50ZWUgb2Ygd3JzLm50byB0ZXJtaW5hdGluZyAoYnV0IHRoZSBoeXBlcnZpc29yIGxpa2Vs
eSB3YW50cyB0bwo+ID4gPiA+ID4gYW55d2F5IHNpbmNlIGl0IHdhbnRzIGd1ZXN0cyB0byB0cmFw
IG9uIHdycy5udG8gaW4gb3JkZXIgdG8gcG90ZW50aWFsbHkKPiA+ID4gPiA+IHNjaGVkdWxlIHRo
ZSBsb2NrIGhvbGRpbmcgVkNQVSkuIFRoZSBmaXJtd2FyZSBvZiB0aGUgaG9zdCBzaG91bGQgbGlr
ZXdpc2UKPiA+ID4gPiA+IHByb21pc2UgdG8gc2V0IG1zdGF0dXMuVFcgd2hlbiB0aGVyZSdzIG5v
IGd1YXJhbnRlZSBvZiB3cnMubnRvCj4gPiA+ID4gPiB0ZXJtaW5hdGluZywgYnV0IHRoYXQncyBs
aWtlbHkgX25vdF8gc29tZXRoaW5nIGl0IG5vcm1hbGx5IHdvdWxkIHdhbnQgdG8KPiA+ID4gPiA+
IGRvLCBzbyBob3BlZnVsbHkgdGhlcmUgd2lsbCBhbHdheXMgYmUgaW1wbGVtZW50YXRpb24tc3Bl
Y2lmaWMgIm90aGVyCj4gPiA+ID4gPiByZWFzb25zIiB3aGljaCBndWFyYW50ZWUgdGVybWluYXRp
b24uCj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBXaXRoIHRoZSBjb25jZXJuIGJl
aW5nIHRoYXQgaXQgaXMgcG9zc2libGUgZm9yICJpbXBsZW1lbnRhdGlvbi1zcGVjaWZpYwo+ID4g
PiA+ID4gPiBib3VuZGVkIHRpbWUgbGltaXQiIHRvIGJlIGluZmluaXRlL25ldmVyIHRpbWVzIG91
dCwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgaW1wbGVtZW50YXRpb24tZGVmaW5lZCBzaG9ydCB0
aW1lb3V0IGNhbm5vdCBiZSBpbmZpbml0ZSwgYnV0IGl0IG9ubHkKPiA+ID4gPiA+IGFwcGxpZXMg
dG8gd3JzLnN0by4gV2hpbGUgdXNpbmcgd3JzLnN0byB3b3VsZCByZWxpZXZlIHRoZSBjb25jZXJu
LCBpdAo+ID4gPiA+ID4gY2Fubm90IGJlIGNvbmZpZ3VyZWQgdG8gcmFpc2UgZXhjZXB0aW9ucywg
d2hpY2ggbWVhbnMgaXQncyBub3QgdXNlZnVsIGluCj4gPiA+ID4gPiBndWVzdHMuIElmIHdlIHdh
bnQgdG8gdXNlIHdycy5zdG8gaW4gaG9zdHMgYW5kIHdycy5udG8gaW4gZ3Vlc3RzIHRoZW4gd2UK
PiA+ID4gPiA+IG5lZWQgYSBwYXJhdmlydCBjaGFubmVsIHdoaWNoIGFsbG93cyBhbiAiZW5saWdo
dGVuZWQiIGd1ZXN0IHRvIGRldGVybWluZQo+ID4gPiA+ID4gdGhhdCBpdCBpcyBhIGd1ZXN0IGFu
ZCB0aGF0IHRoZSBoeXBlcnZpc29yIGhhcyBjb25maWd1cmVkIHdycy5udG8gdG8KPiA+ID4gPiA+
IHRyYXAsIHdoaWNoIHRoZW4gaW5kaWNhdGVzIGl0J3MgYSBnb29kIGlkZWEgdG8gcGF0Y2ggd3Jz
LnN0byB0byB3cnMubnRvLgo+ID4gPiA+ID4gQnV0LCBhZGRpbmcgcGFyYXZpcnQgc3R1ZmYgc2hv
dWxkIGJlIGF2b2lkZWQgd2hlbmV2ZXIgcG9zc2libGUgc2luY2UgaXQKPiA+ID4gPiA+IGFkZHMg
Y29tcGxleGl0eSB3ZSdkIHJhdGhlciBub3QgbWFpbnRhaW4uCj4gPiA+ID4gPgo+ID4gPiA+Cj4g
PiA+ID4gVGhhdCBzdGlsbCB3b3VsZG4ndCBzb2x2ZSB0aGlzIGlzc3VlLCBiZWNhdXNlIHRoZSB3
cnMubnRvIGd1ZXN0IG1heSBzdGlsbAo+ID4gPiA+IG5ldmVyIHdha2V1cCBpbiB0aGUgaW1wbGVt
ZW50YXRpb24tc3BlY2lmaWMgd2F5Pwo+ID4KPiA+IFRoZSBwYXJhdmlydCBhcHByb2FjaCBkb2Vz
IHNvbHZlIGl0LCBiZWNhdXNlIHdycy5udG8gaXMgc3BlY2lmaWVkIHRvIHJhaXNlCj4gPiBleGNl
cHRpb25zIGFmdGVyIGFuIGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGJvdW5kZWQgdGltZSBsaW1p
dCB3aGVuIHRoZQo+ID4gaHlwZXJ2aXNvciBzZXRzIGhzdGF0dXMuVlRXLgo+ID4KPiA+ID4KPiA+
ID4gVGhpbmtpbmcgYWJvdXQgdGhpcyBhIGJpdCBtb3JlLCB0aGlzIGlzIGEgcGVyZm9ybWFuY2Ug
cGVuYWx0eSBhbmQgbm90IGEKPiA+ID4gY29ycmVjdG5lc3MgaXNzdWUuCj4gPgo+ID4gSXQncyBp
bmNvcnJlY3QgdG8gaGF2ZSBhIGRlc2lnbiB0aGF0IGlzIGxpa2VseSB0byByZXN1bHQgaW4gYmFk
Cj4gPiBwZXJmb3JtYW5jZS4KPiA+Cj4gPiA+IFRoaXMgbGluZSBpcyBhbiBvcHRpbWl6YXRpb24g
dGhhdCBhbGxvd3MgdGhlIGxvY2sKPiA+ID4gaG9sZGVyIHRvIGp1bXAgdGhlIHF1ZXVlIGlmIHRo
ZSBob2xkZXIgZGlyZWN0bHkgaW4gZnJvbnQgaXMgYSBwcmVlbXB0ZWQKPiA+ID4gdmNwdS4gRXZl
bnR1YWxseSB0aGUgdmNwdSB3aWxsIGJlIHNjaGVkdWxlZCBhZ2FpbiBhbmQgZ2l2ZSB1cCB0aGUg
bG9jay4KPiA+ID4gU28gYW4gaW1wbGVtZW50YXRpb24gb2YgV1JTLk5UTyB0aGF0IGRvZXMgbm90
IGhhdmUgdGhlCj4gPiA+ICJpbXBsZW1lbnRhdGlvbi1zcGVjaWZpYyBib3VuZGVkIHRpbWUgbGlt
aXQiIHRoYXQgdGhlIHNwZWMgY2FsbHMgb3V0IGZvcgo+ID4gPiBXUlMuTlRPIHRvIHJhaXNlIGEg
dmlydHVhbCBpbnN0cnVjdGlvbiBleGNlcHRpb24sIHdvdWxkIHN0aWxsIGZ1bmN0aW9uLAo+ID4g
PiBqdXN0IHNsb3dlci4KPiA+Cj4gPiBUaGUgcHJvYmxlbSBpc24ndCBzcGVjaWZpYyB0byB2aXJ0
dWFsaXphdGlvbi4gVGhlIHByb2JsZW0gaXMgdXNpbmcgd3JzLm50bwo+ID4gd2hlbiBpdCBoYXMg
bm90IGJlZW4gY29uZmlndXJlZCB0byByYWlzZSBleGNlcHRpb25zIGFuZCB0aGVyZSBhcmUgbm90
IGFueQo+ID4gb3RoZXIgZ3VhcmFudGVlZCB0ZXJtaW5hdGlvbiBldmVudHMgKG90aGVyIHRoYW4g
dGhlIHJlc2VydmF0aW9uIHNldAo+ID4gYmVjb21pbmcgaW52YWxpZCkuIFdoaWxlIHRoZSBwYXJh
dmlydCBzb2x1dGlvbiBpcyB2aXJ0dWFsaXphdGlvbiBzcGVjaWZpYywKPiA+IGl0IHdvcmtzLCBi
ZWNhdXNlIHdlIHdvdWxkIHRoZW4gb25seSB1c2Ugd3JzLm50byB3aGVuIHdlIGtub3cgd2UgY2Fu
LCBhbmQKPiA+IG90aGVyd2lzZSB1c2Ugd3JzLnN0by4gQnV0LCBhcyBJIHNhaWQsIEknZCByYXRo
ZXIgbm90IGhhdmUgYSBwYXJhdmlydAo+ID4gc29sdXRpb24uCj4gCj4gQW5kcmV3LCBpdCB3b3Vs
ZCBiZSBncmVhdCBpZiB5b3UgY291bGQgc3VtbWFyaXplIHRoaXMgZmluZGluZyB0byB0aGUKPiBz
cGVjIGF1dGhvcnMuCj4gTWF5YmUgYSBub24tbm9ybWF0aXZlIHRleHQgYWRkZWQgdG8gdGhlIHNw
ZWMgKHRoYXQgcmFpc2VzIGF3YXJlbmVzcwo+IGZvciB0aGUgaXNzdWUKClN1cmUsIEknbGwgd3Jp
dGUgc29tZXRoaW5nIHVwIHBvaW50aW5nIG91dCB0aGUgY29uY2VybiB3aXRoIHdycy5udG8gYW5k
CnBvc3QgaXQgdG8gYSBmZXcgUlZJIG1haWxpbmcgbGlzdHMuCgo+IGFuZCBwcm92aWRlcyBhIGd1
aWRlbGluZSB0byBhdm9pZCBpdCkgY291bGQgcmVkdWNlIHRoZSByaXNrIG9mIHRyaWdnZXJpbmcK
PiB0aGUgaXNzdWUgb24gcmVhbCBIVy4gVGhpcyBtaWdodCBiZSBlbm91Z2gganVzdGlmaWNhdGlv
biB0byB1c2UgV1JTLk5UTy4KPiAKPiBJZiBXUlMuTlRPIGlzIGNvbnNpZGVyZWQgYXMgbm90IHJl
bGlhYmxlIGVub3VnaCB0byB3YWtlIHVwIGFuZCB0aGVyZWZvcmUgY2F1c2luZwo+IHBlcmZvcm1h
bmNlIGlzc3VlcyBvciBDUFUgc3RhbGxzIGlmIHVzZWQgZm9yIHRoZSBzcGluIGxvY2sgb3B0aW1p
emF0aW9uLAo+IGl0IG1pZ2h0IGJlIGFsc28gcmVhc29uYWJsZSB0byB1c2UgV1JTLlNUTyBpbnN0
ZWFkLgo+IFRoZSBjb3N0IG9mIGhhdmluZyB0b28gbWFueSB3YWtldXBzIHNlZW1zIG11Y2ggbW9y
ZSBhY2NlcHRhYmxlIHRoYW4KPiBhIHN0YWxsZWQgQ1BVLgoKd3JzLnN0byBpcyByZWFzb25hYmxl
IHRvIHVzZSBpbiBhbGwgY2FzZXMsIHNpbmNlIHRvbyBtYW55IHdha2V1cHMgaXNuJ3QKYSBjb25j
ZXJuLiBCdXQsIHdlIGNhbiBkbyBiZXR0ZXIgaW4gdGhlIHZpcnR1YWxpemF0aW9uIGNhc2Ugd2l0
aCB3cnMubnRvLAp3aGVyZSB0aGUgaHlwZXJ2aXNvciBjYW4gZ2V0IGludm9sdmVkLCBzbywgdG8g
YXZvaWQgcGFyYXZpcnQgc3R1ZmYsIHdlJ2QKbGlrZSB0byBiZSBhYmxlIHRvIGFsd2F5cyB1c2Ug
d3JzLm50by4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
