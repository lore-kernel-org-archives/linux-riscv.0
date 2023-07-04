Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A60DEB64DA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJhbZJYzWx8eXNqXWDTIEuX5FBmhi+COo+H2Qamt3/Q=; b=k3IAJZ1rhcWhlf
	tZacQvSXLulNj+kVXCGEul7D4mH42KiBJumkMW+Ol/K1pquzJxXV/fj1p9dU+4UVlVq5BlBzD+yGF
	JOPP7FboLc13/TQ8wZf/+H2ZThSZ1OzVYTV2xs/vCOONJMEbo//yz36+JFBECobSog/lGBoTRZHp9
	i+YbKQyBTDT6g6fUDDJ2b1QkAVlkZuL+fXXrayKTi+RUS3xmdIWh5NmMwWAMt7jQvuYnH0G3FXC5O
	az5HN7RsS7uqG7F9OW6/lp+wHZkOesAenA3OYwjBAWUGDcjhYPlP00glH/MVg/zIdRCWNZMaFzN2U
	aLN8nqZ1JNH1GHbSu81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbW6-00CaRz-1D;
	Tue, 04 Jul 2023 08:36:10 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbW3-00CaQa-1m
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 08:36:09 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-78372625badso262408939f.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688459764; x=1691051764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDbe9ViOonNjf+BBw3JuRqHmgJYIIlBwInsX6f0IRLM=;
        b=TQLyOlk0eahcefxNZxdEkYY4uoaj3wt4Qz+GBpYpx7x3IdFzZCLTbG9qi/rgajUFE1
         VOE3tHXIgM7MDq1HkgQNVl1ATHv8v5ybVbYlgVRcWzDpzp9YMFLf2e9rcPgkTHbfPaEE
         jG5pvryseieVu7Xh9BeTzC/WOO7QZX1fZW0cenBpiA9nFcgzDpWWFEa6Jy/hjW0PmRh3
         NpVCJo+lH5PFzZ35VhHXODIKwPh5vipGjWDrnCcNF6YhFdfXV3sefUGOyFJV35d8n7vx
         NRzg891eJ1pskGFhdhqeqJIeRR4DSoMykSz3NhZLnGckrmZdWMNuX79VIHlkAV1+9hW1
         Sk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688459764; x=1691051764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDbe9ViOonNjf+BBw3JuRqHmgJYIIlBwInsX6f0IRLM=;
        b=h6Ee4RSCuOFOmgzy8QhqSx4RqSIl0r4p/YhQBi3k8GkQDexn0FSE0A9kU3bRa2PyP9
         gkavaGb7CW1fow74Z3EiAg4ngqsEurmtOgXM7U9oShsZRoL4qVc4na+DG4Y9bFdJ8YAF
         jNiXdCDIyPxaKBDKvqQ00kBdBoGWdGl8OHNLV4qd2n/+GK8OxOBJ2QygiyyGr/3trsSe
         WG9RRyraHpkVmthJ+4r2Q+Xn+na3nOYfrq3WxrRvoJk/ROUaP62jDC8d5/swAVhJrJUS
         SnIC0sD60dBo9QRNSwkhHq0zjmG+soM66z8dqnoWo0iFL5cOo8XytN2xwIOeoghUipBC
         hBDw==
X-Gm-Message-State: ABy/qLbdbFHno035eAJVtPH3VLaxwbKolrOabfLmy/4TeAj4Kx3k+tX+
	ZsJmVPoYjjk7rssGZl9DVhzz49M4ujSghh9iCU4=
X-Google-Smtp-Source: APBJJlFm8e2Rtt9z4cD1DSowp2JLzmeFSI9AzgM8Vpb5g7V1rrKYRXK7jMCrC1I4ijYY626IemvqkOpwgLLhJTQz3TE=
X-Received: by 2002:a6b:6f10:0:b0:786:7389:51d7 with SMTP id
 k16-20020a6b6f10000000b00786738951d7mr7180271ioc.5.1688459764550; Tue, 04 Jul
 2023 01:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230630120433.49529-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <OS0PR01MB59223E030DAE587A49C9D0FE862EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59223E030DAE587A49C9D0FE862EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Jul 2023 09:35:38 +0100
Message-ID: <CA+V-a8um0xQ2FJyrHs=5Pc2PNvgW6B6z31zyFQ6zAYhi6=zgvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_013607_600263_E92C832D 
X-CRM114-Status: GOOD (  30.32  )
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

SGkgQmlqdSwKCk9uIFR1ZSwgSnVsIDQsIDIwMjMgYXQgOTozMOKAr0FNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5j
c2VuZ2dAZ21haWwuY29tPgo+ID4gU2VudDogRnJpZGF5LCBKdW5lIDMwLCAyMDIzIDE6MDUgUE0K
PiA+IFRvOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgTWFn
bnVzIERhbW0KPiA+IDxtYWdudXMuZGFtbUBnbWFpbC5jb20+Cj4gPiBDYzogUm9iIEhlcnJpbmcg
PHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kKPiA+IDxrcnp5c3p0b2Yu
a296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBMaW51cyBXYWxsZWlqCj4gPiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPjsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOwo+ID4gZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7
IGxpbnV4LQo+ID4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5l
bC5vcmc7IEJpanUgRGFzCj4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBQcmFiaGFr
YXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPjsKPiA+IFByYWJoYWthciBNYWhhZGV2IExh
ZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gU3ViamVjdDog
W1JGQyBQQVRDSCAxLzRdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBJbmNsdWRlIHBpbm1hcCBp
bgo+ID4gUlpHMkxfR1BJT19QT1JUX1BBQ0soKSBtYWNybwo+ID4KPiA+IEZyb206IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBD
dXJyZW50bHkgd2UgYXNzdW1lIGFsbCB0aGUgcG9ydCBwaW5zIGFyZSBzZXF1ZW50aWFsIGllIGFs
d2F5cyBQWF8wIHRvCj4gPiBQWF9uIChuPTEuLjcpIGV4aXN0LCBidXQgb24gUlovRml2ZSBTb0Mg
d2UgaGF2ZSBhZGRpdGlvbmFsIHBpbnMgUDE5XzEgdG8KPiA+IFAyOF81IHdoaWNoIGhhdmUgaG9s
ZXMgaW4gdGhlbSwgZm9yIGV4YW1wbGUgb25seSBvbmUgcGluIG9uIHBvcnQxOSBpcwo+ID4gYXZh
aWxhYmxlIGFuZCB0aGF0IGlzIFAxOV8xIGFuZCBub3QgUDE5XzAuCj4gPgo+ID4gU28gdG8gaGFu
ZGxlIHN1Y2ggY2FzZXMgaW5jbHVkZSBwaW5tYXAgZm9yIGVhY2ggcG9ydCB3aGljaCB3b3VsZAo+
ID4gaW5kaWNhdGUgdGhlIHBpbiBhdmFpbGFiaWxpdHkgb24gZWFjaCBwb3J0LiBXaXRoIHRoaXMg
d2UgYWxzbyBnZXQKPiA+IGFkZGl0aW9uYWwgcGluIHZhbGlkYXRpb24sIGZvciBleGFtcGxlIG9u
IHRoZSBSWi9HMkwgU09DIFAwIGhhcyB0d28gcGlucwo+ID4gUDBfMSBhbmQgUDBfMCBidXQgd2l0
aCBEVC9TWVNGUyBjb3VsZCB1c2UgdGhlIFAwXzItUDBfNy4KPiA+Cj4gPiBXaGlsZSBhdCBpdCwg
dXBkYXRlIHJ6ZzJsX3ZhbGlkYXRlX2dwaW9fcGluKCkgdG8gdXNlIHRoZSBwb3J0IHBpbm1hcCB0
bwo+ID4gdmFsaWRhdGUgdGhlIGdwaW8gcGluLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYyB8IDE2NyArKysr
KysrKysrKystLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygr
KSwgODEgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9y
ZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5j
dHJsLXJ6ZzJsLmMKPiA+IGluZGV4IDk1MTFkOTIwNTY1ZS4uYTBjMmU1ODVlNzY1IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jCj4gPiArKysg
Yi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMKPiA+IEBAIC02NywxMCAr
NjcsMTIgQEAKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBJTl9D
RkdfRklMQ0xLU0VMKQo+ID4KPiA+ICAvKgo+ID4gLSAqIG4gaW5kaWNhdGVzIG51bWJlciBvZiBw
aW5zIGluIHRoZSBwb3J0LCBhIGlzIHRoZSByZWdpc3RlciBpbmRleAo+ID4gLSAqIGFuZCBmIGlz
IHBpbiBjb25maWd1cmF0aW9uIGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQuCj4gPiArICogbSBpbmRp
Y2F0ZXMgdGhlIGJpdG1hcCBvZiBzdXBwb3J0ZWQgcGlucywgbiBpbmRpY2F0ZXMgbnVtYmVyCj4g
PiArICogb2YgcGlucyBpbiB0aGUgcG9ydCwgYSBpcyB0aGUgcmVnaXN0ZXIgaW5kZXggYW5kIGYg
aXMgcGluCj4gPiArICogY29uZmlndXJhdGlvbiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkLgo+ID4g
ICAqLwo+ID4gLSNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BBQ0sobiwgYSwgZikgICAgICAgICgo
KG4pIDw8IDI4KSB8ICgoYSkgPDwgMjApIHwKPiA+IChmKSkKPiA+ICsjZGVmaW5lIFJaRzJMX0dQ
SU9fUE9SVF9QQUNLKG0sIG4sIGEsIGYpICAgICAoKFVMKG0pIDw8IDMyKSB8IChVTChuKSA8PCAy
OCkKPiA+IHwgKChhKSA8PCAyMCkgfCAoZikpCj4gPiArI2RlZmluZSBSWkcyTF9HUElPX1BPUlRf
R0VUX1BJTk1BUCh4KSAgICAgICAgKCgoeCkgJiBHRU5NQVNLKDM5LCAzMikpID4+IDMyKQo+ID4g
ICNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX0dFVF9QSU5DTlQoeCkgICAgICAgICgoKHgpICYgR0VO
TUFTSygzMCwgMjgpKSA+PiAyOCkKPiA+ICAjZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9HRVRfSU5E
RVgoeCkgKCgoeCkgJiBHRU5NQVNLKDI2LCAyMCkpID4+IDIwKQo+ID4gICNkZWZpbmUgUlpHMkxf
R1BJT19QT1JUX0dFVF9DRkdTKHgpICAoKHgpICYgR0VOTUFTSygxOSwgMCkpCj4gPiBAQCAtMTI5
LDcgKzEzMSw3IEBAIHN0cnVjdCByemcybF9kZWRpY2F0ZWRfY29uZmlncyB7Cj4gPgo+ID4gIHN0
cnVjdCByemcybF9waW5jdHJsX2RhdGEgewo+ID4gICAgICAgY29uc3QgY2hhciAqIGNvbnN0ICpw
b3J0X3BpbnM7Cj4gPiAtICAgICBjb25zdCB1MzIgKnBvcnRfcGluX2NvbmZpZ3M7Cj4gPiArICAg
ICBjb25zdCB1NjQgKnBvcnRfcGluX2NvbmZpZ3M7Cj4KPiBDYW4gdGhpcyBiZSBTb0Mgc3BlY2lm
aWM/IE9ubHkgZm9yIFJaL0ZpdmUgeW91IG5lZWQgdGhpcyBjaGFuZ2VzLgo+IE90aGVycyBTb0Nz
IGxpa2UgUlove0cyTCxHMkxDLFYyTCBhbmQgRzJVTCkgc3RpbGwgd29yayB3aXRoIHUzMiogYXMg
dGhlcmUKPiBpcyBubyBob2xlcy4gV2l0aCB0aGlzIGNoYW5nZSBtZW1vcnkgdXNhZ2UgaXMgZG91
YmxlZCBhcyB3ZSBjaGFuZ2UgZnJvbQo+IHUzMi0+dTY0Lgo+ClRoaXMgaXMgdG8gYXZvaWQgd3Jp
dGluZyB0byB1bmRvY3VtZW50ZWQgcmVnaXN0ZXJzIHNvIEkgaGF2ZSBhZGRlZCBmb3IKYWxsIHRo
ZSBTb0NzLiBGb3IgZXhhbXBsZSBvbiB0aGUgUlovRzJMIFNPQyBQMCBoYXMgdHdvIHBpbnMgUDBf
MSBhbmQKUDBfMCBidXQgRFQvU1lTRlMgY291bGQgdXNlIHRoZSBQMF8yLVAwXzcuIFRoaXMgcGF0
Y2ggcmVzdHJpY3RzIHVzZXJzCnRvIHVzZSBvbmx5IGF2YWlsYWJsZSBHUElPIHBpbnMuCgpDaGVl
cnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
