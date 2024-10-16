Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1654FD206A2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 06:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IKVRBPlAERhqiEXQdhjoulOVDd0XHXMlho9lic0FOw=; b=m4S9J12uZfqcQD
	jmjQeocUgEdym4KolwbS3gK0OMUFA0+62uzoH1kDJ8EA32mEQzHCViIqiURFipsmgcEFz9QUSFcyx
	3CZgOLJkmjNl9ThqeuhgXtjcEWaJumeUroWzh7qPjz8Anacu6vpe/nN38nehmrfWcYtXSN0WDHp2G
	OG2GtzQhV9Dwe38asrQ843EDmZU/KlGb721yznhMMRhO6e5oK5t69ETDA7DeaRxi2KxpnQS7dx87Z
	QnudPMdNnI0xeM9bE6WEAeM5bopQ5njTETbcWBpEpFYYEpdjOueX5kGAKqnd6Yf4ZmR61WuLNkLJO
	8V4w1GJI5ntTKPmVJe7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xyh-0000000AknF-0swc;
	Wed, 16 Oct 2024 06:57:51 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xns-0000000Aj7Y-2Y5G
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 06:46:42 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a398638ff9so24861615ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 23:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729061199; x=1729665999; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+UWG+iQDx7/sDsMqknKCoFlNlO/iTQrpby5lYUUqTw=;
        b=dIVa2pksNlqb8XH1Jg2WLpOUcGUPJSyWsZnJNbDeH9mx14ht78M3HIVcQVJ5UDCDdW
         uPSJaG9Cis82g8CExIMa9iFfj1koZM+ccYYkH0s8RvLrdUcUCocK78ZteQgtlTUzas8h
         zCnt7fMca5P3O9lwks3EvOSWYO6TOJoQTuuJu6ulkmrrLomQ2qmUPJQaSYQzAXS9aQMH
         ruuDlvh3r2xJB1mjxQyBBIs7Hm8fcdhUP3csfH47x/5Jh5HPoHmbywU8mSVGB7qQrYw3
         7MVMaLnx95LhZnkwRyzA24+QLLR0un1LrxwLE/ZEiRpu9qKdMSy76Ere3WFv6kRShVDA
         Gnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729061199; x=1729665999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+UWG+iQDx7/sDsMqknKCoFlNlO/iTQrpby5lYUUqTw=;
        b=VF9dfwzCFH0gZmFtXBAMI8+bwPfd8RfzTgytQi9KoNdh6JQB4iuNQluKg7pEjyys0b
         QJdLVHZPmZAuPMaf0HaBh6EuWo7SdJIipKn7HzBuMcLqUJzd6W8xV+LxWgjECTn6T4g6
         Hzu2+ZcIx4Tq6S9Lkrm5IABFYlCHjMolQqKD7KBSHlD/cRJgCzt1s7+qygARRAs2jUnF
         DAmfQmpIWeBcu4t95OgQ/KswURRrvqK259nSb46zY+1XP1gD9nwvJdI+9Km9pqnIzS38
         W74+MbpyDPMqtehYvaBnnZF10CXkU5nN92DXb8pfMv23ZRC8B5q36UI8JCrF2uWPTL17
         cVNw==
X-Forwarded-Encrypted: i=1; AJvYcCVJwQLUXFrem3QSNIXhqDT3LmgrdmgegOMKb0sqIPzugADdKnEuHfNQSFqC4cGE2NAhFZqC4Yj5Q7xY0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqRTgVuQRZnJE2V3fIH6R4ldKE+qHKFHf++/w1Gtpx6sdstKv+
	5lkf703WBSFrjKnkKnyLUiWVLhemfd4kmy19upumxfzHgRiPiYjRD0fdc1iZUQGNWW9tl1LZyw9
	dpTVPOF/Z9iYOjcwwfXSt00Y5sqUzYmq1CicbXQ==
X-Google-Smtp-Source: AGHT+IG0i/JYD0IC1+8ATNDbsKwtcxr+LgejQV1B7YdOhS4ht6Ui8pkwiop1o21oFn6m9FR3zioopWhLOktOCqkpAjM=
X-Received: by 2002:a05:6e02:194d:b0:3a0:480c:6ac4 with SMTP id
 e9e14a558f8ab-3a3b5fc413cmr160135915ab.22.1729061198896; Tue, 15 Oct 2024
 23:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728579958.git.tjeznach@rivosinc.com> <b8da2b00aec3f7b4b2e3a7cc194f7961bf656f24.1728579958.git.tjeznach@rivosinc.com>
 <20241015085044.GA19110@willie-the-truck>
In-Reply-To: <20241015085044.GA19110@willie-the-truck>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 15 Oct 2024 23:46:28 -0700
Message-ID: <CAH2o1u75x3YQ7amKU4WEQVMZ5h9-PTAXnyoWLw6rQsVG2C=Qcw@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] iommu/riscv: Add RISC-V IOMMU platform device driver
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_234640_936491_D97877EA 
X-CRM114-Status: GOOD (  23.16  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgMTo1MOKAr0FNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMTI6NDg6MDVQTSAtMDcw
MCwgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gPiBJbnRyb2R1Y2UgcGxhdGZvcm0gZGV2aWNlIGRy
aXZlciBmb3IgaW1wbGVtZW50YXRpb24gb2YgUklTQy1WIElPTU1VCj4gPiBhcmNoaXRlY3RlZCBo
YXJkd2FyZS4KPiA+Cj4gPiBIYXJkd2FyZSBpbnRlcmZhY2UgZGVmaW5pdGlvbiBsb2NhdGVkIGlu
IGZpbGUgaW9tbXUtYml0cy5oIGlzIGJhc2VkIG9uCj4gPiByYXRpZmllZCBSSVNDLVYgSU9NTVUg
QXJjaGl0ZWN0dXJlIFNwZWNpZmljYXRpb24gdmVyc2lvbiAxLjAuMC4KPiA+Cj4gPiBUaGlzIHBh
dGNoIGltcGxlbWVudHMgcGxhdGZvcm0gZGV2aWNlIGluaXRpYWxpemF0aW9uLCBlYXJseSBjaGVj
ayBhbmQKPiA+IGNvbmZpZ3VyYXRpb24gb2YgdGhlIElPTU1VIGludGVyZmFjZXMgYW5kIGVuYWJs
ZXMgZ2xvYmFsIHBhc3MtdGhyb3VnaAo+ID4gYWRkcmVzcyB0cmFuc2xhdGlvbiBtb2RlIChpb21t
dV9tb2RlID09IEJBUkUpLCB3aXRob3V0IHJlZ2lzdGVyaW5nCj4gPiBoYXJkd2FyZSBpbnN0YW5j
ZSBpbiB0aGUgSU9NTVUgc3Vic3lzdGVtLgo+ID4KPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi1ub24taXNhL3Jpc2N2LWlvbW11Cj4gPiBDby1kZXZlbG9wZWQtYnk6IE5pY2sgS29z
c2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3Np
ZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBTZWJhc3RpZW4g
Qm9ldWYgPHNlYkByaXZvc2luYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpZW4gQm9l
dWYgPHNlYkByaXZvc2luYy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTHUgQmFvbHUgPGJhb2x1Lmx1
QGxpbnV4LmludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBKZXpuYWNoIDx0amV6
bmFjaEByaXZvc2luYy5jb20+Cj4gPiAtLS0KPgo+IFsuLi5dCj4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmggYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmgK
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjcwMGUzM2Rj
MjQ0Ngo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21t
dS5oCj4gPiBAQCAtMCwwICsxLDYyIEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSAqLwo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMjItMjAyNCBS
aXZvcyBJbmMuCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMjMgRk9SVEgtSUNTL0NBUlYKPiA+ICsg
Kgo+ID4gKyAqIEF1dGhvcnMKPiA+ICsgKiAgIFRvbWFzeiBKZXpuYWNoIDx0amV6bmFjaEByaXZv
c2luYy5jb20+Cj4gPiArICogICBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+
ID4gKyAqLwo+ID4gKwo+ID4gKyNpZm5kZWYgX1JJU0NWX0lPTU1VX0hfCj4gPiArI2RlZmluZSBf
UklTQ1ZfSU9NTVVfSF8KPiA+ICsKPiA+ICsjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPiA+ICsj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+Cj4g
PiArCj4gPiArI2luY2x1ZGUgImlvbW11LWJpdHMuaCIKPiA+ICsKPiA+ICtzdHJ1Y3QgcmlzY3Zf
aW9tbXVfZGV2aWNlIHsKPiA+ICsgICAgIC8qIGlvbW11IGNvcmUgaW50ZXJmYWNlICovCj4gPiAr
ICAgICBzdHJ1Y3QgaW9tbXVfZGV2aWNlIGlvbW11Owo+ID4gKwo+ID4gKyAgICAgLyogaW9tbXUg
aGFyZHdhcmUgKi8KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiA+ICsKPiA+ICsgICAg
IC8qIGhhcmR3YXJlIGNvbnRyb2wgcmVnaXN0ZXIgc3BhY2UgKi8KPiA+ICsgICAgIHZvaWQgX19p
b21lbSAqcmVnOwo+ID4gKwo+ID4gKyAgICAgLyogc3VwcG9ydGVkIGFuZCBlbmFibGVkIGhhcmR3
YXJlIGNhcGFiaWxpdGllcyAqLwo+ID4gKyAgICAgdTY0IGNhcHM7Cj4gPiArICAgICB1MzIgZmN0
bDsKPiA+ICsKPiA+ICsgICAgIC8qIGF2YWlsYWJsZSBpbnRlcnJ1cHQgbnVtYmVycywgTVNJIG9y
IFdTSSAqLwo+ID4gKyAgICAgdW5zaWduZWQgaW50IGlycXNbUklTQ1ZfSU9NTVVfSU5UUl9DT1VO
VF07Cj4gPiArICAgICB1bnNpZ25lZCBpbnQgaXJxc19jb3VudDsKPiA+ICt9Owo+ID4gKwo+ID4g
K2ludCByaXNjdl9pb21tdV9pbml0KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KTsK
PiA+ICt2b2lkIHJpc2N2X2lvbW11X3JlbW92ZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICpp
b21tdSk7Cj4gPiArCj4gPiArI2RlZmluZSByaXNjdl9pb21tdV9yZWFkbChpb21tdSwgYWRkcikg
XAo+ID4gKyAgICAgcmVhZGxfcmVsYXhlZCgoaW9tbXUpLT5yZWcgKyAoYWRkcikpCj4gPiArCj4g
PiArI2RlZmluZSByaXNjdl9pb21tdV9yZWFkcShpb21tdSwgYWRkcikgXAo+ID4gKyAgICAgcmVh
ZHFfcmVsYXhlZCgoaW9tbXUpLT5yZWcgKyAoYWRkcikpCj4gPiArCj4gPiArI2RlZmluZSByaXNj
dl9pb21tdV93cml0ZWwoaW9tbXUsIGFkZHIsIHZhbCkgXAo+ID4gKyAgICAgd3JpdGVsX3JlbGF4
ZWQoKHZhbCksIChpb21tdSktPnJlZyArIChhZGRyKSkKPiA+ICsKPiA+ICsjZGVmaW5lIHJpc2N2
X2lvbW11X3dyaXRlcShpb21tdSwgYWRkciwgdmFsKSBcCj4gPiArICAgICB3cml0ZXFfcmVsYXhl
ZCgodmFsKSwgKGlvbW11KS0+cmVnICsgKGFkZHIpKQo+ID4gKwo+ID4gKyNkZWZpbmUgcmlzY3Zf
aW9tbXVfcmVhZHFfdGltZW91dChpb21tdSwgYWRkciwgdmFsLCBjb25kLCBkZWxheV91cywgdGlt
ZW91dF91cykgXAo+ID4gKyAgICAgcmVhZHhfcG9sbF90aW1lb3V0KHJlYWRxX3JlbGF4ZWQsIChp
b21tdSktPnJlZyArIChhZGRyKSwgdmFsLCBjb25kLCBcCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgZGVsYXlfdXMsIHRpbWVvdXRfdXMpCj4gPiArCj4gPiArI2RlZmluZSByaXNjdl9pb21t
dV9yZWFkbF90aW1lb3V0KGlvbW11LCBhZGRyLCB2YWwsIGNvbmQsIGRlbGF5X3VzLCB0aW1lb3V0
X3VzKSBcCj4gPiArICAgICByZWFkeF9wb2xsX3RpbWVvdXQocmVhZGxfcmVsYXhlZCwgKGlvbW11
KS0+cmVnICsgKGFkZHIpLCB2YWwsIGNvbmQsIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICBkZWxheV91cywgdGltZW91dF91cykKPiA+ICsKPiA+ICsjZW5kaWYKPgo+IEN1cmlvdXM6IHdo
eSBkbyB5b3UgbmVlZCB0aGVzZSBNTUlPIHdyYXBwZXJzIGlmIHRoZSBkcml2ZXIgZGVwZW5kcyBv
bgo+IDY0QklUPwo+CgpIZWxsbyBXaWxsLAoKVGhlc2Ugd3JhcHBlcnMgd2VyZSBpbml0aWFsbHkg
Y3JlYXRlZCB0byBzdXBwb3J0IDMyLWJpdCBDUFUKYXJjaGl0ZWN0dXJlcyBidXQgd2VyZSBsYXRl
ciBkaXNjb250aW51ZWQgdG8gY29uY2VudHJhdGUgb24gcHJhY3RpY2FsCmRyaXZlciB1c2UgY2Fz
ZXMuIEl0IGhhcyBiZWVuIG9ic2VydmVkIHRoYXQgc29tZSBSSVNDLVYgSU9NTVUgaGFyZHdhcmUK
aW1wbGVtZW50YXRpb25zIG1pZ2h0IG9ubHkgYWxsb3cgMzItYml0IE1NSU8gYWNjZXNzLCBldmVu
IG9uIDY0LWJpdApzeXN0ZW1zLiBUaGUgd3JhcHBlcnMgYXJlIGxlZnQgaW4gcGxhY2UgdG8gYWNj
b21tb2RhdGUgdGhlc2UgcG90ZW50aWFsCmRlc2lnbnMgaWYgdGhleSBhcmlzZS4gSSdkIGxlYXZl
IHRoZW0gZm9yIG5vdyBhbmQgcmVldmFsdWF0ZSB0aGVpcgpuZWNlc3NpdHkgaW4gYSBmZXcgbW9u
dGhzLgoKVGhhbmtzLAotIFRvbWFzegoKPiBXaWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
