Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F9C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtEwQ6H3StIW9ziyWdGsA+XZwLTyQF+fqMVsE3bcEZI=; b=gaZ24oxUz225e/
	JEBjmjxneTkXtK3ub5zcAt4dXrMrLVrmzNwsA727qGCN77J+hrKmbO/LkMndTW7OGdQS4Ju1B09Iq
	7y135RI3y15ktkiPiZABt6tvu1axsQ1pVLBIfuQBNzMhu2MIDd1SteyMICmIycMBFDHUqatJpCu3e
	Z+phl7USq3G7RFKJys2Vdgy4ULpkWW6jrIa0GAVZUeit9VObodBMMACtj4kmdvtjkjFPoTpTsepgt
	Kkj4rSzgS7vmLVoSgJ0MBxeeCjPc9e/9BtpmPpxh4prH6ptA/oAp/J7g6U7UoFIloCMhyFL1qTrm1
	dzw/I30TSjdYw08LLWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGX7O-004pgg-2d;
	Fri, 22 Dec 2023 04:26:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGX7M-004pg1-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C18F61A8D
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 04:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E88C43397
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 04:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703219193;
	bh=Xam1GJeef2fOSjd6JgqSIsumboLq0wgjV6F4XP7JXoQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FSvc8gAWrXlLXQGMPmJMVypKgyr2ONphlZWDi+tJR4XMK+FjYMzr3MuA9c5Q9/PnQ
	 hJXh1Wuemri6hQVFxlSd9zVMvhlRVPMuUpWqze4Ji4Qf1FvZfqtHt/jj+WatvIIuMn
	 5huvrz7x3hO2u5Mouc1bd1R8AxibSWReWqloDmfs/D4fjQC2PD/ikeqsoFZ+PXbsX+
	 zUPDt5CUinARyhsXBrlhOaRaTP2LG0z8Wo+bhvtLeW5leXRX+q/fI1uNb3ptkBEyCa
	 /FMvNmmqxK9MRVtZuZVs5xQKhpCv8FZndauyQma0bSz794fyTQNvzEpQzzbMhfayVk
	 hY0Zbaso2MIEQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cb21afa6c1so19537921fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 20:26:33 -0800 (PST)
X-Gm-Message-State: AOJu0YwkMmflsKWi1bgVYF0DiNjmehcHb9J3fWG6tZTPXYuIHczvKGR3
	f8qOLk6OAK4p8G2xrIllOk53kRc83K9cHlR//WQ=
X-Google-Smtp-Source: AGHT+IFwBTkKLKt1AO/kzaZ3GDS0ipHgf6dEISGW/09EWnGBoq8u2MiCTIb4MjckfGx3jXXnUwnQZusz65B9pbeB3W8=
X-Received: by 2002:a2e:bb93:0:b0:2cc:695b:a12b with SMTP id
 y19-20020a2ebb93000000b002cc695ba12bmr242244lje.85.1703219191414; Thu, 21 Dec
 2023 20:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-3-guoren@kernel.org>
 <ZYUD4C1aXWt2oFJo@LeoBras>
In-Reply-To: <ZYUD4C1aXWt2oFJo@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 12:26:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSiaNWkXS6rc+3OSZfnFqG2d7btzjrd-L1mBgAVu3ym3A@mail.gmail.com>
Message-ID: <CAJF2gTSiaNWkXS6rc+3OSZfnFqG2d7btzjrd-L1mBgAVu3ym3A@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
To: Leonardo Bras <leobras@redhat.com>
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alexghiti@rivosinc.com, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	david@redhat.com, panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com, 
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	cleger@rivosinc.com, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_202636_302976_FB3B5579 
X-CRM114-Status: GOOD (  26.72  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTE6MzXigK9BTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6NDY6NTlB
TSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9y
ZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gV2hlbiB0aGUgdGFzayBpcyBpbiBDT01QQVQg
bW9kZSwgdGhlIGFyY2hfZ2V0X21tYXBfZW5kIHNob3VsZCBiZSAyR0IsCj4gPiBub3QgVEFTS19T
SVpFXzY0LiBUaGUgVEFTS19TSVpFIGhhcyBjb250YWluZWQgaXNfY29tcGF0X21vZGUoKQo+ID4g
ZGV0ZWN0aW9uLCBzbyBjaGFuZ2UgdGhlIGRlZmluaXRpb24gb2YgU1RBQ0tfVE9QX01BWCB0byBU
QVNLX1NJWkUKPiA+IGRpcmVjdGx5Lgo+Cj4gb2sKPgo+ID4KPiA+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gPiBGaXhlczogYWRkMmNjNmI2NTE1ICgiUklTQy1WOiBtbTogUmVzdHJpY3Qg
YWRkcmVzcyBzcGFjZSBmb3Igc3YzOSxzdjQ4LHN2NTciKQo+ID4gU2lnbmVkLW9mZi1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Byb2Nlc3Nvci5oIHwgNiArKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+
ID4gaW5kZXggZjE5Zjg2MWNkYTU0Li4xZjUzOGZjNDQ0OGQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiBAQCAtMTYsMTUgKzE2LDEzIEBACj4gPgo+ID4gICNpZmRl
ZiBDT05GSUdfNjRCSVQKPiA+ICAjZGVmaW5lIERFRkFVTFRfTUFQX1dJTkRPVyAgIChVTCgxKSA8
PCAoTU1BUF9WQV9CSVRTIC0gMSkpCj4gPiAtI2RlZmluZSBTVEFDS19UT1BfTUFYICAgICAgICAg
ICAgICAgIFRBU0tfU0laRV82NAo+ID4gKyNkZWZpbmUgU1RBQ0tfVE9QX01BWCAgICAgICAgICAg
ICAgICBUQVNLX1NJWkUKPgo+IEl0IG1lYW5zIFNUQUNLX1RPUF9NQVggd2lsbCBiZSBpbiA2NEJJ
VDoKPiAtIFRBU0tfU0laRV8zMiBpZiBjb21wYXRfbW9kZT15Cj4gLSBUQVNLX1NJWkVfNjQgaWYg
Y29tcGF0X21vZGU9bgo+Cj4gTWFrZXMgc2Vuc2UgZm9yIG1lLgo+Cj4gPgo+ID4gICNkZWZpbmUg
YXJjaF9nZXRfbW1hcF9lbmQoYWRkciwgbGVuLCBmbGFncykgICAgICAgICAgICAgICAgICBcCj4g
PiAgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgbW1hcF9lbmQ7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgdHlwZW9mKGFkZHIpIF9hZGRyID0gKGFkZHIp
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAtICAgICBpZiAoKF9hZGRyKSA9PSAw
IHx8IChJU19FTkFCTEVEKENPTkZJR19DT01QQVQpICYmIGlzX2NvbXBhdF90YXNrKCkpKSBcCj4g
PiAtICAgICAgICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+IC0gICAgIGVsc2UgaWYgKChfYWRkcikgPj0gVkFfVVNFUl9TVjU3KSAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgaWYgKChfYWRkcikgPT0gMCB8fCAoX2FkZHIp
ID49IFZBX1VTRVJfU1Y1NykgICAgICAgICAgICBcCj4gPiAgICAgICAgICAgICAgIG1tYXBfZW5k
ID0gU1RBQ0tfVE9QX01BWDsgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgIGVsc2Ug
aWYgKCgoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNDgpKSAmJiAoVkFfQklUUyA+PSBWQV9CSVRTX1NW
NDgpKSBcCj4gPiAgICAgICAgICAgICAgIG1tYXBfZW5kID0gVkFfVVNFUl9TVjQ4OyAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPgo+Cj4gSSBkb24ndCB0aGluayBJIGdvdCB0aGlzIGNoYW5nZSwg
b3IgaG93IGl0J3MgY29ubmVjdGVkIHRvIHRoZSBjb21taXQgbXNnLgpUaGUgYWJvdmUgaXMganVz
dCBjb2RlIHNpbXBsaWZpY2F0aW9uOyBpZiBTVEFDS19UT1BfTUFYIGlzIFRBU0tfU0laRSwgdGhl
bgoKICAgICBpZiAoKF9hZGRyKSA9PSAwIHx8IChJU19FTkFCTEVEKENPTkZJR19DT01QQVQpICYm
IGlzX2NvbXBhdF90YXNrKCkpKSBcCiAgICAgICAgICAgICBtbWFwX2VuZCA9IFNUQUNLX1RPUF9N
QVg7ICAgICAgICAgICAgICAgICAgICAgICBcCiAgICBlbHNlIGlmICgoX2FkZHIpID49IFZBX1VT
RVJfU1Y1NykgICAgICAgICAgICAgICAgICAgICAgIFwKCmlzIGVxdWFsIHRvOgoKICAgICBpZiAo
KF9hZGRyKSA9PSAwIHx8IChfYWRkcikgPj0gVkFfVVNFUl9TVjU3KSAgICAgICAgICAgIFwKCj4K
PiBCZWZvcmU6Cj4gLSBhZGRyID09IDAsIG9yIGFkZHIgPiAyXjU3LCBvciBjb21wYXQ6IG1tYXBf
ZW5kID0gU1RBQ0tfVE9QX01BWAo+IC0gMl40OCA8IGFkZHIgPCAyXjU3OiBtbWFwX2VuZCA9IDJe
NDgKPiAtIDAgPCBhZGRyIDwgMl40OCA6IG1tYXBfZW5kID0gMl4zOQo+Cj4gTm93Ogo+IC0gYWRk
ciA9PSAwLCBvciBhZGRyID4gMl41NzogbW1hcF9lbmQgPSBTVEFDS19UT1BfTUFYCj4gLSAyXjQ4
IDwgYWRkciA8IDJeNTc6IG1tYXBfZW5kID0gMl40OAo+IC0gMCA8IGFkZHIgPCAyXjQ4IDogbW1h
cF9lbmQgPSAyXjM5Cj4KPiBJSVVDIGNvbXBhdCBtb2RlIGFkZHIgd2lsbCBiZSA8IDJeMzIsIHNv
IHdpbGwgYWx3YXlzIGhhdmUgbW1hcF9lbmQgPSAyXjM5Cj4gaWYgYWRkciAhPSAwLiBJcyB0aGF0
IGRlc2lyZWFibGU/Cj4gKGlmIG5vdCwgYWJvdmUgY2hhbmdlIGlzIHVubmVlZGVkKQo+Cj4gQWxz
bywgdW5yZWxhdGVkIHRvIHRoZSBjaGFuZ2U6Cj4gLSAyXjQ4IDwgYWRkciA8IDJeNTc6IG1tYXBf
ZW5kID0gMl40OAo+IElzIHRoZSBhYm92ZSBjb3JyZWN0Pwo+IEl0IGxvb2tzIGxpa2UgaXQgc2hv
dWxkIGJlIDJeNTcgaW5zdGVhZCwgYW5kIGEgbmV3IGlmIGNsYXVzZSBmb3IKPiAyXjMyIDwgYWRk
ciA8IDJeNDggc2hvdWxkIGhhdmUgbW1hcF9lbmQgPSAyXjQ4Lgo+Cj4gRG8gSSBnZXQgaXQgd3Jv
bmc/Ck1heWJlIEkgc2hvdWxkIG1vdmUgdGhpcyBpbnRvIHRoZSBvcHRpbWl6YXRpb24gcGFydC4K
Cj4KPiAoSSB3aWxsIHNlbmQgYW4gUkZDICdmaXhpbmcnIHRoZSBjb2RlIHRoZSB3YXkgSSBhbSB3
aGlua2luZyBpdCBzaG91bGQgbG9vawo+IGxpa2UpCj4KPiBUaGFua3MsCj4gTGVvCj4KPgo+Cj4K
Pgo+ID4gLS0KPiA+IDIuNDAuMQo+ID4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
