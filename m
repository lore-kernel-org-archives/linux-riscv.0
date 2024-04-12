Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9A8C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 20:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7jhM9LT2CKteRiLMo7v+36aBH0dBU9Z3GuNyqZVwTg=; b=HwBXrfhuasudjw
	rTlkh1n9LUC9gOuVojuQnrF1TpxxobRxLdGNTaZdmvwHwZ1jSA2KnWj/jxc9Pbn63lxp8uQQmWfEH
	+pDQt8rMSrwxToiJTwH5rpfpCfCuESgELA4hRNl1aEE0EmvA7ah0uecAlRfTycVN49fiYy4R8Hd1M
	fR/tprNROOoLSywObKhOGtyyOkQtMNcKNYjj7+QL0S1SX8FvC6/puXckaJs8tPOOh6G98RyuSDYNo
	R/pw1KZV+ci3DkReo+UwJw4ynbt7GkjUBphIefKH6nmaWTGPshdg25cRKh6uN8qDaeL2dqqOjzSp9
	pkb7nl4y6nECxguSW95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNbm-00000001DXP-1LfX;
	Fri, 12 Apr 2024 20:34:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNbj-00000001DWS-15FM
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 20:34:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ecec796323so1354242b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 13:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712954086; x=1713558886; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oY4nkb56vAnwFBrxRJwfi/83hDDE+J6pWJ1yps5//Zc=;
        b=RFPT0IxUpNXXUWolkBrekeeeRd6z/1ERpVRFmSpqHDwzqTiUZFb3K4wG8TkaNLEs92
         IQotGeSf+mYCxt23kJnkQbxfmKkKZV76vrBkty4YJBeS28zMCgi3ybQ4Nhe9YX6bv409
         uRGETsWKaZvMHUWF40Ng6ySedcpeN21Q91sOjreYAWGzfZ0KiZogxBfLAxHsfz7CyE2O
         Z8ksqRa1J+0V1/t+oRPqYG1JPt86YbNC1KGvpbV76W9olqN1ms5CcG/aZLxrxX+3mYcH
         b1GePyP4Nt4cj3MkBBj2wd9VY8ETP+lWu/Ti+jKj87q3nHyc7MEjWEMv6KqSuLBFZZEV
         vD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712954086; x=1713558886;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oY4nkb56vAnwFBrxRJwfi/83hDDE+J6pWJ1yps5//Zc=;
        b=N9a2WgjXerwCrZLhLmYpvqlmhI/L8NBUaHJxYMghTrMePIwSUCUIGjW+EfZqjvx7VJ
         0fMGY/Its9j3RmCga31+ZhbzExWoL3ZYqnGAO95qIOABk3xnRxVeLBFUir8xUxg9bR5d
         aaH4rRdKFWrtB7lE4K6tVRtSxoJtS4x10v2Sg8yhWP+FsPDN5xlDOruAbWUXNQhnQFQQ
         4BEjM2Z5bnw9Px/AJ5vnPG6HxmZ8ogLFXkmmlc2ReweH3y5fHQB6l9QjBw0C0ruyN5d3
         U77UNlcLULHNabJZV/5voAphumnDgbUNTo9yg3wS5DYIfKPwsf2SnEkTE30XG41Oq6Ot
         osyg==
X-Forwarded-Encrypted: i=1; AJvYcCVL0/et69Y9/Jg0gZExIaTN7vCjetRtUMgGQpfnmWB0fgeci3h5M3tXMospaPolalt8PoaFI3XBabXU0Bd22yhgvSn26Nzjq2+bF/UBmeln
X-Gm-Message-State: AOJu0Yxl7aJaQJZ6g++8lQSq+xMOOhaBK+W1NGTJLBMP6fazA8z7oQ1B
	w36at7JOmmHp4g6HXhfphaAymDXHcLbRVGiLU591ttmAVXnNGrNCICRgURu1Dz0=
X-Google-Smtp-Source: AGHT+IGaQmX55JTPMh7eewAl1uYqQxasuC3IownyYJh3ikhM4PX0keclRrzWoXOYcfZeNLyTHp36qA==
X-Received: by 2002:a05:6a00:9aa:b0:6ed:435f:ec9b with SMTP id u42-20020a056a0009aa00b006ed435fec9bmr4550403pfg.20.1712954086437;
        Fri, 12 Apr 2024 13:34:46 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id lr48-20020a056a0073b000b006e724ccdc3esm3270068pfb.55.2024.04.12.13.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 13:34:45 -0700 (PDT)
Date: Fri, 12 Apr 2024 13:34:43 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <Zhma45a2I7DgD8Ni@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <CALs-HsuMZOMpDh8kwQx6FE2mawzt+qTD-WZ6Mvhrt+hUhkZimg@mail.gmail.com>
 <20240412-employer-crier-c201704d22e3@spud>
 <ZhmBfaKXMMtolwSr@ghost>
 <20240412-earmark-sanction-810b7222cae5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-earmark-sanction-810b7222cae5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_133447_383682_E7A78B26 
X-CRM114-Status: GOOD (  49.15  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMDg6MjY6MTJQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIEZyaSwgQXByIDEyLCAyMDI0IGF0IDExOjQ2OjIxQU0gLTA3MDAsIENoYXJsaWUg
SmVua2lucyB3cm90ZToKPiA+IE9uIEZyaSwgQXByIDEyLCAyMDI0IGF0IDA3OjM4OjA0UE0gKzAx
MDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMTA6
MDQ6MTdBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEFwciAxMiwg
MjAyNCBhdCAzOjI24oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgMDk6
MTE6MDhQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiA+ID4gPiBUaGUgcmlz
Y3ZfY3B1aW5mbyBzdHJ1Y3QgdGhhdCBjb250YWlucyBtdmVuZG9yaWQgYW5kIG1hcmNoaWQgaXMg
bm90Cj4gPiA+ID4gPiA+IHBvcHVsYXRlZCB1bnRpbCBhbGwgaGFydHMgYXJlIGJvb3RlZCB3aGlj
aCBoYXBwZW5zIGFmdGVyIHRoZSBEVCBwYXJzaW5nLgo+ID4gPiA+ID4gPiBVc2UgdGhlIHZlbmRv
cmlkL2FyY2hpZCB2YWx1ZXMgZnJvbSB0aGUgRFQgaWYgYXZhaWxhYmxlIG9yIGFzc3VtZSBhbGwK
PiA+ID4gPiA+ID4gaGFydHMgaGF2ZSB0aGUgc2FtZSB2YWx1ZXMgYXMgdGhlIGJvb3QgaGFydCBh
cyBhIGZhbGxiYWNrLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBGaXhlczogZDgyZjMyMjAyZTBk
ICgiUklTQy1WOiBJZ25vcmUgViBmcm9tIHRoZSByaXNjdixpc2EgRFQgcHJvcGVydHkgb24gb2xk
ZXIgVC1IZWFkIENQVXMiKQo+ID4gPiA+ID4KPiA+ID4gPiA+IElmIHRoaXMgaXMgb3VyIG9ubHkg
dXNlIGNhc2UgZm9yIGdldHRpbmcgdGhlIG12ZW5kb3JpZC9tYXJjaGlkIHN0dWZmCj4gPiA+ID4g
PiBmcm9tIGR0LCB0aGVuIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGFkZCBpdC4gTm9uZSBvZiB0
aGUgZGV2aWNldHJlZXMKPiA+ID4gPiA+IHRoYXQgdGhlIGNvbW1pdCB5b3UncmUgZml4aW5nIGhl
cmUgYWRkcmVzc2VzIHdpbGwgaGF2ZSB0aGVzZSBwcm9wZXJ0aWVzCj4gPiA+ID4gPiBhbmQgaWYg
dGhleSBkaWQgaGF2ZSB0aGVtLCB0aGV5J2QgdGhlbiBhbHNvIGJlIG5ldyBlbm91Z2ggdG8gaG9w
ZWZ1bGx5Cj4gPiA+ID4gPiBub3QgaGF2ZSAidiIgZWl0aGVyIC0gdGhlIGlzc3VlIGlzIHRoZXkn
cmUgdXNpbmcgd2hhdGV2ZXIgY3JhcCB0aGUKPiA+ID4gPiA+IHZlbmRvciBzaGlwcGVkLgo+ID4g
PiA+ID4gSWYgd2UncmUgZ29ubmEgZ2V0IHRoZSBpbmZvcm1hdGlvbiBmcm9tIERULCB3ZSBhbHJl
YWR5IGhhdmUgc29tZXRoaW5nCj4gPiA+ID4gPiB0aGF0IHdlIGNhbiBsb29rIGF0IHRvIHBlcmZv
cm0gdGhlIGRpc2FibGUgYXMgdGhlIGNwdSBjb21wYXRpYmxlcyBnaXZlCj4gPiA+ID4gPiB1cyBl
bm91Z2ggaW5mb3JtYXRpb24gdG8gbWFrZSB0aGUgZGVjaXNpb24uCj4gPiA+ID4gPgo+ID4gPiA+
ID4gSSBhbHNvIHRoaW5rIHRoYXQgd2UgY291bGQganVzdCBjYWNoZSB0aGUgYm9vdCBDUFUncyBt
YXJjaGlkL212ZW5kb3JpZCwKPiA+ID4gPiA+IHNpbmNlIHdlIGFscmVhZHkgaGF2ZSB0byBsb29r
IGF0IGl0IGluIHJpc2N2X2ZpbGxfY3B1X21mcl9pbmZvKCksIGF2b2lkCj4gPiA+ID4gPiByZXBl
YXRpbmcgdGhlc2UgZWNhbGxzIG9uIGFsbCBzeXN0ZW1zLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFBl
cmhhcHMgZm9yIG5vdyB3ZSBjb3VsZCBqdXN0IGxvb2sgYXQgdGhlIGJvb3QgQ1BVIGFsb25lPyBU
byBteQo+ID4gPiA+ID4ga25vd2xlZGdlIHRoZSBzeXN0ZW1zIHRoYXQgdGhpcyB0YXJnZXRzIGFs
bCBoYXZlIGhvbW9nZW5lb3VzCj4gPiA+ID4gPiBtYXJjaGlkL212ZW5kb3JpZCB2YWx1ZXMgb2Yg
MHgwLgo+ID4gPiA+IAo+ID4gPiA+IEl0J3MgcG9zc2libGUgSSdtIG1pc2ludGVycHJldGluZywg
YnV0IGlzIHRoZSBzdWdnZXN0aW9uIHRvIGFwcGx5IHRoZQo+ID4gPiA+IG1hcmNoaWQvbXZlbmRv
cmlkIHdlIGZpbmQgb24gdGhlIGJvb3QgQ1BVIGFuZCBhc3N1bWUgaXQncyB0aGUgc2FtZSBvbgo+
ID4gPiA+IGFsbCBvdGhlciBDUFVzPyBTaW5jZSB3ZSdyZSByZXBvcnRpbmcgdGhlIG1hcmNoaWQv
bXZlbmRvcmlkL21pbXBpZCB0bwo+ID4gPiA+IHVzZXJtb2RlIGluIGEgcGVyLWhhcnQgd2F5LCBp
dCB3b3VsZCBiZSBiZXR0ZXIgSU1PIGlmIHdlIHJlYWxseSBkbwo+ID4gPiA+IHF1ZXJ5IG1hcmNo
aWQvbXZlbmRvcmlkL21pbXBpZCBvbiBlYWNoIGhhcnQuIFRoZSBwcm9ibGVtIHdpdGggYXBwbHlp
bmcKPiA+ID4gPiB0aGUgYm9vdCBDUFUncyB2YWx1ZSBldmVyeXdoZXJlIGlzIGlmIHdlJ3JlIGV2
ZXIgd3JvbmcgaW4gdGhlIGZ1dHVyZQo+ID4gPiA+IChpZSB0aGF0IGFzc3VtcHRpb24gZG9lc24n
dCBob2xkIG9uIHNvbWUgbWFjaGluZSksIHdlJ2xsIG9ubHkgZmluZCBvdXQKPiA+ID4gPiBhYm91
dCBpdCBhZnRlciB0aGUgZmFjdC4gU2luY2Ugd2UgcmVwb3J0ZWQgdGhlIHdyb25nIGluZm9ybWF0
aW9uIHRvCj4gPiA+ID4gdXNlcm1vZGUgdmlhIGh3cHJvYmUsIGl0J2xsIGJlIGFuIHVnbHkgdXNl
cnNwYWNlIEFCSSBpc3N1ZSB0byBjbGVhbgo+ID4gPiA+IHVwLgo+ID4gPiAKPiA+ID4gWW91J3Jl
IG1pc2ludGVycHJldGluZywgd2UgZG8gZ2V0IHRoZSB2YWx1ZXMgb24gYWxsIGluZGl2aWR1YWxs
eSBhcwo+ID4gPiB0aGV5J3JlIGJyb3VnaHQgb25saW5lLiBUaGlzIGlzIG9ubHkgdXNlZCBieSB0
aGUgY29kZSB0aGF0IHRocm93cyBhIGJvbmUKPiA+ID4gdG8gcGVvcGxlIHdpdGggY3JhcHB5IHZl
bmRvciBkdGJzIHRoYXQgcHV0ICJ2IiBpbiByaXNjdixpc2Egd2hlbiB0aGV5Cj4gPiA+IHN1cHBv
cnQgdGhlIHVucmF0aWZpZWQgdmVyc2lvbi4KPiA+IAo+ID4gTm90IHF1aXRlLAo+IAo+IFJlbWVt
YmVyIHRoYXQgdGhpcyBwYXRjaCBzdGFuZHMgaW4gaXNvbGF0aW9uIGFuZCB0aGUganVzdGlmaWNh
dGlvbiBnaXZlbgo+IGluIHlvdXIgY29tbWl0IG1lc3NhZ2UgZG9lcyBub3QgbWVudGlvbiBhbnl0
aGluZyBvdGhlciB0aGFuIGZpeGluZyBteQo+IGJyb2tlbiBwYXRjaC4KCkZpeGluZyB0aGUgcGF0
Y2ggaW4gdGhlIHNpbXBsZXN0IHNlbnNlIHdvdWxkIGJlIHRvIGVhZ2VybHkgZ2V0IHRoZQptdmVu
ZG9yaWQvbWFyY2hpZCB3aXRob3V0IHVzaW5nIHRoZSBjYWNoZWQgdmVyc2lvbi4gQnV0IHRoaXMg
YXNzdW1lcwp0aGF0IGFsbCBoYXJ0cyBoYXZlIHRoZSBzYW1lIG12ZW5kb3JpZC9tYXJjaGlkLiBU
aGlzIGlzIG5vdCBzb21ldGhpbmcKdGhhdCBJIGFtIHN0cm9uZ2x5IGF0dGFjaGVkIHRvLiBJZiBp
dCB0cnVseSBpcyBkZXRyaW1lbnRhbCB0byBMaW51eCB0bwphbGxvdyBhIHVzZXIgYSB3YXkgdG8g
c3BlY2lmeSBkaWZmZXJlbnQgdmVuZG9yaWRzIGZvciBkaWZmZXJlbnQgaGFydHMKdGhlbiBJIHdp
bGwgcmVtb3ZlIHRoYXQgY29kZS4KCi0gQ2hhcmxpZQoKPiAKPiA+IHRoZSBhbHRlcm5hdGl2ZXMg
YXJlIHBhdGNoZWQgYmVmb3JlIHRoZSBvdGhlciBjcHVzIGFyZQo+ID4gYm9vdGVkLCBzbyB0aGUg
YWx0ZXJuYXRpdmVzIHdpbGwgaGF2ZSBmYWxzZSBwb3NpdGl2ZXMgcmVzdWx0aW5nIGluCj4gPiBi
cm9rZW4ga2VybmVscy4KPiAKPiBPdmVyLWVhZ2VybHkgZGlzYWJsaW5nIHZlY3RvciBpc24ndCBn
b2luZyB0byBicmVhayBhbnkga2VybmVscyBhbmQKPiByZWFsbHkgc2hvdWxkIG5vdCBicmVhayBh
IGJlaGF2aW5nIHVzZXJzcGFjZSBlaXRoZXIuCj4gVW5kZXItZWFnZXJseSBkaXNhYmxpbmcgaXQg
KGluIGEgd2F5IHRoYXQgdGhpcyBhcHByb2FjaCBjb3VsZCBzb2x2ZSkgaXMKPiBvbmx5IGdvaW5n
IHRvIGhhcHBlbiBvbiBhIHN5c3RlbSB3aGVyZSB0aGUgYm9vdCBoYXJ0IGhhcyBub24temVybyB2
YWx1ZXMKPiBhbmQgY2xhaW1zIHN1cHBvcnQgZm9yIHYgYnV0IGEgbm9uLWJvb3QgaGFydCBoYXMg
emVybyB2YWx1ZXMgYW5kCj4gY2xhaW1zIHN1cHBvcnQgZm9yIHYgYnV0IGFjdHVhbGx5IGRvZXNu
J3QgaW1wbGVtZW50IHRoZSByYXRpZmllZCB2ZXJzaW9uLgo+IElmIHRoZSBib290IGhhcnQgZG9l
c24ndCBzdXBwb3J0IHYsIHRoZW4gd2UgY3VycmVudGx5IGRpc2FibGUgdGhlCj4gZXh0ZW5zaW9u
IGFzIG9ubHkgaG9tb2dlbmVvdXMgc3R1ZmYgaXMgc3VwcG9ydGVkIGJ5IExpbnV4LiBJZiB0aGUg
Ym9vdAo+IGhhcnQgY2xhaW1zIHN1cHBvcnQgZm9yICJ2IiBidXQgZG9lc24ndCBhY3R1YWxseSBp
bXBsZW1lbnQgdGhlIHJhdGlmaWVkCj4gdmVyc2lvbiBuZWl0aGVyIHRoZSBpbnRlbnQgb2YgbXkg
b3JpZ2luYWwgcGF0Y2ggbm9yIHRoaXMgZml4IGZvciBpdCBhcmUKPiBnb2luZyB0byBoZWxwIGF2
b2lkIGEgYnJva2VuIGtlcm5lbC4KPiAKPiBJIHRoaW5rIHdlIGRvIGhhdmUgYSBwcm9ibGVtIGlm
IHRoZSBib290IGNwdSBoYXZpbmcgc29tZSBlcnJhdHVtIGxlYWRzCj4gdG8gdGhlIGtlcm5lbCBi
ZWluZyBwYXRjaGVkIGluIGEgd2F5IHRoYXQgZG9lcyBub3Qgd29yayBmb3IgdGhlIG90aGVyCj4g
Q1BVcyBvbiB0aGUgc3lzdGVtLCBidXQgSSBkb24ndCB0aGluayB0aGlzIHNlcmllcyBhZGRyZXNz
ZXMgdGhhdCBzb3J0IG9mCj4gaXNzdWUgYXQgYWxsIGFzIHlvdSdkIGJlIGFkZGluZyBjb2RlIHRv
IHRoZSBwaSBzZWN0aW9uIGlmIHlvdSB3ZXJlIGZpeGluZwo+IGl0LiBJIGFsc28gZG9uJ3QgdGhp
bmsgd2Ugc2hvdWxkIGJlIG1ha2luZyBwcmUtZW1wdGl2ZSBjaGFuZ2VzIHRvIHRoZQo+IGVycmF0
YSBwYXRjaGluZyBjb2RlIGVpdGhlciB0byBzb2x2ZSB0aGF0IHNvcnQgb2YgcHJvYmxlbSwgdW50
aWwgYW4gU29DCj4gc2hvd3MgdXAgd2hlcmUgdGhpbmdzIGRvbid0IHdvcmsuCj4gQ2hlZXJzLAo+
IENvbm9yLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
