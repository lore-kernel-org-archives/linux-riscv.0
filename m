Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A785CE7A8C
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Sep 2023 21:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6cwdfZkhNDFczyV5kHIJhjonGdniNpFbK+7qEZviC8=; b=oCb44TQfoVxhtj
	Vyfb8FBdQ94k9FYxapcVYT1y5Ge7Zu0cRyEXICLto9b5kehdQLQTxlaBus/yrDGPgbB/cwsjs4INC
	PYYsbzY0LFYvanNnxJLng7a/Ms+Q4l4YnYoA52y59CtGOj2YtbQfYVYDhyfiy5Uoim/E6E3pd4xPe
	F9+BE7kS8UJPCTnplawXXWlLcg2pyR2c+c7ku4dkUUmBY1n103q6ffzrsMULjbQPjnLjvTHsWmJ84
	YHq4DWyBdO5L+eB/5eXPU5sPEvclhUTEIuc3ixM37VG/GzoSivcQ62OGeFXVSsFvJq6vYE6scM3TP
	o9bVUKknoalFGg/OXH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkWHG-00Crd7-1l;
	Sun, 24 Sep 2023 21:04:30 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkWHC-00CrcO-0e
	for linux-riscv@lists.infradead.org;
	Sun, 24 Sep 2023 21:04:29 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-57bb3872ff4so920607eaf.0
        for <linux-riscv@lists.infradead.org>; Sun, 24 Sep 2023 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695589463; x=1696194263; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g0+IXnh6MdnWPnySyYwtUtqhST9oEZJulxHM6uyxvQ4=;
        b=ijUonLmhaL+vWPWx9WBpFvTJo3m6MEphsjgMXtxaukMO1lyrLpfnc/erkDSiGm2ISa
         ElbDN1KIi5k1B3pxjh70DWBjU7ZkJ0ILj40L5dhGVJ4/BlggPQlwti3jEwDJX6bIYpAj
         S87f2rbcyTmh3fOf21Jg+lAD5nF8XjzFizaXIIWumzdDyGIk8fFXDsOeC9qfB0U+SbtQ
         28HbrX1EX1/w2mygC+1zYbBjuSnWsJmAYYKaC8a7qm0mOK+BOMteOa86CrZmPoX2os9R
         I09sQ7Dl+rSa0K+a0ZLUUYnusnpB9fv+ZWIyifp4ERUIIRaEf0RdeViZ6JSpBB5iIY7O
         ep0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695589463; x=1696194263;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0+IXnh6MdnWPnySyYwtUtqhST9oEZJulxHM6uyxvQ4=;
        b=QU0HmKqX1ykg7HoX7DsYp09EDMkm29L8Uywh64hnFb3RglMQaBh4M721dPiKuywt7Z
         U2KdDNZi5qfYBkQwJlQTo5E1aJRu0O8y4+g0BUFNUpFUo/W3WRpbGJPNWSuwEeGunzh2
         wMUEB8zRynK1IKzQ/jKSCw/qRXAyLvXQLfLFXdk8z7KT/0nszd7Cxkw/nV6cznKs8BT3
         YCK2yHxcKGf868QjeBPoBIrZGdiXRQcHsCAQfqqcfxjQg752OaHP1C8nU9iTbMmPr9Tt
         CR3zZAU8d+xYsUCv8zBlCVFaNLokxRMspmSjw526+VvJHuj/OfM5l51RHxTdndnCLSIa
         YMjg==
X-Gm-Message-State: AOJu0YxrsCDAuzOG0TZMXd9R0NlRCMOL0OehG/F+XUeflyIkgvf7bG4L
	U+/dhKW1dzm4Kls0LLO+8zbv2w==
X-Google-Smtp-Source: AGHT+IGbiJk4Y9+XU8Ptt4Wl1I2OUjbjVI4QJKzGmg6mUgquLLndTEW5kkDKj1Tuej9OjSc13PljIw==
X-Received: by 2002:a05:6358:6f12:b0:13c:eea2:d021 with SMTP id r18-20020a0563586f1200b0013ceea2d021mr4834597rwn.9.1695589463417;
        Sun, 24 Sep 2023 14:04:23 -0700 (PDT)
Received: from x1 ([191.96.37.211])
        by smtp.gmail.com with ESMTPSA id e17-20020aa78251000000b0068feb378b89sm6879991pfn.171.2023.09.24.14.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 14:04:22 -0700 (PDT)
Date: Sun, 24 Sep 2023 23:04:14 +0200
From: Drew Fustini <dfustini@baylibre.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
Message-ID: <ZRCkTqV2qV/tMb4O@x1>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <20230921-th1520-mmc-v1-1-49f76c274fb3@baylibre.com>
 <20230922-parish-ice-a22e93dc3027@spud>
 <ZQ2tP48Z19C5xRug@x1>
 <CAJF2gTSeKnB=Zc6o1wJAOyax7d=RmDJ0o8PSOfkVo5BYVc=sAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSeKnB=Zc6o1wJAOyax7d=RmDJ0o8PSOfkVo5BYVc=sAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_140426_482669_4839C359 
X-CRM114-Status: GOOD (  31.29  )
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

T24gU2F0LCBTZXAgMjMsIDIwMjMgYXQgMDQ6MTA6MTFQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAxMToxOOKAr1BNIERyZXcgRnVzdGluaSA8ZGZ1c3Rp
bmlAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAx
MDo1NzozNkFNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+IEhleSBEcmV3LAo+ID4g
Pgo+ID4gPiBPbiBUaHUsIFNlcCAyMSwgMjAyMyBhdCAwNjo0OTo0OFBNIC0wNzAwLCBEcmV3IEZ1
c3Rpbmkgd3JvdGU6Cj4gPiA+ID4gQWRkIGNvbXBhdGlibGUgdmFsdWUgZm9yIHRoZSBULUhlYWQg
VEgxNTIwIGR3Y21zaGMgY29udHJvbGxlciBhbmQgYWRkCj4gPiA+ID4gdGhlYWQscGh5LXB1bGwt
dXAgcHJvcGVydHkuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3Rpbmkg
PGRmdXN0aW5pQGJheWxpYnJlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zbnBzLGR3Y21zaGMtc2RoY2kueWFtbCB8IDQgKysr
Kwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zbnBz
LGR3Y21zaGMtc2RoY2kueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
bWMvc25wcyxkd2Ntc2hjLXNkaGNpLnlhbWwKPiA+ID4gPiBpbmRleCBhNDNlYjgzN2Y4ZGEuLjQ2
Yjc2OGQ0NjcxMiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbW1jL3NucHMsZHdjbXNoYy1zZGhjaS55YW1sCj4gPiA+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zbnBzLGR3Y21zaGMtc2RoY2kueWFtbAo+
ID4gPiA+IEBAIC0xOSw2ICsxOSw3IEBAIHByb3BlcnRpZXM6Cj4gPiA+ID4gICAgICAgIC0gcm9j
a2NoaXAscmszNTY4LWR3Y21zaGMKPiA+ID4gPiAgICAgICAgLSByb2NrY2hpcCxyazM1ODgtZHdj
bXNoYwo+ID4gPiA+ICAgICAgICAtIHNucHMsZHdjbXNoYy1zZGhjaQo+ID4gPiA+ICsgICAgICAt
IHRoZWFkLHRoMTUyMC1kd2Ntc2hjCj4gPiA+ID4KPiA+ID4gPiAgICByZWc6Cj4gPiA+ID4gICAg
ICBtYXhJdGVtczogMQo+ID4gPiA+IEBAIC02MCw2ICs2MSw5IEBAIHByb3BlcnRpZXM6Cj4gPiA+
ID4gICAgICBkZXNjcmlwdGlvbjogU3BlY2lmeSB0aGUgbnVtYmVyIG9mIGRlbGF5IGZvciB0eCBz
YW1wbGluZy4KPiA+ID4gPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3VpbnQ4Cj4gPiA+ID4KPiA+ID4gPiArICB0aGVhZCxwaHktcHVsbC11cDoKPiA+ID4gPiAr
ICAgIGRlc2NyaXB0aW9uOiBFbmFibGUgd2VhayBwdWxsLXVwIG9uIFBIWSBwYWRzCj4gPiA+ID4g
KyAgICB0eXBlOiBib29sZWFuCj4gPiA+Cj4gPiA+IFdoeSBpcyB0aGUgd2VhayBwdWxsLXVwIHJl
cXVpcmVkPyBIb3cgd291bGQgdGhlIGR0cyBhdXRob3Iga25vdyBpZiB0aGV5Cj4gPiA+IG5lZWQg
dG8gdXNlIHRoaXMgcHJvcGVydHk/Cj4gPgo+ID4gVGhpcyBpcyBhIGdvb2QgcXVlc3Rpb24sIGFu
ZCBJIGRvbid0IGhhdmUgYSBnb29kIHJlYXNvbiBiZXlvbmQgaXQgaXMKPiA+IHdoYXQgdGhlIHZl
bmRvciBTREsgd2FzIGRvaW5nLgo+ID4KPiA+IFRoZXJlIGFyZSBvbmx5IHR3byBib2FyZHMgcmln
aHQgbm93IHVzaW5nIHRoZSBUSDE1MjAgdGhhdCBJIGtub3cgb2YuCj4gPiBCb3RoIHRoZSBMUGk0
YSBbMV0gYW5kIHRoZSBBaGVhZCBbMl0gaGF2ZSB0aGUgcHVsbC11cCBwcm9wZXJ0eSBzZXQgb24K
PiA+IGFsbCB0aGUgbW1jIGNvbnRyb2xsZXIgbm9kZXMgdGhlaXIgZG93bnN0cmVhbSBkZXZpY2Ug
dHJlZXMuCj4gPgo+ID4gUm9iIHN1Z2dlc3RlZCBvbiAjZGV2aWNldHJlZSB0aGF0IGl0IHdvdWxk
IGJlIHNpbXBsZXIgdG8ganVzdCBlbmFibGUgaXQKPiA+IGluIHRoZSBkcml2ZXIgYW5kIGRpc2Fi
bGUgc3VwcG9ydCB3aGVuIG5lZWRlZC4gSSBsaWtlIHRoaXMgaWRlYSBhcyBpdAo+ID4gd2lsbCBz
aW1wbGlmeSB0aGlzIGJpbmRpbmcgcGF0Y2ggYW5kIHRoZSBjb2RlIGluIHRoZSBkcml2ZXIgcGF0
Y2guCj4gSXQncyBmb3IgdGhlIFBIWSBkZWJ1Zy4gWW91IGNvdWxkIGRpcmVjdGx5IHJlbW92ZSB0
aGVtLCBvciBrZWVwIGl0Cj4gd2l0aCBuby1wdWxsLXVwIGZsYWcsIHRoZW4gbm8gcHVsbC11cCBm
bGFnIGluIHRoZSBkdHMgZm9yIGRlZmF1bHQuLgoKVGhhbmsgeW91IGZvciBleHBsYWluaW5nIHRo
YXQgdGhlIHB1cnBvc2Ugb2YgdGhlIHB1bGwtdXAgRFQgcHJvcGVydHkKd2FzIGZvciBQSFkgZGVi
dWcuCgpJIHdpbGwgcGxhbiB0byByZW1vdmUgdGhlIHB1bGwtdXAgRFQgcHJvcGVydHkgaW4gdGhl
IG5leHQgdmVyc2lvbiBvZgp0aGlzIHBhdGNoIHNlcmllcyBhbmQgcmVtb3ZlIHNkaGNpX3BoeV8x
Xzh2X2luaXRfbm9fcHVsbCgpIGFuZApzZGhjaV9waHlfM18zdl9pbml0X25vX3B1bGwoKSBmcm9t
IG15IHNkaGNpLW9mLWR3Y21zaGMuYyBwYXRjaC4KCkkgd2lsbCBtYWtlIHRoMTUyMF9waHlfMV84
dl9pbml0KCkgYW5kIHRoMTUyMF9waHlfM18zdl9pbml0KCkgYWx3YXlzCnNldCBXRUFLUFVMTF9F
TiA9IDEgKFBVTExVUCkgZm9yIENNRFBBRF9DTkZHLCBEQVRBUEFEX0NORkcsIFJTVE5QQURfQ05G
RwphbmQgc2V0IFdFQUtQVUxMX0VOID0gMiAoUFVMTERPV04pIGZvciBTVEJQQURfQ05GRy4KClRo
YW5rcywKRHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
