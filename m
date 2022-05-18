Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4181DC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEbx4qQfCwYzBtNGji0VJ6qhU1FmQhTQ0SQpmnVzDY4=; b=rx8JhrCOsfMGEP
	Xj9517oo5KFdBORtI9j4Yfv/3yHAl2ZWpKqiKxpPVsySoh5rXpfFzDEJh2hPv0xzrMrh/K6A/vKmI
	l1wpsAGZtGWKppQfBmoxNTseDmeEkzB/MLdRHF6sNQaDbk8YRLuQxuwACM2jwC/+8zcAbp68kGCyN
	xlBX6abV6BaROGtzzoMIq9zwHxZETYaPQvLlJDdDQoXAO6aH2D9W/ibWVSwtHw3hWv8TlnNeqGUVO
	0BxcR7N5HLBUvcQnQqhwhj/xM8rXMyHHg9R/bGVkUT43xv2kbP5kHpA+0p4e1pCz//1ofPApCfh3E
	1M1Box6j9hSDh44kvTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrFhX-000kIY-O4; Wed, 18 May 2022 09:10:39 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrFhT-000kH4-TV
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 09:10:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r30so1715426wra.13
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a3p9RWrnEXxuXT6dFm/7R9XKBCQLFHr/hqKCZKCwClw=;
 b=fQrjJ1mkMaN1bDs4bljWNln+PTHlRBIcCuDsEtqZI3kxqy/TCbvnab19SOWxPwBcNx
 Gd7rnjVnpgj4gHHAO8p/VcsKSEl+buT4rUmPNPUDybXMuE1qQoIKtLZmRMEkDDT9xQzZ
 xNr7HixN/r3XvE8advX4UMeflrvwCBfVFePGyQ5gqD9GcM39OwrJalg+HrVG2m9WNBIx
 mkDnzf3oO51nkKsaNTKVkEgSFI+8wrf63eAsf4DVyHBpXDJVTFnzbZ/f5KyZHiOR4r9/
 Xf5ULHRiVN5DlIVYtHH1ratKRFbWL0ganQ6OYpAJKlj0T7TbGf1GhDneNkhohVMVSgJT
 vCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a3p9RWrnEXxuXT6dFm/7R9XKBCQLFHr/hqKCZKCwClw=;
 b=WXZyaM5D2HvT7DGWWre53JKRcSmEy6TScT/jC8fYAWJZCSDX2jvS1VZknQintb1+83
 N1MMAYqV9tCtBrxW6bvWCoOWJxuyNfrHCearYxahO3OvGKjZk66xOSksks8tNJKMION+
 qCQrGj3XRLn5dYySYUWF4jaAtLHH8nppcA0VIQevIbaY22v8zNDz6YAoPS+Gp6YzFED1
 563vqzfUb3qeY/Sa5G17RmPpI/EDUTzHYpyNkuGLU07AOmBjoloY/FqQFqRip3W1m6Un
 3kwHvsZfehaV/SnRUF4dsxQ6prr93mvbIuTg9ZkTiAIvfNwpKrYYIqrniuE1vXCkcAnx
 hLow==
X-Gm-Message-State: AOAM531nZMq2iFzpcCBxk3freC8XOX1t8f/+W5uq+3SeEwoMd0s49ott
 r8Uejv9qYo8I5zOl8qMU9WB4411PjyskiQFYKH4hUw==
X-Google-Smtp-Source: ABdhPJxEBbxF3pXDvjlrj+8J/Mp0IPHVhx92EKQ7mad6xuIFVFaIXgAUqG7xHGRDd0SLlUagfaA23fzfMIzbtsnt99g=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr22568351wrz.690.1652865031225; Wed, 18
 May 2022 02:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220518002529.GA1928329-robh@kernel.org>
 <CAAeLtUBLpDHeJHfPtaUb_OLZb_6cUQa1Z_F+06pkdJMSHtWrfQ@mail.gmail.com>
 <1893094.PYKUYFuaPT@diego>
In-Reply-To: <1893094.PYKUYFuaPT@diego>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 18 May 2022 14:40:17 +0530
Message-ID: <CAAhSdy1sG8uzg0W2Ufi=EYFB58+JZobUa9D+rcHeb4upJoMzng@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: document cbom-block-size
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Guo Ren <guoren@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>, krzk+dt@kernel.org,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_021036_180150_713D1398 
X-CRM114-Status: GOOD (  32.35  )
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

T24gV2VkLCBNYXkgMTgsIDIwMjIgYXQgMjozMyBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIE1pdHR3b2NoLCAxOC4gTWFpIDIwMjIsIDEwOjIyOjE3IENF
U1Qgc2NocmllYiBQaGlsaXBwIFRvbXNpY2g6Cj4gPiArRGF2aWQgS3J1Y2tlbXllciAod2hvIGlz
IGNoYWlyaW5nIHRoZSBDTU8gdGFzay1ncm91cCB3aXRoaW4gUlZJKS4KPiA+Cj4gPiBPbiBXZWQs
IDE4IE1heSAyMDIyIGF0IDAyOjI1LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBNYXkgMTEsIDIwMjIgYXQgMTE6NDE6MzBQTSArMDIwMCwg
SGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4gPiA+ID4gVGhlIFppY2JvbSBvcGVyYXRlcyBvbiBhIGJs
b2NrLXNpemUgZGVmaW5lZCBmb3IgdGhlIGNwdS1jb3JlLAo+ID4gPiA+IHdoaWNoIGRvZXMgbm90
IG5lY2Vzc2FyaWx5IG1hdGNoIG90aGVyIGNhY2hlLXNpemVzIHVzZWQuCj4gPiA+ID4KPiA+ID4g
PiBTbyBhZGQgdGhlIG5lY2Vzc2FyeSBwcm9wZXJ0eSBmb3IgdGhlIHN5c3RlbSB0byBrbm93IHRo
ZSBjb3JlJ3MKPiA+ID4gPiBibG9jay1zaXplLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCB8IDcgKysr
KysrKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2NwdXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVz
LnlhbWwKPiA+ID4gPiBpbmRleCBkNjMyYWM3NjUzMmUuLmIxNzliZmQxNTVhMyAxMDA2NDQKPiA+
ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55
YW1sCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2NwdXMueWFtbAo+ID4gPiA+IEBAIC02Myw2ICs2MywxMyBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+
ICAgICAgICAtIHJpc2N2LHN2NDgKPiA+ID4gPiAgICAgICAgLSByaXNjdixub25lCj4gPiA+ID4K
PiA+ID4gPiArICByaXNjdixjYm9tLWJsb2NrLXNpemU6Cj4gPiA+ID4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+ID4KPiA+ID4gQW55IHZhbHVl
IDAtMl4zMiBpcyB2YWxpZD8KPiA+ID4KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gPiA+
ICsgICAgICBCbG9ja3NpemUgaW4gYnl0ZXMgZm9yIHRoZSBaaWNib20gY2FjaGUgb3BlcmF0aW9u
cy4gVGhlIGJsb2NrCj4gPiA+ID4gKyAgICAgIHNpemUgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgY29y
ZSBpdHNlbGYgYW5kIGRvZXMgbm90IG5lY2Vzc2FyaWx5Cj4gPiA+ID4gKyAgICAgIG1hdGNoIG90
aGVyIHNvZnR3YXJlIGRlZmluZWQgY2FjaGUgc2l6ZXMuCj4gPiA+Cj4gPiA+IFdoYXQgYWJvdXQg
aGFyZHdhcmUgZGVmaW5lZCBjYWNoZSBzaXplcz8gSSdtIHNjcmF0Y2hpbmcgbXkgaGVhZCBhcyB0
bwo+ID4gPiB3aGF0IGEgJ3NvZnR3YXJlIGRlZmluZWQgY2FjaGUgc2l6ZScgaXMuCj4KPiBJIGFn
cmVlIHRoYXQgdGhpcyBzaG91bGQgYmUgd29yZGVkIGJldHRlci4gVGhlIGludGVudCB3YXMgdG8g
dGVsbCB0aGF0IHRoaXMKPiBpcyBkaWZmZXJlbnQgZnJvbSBzYXkgdGhlIGwxLWNhY2hlLWJsb2Nr
LXNpemUuCj4KPiBJLmUuIHRoZXNlIHZhbHVlcyBjYW4gYmUgdGhlIHNhbWUgYnV0IGRvbid0IG5l
ZWQgdG8gYmUuIEJ1dCBJIGd1ZXNzIEkgZ290Cj4gdG9vIG11Y2ggbGVhZCBvbiBieSBhIGtlcm5l
bCBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgKEwxX0NBQ0hFX0JZVEVTIGNvbnN0YW50KQoKQmV0dGVy
IHRvIGp1c3QgY2FsbCBpdCBhcyAidGhlIGNhY2hlIGJsb2NrLXNpemUgZXhwZWN0ZWQgYnkgWmlj
Ym9tIGNhY2hlCm9wZXJhdGlvbnMiIHdpdGhvdXQgZ2V0dGluZyBkZXRhaWxzIG9mIHJlbGF0aW9u
IHdpdGggTDEgY2FjaGUgYmxvY2sgc2l6ZS4KClJlZ2FyZHMsCkFudXAKCj4KPgo+ID4gVGhpcyBz
ZWVtcyB0byBiZSBhIG1pc25vbWVyLCBhcyB0aGUgc3BlY2lmaWNhdGlvbiBkb2Vzbid0IHVzZSB0
aGUgdGVybQo+ID4gYW5kIHJhdGhlciB0YWxrcyBhYm91dCB0aGUgInNpemUgb2YgYSBjYWNoZSBi
bG9jayBmb3IgW29wZXJhdGlvbgo+ID4gbmFtZV0iLgo+ID4KPiA+IFRoZXJlIGFyZSBjdXJyZW50
bHkgdHdvIHN1Y2ggJ29wZXJhdGlvbiBzaXplcycgZGlzY292ZXJhYmxlIGJ5IHNvZnR3YXJlOgo+
ID4gLSBzaXplIG9mIHRoZSBjYWNoZSBibG9jayBmb3IgbWFuYWdlbWVudCBhbmQgcHJlZmV0Y2gg
aW5zdHJ1Y3Rpb25zCj4gPiAtIHNpemUgb2YgdGhlIGNhY2hlIGJsb2NrIGZvciB6ZXJvIGluc3Ry
dWN0aW9ucwo+ID4KPiA+IEZvciB3aGF0ZXZlciBpdCdzIHdvcnRoLCBjYWNoZSBvcGVyYXRpb25z
IGluIFJJU0MtViBhdHRlbXB0IHRvCj4gPiBkaXNhc3NvY2lhdGUgdGhlIHVuZGVybHlpbmcgaGFy
ZHdhcmUgY2FjaGUgZ2VvbWV0cnkgZnJvbSBzb2Z0d2FyZS4KPiA+IFNlZSBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3YvcmlzY3YtQ01Pcy9ibG9iL21hc3Rlci9zcGVjaWZpY2F0aW9ucy9jbW9iYXNl
LXYxLjAuMS5wZGYKPiA+IGZvciB0aGUgQ01PIHNwZWNpZmljYXRpb24sIGFuZCB0aGUgZGlzY292
ZXJhYmxlIHBhcmFtZXRlcnMgYXJlIGxpc3RlZAo+ID4gaW4gc2VjdGlvbiAyLjcuCj4gPgo+ID4g
UGhpbGlwcC4KPiA+Cj4gPiA+ID4gKwo+ID4gPiA+ICAgIHJpc2N2LGlzYToKPiA+ID4gPiAgICAg
IGRlc2NyaXB0aW9uOgo+ID4gPiA+ICAgICAgICBJZGVudGlmaWVzIHRoZSBzcGVjaWZpYyBSSVND
LVYgaW5zdHJ1Y3Rpb24gc2V0IGFyY2hpdGVjdHVyZQo+ID4gPiA+IC0tCj4gPiA+ID4gMi4zNS4x
Cj4gPiA+ID4KPiA+ID4gPgo+ID4KPgo+Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
