Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4190C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zChSAt8C+QmcExJHgFRU9rh4EDMc77VqwLjRdZ6U40=; b=ppkWhom2C6wYol
	XBWYDF9Zsk5KfhyfQtEWNckNbjw+67SxbRh/tZmigNEk0sB+NSSBHusWgGAPKcnIf1J7JO1ruVzRJ
	E3Z1VVgtHBeT0Wzojye/fI8H10USe0UELGoG/JLxQ8m67vr0G1ynVvyfEs5gJ1XdrgHmPI2vLLW1o
	oKUNyeTXgbv6OUtUQomgtxSA90GCjQ6oKKZD66Ix/9KWg3IOw87BsFdWk9nzapftb7S9HpPEa1Sne
	nwa8C/zCUN7b18kH4/Nsn8QbE5luY017w4qh5n7R6o4P3MFmWbyJPnyZ1m4utCQtN8Fiw2BgeKnOe
	m7zATUjWbCl1AHjK1wPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKL8-00000000axN-12aj;
	Fri, 12 Apr 2024 17:05:26 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKL4-00000000atV-0XDB
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 17:05:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-516d536f6f2so1272556e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712941519; x=1713546319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2+F6Z5+nSqcwJp5/u9iM3I5euO/lGGwbVB876NJ+N8=;
        b=yoXnh00J/X4cIDv5B0wG+6EPFJl7ZNUWWKTKQ/SVhNBZKDJV+c3b3USU9S57E4UaZT
         /HH7dYhZ6JnjbssdoYZNiQqaLzNGkb3XA6jUscOpvLtpt9CpaN8XY75gVvwWDti1d57P
         s56iB32v26xF/T9G+sryCE1tCz0nKkwhk7eKdmef4FHd+v26/cR7hR7OLkO84boVQmOZ
         rk2hm7cl+VaBV1kd8qtwE9ZzrjnqJ89MuvwGea1SvqOr+TuZvysiDuhQ2NUeAX3gYFxj
         Ge5rRr0d0tVHYeLPx5l+GNnTmbFyYhRf2B5N31lTxKOh4BlO1l9FwblkWekmYlg6+FIb
         XDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941519; x=1713546319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2+F6Z5+nSqcwJp5/u9iM3I5euO/lGGwbVB876NJ+N8=;
        b=Q3dx6nVv0JE9g22Bc34fnsF3Taj8v0ptvgj7bma1C58TkVm06GvzpRyM1puk+ut8E6
         5QSWx8nRkX3rgLDtnqwwN4aS0SIt1cDy2z6i19XcUaRvcDM2oB6b3bUIZ5oT/QbuWnpc
         rZKfqvrwDaUM+lYuQwuVVTrfQLIAupT2lQuq+irp78ngpIKZITGrdQxsFqeItp5mvs92
         1BrV9lfBHjetqxGW/lLMU47ivzXAbHBsSRGLLoGlDvWJsMos2PFNzxWidKcIJMatw09o
         k5C/p9dCz8ukzB0PQ97xE9ARE6X4Gt/fDdRLmV1oASoFmSu3N62DUDnf+Fu4PrFdsIgj
         3I5g==
X-Forwarded-Encrypted: i=1; AJvYcCX2XfQ132mPBJMXoVtWtJhOYH3QaJR+bAB1E22nM2UhROpbyQKJb57rJlrobJuHnimNEFVJJo5xl0lMCloihTLJKX965fg43GUWNitXMGk/
X-Gm-Message-State: AOJu0Yw72BK48OahRnjAXiW3oQgkcpO3hLe+ow4N22zEIPYDPGUy90ur
	xtUVIRrvGAZxnT/pciJDqff08r+CqpmHm9LdFmHYXDZQCa2y/UvQApiX2J2ARIGx4NSJ9O7J1Ck
	gCMZpS5RjC9e3XTgcbTTeCUbFqGFHSuMsCg3v0A==
X-Google-Smtp-Source: AGHT+IFTwWgekolEJQkFIbbTNtxauFKuhwni5/Gb89sRytgSj62M43pT7a0jCUkjzdpqZU6SGxa9xotVOWrotjKfpBI=
X-Received: by 2002:a2e:9b06:0:b0:2d5:122a:4b1f with SMTP id
 u6-20020a2e9b06000000b002d5122a4b1fmr2435885lji.43.1712941518949; Fri, 12 Apr
 2024 10:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-14-4af9815ec746@rivosinc.com>
 <20240412-moonshine-acting-0df1a90b86d2@wendy>
In-Reply-To: <20240412-moonshine-acting-0df1a90b86d2@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 12 Apr 2024 10:04:42 -0700
Message-ID: <CALs-HsviR8E-sRvzz7pd5eVGb4+XsAdG1hhbZOPf+m3Cu4JP_Q@mail.gmail.com>
Subject: Re: [PATCH 14/19] riscv: hwprobe: Disambiguate vector and
 xtheadvector in hwprobe
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240412_100522_548948_A5CE05FE 
X-CRM114-Status: GOOD (  21.60  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgNDozNeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgMDk6
MTE6MjBQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gRW5zdXJlIHRoYXQgaHdw
cm9iZSBkb2VzIG5vdCBmbGFnICJ2IiB3aGVuIHh0aGVhZHZlY3RvciBpcyBwcmVzZW50Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+
Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIHwgNCArKy0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiA+IGluZGV4IDhjYWU0MWE1MDJkZC4uZTBhNDJjODUx
NTExIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ID4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ID4gQEAgLTY5LDcgKzY5LDcg
QEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFp
ciwKPiA+ICAgICAgIGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBjKSkK
PiA+ICAgICAgICAgICAgICAgcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9JTUFfQzsKPiA+
Cj4gPiAtICAgICBpZiAoaGFzX3ZlY3RvcigpKQo+ID4gKyAgICAgaWYgKGhhc192ZWN0b3IoKSAm
JiAhcmlzY3ZfaGFzX3ZlbmRvcl9leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX1ZFTkRPUl9F
WFRfWFRIRUFEVkVDVE9SKSkKPgo+IEhtbSwgSSB0aGluayB0aGlzIGlzICJkYW5nZXJvdXMiLiBo
YXNfdmVjdG9yKCkgaXMgdXNlZCBhY3Jvc3MgdGhlIGtlcm5lbAo+IG5vdyBpbiBzZXZlcmFsIHBs
YWNlcyBmb3IgdGhlIGluLWtlcm5lbCB2ZWN0b3IuIEkgZG9uJ3QgdGhpbmsgdGhhdAo+IGhhc192
ZWN0b3IoKSBzaG91bGQgcmV0dXJuIHRydWUgZm9yIHRoZSBULUhlYWQgc3R1ZmYgZ2l2ZW4gdGhh
dCAmCj4gaGFzX3ZlY3RvcigpIHNob3VsZCByZXByZXNlbnQgdGhlIHJhdGlmaWVkIHNwZWMuIEkn
bGwgaGF2ZSB0byB0aGluawo+IGFib3V0IHRoaXMgb25lIGFuZCBob3cgbmFzdHkgdGhpcyBtYWtl
cyBhbnkgb2YgdGhlIHNhdmUvcmVzdG9yZSBjb2RlCj4gZXRjLgoKWWVhaCwgbXkgbm9zZSBjcmlu
a2xlZCBoZXJlIGFzIHdlbGwuIElmIHlvdSdyZSBoYXZpbmcgdG8gZG8gYQp2ZW5kb3Jpc2ggdGhp
bmcgaW4gdGhpcyBnZW5lcmljIHNwb3QsIHRoZW4gb3RoZXJzIG1heSB0b28sIHN1Z2dlc3RpbmcK
cGVyaGFwcyB0aGlzIGlzbid0IHRoZSBjbGVhbmVzdCB3YXkgdG8gZ28gYWJvdXQgaXQuIElkZWFs
bHkgZXh0ZW5zaW9ucwphcmUgYWxsIGFkZGl0aXZlLCByYXRoZXIgdGhhbiBzdWJ0cmFjdGl2ZSwg
SSBndWVzcz8KCgo+Cj4gPiAgICAgICAgICAgICAgIHBhaXItPnZhbHVlIHw9IFJJU0NWX0hXUFJP
QkVfSU1BX1Y7Cj4gPgo+ID4gICAgICAgLyoKPiA+IEBAIC0xMTIsNyArMTEyLDcgQEAgc3RhdGlj
IHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+ICAg
ICAgICAgICAgICAgRVhUX0tFWShaQUNBUyk7Cj4gPiAgICAgICAgICAgICAgIEVYVF9LRVkoWklD
T05EKTsKPiA+Cj4gPiAtICAgICAgICAgICAgIGlmIChoYXNfdmVjdG9yKCkpIHsKPiA+ICsgICAg
ICAgICAgICAgaWYgKGhhc192ZWN0b3IoKSAmJiAhcmlzY3ZfaGFzX3ZlbmRvcl9leHRlbnNpb25f
dW5saWtlbHkoUklTQ1ZfSVNBX1ZFTkRPUl9FWFRfWFRIRUFEVkVDVE9SKSkgewo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIEVYVF9LRVkoWlZCQik7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
RVhUX0tFWShaVkJDKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBFWFRfS0VZKFpWS0IpOwo+
ID4KPiA+IC0tCj4gPiAyLjQ0LjAKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
