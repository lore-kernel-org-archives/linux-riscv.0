Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36430ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlg5rGevhmJQ8QjHujiKmRQCXP+Dnl/mmNZVlZ8Pd4Q=; b=epo0aSKULEy14U
	bnVhgJMwmWs4wwRgAyfKyVu2Gqws+00FaROkPwRpk7F97xiWnKwzL1Wg7g8EhmiaXta2LQkmuWjqA
	PGrVGzwXTl9n64q5bNQjMshcHlMxl/vxEQmkP2oK0Gvu57Cu6H1UhOCTWNGal7cj8bwOwNdBaxKMf
	jGV99uNAAXqrG4nom1ixeZL+LZhhuYHMWcUhK7dokUQk1o3WGKMg6jno89rRB3w1QVPNkQ65R1euH
	0DNBDgj/IZ5nUWbFrIDMjCEMJIFU1Djlyw88eXfa4C6H6kScT1idhHbSZWSP3XpYWSXlkWmNSYqg9
	zv2O4bFwE7tTDAJSNUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVWgl-00Cret-1O; Tue, 06 Sep 2022 11:24:19 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVWgj-00Crct-0J
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 11:24:18 +0000
Received: by mail-yb1-xb30.google.com with SMTP id c9so16335792ybf.5
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=5JSwL2Nl/QbXtnQEsfoWIEd7UkyZ22GYris54Ibm6bw=;
        b=SYekG2KcDIseinOxSiMnO0m/HZIT4wwSvDuh6GU+jYSKKutBbrAdF3V0Xa/nuN4xPk
         FtTzy6+bC1AQVolJ7mmqi0vF6I9oICS+l46+fTIVBpg76+eRlU7MffXYve7+4Km5Bv0U
         /2GKhOnC/aI9U7YOSL8yrxLfVoUYjl168TVnhGdL1B1S/qpxfHDO06a0trrHFCJPTeUy
         7i6Q8T+hr55izVFY9iWW6YuPEt4P46SjR3Qkwna0VykqwJdBM4OhL+Y/A77XGzbx+fAW
         8Rg5YzXXz3dCZyfZLHFtAyOeY2rhikdWqxzMey15ZYfqSnglME7D5XBekEruOHdWLfHX
         /kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5JSwL2Nl/QbXtnQEsfoWIEd7UkyZ22GYris54Ibm6bw=;
        b=jzhuFi2yTI2GUPbo+KKGUWqYWVnVY/hJ/IZCOdggQlTFOXKjWoqY/HJCPY06TbNXAT
         hl3Hz03+l0x/Jhv8NB/HGAyoq8JuF8luMDEvzXc1x4S+mM41zi3t/pcLDr1g0InnjI/6
         RtNPqxvWfHmBqZzC3r/QXiGB8WaOdVNqAldJKakYtkoVfuuu4E4hWmOPt+EQaQOcU3ut
         FJvAqHBMegwNx/qZLb9/oRxEVDl2hYdpWu9BuUKhvbg5X2u/np9rfnjihIgRd7m1soes
         EQflHKan/UkafDS1J0+OJLwBuBHyVe9+2zBX2WzWKKQJ0O1iRhAXZl0bhaeGFQ84gnPA
         bwag==
X-Gm-Message-State: ACgBeo2FIQL7/glOGQt0lKEKQDJYHDdQh1J/0vFFi6+5TIjif7vqaqot
	aP9eP/kw00IlmW0Xk3+Fm5WP0VvcuVAA1ysFLPE=
X-Google-Smtp-Source: AA6agR4z2iFehGd8W6rUIWt6hj7Kye1wZrCP7PzbK7xgVbz/0ZAyX3m53ll0X2dNbN0gcYPcCzdzSyW/8zp6eCbd0xg=
X-Received: by 2002:a25:6c09:0:b0:6a6:5b85:1e53 with SMTP id
 h9-20020a256c09000000b006a65b851e53mr14579153ybc.299.1662463454003; Tue, 06
 Sep 2022 04:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com>
In-Reply-To: <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Sep 2022 12:23:47 +0100
Message-ID: <CA+V-a8tyeufNqbLqPuKGgedXXJPxMRc2N6MjO9nCh=zvswu9NQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, atishp@rivosinc.com, apatel@ventanamicro.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_042417_069489_8EE036C8 
X-CRM114-Status: GOOD (  32.71  )
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

SGkgQ29ub3IsCgpUaGFua3MgZm9yIHRoZSBxdWljayBnbGFuY2UhCgpPbiBUdWUsIFNlcCA2LCAy
MDIyIGF0IDExOjM5IEFNIDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBP
biAwNi8wOS8yMDIyIDExOjIxLCBMYWQgUHJhYmhha2FyIHdyb3RlOgo+Cj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmgKPiA+IGluZGV4IDJhMGVmNzM4Njk1ZS4uMTBhN2M4NTVkMTI1IDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaAo+ID4gQEAgLTM3LDYgKzM3LDcgQEAgZW51bSBzYmlfZXh0X2lkIHsKPiA+
Cj4gPiAgICAgICAgICAvKiBWZW5kb3IgZXh0ZW5zaW9ucyBtdXN0IGxpZSB3aXRoaW4gdGhpcyBy
YW5nZSAqLwo+ID4gICAgICAgICAgU0JJX0VYVF9WRU5ET1JfU1RBUlQgPSAweDA5MDAwMDAwLAo+
ID4gKyAgICAgICBTQklfRVhUX0FOREVTID0gMHgwOTAwMDMxRSwKPiA+ICAgICAgICAgIFNCSV9F
WFRfVkVORE9SX0VORCA9IDB4MDlGRkZGRkYsCj4gPiAgIH07Cj4KPiBFdmVyeXRoaW5nIGVsc2Ug
YXNpZGUsIEkgYW0gdmVyeSBpbnRlcmVzdGVkIGluIHdoYXQncyBoYXBwZW5pbmcKPiBoZXJlLiBJ
J2xsIHRha2UgYSBwcm9wZXIgbG9vayB0aHJvdWdoIHRoaW5ncyBsYXRlciwgYnV0IGZvciBub3c6
Cj4KPiBGb3IgUG9sYXJGaXJlIFNvQyB3ZSBoYXZlIGFuIEludGVySGFydCBDb21tdW5pY2F0aW9u
IFNCSSBFWFQgdGhhdAo+IHdvdWxkIHdvdWxkIGxpa2UgdG8gdXBzdHJlYW0gc3VwcG9ydCBmb3Iu
IFdlIGFyZSBub3QgYWltaW5nIHRvIHB1dAo+IHRoZSBkcml2ZXIgaXRzZWxmIGluIGFyY2gvcmlz
Y3YgLSBpdCdzIGp1c3QgYSBtYWlsYm94IGRyaXZlciwgYnV0Cj4gSSB3b3VsZCBsaWtlIHRvIHVz
ZSBzYmkuaCBmb3IgZGVmaW5pbmcgdGhlIHZlbmRvciBpZCBldGMuCj4Kc2JpLmggc2VlbXMgYXBw
cm9wcmlhdGUgZm9yIG5vdywgdW5sZXNzIHRoZSBtYWludGFpbmVycyBoYXZlIG90aGVyIGlkZWFz
LgoKPiBJIGFtIG5vdCBzdXJlIGhvdyB0aGlzIGFsbCBhbGlnbnMgd2l0aDoKPiA+IFdl4oCZbGwg
b25seSBhY2NlcHQgcGF0Y2hlcyBmb3IgbmV3IG1vZHVsZXMgb3IgZXh0ZW5zaW9ucyBpZiB0aGUK
PiA+IHNwZWNpZmljYXRpb25zIGZvciB0aG9zZSBtb2R1bGVzIG9yIGV4dGVuc2lvbnMgYXJlIGxp
c3RlZCBhcyBiZWluZwo+ID4g4oCcRnJvemVu4oCdIG9yIOKAnFJhdGlmaWVk4oCdIGJ5IHRoZSBS
SVNDLVYgRm91bmRhdGlvbi4gKERldmVsb3BlcnMgbWF5LCBvZgo+ID4gY291cnNlLCBtYWludGFp
biB0aGVpciBvd24gTGludXgga2VybmVsIHRyZWVzIHRoYXQgY29udGFpbiBjb2RlIGZvcgo+ID4g
YW55IGRyYWZ0IGV4dGVuc2lvbnMgdGhhdCB0aGV5IHdpc2guKQo+ID4KPiA+IEFkZGl0aW9uYWxs
eSwgdGhlIFJJU0MtViBzcGVjaWZpY2F0aW9uIGFsbG93cyBpbXBsZW1lbnRvcnMgdG8gY3JlYXRl
Cj4gPiB0aGVpciBvd24gY3VzdG9tIGV4dGVuc2lvbnMuIFRoZXNlIGN1c3RvbSBleHRlbnNpb25z
IGFyZW7igJl0IHJlcXVpcmVkCj4gPiB0byBnbyB0aHJvdWdoIGFueSByZXZpZXcgb3IgcmF0aWZp
Y2F0aW9uIHByb2Nlc3MgYnkgdGhlIFJJU0MtVgo+ID4gRm91bmRhdGlvbi4gVG8gYXZvaWQgdGhl
IG1haW50ZW5hbmNlIGNvbXBsZXhpdHkgYW5kIHBvdGVudGlhbAo+ID4gcGVyZm9ybWFuY2UgaW1w
YWN0IG9mIGFkZGluZyBrZXJuZWwgY29kZSBmb3IgaW1wbGVtZW50b3Itc3BlY2lmaWMKPiA+IFJJ
U0MtViBleHRlbnNpb25zLCB3ZeKAmWxsIG9ubHkgdG8gYWNjZXB0IHBhdGNoZXMgZm9yIGV4dGVu
c2lvbnMgdGhhdAo+ID4gaGF2ZSBiZWVuIG9mZmljaWFsbHkgZnJvemVuIG9yIHJhdGlmaWVkIGJ5
IHRoZSBSSVNDLVYgRm91bmRhdGlvbi4KPiA+IChJbXBsZW1lbnRvcnMsIG1heSwgb2YgY291cnNl
LCBtYWludGFpbiB0aGVpciBvd24gTGludXgga2VybmVsIHRyZWVzCj4gPiBjb250YWluaW5nIGNv
ZGUgZm9yIGFueSBjdXN0b20gZXh0ZW5zaW9ucyB0aGF0IHRoZXkgd2lzaC4pCj4KPiBXaGljaCBp
cyBpbjogaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5odG1s
Cj4KSSBoYWQgY29tcGxldGVseSBtaXNzZWQgdGhpcywgdGhhbmtzIGZvciBwb2ludGluZyBpdCBv
dXQuCgo+IEl0IGlzIHVuY2xlYXIgdG8gbWUgd2hldGhlciB0aGF0IGlzIGp1c3QgZm9yIElTQSBl
eHRlbnNpb25zIG9yIGlmIHRoYXQKPiBjb3ZlcnMgU0JJIGV4dGVuc2lvbnMgdG9vLiBBdCBsZWFz
dCBmb3IgdXMsIHNpbmNlIHdlIGRvbid0IHRvdWNoIGFyY2gKPiBjb2RlIHRoZXJlIGlzIHJlbGF0
aXZlbHkgbGl0dGxlIGZyaWN0aW9uICYgdGhlcmUncyBubyBjb25jZXJucyBhYm91dAo+IHJlZHVj
aW5nIHRoZSBwb3J0YWJpbGl0eSBvZiBhIGtlcm5lbCBzaW5jZSBpdCBpcyBqdXN0IGEgcmVndWxh
ciBvbGQKPiBkcml2ZXIuCj4KPiBJIHdhcyBwbGFubmluZyBvbiBjb3JuZXJpbmcgc29tZSBwZW9w
bGUgKmNvdWdoKiBQYWxtZXIgKmNvdWdoKiBhdAo+IExQQyBhbmQgYXNraW5nIGhpbSB3aGF0IGhp
cyB0aG91Z2h0cyB3ZXJlIHRoZXJlLgo+CkkgdG9vIHdpbGwgYmUgYXR0ZW5kaW5nIHRoZSBMUEMg
KHZpcnR1YWxseSB0aG91Z2gpIGFuZCB3b3VsZCBsaWtlIHRvCmF0dGVuZC9jaGF0IG9uIHRoaXMg
dG9waWMuIFBsZWFzZSBrZWVwIG1lIHBvc3RlZC4KCj4gRldJVyB0aGlzIGlzIHdoYXQgd2UgaGF2
ZSBiZWVuIGRvaW5nOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eDRtaWNyb2NoaXAvbGludXgv
YmxvYi9saW51eC01LjE1LW1jaHAvZHJpdmVycy9tYWlsYm94L21haWxib3gtbWl2LWloYy5jI0wy
Nwo+CkZyb20gdGhlIGxvb2tzIG9mIGl0IGl0J3Mgb24gc2ltaWxhciBsaW5lcyA7KQoKPiBUaGUg
SVAgaXRzZWxmIGhhcyBub3Qgc3RhYmlsaXNlZCB5ZXQsIHNvIHdlIGhhdmUgbm90IHNlbnQgYW55
IHBhdGNoZXMKPiB5ZXQsIGJ1dCB3ZSBkbyBpbnRlbmQgZG9pbmcgc28uLi4KPgpJIHNlZS4uCgo+
IEJ1dCB5ZWEsIEknbGwgdGFrZSBhIHByb3Blcmx5IGxvb2sgYXQgd2hhdCB5b3UncmUgZG9pbmcg
aGVyZSBzb29uVE0sCj4gYWx0aG91Z2ggYXQgdGhpcyBwb2ludCBpdCBtYXkgYmUgdGhlIG90aGVy
IHNpZGUgb2YgTFBDLgo+ClRoYW5rcy4KCj4gYnR3LCB3aGVyZSBjYW4gSSBnZXQgbXkgaGFuZHMg
b24geW91ciBoYXJkd2FyZT8KPgpJIHNoYWxsIHNoYXJlIHRoZSBsaW5rIGFzIHNvb24gYXMgaXQn
cyBhdmFpbGFibGUuCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
