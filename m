Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D623CC27C65
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icUh33hya8rO8cLc3v/yGD8t2JNcfVCiTaP7C3pmSFQ=; b=AH6WMPHKiitMsL
	9GLXgX3cgdf/hjWvOm7zToqnfiAssJFoA9Bzj+CRJE9N7TuepD5AVaSRPiJQP8OryjO9EQ2J0WjMj
	VHZ0T2Eaajl9vkKjwP6vzJPL0uiB4PEvaWUYTDlGRcn2pm/yqnPiv0tbxFJnCpl+ApltQwKYPoWX6
	nzikQ2a0bvqBUMo/t8nODsuiU3FlzZh4b+LEcBcmO+uMP6mNW0Jy/Fgm2kPY3DWwEU4K11dszblAK
	NAtq/gTyWe6FQPrHOY9jedHdbzGthcnyuXY25uL0Inp0Uz9oWSGSluGQnU7d/xWDaM8JbPol6kEBl
	MKrWha/Y6DeH8R6EXCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5fG-00000009jYo-2XB4;
	Tue, 11 Jun 2024 17:52:10 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5fB-00000009jVw-0dYO
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 17:52:07 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-6818e31e5baso4877409a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718128322; x=1718733122; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+kzQ+TESmWH2rodDnJAJg+m005wAbuCyRq3fRyc+L4=;
        b=qvtk8DN583F+eY/Z0pOlsqYLcJ2xGOH8Ic90jgBVk97L0B+KvlPQNcrzrvxFuZzLFp
         u/2J2lRQaJodkLC6lAAVcD9SiiW8/k0WPBVlaBwM5se+ErMlIVUFuvdM1ZtzgQn0/xIu
         KzI5SNpVXx9nK1V+4zEgWFne5JpCHEOBmC3WY8/u5TPdiBMQOXfDCoNBW+UXlFPS0MRE
         FgNUAv2nhlwuDqQi6DVRYEsxz0j0/C1P1+fw71Y8rJ+Haq1cqKE81Os7EVihQ4NyB8mU
         TZ1TVsjVYhky1y0eIeBOjszTcMSb8Lu89Gf+9ankhpSuXPGGhe6w55WneOyfmpd4P4j7
         X1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718128322; x=1718733122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+kzQ+TESmWH2rodDnJAJg+m005wAbuCyRq3fRyc+L4=;
        b=tnPsXNMmEbRNpTYS3SbNv0kkbe5JviqsKmYPlvGQTHo1BS5+EIL0tT/Xg/i7wkLjYg
         IaekUTWlI1WdZqY9Zz9yLOOeG+wKV75SNRgMtPB9QCSuUwgPgEg/1rFwrYvECZZ1t5qY
         YKCLuFksF5CAyppkLAyI1ubZMhWUbiMfdgTt29g75szHYM2+1avS+9Up8k/QZUQB5rBx
         9gk5h9zsM6h0KT4/u+UUhT/JO+VWoFY/6WD9RUhiIebhC9PoQeNa7D073W3Uc+i4H77C
         z83SDRVoWxxHm0+hFHhREXceP47AdiCeuhDqYtmV9P9CkKEiDy2TQeZkojlCu/7lRxA8
         7/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf+PDezxz2liDW1CCrShsO5IkxOPo3MjQ2CVlRDsTssqK3v27rF7Fq29cSSeN481dggs/a37P49z0VLoiANRXHiCX1fzOJa8Gigf6Hx3i6
X-Gm-Message-State: AOJu0Yw2nyaoD5uwVvqv0IvUU+zXD8zCV3Iaoey+YNvZg39fV+n8T5Sq
	ctCmQevw68xNkawDR1x8uMvmvXjgiRLTS1Nsq8/O+ZBcQdV6cX/OTprvq2nT0fw=
X-Google-Smtp-Source: AGHT+IG0CXcMZTGrM4/Ht2qa5w3o4qJ6+EtsZ/LkU7bUGzv5nEqEbQ4X3YEnvEJE/XsG2nOTE7o+Wg==
X-Received: by 2002:a17:902:e80a:b0:1f7:2490:cb69 with SMTP id d9443c01a7336-1f72490d4d6mr50156005ad.60.1718128321885;
        Tue, 11 Jun 2024 10:52:01 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6fadca2b0sm59819315ad.206.2024.06.11.10.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 10:52:00 -0700 (PDT)
Date: Tue, 11 Jun 2024 10:51:58 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guo Ren <guoren@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 01/13] dt-bindings: riscv: Add xtheadvector ISA extension
 description
Message-ID: <ZmiOvgabh3Rd5Vad@ghost>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-1-3fe591d7f109@rivosinc.com>
 <CAJF2gTTVu4ZQt+gK7pVYEDVG23Sic=jswkVvX4To=VAD0TMzxw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTVu4ZQt+gK7pVYEDVG23Sic=jswkVvX4To=VAD0TMzxw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_105205_960616_5F9399B6 
X-CRM114-Status: GOOD (  19.27  )
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

T24gVHVlLCBKdW4gMTEsIDIwMjQgYXQgMDg6MDY6MzRQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBNb24sIEp1biAxMCwgMjAyNCBhdCAxMjo0NeKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hh
cmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSB4dGhlYWR2ZWN0b3IgSVNBIGV4
dGVuc2lvbiBpcyBkZXNjcmliZWQgb24gdGhlIFQtSGVhZCBleHRlbnNpb24gc3BlYwo+ID4gR2l0
aHViIHBhZ2UgWzFdIGF0IGNvbW1pdCA5NTM1OGNiMmNjYTkuCj4gPgo+ID4gTGluazogaHR0cHM6
Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL3RoZWFkLWV4dGVuc2lvbi1zcGVjL2Jsb2IvOTUzNThj
YjJjY2E5NDg5MzYxYzYxZDMzNWUwM2QzMTM0YjE0MTMzZi94dGhlYWR2ZWN0b3IuYWRvYyBbMV0K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sIHwgMTAgKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBpbmRleCA0NjhjNjQ2MjQ3
YWEuLjk5ZDJhOWU4YzUyZCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+IEBAIC00NzcsNiAr
NDc3LDEwIEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgbGF0ZW5jeSwgYXMgcmF0aWZp
ZWQgaW4gY29tbWl0IDU2ZWQ3OTUgKCJVcGRhdGUKPiA+ICAgICAgICAgICAgICByaXNjdi1jcnlw
dG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4KPiA+Cj4gPiArICAgICAgICAj
IHZlbmRvciBleHRlbnNpb25zLCBlYWNoIGV4dGVuc2lvbiBzb3J0ZWQgYWxwaGFudW1lcmljYWxs
eSB1bmRlciB0aGUKPiA+ICsgICAgICAgICMgdmVuZG9yIHRoZXkgYmVsb25nIHRvLiBWZW5kb3Jz
IGFyZSBzb3J0ZWQgYWxwaGFudW1lcmljYWxseSBhcyB3ZWxsLgo+ID4gKwo+ID4gKyAgICAgICAg
IyBBbmRlcwo+ID4gICAgICAgICAgLSBjb25zdDogeGFuZGVzcG11Cj4gPiAgICAgICAgICAgIGRl
c2NyaXB0aW9uOgo+ID4gICAgICAgICAgICAgIFRoZSBBbmRlcyBUZWNobm9sb2d5IHBlcmZvcm1h
bmNlIG1vbml0b3IgZXh0ZW5zaW9uIGZvciBjb3VudGVyIG92ZXJmbG93Cj4gPiBAQCAtNDg0LDUg
KzQ4OCwxMSBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgIFJlZ2lzdGVycyBpbiB0aGUg
QVg0NU1QIGRhdGFzaGVldC4KPiA+ICAgICAgICAgICAgICBodHRwczovL3d3dy5hbmRlc3RlY2gu
Y29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9BWDQ1TVAtMUMtUmV2Li01LjAuMC1EYXRhc2hlZXQucGRm
Cj4gPgo+ID4gKyAgICAgICAgIyBULUhFQUQKPiA+ICsgICAgICAgIC0gY29uc3Q6IHh0aGVhZHZl
Y3Rvcgo+ID4gKyAgICAgICAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAgICBUaGUgVC1I
RUFEIHNwZWNpZmljIDAuNy4xIHZlY3RvciBpbXBsZW1lbnRhdGlvbiBhcyB3cml0dGVuIGluCj4g
PiArICAgICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL3RoZWFkLWV4dGVu
c2lvbi1zcGVjL2Jsb2IvOTUzNThjYjJjY2E5NDg5MzYxYzYxZDMzNWUwM2QzMTM0YjE0MTMzZi94
dGhlYWR2ZWN0b3IuYWRvYy4KPiBVUkwgY2hhbmdlZAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9YVUFO
VElFLVJWL3RoZWFkLWV4dGVuc2lvbi1zcGVjL2Jsb2IvOTUzNThjYjJjY2E5NDg5MzYxYzYxZDMz
NWUwM2QzMTM0YjE0MTMzZi94dGhlYWR2ZWN0b3IuYWRvYwoKT2ggb2theSBJIHdpbGwgY2hhbmdl
LgoKRG8geW91IGtub3cgdGhlIGFuc3dlciB0byB0aGUgaXNzdWUgSSByYWlzZWQ/IGh0dHBzOi8v
Z2l0aHViLmNvbS9YVUFOVElFLVJWL3RoZWFkLWV4dGVuc2lvbi1zcGVjL2lzc3Vlcy81MgoKLSBD
aGFybGllCgo+IAo+IE90aGVycywgTEdUTS4KPiAKPiA+ICsKPiA+ICBhZGRpdGlvbmFsUHJvcGVy
dGllczogdHJ1ZQo+ID4gIC4uLgo+ID4KPiA+IC0tCj4gPiAyLjQ0LjAKPiA+Cj4gCj4gCj4gLS0g
Cj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
