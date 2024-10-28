Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506C5D13590
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 01:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xu3YSZJ3SrHOCI/4tgEM2//lRlE+h4oDDYebwgONXnE=; b=uOd63/djGgUqZJ
	bn49apeYSRBqiiW6dlSGi+JktjInws0Iam/0uSHIGcVnHCtEbnrwme+Zz6+cCNqa5bvMn+l9rEgmp
	fcJDXuGKbdtDuFyNbUoWn65nR6YPuIOudwmevDhwXYYFcMmS8cwZ01uJSqxbEt3U6yGIOkbAQr/JY
	EG6fGzEDwlNc0A19gLPLi15Gm+5nnHG+k36fuz9mSv08ZKLW0hOuzdllVuutueFAuygxE4Mpx7q67
	Ve2/UayzSRumCN9zJem1XXcjog2q//Ehj+h7eSHJMGdPHUvufZDMTb7+/Jkr84rAIHIbnJT3mYtrv
	r/3PQOww0BSPzQj5xjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5EeA-00000009E00-1htz;
	Mon, 28 Oct 2024 01:34:18 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ee7-00000009DzS-0Pyw
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 01:34:16 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4613162181dso20027621cf.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 18:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730079253; x=1730684053; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd3rI0WOK8F+dWuu+ctl7DrBAqE+1P5jJI0tLZE7gbY=;
        b=D0BaRlyOqdumvWB+4IZdia1eXKWnaPQir7GGkhiRZL4CIkIh3vRCWB0PDzhbcgatAc
         bopbphfawVBmUZ5oHxmwHJE6QfceFVo3Qc7RwJBo4hujpErk1N2ZTpE82eMrUjHGA0rK
         /ynLsllSJSPB5TMtmolNQ67qThUhwhDYg6XFPKi9ehkHiBEl6bHQWunRDrlUolhhxRVo
         Ouswjl45z/9eCpBS1bKRn8BfZZ0ZzxCq84QjBrtooP1prwHoGsimX2JOOVPYt0p9he+L
         kZSSykIZSJVLUgxNXpygU5py9nIGvKClkxkEGdFvONkdjbZNtW2zslSkT9mUVB7p+So+
         LlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730079253; x=1730684053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hd3rI0WOK8F+dWuu+ctl7DrBAqE+1P5jJI0tLZE7gbY=;
        b=lTeVeisjRf9P2e8pRut53qCfOW3N/PlIO32QHIU3pYVR/PKvxOgV0BbsAMQqXcRgBw
         X1SThv/y61YRWZE5OMy0yIBI8cN2wgDP8k35Q8aWb3REGPGXrjI2zxN90MuMb3bt3pYD
         BnJ/8eX2rM/Y7k10sfi5Xdp0N4FhJkHGErkLkQf5B5MRl1QLZEVoI47C8u0k2y49AEZT
         UzOoxCiRl4ys4zsrdRD+fFApy8C8EE7W1PIP/a3VvQK0FbUn89tLkUxth0PtqQYQM1TX
         CY1qK8J2/mc8Tee+fAuTURsDcCaEOk1jXo/L/dmfkcX2LOgmrxjO1sCfdsE13gRfGDbV
         S4dA==
X-Forwarded-Encrypted: i=1; AJvYcCUlpMVXBqm6MtuYN+AllPPRFS2a2c87KxwCQ3ctJpOuGV4Z/g+19ES2+iP8jqzeT36rQ6BIpGcOOmRICw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxDRFgtsKS2QpHgZepadWga/GipThu0J+DoONN5Zg6Fc/6YBk2
	LcnfVEqThUgzTIa92FqdaFC3fR0e7AKBH9HYMW+d6Q9AVg6gJFCDQVgDOOLVw6j2A99YCXCkBLs
	mcAMibT6CZnxBHsIeTpVm+NUuN12B/2CpHUVbpw==
X-Google-Smtp-Source: AGHT+IHtuKHVvermmTR52Ox/8hxgNeJg5boJIeKQtSSzY9lSvZhTZHdDqW4DLxbe/T8oZLzhrvcXf1c2Uknf7WQ5T8g=
X-Received: by 2002:a05:622a:1aa2:b0:460:8bb8:fd79 with SMTP id
 d75a77b69052e-4613bfb6b86mr122633121cf.12.1730079253341; Sun, 27 Oct 2024
 18:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241027144448.1813611-1-guodong@riscstar.com>
 <20241027144448.1813611-6-guodong@riscstar.com> <CAJM55Z8fgPLEn=XqfV-5mVBeqpbr-S+4N=vjivofXJY36AajuA@mail.gmail.com>
In-Reply-To: <CAJM55Z8fgPLEn=XqfV-5mVBeqpbr-S+4N=vjivofXJY36AajuA@mail.gmail.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 28 Oct 2024 09:34:01 +0800
Message-ID: <CAH1PCMZ8bxG6_DoWL43E639HJ+PX-ynCSpbXPKMkRA5tCByuuQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] riscv: dts: starfive: add DeepComputing FML13V01
 board device tree
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
	Michael Zhu <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>, 
	Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>, 
	Sandie Cao <sandie.cao@deepcomputing.io>, Yuning Liang <yuning.liang@deepcomputing.io>, 
	Huiming Qiu <huiming.qiu@deepcomputing.io>, Alex Elder <elder@riscstar.com>, linux@frame.work, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_183415_428757_6F941696 
X-CRM114-Status: GOOD (  23.91  )
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

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgMTI6NDLigK9BTSBFbWlsIFJlbm5lciBCZXJ0aGluZwo8
ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBHdW9kb25nIFh1
IHdyb3RlOgo+ID4gRnJvbTogU2FuZGllIENhbyA8c2FuZGllLmNhb0BkZWVwY29tcHV0aW5nLmlv
Pgo+ID4KPiA+IFRoZSBGTUwxM1YwMSBib2FyZCBmcm9tIERlZXBDb21wdXRpbmcgaW5jb3Jwb3Jh
dGVzIGEgU3RhckZpdmUgSkg3MTEwIFNvQy4KPiA+IEl0IGlzIGEgbWFpbmJvYXJkIGRlc2lnbmVk
IGZvciB0aGUgRnJhbWV3b3JrIExhcHRvcCAxMyBDaGFzc2lzLCB3aGljaCBoYXMKPiA+IChGcmFt
ZXdvcmspIFNLVSBGUkFOSFEwMDAxLgo+ID4KPiA+IFRoZSBGTUwxM1YwMSBib2FyZCBmZWF0dXJl
czoKPiA+IC0gU3RhckZpdmUgSkg3MTEwIFNvQwo+ID4gLSBMUEREUjQgOEdCCj4gPiAtIGVNTUMg
MzJHQiBvciAxMjhHQgo+ID4gLSBRU1BJIEZsYXNoCj4gPiAtIE1pY3JvU0QgU2xvdAo+ID4gLSBQ
Q0llLWJhc2VkIFdpLUZpCj4gPiAtIDQgVVNCLUMgUG9ydHMKPiA+ICAtIFBvcnQgMTogUEQgMy4w
ICg2MFcgTWF4KSwgVVNCIDMuMiBHZW4gMSwgRFAgMS40ICg0S0AzMEh6LzIuNUtANjBIeikKPiA+
ICAtIFBvcnQgMjogUEQgMy4wICg2MFcgTWF4KSwgVVNCIDMuMiBHZW4gMQo+ID4gIC0gUG9ydCAz
ICYgNDogVVNCIDMuMiBHZW4gMQo+ID4KPiA+IENyZWF0ZSB0aGUgRFRTIGZpbGUgZm9yIHRoZSBE
ZWVwQ29tcHV0aW5nIEZNTDEzVjAxIGJvYXJkLiBCYXNlZCBvbgo+ID4gJ2poNzExMC1jb21tb24u
ZHRzaScsIHVzYjAgaXMgZW5hYmxlZCBhbmQgaXMgc2V0IHRvIG9wZXJhdGUgYXMgYSAiaG9zdCIu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU2FuZGllIENhbyA8c2FuZGllLmNhb0BkZWVwY29tcHV0
aW5nLmlvPgo+ID4gW2VsZGVyQHJpc2NzdGFyLmNvbTogcmV2aXNlZCB0aGUgZGVzY3JpcHRpb24s
IHVwZGF0ZWQgc29tZSBub2Rlc10KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggRWxkZXIgPGVsZGVy
QHJpc2NzdGFyLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlz
Y3N0YXIuY29tPgo+Cj4gVGhhbmtzISBXaWxsIHlvdSBiZSBhZGRpbmcgbW9yZSBzdHVmZiBsYXRl
ciBsaWtlIGZ4LiB0aGUgSTJTIHNvdW5kIGNoaXA/CgpZZXMhIEFueSBkZXZpY2UgdGhhdCBoYXMg
YmVlbiB0ZXN0ZWQgYW5kIHNob3duIHRvIHdvcmsgY29ycmVjdGx5IGNhbiBiZQplbmFibGVkIC8g
dXBkYXRlZCBsYXRlci4KCj4KPiBSZXZpZXdlZC1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Cj4KClRoYW5rIHlvdSBFbWlsLgoKPiA+
IC0tLQo+ID4gdjY6IERyb3BwZWQgYWxsIG5vZGUgc3RhdHVzIGRpc2FibGVkIGNvZGUKPiA+ICAg
ICBFbmFibGVkIHVzYjAgYW5kIHNldCBpdHMgb3BlcmF0aW9uIG1vZGUgdG8gImhvc3QiCj4gPiB2
NTogTm8gY2hhbmdlCj4gPiB2NDogQ2hhbmdlZCBtb2RlbCBzdHJpbmcgdG8gIkRlZXBDb21wdXRp
bmcgRk1MMTNWMDEiCj4gPiAgICAgQ2hhbmdlZCBkdHMgZmlsZW5hbWUgYW5kIE1ha2VmaWxlIGFj
Y29yZGluZ2x5IHRvIHJlZmxlY3QgdGhlIGNoYW5nZQo+ID4gICAgIFVwZGF0ZWQgZGV2aWNlIG5v
ZGVzIHN0YXR1cywgYW5kIHZlcmlmaWVkIGZ1bmN0aW9uYWwKPiA+ICAgICBSZXZpc2VkIHRoZSBj
b21taXQgbWVzc2FnZQo+ID4gdjM6IFVwZGF0ZWQgdGhlIGNvbW1pdCBtZXNzYWdlCj4gPiB2Mjog
Q2hhbmdlZCB0aGUgbW9kZWwgYW5kIGNvcG1hdGlibGUgc3RyaW5ncwo+ID4gICAgIFVwZGF0ZWQg
dGhlIGNvbW1pdCBtZXNzYWdlIHdpdGggYm9hcmQgZmVhdHVyZXMKPiA+Cj4gPiAgYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmlsZSAgICAgICAgICAgfCAgMSArCj4gPiAgLi4uL3N0
YXJmaXZlL2poNzExMC1kZWVwY29tcHV0aW5nLWZtbDEzdjAxLmR0cyAgfCAxNyArKysrKysrKysr
KysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1kZWVwY29t
cHV0aW5nLWZtbDEzdjAxLmR0cwo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3N0YXJmaXZlL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9NYWtl
ZmlsZQo+ID4gaW5kZXggN2ExNjNhN2Q2YmEzLi5iM2JiMTJmNzhlN2QgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlCj4gPiBAQCAtOCw2ICs4LDcgQEAgRFRDX0ZM
QUdTX2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEuM2IgOj0gLUAKPiA+ICBkdGItJChD
T05GSUdfQVJDSF9TVEFSRklWRSkgKz0gamg3MTAwLWJlYWdsZXYtc3RhcmxpZ2h0LmR0Ygo+ID4g
IGR0Yi0kKENPTkZJR19BUkNIX1NUQVJGSVZFKSArPSBqaDcxMDAtc3RhcmZpdmUtdmlzaW9uZml2
ZS12MS5kdGIKPiA+Cj4gPiArZHRiLSQoQ09ORklHX0FSQ0hfU1RBUkZJVkUpICs9IGpoNzExMC1k
ZWVwY29tcHV0aW5nLWZtbDEzdjAxLmR0Ygo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX1NUQVJGSVZF
KSArPSBqaDcxMTAtbWlsa3YtbWFycy5kdGIKPiA+ICBkdGItJChDT05GSUdfQVJDSF9TVEFSRklW
RSkgKz0gamg3MTEwLXBpbmU2NC1zdGFyNjQuZHRiCj4gPiAgZHRiLSQoQ09ORklHX0FSQ0hfU1RB
UkZJVkUpICs9IGpoNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEuMmEuZHRiCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtZGVlcGNvbXB1dGlu
Zy1mbWwxM3YwMS5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1kZWVw
Y29tcHV0aW5nLWZtbDEzdjAxLmR0cwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMzBiMDcxNTE5NmI2Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1kZWVwY29tcHV0aW5nLWZtbDEzdjAx
LmR0cwo+ID4gQEAgLTAsMCArMSwxNyBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wIE9SIE1JVAo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDI0IERlZXBD
b21wdXRpbmcgKEhLKSBMaW1pdGVkCj4gPiArICovCj4gPiArCj4gPiArL2R0cy12MS87Cj4gPiAr
I2luY2x1ZGUgImpoNzExMC1jb21tb24uZHRzaSIKPiA+ICsKPiA+ICsvIHsKPiA+ICsgICAgIG1v
ZGVsID0gIkRlZXBDb21wdXRpbmcgRk1MMTNWMDEiOwo+ID4gKyAgICAgY29tcGF0aWJsZSA9ICJk
ZWVwY29tcHV0aW5nLGZtbDEzdjAxIiwgInN0YXJmaXZlLGpoNzExMCI7Cj4gPiArfTsKPiA+ICsK
PiA+ICsmdXNiMCB7Cj4gPiArICAgICBkcl9tb2RlID0gImhvc3QiOwo+ID4gKyAgICAgc3RhdHVz
ID0gIm9rYXkiOwo+ID4gK307Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
