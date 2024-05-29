Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF6CC27C43
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSdlMs1SRAHbK/ZZ6wFd131WDayoYORvigPx/ZRWOys=; b=HLnczahfpZW5zX
	547UhCXIdhXTWu69fUY+E1p4K0huEQMgN/Rrd/anRw1e3BfekcNcnug/Lzi2fRgMW7piH6V3Rl99v
	JQstT2jU7OVm2J8vGRgjgzD+fj6EsXeJc0H/GtHq5sT0emQgAfMkFzv1oDwP/98JAYYW/5SerXQxM
	cov78lA8vua+/L+PgQS2C1yfqPx/uuGr9CU2oJGIsoasif9LeYNidmEqGh5APy64RH0SgSOMdCgtP
	VnZIp9VlLe3QNA3XzrLI7PFWaZpTxknAloZtLGpVoORljkFG8/OYEBmyujtXmRc+jIG8KzF/K4253
	SJT44QIGY6Z3qIlP0W4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIIV-000000044wU-3HKr;
	Wed, 29 May 2024 12:20:51 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIIR-000000044tQ-2WCJ
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 12:20:49 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a62db0c8c9cso219035766b.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716985245; x=1717590045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyH5HBgVMHtwGihnpxCP6snZm//fPikPnLspFypYdbE=;
        b=3eZ59MRLkMsc6TLoxQ0QGM4NeH+uOBUcmPzw73fbzA14vV27HlQX7fN9qNvbNEf+Tv
         G3+Us1XLvfSe6p8vzvsn6EbYqj0y0917eCRfiESrL2U7F22/8GvChMNYBiaTPUoTXQDV
         iC/8DYganwfnh7IFil44Pp1UsYMntWiAEkwtuOkoCb2xCLyKMHVaEpaP/kCiRyMLSzzi
         mCHRDPOanqIUmd6ErmxBmwiJKnJS7c4SAeUEsb+CgBEVRGYgts6ni3JuOb7Iy0kkkYfj
         nfp2euwIEXvbV3L9DRRJyy1LWadAh82kA8AgXdEyGEZaUp939JPQJfs8W2jzqB7SfnBf
         4BuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985245; x=1717590045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyH5HBgVMHtwGihnpxCP6snZm//fPikPnLspFypYdbE=;
        b=r/hyYtX66JQ+O1IY9YPDTRoqsmp8oDBSZ0k3TFt4ppPh/92/1+AcEPhsUzTl+Fkk4g
         EnejHyvCfSHBFc6/BGo092R15FTg8rtrYbVO3XbencUiXa9tnng4SHi6+2dqS3+VhUT2
         Cby+FKMkGOAfeHtVIBj5Jd7UYQuV3/XeWxQKvCuTuVFCOmAuMyfplZ77A5/osCARJe1a
         wucB5eg7CTowiGb9lWKTEsQoLgBGjJrqzTaNPjz8Bp2SppRzfanqHmptnliLf7Xs3k2t
         FWJiGqmgzUx2Ob5T6MK84DT2y0/m9JMTqUoEFhU7B1QBal92Itv0tg4XI+gnpYuL3kqj
         iuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlB4SMgIXACMajo9+2fy47u4QBWZ/aJel/ZJun3wJwstReycL5fNoZZJSQYx46l9W7b3IiPfJmymVkkYXrEvS3jJYNVOHbwRXEsOOjUh2r
X-Gm-Message-State: AOJu0YzsyT0GQhLuPZ2dxlmuD1W2crX87KLQem9nd+Ciz1FaSOgUIaAu
	14bcX5AQIOwkfmYNlBEtTjjLdzKrWPdgfmzD4qb1eXEQj34sbulK7UmNPP/3ZPjz2OgMKnqUZCl
	fkDrht8h4qcdgd59i/mNmiMV+jsYnAJBkStL6JQ==
X-Google-Smtp-Source: AGHT+IFC/KMs8gmNj6Vvn/KGAlKw45g7h3EXyl2Z0Axc2c+Mm6KjfYRkin/T4F2URBRtFg5oeh4RMhucp9mDS+H/nTM=
X-Received: by 2002:a17:906:66c7:b0:a59:ba2b:5915 with SMTP id
 a640c23a62f3a-a6265119463mr1826137066b.50.1716985244596; Wed, 29 May 2024
 05:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-2-alexghiti@rivosinc.com> <20240528-repaint-graffiti-ec4f0e038e5a@spud>
In-Reply-To: <20240528-repaint-graffiti-ec4f0e038e5a@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 May 2024 14:20:33 +0200
Message-ID: <CAHVXubjk-2EAJ0U08p7uATkJM1_La94SVcVNLO5yieGbfqUGYw@mail.gmail.com>
Subject: Re: [PATCH 1/7] riscv: Implement cmpxchg32/64() using Zacas
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_052047_897799_6717D712 
X-CRM114-Status: GOOD (  30.96  )
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

SGkgQ29ub3IsCgpPbiBUdWUsIE1heSAyOCwgMjAyNCBhdCA1OjM04oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDI4LCAyMDI0IGF0IDA1
OjEwOjQ2UE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IFRoaXMgYWRkcyBydW50
aW1lIHN1cHBvcnQgZm9yIFphY2FzIGluIGNtcHhjaGcgb3BlcmF0aW9ucy4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiAt
LS0KPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysr
KysrKysrCj4gPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgICAgICAgfCAxMSArKysrKysr
KysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIHwgMjMgKysrKysrKysr
KysrKysrKysrKystLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2Fy
Y2gvcmlzY3YvS2NvbmZpZwo+ID4gaW5kZXggOGEwZjQwMzQzMmU4Li5iNDQzZGVmNzAxMzkgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwo+ID4gQEAgLTU3OSw2ICs1NzksMjMgQEAgY29uZmlnIFJJU0NWX0lTQV9WX1BSRUVNUFRJ
VkUKPiA+ICAgICAgICAgcHJlZW1wdGlvbi4gRW5hYmxpbmcgdGhpcyBjb25maWcgd2lsbCByZXN1
bHQgaW4gaGlnaGVyIG1lbW9yeQo+ID4gICAgICAgICBjb25zdW1wdGlvbiBkdWUgdG8gdGhlIGFs
bG9jYXRpb24gb2YgcGVyLXRhc2sncyBrZXJuZWwgVmVjdG9yIGNvbnRleHQuCj4gPgo+ID4gK2Nv
bmZpZyBUT09MQ0hBSU5fSEFTX1pBQ0FTCj4gPiArICAgICBib29sCj4gPiArICAgICBkZWZhdWx0
IHkKPiA+ICsgICAgIGRlcGVuZHMgb24gITY0QklUIHx8ICQoY2Mtb3B0aW9uLC1tYWJpPWxwNjQg
LW1hcmNoPXJ2NjRpbWFfemFjYXMpCj4gPiArICAgICBkZXBlbmRzIG9uICEzMkJJVCB8fCAkKGNj
LW9wdGlvbiwtbWFiaT1pbHAzMiAtbWFyY2g9cnYzMmltYV96YWNhcykKPiA+ICsgICAgIGRlcGVu
ZHMgb24gQVNfSEFTX09QVElPTl9BUkNICj4gPiArCj4gPiArY29uZmlnIFJJU0NWX0lTQV9aQUNB
Uwo+ID4gKyAgICAgYm9vbCAiWmFjYXMgZXh0ZW5zaW9uIHN1cHBvcnQgZm9yIGF0b21pYyBDQVMi
Cj4gPiArICAgICBkZXBlbmRzIG9uIFRPT0xDSEFJTl9IQVNfWkFDQVMKPiA+ICsgICAgIGRlZmF1
bHQgeQo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBBZGRzIHN1cHBvcnQgdG8gdXNlIGF0b21p
YyBDQVMgaW5zdGVhZCBvZiBMUi9TQyB0byBpbXBsZW1lbnQga2VybmVsCj4gPiArICAgICAgIGF0
b21pYyBjbXB4Y2hnIG9wZXJhdGlvbi4KPgo+IElmIHlvdSB3ZXJlIGEgcGVyc29uIGNvbXBpbGlu
ZyBhIGtlcm5lbCwgd291bGQgeW91IGJlIGFibGUgdG8gcmVhZCB0aGlzCj4gYW5kIHJlYWxpc2Ug
dGhhdCB0aGlzIGlzIHNhZmUgdG8gZW5hYmxlIHdoZW4gdGhlaXIgc3lzdGVtIGRvZXMgbm90Cj4g
c3VwcG9ydCBhdG9taWMgQ0FTPyBQbGVhc2UgdGFrZSBhIGxvb2sgYXQgb3RoZXIgaG93IG90aGVy
IGV4dGVuc2lvbnMKPiBoYW5kbGUgdGhpcywgb3IgdGhlIHBhdGNoIHRoYXQgSSBoYXZlIGJlZW4g
c2VuZGluZyB0aGF0IHRyaWVzIHRvIG1ha2UKPiB0aGluZ3MgY2xlYXJlcjoKPiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvcGF0Y2gvMjAyNDA1MjgtdmFy
bmlzaC1zdGF0dXMtOWMyMjk3MzA5M2EwQHNwdWQvCgpPaywgSSB3aWxsIGdvIGZvcjogIkVuYWJs
ZSB0aGUgdXNlIG9mIHRoZSBaYWNhcyBJU0EtZXh0ZW5zaW9uIHRvCmltcGxlbWVudCBhdG9taWMg
Y21weGNoZyBvcGVyYXRpb25zIHdoZW4gaXQgaXMgZGV0ZWN0ZWQgYXQgYm9vdC4iCkFuZCBJIHdp
bGwgZG8gdGhlIHNhbWUgZm9yIFphYmhhLgoKPgo+ID4gKwo+ID4gKyAgICAgICBJZiB5b3UgZG9u
J3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBZLgo+ID4gKwo+ID4gIGNvbmZpZyBUT09MQ0hB
SU5fSEFTX1pCQgo+ID4gICAgICAgYm9vbAo+ID4gICAgICAgZGVmYXVsdCB5Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+IGluZGV4
IDViMzExNWExOTg1Mi4uZDViNjBiODc5OThjIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9N
YWtlZmlsZQo+ID4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4gQEAgLTc4LDYgKzc4LDE3
IEBAIGVuZGlmCj4gPiAgIyBDaGVjayBpZiB0aGUgdG9vbGNoYWluIHN1cHBvcnRzIFppaGludHBh
dXNlIGV4dGVuc2lvbgo+ID4gIHJpc2N2LW1hcmNoLSQoQ09ORklHX1RPT0xDSEFJTl9IQVNfWklI
SU5UUEFVU0UpIDo9ICQocmlzY3YtbWFyY2gteSlfemloaW50cGF1c2UKPiA+Cj4gPiArIyBDaGVj
ayBpZiB0aGUgdG9vbGNoYWluIHN1cHBvcnRzIFphY2FzCj4gPiAraWZkZWYgQ09ORklHX0FTX0lT
X0xMVk0KPiA+ICsjIFN1cHBvcnQgZm9yIGV4cGVyaW1lbnRhbCBaYWNhcyB3YXMgbWVyZ2VkIGlu
IExMVk0gMTcsIGJ1dCB0aGUgcmVtb3ZhbCBvZgo+ID4gKyMgdGhlICJleHBlcmltZW50YWwiIHdh
cyBtZXJnZWQgaW4gTExWTSAxOS4KPiA+ICtLQlVJTERfQ0ZMQUdTICs9IC1tZW5hYmxlLWV4cGVy
aW1lbnRhbC1leHRlbnNpb25zCj4gPiArS0JVSUxEX0FGTEFHUyArPSAtbWVuYWJsZS1leHBlcmlt
ZW50YWwtZXh0ZW5zaW9ucwo+ID4gK3Jpc2N2LW1hcmNoLXkgOj0gJChyaXNjdi1tYXJjaC15KV96
YWNhczFwMAo+ID4gK2Vsc2UKPiA+ICtyaXNjdi1tYXJjaC0kKENPTkZJR19UT09MQ0hBSU5fSEFT
X1pBQ0FTKSA6PSAkKHJpc2N2LW1hcmNoLXkpX3phY2FzCj4gPiArZW5kaWYKPgo+IEknbSBhbG1v
c3QgY2VydGFpbiB0aGF0IHdlIGRpc2N1c3NlZCB0aGlzIGJlZm9yZSBmb3IgdmVjdG9yIGFuZCBp
dCB3YXMKPiBkZWNpZGVkIHRvIG5vdCBlbmFibGUgZXhwZXJpbWVudGFsIGV4dGVuc2lvbnMgKHBh
cnRpY3VsYXJseSBhcyBpdCBpcyBhCj4gZ2xvYmFsIG9wdGlvbiksIGFuZCBpbnN0ZWFkIHJlcXVp
cmUgdGhlIG5vbi1leHBlcmltZW50YWwgdmVyc2lvbnMuCj4gVGhpcyBpc24ndCBldmVuIGNvbnNp
c3RlbnQgd2l0aCB5b3VyIFRPT0xDSEFJTl9IQVNfWkFDQVMgY2hlY2tzLCB0aGF0Cj4gd2lsbCBv
bmx5IGVuYWJsZSB0aGUgb3B0aW9uIGZvciB0aGUgcmF0aWZpZWQgdmVyc2lvbi4KClphY2FzIHdh
cyByYXRpZmllZCwgaGVuY2UgdGhlIHJlbW92YWwgb2YgImV4cGVyaW1lbnRhbCIgaW4gTExWTSAx
OS4KQnV0IHVuZm9ydHVuYXRlbHkgWmFiaGEgbGFja3Mgc3VjaCBjaGFuZ2VzIGluIExMVk0sIHNv
IHRoYXQgd2lsbCBtYWtlCnRoaXMgaW5jb25zaXN0ZW50IChyYXRpZmllZCBleHRlbnNpb24gYnV0
IHN0aWxsIGV4cGVyaW1lbnRhbCkuCgpJJ2xsIHJlbW92ZSB0aGUgZW5hYmxlbWVudCBvZiB0aGUg
ZXhwZXJpbWVudGFsIGV4dGVuc2lvbnMgdGhlbiBzbyB0aGF0CndpbGwgZmFpbCBmb3IgTExWTSA8
IDE5LiBBbmQgZm9yIFphYmhhLCBJJ2xsIHRyeSB0byBwdXNoIHRoZSByZW1vdmFsCm9mIGV4cGVy
aW1lbnRhbCBmcm9tIExMVk0uCgo+IEkgdGhpbmsgd2Ugc2hvdWxkCj4gY29udGludWUgdG8gYXZv
aWQgZW5hYmxpbmcgZXhwZXJpbWVudGFsIGV4dGVuc2lvbnMsIGV2ZW4gaWYgdGhhdCBpbXBvc2Vz
Cj4gYSByZXF1aXJlbWVudCBvZiBoYXZpbmcgYSBibGVlZGluZyBlZGdlIHRvb2xjaGFpbiB0byBh
Y3R1YWxseSB1c2UgdGhlCj4gZXh0ZW5zaW9uLgoKV291bGQgaXQgbWFrZSBzZW5zZSB0byBoYXZl
IGEKQ09ORklHX1JJU0NWX0xMVk1fRU5BQkxFX0VYUEVSSU1FTlRBTF9FWFRFTlNJT05TIG9yIHNp
bWlsYXI/IFNvIHRoYXQKcGVvcGxlIHdobyB3YW50IHRvIHBsYXkgd2l0aCB0aG9zZSBleHRlbnNp
b25zIHdpbGwgc3RpbGwgYmUgYWJsZSB0byBkbwpzbyB3aXRob3V0IHBhdGNoaW5nIHRoZSBrZXJu
ZWw/CgpUaGFua3MsCgpBbGV4Cgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
