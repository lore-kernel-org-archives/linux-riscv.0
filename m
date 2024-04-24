Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1049EC10F15
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxpU8ONdAl/12HiK1bvh/sUPp7grWoL164Hdl7y1SQs=; b=vT6BLP0fhD8TJm
	bbybfyMbtBdob9cjpA5u6B2VNiqDkVjmca/wLcu6EQCTQQzqRVrrFXxDbFrwDdgVxx9CVCfttDhLV
	5THWOk6LAf5LTSm+kBc3INvhE6KJCrdyGachu+UzOh/hC6jxpH008ja3UkCoG3yPCI9YeoyINyNP1
	dC0/nXVFsQltzpnbr+9GsPRyDRyr/u6vetN+yzRMS2U1R/QFcV6LTym2sLpG3SGiQ/bFqyp0fReg/
	5y8+iY7N+pE/VInh9NNVQPyVvlugzqThhmWt65JIvGvOTJcfmkp8CQ47d7GrtjXDKhyhxpyPsRTCz
	gKgbfNCUHxIxuRb83REQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzYqy-00000003UPo-1CY6;
	Wed, 24 Apr 2024 09:23:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzYqu-00000003UOr-35M3
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 09:23:46 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ed3cafd766so5479789b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 02:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1713950623; x=1714555423; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7BdP0uJEv7/jkC6eOGbVJWNsJFfTwDmB/EUSm7gPko=;
        b=Ub5DfxRiDLohJD6TkdyC83DuUgQvhOa4QtigcgTkm8mdOzt47o8zDxUYuJT/FWpdz8
         wyy1HCX9640V8/H+YykNKF6aO6rEC9zsKD/uUuE5BDmwEWpeMX46GLOJe8f85i75T9aV
         LpcdwRsZpPf6T4TQxw3N7ZobOMT8PrditviX3Ub89PpoHVNpz/nd+M55e2yWHAS/XV9o
         18YqyDkmCQ1zIlg2Men11QAeNVqIewQm8FT2n+UoXPlDkFMIy5diXroa5Yfp2D4AoOtf
         djL0tHte/7oa5Qx1Ii83aoRQsVXJvV64jnDyIwXzuGULuWe8RPT2x8H7vMjgY+tpKaBz
         6GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713950623; x=1714555423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7BdP0uJEv7/jkC6eOGbVJWNsJFfTwDmB/EUSm7gPko=;
        b=FgB3dsvbuLd2lHJB4AG+lZ32UeIP1+G2wHGuIpZ+MCFxV/hJ0iop79Vdw5iLI1D0sZ
         63rEjOzcHmr+a1dEkXajXOkGGoGxS+7yIdaGfEOj8nRP6fe/vSj1/yxaMAuPPj26aWNa
         lpEMVUdb2YjlKTboNnG2yds8Qa4bvDzmbK3qUF7pU+YKahCqKAn1ICdhNHazkq6FaLZs
         9Bc/8qaoqZXYGE4Q06lnpyeu3daqPRfMOo7F9YH7YbgGr2F5Q90mKKie+jlETQDp9Bvo
         WcwxmkIBb1CPfbf/vp8Yh4PEagYi92s5+1qVZlNVLbPmZKGT0pvlCW4mqZADoLyvm8HY
         SioQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtkSDRzxWZqfg1UOazva6RbHPmCQfR9shJbdBr5QTOjUL3HhFY1ndAOdDQB8txJCT8wGUI98vwaz4ixfLfVuYJ5UCUCEJcABZE5Yia4+kW
X-Gm-Message-State: AOJu0Yzg4WbJJ8xV9DsRRwugVDVOI6/1ftyLHIhv3QJaU/rVc1DTd+wj
	y+rs6v/+6yFkdLNJqYeL9s3TsBRDMnfQ+oyMr+rPHoX6uAHotqK6qOt+gYl+iV+IkRrAnVuyfZT
	vYKj0yheLWljn3JdhnJSoUDJy42K8+PuGwIuWEw==
X-Google-Smtp-Source: AGHT+IHMI5QdTAo8sdi8RnwCRa6eiz/6Qb/xkd7d1PJxV/s3Ex/lwlCQAspb8BIaXyT49C3PHy0oLEUUjwuHahT8emU=
X-Received: by 2002:a05:6a20:244f:b0:1a7:91b0:4f2a with SMTP id
 t15-20020a056a20244f00b001a791b04f2amr2008888pzc.41.1713950622880; Wed, 24
 Apr 2024 02:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud> <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud> <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel> <ZibmfbLnGCb9gmow@ghost>
 <20240423-ed9ddb701be1df4a25e29f31@orel> <Zif3VZALGtLtl3D3@ghost>
 <ZigPN/iJ/gLT4DOD@ghost> <20240424-0e571b29835610c24409762b@orel>
In-Reply-To: <20240424-0e571b29835610c24409762b@orel>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Wed, 24 Apr 2024 11:23:00 +0200
Message-ID: <CAEg0e7gYteAbHyQCvodO=Mh20qpW4oM9Lm42efNJvz=9muQO-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension description
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, anup@brainfault.org, 
	atishp@atishpatra.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, heiko@sntech.de, David.Laight@aculab.com, 
	parri.andrea@gmail.com, luxu.kernel@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_022344_859646_892019F2 
X-CRM114-Status: GOOD (  45.45  )
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

T24gV2VkLCBBcHIgMjQsIDIwMjQgYXQgOTozNOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMjMsIDIwMjQgYXQgMDM6NDI6
NDdQTSAtMDQwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gT24gVHVlLCBBcHIgMjMsIDIw
MjQgYXQgMDI6MDA6NTNQTSAtMDQwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiBPbiBU
dWUsIEFwciAyMywgMjAyNCBhdCAxMDo0NjowMUFNICswMjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6
Cj4gPiA+ID4gT24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMDY6MzY6NDVQTSAtMDQwMCwgQ2hhcmxp
ZSBKZW5raW5zIHdyb3RlOgo+ID4gPiA+ID4gT24gU3VuLCBBcHIgMjEsIDIwMjQgYXQgMTI6MjA6
MDNQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBGcmksIEFwciAx
OSwgMjAyNCBhdCAxMjo0MDowMVBNIC0wNDAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiA+
ID4gLi4uCj4gPiA+ID4gPiA+ID4gV2hhdCB3b3VsZCBiZSB0aGUgcHVycG9zZSBvZiBhIHZlbmRv
ciBpbXBsZW1lbnRpbmcgV1JTLk5UTyAoYW5kIHB1dHRpbmcKPiA+ID4gPiA+ID4gPiBpdCBpbiB0
aGUgRFQpIHRoYXQgbmV2ZXIgdGVybWluYXRlcz8gVGhlIHNwZWMgc2F5cyAiVGhlbiBhIHN1YnNl
cXVlbnQKPiA+ID4gPiA+ID4gPiBXUlMuTlRPIGluc3RydWN0aW9uIHdvdWxkIGNhdXNlIHRoZSBo
YXJ0IHRvIHRlbXBvcmFyaWx5IHN0YWxsIGV4ZWN1dGlvbgo+ID4gPiA+ID4gPiA+IGluIGEgbG93
LSBwb3dlciBzdGF0ZSB1bnRpbCBhIHN0b3JlIG9jY3VycyB0byB0aGUgcmVzZXJ2YXRpb24gc2V0
IG9yIGFuCj4gPiA+ID4gPiA+ID4gaW50ZXJydXB0IGlzIG9ic2VydmVkLiIgV2h5IGlzIHRoaXMg
d29yZGluZyBmb3IgV1JTLk5UTyBub3Qgc3VmZmljaWVudAo+ID4gPiA+ID4gPiA+IHRvIGFzc3Vt
ZSB0aGF0IGFuIGltcGxlbWVudGF0aW9uIG9mIHRoaXMgaW5zdHJ1Y3Rpb24gd291bGQgZXZlbnR1
YWxseQo+ID4gPiA+ID4gPiA+IHRlcm1pbmF0ZT8KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBXZSBjYW4gaW52b2tlIHNtcF9jb25kX2xvYWRfcmVsYXhlZChhZGRyLCBWQUwg
fHwgYW55dGhpbmdfd2Vfd2FudCgpKS4gVGhpcwo+ID4gPiA+ID4gPiBtZWFucyB3ZSBtYXkgbm90
IGV4cGVjdCBWQUwgZXZlciB0byBiZSB3cml0dGVuLCB3aGljaCBydWxlcyBvdXQgInVudGlsIGEK
PiA+ID4gPiA+ID4gc3RvcmUgb2NjdXJzIi4gQXMgZm9yICJhbiBpbnRlcnJ1cHQgaXMgb2JzZXJ2
ZWQiLCB3ZSBkb24ndCBrbm93IHdoaWNoIG9uZQo+ID4gPiA+ID4gPiB0byBleHBlY3QgdG8gYXJy
aXZlIHdpdGhpbiBhICJyZWFzb25hYmxlIiBhbW91bnQgb2YgdGltZS4gV2UgbmVlZCB0byBrbm93
Cj4gPiA+ID4gPiA+IHdoaWNoIG9uZShzKSwgc2luY2UsIHdoaWxlIHdycy5udG8gd2lsbCB0ZXJt
aW5hdGUgZXZlbiB3aGVuIGludGVycnVwdHMgYXJlCj4gPiA+ID4gPiA+IGdsb2JhbGx5IGRpc2Fi
bGVkLCB3ZSBzdGlsbCBuZWVkIHRvIGhhdmUgdGhlIGludGVycnVwdChzKSB3ZSBleHBlY3QgdG8g
YmUKPiA+ID4gPiA+ID4gbG9jYWxseSBlbmFibGVkLiBBbmQsIHRoZSBpbnRlcnJ1cHRzIHNob3Vs
ZCBhcnJpdmUgaW4gYSAicmVhc29uYWJsZSIKPiA+ID4gPiA+ID4gYW1vdW50IG9mIHRpbWUgc2lu
Y2Ugd2Ugd2FudCB0byBwb2xsIGFueXRoaW5nX3dlX3dhbnQoKSBhdCBhICJyZWFzb25hYmxlIgo+
ID4gPiA+ID4gPiBmcmVxdWVuY3kuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNvLCB3ZSBuZWVk
IGZpcm13YXJlIHRvIHByb21pc2UgdG8gZW5hYmxlIGV4Y2VwdGlvbnMgaWYgdGhlcmUgYXJlbid0
IGFueQo+ID4gPiA+ID4gPiBzdWNoIGludGVycnVwdHMuIE9yLCB3ZSBjb3VsZCByZXF1aXJlIGhh
cmR3YXJlIGRlc2NyaXB0aW9ucyB0byBpZGVudGlmeQo+ID4gPiA+ID4gPiB3aGljaCBpbnRlcnJ1
cHQocykgd291bGQgYmUgZ29vZCB0byBoYXZlIGVuYWJsZWQgYmVmb3JlIGNhbGxpbmcgd3JzLm50
by4KPiA+ID4gPiA+ID4gTWF5YmUgdGhlcmUncyBhbHJlYWR5IHNvbWUgd2F5IHRvIGRlc2NyaWJl
IHNvbWV0aGluZyBsaWtlIHRoYXQ/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYW5rcywKPiA+
ID4gPiA+ID4gZHJldwo+ID4gPiA+ID4KPiA+ID4gPiA+IEFoaCBva2F5IEkgYW0gY2F1Z2h0IHVw
IG5vdy4gU28gdGhlIHdvcmRpbmcgd2UgYXJlIGxvb2tpbmcgYXQgaW4gdGhlCj4gPiA+ID4gPiBz
cGVjIGlzOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICJXaGVuIGV4ZWN1dGluZyBpbiBWUyBvciBWVSBt
b2RlLCBpZiB0aGUgVlRXIGJpdCBpcyBzZXQgaW4gaHN0YXR1cywgdGhlCj4gPiA+ID4gPiBUVyBi
aXQgaW4gbXN0YXR1cyBpcyBjbGVhciwgYW5kIHRoZSBXUlMuTlRPIGRvZXMgbm90IGNvbXBsZXRl
IHdpdGhpbiBhbgo+ID4gPiA+ID4gaW1wbGVtZW50YXRpb24tc3BlY2lmaWMgYm91bmRlZCB0aW1l
IGxpbWl0LCB0aGUgV1JTLk5UTyBpbnN0cnVjdGlvbiB3aWxsCj4gPiA+ID4gPiBjYXVzZSBhIHZp
cnR1YWwgaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLiIKPiA+ID4gPgo+ID4gPiA+IFRoYXQncyB3aGF0
IHRoZSBoeXBlcnZpc29yIHNob3VsZCBwcm9taXNlIHRvIGRvIHdoZW4gdGhlcmUncyBubyBvdGhl
cgo+ID4gPiA+IGd1YXJhbnRlZSBvZiB3cnMubnRvIHRlcm1pbmF0aW5nIChidXQgdGhlIGh5cGVy
dmlzb3IgbGlrZWx5IHdhbnRzIHRvCj4gPiA+ID4gYW55d2F5IHNpbmNlIGl0IHdhbnRzIGd1ZXN0
cyB0byB0cmFwIG9uIHdycy5udG8gaW4gb3JkZXIgdG8gcG90ZW50aWFsbHkKPiA+ID4gPiBzY2hl
ZHVsZSB0aGUgbG9jayBob2xkaW5nIFZDUFUpLiBUaGUgZmlybXdhcmUgb2YgdGhlIGhvc3Qgc2hv
dWxkIGxpa2V3aXNlCj4gPiA+ID4gcHJvbWlzZSB0byBzZXQgbXN0YXR1cy5UVyB3aGVuIHRoZXJl
J3Mgbm8gZ3VhcmFudGVlIG9mIHdycy5udG8KPiA+ID4gPiB0ZXJtaW5hdGluZywgYnV0IHRoYXQn
cyBsaWtlbHkgX25vdF8gc29tZXRoaW5nIGl0IG5vcm1hbGx5IHdvdWxkIHdhbnQgdG8KPiA+ID4g
PiBkbywgc28gaG9wZWZ1bGx5IHRoZXJlIHdpbGwgYWx3YXlzIGJlIGltcGxlbWVudGF0aW9uLXNw
ZWNpZmljICJvdGhlcgo+ID4gPiA+IHJlYXNvbnMiIHdoaWNoIGd1YXJhbnRlZSB0ZXJtaW5hdGlv
bi4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdpdGggdGhlIGNvbmNlcm4gYmVpbmcgdGhh
dCBpdCBpcyBwb3NzaWJsZSBmb3IgImltcGxlbWVudGF0aW9uLXNwZWNpZmljCj4gPiA+ID4gPiBi
b3VuZGVkIHRpbWUgbGltaXQiIHRvIGJlIGluZmluaXRlL25ldmVyIHRpbWVzIG91dCwKPiA+ID4g
Pgo+ID4gPiA+IFRoZSBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIHNob3J0IHRpbWVvdXQgY2Fubm90
IGJlIGluZmluaXRlLCBidXQgaXQgb25seQo+ID4gPiA+IGFwcGxpZXMgdG8gd3JzLnN0by4gV2hp
bGUgdXNpbmcgd3JzLnN0byB3b3VsZCByZWxpZXZlIHRoZSBjb25jZXJuLCBpdAo+ID4gPiA+IGNh
bm5vdCBiZSBjb25maWd1cmVkIHRvIHJhaXNlIGV4Y2VwdGlvbnMsIHdoaWNoIG1lYW5zIGl0J3Mg
bm90IHVzZWZ1bCBpbgo+ID4gPiA+IGd1ZXN0cy4gSWYgd2Ugd2FudCB0byB1c2Ugd3JzLnN0byBp
biBob3N0cyBhbmQgd3JzLm50byBpbiBndWVzdHMgdGhlbiB3ZQo+ID4gPiA+IG5lZWQgYSBwYXJh
dmlydCBjaGFubmVsIHdoaWNoIGFsbG93cyBhbiAiZW5saWdodGVuZWQiIGd1ZXN0IHRvIGRldGVy
bWluZQo+ID4gPiA+IHRoYXQgaXQgaXMgYSBndWVzdCBhbmQgdGhhdCB0aGUgaHlwZXJ2aXNvciBo
YXMgY29uZmlndXJlZCB3cnMubnRvIHRvCj4gPiA+ID4gdHJhcCwgd2hpY2ggdGhlbiBpbmRpY2F0
ZXMgaXQncyBhIGdvb2QgaWRlYSB0byBwYXRjaCB3cnMuc3RvIHRvIHdycy5udG8uCj4gPiA+ID4g
QnV0LCBhZGRpbmcgcGFyYXZpcnQgc3R1ZmYgc2hvdWxkIGJlIGF2b2lkZWQgd2hlbmV2ZXIgcG9z
c2libGUgc2luY2UgaXQKPiA+ID4gPiBhZGRzIGNvbXBsZXhpdHkgd2UnZCByYXRoZXIgbm90IG1h
aW50YWluLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRoYXQgc3RpbGwgd291bGRuJ3Qgc29sdmUgdGhp
cyBpc3N1ZSwgYmVjYXVzZSB0aGUgd3JzLm50byBndWVzdCBtYXkgc3RpbGwKPiA+ID4gbmV2ZXIg
d2FrZXVwIGluIHRoZSBpbXBsZW1lbnRhdGlvbi1zcGVjaWZpYyB3YXk/Cj4KPiBUaGUgcGFyYXZp
cnQgYXBwcm9hY2ggZG9lcyBzb2x2ZSBpdCwgYmVjYXVzZSB3cnMubnRvIGlzIHNwZWNpZmllZCB0
byByYWlzZQo+IGV4Y2VwdGlvbnMgYWZ0ZXIgYW4gaW1wbGVtZW50YXRpb24tc3BlY2lmaWMgYm91
bmRlZCB0aW1lIGxpbWl0IHdoZW4gdGhlCj4gaHlwZXJ2aXNvciBzZXRzIGhzdGF0dXMuVlRXLgo+
Cj4gPgo+ID4gVGhpbmtpbmcgYWJvdXQgdGhpcyBhIGJpdCBtb3JlLCB0aGlzIGlzIGEgcGVyZm9y
bWFuY2UgcGVuYWx0eSBhbmQgbm90IGEKPiA+IGNvcnJlY3RuZXNzIGlzc3VlLgo+Cj4gSXQncyBp
bmNvcnJlY3QgdG8gaGF2ZSBhIGRlc2lnbiB0aGF0IGlzIGxpa2VseSB0byByZXN1bHQgaW4gYmFk
Cj4gcGVyZm9ybWFuY2UuCj4KPiA+IFRoaXMgbGluZSBpcyBhbiBvcHRpbWl6YXRpb24gdGhhdCBh
bGxvd3MgdGhlIGxvY2sKPiA+IGhvbGRlciB0byBqdW1wIHRoZSBxdWV1ZSBpZiB0aGUgaG9sZGVy
IGRpcmVjdGx5IGluIGZyb250IGlzIGEgcHJlZW1wdGVkCj4gPiB2Y3B1LiBFdmVudHVhbGx5IHRo
ZSB2Y3B1IHdpbGwgYmUgc2NoZWR1bGVkIGFnYWluIGFuZCBnaXZlIHVwIHRoZSBsb2NrLgo+ID4g
U28gYW4gaW1wbGVtZW50YXRpb24gb2YgV1JTLk5UTyB0aGF0IGRvZXMgbm90IGhhdmUgdGhlCj4g
PiAiaW1wbGVtZW50YXRpb24tc3BlY2lmaWMgYm91bmRlZCB0aW1lIGxpbWl0IiB0aGF0IHRoZSBz
cGVjIGNhbGxzIG91dCBmb3IKPiA+IFdSUy5OVE8gdG8gcmFpc2UgYSB2aXJ0dWFsIGluc3RydWN0
aW9uIGV4Y2VwdGlvbiwgd291bGQgc3RpbGwgZnVuY3Rpb24sCj4gPiBqdXN0IHNsb3dlci4KPgo+
IFRoZSBwcm9ibGVtIGlzbid0IHNwZWNpZmljIHRvIHZpcnR1YWxpemF0aW9uLiBUaGUgcHJvYmxl
bSBpcyB1c2luZyB3cnMubnRvCj4gd2hlbiBpdCBoYXMgbm90IGJlZW4gY29uZmlndXJlZCB0byBy
YWlzZSBleGNlcHRpb25zIGFuZCB0aGVyZSBhcmUgbm90IGFueQo+IG90aGVyIGd1YXJhbnRlZWQg
dGVybWluYXRpb24gZXZlbnRzIChvdGhlciB0aGFuIHRoZSByZXNlcnZhdGlvbiBzZXQKPiBiZWNv
bWluZyBpbnZhbGlkKS4gV2hpbGUgdGhlIHBhcmF2aXJ0IHNvbHV0aW9uIGlzIHZpcnR1YWxpemF0
aW9uIHNwZWNpZmljLAo+IGl0IHdvcmtzLCBiZWNhdXNlIHdlIHdvdWxkIHRoZW4gb25seSB1c2Ug
d3JzLm50byB3aGVuIHdlIGtub3cgd2UgY2FuLCBhbmQKPiBvdGhlcndpc2UgdXNlIHdycy5zdG8u
IEJ1dCwgYXMgSSBzYWlkLCBJJ2QgcmF0aGVyIG5vdCBoYXZlIGEgcGFyYXZpcnQKPiBzb2x1dGlv
bi4KCkFuZHJldywgaXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IGNvdWxkIHN1bW1hcml6ZSB0aGlz
IGZpbmRpbmcgdG8gdGhlCnNwZWMgYXV0aG9ycy4KTWF5YmUgYSBub24tbm9ybWF0aXZlIHRleHQg
YWRkZWQgdG8gdGhlIHNwZWMgKHRoYXQgcmFpc2VzIGF3YXJlbmVzcwpmb3IgdGhlIGlzc3VlCmFu
ZCBwcm92aWRlcyBhIGd1aWRlbGluZSB0byBhdm9pZCBpdCkgY291bGQgcmVkdWNlIHRoZSByaXNr
IG9mIHRyaWdnZXJpbmcKdGhlIGlzc3VlIG9uIHJlYWwgSFcuIFRoaXMgbWlnaHQgYmUgZW5vdWdo
IGp1c3RpZmljYXRpb24gdG8gdXNlIFdSUy5OVE8uCgpJZiBXUlMuTlRPIGlzIGNvbnNpZGVyZWQg
YXMgbm90IHJlbGlhYmxlIGVub3VnaCB0byB3YWtlIHVwIGFuZCB0aGVyZWZvcmUgY2F1c2luZwpw
ZXJmb3JtYW5jZSBpc3N1ZXMgb3IgQ1BVIHN0YWxscyBpZiB1c2VkIGZvciB0aGUgc3BpbiBsb2Nr
IG9wdGltaXphdGlvbiwKaXQgbWlnaHQgYmUgYWxzbyByZWFzb25hYmxlIHRvIHVzZSBXUlMuU1RP
IGluc3RlYWQuClRoZSBjb3N0IG9mIGhhdmluZyB0b28gbWFueSB3YWtldXBzIHNlZW1zIG11Y2gg
bW9yZSBhY2NlcHRhYmxlIHRoYW4KYSBzdGFsbGVkIENQVS4KCkJSCkNocmlzdG9waAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
