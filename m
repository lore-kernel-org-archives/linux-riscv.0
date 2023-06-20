Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1C1EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 07:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sF71Khh+E5zah9PVgq2bE7VEYNAQNa6mPu0vLUzmAY=; b=3CQ2nuCAokJSfM
	TyjlkyAp0MI9dpTcBSTK4j5wjbKt/4ozX3qfq/HT9KJE0DHWHzbVUL66dbK3lo+K6M8NwIwPgskdH
	JRCCst7IAW5V8tuYVSBMA7UtkpbtXdyRkhVsq0J6V2E2xCkmDoMpw3xTj2DpfaZWd0xjU23fOyM5z
	nAVlbCFJ1rxCDxeWWlpp0gibDgO+vd636RFqSXPHz9eDd3sZWM0aJ9ORL6XJ8Dh+9RkHtmT5dOmsD
	Keit2/4rA+z9DUsXng/q2JMEQeEVET40PBTK5m1ZLxHjFmFb3Wi6ACuEc0XUNd2iv1NIhfpIxXGtI
	Uec1Ao5i/AvgUQ0Mmc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVdf-00AMkh-19;
	Tue, 20 Jun 2023 07:18:55 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVdc-00AMk6-1E
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 07:18:53 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a03ff70c1aso11552b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687245530; x=1689837530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUUYJwzB+/81t+QqwYXl7JaMezVbu3J4sAop8uSN7n0=;
        b=T0y9hsPa+jPUTVxUkXz+0ICo2jn5rn+hiUsX/dFa5RadKbF1gzcyfUYWAY4aGTpxwD
         ZBtdUA8plTc2UqbRyfn8cKPYRkFXH3QpVhToC9CYrn8Qujep8sW6frbR4txxejhcuBP1
         HPUQpOLVuzbh4UW4ud9udMhBegliJITKwJGJwiHa5G+A0RH2yKt/hvNQG0BNiOgy49AH
         XpQhCpkJdAC1agryyj1t17HiquhIDa0cYk+ew7WGs5YSSHGsl+FEkzclYtVt2fdHFtBd
         SAf749Qj11D/dGIpJyZ7vJ8xFUg91jczUVZhYdzCneeXdXp4/OnT42igbld0EVHPEw3G
         60xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687245530; x=1689837530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUUYJwzB+/81t+QqwYXl7JaMezVbu3J4sAop8uSN7n0=;
        b=PG+ePfL2Q+xjBuTN4crJQ76feNQ269/mPVwxNhwD4M3LtNPVW09Pq+ugugqQCzdR1j
         hywj1ZbRjj4NcTYVnyozxZqHDXntUAz43czos/EYTasNUEm4o+Eit/A4NMbZSJKTXPX4
         A1X37cYwNJTtKihCE8dqI9h08IlIL5UWclyG9q0Iq/YhyLvsTGmt8IefXBNRo16LV8Cl
         i7WcnpG8pwtr2SlJWUEd6emrkjYPBuONgtnBS0cvsbC9AFGuGgu5svJ4VFK/iB8q3Ju/
         XqQSngtiEkrL6NMiSzdag+MhpxCKoL5jEjT5aDFgYTf0miopA9RLPMYnzQj38a458Vzr
         pxlQ==
X-Gm-Message-State: AC+VfDwQWunmMAftLNP0C8hTM8BwQ49rKItOn8bBquNIdVm2cVbmVLH3
	6ANHUWCruO5/jYiqUMtONeTLZA==
X-Google-Smtp-Source: ACHHUZ76mpc84tL5SCQDDRTPwRHiQaar30lEGbUyp8ywnhEF/JtZ8To/ByVviDLmfe4jc2+uod5cFA==
X-Received: by 2002:a05:6808:200e:b0:39a:ab69:778e with SMTP id q14-20020a056808200e00b0039aab69778emr11361190oiw.23.1687245530444;
        Tue, 20 Jun 2023 00:18:50 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090a2a8a00b0025e2358f146sm7168228pjd.13.2023.06.20.00.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:18:50 -0700 (PDT)
Date: Tue, 20 Jun 2023 12:48:44 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
Message-ID: <ZJFS1K/LltE57MJ4@sunil-laptop>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <CAHVXubjOUeEtnFnERjT2YOG+h5=2YX7kxeEBFSStO3WZvcv36A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubjOUeEtnFnERjT2YOG+h5=2YX7kxeEBFSStO3WZvcv36A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_001852_444419_ABC2098F 
X-CRM114-Status: GOOD (  32.21  )
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

SGV5IEFsZXgsCgpNYW55IHRoYW5rcyBmb3Igd3JpdGluZyB0aGlzIHVwIQoKT24gTW9uLCBKdW4g
MTksIDIwMjMgYXQgMTE6NDk6MTNBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEBT
dW5pbCBWIEwgU29tZXRoaW5nIGFib3V0IEFDUEkgaXMgbW9yZSB0aGFuIHdlbGNvbWUgOikKPiAK
PiBBbmQgdGhhbmtzIHRvIEBCasO2cm4gVMO2cGVsIGFuZCBAQXRpc2ggS3VtYXIgUGF0cmEgZm9y
IGhlbHBpbmcgaW4KPiB3cml0aW5nIHRoaXMgZG9jdW1lbnQhCj4gCj4gT24gTW9uLCBKdW4gMTks
IDIwMjMgYXQgMTE6NDfigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5j
b20+IHdyb3RlOgo+ID4KPiA+IFRoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHRoZSBjb25zdHJhaW50
cyBhbmQgcmVxdWlyZW1lbnRzIG9mIHRoZSBlYXJseQo+ID4gYm9vdCBwcm9jZXNzIGluIGEgUklT
Qy1WIGtlcm5lbC4KPiA+Cj4gPiBTemlnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4
Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290
LWltYWdlLWhlYWRlci5yc3QgfCAgIDMgLQo+ID4gIERvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5y
c3QgICAgICAgICAgICAgIHwgMTgxICsrKysrKysrKysrKysrKysrKysrKysKPiA+ICBEb2N1bWVu
dGF0aW9uL3Jpc2N2L2luZGV4LnJzdCAgICAgICAgICAgICB8ICAgMSArCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxODIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdAo+ID4KPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdCBiL0RvY3VtZW50YXRp
b24vcmlzY3YvYm9vdC1pbWFnZS1oZWFkZXIucnN0Cj4gPiBpbmRleCBkNzc1MjUzMzg2NWYuLmE0
YTQ1MzEwYzRjNCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC1pbWFn
ZS1oZWFkZXIucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVh
ZGVyLnJzdAo+ID4gQEAgLTcsOSArNyw2IEBAIEJvb3QgaW1hZ2UgaGVhZGVyIGluIFJJU0MtViBM
aW51eAo+ID4KPiA+ICBUaGlzIGRvY3VtZW50IG9ubHkgZGVzY3JpYmVzIHRoZSBib290IGltYWdl
IGhlYWRlciBkZXRhaWxzIGZvciBSSVNDLVYgTGludXguCj4gPgo+ID4gLVRPRE86Cj4gPiAtICBX
cml0ZSBhIGNvbXBsZXRlIGJvb3RpbmcgZ3VpZGUuCj4gPiAtCj4gPiAgVGhlIGZvbGxvd2luZyA2
NC1ieXRlIGhlYWRlciBpcyBwcmVzZW50IGluIGRlY29tcHJlc3NlZCBMaW51eCBrZXJuZWwgaW1h
Z2U6Ogo+ID4KPiA+ICAgICAgICAgdTMyIGNvZGUwOyAgICAgICAgICAgICAgICAvKiBFeGVjdXRh
YmxlIGNvZGUgKi8KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QucnN0
IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjAyMjMwODE4Yjc5Cj4gPiAtLS0gL2Rldi9udWxsCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QucnN0Cj4gPiBAQCAtMCwwICsxLDE4MSBA
QAo+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiArCj4gPiArPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiArRWFybHkgYm9v
dCByZXF1aXJlbWVudHMvY29uc3RyYWludHMgb24gUklTQy1WCj4gPiArPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiArCj4gPiArOkF1dGhvcjogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gKzpEYXRlOiAyMyBNYXkgMjAy
Mwo+ID4gKwo+ID4gK1RoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHdoYXQgdGhlIFJJU0MtViBrZXJu
ZWwgZXhwZWN0cyBmcm9tIHRoZSBwcmV2aW91cyBzdGFnZXMKPiA+ICthbmQgdGhlIGZpcm13YXJl
LCBidXQgYWxzbyB0aGUgY29uc3RyYWludHMgdGhhdCBhbnkgZGV2ZWxvcGVyIG11c3QgaGF2ZSBp
biBtaW5kCj4gPiArd2hlbiB0b3VjaGluZyB0aGUgZWFybHkgYm9vdCBwcm9jZXNzLCBlLmcuIGJl
Zm9yZSB0aGUgZmluYWwgdmlydHVhbCBtYXBwaW5nIGlzCj4gPiArc2V0dXAuCj4gPiArCj4gPiAr
UHJlLWtlcm5lbCBib290IChFeHBlY3RhdGlvbnMgZnJvbSBmaXJtd2FyZSkKPiA+ICs9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gKwo+ID4gK1JlZ2lzdGVy
cyBzdGF0ZQo+ID4gKy0tLS0tLS0tLS0tLS0tLQo+ID4gKwo+ID4gK1RoZSBSSVNDLVYga2VybmVs
IGV4cGVjdHM6Cj4gPiArCj4gPiArICAqIGAkYTBgIHRvIGNvbnRhaW4gdGhlIGhhcnRpZCBvZiB0
aGUgY3VycmVudCBjb3JlLgo+ID4gKyAgKiBgJGExYCB0byBjb250YWluIHRoZSBhZGRyZXNzIG9m
IHRoZSBkZXZpY2UgdHJlZSBpbiBtZW1vcnkuCj4gPiArCj4gPiArQ1NSIHN0YXRlCj4gPiArLS0t
LS0tLS0tCj4gPiArCj4gPiArVGhlIFJJU0MtViBrZXJuZWwgZXhwZWN0czoKPiA+ICsKPiA+ICsg
ICogYCRzYXRwID0gMGA6IHRoZSBNTVUgbXVzdCBiZSBkaXNhYmxlZC4KPiA+ICsKPiA+ICtSZXNl
cnZlZCBtZW1vcnkgZm9yIHJlc2lkZW50IGZpcm13YXJlCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gKwo+ID4gK1RoZSBSSVNDLVYga2VybmVsIGV4cGVjdHMg
dGhlIGZpcm13YXJlIHRvIG1hcmsgYW55IHJlc2lkZW50IG1lbW9yeSB3aXRoIHRoZQo+ID4gK2Bu
by1tYXBgIGZsYWcsIHRodXMgdGhlIGtlcm5lbCB3b24ndCBtYXAgdGhvc2UgcmVnaW9ucyBpbiB0
aGUgZGlyZWN0IG1hcHBpbmcKPiA+ICsoYXZvaWRpbmcgaXNzdWVzIHdpdGggaGliZXJuYXRpb24s
IHNwZWN1bGF0aXZlIGFjY2Vzc2VzIGFuZCBwcm9iYWJseSBvdGhlcgo+ID4gK3N1YnN5c3RlbXMp
Lgo+ID4gKwo+ID4gK0tlcm5lbCBsb2NhdGlvbgo+ID4gKy0tLS0tLS0tLS0tLS0tLQo+ID4gKwo+
ID4gK1RoZSBSSVNDLVYga2VybmVsIGV4cGVjdHMgdG8gYmUgcGxhY2VkIGF0IGEgUE1EIGJvdW5k
YXJ5ICgyTUIgZm9yIHJ2NjQgYW5kIDRNQgo+ID4gK2ZvciBydjMyKS4gTm90ZSB0aG91Z2ggdGhh
dCB0aGUgRUZJIHN0dWIgd2lsbCBwaHlzaWNhbGx5IHJlbG9jYXRlIHRoZSBrZXJuZWwgaWYKPiA+
ICt0aGF0J3Mgbm90IHRoZSBjYXNlLgo+ID4gKwo+ID4gK0RldmljZS10cmVlCj4gPiArLS0tLS0t
LS0tLS0KPiA+ICsKPiA+ICtUaGUgUklTQy1WIGtlcm5lbCBhbHdheXMgZXhwZWN0cyBhIGRldmlj
ZSB0cmVlLCBpdCBpczoKPiA+ICsKSW4gZ2VuZXJhbCwgdGhlIGZpcm13YXJlIGNhbiBwYXNzIGVp
dGhlciBEVCBvciBBQ1BJIChub3QgYm90aCBhdCB0aGUKc2FtZSB0aW1lKSB0byB0aGUgT1MuIFNv
LCBJIHRoaW5rIHRoZSBzdGF0ZW1lbnQgdGhhdCBrZXJuZWwgYWx3YXlzCmV4cGVjdHMgRFQgcHJv
YmFibHkgY2F1c2VzIGNvbmZ1c2lvbi4gQ2FuIHdlIG1lbnRpb24gc29tZSB0aGluZyBsaWtlCmJl
bG93PwoKVGhlIGZpcm13YXJlIGNhbiBwYXNzIGVpdGhlciBEZXZpY2VUcmVlIG9yIEFDUEkgdGFi
bGVzIHRvIHRoZSBSSVNDLVYKa2VybmVsLgoKVGhlIERldmljZVRyZWUgaXMgZWl0aGVyIHBhc3Nl
ZCBkaXJlY3RseSB0byB0aGUga2VybmVsIGZyb20gdGhlCnByZXZpb3VzIHN0YWdlIHVzaW5nIHRo
ZSBgJGExYCByZWdpc3Rlciwgb3Igd2hlbiBib290aW5nIHdpdGggVUVGSSwgaXQKY2FuIGJlIHBh
c3NlZCB1c2luZyB0aGUgRUZJIGNvbmZpZ3VyYXRpb24gdGFibGUuCgpUaGUgQUNQSSB0YWJsZXMg
YXJlIHBhc3NlZCB0byB0aGUga2VybmVsIHVzaW5nIHRoZSBFRkkgY29uZmlndXJhdGlvbgp0YWJs
ZS4gSW4gdGhpcyBjYXNlLCBhIHRpbnkgRGV2aWNlVHJlZSBpcyBzdGlsbCBjcmVhdGVkIGJ5IHRo
ZSBFRkkKc3R1Yi4gUGxlYXNlIHJlZmVyIHRvICJFRkkgc3R1YiBhbmQgZGV2aWNlIiB0cmVlIHNl
Y3Rpb24gYmVsb3cgZm9yCmRldGFpbHMgb2YgdGhlIHRpbnkgRGV2aWNlVHJlZS4KClRoYW5rcywK
U3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
