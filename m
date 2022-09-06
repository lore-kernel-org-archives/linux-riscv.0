Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD62C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 06:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNI2JQtXdAxHaEvA7hfz1+v1J6ULdxgsFaUD/x0F9ms=; b=ZaAHW5yyVVDezq
	KHOW5HSj3n2GL9/H+UFSPHh7fmntGIKXeRy63/ntaY1id/GN8+rGliibdUYNrcnrOtmkvy3k16A69
	RbLnPXHGGtZimmBX3hVpavhq+wWp3EVUyxrB0Rv0fjiPJq9H1r3d81iY9uyBsSrsnuqYl03ggXxxf
	tWE1rNVJZCe6B1bjOgh7Ri3CqAGoZGs23R9faQGTr0XSgSRsDGNC4A/k13bEXzK3NFha2lb6fjXdT
	gKuoLIotgTxxdsSRMDvf8DY3PNxmEn+CMQcgz8BRlOavyvrYXuZGlVLW41OchP8DJCd5HyGGAn5kK
	nDAcTdy+UgQLeSTlSLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVSRc-00AZ7s-Dn; Tue, 06 Sep 2022 06:52:24 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVSRR-00AYzw-0v
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 06:52:14 +0000
Received: by mail-lj1-x236.google.com with SMTP id b19so11226160ljf.8
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=pg/k2BKeuoUb9BSQqMtaRqCPumr70GT5UhAxF2oEgQM=;
        b=HktmtzseBu9APk/Y/0Enxh3WilmA1qFkbnVK6HrsFvBI/HALpUtAkYwHtx1e7KFdPQ
         CiTKoCDCTqznqfPoHCO8+XHDjN1Ls11iNAR+BgyxUwha3cDk+lhoYnnsFKqxI6IdDdkg
         ZkLfVNZoG+ej2R9DEI3nVjBEkVZoN1FyOOYpuThHUFlBbGpvXxmTaNNzf6f+ONeIrLwO
         yQN0miPVnzPMZvNpEveAgbZMHtZnXxAaATZDMXI3PtJEljUS71gnCywFBYB0u7r7xlYP
         VbWMSFEAgJdONFa/du8UGDM1XUT+WYICUb0DeGauyMd/lcoeS8bHzT/Cvm4o3/ZqbUhc
         4frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pg/k2BKeuoUb9BSQqMtaRqCPumr70GT5UhAxF2oEgQM=;
        b=V31BzJV27kWJLhzK7VwU0JdDUEhXAXMgyb5fgta48+eHBz1O/UdybzsrRevfCXK7Se
         GkqKO/zvP6fZaGfx6wZeky+IIFsGiL/qeUb+vFLiF6gKgTi3NDWJXfSoMreYWfqMQY75
         oasx+XHnTFjkFjBHRhxd/uP1p3z9LUVwivufuVFWvCmdvUPmXsneMbfOwId1C0yPT86C
         e2SuvdoA0N9tbENfMKAheAbi8F0KSfKOKEfZn5duLcsfoSM3mC5AtTATzuM021909PrT
         XmU+Bxf131Uwn8kbYlzP0R+R7DOPmMQeJGQs12/aqcSohUhaKXTYUp0ahLUj9+vWP81m
         hnGQ==
X-Gm-Message-State: ACgBeo00SXFSxqfjQvLvnwCKRTqYNHVcNMT3FM2LxD7acQUab6WKEo2r
	71uWPj3/ktJUiL/RwjxDIeOnK/Oy+d/6c5AqU1h6Lw==
X-Google-Smtp-Source: AA6agR6AVqVzW2ydtHH70ol33I0L7Cv0YvSK+JMvHBhL0OMazBsLyNbNZkfG0NYuQjNFPFGxqBsRHGebHlq4QT18KF4=
X-Received: by 2002:a05:651c:1047:b0:264:f7bb:7b6 with SMTP id
 x7-20020a05651c104700b00264f7bb07b6mr12695077ljm.275.1662447129027; Mon, 05
 Sep 2022 23:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220905083125.29426-1-zong.li@sifive.com> <20220905083125.29426-3-zong.li@sifive.com>
 <2a22c6ac-dc0e-7066-8f5f-04c428c77ee2@microchip.com> <CA+ZOyah199Vsa9haepO=uizymy947aLv3tMoO=5ye=FHqhkYCA@mail.gmail.com>
 <048bb217-e91e-b727-fcd1-e55755a87d0d@microchip.com>
In-Reply-To: <048bb217-e91e-b727-fcd1-e55755a87d0d@microchip.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 6 Sep 2022 14:51:57 +0800
Message-ID: <CANXhq0prxrXYOson4pQBq6_cWSTcZ5CZs7JyOfsFuQE8oc2pwA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] soc: sifive: ccache: Rename SiFive L2 cache to
 Composable cache.
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Zong Li <zongbox@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	krzysztof.kozlowski+dt@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greentime Hu <greentime.hu@sifive.com>, Ben Dooks <ben.dooks@sifive.com>, bp@alien8.de, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-edac@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_235213_151471_72DBD42D 
X-CRM114-Status: GOOD (  19.53  )
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

T24gVHVlLCBTZXAgNiwgMjAyMiBhdCAyOjIzIFBNIDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNv
bT4gd3JvdGU6Cj4KPiBPbiAwNi8wOS8yMDIyIDAyOjQ0LCBab25nIExpIHdyb3RlOgo+ID4gRVhU
RVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPgo+ID4gPENvbm9yLkRvb2xleUBtaWNy
b2NoaXAuY29tPiDmlrwgMjAyMuW5tDnmnIg25pelIOmAseS6jCDlh4zmmagyOjQ45a+r6YGT77ya
Cj4gPj4KPiA+PiBOb3RpY2VkIGEgYW5vdGhlciB0aGluZywgc29ycnkuLgo+ID4+Cj4gPj4gT24g
MDUvMDkvMjAyMiAwOTozMSwgWm9uZyBMaSB3cm90ZToKPiA+Pj4gRVhURVJOQUwgRU1BSUw6IERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlCj4gPj4+Cj4gPj4+IEZyb206IEdyZWVudGltZSBIdSA8Z3JlZW50aW1l
Lmh1QHNpZml2ZS5jb20+Cj4gPj4+Cj4gPj4+IFNpbmNlIGNvbXBvc2FibGUgY2FjaGUgbWF5IGJl
IEwzIGNhY2hlIGlmIHBMMiBjYWNoZSBleGlzdHMsIHdlIHNob3VsZCB1c2UKPiA+Pj4gaXRzIG9y
aWdpbmFsIG5hbWUgY29tcG9zYWJsZSBjYWNoZSB0byBwcmV2ZW50IGNvbmZ1c2lvbi4KPiA+Pj4K
PiA+Pj4gQXBhcnQgZnJvbSByZW5hbWluZywgd2UgYWxzbyBhZGQgdGhlIGNvbXBhdGlibGUgInNp
Zml2ZSxjY2FjaGUwIiBpbnRvIElECj4gPj4+IHRhYmxlLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgIGRy
aXZlcnMvc29jL3NpZml2ZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQo+ID4+
PiAgIGRyaXZlcnMvc29jL3NpZml2ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMiAr
LQo+ID4+PiAgIC4uLi97c2lmaXZlX2wyX2NhY2hlLmMgPT4gc2lmaXZlX2NjYWNoZS5jfSAgICB8
IDE2MyArKysrKysrKystLS0tLS0tLS0KPiA+Pj4gICAuLi4ve3NpZml2ZV9sMl9jYWNoZS5oID0+
IHNpZml2ZV9jY2FjaGUuaH0gICAgfCAgMTYgKy0KPiA+Pj4gICA0IGZpbGVzIGNoYW5nZWQsIDk0
IGluc2VydGlvbnMoKyksIDkzIGRlbGV0aW9ucygtKQo+ID4+PiAgIHJlbmFtZSBkcml2ZXJzL3Nv
Yy9zaWZpdmUve3NpZml2ZV9sMl9jYWNoZS5jID0+IHNpZml2ZV9jY2FjaGUuY30gKDM1JSkKPiA+
Pj4gICByZW5hbWUgaW5jbHVkZS9zb2Mvc2lmaXZlL3tzaWZpdmVfbDJfY2FjaGUuaCA9PiBzaWZp
dmVfY2NhY2hlLmh9ICgxMiUpCj4gPj4+Cj4gPj4KPiA+Pj4gLXN0YXRpYyBzc2l6ZV90IGwyX3dy
aXRlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqZGF0YSwKPiA+Pj4gK3N0
YXRpYyBzc2l6ZV90IGNjYWNoZV93cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBf
X3VzZXIgKmRhdGEsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgY291bnQs
IGxvZmZfdCAqcHBvcykKPiA+Pgo+ID4+IFlvdSBuZWVkIHRvIGZpeCB0aGUgYWxpZ25tZW50IGhl
cmUgYXMgcGVyIGNoZWNrcGF0Y2g6Cj4gPj4gQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2gg
b3BlbiBwYXJlbnRoZXNpcwo+ID4+ICMxMTI6IEZJTEU6IGRyaXZlcnMvc29jL3NpZml2ZS9zaWZp
dmVfY2NhY2hlLmM6NTM6Cj4gPj4gK3N0YXRpYyBzc2l6ZV90IGNjYWNoZV93cml0ZShzdHJ1Y3Qg
ZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKmRhdGEsCj4gPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpCj4gPj4KPiA+Cj4gPiBJJ20gbm90
IHN1cmUgd2h5IEkgZG9uJ3Qgc2VlIHRoYXQgYnkgY2hlY2twYXRjaCwgYnV0IGl0IGxvb2tzIHRo
YXQgaXQKPiA+IGlzIGFjdHVhbGx5IG1pc2FsaWdubWVudCB0aGVyZSwgSSB3b3VsZCByZS1jaGVj
ayBhbGwgaW5kZW50cyBpbgo+ID4gc291cmNlLiBUaGFua3MuCj4KPiBZb3UgbmVlZCB0byBwYXNz
IC0tc3RyaWN0IHRvIGNoZWNrcGF0Y2ggdG8gc2VlIGl0LgoKTWFueSB0aGFua3MgZm9yIHRoZSB0
aXAsIEkgY2FuIHNlZSB0aGUgbWVzc2FnZSBhZnRlciBhcHBseWluZyB0aGUgb3B0aW9uLgoKPgo+
ID4KPiA+Pj4gICB7Cj4gPj4+ICAgICAgICAgIHVuc2lnbmVkIGludCB2YWw7Cj4gPj4+IEBAIC01
Nyw3NSArNTcsNzYgQEAgc3RhdGljIHNzaXplX3QgbDJfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUs
IGNvbnN0IGNoYXIgX191c2VyICpkYXRhLAo+ID4+PiAgICAgICAgICBpZiAoa3N0cnRvdWludF9m
cm9tX3VzZXIoZGF0YSwgY291bnQsIDAsICZ2YWwpKQo+ID4+PiAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ID4+PiAgICAgICAgICBpZiAoKHZhbCA8IDB4RkYpIHx8ICh2YWwgPj0g
MHgxMDAwMCAmJiB2YWwgPCAweDEwMEZGKSkKPiA+Pj4gLSAgICAgICAgICAgICAgIHdyaXRlbCh2
YWwsIGwyX2Jhc2UgKyBTSUZJVkVfTDJfRUNDSU5KRUNURVJSKTsKPiA+Pj4gKyAgICAgICAgICAg
ICAgIHdyaXRlbCh2YWwsIGNjYWNoZV9iYXNlICsgU0lGSVZFX0NDQUNIRV9FQ0NJTkpFQ1RFUlIp
Owo+ID4+PiAgICAgICAgICBlbHNlCj4gPj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gPj4+ICAgICAgICAgIHJldHVybiBjb3VudDsKPiA+Pj4gICB9Cj4gPj4+Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
