Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1502EC25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YarlkleEbJ3vHbkpWgl12MFUF50m1p90DOlo4Nmm5dc=; b=cLj2EDmc+LQZLp
	j/rMfaTeyZbQAEizOjd5FH/PlY/4mr+kZe/zOdOH75a0XsLV0M2RS6xIgJ4txzGGo92u2EI33xdtv
	eCD1ulcGVPQThgmrWRywERE8uHvM2LXhS1DCuwsBa4OLuMl/qbNQ63VZlIrQe8A0rmK8HYU/DJEpg
	1vQJfzn0b4dfEVdFK47aTDozEwKjcapMvCVXof127B2FC7S8cM9Mt71Mcv7NSp82lrj/qdRjWoO0E
	yUI0kU/VrmyqSdsVTYq/k1egldmgkA1wFXpEgNKFsQCIOtGuuNKUgu6VArafdvzJB1okskA5HrcXA
	2cSFImww6tFhLeHoRTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Wo3-0000000185b-2Khe;
	Tue, 21 May 2024 21:13:59 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Wo0-0000000183Y-3Txm
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 21:13:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6f43ee95078so1999873b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 14:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716326034; x=1716930834; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FC4kUSh55rUz/GL+Wk6zz4yqmj0fvdXDk4Dif5NdqwE=;
        b=nbmvY9xsm0v6sizF8qQIgq5cMuZFPRsmGFd07nN0Uy20c+bZekK3XzMZihBVj+MZ78
         vIrHe9M1AzzYe8rWnmoIEG/Cb0rpW6nk/ufw0i8WIINbmt069IeS7PwWG0Uv+KqBlNO4
         j0lq0BwbHC7kwhLTr0MbQgleIGuuwiVsjtr7ABKjDWUt0hMs0C+O6bMEdYYGm4Uv0ROR
         RSD5kXF1GQOTnUSMPp3XAx6OuigVS3/4GI/ILhbJY7KhTQmMaELnBF1Vo666iVrhrvXY
         m0RviUWiCA/A8IxQjpyY9k1UHe7d4HZ+7dZa+r7zf22cj0zhR4PJJ/2rCA5Ni3ajRsVh
         DXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716326034; x=1716930834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FC4kUSh55rUz/GL+Wk6zz4yqmj0fvdXDk4Dif5NdqwE=;
        b=WKxvypPbhN1ZVddLK1GMWZl9V9oRZfZm9U9ZWctU+e5iq+ai70SaK/WHxLdP8KBc4A
         adt2iKbX74pKFWQ04Ynz/TwChzTCBs339n8N+nnRV7IOUvrxinBP4qmVSg2We1bXbV43
         9BFDdT6sk11onXQuTfG7ElyBklRVOZ54IM5tnrENH2eYWCHUyJVCTLuslJFaGPCVfAGA
         t9CQI0mdE+jYShyJFyn4HY7gwDA2E0U93raBTpHkcObgjFeIEAGb/Lbsz8oYU2LgEwHE
         HFfiNfj69q+z2R647JyvXEpNCm16MbcXH8O8CX0Pr48So5I1wsKFzctf+50e/sffL0QG
         aoeA==
X-Forwarded-Encrypted: i=1; AJvYcCUV6/oMiMytSF+KWynl6HON0WztBNaYNPimJyYXclsQxumZjPC96e/8nqcgmJdaVLkazXIITK++mtmu3T619TtTIHiKI3VuDNl+d1B4oj9j
X-Gm-Message-State: AOJu0YwkNq6Rb3ani6ZFJyVfU6Sn324wgw7+C1rqqdMyYkMPxE/HgMtd
	R2KlCZy7cg1Mr8sxYniY1zZn08AHxUL38h2Val/IWWRRpBBnNhCuJzB9lX1OmvE=
X-Google-Smtp-Source: AGHT+IExOxw4dQLOtq/6oMwBUTDL+aZgZxi9IpFxyzL92tIt1l3Fojcg/3lRIxum789QUlv64lDgPg==
X-Received: by 2002:a05:6a20:a10e:b0:1b0:1a02:4131 with SMTP id adf61e73a8af0-1b1f87f815dmr257815637.2.1716326034285;
        Tue, 21 May 2024 14:13:54 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b254cfsm21167196b3a.200.2024.05.21.14.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 14:13:53 -0700 (PDT)
Date: Tue, 21 May 2024 14:13:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org,
	Elliott Hughes <enh@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: riscv: hwprobe: Clarify misaligned keys are
 values not bitmasks
Message-ID: <Zk0OjpW1nizPXHe+@ghost>
References: <tencent_9D721BDDF88C04DBB5151D57711D62524209@qq.com>
 <tencent_338DF690631BAE788C4CC858233E9FBAE006@qq.com>
 <CALs-HssGcNso6vTfbcsiWX1h_46jgDDRcEWcfZCTpxXYnubcng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HssGcNso6vTfbcsiWX1h_46jgDDRcEWcfZCTpxXYnubcng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_141356_895458_90D0030E 
X-CRM114-Status: GOOD (  32.79  )
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

T24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMTE6MzY6MDZBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBTYXQsIE1heSAxOCwgMjAyNCBhdCA5OjAw4oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBj
eXlzZWxmLm5hbWU+IHdyb3RlOgo+ID4KPiA+IFRoZSBvcmlnaW5hbCBkb2N1bWVudGF0aW9uIHNh
eXMgaHdwcm9iZSBrZXlzIGFyZSBiaXRtYXNrcywgYnV0IGFjdHVhbGx5LAo+ID4gdGhleSBhcmUg
dmFsdWVzLiBUaGlzIHBhdGNoIGNsYXJpZmllcyB0aGlzIHRvIGF2b2lkIGNvbmZ1c2lvbi4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFtZT4KPiAKPiBI
bSwgd2UgYWxzbyBoYXZlIHRoaXMgcHJvYmxlbSBpbiB0aGUgY29kZSwgc2luY2UKPiBod3Byb2Jl
X2tleV9pc19iaXRtYXNrKCkgcmV0dXJucyB0cnVlIGZvciBLRVlfQ1BVUEVSRl8wLiBUaGlzIHJl
c3VsdHMKPiBpbiB3cm9uZyBpbmZvcm1hdGlvbiBiZWluZyByZXR1cm5lZCBmb3IgcXVlcmllcyB1
c2luZyB0aGUgV0hJQ0hfQ1BVCj4gZmxhZy4gSWYgdXNlcm1vZGUgYXNrZWQgZm9yIHRoZSBzZXQg
b2YgQ1BVcyB0aGF0IHdhcyBzcGVjaWZpY2FsbHkgU0xPVwo+IG9yIEVNVUxBVEVELCB0aGUgcmV0
dXJuZWQgY3B1c2V0IHdvdWxkIGFsc28gaW5jbHVkZSBjcHVzIHRoYXQgd2VyZQo+IEZBU1QuIEkg
YmVsaWV2ZSBhbGwgb3RoZXIgcXVlcmllcyBhcmUgb2theS4KPiAKPiBUaGUgb25lLWxpbmVyIGZp
eCBpcyB0byBqdXN0IG5vdCByZXR1cm4gdHJ1ZSBmb3IgdGhhdCBrZXkgaW4KPiBod3Byb2JlX2tl
eV9pc19iaXRtYXNrKCkuIEJ1dCB0aGF0J3MgdGVjaG5pY2FsbHkgdXNlci12aXNpYmxlOiBpZiBz
b21lCj4gc29mdHdhcmUgcmVsaWVkIG9uIHRoZSBidWdneSBiZWhhdmlvciBvZiBGQVNUIGNwdXMg
YmVpbmcgc3dlcHQgdXAgaW4KPiB0aGUgcXVlcnkgZm9yIFNMT1cgb3IgRU1VTEFURUQgY3B1cywg
dGhpcyBjaGFuZ2Ugd291bGQgZXhwb3NlIHRoYXQuCj4gVGhlIGdyb3dudXBzLWVhdC10aGVpci12
ZWdldGFibGVzIHRoaW5nIHRvIGRvIHdvdWxkIGJlIHRvIGRlZmluZSBhIG5ldwo+IGtleSB0aGF0
IHJldHVybnMgdGhpcyBzYW1lIHZhbHVlLCBidXQgZG9lc24ndCByZXR1cm4gdHJ1ZSBpbgo+IGh3
cHJvYmVfa2V5X2lzX2JpdG1hc2soKS4gV2hhdCBkbyBwZW9wbGUgdGhpbms/CgpJIGFncmVlLiBB
IG5ldyBrZXkgc2VlbXMgbGlrZSB0aGUgYmVzdCBvcHRpb24sIGtlZXBpbmcgdGhlIG9sZCBrZXkg
Zm9yCmJhY2t3YXJkIGNvbXBhdGliaWxpdHkuIEhvd2V2ZXIsIHBlcmhhcHMgaW5zdGVhZCBvZiB0
aGUgbmV3IGtleQpyZXR1cm5pbmcgdGhlIHNhbWUgdmFsdWUgYnV0IG5vdCByZXR1cm5pbmcgdHJ1
ZSBpbgpod3Byb2JlX2tleV9pc19iaXRtYXNrKCkgaXQgY291bGQgaW5zdGVhZCBiZSBhIGNvcnJl
Y3QgYml0bWFzayBzbyBwZW9wbGUKd291bGQgYmUgYWJsZSB0byBoYXZlIHRoZSBmZWF0dXJlIG9m
IG9yLWluZyB0b2dldGhlciB0aGUga2V5cy4KCi0gQ2hhcmxpZQoKPiAKPiAtRXZhbgo+IAo+ID4g
LS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IHwgMzEgKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0Cj4gPiBpbmRleCAyMzliZTYzZjUwODkuLjRhYmZhM2Y5ZmU0NCAxMDA2NDQKPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiBAQCAtMTg4LDI1ICsxODgsMzAgQEAgVGhl
IGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ID4gICAgICAgICBtYW51YWwgc3RhcnRpbmcg
ZnJvbSBjb21taXQgOTVjZjFmOSAoIkFkZCBjaGFuZ2VzIHJlcXVlc3RlZCBieSBWZWQKPiA+ICAg
ICAgICAgZHVyaW5nIHNpZ25vZmYiKQo+ID4KPiA+IC0qIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQo+ID4g
KyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgdmFsdWUgdGhhdCBj
b250YWlucyBwZXJmb3JtYW5jZQo+ID4gICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVk
IHNldCBvZiBwcm9jZXNzb3JzLgo+ID4KPiA+IC0gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVf
TUlTQUxJR05FRF9VTktOT1dOYDogVGhlIHBlcmZvcm1hbmNlIG9mIG1pc2FsaWduZWQKPiA+IC0g
ICAgc2NhbGFyIGFjY2Vzc2VzIGlzIHVua25vd24uCj4gPiArICAqIDpjOm1hY3JvOmBSSVNDVl9I
V1BST0JFX01JU0FMSUdORURfTUFTS2A6IFRoZSBiaXRtYXNrIG9mIHRoZSBtaXNhbGlnbmVkCj4g
PiArICAgIGFjY2VzcyBwZXJmb3JtYW5jZSBmaWVsZCBpbiB0aGUgdmFsdWUgb2Yga2V5IGBSSVND
Vl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgLgo+ID4KPiA+IC0gICogOmM6bWFjcm86YFJJU0NWX0hX
UFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRGA6IE1pc2FsaWduZWQgc2NhbGFyIGFjY2Vzc2VzIGFy
ZQo+ID4gLSAgICBlbXVsYXRlZCB2aWEgc29mdHdhcmUsIGVpdGhlciBpbiBvciBiZWxvdyB0aGUg
a2VybmVsLiAgVGhlc2UgYWNjZXNzZXMgYXJlCj4gPiAtICAgIGFsd2F5cyBleHRyZW1lbHkgc2xv
dy4KPiA+ICsgICAgVGhlIGZvbGxvd2luZyB2YWx1ZXMgKG5vdCBiaXRtYXNrcykgaW4gdGhpcyBm
aWVsZCBhcmUgZGVmaW5lZDoKPiA+Cj4gPiAtICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01J
U0FMSUdORURfU0xPV2A6IE1pc2FsaWduZWQgc2NhbGFyIGFjY2Vzc2VzIGFyZQo+ID4gLSAgICBz
bG93ZXIgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuICBNaXNhbGlnbmVkIGFjY2Vzc2Vz
IG1heSBiZSBzdXBwb3J0ZWQKPiA+IC0gICAgZGlyZWN0bHkgaW4gaGFyZHdhcmUsIG9yIHRyYXBw
ZWQgYW5kIGVtdWxhdGVkIGJ5IHNvZnR3YXJlLgo+ID4gKyAgICAqIDpjOm1hY3JvOmBSSVNDVl9I
V1BST0JFX01JU0FMSUdORURfVU5LTk9XTmA6IFRoZSBwZXJmb3JtYW5jZSBvZiBtaXNhbGlnbmVk
Cj4gPiArICAgICAgc2NhbGFyIGFjY2Vzc2VzIGlzIHVua25vd24uCj4gPgo+ID4gLSAgKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0ZBU1RgOiBNaXNhbGlnbmVkIHNjYWxhciBh
Y2Nlc3NlcyBhcmUKPiA+IC0gICAgZmFzdGVyIHRoYW4gZXF1aXZhbGVudCBieXRlIGFjY2Vzc2Vz
Lgo+ID4gKyAgICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURURg
OiBNaXNhbGlnbmVkIHNjYWxhciBhY2Nlc3NlcyBhcmUKPiA+ICsgICAgICBlbXVsYXRlZCB2aWEg
c29mdHdhcmUsIGVpdGhlciBpbiBvciBiZWxvdyB0aGUga2VybmVsLiAgVGhlc2UgYWNjZXNzZXMg
YXJlCj4gPiArICAgICAgYWx3YXlzIGV4dHJlbWVseSBzbG93Lgo+ID4KPiA+IC0gICogOmM6bWFj
cm86YFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTlNVUFBPUlRFRGA6IE1pc2FsaWduZWQgc2Nh
bGFyIGFjY2Vzc2VzCj4gPiAtICAgIGFyZSBub3Qgc3VwcG9ydGVkIGF0IGFsbCBhbmQgd2lsbCBn
ZW5lcmF0ZSBhIG1pc2FsaWduZWQgYWRkcmVzcyBmYXVsdC4KPiA+ICsgICAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NMT1dgOiBNaXNhbGlnbmVkIHNjYWxhciBhY2Nlc3Nl
cyBhcmUKPiA+ICsgICAgICBzbG93ZXIgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuICBN
aXNhbGlnbmVkIGFjY2Vzc2VzIG1heSBiZSBzdXBwb3J0ZWQKPiA+ICsgICAgICBkaXJlY3RseSBp
biBoYXJkd2FyZSwgb3IgdHJhcHBlZCBhbmQgZW11bGF0ZWQgYnkgc29mdHdhcmUuCj4gPiArCj4g
PiArICAgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9GQVNUYDogTWlzYWxp
Z25lZCBzY2FsYXIgYWNjZXNzZXMgYXJlCj4gPiArICAgICAgZmFzdGVyIHRoYW4gZXF1aXZhbGVu
dCBieXRlIGFjY2Vzc2VzLgo+ID4gKwo+ID4gKyAgICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X01JU0FMSUdORURfVU5TVVBQT1JURURgOiBNaXNhbGlnbmVkIHNjYWxhciBhY2Nlc3Nlcwo+ID4g
KyAgICAgIGFyZSBub3Qgc3VwcG9ydGVkIGF0IGFsbCBhbmQgd2lsbCBnZW5lcmF0ZSBhIG1pc2Fs
aWduZWQgYWRkcmVzcyBmYXVsdC4KPiA+Cj4gPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9L
RVlfWklDQk9aX0JMT0NLX1NJWkVgOiBBbiB1bnNpZ25lZCBpbnQgd2hpY2gKPiA+ICAgIHJlcHJl
c2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2JveiBibG9jayBpbiBieXRlcy4KPiA+IC0tCj4gPiAy
LjQzLjAKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
