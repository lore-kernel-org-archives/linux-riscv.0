Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A760BC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 05:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pd4vc7FslPWZjgThKRVrXPjbZFeMlNACt4O7ET/2tWQ=; b=A2l0i9UhfpvTNW
	NGEY2laUnpilaemMk4s05wGkl0yuZj/4ls9Rp54wESWP48GjxTIoHEMjzbkoX3qxPTzakLv9vDZvI
	Q3vBJB85GBfrXDdPpxvtQw90UEouwz9tIrTj0sYamGb8kBwudtuKqMiiB3+xBWqBM/MGS7ChTS84G
	44j5/jryTXet9XP2a9wcHM1rxN8DhK8IOo3oli+cmjVKsF8RvSb9L5pgXmBc4ZL2vGGd0iB+umIqe
	o+Tx2x4O/9o+UwZ+NRmbP54UOwswYzZ9IQ0IKychCFS6Bs1PloHeZbmw7X1xPiXJxrasO28yiQqIr
	E1j3RE+MlwhKa5TZPUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPFsb-001iYy-24;
	Fri, 28 Jul 2023 05:19:09 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPFsY-001iYT-0s
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 05:19:08 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a38953c928so1407886b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 22:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690521542; x=1691126342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dA4h1wXuO+RqiKn56Fbjhd22WJLs7KDtxnH5lEYDThw=;
        b=rCCGFQOaheftq0HBV0LLW8L+L/v6ll8/foJApxGYX++40jda1h5c0MWTF5uv35NOCF
         yaH9NHb3PZpu3nzpkBd3mt1WnPtZ9z3ydmeagEC8cU1Hfk8th+iT9nfxFuTWfKWNMdq8
         n8wnb1rM3D6J0b3bhLL4G4KA3L8KDqw1kOgvKizfcveQ1uA1cuV2lFWT2zG67WZr6YEU
         ng2su2EY9hqNPdMBPtdMPPSk0j8ev6ZR+5zcP8/HacSMRejTg4ZwLEfDbEunGix1l0YX
         DndlAnMka4ykXJbXYC7WjlDVBN+bD7cZ0CXFDvOTrx37mCops+MAyXcQT3agmOs2Veow
         PzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690521542; x=1691126342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA4h1wXuO+RqiKn56Fbjhd22WJLs7KDtxnH5lEYDThw=;
        b=a47WvWaR1VK3AEYRmDo62sJJNoUqFHQ+n37BmPwNj7yDUDgg8GW2LIzbTtMm+/8ETj
         9GlG0WjxhdeBnEpwzrMZoCEmtbm7+6wdkNajz4HFVLjF/3JBQuNvchI5jZkG5xAJ5bAd
         oVLPkDsy8RRdKaQP7qIW6/zIsV0mD3gxHtlcjeOxFpyfKbW4JutpblLOpKzS4kLYKhd1
         Tr6Dj2AcKDNANItDy792Cw6v+hGLabt4hfTIAmQ9biFhVIM6D9Evya1I41vxagc15prd
         +cWP+zxtLxtaa2l3dY75Ih2igcYbPtHLLRs2Igea8AX+AFk64nsqOb2757QXj1iVGilJ
         O7GQ==
X-Gm-Message-State: ABy/qLay5pomxEHgs36SOzxYEfI12h79M/dh4WYqO8pkdhLc4i6QLhxw
	QNx0QUITSZWex6eMgbWnhbOsbXMi7UbBwUw2GWgDMg==
X-Google-Smtp-Source: APBJJlHSydpCNCH72+CyJD9Ih+I/nhI+XXfo842aQixN2GlXK2CsCxImcW2/Puw6DSs7Cz69xxqmvHQF4lkXRvRAEfA=
X-Received: by 2002:a05:6808:f05:b0:3a0:5ee3:ea67 with SMTP id
 m5-20020a0568080f0500b003a05ee3ea67mr2125638oiw.16.1690521542545; Thu, 27 Jul
 2023 22:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <5b8fd18e-8dfa-96bf-cdd4-4498b1d15ab9@ics.forth.gr> <CAH2o1u7uAuXsD6+6Dvam4kzQuUj8s98G0sR26_-q31wvSUYZNA@mail.gmail.com>
 <CANXhq0rz1J+0t9M-e5NY015HhDT1Yy024_-Uan9CSJ4rMqtyng@mail.gmail.com>
In-Reply-To: <CANXhq0rz1J+0t9M-e5NY015HhDT1Yy024_-Uan9CSJ4rMqtyng@mail.gmail.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Fri, 28 Jul 2023 07:18:51 +0200
Message-ID: <CAH2o1u6TaQ2PLcKRuSpcqh4Q5qUriimSZ1hmmy=37R2378NCUA@mail.gmail.com>
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Zong Li <zong.li@sifive.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_221906_543873_B19BC105 
X-CRM114-Status: GOOD (  30.29  )
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgMTE6NDfigK9BTSBab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMjEsIDIwMjMgYXQgMjowMOKAr0FNIFRvbWFz
eiBKZXpuYWNoIDx0amV6bmFjaEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
SnVsIDE5LCAyMDIzIGF0IDg6MTLigK9QTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRo
LmdyPiB3cm90ZToKPiA+ID4KPiA+ID4gSGVsbG8gVG9tYXN6LAo+ID4gPgo+ID4gPiBPbiA3LzE5
LzIzIDIyOjMzLCBUb21hc3ogSmV6bmFjaCB3cm90ZToKPiA+ID4gPiBFbmFibGVzIG1lc3NhZ2Ug
b3Igd2lyZSBzaWduYWwgaW50ZXJydXB0cyBmb3IgUENJZSBhbmQgcGxhdGZvcm1zIGRldmljZXMu
Cj4gPiA+ID4KPiA+ID4KPiA+ID4gVGhlIGRlc2NyaXB0aW9uIGRvZXNuJ3QgbWF0Y2ggdGhlIHN1
YmplY3Qgbm9yIHRoZSBwYXRjaCBjb250ZW50ICh3ZQo+ID4gPiBkb24ndCBqdXMgZW5hYmxlIGlu
dGVycnVwdHMsIHdlIGFsc28gaW5pdCB0aGUgcXVldWVzKS4KPiA+ID4KPiA+ID4gPiArICAgICAv
KiBQYXJzZSBRdWV1ZSBsZW5ndHMgKi8KPiA+ID4gPiArICAgICByZXQgPSBvZl9wcm9wZXJ0eV9y
ZWFkX3UzMihwZGV2LT5kZXYub2Zfbm9kZSwgImNtZHFfbGVuIiwgJmlvbW11LT5jbWRxX2xlbik7
Cj4gPiA+ID4gKyAgICAgaWYgKCFyZXQpCj4gPiA+ID4gKyAgICAgICAgICAgICBkZXZfaW5mbyhk
ZXYsICJjb21tYW5kIHF1ZXVlIGxlbmd0aCBzZXQgdG8gJWlcbiIsIGlvbW11LT5jbWRxX2xlbik7
Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYt
PmRldi5vZl9ub2RlLCAiZmx0cV9sZW4iLCAmaW9tbXUtPmZsdHFfbGVuKTsKPiA+ID4gPiArICAg
ICBpZiAoIXJldCkKPiA+ID4gPiArICAgICAgICAgICAgIGRldl9pbmZvKGRldiwgImZhdWx0L2V2
ZW50IHF1ZXVlIGxlbmd0aCBzZXQgdG8gJWlcbiIsIGlvbW11LT5mbHRxX2xlbik7Cj4gPiA+ID4g
Kwo+ID4gPiA+ICsgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9u
b2RlLCAicHJpcV9sZW4iLCAmaW9tbXUtPnByaXFfbGVuKTsKPiA+ID4gPiArICAgICBpZiAoIXJl
dCkKPiA+ID4gPiArICAgICAgICAgICAgIGRldl9pbmZvKGRldiwgInBhZ2UgcmVxdWVzdCBxdWV1
ZSBsZW5ndGggc2V0IHRvICVpXG4iLCBpb21tdS0+cHJpcV9sZW4pOwo+ID4gPiA+ICsKPiA+ID4g
PiAgICAgICBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KCZwZGV2LT5kZXYsIERNQV9CSVRfTUFT
Syg2NCkpOwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFdlIG5lZWQgdG8gYWRkIHRob3NlIHRvIHRoZSBk
ZXZpY2UgdHJlZSBiaW5kaW5nIGRvYyAob3IgdGhyb3cgdGhlbSBhd2F5LAo+ID4gPiBJIHRob3Vn
aHQgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgdGhlbSBhcyBwYXJ0IG9mIHRoZSBkZXZpY2UK
PiA+ID4gZGVzY2lwdGlvbiB0aGFuIGEgbW9kdWxlIHBhcmFtZXRlcikuCj4gPiA+Cj4gPgo+ID4g
V2UgY2FuIGFkZCB0aGVtIGFzIGFuIG9wdGlvbmFsIGZpZWxkcyB0byBEVC4KPiA+IEFsdGVybmF0
aXZlbHksIEkndmUgYmVlbiBsb29raW5nIGludG8gYW4gb3B0aW9uIHRvIGF1dG8tc2NhbGUgQ1Ev
UFEKPiA+IGJhc2VkIG9uIG51bWJlciBvZiBhdHRhY2hlZCBkZXZpY2VzLCBidXQgdGhpcyBnZXRz
IHRyaWNraWVyIGZvcgo+ID4gaG90LXBsdWdnYWJsZSBzeXN0ZW1zLiBJJ3ZlIGFkZGVkIG1vZHVs
ZSBwYXJhbWV0ZXJzIGFzIGEgYmFyZS1taW5pbXVtLAo+ID4gYnV0IHN0aWxsIGxvb2tpbmcgZm9y
IGJldHRlciBzb2x1dGlvbnMuCj4gPgo+ID4gPgo+ID4gPiA+ICtzdGF0aWMgaXJxcmV0dXJuX3Qg
cmlzY3ZfaW9tbXVfcHJpcV9pcnFfY2hlY2soaW50IGlycSwgdm9pZCAqZGF0YSk7Cj4gPiA+ID4g
K3N0YXRpYyBpcnFyZXR1cm5fdCByaXNjdl9pb21tdV9wcmlxX3Byb2Nlc3MoaW50IGlycSwgdm9p
ZCAqZGF0YSk7Cj4gPiA+ID4gKwo+ID4gPgo+ID4gPiA+ICsgICAgIGNhc2UgUklTQ1ZfSU9NTVVf
UEFHRV9SRVFVRVNUX1FVRVVFOgo+ID4gPiA+ICsgICAgICAgICAgICAgcSA9ICZpb21tdS0+cHJp
cTsKPiA+ID4gPiArICAgICAgICAgICAgIHEtPmxlbiA9IHNpemVvZihzdHJ1Y3QgcmlzY3ZfaW9t
bXVfcHFfcmVjb3JkKTsKPiA+ID4gPiArICAgICAgICAgICAgIGNvdW50ID0gaW9tbXUtPnByaXFf
bGVuOwo+ID4gPiA+ICsgICAgICAgICAgICAgaXJxID0gaW9tbXUtPmlycV9wcmlxOwo+ID4gPiA+
ICsgICAgICAgICAgICAgaXJxX2NoZWNrID0gcmlzY3ZfaW9tbXVfcHJpcV9pcnFfY2hlY2s7Cj4g
PiA+ID4gKyAgICAgICAgICAgICBpcnFfcHJvY2VzcyA9IHJpc2N2X2lvbW11X3ByaXFfcHJvY2Vz
czsKPiA+ID4gPiArICAgICAgICAgICAgIHEtPnFiciA9IFJJU0NWX0lPTU1VX1JFR19QUUI7Cj4g
PiA+ID4gKyAgICAgICAgICAgICBxLT5xY3IgPSBSSVNDVl9JT01NVV9SRUdfUFFDU1I7Cj4gPiA+
ID4gKyAgICAgICAgICAgICBuYW1lID0gInByaXEiOwo+ID4gPiA+ICsgICAgICAgICAgICAgYnJl
YWs7Cj4gPiA+Cj4gPiA+Cj4gPiA+IEl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gYWRkIHRoZSBjb2Rl
IGZvciB0aGUgcGFnZSByZXF1ZXN0IHF1ZXVlIGluIHRoZQo+ID4gPiBwYXRjaCB0aGF0IGFkZHMg
QVRTL1BSSSBzdXBwb3J0IElNSE8uIFRoaXMgY29tbWVudCBhbHNvIGFwcGxpZXMgdG8gaXRzCj4g
PiA+IGludGVycnVwdCBoYW5kbGVycyBiZWxvdy4KPiA+ID4KPiA+Cj4gPiBhY2suIHdpbGwgZG8u
Cj4gPgo+ID4gPgo+ID4gPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3ZfaW9tbXVfY21kX2lu
dmFsX3NldF9hZGRyKHN0cnVjdCByaXNjdl9pb21tdV9jb21tYW5kICpjbWQsCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTY0IGFkZHIpCj4g
PiA+ID4gK3sKPiA+ID4gPiArICAgICBjbWQtPmR3b3JkMCB8PSBSSVNDVl9JT01NVV9DTURfSU9U
SU5WQUxfQVY7Cj4gPiA+ID4gKyAgICAgY21kLT5kd29yZDEgPSBhZGRyOwo+ID4gPiA+ICt9Cj4g
PiA+ID4gKwo+ID4gPgo+ID4gPiBUaGlzIG5lZWRzIHRvIGJlIChhZGRyID4+IDIpIHRvIG1hdGNo
IHRoZSBzcGVjLCBzYW1lIGFzIGluIHRoZSBpb2ZlbmNlCj4gPiA+IGNvbW1hbmQuCj4gPiA+Cj4g
Pgo+ID4gb29wcy4gVGhhbmtzIQo+ID4KPgo+IEkgdGhpbmsgaXQgc2hvdWxkIGJlIChhZGRyID4+
IDEyKSBhY2NvcmRpbmcgdG8gdGhlIHNwZWMuCj4KCk15IHJlYWRpbmcgb2YgdGhlIHNwZWMgJzMu
MS4xLiBJT01NVSBQYWdlLVRhYmxlIGNhY2hlIGludmFsaWRhdGlvbiBjb21tYW5kcycKaXMgdGhh
dCBpdCBpcyBhIDRrIHBhZ2UgYWxpZ25lZCBhZGRyZXNzIHBhY2tlZCBhdCBkd29yZDFbNjE6MTBd
LCBzbwplZmZlY3RpdmVseSBzaGlmdGVkIGJ5IDIgYml0cy4KCnJlZ2FyZHMsCi0gVG9tYXN6Cgo+
ID4gPiBSZWdhcmRzLAo+ID4gPiBOaWNrCj4gPiA+Cj4gPgo+ID4gcmVnYXJkcywKPiA+IC0gVG9t
YXN6Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
