Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A265FC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpW7VkR+zN7lwkHoQzZtojFOFDX/InoXre9cG7HecKM=; b=uuJI+xMiUShGGV
	X1g/cKr7P7I0qjdE7bnvZhDeDJ/bwMmvPszUN71XbRhoSfs+UHfc0419d/X3Xasg4ZMWtIfGlS1W4
	qKsPdRr+q16CAjcpnIt/wGYGTnXytvd5lu9w4IdldOAdMoG8Gt79FI2AleMXFui3w8pIlYovg1JRE
	/8oXAQgId6gV/o4/miGMFkURQYZjA5MJQZDZ21L7O5vaOWE7PUVzYKtU8SSCioEaVL8CGypncCMtF
	5/4NMFSM+SLUf90W6VPTTBB8aQ4TuqloaMvQqMxt6AVzLs5EfUMQw73DNNUT/rsXl36gqbKu41Vtb
	ltc3P1KxhUKoq6rVvp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvP5A-00000001UiW-1WWZ;
	Fri, 12 Apr 2024 22:09:16 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvP56-00000001UgB-0ktI
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 22:09:13 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2da0b3f7ad3so12748171fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 15:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712959748; x=1713564548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/M8t1HBqBUuifShlatgwWqMHKd8yfGcHLyOfE8iWiY=;
        b=yaQicPSL9EoXFL2/pvaNFZ6UUNS7F438gtfhZiEyZt+huWkoaOJ6qSVfmNMGIsf43g
         VHVfLqcTnbNeRapvRSmgjXPdFChRql5v/FhCwdAcgKbkhCFXUvwWcxMgHS+0s752bnQr
         qSd3RGrhME7rxkW2/WEDmV9A78xJ1OXomtSr0QrZuOUfA/ejfVXSm++3DvctFltkpff7
         LTZ8hUhNfAeeWCjkBkLsQYBbg77CWZLAiLSRkl7pJVKm3a0u/IJzPZp6V8w6EPIzTdww
         lmnX3983TXDoLhMIkbCEFQw4oomXZ/UZ172mnAUBI5+asi5w2bKUtUxfxYzZvZOKOcja
         F+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712959748; x=1713564548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/M8t1HBqBUuifShlatgwWqMHKd8yfGcHLyOfE8iWiY=;
        b=hR6NVHBP0seOKyPO6dNmNzBcWT0Gmz1YDz8No33+RfG0NQC+ouQ3cC0D904lC7bk0J
         Orug0sNOLgfLvhwcHKeWWNPguehs9VFJRHVdKB4JgIv2i3YL9e0Tv9x8P/wVGH2VMXAQ
         mlk7JhXLtQwWhSVORzWQIoYdWk8t+Sq0c1N1hH4BtkUzxwbCB/UHYAuBZ1Fdj41VSy4u
         c7/oNvqxR6inkDcCAfHnPpAKwedwKEy4wADcPwpGgFuoLXeqZeHh1QpSNkBHnQqgUy8O
         cAYFrHa+SoWkps8vqo2Xg6Q4Ppcyn19CTMORq+bksoItM66tF7mq9lhdYG5FVQ45URSA
         uv+g==
X-Forwarded-Encrypted: i=1; AJvYcCWLEDy8J0XVVB9sVCKldXbC/vs+2qkHT0U7VMuF06b2k4eAtYi8hVeR/XJ3/UgTmv+HgQ4Q5YTKbACytdmjlFiy7HTbcuaZf34HlBg3jiDr
X-Gm-Message-State: AOJu0YzgS+RoJqQBQ+wWMPeSBWpFSaTvQK9/T9oHIh+e24ocY//t5/xY
	rALc8KV0PAdgg/5YQqU6M8E0JmeXxZI1PZ0JGKdOFnBJYrur+SsSUjFXNxc7jQmkqOOoK5sTdr/
	NZtRbxFQpbOq7ST+5QICx7f8gyxZoJhS9BXNprQ==
X-Google-Smtp-Source: AGHT+IF5C2wBUyoWGN92/R3KsVleYtMZwSgDPoheRn1Rem16KloXuSobCZbrLHetSul7X4faQjk9YDXOny1oTJbkyFo=
X-Received: by 2002:a2e:9e93:0:b0:2d4:6aba:f1a3 with SMTP id
 f19-20020a2e9e93000000b002d46abaf1a3mr2395096ljk.6.1712959747751; Fri, 12 Apr
 2024 15:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-14-4af9815ec746@rivosinc.com>
 <20240412-moonshine-acting-0df1a90b86d2@wendy> <CALs-HsviR8E-sRvzz7pd5eVGb4+XsAdG1hhbZOPf+m3Cu4JP_Q@mail.gmail.com>
 <Zhl717rsQ7XLBe2F@ghost>
In-Reply-To: <Zhl717rsQ7XLBe2F@ghost>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 12 Apr 2024 15:08:31 -0700
Message-ID: <CALs-HsuL8A87mCRU2+1F2sEPYmZWTz_MFwAys0h=1uKhb7EYqg@mail.gmail.com>
Subject: Re: [PATCH 14/19] riscv: hwprobe: Disambiguate vector and
 xtheadvector in hwprobe
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_150912_252192_C45D5404 
X-CRM114-Status: GOOD (  29.50  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMTE6MjLigK9BTSBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDEyLCAyMDI0IGF0IDEwOjA0
OjQyQU0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAxMiwgMjAyNCBh
dCA0OjM14oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgQXByIDExLCAyMDI0IGF0IDA5OjExOjIwUE0gLTA3MDAs
IENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gPiBFbnN1cmUgdGhhdCBod3Byb2JlIGRvZXMg
bm90IGZsYWcgInYiIHdoZW4geHRoZWFkdmVjdG9yIGlzIHByZXNlbnQuCj4gPiA+ID4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+
ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIHwgNCAr
Ky0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiA+ID4gPiBpbmRleCA4
Y2FlNDFhNTAyZGQuLmUwYTQyYzg1MTUxMSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lz
X2h3cHJvYmUuYwo+ID4gPiA+IEBAIC02OSw3ICs2OSw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVf
aXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gPiA+ID4gICAgICAgaWYgKHJp
c2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIGMpKQo+ID4gPiA+ICAgICAgICAgICAg
ICAgcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9JTUFfQzsKPiA+ID4gPgo+ID4gPiA+IC0g
ICAgIGlmIChoYXNfdmVjdG9yKCkpCj4gPiA+ID4gKyAgICAgaWYgKGhhc192ZWN0b3IoKSAmJiAh
cmlzY3ZfaGFzX3ZlbmRvcl9leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX1ZFTkRPUl9FWFRf
WFRIRUFEVkVDVE9SKSkKPiA+ID4KPiA+ID4gSG1tLCBJIHRoaW5rIHRoaXMgaXMgImRhbmdlcm91
cyIuIGhhc192ZWN0b3IoKSBpcyB1c2VkIGFjcm9zcyB0aGUga2VybmVsCj4gPiA+IG5vdyBpbiBz
ZXZlcmFsIHBsYWNlcyBmb3IgdGhlIGluLWtlcm5lbCB2ZWN0b3IuIEkgZG9uJ3QgdGhpbmsgdGhh
dAo+ID4gPiBoYXNfdmVjdG9yKCkgc2hvdWxkIHJldHVybiB0cnVlIGZvciB0aGUgVC1IZWFkIHN0
dWZmIGdpdmVuIHRoYXQgJgo+ID4gPiBoYXNfdmVjdG9yKCkgc2hvdWxkIHJlcHJlc2VudCB0aGUg
cmF0aWZpZWQgc3BlYy4gSSdsbCBoYXZlIHRvIHRoaW5rCj4gPiA+IGFib3V0IHRoaXMgb25lIGFu
ZCBob3cgbmFzdHkgdGhpcyBtYWtlcyBhbnkgb2YgdGhlIHNhdmUvcmVzdG9yZSBjb2RlCj4gPiA+
IGV0Yy4KPiA+Cj4gPiBZZWFoLCBteSBub3NlIGNyaW5rbGVkIGhlcmUgYXMgd2VsbC4gSWYgeW91
J3JlIGhhdmluZyB0byBkbyBhCj4gPiB2ZW5kb3Jpc2ggdGhpbmcgaW4gdGhpcyBnZW5lcmljIHNw
b3QsIHRoZW4gb3RoZXJzIG1heSB0b28sIHN1Z2dlc3RpbmcKPiA+IHBlcmhhcHMgdGhpcyBpc24n
dCB0aGUgY2xlYW5lc3Qgd2F5IHRvIGdvIGFib3V0IGl0LiBJZGVhbGx5IGV4dGVuc2lvbnMKPiA+
IGFyZSBhbGwgYWRkaXRpdmUsIHJhdGhlciB0aGFuIHN1YnRyYWN0aXZlLCBJIGd1ZXNzPwo+Cj4g
VGhpcyB3YXMgdGhlICJlYXNpZXN0IiB3YXkgdG8gc3VwcG9ydCB0aGlzIGJ1dCBJIGFncmVlIHRo
aXMgaXMgbm90Cj4gaWRlYWwuIFRoZSB2ZWN0b3IgY29kZSBpcyBuYXR1cmFsbHkgY291cGxlZCB3
aXRoIGhhdmluZyBzdXBwb3J0IGZvcgo+ICJ2IiBhbmQgSSB3YW50ZWQgdG8gbGV2ZXJhZ2UgdGhh
dC4gVGhlIG90aGVyIGNvbmNlcm4gaXMgYWxsIG9mIHRoZQo+IGlmZGVmcyBmb3IgaGF2aW5nIFYg
ZW5hYmxlZC4gSSBjYW4gbWFrZSBhbGwgb2YgdGhvc2UgViBvciBYVEhFQURWRUNUT1I7Cj4gdGhh
dCB3aWxsIGluY3JlYXNlIHRoZSBzdXJmYWNlIGFyZWEgb2YgeHRoZWFkdmVjdG9yIGJ1dCBpdCBp
cyBwcm9iYWJseQo+IHRoZSByaWdodCg/KSB3YXkgdG8gZ28uCgpGb3IgdGhlIGlmZGVmcywgaWYg
eW91J3ZlIGdvdCBhIEtjb25maWcgc29tZXdoZXJlIGZvciBUSEVBRF9WRUNUT1IsCmNhbid0IHRo
YXQganVzdCBkZXBlbmQgb24gdGhlIFYgY29uZmlnPyBXZSdkIGVuZCB1cCB3aXRoIHRoZQpsaW1p
dGF0aW9uIHRoYXQgeW91IGNhbid0IGFkZCBWIDAuNyBzdXBwb3J0IHdpdGhvdXQgYWxzbyBkcmFn
Z2luZyBpbgpWMS4wIHN1cHBvcnQsIGJ1dCB0aGF0J3MgcHJvYmFibHkgZmluZSwgcmlnaHQ/Cgot
RXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
