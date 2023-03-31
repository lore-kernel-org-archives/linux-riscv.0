Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A31C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+FDBEHSv9ReUmsegm3Wp81CTLNbcaQSEhwIdQ0Tmyk=; b=XxGBftpYxtzjnv
	o/Oi+jxS1fckRuhpb9sremPm4gMc9b0cugBVgwZSlnwnT5F9maimyhqHjzDjuqqblipggsnCA878V
	qbzm6FE6P3U26zwdnrj/D1wpopSbNZY3N+qlzk8B/Hgib2rj0RhhS0OAD2j45E9ov7wDCX+nVGEu3
	HI98aemnGZVCY6aq/xdQKwajaKEmOCqQoLaVUWtGbFpw+SnaKJ0LepnpkB9Fu9b/hXkTmroVP4z+w
	8yP/GNtRJozCYFYKarv3VXFmO1ai7nz9hMpu88z3EsGvV+ycQiiBqqYZu4EB0NuUzPz2oS6gGLtFM
	T+0Y4TueQiO21u1Ne5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piLCM-008jvn-0H;
	Fri, 31 Mar 2023 20:18:10 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piLCJ-008jur-2D
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 20:18:09 +0000
Received: by mail-il1-x136.google.com with SMTP id q5so6725409ilg.12
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680293885; x=1682885885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPBrvhS4C9fH8+UVEU/PMvBSYFvObmXLuJFfdX5dcJg=;
        b=fa4BxSIgi57AMyUtvtR9HC3rjFIwqjjdJBx5G7TB5hltEcKzhqL0+Of2hzGU+B4qa1
         WjuKLQY23FBHO0RbFKvigpoXI4CmTlJEYB75WKOyWsFiCSORU37zyymm6SJpfzVEKFU+
         aNtuQXio1QuheM23jHTqY+czwzrzHDEiCtV8Ug7j/xUfTILz7oQRTZn8Bzur3xDzZaPs
         25bXr7emhd6mLVcMV4fK9rigr3mFPD9JgzpkP6tcex3TAW1prjdNg0ZHXtb1C5MPicx0
         RcqXnyrQSv4lD/wDV/UdAK/B4WBqJ5tXk3IXAPfXEEVKiMibr6D2neFqi3y3cr+2LThu
         Eslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680293885; x=1682885885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPBrvhS4C9fH8+UVEU/PMvBSYFvObmXLuJFfdX5dcJg=;
        b=smiK4LkZTUy5axjfd3ojUhWVJ3Fb97gaPju+4mriukM8hbVgrRUe683IRdD9UCrdK/
         lBcyuFaLM5a/EWYDnP3Sq+gUU5qLIOcBD1I2gqiHSP2xGUOdm52xsdcIBHwSTo3p6wzb
         nBqd+A7J/TXm+vz3TUtErCR4Vwc3+Svwu7UDXLnXURFxJBz0unxZR+khYp15Qd5jwIvy
         Tg3SjkbA8ffvjS5Y5971o7F0BswW4Ul13t4sXGGZNKRTT2ncoVSWmzQF3wy/U+6Wrf93
         oxuZF6iL20BpTcMrDy4kfF0e+Z3tKiaB7MvDQszYh0WIaWHaQP7SKUCffpkExhubeu05
         LVMg==
X-Gm-Message-State: AAQBX9diRQqKGLBaADoJpnIeJ1TNN373OV2LvLpjV5YGASsB2Rf578V7
	E7hUNyRQuyJ30eoDp6Lmq33PYJR4mHskDuC5Km4=
X-Google-Smtp-Source: AKy350Y54OJxf8iUlKpXbAgqSiyCtgyMjlHCU15pwG/udlx4BQ0qKWVSD06JZkpsfbCXKsybTvlOQgTz5Kcxc8QZ5iQ=
X-Received: by 2002:a05:6e02:1528:b0:326:3b43:4c2a with SMTP id
 i8-20020a056e02152800b003263b434c2amr3463407ilu.1.1680293885621; Fri, 31 Mar
 2023 13:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <5468019d-e688-4019-882f-6f9611443408@spud>
In-Reply-To: <5468019d-e688-4019-882f-6f9611443408@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 31 Mar 2023 20:17:39 +0000
Message-ID: <CA+V-a8uzk7VmYRgHgXpN9Hz3VUoHU5hN7OUaLzB1KX6m=nkBzQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_131807_746448_B1EF3570 
X-CRM114-Status: GOOD (  21.97  )
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

SGkgQ29ub3IsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBGcmksIE1hciAzMSwgMjAy
MyBhdCAxOjQ14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4g
d3JvdGU6Cj4KPiBPbiBUaHUsIE1hciAzMCwgMjAyMyBhdCAwOTo0MjoxNlBNICswMTAwLCBQcmFi
aGFrYXIgd3JvdGU6Cj4KPiA+ICtTVEFOREFMT05FIENBQ0hFIENPTlRST0xMRVIgRFJJVkVSUwo+
Cj4gPiArRjogICBpbmNsdWRlL2NhY2hlCj4KPiBUaGlzIGNhbiBnbyBzaW5jZSB0aGUgZmlsZSBu
byBsb25nZXIgZXhpc3RzLgo+CkFncmVlZCBJIHdpbGwgZHJvcCB0aGlzLgoKPiA+ICtjb25maWcg
QVg0NU1QX0wyX0NBQ0hFCj4gPiArICAgICBib29sICJBbmRlcyBUZWNobm9sb2d5IEFYNDVNUCBM
MiBDYWNoZSBjb250cm9sbGVyIgo+ID4gKyAgICAgZGVwZW5kcyBvbiBSSVNDViAmJiBSSVNDVl9E
TUFfTk9OQ09IRVJFTlQKPgo+IFRoaXMgY2FuIGp1c3QgYmUgZGVwZW5kcyBvbiBSSVNDVl9ETUFf
Tk9OQ09IRVJFTlQsIHNpbmNlIHRoYXQncyBvbmx5Cj4gZGVmaW5lZCBvbiBSSVNDLVYuCj4KQWdy
ZWVkLgoKPiA+ICtzdGF0aWMgdm9pZCBheDQ1bXBfZ2V0X2wyX2xpbmVfc2l6ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsKPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZw
ZGV2LT5kZXY7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgcmV0ID0gb2ZfcHJv
cGVydHlfcmVhZF91MzIobnAsICJjYWNoZS1saW5lLXNpemUiLCAmYXg0NW1wX3ByaXYtPmF4NDVt
cF9jYWNoZV9saW5lX3NpemUpOwo+ID4gKyAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAg
ICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgY2FjaGUtbGluZS1zaXplLCBkZWZhdWx0aW5n
IHRvIDY0IGJ5dGVzXG4iKTsKPiA+ICsgICAgICAgICAgICAgYXg0NW1wX3ByaXYtPmF4NDVtcF9j
YWNoZV9saW5lX3NpemUgPSBBWDQ1TVBfQ0FDSEVfTElORV9TSVpFOwo+ID4gKyAgICAgfQo+ID4g
Kwo+ID4gKyAgICAgaWYgKGF4NDVtcF9wcml2LT5heDQ1bXBfY2FjaGVfbGluZV9zaXplICE9IEFY
NDVNUF9DQUNIRV9MSU5FX1NJWkUpIHsKPiA+ICsgICAgICAgICAgICAgZGV2X2VycihkZXYsICJF
eHBlY3RlZCBjYWNoZS1saW5lLXNpemUgdG8gYmUgNjQgYnl0ZXMgKGZvdW5kOiV1KS4gRGVmYXVs
dGluZyB0byA2NCBieXRlc1xuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICBheDQ1bXBfcHJp
di0+YXg0NW1wX2NhY2hlX2xpbmVfc2l6ZSk7Cj4gPiArICAgICAgICAgICAgIGF4NDVtcF9wcml2
LT5heDQ1bXBfY2FjaGVfbGluZV9zaXplID0gQVg0NU1QX0NBQ0hFX0xJTkVfU0laRTsKPiA+ICsg
ICAgIH0KPgo+IEkgZm9yZ2V0LCB3aHkgYXJlIHdlIGRvaW5nIHRoaXMgZGVmYXVsdGluZyByYXRo
ZXIgdGhhbiBmYWxsaW5nIG92ZXIKPiBpbW1lZGlhdGVseSBpZiB3ZSBkZXRlY3QgdGhlIHByb3Bl
cnR5IGlzIG1pc3Npbmcgb3Igd3Jvbmc/Cj4KTm8gcmVhc29uIGFzIHN1Y2ggb24gbm90IGZhaWxp
bmcgb24gcHJvcGVydHkgbm90IGV4aXN0aW5nL0ludmFsaWQuIEkKd2lsbCBiYWlsIG91dCBpbiBh
biBlcnJvciBjYXNlIG5vdy4KCj4gPiArfQo+Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByaXNj
dl9jYWNoZV9vcHMgYXg0NW1wX2Ntb19vcHMgPSB7Cj4gPiArICAgICAuY2xlYW5fcmFuZ2UgPSAm
YXg0NW1wX2NwdV9kbWFfd2JfcmFuZ2UsCj4gPiArICAgICAuaW52X3JhbmdlID0gJmF4NDVtcF9j
cHVfZG1hX2ludmFsX3JhbmdlLAo+ID4gKyAgICAgLmZsdXNoX3JhbmdlID0gJmF4NDVtcF9jcHVf
ZG1hX2ZsdXNoX3JhbmdlLAo+ID4gK307Cj4KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgaWYg
eW91ciBkcml2ZXIgZnVuY3Rpb25zIG1hdGNoZWQgdGhlIG5hbWVzIHVzZWQKPiBieSB0aGUgb3Bz
LiAoYW5kIGFzIEkgc2FpZCBvbiB0aGUgb3RoZXIgcGF0Y2gsIEkgdGhpbmsgdGhlIG9wcyBzaG91
bGQKPiBtYXRjaCB0aGUgY3Jvc3MtYXJjaCBuYW1pbmcuCj4KQWdyZWVkLCB3aWxsIGRvLgoKPiBP
dGhlcndpc2UsIGxvb2tzIGdyYW5kIC0gYWx0aG91Z2ggSSB0aGluayBJIHdhcyBtb3N0bHkgaGFw
cHkgd2l0aCB0aGUKPiBsYXN0IHJldmlzaW9uIHRvby5hCj4KSSBrbm93IHlvdSBoYWQgcHJvdmlk
ZWQgdGhlIFJCIGZvciB0aGUgbGFzdCB2ZXJzaW9uIDspCgpDaGVlcnMsClByYWJoYWthcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
