Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A45CE7A88
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLPTP5JAPh0qSm7ZTbzCDXVDlKfG75olWHDyr7eTLjE=; b=PcjcVAFiV5QKVG
	wMFHgGuAwPZeifeHKgMURxCia0ZtJOLXyxRv7BYMwWRvw5mTUyJd/kFRZG0nvR6+3bxcKyh+l+gpQ
	KlB9y7SfZS9wK47pMn/kA70icyL0KxfogG4BH1xB39kNM4ZrzQjuD/i/xu62ojPemOXEJdttHTv21
	LabFqozZD/vM8etpqaLWf80HNEllBhd/9XSstBPEH0slZs1Wjy3MbFjTtphjjhJpykvugWtTFihHB
	6fsLEHc/H56H8uL1ehwMwEFu2IJPWcCcbBRGJuLR/Ru4qeQakZy3kXZVxSbzsbe6GfuWP6sUY5Otj
	9IssxMOLH2obIYFM2THw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxih-00Acwz-17;
	Sat, 23 Sep 2023 08:10:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxid-00AcwB-2I
	for linux-riscv@lists.infradead.org;
	Sat, 23 Sep 2023 08:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 31D61B82498
	for <linux-riscv@lists.infradead.org>; Sat, 23 Sep 2023 08:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED763C43391
	for <linux-riscv@lists.infradead.org>; Sat, 23 Sep 2023 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695456625;
	bh=PdYJS/BSnWGeDJm882oDZ5X3HgUAebcEqDMRocFoqF8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NxKXCnONpWQUcJzUO0CwrV/zN8Gq7OEH7cIKZmAcdmkkqJHOA17w5NMvrMC4ItTo8
	 8WXocXtPfLxJ5GYEoxxugWMwCC8Ep1w6apjJkY4iWiE3sNtCdwrBp/IxgQkmYCLHuz
	 Key8sDzJBqsIpt93atGjPB7pZ560Xs0by9wlhOqVGmXtPbJbCX54pPKU1C1zkvgQsk
	 g4Fw+9d0ZowHtz4sbiUa5koYgguhFBXzTonN+jbN+vqX0LH6mNl5FtfR0kY3GMArKx
	 29xKJ8CaG8QiBGNwEUf9EMf/Fb66nTFBTIV6O0KJnaUU9FJSIEmAMwAokDW1YadJ99
	 N5UNGPfBLNTiQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-530ce262ab2so3733254a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 23 Sep 2023 01:10:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YyWfAUFGAt+uJUBHIQQtCZrf+Qmm+N8otf6i6QpB1ZAjJUn8fNG
	fim4LGjfy7MMEffQJQBxZWTHt1As1JIej6Odx/g=
X-Google-Smtp-Source: AGHT+IGDzGapxUFpYPEZmxWl/fy6N5eTHbocFn+xPB3cVu16L7RwAdSEIB8UWAuFxHd1jSqiRyBMUlDgbWJMjo06pv4=
X-Received: by 2002:aa7:d4c5:0:b0:530:be79:49e7 with SMTP id
 t5-20020aa7d4c5000000b00530be7949e7mr1339748edr.37.1695456623284; Sat, 23 Sep
 2023 01:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <20230921-th1520-mmc-v1-1-49f76c274fb3@baylibre.com> <20230922-parish-ice-a22e93dc3027@spud>
 <ZQ2tP48Z19C5xRug@x1>
In-Reply-To: <ZQ2tP48Z19C5xRug@x1>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 23 Sep 2023 16:10:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSeKnB=Zc6o1wJAOyax7d=RmDJ0o8PSOfkVo5BYVc=sAw@mail.gmail.com>
Message-ID: <CAJF2gTSeKnB=Zc6o1wJAOyax7d=RmDJ0o8PSOfkVo5BYVc=sAw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head TH1520 support
To: Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_011028_021647_5F55F4EB 
X-CRM114-Status: GOOD (  25.75  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMTE6MTjigK9QTSBEcmV3IEZ1c3RpbmkgPGRmdXN0aW5p
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAxMDo1Nzoz
NkFNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBIZXkgRHJldywKPiA+Cj4gPiBPbiBU
aHUsIFNlcCAyMSwgMjAyMyBhdCAwNjo0OTo0OFBNIC0wNzAwLCBEcmV3IEZ1c3Rpbmkgd3JvdGU6
Cj4gPiA+IEFkZCBjb21wYXRpYmxlIHZhbHVlIGZvciB0aGUgVC1IZWFkIFRIMTUyMCBkd2Ntc2hj
IGNvbnRyb2xsZXIgYW5kIGFkZAo+ID4gPiB0aGVhZCxwaHktcHVsbC11cCBwcm9wZXJ0eS4KPiA+
ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxkZnVzdGluaUBiYXlsaWJyZS5j
b20+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21t
Yy9zbnBzLGR3Y21zaGMtc2RoY2kueWFtbCB8IDQgKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zbnBzLGR3Y21zaGMtc2RoY2kueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvc25wcyxkd2Ntc2hjLXNkaGNpLnlhbWwKPiA+
ID4gaW5kZXggYTQzZWI4MzdmOGRhLi40NmI3NjhkNDY3MTIgMTAwNjQ0Cj4gPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvc25wcyxkd2Ntc2hjLXNkaGNpLnlh
bWwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zbnBz
LGR3Y21zaGMtc2RoY2kueWFtbAo+ID4gPiBAQCAtMTksNiArMTksNyBAQCBwcm9wZXJ0aWVzOgo+
ID4gPiAgICAgICAgLSByb2NrY2hpcCxyazM1NjgtZHdjbXNoYwo+ID4gPiAgICAgICAgLSByb2Nr
Y2hpcCxyazM1ODgtZHdjbXNoYwo+ID4gPiAgICAgICAgLSBzbnBzLGR3Y21zaGMtc2RoY2kKPiA+
ID4gKyAgICAgIC0gdGhlYWQsdGgxNTIwLWR3Y21zaGMKPiA+ID4KPiA+ID4gICAgcmVnOgo+ID4g
PiAgICAgIG1heEl0ZW1zOiAxCj4gPiA+IEBAIC02MCw2ICs2MSw5IEBAIHByb3BlcnRpZXM6Cj4g
PiA+ICAgICAgZGVzY3JpcHRpb246IFNwZWNpZnkgdGhlIG51bWJlciBvZiBkZWxheSBmb3IgdHgg
c2FtcGxpbmcuCj4gPiA+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvdWludDgKPiA+ID4KPiA+ID4gKyAgdGhlYWQscGh5LXB1bGwtdXA6Cj4gPiA+ICsgICAgZGVz
Y3JpcHRpb246IEVuYWJsZSB3ZWFrIHB1bGwtdXAgb24gUEhZIHBhZHMKPiA+ID4gKyAgICB0eXBl
OiBib29sZWFuCj4gPgo+ID4gV2h5IGlzIHRoZSB3ZWFrIHB1bGwtdXAgcmVxdWlyZWQ/IEhvdyB3
b3VsZCB0aGUgZHRzIGF1dGhvciBrbm93IGlmIHRoZXkKPiA+IG5lZWQgdG8gdXNlIHRoaXMgcHJv
cGVydHk/Cj4KPiBUaGlzIGlzIGEgZ29vZCBxdWVzdGlvbiwgYW5kIEkgZG9uJ3QgaGF2ZSBhIGdv
b2QgcmVhc29uIGJleW9uZCBpdCBpcwo+IHdoYXQgdGhlIHZlbmRvciBTREsgd2FzIGRvaW5nLgo+
Cj4gVGhlcmUgYXJlIG9ubHkgdHdvIGJvYXJkcyByaWdodCBub3cgdXNpbmcgdGhlIFRIMTUyMCB0
aGF0IEkga25vdyBvZi4KPiBCb3RoIHRoZSBMUGk0YSBbMV0gYW5kIHRoZSBBaGVhZCBbMl0gaGF2
ZSB0aGUgcHVsbC11cCBwcm9wZXJ0eSBzZXQgb24KPiBhbGwgdGhlIG1tYyBjb250cm9sbGVyIG5v
ZGVzIHRoZWlyIGRvd25zdHJlYW0gZGV2aWNlIHRyZWVzLgo+Cj4gUm9iIHN1Z2dlc3RlZCBvbiAj
ZGV2aWNldHJlZSB0aGF0IGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8ganVzdCBlbmFibGUgaXQKPiBp
biB0aGUgZHJpdmVyIGFuZCBkaXNhYmxlIHN1cHBvcnQgd2hlbiBuZWVkZWQuIEkgbGlrZSB0aGlz
IGlkZWEgYXMgaXQKPiB3aWxsIHNpbXBsaWZ5IHRoaXMgYmluZGluZyBwYXRjaCBhbmQgdGhlIGNv
ZGUgaW4gdGhlIGRyaXZlciBwYXRjaC4KSXQncyBmb3IgdGhlIFBIWSBkZWJ1Zy4gWW91IGNvdWxk
IGRpcmVjdGx5IHJlbW92ZSB0aGVtLCBvciBrZWVwIGl0CndpdGggbm8tcHVsbC11cCBmbGFnLCB0
aGVuIG5vIHB1bGwtdXAgZmxhZyBpbiB0aGUgZHRzIGZvciBkZWZhdWx0Li4KCnN0YXRpYyB2b2lk
IHNkaGNpX3BoeV8xXzh2X2luaXRfbm9fcHVsbChzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCkKewog
ICAgICAgIHVpbnQzMl90IHZhbDsKICAgICAgICBzZGhjaV93cml0ZWwoaG9zdCwgMSwgRFdDX01T
SENfUFRSX1BIWV9SKTsKICAgICAgICBzZGhjaV93cml0ZWIoaG9zdCwgMSA8PCA0LCBQSFlfU0RD
TEtETF9DTkZHX1IpOwogICAgICAgIHNkaGNpX3dyaXRlYihob3N0LCAweDQwLCBQSFlfU0RDTEtE
TF9EQ19SKTsKCiAgICAgICAgdmFsID0gc2RoY2lfcmVhZGIoaG9zdCwgUEhZX1NEQ0xLRExfQ05G
R19SKTsKICAgICAgICB2YWwgJj0gfigxIDw8IDQpOwogICAgICAgIHNkaGNpX3dyaXRlYihob3N0
LCB2YWwsIFBIWV9TRENMS0RMX0NORkdfUik7CgoKICAgICAgICB2YWwgPSBzZGhjaV9yZWFkdyho
b3N0LCBQSFlfQ01EUEFEX0NORkdfUik7CiAgICAgICAgc2RoY2lfd3JpdGV3KGhvc3QsIHZhbCB8
IDEsIFBIWV9DTURQQURfQ05GR19SKTsKCiAgICAgICAgdmFsID0gc2RoY2lfcmVhZHcoaG9zdCwg
UEhZX0RBVEFQQURfQ05GR19SKTsKICAgICAgICBzZGhjaV93cml0ZXcoaG9zdCwgdmFsIHwgMSwg
UEhZX0RBVEFQQURfQ05GR19SKTsKCiAgICAgICAgdmFsID0gc2RoY2lfcmVhZHcoaG9zdCwgUEhZ
X1JTVE5QQURfQ05GR19SKTsKICAgICAgICBzZGhjaV93cml0ZXcoaG9zdCwgdmFsIHwgMSwgUEhZ
X1JTVE5QQURfQ05GR19SKTsKCiAgICAgICAgdmFsID0gc2RoY2lfcmVhZHcoaG9zdCwgUEhZX1NU
QlBBRF9DTkZHX1IpOwogICAgICAgIHNkaGNpX3dyaXRldyhob3N0LCB2YWwgfCAxLCBQSFlfU1RC
UEFEX0NORkdfUik7CgogICAgICAgIHZhbCA9IHNkaGNpX3JlYWRiKGhvc3QsIFBIWV9ETExfQ1RS
TF9SKTsKICAgICAgICBzZGhjaV93cml0ZWIoaG9zdCwgdmFsIHwgMSwgUEhZX0RMTF9DVFJMX1Ip
Owp9CgpzdGF0aWMgdm9pZCBzZGhjaV9waHlfM18zdl9pbml0X25vX3B1bGwoc3RydWN0IHNkaGNp
X2hvc3QgKmhvc3QpCnsKICAgICAgICB1aW50MzJfdCB2YWw7CiAgICAgICAgc2RoY2lfd3JpdGVs
KGhvc3QsIDEsIERXQ19NU0hDX1BUUl9QSFlfUik7CiAgICAgICAgc2RoY2lfd3JpdGViKGhvc3Qs
IDEgPDwgNCwgUEhZX1NEQ0xLRExfQ05GR19SKTsKICAgICAgICBzZGhjaV93cml0ZWIoaG9zdCwg
MHg0MCwgUEhZX1NEQ0xLRExfRENfUik7CgogICAgICAgIHZhbCA9IHNkaGNpX3JlYWRiKGhvc3Qs
IFBIWV9TRENMS0RMX0NORkdfUik7CiAgICAgICAgdmFsICY9IH4oMSA8PCA0KTsKICAgICAgICBz
ZGhjaV93cml0ZWIoaG9zdCwgdmFsLCBQSFlfU0RDTEtETF9DTkZHX1IpOwoKICAgICAgICB2YWwg
PSBzZGhjaV9yZWFkdyhob3N0LCBQSFlfQ01EUEFEX0NORkdfUik7CiAgICAgICAgc2RoY2lfd3Jp
dGV3KGhvc3QsIHZhbCB8IDIsIFBIWV9DTURQQURfQ05GR19SKTsKCiAgICAgICAgdmFsID0gc2Ro
Y2lfcmVhZHcoaG9zdCwgUEhZX0RBVEFQQURfQ05GR19SKTsKICAgICAgICBzZGhjaV93cml0ZXco
aG9zdCwgdmFsIHwgMiwgUEhZX0RBVEFQQURfQ05GR19SKTsKCiAgICAgICAgdmFsID0gc2RoY2lf
cmVhZHcoaG9zdCwgUEhZX1JTVE5QQURfQ05GR19SKTsKICAgICAgICBzZGhjaV93cml0ZXcoaG9z
dCwgdmFsIHwgMiwgUEhZX1JTVE5QQURfQ05GR19SKTsKCiAgICAgICAgdmFsID0gc2RoY2lfcmVh
ZHcoaG9zdCwgUEhZX1NUQlBBRF9DTkZHX1IpOwogICAgICAgIHNkaGNpX3dyaXRldyhob3N0LCB2
YWwgfCAyLCBQSFlfU1RCUEFEX0NORkdfUik7CgogICAgICAgIHZhbCA9IHNkaGNpX3JlYWRiKGhv
c3QsIFBIWV9ETExfQ1RSTF9SKTsKICAgICAgICBzZGhjaV93cml0ZWIoaG9zdCwgdmFsIHwgMSwg
UEhZX0RMTF9DVFJMX1IpOwp9Cgo+Cj4gVGhhbmtzLAo+IERyZXcKPgo+IFsxXSBodHRwczovL2dp
dC5iZWFnbGVib2FyZC5vcmcvYmVhZ2xldi1haGVhZC9CZWFnbGVCb2FyZC1EZXZpY2VUcmVlcy8t
L2Jsb2IvdjUuMTAueC10aS11bmlmaWVkL3NyYy9yaXNjdi9saWdodC1iZWFnbGUtcmVmLmR0cwo+
IFsyXSBodHRwczovL2dpdGh1Yi5jb20vcmV2eW9zL3RoZWFkLWtlcm5lbC9ibG9iL2xwaTRhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvbGlnaHQtbHBpNGEtcmVmLmR0cwoKCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
