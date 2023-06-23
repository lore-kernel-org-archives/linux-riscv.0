Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2781CEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4aVCgQkhPCnV530F9twPvh3wXNrKWrc9BMK2kDIZ3U=; b=x3Jh1VyMGYC+oF
	XK9i7UQkU0SnyeY1gnU9tKBT4YfaJtTtN77DnXeewhXWi9K0AmGi8EEptJ0EY1mhA/FdytaqAzqWZ
	VDr/NQVOCSBRskpv6Itoi77+VI6Elaz9iVHtrFBFWu63LxeVctOux4XSpoY0zriulEnlVb4PwXE6z
	vGpbiLWSGl6Np6h4nta6m3akh+qvByySvLkyZEWAg4KoeLo6zdQ7KLgxf2cYINo1ZV/b/umRPaP6g
	fEltfGnId0O4ZBKYg34yhBFEM5dC1Z00ojGjRdB7jqvqtmFyucXiIEz3d3rf1hk9l6YUOfoq8EdqH
	+2ttc2GsinC6mB/65UEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCdQB-0033ut-2a;
	Fri, 23 Jun 2023 09:49:39 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCdQ9-0033uM-1X
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 09:49:39 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b45a71c9caso7588701fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 02:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687513775; x=1690105775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxUDNtmQR8JwrlnuU0Ur6WjlOeutON60uUnD6jBAYPg=;
        b=drmVYpNNrJi6VclAki+iipR4Vh561Y7dXfaU/l4PfsFiKd0P8xiSmY46+9zB/NneDh
         myY9DtYY26tkbHkjTWfCLEcDHmiOxV9vqjOtDf/U84iRinn8lRuY8gPPS4W8gYZFcIlb
         3V9acKI5siMa8E/5YApiOK5detcrHiLF828joWiR8wuHRhNAoFZJH6A1LMdPLeGIdDG/
         8MTgSAY3M8EGDqrmL/12d9GbR1x1E8kAB/X+TOA11UDK+YPPuJOWpjdRDMAV/NG3RXkB
         iIVCxljOJKwl83fhp4SyqGdn5WWpE6njhp/C6dSlCaw5jue9NcFz1Y5aNLiuI1wwQUYT
         2l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687513775; x=1690105775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxUDNtmQR8JwrlnuU0Ur6WjlOeutON60uUnD6jBAYPg=;
        b=OAu9TNnlOoYCRXjlNMPKSqG69CWbF387fdmmR/KlRhGo3DCvULPdV+KiXszJNkHlMT
         4wd8zXOIfEb2m+9bTBBqm4XDqF0n37Eh4i2HNMy9BFLuUeUP5nNe4gg/H/AujKsCTFdm
         EXp/WRHhfButTod4lK4PqELToHVNFY0g1eUzcWUw6j/9Ha7TrbTKfs0jBySc/VEAcBcm
         9kmCGf8abChLt1ScNWpkthPK/l6lGMkXGbLcgySl4+mVpKHk1BLICE3Do6siqA+D9wQU
         /MMJxENM69QA6+6RSuKHS9cW/4u3mE450MR5YhrCJ/uLwB3x338Co7Ce6Z5bHvnvRdt2
         SraA==
X-Gm-Message-State: AC+VfDya/1HI5JDbbFHcJVdBoaTS+wVghIZRHp3LaB5MQ4skdKzOIAIr
	LNBFylizb2BfT8SuLWyQNNk8cc7VYo+hoFSbCuO9Ew==
X-Google-Smtp-Source: ACHHUZ6igxv4uU2dw/LOnMIEy0seWcw7fzf6D62DorOP05lRSek7qsIFNNV9/Ulj1ybBTnaS2Q5pBFdL1f8igGCwGK4=
X-Received: by 2002:a2e:961a:0:b0:2b5:7a97:d50e with SMTP id
 v26-20020a2e961a000000b002b57a97d50emr7700326ljh.41.1687513774969; Fri, 23
 Jun 2023 02:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-2-eric.lin@sifive.com>
 <20230616-errand-glutton-f64783da058c@spud>
In-Reply-To: <20230616-errand-glutton-f64783da058c@spud>
From: Eric Lin <eric.lin@sifive.com>
Date: Fri, 23 Jun 2023 17:49:22 +0800
Message-ID: <CAPqJEFr1FfuHYX=BP3BXAsZ0V4JFDqzu7_jjPVgcijOFQzddmQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: sifive: Add SiFive private L2 cache support
To: Conor Dooley <conor@kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, maz@kernel.org, 
	chenhuacai@kernel.org, baolu.lu@linux.intel.com, will@kernel.org, 
	kan.liang@linux.intel.com, nnac123@linux.ibm.com, pierre.gondois@arm.com, 
	huangguangbin2@huawei.com, jgross@suse.com, chao.gao@intel.com, 
	maobibo@loongson.cn, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_024937_549195_C8B10047 
X-CRM114-Status: GOOD (  33.81  )
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

SGkgQ29ub3IsCgpPbiBTYXQsIEp1biAxNywgMjAyMyBhdCA1OjA14oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhleSBFcmljLAo+Cj4gT24gRnJpLCBKdW4g
MTYsIDIwMjMgYXQgMDI6MzI6MDhQTSArMDgwMCwgRXJpYyBMaW4gd3JvdGU6Cj4gPiBUaGlzIGFk
ZHMgU2lGaXZlIHByaXZhdGUgTDIgY2FjaGUgZHJpdmVyIHdoaWNoIHdpbGwgc2hvdwo+ID4gY2Fj
aGUgY29uZmlnIGluZm9ybWF0aW9uIHdoZW4gYm9vdGluZyBhbmQgYWRkIGNwdSBob3RwbHVnCj4g
PiBjYWxsYmFjayBmdW5jdGlvbnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRXJpYyBMaW4gPGVy
aWMubGluQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNp
Zml2ZS5jb20+Cj4KPiBNaXNzaW5nIGEgQ28tZGV2ZWxvcGVkLWJ5IGZvciBOaWNrPwoKWWVzLCBJ
J2xsIGFkZCBDby1kZXZlbG9wZWQtYnkgZm9yIE5pY2sgaW4gdjIuIFRoYW5rcy4KCj4KPgo+ID4g
K3N0YXRpYyB2b2lkIHBsMl9jb25maWdfcmVhZCh2b2lkIF9faW9tZW0gKnBsMl9iYXNlLCBpbnQg
Y3B1KQo+ID4gK3sKPiA+ICsgICAgIHUzMiByZWd2YWwsIGJhbmssIHdheSwgc2V0LCBjYWNoZWxp
bmU7Cj4gPiArCj4gPiArICAgICByZWd2YWwgPSByZWFkbChwbDJfYmFzZSk7Cj4gPiArICAgICBi
YW5rID0gcmVndmFsICYgMHhmZjsKPiA+ICsgICAgIHByX2luZm8oImluIHRoZSBDUFU6ICVkXG4i
LCBjcHUpOwo+ID4gKyAgICAgcHJfaW5mbygiTm8uIG9mIEJhbmtzIGluIHRoZSBjYWNoZTogJWRc
biIsIGJhbmspOwo+ID4gKyAgICAgd2F5ID0gKHJlZ3ZhbCAmIDB4ZmYwMCkgPj4gODsKPiA+ICsg
ICAgIHByX2luZm8oIk5vLiBvZiB3YXlzIHBlciBiYW5rOiAlZFxuIiwgd2F5KTsKPiA+ICsgICAg
IHNldCA9IChyZWd2YWwgJiAweGZmMDAwMCkgPj4gMTY7Cj4gPiArICAgICBwcl9pbmZvKCJUb3Rh
bCBzZXRzOiAlbGx1XG4iLCAodWludDY0X3QpMSA8PCBzZXQpOwo+ID4gKyAgICAgY2FjaGVsaW5l
ID0gKHJlZ3ZhbCAmIDB4ZmYwMDAwMDApID4+IDI0Owo+ID4gKyAgICAgcHJfaW5mbygiQnl0ZXMg
cGVyIGNhY2hlIGJsb2NrOiAlbGx1XG4iLCAodWludDY0X3QpMSA8PCBjYWNoZWxpbmUpOwo+ID4g
KyAgICAgcHJfaW5mbygiU2l6ZTogJWRcbiIsIHdheSA8PCAoc2V0ICsgY2FjaGVsaW5lKSk7Cj4g
PiArfQo+Cj4gSXNuJ3QgdGhpcyBiYXNpY2FsbHkgYWxsIGluZm9ybWF0aW9uIHRoYXQgd2UgZ2V0
IGFueXdheSBpbiBzeXNmcyBiYXNlZAo+IG9uIHdoYXQgZ2V0cyBwdXQgaW50byB0aGUgRFQsIGV4
Y2VwdCBwcmludGVkIG91dCBvbmNlIHBlciBDUFUgYXQKPiBib290dGltZT8KPiBJZiB0aGVyZSdz
IHJlYXNvbiB0byBrZWVwIGl0LCBwbGVhc2UgZG8gYXMgc3VnZ2VzdGVkIGJ5IEJlbiBhbmQgY3V0
IGRvd24KPiB0aGUgbnVtYmVyIG9mIGxpbmVzIGVtaXR0ZWQuIExvb2sgYXQgdGhlIGNjYWNoZSBv
bmUgZm9yIGNvbXBhcmlzb246Cj4gICAgICAgICBzdGF0aWMgdm9pZCBjY2FjaGVfY29uZmlnX3Jl
YWQodm9pZCkKPiAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgdTMyIGNmZzsKPgo+ICAgICAg
ICAgICAgICAgICBjZmcgPSByZWFkbChjY2FjaGVfYmFzZSArIFNJRklWRV9DQ0FDSEVfQ09ORklH
KTsKPiAgICAgICAgICAgICAgICAgcHJfaW5mbygiJWxsdSBiYW5rcywgJWxsdSB3YXlzLCBzZXRz
L2Jhbms9JWxsdSwgYnl0ZXMvYmxvY2s9JWxsdVxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBGSUVMRF9HRVQoU0lGSVZFX0NDQUNIRV9DT05GSUdfQkFOS19NQVNLLCBjZmcpLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIEZJRUxEX0dFVChTSUZJVkVfQ0NBQ0hFX0NPTkZJR19XQVlTX01B
U0ssIGNmZyksCj4gICAgICAgICAgICAgICAgICAgICAgICAgQklUX1VMTChGSUVMRF9HRVQoU0lG
SVZFX0NDQUNIRV9DT05GSUdfU0VUU19NQVNLLCBjZmcpKSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBCSVRfVUxMKEZJRUxEX0dFVChTSUZJVkVfQ0NBQ0hFX0NPTkZJR19CTEtTX01BU0ssIGNm
ZykpKTsKPgo+ICAgICAgICAgICAgICAgICBjZmcgPSByZWFkbChjY2FjaGVfYmFzZSArIFNJRklW
RV9DQ0FDSEVfV0FZRU5BQkxFKTsKPiAgICAgICAgICAgICAgICAgcHJfaW5mbygiSW5kZXggb2Yg
dGhlIGxhcmdlc3Qgd2F5IGVuYWJsZWQ6ICV1XG4iLCBjZmcpOwo+ICAgICAgICAgfQo+IEl0J2Qg
YWxzbyBiZSBnb29kIHRvIHByaW50IHRoZSBzYW1lIHRoaW5ncyBhcyB0aGUgY2NhY2hlLCBubz8K
PgoKWWVzLCBJJ2xsIGN1dCBkb3duIHRoZSBudW1iZXIgb2YgbGluZXMgYXMgdGhlIGNjYWNoZSBp
biB2Mi4gVGhhbmtzIGZvcgp0aGUgc3VnZ2VzdGlvbi4KCj4gPiArc3RhdGljIGludCBzaWZpdmVf
cGwyX2NhY2hlX2Rldl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gK3sK
PiA+ICsgICAgIHN0cnVjdCByZXNvdXJjZSAqcmVzOwo+ID4gKyAgICAgaW50IGNwdSwgcmV0ID0g
LUVJTlZBTDsKPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY3B1X25vZGUsICpwbDJfbm9k
ZTsKPiA+ICsgICAgIHN0cnVjdCBzaWZpdmVfcGwyX3N0YXRlICpwbDJfc3RhdGUgPSBOVUxMOwo+
ID4gKyAgICAgdm9pZCBfX2lvbWVtICpwbDJfYmFzZTsKPgo+IFBsZWFzZSBwaWNrIGEgc2Vuc2li
bGUgb3JkZXJpbmcgZm9yIHZhcmlhYmxlcy4gSURDIGlmIGl0IGlzIHJldmVyc2UgeG1hcwo+IHRy
ZWUsIG9yIHNvcnRpbmcgYnkgdHlwZXMsIGJ1dCB0aGlzIGp1c3Qgc2VlbXMgcXVpdGUgcmFuZG9t
Li4KPgoKWWVzLCBJJ2xsIHNvcnQgYnkgdHlwZSBpbiB2Mi4KCj4gPiArICAgICAvKiBUcmF2ZXJz
ZSBhbGwgY3B1IG5vZGVzIHRvIGZpbmQgdGhlIG9uZSBtYXBwaW5nIHRvIGl0cyBwbDIgbm9kZS4g
Ki8KPiA+ICsgICAgIGZvcl9lYWNoX2NwdShjcHUsIGNwdV9wb3NzaWJsZV9tYXNrKSB7Cj4gPiAr
ICAgICAgICAgICAgIGNwdV9ub2RlID0gb2ZfY3B1X2RldmljZV9ub2RlX2dldChjcHUpOwo+ID4g
KyAgICAgICAgICAgICBwbDJfbm9kZSA9IG9mX3BhcnNlX3BoYW5kbGUoY3B1X25vZGUsICJuZXh0
LWxldmVsLWNhY2hlIiwgMCk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIC8qIEZvdW5kIGl0ISAq
Lwo+ID4gKyAgICAgICAgICAgICBpZiAoZGV2X29mX25vZGUoJnBkZXYtPmRldikgPT0gcGwyX25v
ZGUpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKiBVc2UgY3B1IHRvIGdldCBpdHMgcGVy
Y3B1IGRhdGEgc2lmaXZlX3BsMl9zdGF0ZS4gKi8KPiA+ICsgICAgICAgICAgICAgICAgICAgICBw
bDJfc3RhdGUgPSBwZXJfY3B1X3B0cigmc2lmaXZlX3BsMl9zdGF0ZSwgY3B1KTsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgfQo+
ID4gKwo+ID4gKyAgICAgaWYgKCFwbDJfc3RhdGUpIHsKPiA+ICsgICAgICAgICAgICAgcHJfZXJy
KCJOb3QgZm91bmQgdGhlIGNvcnJlc3BvbmRpbmcgY3B1X25vZGUgaW4gZHRzLlxuIik7Cj4KPiBJ
IGRvbid0IHRoaW5rIHRoaXMgZXJyb3IgbWVzc2FnZSBpcyBnb2luZyB0byBiZSBoZWxwZnVsIGlu
IGZpZ3VyaW5nIG91dAo+IHdoZXJlIHRoZSBwcm9ibGVtIGlzIG9uIGEgbWFjaGluZSB3aXRoIG1h
bnkgb2YgdGhlIGNhY2hlcy4gTW9yZQo+IGluZm9ybWF0aW9uIGFib3V0ICp3aGljaCogY2FjaGUg
Y2F1c2VkIGl0IHdvdWxkIGJlIGdvb2QuCj4gQWxzbyBpdCBpcyBub3QgZ3JhbW1hdGljYWxseSBj
b3JyZWN0LCBpdCBzaG91bGQgcmVhZCBzb21ldGhpbmcgbGlrZQo+ICJGYWlsZWQgdG8gZmluZCBD
UFUgbm9kZSBmb3IgY2FjaGVAYWJjIiBvciBzb21ldGhpbmcgYWxvbmcgdGhvc2UgbGluZXMuCj4K
Ck9LLCBJJ2xsIHJld3JpdGUgdGhlIGVycm9yIG1lc3NhZ2UgdG8gbWFrZSBpdCBtb3JlIGhlbHBm
dWwgZm9yIHRoZSB1c2VyLgpJJ2xsIGZpeCBpdCBpbiB2Mi4gVGhhbmtzIGZvciB0aGUgc3VnZ2Vz
dGlvbi4KCj4gPiArICAgICAgICAgICAgIGdvdG8gZWFybHlfZXJyOwo+Cj4gZWFybHlfZXJyIGp1
c3QgcmV0dXJucyByZXQuIFdoeSBub3QganVzdCByZXR1cm4gdGhlIGVycm9yIGRpcmVjdGx5Pwo+
CgpZZWFoLCBpdCBjYW4ganVzdCByZXR1cm4gcmV0LiBJJ2xsIGZpeCBpdCBpbiB2Mi4KCj4gPiAr
ICAgICB9Cj4gPiArCj4gPiArICAgICAvKiBTZXQgYmFzZSBhZGRyZXNzIG9mIHNlbGVjdCBhbmQg
Y291bnRlciByZWdpc3RlcnMuICovCj4gPiArICAgICBwbDJfYmFzZSA9IGRldm1fcGxhdGZvcm1f
Z2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZyZXMpOwo+ID4gKyAgICAgaWYgKElT
X0VSUihwbDJfYmFzZSkpIHsKPiA+ICsgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihwbDJfYmFz
ZSk7Cj4gPiArICAgICAgICAgICAgIGdvdG8gZWFybHlfZXJyOwo+ID4gKyAgICAgfQo+ID4gKwo+
ID4gKyAgICAgLyogUHJpbnQgcEwyIGNvbmZpZ3MuICovCj4gPiArICAgICBwbDJfY29uZmlnX3Jl
YWQocGwyX2Jhc2UsIGNwdSk7Cj4gPiArICAgICBwbDJfc3RhdGUtPnBsMl9iYXNlID0gcGwyX2Jh
c2U7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICtlYXJseV9lcnI6Cj4gPiAr
ICAgICByZXR1cm4gcmV0Owo+ID4gK30KPgo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIHNpZml2ZV9wbDJfY2FjaGVfZHJpdmVyID0gewo+ID4gKyAgICAgLmRyaXZlciA9IHsKPiA+
ICsgICAgICAgICAgICAgICAgLm5hbWUgPSAiU2lGaXZlLXBMMi1jYWNoZSIsCj4gPiArICAgICAg
ICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IHNpZml2ZV9wbDJfY2FjaGVfb2ZfaWRzLAo+ID4g
KyAgICAgICAgICAgICAgICB9LAo+ID4gKyAgICAgLnByb2JlID0gc2lmaXZlX3BsMl9jYWNoZV9k
ZXZfcHJvYmUsCj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgaW50IF9faW5pdCBzaWZpdmVfcGwy
X2NhY2hlX2luaXQodm9pZCkKPiA+ICt7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAg
ICAgcmV0ID0gY3B1aHBfc2V0dXBfc3RhdGUoQ1BVSFBfQVBfUklTQ1ZfU0lGSVZFX1BMMl9PTkxJ
TkUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic29jL3NpZml2ZS9wbDI6b25s
aW5lIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpZml2ZV9wbDJf
b25saW5lX2NwdSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpZml2
ZV9wbDJfb2ZmbGluZV9jcHUpOwo+Cj4gR290IHNvbWUgd2VpcmQgdXNlIG9mIHdoaXRlc3BhY2Ug
aGVyZSAmIGFib3ZlLCBwbGVhc2UgcmVtb3ZlIHRoZSBzcGFjZXMuCj4KClllcywgSSdsbCByZW1v
dmUgdGhlIHdoaXRlc3BhY2UgaW4gdjIuClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkJlc3QgUmVn
YXJkcywKRXJpYyBMaW4uCgo+IENoZWVycywKPiBDb25vci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
