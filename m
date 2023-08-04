Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0C1C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9an3PnIModLJ73iaCJXHQl3//RzWeylHSfiQdPzH3oI=; b=r1wbbdW77sv9Lv
	vpXszOExtBz7nP/YCKf6ycJJzpCssikEHmg2VL2JUvcZmYbMsVvqA7oh3xJlhV50kK3ce0P4ZnyxD
	XZU6qn+hcn8O5sCj/2unAmy2WLh5wHrsVe0OOkP0UaOHSa37bc69R+LrNLC0zqzM6QZCVK+Dm9XFz
	w4qIeKSoNNNy0G3CEqAuXpud5p1dN3+UcARrP20qmi+Na9rcw/GhU5VNO/Kj4Z2P+PiaKDnG5toMS
	acVaLkw7VXwrUrTkwCsLevtPw8E3vuGvdQzRLmBxtd5pomtfCE8SHtsY4kpZbigsZA2BHc9lx6y4/
	fC2w/GSCdVoH/fen89Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoi2-00Bid9-21;
	Fri, 04 Aug 2023 06:54:50 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRohz-00BicZ-2Q
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 06:54:49 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d3d729a08e4so2030537276.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 23:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691132085; x=1691736885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl864Gq8vHCZkWE8SgIk2gfcLPUIoY0UDu4IrEIG2Dk=;
        b=kjlK7a/wOrqXSEtLt4ROFH8j/d7kFXj68rwUI1UyMGBSuaVEKDbBeIMNDng/2NVOO4
         rC2y2cjxmF/Y2XyFx0l4V3Gc1HEUaFmcWGId+CJaqQYHLjRbOnWzms28cQaLyT/MuA85
         R+9YdJS2LE0TbvasQ5ryYuxfhxOwDE/y3sAz0sPuVmekTqArfmCLcTHQuTbsIr9fhVjZ
         3x5iBmpuSWSs5eQfqS2covmwyOpb4stwxGu1wOKkfcozr8BY5nn46FUPCvqcZrFc05vd
         sXdjMVjxHo/LAutV3T+EZlSrcA+qQrRw46UqzhXE17e3cYny74H1ohx2xTwRdmiOjx0C
         DRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691132085; x=1691736885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tl864Gq8vHCZkWE8SgIk2gfcLPUIoY0UDu4IrEIG2Dk=;
        b=HhwLdBpXMnVPcmmroad4dg00d+JwKPOVS1V9CuL8ON/pzNxBmxKpNG174kTREeFKwz
         8I5w5RYeMfgz3HuA+9CqUh0rByHYvLhBN460s6HqIUSNRBMpAwnPG/fETrd3J5SXvZta
         YzV60nr1eTNgLC9Sk2s+dU9A7TzyUNodkwz4H9zktlZgot9RcpMVKPvtlm9Elz/oibr9
         FkkVYTz2GUj8dyMmNCRx1I0vYqmoR5MmGfAmUEEAqHVGCW+IsJwhZuP3jzoCfmgwJZ8H
         tX3xLh456YNG2hGCZNlFMesasTuY8oTbBWuTKae30BzU8t5+v5cJ+RHhjA0mbO02EWBZ
         TfyA==
X-Gm-Message-State: AOJu0YyIdZt32oOTgF5MTRVMChXZm9jeBymgRyIDO5SaSyfXymVD/oI4
	/U4RCN5L4USr/FNQW54Yn2HpGrPayb2nwH0OwkO49A==
X-Google-Smtp-Source: AGHT+IEhQ+6ThvcSE8KTMZvx52SiuW4/p5gljqKGvysnVYcucKxlQcJrOxdrnH5kpTMGlkvNeQAaFzJ4yWelK3R15Kk=
X-Received: by 2002:a81:69c2:0:b0:586:24d1:338e with SMTP id
 e185-20020a8169c2000000b0058624d1338emr938772ywc.30.1691132085474; Thu, 03
 Aug 2023 23:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230803085734.340-1-nylon.chen@sifive.com> <20230803-vehicular-leggings-2830239f818a@wendy>
 <20230803-caretaker-voicing-e982f2334067@wendy> <CAHh=Yk9A3MP4Zgz53+s_ugvMtnv57igY=+Yccbp9Om9jBuxXqg@mail.gmail.com>
In-Reply-To: <CAHh=Yk9A3MP4Zgz53+s_ugvMtnv57igY=+Yccbp9Om9jBuxXqg@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 4 Aug 2023 14:54:33 +0800
Message-ID: <CAHh=Yk842gFpR1a3=KiB-Yb7T1Dqbg627MBK+hntjgMtd5z6-w@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] Change PWM-controlled LED pin active mode and algorithm
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, geert+renesas@glider.be, pavel@ucw.cz, 
	vincent.chen@sifive.com, emil.renner.berthing@canonical.com, 
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor@kernel.org, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_235447_819215_4B8A1448 
X-CRM114-Status: GOOD (  34.94  )
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

SGkgQ29ub3IsCgpUaGFuayB5b3UgZm9yIHBhdGllbnRseSBnaXZpbmcgbWUgYWR2aWNlLiBJIGFw
cHJlY2lhdGUgeW91ciBoZWxwLgoKTm90IGxvbmcgYWdvLCBJIHNhaWQsICJUaGlzIHBhdGNoIG5l
ZWRzIHRvIGJlIGFjY29tcGFuaWVkIGJ5Cm1vZGlmaWNhdGlvbnMgdG8gdGhlIHB3bV9zaWZpdmVf
YXBwbHkoKSBmdW5jdGlvbiB0byBtYWtlIHNlbnNlLiIKCkkgcmVjZW50bHkgcmV2aWV3ZWQgdGhl
IHYzIHZlcnNpb24sIGFuZCBhZnRlciBkaXNjdXNzaW5nIGl0IHdpdGggRW1pbCwKdGhlcmUgYXJl
IHNldmVyYWwgYXJlYXMgdGhhdCByZXF1aXJlIG1vZGlmaWNhdGlvbi4gSSB3aWxsIHByb3ZpZGUg
dGhlCm5lY2Vzc2FyeSBjaGFuZ2VzIGZvciBlYWNoIG9mIHRoZW06CgoxLiBwb2xhcml0eSBjaGVj
ay4gKFN1Z2dlc3Rpb24gZnJvbSBVd2UpCi0gaWYgKHN0YXRlLT5wb2xhcml0eSAhPSBQV01fUE9M
QVJJVFlfSU5WRVJTRUQpCisgaWYgKHN0YXRlLT5wb2xhcml0eSAhPSBQV01fUE9MQVJJVFlfTk9S
TUFMKQoyLiBhdm9pZCB1c2luZyBvbGQgcGVyaW9kcGVyaW9kLCBub3Qgc3RhdGUtPnBlcmlvZAot
IHBlcmlvZCA9IG1heChzdGF0ZS0+cGVyaW9kLCBkZGF0YS0+YXBwcm94X3BlcmlvZCk7Ci0gZnJh
YyA9IERJVjY0X1U2NF9ST1VORF9DTE9TRVNUKG51bSwgc3RhdGUtPnBlcmlvZCk7CisgZnJhYyA9
IERJVjY0X1U2NF9ST1VORF9DTE9TRVNUKG51bSwgcGVyaW9kKTsKMy4gYWRkIGEgY29uZGl0aW9u
YWwgY2hlY2sgY2FuIGJlIGFkZGVkIGluIHRoZSBjb2RlIHRvIHNldApkZGF0YS0+YXBwcm94X3Bl
cmlvZCB0byBzdGF0ZS0+cGVyaW9kIHdoZW4gc3RhdGUtPnBlcmlvZCBpcyBzbWFsbGVyCnRoYW4g
ZGRhdGEtPmFwcHJveF9wZXJpb2QKICBpZiAoc3RhdGUtPnBlcmlvZCAhPSBkZGF0YS0+YXBwcm94
X3BlcmlvZCkgewogIC4uLgorICAgICAgIGlmIChzdGF0ZS0+cGVyaW9kIDwgZGRhdGEtPmFwcHJv
eF9wZXJpb2QpIHsKKyAgICAgICAgICAgICAgIGRkYXRhLT5hcHByb3hfcGVyaW9kID0gc3RhdGUt
PnBlcmlvZDsKKyAgICAgICB9Ci0gICAgICAgZGRhdGEtPmFwcHJveF9wZXJpb2QgPSBzdGF0ZS0+
cGVyaW9kOworICAgICAgIHBlcmlvZCA9IGRkYXRhLT5hcHByb3hfcGVyaW9kOwoKSSB3aWxsIHVz
ZSAndW5tYXRjaGVkJyBvbiBteSBlbmQgdG8gdmVyaWZ5IGFnYWluLiBJZiB0aGVyZSBhcmUgYW55
Cm90aGVyIGVycm9ycywgZmVlbCBmcmVlIHRvIHBvaW50IHRoZW0gb3V0LiBUaGFuayB5b3UuCgpO
eWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+IOaWvCAyMDIz5bm0OOaciDTml6Ug6YCx
5LqUIOS4iuWNiDk6NDLlr6vpgZPvvJoKPgo+IEhpIENvbm9yLAo+Cj4gQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4g5pa8IDIwMjPlubQ45pyIM+aXpSDpgLHlm5sg5LiL
5Y2INTo0NOWvq+mBk++8mgo+ID4KPiA+IEhleSBOeWxvbiwKPiA+Cj4gPiAoSSB5b2lua2VkIHRo
ZSByZXBseSB0byAxLzEgdG8gaGVyZSwgYXMgaXQgbWFrZXMgbW9yZSBzZW5zZSBpbiB0aGlzCj4g
PiBjb250ZXh0KQo+ID4KPiA+ID4gT24gVGh1LCBBdWcgMDMsIDIwMjMgYXQgMTA6MTU6MTBBTSAr
MDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgQXVnIDAzLCAyMDIzIGF0
IDA0OjU3OjMzUE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiA+ID4gPiBBY2NvcmRpbmcg
dG8gdGhlIGNpcmN1aXQgZGlhZ3JhbSBvZiBVc2VyIExFRHMgLSBSR0IgZGVzY3JpYmVkIGluIHRo
ZW1hbnVhbCBoaWZpdmUtdW5sZWFzaGVkLWEwMC5wZGZbMF0gYW5kIGhpZml2ZS11bm1hdGNoZWQt
c2NoZW1hdGljcy12My5wZGZbMV0uCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIGJlaGF2aW9yIG9m
IFBXTSBpcyBhY2l0dmUtaGlnaC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBSZW1vdmVkIHBhdGNoZXM6
IDEKPiA+ID4gPiA+IE5ldyBwYXRjaGVzOiAobm9uZSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBMaW5r
czoKPiA+ID4gPiA+IC0gWzBdOiAgaHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZl
L2M1MmE4ZTMyLTA1Y2UtNGFhZi05NWM4LTdiZjg0NTNmODY5OF9oaWZpdmUtdW5sZWFzaGVkLWEw
MC1zY2hlbWF0aWNzLTEucGRmCj4gPiA+ID4gPiAtIFsxXTogIGh0dHBzOi8vc2lmaXZlLmNkbi5w
cmlzbWljLmlvL3NpZml2ZS82YTA2ZDZjMC02ZTY2LTQ5YjUtOGU5ZS1lNjhjZTc2ZjQxOTJfaGlm
aXZlLXVubWF0Y2hlZC1zY2hlbWF0aWNzLXYzLnBkZgo+ID4gPiA+ID4gLSBbMl06ICBodHRwczov
L3NpZml2ZS5jZG4ucHJpc21pYy5pby9zaWZpdmUvMWE4MmU2MDAtMWY5My00ZjQxLWIyZDgtODZl
ZDhiMTZhY2JhX2Z1NzQwLWMwMDAtbWFudWFsLXYxcDYucGRmCj4gPiA+ID4gPgo+ID4gPiA+ID4g
Q2hhbmdlZCBpbiB2NDoKPiA+ID4gPiA+ICAtIFJlbW92ZSBwcmV2aW91cyB1cGRhdGVzIHRvIHRo
ZSBQV00gYWxnb3JpdGhtLgo+ID4gPiA+Cj4gPiA+ID4gV2h5PyBJIGRvbid0IHJlY2FsbCB0aGUg
Y29uY2x1c2lvbiBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiBiZWluZyB0aGF0Cj4gPiA+ID4gdGhh
dCBwYXRjaCB3YXMgbm90IG5lZWRlZC4KPiA+ID4KPiA+ID4gSSBhcG9sb2dpemUgZm9yIGZvcmdl
dHRpbmcgYWJvdXQgdGhpcyB1cGRhdGUgZWFybGllci4gSnVzdCBub3csCj4gPiA+IEkgdHJpZWQg
dG8gcHVsbCByZWJhc2UgbWFzdGVyIGFuZCBub3RpY2VkIHRoYXQgb3RoZXIgZGV2ZWxvcGVycyBz
ZWVtCj4gPiA+IHRvIGhhdmUgbWFkZSBzb21lIGZpeGVzIHRvIHRoZSBhbGdvcml0aG0uIFVwb24g
Y2xvc2VyIGluc3BlY3Rpb24sIEkKPiA+ID4gZm91bmQgdGhhdCB0aGV5IGFkZHJlc3NlZCB0aGUg
cGFydCB3ZSBwcmV2aW91c2x5IGRpc2N1c3NlZCB3aXRoIEVtaWwKPiA+ID4gYW5kIFV3ZSwgc3Vj
aCBhcyAiZmlyc3QgcHdtX2FwcGx5X3N0YXRlLiIKPiA+ID4KPiA+ID4gVGhlcmVmb3JlLCBteSBp
bnN0aW5jdCB0ZWxscyBtZSB0aGF0IHRoZXkgaGF2ZSBhbHJlYWR5IHRha2VuIGNhcmUgb2YKPiA+
ID4gdGhlIGlzc3VlcyB3ZSBkaXNjdXNzZWQgYmVmb3JlLgo+ID4KPiA+IEkgZGlkbid0IHNlZSBh
bnl0aGluZyBpbiBsaW51eC1uZXh0IHRoYXQgd291bGQgc29sdmUgdGhpcyBwcm9ibGVtIG9mCj4g
PiBpbnZlcnNpb24uIFRoZSBsYXN0IG1lYW5pbmdmdWwgY2hhbmdlIGlzOgo+ID4gICAgICAgICBj
b21taXQgMzM0YzdiMTNkMzgzMjFlNDdkMWE1MWRiYTBiZWY5ZjRjNDAzZWM3NQo+ID4gICAgICAg
ICBBdXRob3I6ICAgICBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdA
Y2Fub25pY2FsLmNvbT4KPiA+ICAgICAgICAgQXV0aG9yRGF0ZTogV2VkIE5vdiA5IDEyOjM3OjI0
IDIwMjIgKzAxMDAKPiA+ICAgICAgICAgQ29tbWl0OiAgICAgVGhpZXJyeSBSZWRpbmcgPHRoaWVy
cnkucmVkaW5nQGdtYWlsLmNvbT4KPiA+ICAgICAgICAgQ29tbWl0RGF0ZTogTW9uIEphbiAzMCAx
Njo0Mjo0NSAyMDIzICswMTAwCj4gPgo+ID4gICAgICAgICAgICAgcHdtOiBzaWZpdmU6IEFsd2F5
cyBsZXQgdGhlIGZpcnN0IHB3bV9hcHBseV9zdGF0ZSBzdWNjZWVkCj4gPgo+ID4gd2hpY2ggcHJl
ZGF0ZXMgeW91ciB2MyBieSBxdWl0ZSBhIGJpdC4KPiA+Cj4gPiA+IEkgd2lsbCByZXZpZXcgdGhl
IGNvbmZsaWN0aW5nIHBhcnRzIGluIHRoZSBwd20tc2lmaXZlLmMgY29kZSBpbiBteSB2NAo+ID4g
PiB2ZXJzaW9uIG9uY2UgYWdhaW4gdG8gZW5zdXJlIHRoZXJlIGFyZSBubyBvbWlzc2lvbnMuIElm
IEkgZmluZCBhbnksIEkKPiA+ID4gd2lsbCBzdWJtaXQgdjUgYWNjb3JkaW5nbHkuCj4gPgo+ID4g
QW5kIGlmIHRoaXMgcGF0Y2ggaXMgb2theSBpbiBpc29sYXRpb24sIHBsZWFzZSByZXBseSBoZXJl
IGV4cGxhaW5pbmcKPiA+IHdoaWNoIGNvbW1pdCBmaXhlZCB0aGUgYWxnb3JpdGhtLCBzbyB0aGF0
IEkgY2FuIHBpY2sgaXQgdXAuCj4gVGhpcyBwYXRjaCBuZWVkcyB0byBiZSBhY2NvbXBhbmllZCBi
eSBtb2RpZmljYXRpb25zIHRvIHRoZQo+IHB3bV9zaWZpdmVfYXBwbHkoKSBmdW5jdGlvbiB0byBt
YWtlIHNlbnNlLgo+Cj4gSSB3aWxsIGRvdWJsZS1jaGVjayBhbmQgcmV2aWV3IHRoZSBwcmV2aW91
cyBkaXNjdXNzaW9ucyB0byBlbnN1cmUKPiB0aGF0LiBUaGFuayB5b3UgZm9yIHlvdXIgcmVzcG9u
c2UuCj4gPgo+ID4gVGhhbmtzLAo+ID4gQ29ub3IuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
