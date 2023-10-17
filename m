Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FDACDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 08:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQBH8Q6xEMFEWqjJIACHt/KyTYkobuA6m4VRJy4VUwc=; b=F2T4B6HLVX4wCC
	WHzLNLhx1FyKuOj1xTqy10W6Cmh8qRvjnu47thuezvXA1MG3/jNgJL+TuYk6j1kvanXv8u/XBgWym
	Y0jQfNz/JG79YFREzpf+rSB16jMRNRnloBnOiRhMez67M2DuRBt/8M+wP1QzwZoZX3JA9gpZSdGOH
	kofLn2iEGnkHPPjVikQo9zcl6fZpbepHqCp/CeryA/l46zOqA2PkrxEaKimV0VtnegAoEET4hYoem
	zFsgjNCEpGGXguSAHRR8TqEHn7SeqqzarnxL8lD8TG9v+r5H3b65wZN6DXRKeARopLOPBFqDQXCsf
	7mE0cF8DynRM4jb720Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsffu-00Biiy-0C;
	Tue, 17 Oct 2023 08:43:38 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsffr-00BihR-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 08:43:36 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a7af20c488so66915517b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532212; x=1698137012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iF8pGgwx9ER+JexQPULvEbdhCYC/MDFSezGeWG3jTqw=;
        b=Usd/eOxWhUdkn6ET+XjZKhcGHNOfIX7/jFRpDnDOQ8iSNvnPlz8EmpCebgPE5kvES5
         GTe8JsH++1fYHHThihaCLIxN8v5GjcfZbzfMZiwfIshht67UhijCUyvFhtVce8h8Li+m
         w8sDIJ026Ax03vjoEkQs1FwHegV52MtY055ZzhshaTRhA1BneCjAdgCETL8NEpsO69QR
         VBFxjA+eTja4po3+KMWEuwDl05QPRqla8pBD/YpdJyz2GgnLYXi8epNUejeZRcQWwsdq
         d2PfyRTrR+HQTZ3XGkmSRrXxaiQG84MMw7Rkl9+GII7oRKuVIoj8Q5+O5/MJTxDA+sed
         JJBQ==
X-Gm-Message-State: AOJu0YyEk4H/ryDrnq4I5CHcigPIorRBrXNuqgmM7v74ruCpEiymaBA9
	ZVJtnScVwYCEQRuPsZKc3YGxlAgKcPX5EA==
X-Google-Smtp-Source: AGHT+IEDxj54lBI5cQHVXmEUICzOH2DwH9AHhMgGh71gZ3XzSMpqexI0+JmDXg8FxWPOc2Tzh3yPdg==
X-Received: by 2002:a05:690c:ec7:b0:5a8:102:fe3e with SMTP id cs7-20020a05690c0ec700b005a80102fe3emr1977024ywb.11.1697532212591;
        Tue, 17 Oct 2023 01:43:32 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id o11-20020a81de4b000000b0059511008958sm431743ywl.76.2023.10.17.01.43.31
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:43:31 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a822f96aedso47648327b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:43:31 -0700 (PDT)
X-Received: by 2002:a0d:f786:0:b0:583:a3ab:b950 with SMTP id
 h128-20020a0df786000000b00583a3abb950mr1213954ywf.50.1697532211155; Tue, 17
 Oct 2023 01:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-11-hch@lst.de>
In-Reply-To: <20231016054755.915155-11-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2023 10:43:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXonOxTT7OuTtmyYR346F569aQE0ErhAx8qfsGxWUp+Sg@mail.gmail.com>
Message-ID: <CAMuHMdXonOxTT7OuTtmyYR346F569aQE0ErhAx8qfsGxWUp+Sg@mail.gmail.com>
Subject: Re: [PATCH 10/12] net: fec: use dma_alloc_noncoherent for data cache
 enabled coldfire
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_014335_205848_206E15D8 
X-CRM114-Status: GOOD (  24.78  )
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

SGkgQ2hyaXN0b3BoLAoKT24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNzo0OOKAr0FNIENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiBDb2xkZmlyZSBwbGF0Zm9ybXMgd2l0aCBk
YXRhIGNhY2hlcyBjYW4ndCBwcm9wZXJseSBpbXBsZW1lbnQKPiBkbWFfYWxsb2NfY29oZXJlbnQg
YW5kIGN1cnJlbnRseSBqdXN0IHJldHVybiBub25jb2hlcmVudCBtZW1vcnkgZnJvbQo+IGRtYV9h
bGxvY19jb2hlcmVudC4KPgo+IFRoZSBmZWMgZHJpdmVyIHRoYW4gd29ya3MgYXJvdW5kIHRoaXMg
d2l0aCBhIGZsdXNoIG9mIGFsbCBjYWNoZXMgaW4gdGhlCj4gcmVjZWl2ZSBwYXRoLiBNYWtlIHRo
aXMgaGFjayBhIGxpdHRsZSBsZXNzIGJhZCBieSB1c2luZyB0aGUgZXhwbGljaXQKPiBkbWFfYWxs
b2Nfbm9uY29oZXJlbnQgQVBJIGFuZCBkb2N1bWVudGluZyB0aGUgaGFja3kgY2FjaGUgZmx1c2hl
cyBzbwo+IHRoYXQgdGhlIERNQSBBUEkgbGV2ZWwgaGFjayBjYW4gYmUgcmVtb3ZlZC4KPgo+IEFs
c28gcmVwbGFjZSB0aGUgY2hlY2sgZm9yIENPTkZJR19NNTMyeCBmb3Igc2FpZCBoYWNrIHdpdGgg
YSBjaGVjawo+IGZvciBDT0xERklSRSAmJiAhQ09MREZJUkVfQ09IRVJFTlRfRE1BLiAgV2hpbGUg
bTUzMnggaXMgdGhlIG9ubHkgc3VjaAo+IHBsYXRmb3JtIHdpdGggYSBmZWMgbW9kdWxlLCB0aGlz
IG1ha2VzIHRoZSBjb2RlIG1vcmUgY29uc2lzdGVudCBhbmQKPiBlYXNpZXIgdG8gZm9sbG93Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghCgo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9m
ZWNfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2ZlY19tYWlu
LmMKPiBAQCAtNDA2LDYgKzQwNiw3MCBAQCBzdGF0aWMgdm9pZCBmZWNfZHVtcChzdHJ1Y3QgbmV0
X2RldmljZSAqbmRldikKPiAgICAgICAgIH0gd2hpbGUgKGJkcCAhPSB0eHEtPmJkLmJhc2UpOwo+
ICB9Cj4KPiArLyoKPiArICogQ29sZGZpcmUgZG9lcyBub3Qgc3VwcG9ydCBETUEgY29oZXJlbnQg
YWxsb2NhdGlvbnMsIGFuZCBoYXMgaGlzdG9yaWNhbGx5IHVzZWQKPiArICogYSBiYW5kLWFpZCB3
aXRoIGEgbWFudWFsIGZsdXNoIGluIGZlY19lbmV0X3J4X3F1ZXVlLgo+ICsgKi8KPiArI2lmIGRl
ZmluZWQoQ09ORklHX0NPTERGSVJFKSAmJiAhZGVmaW5lZChDT05GSUdfQ09MREZJUkVfQ09IRVJF
TlRfRE1BKQo+ICtzdGF0aWMgdm9pZCAqZmVjX2RtYV9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpkZXYs
IHNpemVfdCBzaXplLCBkbWFfYWRkcl90ICpoYW5kbGUsCj4gKyAgICAgICAgICAgICAgIGdmcF90
IGdmcCkKPiArewo+ICsgICAgICAgcmV0dXJuIGRtYV9hbGxvY19ub25jb2hlcmVudChkZXYsIHNp
emUsIGhhbmRsZSwgRE1BX0JJRElSRUNUSU9OQUwsIGdmcCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2
b2lkIGZlY19kbWFfZnJlZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLCB2b2lkICpj
cHVfYWRkciwKPiArICAgICAgICAgICAgICAgZG1hX2FkZHJfdCBoYW5kbGUpCj4gK3sKPiArICAg
ICAgIGRtYV9mcmVlX25vbmNvaGVyZW50KGRldiwgc2l6ZSwgY3B1X2FkZHIsIGhhbmRsZSwgRE1B
X0JJRElSRUNUSU9OQUwpOwo+ICt9Cj4gKyNlbHNlIC8qIENPTkZJR19DT0xERklSRSAmJiAhQ09O
RklHX0NPTERGSVJFX0NPSEVSRU5UX0RNQSAqLwoKIUNPTkZJR19DT0xERklSRSB8fCBDT05GSUdf
Q09MREZJUkVfQ09IRVJFTlRfRE1BCgo+ICtzdGF0aWMgdm9pZCAqZmVjX2RtYV9hbGxvYyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLCBkbWFfYWRkcl90ICpoYW5kbGUsCj4gKyAgICAg
ICAgICAgICAgIGdmcF90IGdmcCkKPiArewo+ICsgICAgICAgcmV0dXJuIGRtYV9hbGxvY19jb2hl
cmVudChkZXYsIHNpemUsIGhhbmRsZSwgZ2ZwKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgZmVj
X2RtYV9mcmVlKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsIHZvaWQgKmNwdV9hZGRy
LAo+ICsgICAgICAgICAgICAgICBkbWFfYWRkcl90IGhhbmRsZSkKPiArewo+ICsgICAgICAgZG1h
X2ZyZWVfY29oZXJlbnQoZGV2LCBzaXplLCBjcHVfYWRkciwgaGFuZGxlKTsKPiArfQo+ICsjZW5k
aWYgLyogIUNPTkZJR19DT0xERklSRSAmJiAhQ09ORklHX0NPTERGSVJFX0NPSEVSRU5UX0RNQSAq
LwoKIUNPTkZJR19DT0xERklSRSB8fCBDT05GSUdfQ09MREZJUkVfQ09IRVJFTlRfRE1BCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
