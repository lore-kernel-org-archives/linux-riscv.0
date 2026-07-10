Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8594C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGhXcAUn+8OpP8qEh0lZj0SQ6S+7JJxVtUPMR6rWIW8=; b=edxWGOWAhWwQ96
	UXE2bhZiGUCowc0HlqrVl7QvZt3NJedsLOVNOC38ucjab0X7bTiEkt4Eth6Uxw79Jn3a+jhaTsB5b
	tbqyzotVNuavklEo3BUVlj8l4eQfkziHceytl5PIFADiR8uCjH6atDV5L7xt7EP0ahTkvXIdspd/8
	ezkKDIVELz0YhVVdkoPTcAh0Ng/BZPyzSOdpTSLTK1q8fRBvHb3y2LRYxPV3MlRGv8/Yj0ZJG4ZNP
	O33ZAKZ+OKP/QW46OyjQ3ai05GxWvFFq6ukrUeK/NtHOJVdp46A4kkexognKt3EbxwHS3FIPrTTuX
	6hKyPlrCrLO0OtPSKHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6H5-00000004QCM-0j5k;
	Fri, 10 Jul 2026 08:07:55 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6H2-00000004QBP-1BC2
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 08:07:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5b0190a62beso149154e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 01:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783670870; cv=none;
        d=google.com; s=arc-20260327;
        b=cDANOa8ptZuewpUjdnql+fjSehfZCMS6guoIqc9l8gmet5veD+T3Z5t4bu/mywX+P8
         m8VTfW8xLCYy4fw3QNqsgRHw4MpYg11e33SCtOoiDgoTH0OGRE3c/IcAg6SqE51mYAa4
         X/Jxk34BV2qGCdWDGMndf4ZTT8/N297w6qIAQkQe6P8UZR1/RPIL6SjQsriCl21eZYDP
         SLndUnZrBM1jQ3ew0hC9hOZkbv8mcwXNhaTeAlO7XT4rUDoklAJGtI8lxi9uniup8mAj
         L+qNy22gNlHsJU9JSoC6rw3/yjIREOpwiXWhPGgm1ipnoWVZ4Pt5XBrX8E0JetNFmfBj
         u2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TgIAhkPb6XKhj25HpT0x9mH8xBPfiqrepZEoNGtW/O8=;
        fh=lAHexrkDfCeII3IEuvPr0BZYkyywaB9QAkJA4bKNhDM=;
        b=XBO3W8sL7CuO0DK5xvAer64tPY/OFj8DZHKILBTMTBXJyBxCNcz5gyCxmLRqw6GTWc
         cyKhHoT+kj0ReWRxPjOHjRbR1x+cbmLEvHdSqlMx0c8G24rHtol8RNJJ7ZcW4A542mei
         YEWtFfIVePzwhJOKXbCxpPzhaBg83PNIWBucBHxWbeFWnad1OaHU8cAzDXTL9BaVRU6I
         vqkT1BQG9VXXN/9BlQmdsLSnTIG8aEiKv0HQQUgJYUT413Rg9pt7IbLcL5gXFXI9eojV
         6Pz9nfi5QDG2N2J4wiwBTBMVK73SgD+ACPB3VBF/272OTgxCe2yN+kDBpStYFITdSKeZ
         WSzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670870; x=1784275670; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TgIAhkPb6XKhj25HpT0x9mH8xBPfiqrepZEoNGtW/O8=;
        b=emSL8j1rDbCiYM8kbea1LdSkXe3OpqIVSAlvbvB+n5DZCsNYPrHT9k0jHzkWdgNvsX
         P/H40kINBfXliJrcXD2vY63FeVgLu6/TusTM/rtFTByd6nOVeIDyEJrxTEFr+WFeGwfP
         OMQ+n0L3CxPm2w+kdXVPZnR7U2RNr85QbI1eSKnFEAarpZD3PZEi3/Z7oMn1mjmgDqSw
         FngUn/uv3kxZtohxmFjdEFJNrxNGVouzUDbMXTZE/dqAwv16N18fPOrPjYi4BXSoMPHm
         UGnAaHHzttVu47TsQaVZOf8wPSUxvjVoQi9NujziTIl+LUqh8OvBsSRmK4QkgUKQVQ7M
         U6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670870; x=1784275670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgIAhkPb6XKhj25HpT0x9mH8xBPfiqrepZEoNGtW/O8=;
        b=ZL8aNelpOxL3hmcv0VmZVq3WSNlYis0Vzr9KkHlbkSgNMQuWY2+vampvJW8WC8/5LC
         XpltS7OjrjTB0O09UNsN6VjjOOLcs7JdQKuzuQZymJKfWZj5wlfn/EYpV9V0C1IYfLlC
         CQQk6xjVO7ekqcCKd2FxBIif0z0Kjxj+igu9M9lACJGJDhvDKscL/kXaOWzG6FIbSYVl
         RkeZ5dMeVeMD28g/CH2z6F1vGkmt+bzODcLDBcrE8mwqcCDAmZRscCLAZdN3FNVWnT5r
         NpgIOsYznIkbxV5DWB0wpsQATklOc1eyGPnyL11WFqeLjBwlTmdhm7jiRxoD/URszhdM
         UC5Q==
X-Forwarded-Encrypted: i=1; AHgh+RotEey3gwnba9/1E+RtgtZXmg5eq9qvbAdGVIpAb1fs3sjw8unLRnERdpgIfxShHFbBdiOi1jHjCGEY0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxhq4uiLywReClXIK5ZoglKdpgfdLVC2GbBcDw0PdP0TFL0WOg
	0b7a1ADIwOGIGx61g3BpkCE+hCBqbSVO0BiVmxx3V5xOq8VeWcuAU3+AkVVOIDbCaKhMwrniQLs
	4qorV+dlQtHg1g3lfvR3T4vqjYZTz8YI=
X-Gm-Gg: AfdE7ckSAwsRMvlrDRdXuVKi1zraeUgkX/WfY4RyMw+NssWwJ9M4zf0PNWzIfVj/XDZ
	IcsQgUhCvmHNQQdPFazDdY7qU9Jpz+UErH2aRykO8oF/jdvny/Y30FT+PUkjBtYIgKU6O3Xtnu/
	QGuKEdwJ4muwZHEmkFyUVnwnX5vCpM1bfOd/Dycd+etNS2oEMeahCiqMWwtfNrnS15lV/MxYz+/
	iRSkWuxS+0qUFmZUGKnrB10l0J8SOsnTD+JAMWAql+0cDu3RAXqRThwKHr7D+jQ1QwpOgjV2oL5
	39q8jEG35U5dReDjiJ+/CJ9+9+b2OW2hoQX0fU8QyyRgHDtdSPpDja8=
X-Received: by 2002:a05:6512:12cd:b0:5ae:bce5:70f2 with SMTP id
 2adb3069b0e04-5b0115af09amr1512517e87.4.1783670869814; Fri, 10 Jul 2026
 01:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
 <20260610121026.1517621-2-chenyou910331@gmail.com> <akXbk7l9bZ_W0GLR@inochi.infowork>
 <akY0kY8yWAU_J3Eu@inochi.infowork>
In-Reply-To: <akY0kY8yWAU_J3Eu@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 10 Jul 2026 16:07:38 +0800
X-Gm-Features: AVVi8Ce9_hFv5Od1y6yR0G_uNpXufYnnP2SE-D2gTTyzsrjnIVfqX1AeuRABS8I
Message-ID: <CAKspUhKriysiFhu-Jk-e1u6+GBJjMV1A5a7WgiLjf=aTgTyA_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: unicorn_wang@outlook.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_010752_373902_52C1E2CF 
X-CRM114-Status: GOOD (  33.10  )
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

PiA+IElJUkMgdGhlIGxlZCBpcyBub3QgY29udHJvbGxlZCBieSB0aGUgc21hbGwgY29yZSwgc28g
dGhlIG5vZGUgc2hvdWxkCj4gPiBiZSBkZXNjcmliZWQgaW4gdGhlIGR0cy4KPiAuLi4KPiBTbyB3
aHkgbm90IGFkZGluZyB0aGUgcG9ydGU/CgpZb3UgYXJlIHJpZ2h0LCBhZGRpbmcgdGhlIHBvcnRl
IGlzIHRoZSBwcm9wZXIgZml4LiBJbiB2MyBJIGFkZGVkIHRoZQpQV1JfR1BJTyBjb250cm9sbGVy
IG5vZGUgdG8gY3YxODB4LmR0c2kgYXMgYSBzZXBhcmF0ZSBwYXRjaCwgYW5kCnJlc3RvcmVkIHRo
ZSBncGlvLWxlZHMgbm9kZSBpbiB0aGUgYm9hcmQgZHRzLiBWZXJpZmllZCBvbiB0aGUgYWN0dWFs
CmJvYXJkIHRoYXQgdGhlIGhlYXJ0YmVhdCBMRUQgd29ya3Mgd2l0aCB0aGUgbmV3IG5vZGUuCgo+
IFdoeSB5b3UgY2hhbmdlIHRoaXM/IFBsZWFzZSBkbyBub3QgdG91Y2ggdW5yZWxhdGVkIHRoaW5n
cy4KClNvcnJ5LCB0aGUgcmVtb3ZhbCBvZiB0aGUgdHJhaWxpbmcgbmV3bGluZSB3YXMgYWNjaWRl
bnRhbC4gSSBoYXZlCmRyb3BwZWQgdGhpcyB1bnJlbGF0ZWQgY2hhbmdlIGluIHYzLgoKPiBJIGd1
ZXNzIGEgcmlnaHQgY29weXJpZ2h0IGlzIG5lZWRlZCBmb3IgeW91ciBjb2RlLgoKRml4ZWQgaW4g
djMuIFNpbmNlIHRoZSBmaWxlIGlzIGRlcml2ZWQgZnJvbSBjdjE4MDBiLW1pbGt2LWR1by5kdHMs
IEkKa2VwdCB0aGUgb3JpZ2luYWwgY29weXJpZ2h0IGFuZCBhZGRlZCBteSBvd24uCgp2MyBoYXMg
YmVlbiBzZW50OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNzEwMDc1OTE3LjE1OTk2
OS0xLWNoZW55b3U5MTAzMzFAZ21haWwuY29tCgpUaGFua3MgZm9yIHRoZSByZXZpZXcsCkNoZW4t
WXUKCklub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+IOaWvCAyMDI25bm0N+aciDLm
l6XpgLHlm5sg5LiL5Y2INTo1MeWvq+mBk++8mgo+Cj4gT24gVGh1LCBKdWwgMDIsIDIwMjYgYXQg
MTE6Mzg6MDlBTSArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90ZToKPiA+IE9uIFdlZCwgSnVuIDEw
LCAyMDI2IGF0IDA4OjEwOjEwUE0gKzA4MDAsIENoZW4tWXUgWWVoIHdyb3RlOgo+ID4gPiBUaGUg
TWlsay1WIER1byAyNTZNIGlzIGEgc21hbGwgZm9ybSBmYWN0b3IgZGV2ZWxvcG1lbnQgYm9hcmQg
YmFzZWQgb24KPiA+ID4gdGhlIFNvcGhnbyBTRzIwMDIgU29DLgo+ID4gPgo+ID4gPiBUaGlzIHBh
dGNoIGFkZHMgYmFzaWMgZGV2aWNlIHRyZWUgc3VwcG9ydCBmb3IgdGhlIGJvYXJkLCBpbmNsdWRp
bmc6Cj4gPiA+IC0gVUFSVCBjb25zb2xlCj4gPiA+IC0gU0QvTU1DIGNvbnRyb2xsZXIKPiA+ID4g
LSBVU0IgaG9zdAo+ID4gPiAtIE9uYm9hcmQgYmx1ZSBzdGF0dXMgTEVEIChjb25uZWN0ZWQgdG8g
UFdSX0dQSU9bMl0gLyBwb3J0ZSAyKQo+ID4gPgo+ID4KPiA+ID4gVGVzdGVkIG9uIGFjdHVhbCBN
aWxrLVYgRHVvIDI1Nk0gaGFyZHdhcmUsIHZlcmlmaWVkIGJvb3QgdG8gc2hlbGwgYW5kCj4gPiA+
IGhlYXJ0YmVhdCBMRUQgZnVuY3Rpb25hbGl0eS4KPiA+ID4KPiA+Cj4gPiBJSVJDIHRoZSBsZWQg
aXMgbm90IGNvbnRyb2xsZWQgYnkgdGhlIHNtYWxsIGNvcmUsIHNvIHRoZSBub2RlIHNob3VsZAo+
ID4gYmUgZGVzY3JpYmVkIGluIHRoZSBkdHMuCj4gPgo+ID4gSSBzZWUgdGhlIFNhc2hpa28gZG9l
cyBwcm92aWRlIHNvbWUgZ29vZCBxdWVzdGlvbiwgcGxlYXNlIGNoZWNrLgo+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogQ2hlbi1ZdSBZZWggPGNoZW55b3U5MTAzMzFAZ21haWwuY29tPgo+ID4gPiAt
LS0KPiA+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+ID4gLSBSZW1vdmVkIHRoZSBsZWRzIG5vZGUg
YmVjYXVzZSAmcG9ydGUgaXMgbm90IHlldCBzdXBwb3J0ZWQgaW4gY3YxODB4LmR0c2ksCj4gPiA+
ICAgd2hpY2ggd291bGQgY2F1c2UgYSBkdGMgY29tcGlsYXRpb24gZXJyb3IuCj4gPiA+IC0gUmV0
YWluZWQgdGhlICZ1c2Igbm9kZSBiZWNhdXNlIGl0IGlzIGFscmVhZHkgZGVmaW5lZCBpbiBjdjE4
MHguZHRzaS4KPiA+ID4gLSBDbGVhbmVkIHVwIHRoZSB0cmFpbGluZyBibGFuayBsaW5lIGluIHRo
ZSBNYWtlZmlsZS4KPiA+ID4KPgo+Cj4gU28gd2h5IG5vdCBhZGRpbmcgdGhlIHBvcnRlPwo+Cj4g
UmVnYXJkcywKPiBJbm9jaGkKPgo+ID4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFr
ZWZpbGUgICAgICAgICAgIHwgICAzICstCj4gPiA+ICAuLi4vYm9vdC9kdHMvc29waGdvL3NnMjAw
Mi1taWxrdi1kdW8yNTZtLmR0cyAgfCAxMDggKysrKysrKysrKysrKysrKysrCj4gPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDExMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDAyLW1pbGt2LWR1
bzI1Nm0uZHRzCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL01ha2VmaWxlCj4gPiA+
IGluZGV4IDZmNjU1MjZkNDE5My4uZjk0MTVjMzBhMmM1IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9NYWtlZmlsZQo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9NYWtlZmlsZQo+ID4gPiBAQCAtMiw3ICsyLDggQEAKPiA+ID4gIGR0Yi0k
KENPTkZJR19BUkNIX1NPUEhHTykgKz0gY3YxODAwYi1taWxrdi1kdW8uZHRiCj4gPiA+ICBkdGIt
JChDT05GSUdfQVJDSF9TT1BIR08pICs9IGN2MTgxMmgtaHVhc2hhbi1waS5kdGIKPiA+ID4gIGR0
Yi0kKENPTkZJR19BUkNIX1NPUEhHTykgKz0gc2cyMDAyLWxpY2hlZXJ2LW5hbm8tYi5kdGIKPiA+
ID4gK2R0Yi0kKENPTkZJR19BUkNIX1NPUEhHTykgKz0gc2cyMDAyLW1pbGt2LWR1bzI1Nm0uZHRi
Cj4gPiA+ICBkdGItJChDT05GSUdfQVJDSF9TT1BIR08pICs9IHNnMjA0Mi1taWxrdi1waW9uZWVy
LmR0Ygo+ID4gPiAgZHRiLSQoQ09ORklHX0FSQ0hfU09QSEdPKSArPSBzZzIwNDItZXZiLXYxLmR0
Ygo+ID4gPiAgZHRiLSQoQ09ORklHX0FSQ0hfU09QSEdPKSArPSBzZzIwNDItZXZiLXYyLmR0Ygo+
ID4gPiAtZHRiLSQoQ09ORklHX0FSQ0hfU09QSEdPKSArPSBzZzIwNDQtc29waGdvLXNyZDMtMTAu
ZHRiCj4gPiA+ICtkdGItJChDT05GSUdfQVJDSF9TT1BIR08pICs9IHNnMjA0NC1zb3BoZ28tc3Jk
My0xMC5kdGIKPiA+ID4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCj4gPgo+ID4KPiA+IFdo
eSB5b3UgY2hhbmdlIHRoaXM/IFBsZWFzZSBkbyBub3QgdG91Y2ggdW5yZWxhdGVkIHRoaW5ncy4K
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDIt
bWlsa3YtZHVvMjU2bS5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDItbWls
a3YtZHVvMjU2bS5kdHMKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi40Y2Y0NDFhYjM3OTAKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDItbWlsa3YtZHVvMjU2bS5kdHMKPiA+ID4g
QEAgLTAsMCArMSwxMDggQEAKPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBNSVQpCj4gPiA+ICsvKgo+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDIzIEppc2hl
bmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+Cj4gPiBJIGd1ZXNzIGEgcmlnaHQgY29w
eXJpZ2h0IGlzIG5lZWRlZCBmb3IgeW91ciBjb2RlLgo+ID4KPiA+ID4gKyAqLwo+ID4gPiArCj4g
PiA+ICsvZHRzLXYxLzsKPiA+ID4gKwo+ID4gPiArI2luY2x1ZGUgInNnMjAwMi5kdHNpIgo+ID4g
PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgo+ID4gPiArCj4gPiA+ICsvIHsK
PiA+ID4gKyAgIG1vZGVsID0gIk1pbGstViBEdW8gMjU2TSI7Cj4gPiA+ICsgICBjb21wYXRpYmxl
ID0gIm1pbGt2LGR1bzI1Nm0iLCAic29waGdvLHNnMjAwMiI7Cj4gPiA+ICsKPiA+ID4gKyAgIGFs
aWFzZXMgewo+ID4gPiArICAgICAgICAgICBzZXJpYWwwID0gJnVhcnQwOwo+ID4gPiArICAgICAg
ICAgICBzZXJpYWwxID0gJnVhcnQxOwo+ID4gPiArICAgICAgICAgICBzZXJpYWwyID0gJnVhcnQy
Owo+ID4gPiArICAgICAgICAgICBzZXJpYWwzID0gJnVhcnQzOwo+ID4gPiArICAgICAgICAgICBz
ZXJpYWw0ID0gJnVhcnQ0Owo+ID4gPiArICAgfTsKPiA+ID4gKwo+ID4gPiArICAgY2hvc2VuIHsK
PiA+ID4gKyAgICAgICAgICAgc3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7Cj4gPiA+
ICsgICB9Owo+ID4gPiArCj4gPiA+ICsgICByZXNlcnZlZC1tZW1vcnkgewo+ID4gPiArICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ID4gKyAgICAgICAgICAgI3NpemUtY2VsbHMg
PSA8MT47Cj4gPiA+ICsgICAgICAgICAgIHJhbmdlczsKPiA+ID4gKwo+ID4gPiArICAgICAgICAg
ICBjb3Byb2Nlc3Nvcl9ydG9zOiByZWdpb25AODNmNDAwMDAgewo+ID4gPiArICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwweDgzZjQwMDAwIDB4YzAwMDA+Owo+ID4gPiArICAgICAgICAgICAgICAg
ICAgIG5vLW1hcDsKPiA+ID4gKyAgICAgICAgICAgfTsKPiA+ID4gKyAgIH07Cj4gPiA+ICt9Owo+
ID4gPiArCj4gPiA+ICsmb3NjIHsKPiA+ID4gKyAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAw
MD47Cj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICsmcGluY3RybCB7Cj4gPiA+ICsgICB1YXJ0MF9j
Zmc6IHVhcnQwLWNmZyB7Cj4gPiA+ICsgICAgICAgICAgIHVhcnQwLXBpbnMgewo+ID4gPiArICAg
ICAgICAgICAgICAgICAgIHBpbm11eCA9IDxQSU5NVVgoUElOX1VBUlQwX1RYLCAwKT4sCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFBJTk1VWChQSU5fVUFSVDBfUlgsIDApPjsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICBiaWFzLXB1bGwtdXA7Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgPSA8MTA4MDA+Owo+ID4gPiArICAgICAg
ICAgICAgICAgICAgIHBvd2VyLXNvdXJjZSA9IDwzMzAwPjsKPiA+ID4gKyAgICAgICAgICAgfTsK
PiA+ID4gKyAgIH07Cj4gPiA+ICsKPiA+ID4gKyAgIHNkaGNpMF9jZmc6IHNkaGNpMC1jZmcgewo+
ID4gPiArICAgICAgICAgICBzZGhjaTAtY2xrLXBpbnMgewo+ID4gPiArICAgICAgICAgICAgICAg
ICAgIHBpbm11eCA9IDxQSU5NVVgoUElOX1NEMF9DTEssIDApPjsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICBiaWFzLXB1bGwtdXA7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgZHJpdmUtc3Ry
ZW5ndGgtbWljcm9hbXAgPSA8MTYxMDA+Owo+ID4gPiArICAgICAgICAgICAgICAgICAgIHBvd2Vy
LXNvdXJjZSA9IDwzMzAwPjsKPiA+ID4gKyAgICAgICAgICAgfTsKPiA+ID4gKwo+ID4gPiArICAg
ICAgICAgICBzZGhjaTAtY21kLXBpbnMgewo+ID4gPiArICAgICAgICAgICAgICAgICAgIHBpbm11
eCA9IDxQSU5NVVgoUElOX1NEMF9DTUQsIDApPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICBi
aWFzLXB1bGwtdXA7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgZHJpdmUtc3RyZW5ndGgtbWlj
cm9hbXAgPSA8MTA4MDA+Owo+ID4gPiArICAgICAgICAgICAgICAgICAgIHBvd2VyLXNvdXJjZSA9
IDwzMzAwPjsKPiA+ID4gKyAgICAgICAgICAgfTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICBz
ZGhjaTAtZGF0YS1waW5zIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8UElO
TVVYKFBJTl9TRDBfRDAsIDApPiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
UElOTVVYKFBJTl9TRDBfRDEsIDApPiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8UElOTVVYKFBJTl9TRDBfRDIsIDApPiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8UElOTVVYKFBJTl9TRDBfRDMsIDApPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICBi
aWFzLXB1bGwtdXA7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgZHJpdmUtc3RyZW5ndGgtbWlj
cm9hbXAgPSA8MTA4MDA+Owo+ID4gPiArICAgICAgICAgICAgICAgICAgIHBvd2VyLXNvdXJjZSA9
IDwzMzAwPjsKPiA+ID4gKyAgICAgICAgICAgfTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICBz
ZGhjaTAtY2QtcGlucyB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFBJTk1V
WChQSU5fU0QwX0NELCAwKT47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgYmlhcy1wdWxsLXVw
Owo+ID4gPiArICAgICAgICAgICAgICAgICAgIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wID0gPDEw
ODAwPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICBwb3dlci1zb3VyY2UgPSA8MzMwMD47Cj4g
PiA+ICsgICAgICAgICAgIH07Cj4gPiA+ICsgICB9Owo+ID4gPiArfTsKPiA+ID4gKwo+ID4gPiAr
JnNkaGNpMCB7Cj4gPiA+ICsgICBwaW5jdHJsLTAgPSA8JnNkaGNpMF9jZmc+Owo+ID4gPiArICAg
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiA+ID4gKyAgIHN0YXR1cyA9ICJva2F5IjsKPiA+
ID4gKyAgIGJ1cy13aWR0aCA9IDw0PjsKPiA+ID4gKyAgIG5vLTEtOC12Owo+ID4gPiArICAgbm8t
bW1jOwo+ID4gPiArICAgbm8tc2RpbzsKPiA+ID4gKyAgIGRpc2FibGUtd3A7Cj4gPiA+ICt9Owo+
ID4gPiArCj4gPiA+ICsmdWFydDAgewo+ID4gPiArICAgcGluY3RybC0wID0gPCZ1YXJ0MF9jZmc+
Owo+ID4gPiArICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiA+ID4gKyAgIHN0YXR1cyA9
ICJva2F5IjsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gKyZ1c2Igewo+ID4gPiArICAgZHJfbW9k
ZSA9ICJob3N0IjsKPiA+ID4gKyAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ID4gK307Cj4gPiA+IC0t
Cj4gPiA+IDIuNDMuMAo+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
