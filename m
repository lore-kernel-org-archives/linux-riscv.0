Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C527C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Dec 2021 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00QEm0/dZo8Pt44mOGPDNCwFHWRxZgX6E2Hlq0wbI+E=; b=m3qPy011Mxkaki
	GJUEeh3Z/xg96e8FGpjZYnyqOiL2sZICowlJEEChCYdXtIzTaHVUmgCn+q0hysCmeV2AoeDZTBNAW
	QnqJc4GutYYxhGR/b5RSyOJDA9Fp86w00KIFXBQn83PkKGFgeeqAGos81NNGaY2TciwuhLC0bdtvG
	p2yS8rm/LTake3KCvxn6HR56ZQYb15c1AJKPmoI5puhRrOqG7BWZBUGVwbO7ZYVzb5F/DcldC8IPM
	wrwDjJYYbXEO2rrvNfqs71h4N8HUTMgVrq+KaHlQ1IRt/OIIRD/CR9roLwWObFgR645qa54SMQcmh
	75mFPtuoeWZpRdlTFk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3LVe-006QD0-2T; Fri, 31 Dec 2021 17:16:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3LVb-006QCO-7f
 for linux-riscv@lists.infradead.org; Fri, 31 Dec 2021 17:16:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id i22so56876800wrb.13
 for <linux-riscv@lists.infradead.org>; Fri, 31 Dec 2021 09:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nW3DRwBXlWxCsw3rkSWFhL6nZOR/Uw6StM6XHT9/rAY=;
 b=SUARbtRK/Q6wxcxjjpNA+tLAytZ3tSIuGys93vOAubdM7+oXzozKqsZ1nueUKAxpOo
 YryBJDO4rPwzJnOx/6fVZSC+M6wwegsjnc3vayRdEdeLq1KZo5nvaH5jzc4/5zAWPuXV
 tHM5FDTraUVJ5a82TMuZkWdjpuJ+/sABDEtuaQ1igflT15IZrVwMWdgD513/AU62c1Bu
 10MBvp8oU0aTNKfPAADeCBw8xPiXsC2YUItXFeizdLVHQ+wRWQm5ToNdqYl6wxFrAbgb
 j1cHE2S1H5yBIJrdtEieoi5lVuAI64KK/pAGpSmHA0eYndLEI4T5QoY7gqDax2lGTVAc
 S6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nW3DRwBXlWxCsw3rkSWFhL6nZOR/Uw6StM6XHT9/rAY=;
 b=Lrh6ML9uEpomEUqIMzlnj3nnnzVd1XEeGcdkiaHvdXn8hHNKy5EzSGbAtOatP3I1WB
 Pt5rvuTwP7aeaDVcLYOfc1BOFl3szMBYWhdsNKToiiDVdOlrF2+0H6eyRyc7QVBuZ7M4
 y6thm3B4LNswv5W0916UG7ibEXKgWoBARXSxL2f7BCJphqdr1WbsrCfL4MYKE01FE/XT
 dvHdb00klsJpjx8q/8m3khQvtAsc5JP1sFxG6VT7XaNVRJZHdNrsPVQdZ3T/bPgtEp4+
 qE2MVKa2O4fmKVWcK9xjIHL9ZBslqvz9pMGfkXLfp/Wi6s8cSTsT2Wn+wfi+VslEqhih
 hhOg==
X-Gm-Message-State: AOAM530fsM0lLZIMGSL/j2ev8Tt/uQuiq0rwqbOJs6UrDr4jH35qhucn
 kGSrYLy6Oqm1SI25r2YuShjpaQ==
X-Google-Smtp-Source: ABdhPJxHr6RcCJR4Xr5xMJYG4onusmC3VQwM62AcBuYQhyzFRV3AB/cgcID+72uMYWwAPxjDbNjN9w==
X-Received: by 2002:a05:6000:2a6:: with SMTP id
 l6mr29788136wry.76.1640970961775; 
 Fri, 31 Dec 2021 09:16:01 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id z5sm26518553wru.87.2021.12.31.09.16.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Dec 2021 09:16:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Add gpio poweroff
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CADWks+Yjh1B=Fu8NFS4KYrvNh_bU8P5pzb+_yNvseS+1+D5H7Q@mail.gmail.com>
Date: Fri, 31 Dec 2021 17:16:00 +0000
Cc: Ron Economos <w6rz@comcast.net>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Message-Id: <ED7B7FCA-182C-45AC-90E7-17559762DE0B@jrtc27.com>
References: <20211231061110.89403-1-w6rz@comcast.net>
 <73F7FAE3-5113-48DD-B0F5-0EEAA0A8B0C1@jrtc27.com>
 <CADWks+Yjh1B=Fu8NFS4KYrvNh_bU8P5pzb+_yNvseS+1+D5H7Q@mail.gmail.com>
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_091603_323718_6122FA35 
X-CRM114-Status: GOOD (  17.33  )
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

T24gMzEgRGVjIDIwMjEsIGF0IDE2OjQ5LCBEaW1pdHJpIEpvaG4gTGVka292IDxkaW1pdHJpLmxl
ZGtvdkBjYW5vbmljYWwuY29tPiB3cm90ZToKPiAKPiBIb3dldmVyLCBpbiBzb21lIGNvbmZpZ3Vy
YXRpb25zIHVib290IGxvYWRzIGtlcm5lbCBwcm92aWRlZCBkdGIsIHRoZW4gdGhpcyBwaW4gbmVl
ZHMgdG8gYmUgZGVmaW5lcyBmb3IgU0JJIHRvIHByb3ZpZGUgcG93ZXJvZmYgdmlhIHRoaXMgcGlu
Lgo+IAo+IEtlcm5lbCwgdWJvb3QsIG9wZW5zYmkgZHRicyBmb3IgdW5tYXRjaGVkIG11c3QgYmUg
Y29uc2lzdGVudCB3aXRoIGVhY2ggb3RoZXIgYW5kIGFsbCBzaG91bGQgZGVmaW5lIHBvd2Vyb2Zm
IHBpbi4KClUtQm9vdCBTUEwgbG9hZHMgaXRzIGVtYmVkZGVkIERUQiBmb3IgT3BlblNCSeKAmXMg
dXNlLiBVLUJvb3Qg4oCccHJvcGVy4oCdCmxvYWRzIHRoZSBrZXJuZWzigJlzIERUQiBmb3IgdGhl
IGtlcm5lbOKAmXMgdXNlLiBUaGUgRFRCIGxvYWRlZCBmb3IgdGhlCmtlcm5lbCBpcyBuZXZlciBm
ZWQgYmFjayBzb21laG93LiBKdXN0IGFzIHdlIGRvbuKAmXQgcHJvdmlkZSBERFIgdGltaW5nCmlu
Zm9ybWF0aW9uIGluIHRoZSBrZXJuZWwgRFRCLCBvbmx5IFUtQm9vdOKAmXMsIHRoZXJlIHNob3Vs
ZCBiZSBubyBuZWVkCnRvIHByb3ZpZGUgaW5mb3JtYXRpb24gYWJvdXQgdGhpcyBHUElPIHRvIHRo
ZSBrZXJuZWwuIEVpdGhlciB0aGUga2VybmVsCndpbGwgcHJpb3JpdGlzZSBTQkkgcG93ZXItb2Zm
LCB3aGljaCByZW5kZXJzIHRoZSBEVEIgbm9kZSBhIGNvbXBsZXRlCndhc3RlIG9mIHNwYWNlLCBh
bmQgcG9zc2libHkgY29uZnVzaW5nIHRvIGV4aXN0LCBvciB0aGUga2VybmVsIHdpbGwKcHJpb3Jp
dGlzZSBHUElPIHBvd2VyLW9mZiwgd2hpY2ggc2hvdWxkIGJlIGRpc2NvdXJhZ2VkIGFzIHlvdeKA
mXJlCnN1cHBvc2VkIHRvIHVzZSBzdGFuZGFyZGlzZWQgZmlybXdhcmUgaW50ZXJmYWNlcyBmb3Ig
dGhlc2Uga2luZHMgb2YKcGxhdGZvcm0tc3BlY2lmaWMgdGhpbmdzLgoKSmVzcwoKPiBPbiBGcmks
IDMxIERlYyAyMDIxLCAwNjo1OCBKYW1lcyBDbGFya2UsIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3Jv
dGU6Cj4gT24gMzEgRGVjIDIwMjEsIGF0IDA2OjExLCBSb24gRWNvbm9tb3MgPHc2cnpAY29tY2Fz
dC5uZXQ+IHdyb3RlOgo+ID4gCj4gPiBUaGlzIHBhdGNoIGlzIHJlcXVpcmVkIGZvciB0aGUgZm9s
bG93aW5nIGNvbW1pdCB0byB3b3JrLgo+ID4gCj4gPiBjb21taXQgZjI5MjhlMjI0ZDg1ICgicmlz
Y3Y6IHNldCBkZWZhdWx0IHBtX3Bvd2VyX29mZiB0byBOVUxMIikKPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogUm9uIEVjb25vbW9zIDx3NnJ6QGNvbWNhc3QubmV0Pgo+ID4gLS0tCj4gPiBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgfCA1ICsrKysrCj4g
PiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKPiA+IGluZGV4
IDZiZmExZjI0ZDNkZS4uYzRlZDllZmRmZjAzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMKPiA+IEBAIC0zOSw2
ICszOSwxMSBAQCBydGNjbGs6IHJ0Y2NsayB7Cj4gPiAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0g
PFJUQ0NMS19GUkVRPjsKPiA+ICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMgPSAicnRjY2xrIjsK
PiA+ICAgIH07Cj4gPiArCj4gPiArICAgIGdwaW8tcG93ZXJvZmYgewo+ID4gKyAgICAgICAgY29t
cGF0aWJsZSA9ICJncGlvLXBvd2Vyb2ZmIjsKPiA+ICsgICAgICAgIGdwaW9zID0gPCZncGlvIDIg
R1BJT19BQ1RJVkVfTE9XPjsKPiA+ICsgICAgfTsKPiAKPiBXaHk/IEl04oCZcyBhYnN0cmFjdGVk
IGJ5IGZpcm13YXJlLCB3aGljaCB3b3Jrcy4KPiAKPiBKZXNzCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
