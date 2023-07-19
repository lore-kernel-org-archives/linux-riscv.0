Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3351C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 21:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhSsxu8iVWXji3AqoM2oINmVbcLOSsRKu/7ZN95g8tU=; b=MOBXYq4GJBAAdZ
	aodActy1FDyHMDFCkbchkaZUfWRcD4cZCg83AgHJVlSzksy/BEIyZvcO+AjgK9vEweY+lOPqQ8RkY
	MHHmBOZkIKRYxSmxgb9F/SxdHfd2St900nY9JIfaw3IqBwRjkmjR1OQKWZUucek4ZW5olqeHluvT6
	K+e0rTPUyyCa3HpOEJALaWc+ILBcU7caB0E5IugW9raJ2WGVMSj/KxlW1J4Q+LpKQpXamd7tKqsR7
	rHBk5ptFaAZG2IdlacdI7IYF5lpl9663f2RVr7yskS/bQXL5pFw+xqb9C01zDLEefw1DWNgIc/6mN
	df2aiYjPZ3cj0fgjE8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMEOE-008vic-2U;
	Wed, 19 Jul 2023 21:07:18 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMEOB-008vh1-06
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 21:07:16 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3461163c0b6so925025ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 14:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689800831; x=1690405631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw73Q1YuV233rysJvP1vwk0uF1bjG87pfrX4sQ5t0bM=;
        b=rQY9Cr1SHH/ctX8CCtlKYTyYXgYTkCK5id94Tw8HxLbv3kd8qA3lfCfCqZkIPyzh19
         NYoECxUUSHCQgnxR3qyLw0WlEp7Z5hVdlj+nLF+KVe6yIKvdgO6UD6umk10qURup2rE6
         Ao8nttTKg0NethV5wHlHTMUhEkCy08I0wq8BhRyy0NTWFNHvmBX1ww5q0k9hAKK776XY
         VVr1qkU+BFnMw3Vf7STs9abodPpdX4XEqZFWgRQVoiEtXlwJWR1bjjHPyIjmHRCf9jRq
         bRt8ua3EGoh/Prc7l1u8xe3thu9eEQ3TIJddnTi6TVq4qR7okH/iEt4Ekpf/oK0tiGq9
         sYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689800831; x=1690405631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lw73Q1YuV233rysJvP1vwk0uF1bjG87pfrX4sQ5t0bM=;
        b=PAGCFGI1rFi8GbbL6fWEpTm+QTLtUyCsL1kSd7fQc0sQ+4Cg+JsJB8SRON3+SUtMUF
         8+nnX2QP+yCFHdKQHVBvfoshU2H2HurxVdQBwvf9u3ukskaqxD6sFYIyBGb6d1D1ITfd
         JpgGpg0rGw62vt9FbmRCVmeMC5hTa/oINID7eckFcr3meE16EJP0OZu7xGOnn3Ky3Ig2
         56WzJtLQ7YdzQohUGxGmW2ZcoU/cM1p8I5P5DV4fD98KL9M5aBG3CfJ07+aWrsu1jB+U
         4FdKDdhGNvqXpvavpCo7NYe5gQ63wjEUQGE4KKFOerPcPWmJtt227wvq73e4wBETBJpy
         vU6w==
X-Gm-Message-State: ABy/qLY1OsvC2AW4E3AcIOOvsJ2mW/7u5OFKqmrFz4HcAehTcmgfNOBq
	OM/dmMmOeJxvQAiWmG0KgGoKnyKWlXISoSFoe8raHQ==
X-Google-Smtp-Source: APBJJlGp2G2cIlYiY4AmGxq8lav5jER+fTKtxi4dg3vMFMU8lkC6QRf5wi2+xTGPdoYf3gDsm470s+y8hFvIsDhNy/g=
X-Received: by 2002:a92:d28a:0:b0:346:53cf:418d with SMTP id
 p10-20020a92d28a000000b0034653cf418dmr186086ilp.15.1689800831455; Wed, 19 Jul
 2023 14:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <961d125558137f7cb960de65e5f71da5d299d3bc.1689792825.git.tjeznach@rivosinc.com>
 <20230719-marbled-drivable-804aacbafee2@spud>
In-Reply-To: <20230719-marbled-drivable-804aacbafee2@spud>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 19 Jul 2023 14:07:00 -0700
Message-ID: <CAH2o1u4107Eve67gxEg1rtCLFyaABFsmfop1-ko=GT5wzeajiQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] RISC-V: arch/riscv/config: enable RISC-V IOMMU support
To: Conor Dooley <conor@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, 
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_140715_075232_A93AFB14 
X-CRM114-Status: GOOD (  18.63  )
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

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgMToyMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAxOSwgMjAyMyBhdCAxMjozMzo0NlBNIC0w
NzAwLCBUb21hc3ogSmV6bmFjaCB3cm90ZToKPgo+ICRzdWJqZWN0OiBSSVNDLVY6IGFyY2gvcmlz
Y3YvY29uZmlnOiBlbmFibGUgUklTQy1WIElPTU1VIHN1cHBvcnQKPgo+IFBsZWFzZSBsb29rIGF0
IGFueSBvdGhlciBjb21taXRzIHRvIHRoZSBmaWxlcyB5b3UgYXJlIHRvdWNoaW5nCj4gYW5kIHVz
ZSBhIHN1YmplY3QgbGluZSB0aGF0IGVtdWxhdGVzIHRoZW0uIEluIHRoaXMgY2FzZSwgdHJ5Cj4g
Z2l0IGxvZyAtLW9uZWxpbmUgLS1uby1tZXJnZXMgLS0gYXJjaC9yaXNjdi9jb25maWdzLwo+IFNh
bWUgZ29lcyBmb3IgdGhlIG9kZCBwYXR0ZXJuIGluIHlvdXIgZHJpdmVyIHBhdGNoZXMuCj4KPiBB
bHNvLCB0aGUgcGF0Y2ggbWF5IGJlIHRyaXZpYWwsIGJ1dCB5b3Ugc3RpbGwgbmVlZCB0byBzaWdu
IG9mZiBvbiBpdAo+IGFuZCBwcm92aWRlIGEgY29tbWl0IG1lc3NhZ2UuCj4KCmFjay4gYWRkZWQg
dG8tZG8gdGhlIGxpc3QgZm9yIHYyLgoKVGhhbmsgeW91LAotIFRvbWFzegoKPiBUaGFua3MsCj4g
Q29ub3IuCj4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcgfCAxICsK
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25m
aWcKPiA+IGluZGV4IDBhMDEwNzQ2MGE1Yy4uMWEwYzNiMjQzMjlmIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdz
L2RlZmNvbmZpZwo+ID4gQEAgLTE3OCw2ICsxNzgsNyBAQCBDT05GSUdfVklSVElPX1BDST15Cj4g
PiAgQ09ORklHX1ZJUlRJT19CQUxMT09OPXkKPiA+ICBDT05GSUdfVklSVElPX0lOUFVUPXkKPiA+
ICBDT05GSUdfVklSVElPX01NSU89eQo+ID4gK0NPTkZJR19SSVNDVl9JT01NVT15Cj4gPiAgQ09O
RklHX1NVTjhJX0RFMl9DQ1U9bQo+ID4gIENPTkZJR19TVU41MElfSU9NTVU9eQo+ID4gIENPTkZJ
R19SUE1TR19DSEFSPXkKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPgo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
