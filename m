Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CF9C5CFCF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 09:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xk2XegS2MGjICTnELal7W1sH8T61pT65c26X5OtNXVc=; b=aA3zHWFCdbS1LP
	UY/f6XyIm3HyxyZ1a0DnzjaBefC+lTFIaGhhHFjvnHV4GbOuFh+prVOrW0NFXxva6Ey2IMlTO/Qlh
	fEf5drbzQB0lCjJLc8OmrK90o7D1c24H5MqcWWi/1QijP7o6fgLI66yufdWU3OeuCp5PCzHb6KDlP
	/1/64uJzIlEKmJ1cCwLEXHjdrwCzOwa5t0tEvE4Jb6SVAYz/l9cgh7hVwwUov/WXI+6nRgToLz2ts
	tze6XCIVhXAeJGRTIVOxYzpGz1xsTg9qpuv3YjIIzI99p5RJQw/Gy8CnIXyWOwCjP1rYXP6VfMdxU
	HYNbTwGGDadTLDQRmTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjGj-0000000DnNv-2E8J;
	Tue, 11 Aug 2026 09:59:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjGg-0000000DnN5-3GE4
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 09:59:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ceb096e675so31842135ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786442374; x=1787047174; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CES8RXugLAnF2pHLkpGhNtXnAeSlp9QbBFcsaosuXs=;
        b=juIoJHZKe63wpjZrVjk1a1/Xj0tHh+VnIT1HOLRsKvJ3heZ4RRDZACmVkObJunYU/I
         43cYWHRqSwd7jSQ44fDfMdIzg/MbPhAWnKQR330vURx+k5YhRGiXAyZqQxXdwJ1RGPZe
         Og8QNk4v0xzN8Ba1TpY02ich0YtTs9614NLBs3+e7g1L2gafm4LXgSSO5MN3Eom9fcm5
         KVa4tOn96Fm7Xo3PTvI6SdhJH2MlBdVgLbA0HogkhBqDxXTlHP+lLnl8MsryAEokQq2s
         hikncdPoMWi80QFkH/450orhwIl8PCvIOTRdSovxNoUU0zjMdOC9bbvIaWpQxpD9qizD
         vGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442374; x=1787047174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2CES8RXugLAnF2pHLkpGhNtXnAeSlp9QbBFcsaosuXs=;
        b=ca5GCe+4F1wP0Lrhlf39gNk4yY8yZGF0Pcl2xbjP1o+OLnj+AxMFMe9Pjy36REOnDc
         AQG7PldED8czwU5DXHxEeq/WTxj9TTXjVdoAUCdA5PDAlLAr6g91yANYPDsHtdcwurUu
         zNb6VVdcmqNE2ctG1xryAPvbJzRMRCO9AgS+An2oBrNbGnIS5wAqhNOZGrNDuprMgoiz
         QFfJOTarmQbnI+WDwP2kWvpJzHmbyGyfDHQLNzDvqFdbXFrSOOxxp7XiNPe78lI89IuR
         03SEBDMACh6ZByqeiJxGc+10F2POxqt9GB2v93WN4MxF2i7WnLsH8/kNWHZxCQmzok2u
         M10g==
X-Forwarded-Encrypted: i=1; AHgh+Ro9gEsljfnWwrij+BLN11qOz2RFKAOzwAd+idoFgbaUtrIBOFAYXxKsqzXcThPJvldazcrEfkx6LMugbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD3cP3V1UGKnAMbYv86gA5NFMMA3Z+zV4DVwWIZQejIAeOce6L
	3GL8YG750byHYQl/fj377259RyQHcIxdc1ufAM6D9D5Mwk7ogt9/YVhkv9CoPdo6hBk=
X-Gm-Gg: AR+sD134NlTskrXGI6U+7mKg+DOAj/SfKa9Z0Oj4T8BJ1u/p6Ij23tbDTtoPUQ8liUe
	16aS0zQWMPgVuUVMceBYzQmMKPfWm3LsijB5z8c/kWTqRoxS5FmBtOP3adj1HtlYr4FAv1jJQNF
	d5MN0OyiZvWaKg7w7rgQstJ5uuW8m3OuvyyuCfnU3ITzR9cKDMu8+JFQe14rNfFPlXtVGBvKApa
	YicDp0bWw/5pJ+4gV3UU0sGuk4eSoMCrA9kpETUVG8j8HPQDX7HnlqwChyjep0eNNAY6IM+6w6g
	xc0X1PnFFpo6XAx5Hsq/z15lwvYwQjDDabzi1/+HnETn7Z99qAeAjFhcrThBIqV2BJJkpTlmxi0
	w8WqxYdl6Dw5NLuRhlLbbE4MPKr7fvyO1Bddsp/83hg1PL8c3o3G81TsQwV5LoAukIo6DH/pIei
	Q+1cduZi9qwMVezOezrhmuv/aZ7gvxrI2I8w86d5d+mtxEGktslYMLpkEGPyGRUVT5PsxLJg==
X-Received: by 2002:a17:903:2288:b0:2ce:93a3:c16c with SMTP id d9443c01a7336-2d31788ea09mr22405295ad.12.1786442373625;
        Tue, 11 Aug 2026 02:59:33 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d31621a0dasm4892725ad.69.2026.08.11.02.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:59:33 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:59:22 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, samuel.holland@sifive.com, dlan@kernel.org,
	guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <anryepIiqKAbJTZJ@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
 <20260730-towering-modest-horse-ccbdcc@quoll>
 <20260730-component-wake-80840a196f8d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260730-component-wake-80840a196f8d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_025934_828363_651C1C99 
X-CRM114-Status: GOOD (  38.52  )
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

SGkgQ29ub3IgYW5kIEtyenlzenRvZiwKCk9uIFRodSwgSnVsIDMwLCAyMDI2IGF0IDA2OjM2OjI3
UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBUaHUsIEp1bCAzMCwgMjAyNiBhdCAw
OTozNTowMkFNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gT24gVGh1LCBK
dWwgMzAsIDIwMjYgYXQgMTI6Mzk6MDhBTSArMDgwMCwgWXUtQ2hpZW4gUGV0ZXIgTGluIHdyb3Rl
Ogo+ID4gPiBBZGQgWUFNTCBiaW5kaW5nIHNjaGVtYSBmb3IgdGhlIFNpRml2ZSB3Z0NoZWNrZXIs
IGEgcHJvZ3JhbW1hYmxlCj4gPiAKPiA+IFRoZXJlIGlzIG5vICJZQU1MIiBiaW5kaW5nIHNjaGVt
YS4KPiA+IAo+ID4gPiBhY2Nlc3MgY29udHJvbGxlciBpbnRlZ3JhdGVkIGluIHRoZSBpbnRlcmNv
bm5lY3QgZmFicmljIG9mIFJJU0MtVgo+ID4gPiBXb3JsZHMtY2FwYWJsZSBTb0NzLgo+ID4gPiAK
PiA+ID4gd2dDaGVja2VyIGVuZm9yY2VzIFdvcmxkIElEIChXSUQpIGJhc2VkIGFjY2VzcyBjb250
cm9sIG9uIGRvd25zdHJlYW0KPiA+ID4gYnVzIHRyYW5zYWN0aW9ucy4gRWFjaCBjaGVja2VyIHNs
b3QgZW5jb2RlcyBhIDItYml0IHBlcm1pc3Npb24gZmllbGQKPiA+ID4gcGVyIFdJRCAocmVhZC93
cml0ZSksIGVuYWJsaW5nIGZpbmUtZ3JhaW5lZCBtZW1vcnkgcGFydGl0aW9uaW5nIGFuZAo+ID4g
PiBkZXZpY2UgaXNvbGF0aW9uIGJldHdlZW4gZXhlY3V0aW9uIGNvbnRleHRzLiBWaW9sYXRpb25z
IGFyZSByZXBvcnRlZAo+ID4gPiB2aWEgYnVzIGVycm9ycywgaW50ZXJydXB0cywgb3IgYm90aCwg
c2VsZWN0YWJsZSBhbmQgbG9ja2FibGUgcGVyIHNsb3QuCj4gPiA+IAo+ID4gPiBUaGUgYmluZGlu
ZyByZWdpc3RlcnMgd2dDaGVja2VyIGFzIGFuIGFjY2Vzcy1jb250cm9sbGVycyBwcm92aWRlci4K
PiA+ID4gQ29uc3VtZXJzIChpLmUuIGl0cyBwcm90ZWN0ZWQgZGV2aWNlKSByZWZlcmVuY2UgaXQg
dmlhIHRoZSBzdGFuZGFyZAo+ID4gPiBhY2Nlc3MtY29udHJvbGxlcnMgcGhhbmRsZSB0byBkZWNs
YXJlIHRoZWlyIGFjY2VzcyByZXF1aXJlbWVudHMuCj4gPiA+IAo+ID4gPiBBbHNvIGRvY3VtZW50
IHRoZSBzaWZpdmUsdHJ1c3RlZHdpZCBwcm9wZXJ0eSBmb3IgdGhlIC9jcHVzIG5vZGUsCj4gPiA+
IGlkZW50aWZ5aW5nIHRoZSBwcml2aWxlZ2VkIFdJRCBhdXRob3JpemVkIHRvIGNvbmZpZ3VyZSBh
bGwgY2hlY2tlcnMKPiA+ID4gb24gdGhlIHBsYXRmb3JtLgo+ID4gPiAKPiA+ID4gTGluazogaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2YXJjaGl2ZS9zZWN1cml0eS9ibG9iL21haW4vcGFwZXJzL3dv
cmxkZ3VhcmQlMjBwcm9wb3NhbC5wZGYKPiA+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0
ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkg
PHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEppbSBTaHUgPGppbS5zaHVA
c2lmaXZlLmNvbT4KPiA+IAo+ID4gV2hhdCBleGFjdGx5IHRoZXNlIHJldmlld3MgcG9pbnRlZCBv
dXQ/Cj4gPiAKPiA+ID4gLS0tCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi93
b3JsZHMueWFtbCAgICAgfCAgIDkgKwo+ID4gPiAgLi4uL2JpbmRpbmdzL3NpZml2ZS9zaWZpdmUs
d2djaGVja2VyMi55YW1sICAgIHwgMzU2ICsrKysrKysrKysrKysrKysrKwo+ID4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzNjUgaW5zZXJ0aW9ucygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zaWZpdmUvc2lmaXZlLHdnY2hlY2tlcjIu
eWFtbAo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi93b3JsZHMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi93b3JsZHMueWFtbAo+ID4gPiBpbmRleCBjYzhiMzc0NzU5MWUuLmMzOWEwNmMy
ZGQ4ZCAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jpc2N2L3dvcmxkcy55YW1sCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi93b3JsZHMueWFtbAo+ID4gPiBAQCAtMzQsNiArMzQsMTQgQEAgcHJvcGVy
dGllczoKPiA+ID4gICAgICBtaW5pbXVtOiAyCj4gPiA+ICAgICAgbWF4aW11bTogNjQKPiA+ID4g
IAo+ID4gPiArICBzaWZpdmUsdHJ1c3RlZHdpZDoKPiA+IAo+ID4gTm8sIGZvciB0aGUgc2FtZSBy
ZWFzb25zLgo+IAo+IEkgYW0gbm90IGVudGlyZWx5IHN1cmUgdGhhdCB0aGlzIGlzIGRlZmluZWQg
YnkgdGhlIHBsYXRmb3JtIGNvbXBhdGlibGUsCj4gaWYgeW91J3ZlIGdvdCBzb21ldGhpbmcgbGlr
ZSBhIEZQR0Egd2l0aCBsb3RzIG9mIGNvbmZpZ3VyYWJpbGl0eSB0aGVuIGl0Cj4gbWF5IGJlIG5l
ZWRlZC4gVGhlbiBhZ2FpbiwgeWVhaCBtYXliZSBpdCBjYW4ganVzdCBjb21lIGZyb20gdGhlIHBs
YXRmb3JtCj4gY29tcGF0aWJsZSB1bmxpa2UgYSBkZXZpY2Ugc2hvd3MgdXAgdGhhdCBhY3R1YWxs
eSBuZWVkcyBpdC4KPiBUaGlzIGlzIGVzcGVjaWFsbHkgdHJ1ZSBpZiB0aGUgY29uc3VtZXIgb2Yg
dGhlIHByb3BlcnR5IGlzIHRoZSBTQkkKPiBmaXJtd2FyZS4KPiAKPiAodGhhdCdzIGFzc3VtaW5n
ICJzYW1lIHJlYXNvbiIgZm9sbG93cyBvbiBmcm9tIHlvdXIgY29tbWVudCBvbiB0aGUKPiBwcmlv
ciBiaW5kaW5nKQoKQWZ0ZXIgcmVmYWN0b3JpbmcgdGhlIE9wZW5TQkkgc3VwcG9ydCBmb3IgdGhl
IFdvcmxkcyBJU0EgYW5kIHdnQ2hlY2tlciwKSSBwbGFuIHRvIHJlbW92ZSByaXNjdixud29ybGRz
IGFuZCBzaWZpdmUsdHJ1c3RlZHdpZCBpbiB2My4KClRoZSByaXNjdixud29ybGRzIHByb3BlcnR5
IGlzIHVzZWQgb25seSB0byB2YWxpZGF0ZSB0aGUgV0lEIHJhbmdlLiBUaGlzCnZhbGlkYXRpb24g
Y2FuIGJlIHBlcmZvcm1lZCB1c2luZyB0aGUgcmlzY3YscG13aWQsIHJpc2N2LHBtd2lkbGlzdCwg
YW5kCnJpc2N2LHBtbHdpZGxpc3QgcHJvcGVydGllcywgbWFraW5nIHJpc2N2LG53b3JsZHMgdW5u
ZWNlc3NhcnkuCgpGb3Igc2lmaXZlLHRydXN0ZWR3aWQsIGEgaGFydCBhdHRlbXB0aW5nIHRvIGFj
Y2VzcyB3Z0NoZWNrZXIgY2FuIHByb2JlCm5vbi16ZXJvIHZhbHVlIGZyb20gYW4gTU1JTyByZWdp
c3RlciB0byB2ZXJpZnkgd2hldGhlciBpdCBpcyB0cnVzdGVkLAp0aGlzIHByb3BlcnR5IG1heSBh
bHNvIGJlIHVubmVjZXNzYXJ5LgoKQWx0aG91Z2ggc29tZSBkb3duc3RyZWFtIGRyaXZlcnMgY3Vy
cmVudGx5IHJlcXVpcmUgc2lmaXZlLHRydXN0ZWR3aWQsCnRob3NlIGRyaXZlcnMgYXJlIG5vdCBw
dWJsaWMgeWV0LiBUaGVyZWZvcmUsIGxldOKAmXMgZHJvcCBib3RoIHN5c3RlbS1sZXZlbApwcm9w
ZXJ0aWVzIGZvciBub3cuCgo+IAo+ID4gCj4gPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiA+ICsgICAgbWF4aW11bTogMzEKPiA+ID4gKyAg
ICBkZXNjcmlwdGlvbjogfAo+ID4gPiArICAgICAgVGhlIFdvcmxkIElEIChXSUQpIGRlc2lnbmF0
ZWQgYXMgdGhlIHRydXN0ZWQgV0lEIGZvciB0aGlzIHBsYXRmb3JtLgo+ID4gPiArICAgICAgVHJh
bnNhY3Rpb25zIHRhZ2dlZCB3aXRoIHRoaXMgV0lEIGFyZSBhdXRob3JpemVkIHRvIGFjY2VzcyBh
bmQgY29uZmlndXJlCj4gPiA+ICsgICAgICBXb3JsZEd1YXJkIGJsb2NrcywgaW5jbHVkaW5nIHdn
Q2hlY2tlcnMgYW5kIHdnTWFya2Vycy4KPiA+ID4gKwo+ID4gPiAgYWRkaXRpb25hbFByb3BlcnRp
ZXM6IHRydWUKPiA+ID4gIAo+ID4gPiAgZXhhbXBsZXM6Cj4gPiA+IEBAIC00NCw2ICs1Miw3IEBA
IGV4YW1wbGVzOgo+ID4gPiAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ID4gICAgICAg
ICAgdGltZWJhc2UtZnJlcXVlbmN5ID0gPDEwMDAwMDA+Owo+ID4gPiAgICAgICAgICByaXNjdixu
d29ybGRzID0gPDQ+Owo+ID4gPiArICAgICAgICBzaWZpdmUsdHJ1c3RlZHdpZCA9IDwzPjsKPiA+
ID4gIAo+ID4gPiAgICAgICAgICBjcHVAMCB7Cj4gPiA+ICAgICAgICAgICAgICBkZXZpY2VfdHlw
ZSA9ICJjcHUiOwo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NpZml2ZS9zaWZpdmUsd2djaGVja2VyMi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NpZml2ZS9zaWZpdmUsd2djaGVja2VyMi55YW1sCj4gPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzAyNWE0NzY1Y2IzCj4g
PiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NpZml2ZS9zaWZpdmUsd2djaGVja2VyMi55YW1sCj4gPiAKPiA+IE5vLCB5b3UgZG8g
bm90IGdldCBwZXIgdmVuZG9yIGRpcmVjdG9yeS4gTkFLLgo+ID4gCj4gPiBEbyB5b3Ugc2VlIFFj
b20/IE9yIFRJPyBPciBOWFA/Cj4gPiAKPiA+IFBsYWNlIGl0IGluIGFwcHJvcHJpYXRlIGRpcmVj
dG9yeSBtYXRjaGluZyB0aGUgaGFyZHdhcmUuCj4gCj4gV2hpY2ggd291bGQgYmUgYWNjZXNzLWNv
bnRyb2xsZXJzLgoKVGhhbmtzIGZvciBwb2ludGluZyBtZSB0byB0aGUgYXBwcm9wcmlhdGUgZGly
ZWN0b3J5LgoKPiAKPiA+IAo+ID4gCj4gPiA+IEBAIC0wLDAgKzEsMzU2IEBACj4gPiA+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+
ID4gKyMgQ29weXJpZ2h0IChDKSAyMDI2IFNpRml2ZSwgSW5jLgo+ID4gPiArJVlBTUwgMS4yCj4g
PiA+ICstLS0KPiA+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc2lmaXZl
L3NpZml2ZSx3Z2NoZWNrZXIyLnlhbWwjCj4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4gKwo+ID4gPiArdGl0bGU6IFNpRml2
ZSBXb3JsZEd1YXJkIENoZWNrZXIKPiA+ID4gKwo+ID4gPiArbWFpbnRhaW5lcnM6Cj4gPiA+ICsg
IC0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiA+ID4gKwo+ID4g
PiArZGVzY3JpcHRpb246IHwKPiA+ID4gKyAgVGhlIFJJU0MtViBXb3JsZHMgSVNBIGV4dGVuc2lv
biBkZWZpbmVzIFdvcmxkIElEcyAoV0lEcykgYXMgYXJjaGl0ZWN0dXJhbAo+ID4gPiArICBpZGVu
dGlmaWVycyB0aGF0IHRhZyBlYWNoIHN5c3RlbSB0cmFuc2FjdGlvbiB3aXRoIGl0cyBvcmlnaW5h
dGluZyBjb250ZXh0Lgo+ID4gPiArICBTeXN0ZW0gaW50ZWdyYXRvcnMgYXNzaWduIFdJRHMgdG8g
ZXhlY3V0aW9uIGNvbnRleHRzIHN1Y2ggYXMgcHJpdmlsZWdlIG1vZGVzLAo+ID4gPiArICB0cnVz
dGVkIGV4ZWN1dGlvbiBlbnZpcm9ubWVudHMsIG9yIG90aGVyIGlzb2xhdGlvbiBib3VuZGFyaWVz
Lgo+ID4gPiArCj4gPiA+ICsgIFRoZSBTaUZpdmUgV29ybGRHdWFyZCBDaGVja2VyIGlzIGEgaGFy
ZHdhcmUgZmlyZXdhbGwgcG9zaXRpb25lZCBpbiB0aGUKPiA+ID4gKyAgc3lzdGVtIGludGVyY29u
bmVjdCBmYWJyaWMuIEl0IGluc3BlY3RzIGV2ZXJ5IHRyYW5zYWN0aW9uLCBldmFsdWF0aW5nIHRo
ZQo+ID4gPiArICBXSUQgYWdhaW5zdCBhY2Nlc3MgY29udHJvbCBwb2xpY2llcyBlbmNvZGVkIGlu
IGNoZWNrZXIgc2xvdHMgZm9yIGVhY2gKPiA+ID4gKyAgcHJvdGVjdGVkIHJlc291cmNlLiBUcmFu
c2FjdGlvbnMgZnJvbSB1bmF1dGhvcml6ZWQgV0lEcyBhcmUgYmxvY2tlZCBhbmQKPiA+ID4gKyAg
cmVwb3J0ZWQgYXMgYnVzIGVycm9ycywgaW50ZXJydXB0cywgb3IgYm90aC4KPiA+ID4gKwo+ID4g
PiArICBUaGlzIGVuYWJsZXMgc3BhdGlhbCBwYXJ0aXRpb25pbmcgb2YgbWVtb3J5IHJlZ2lvbnMg
YW5kIG1lbW9yeS1tYXBwZWQgZGV2aWNlcwo+ID4gPiArICBhY3Jvc3MgZXhlY3V0aW9uIGNvbnRl
eHRzLiBEaWZmZXJlbnQgYWRkcmVzcyByYW5nZXMgY2FuIGVuZm9yY2UgZGlzdGluY3QKPiA+ID4g
KyAgcG9saWNpZXMsIGFsbG93aW5nIGlzb2xhdGVkIHdvcmtsb2FkcyB0byBjb2V4aXN0IHdpdGgg
aGFyZHdhcmUtZW5mb3JjZWQKPiA+ID4gKyAgcHJvdGVjdGlvbi4KPiA+ID4gKwo+ID4gPiArICBU
aGUgd2dDaGVja2VyIGFjdHMgYXMgYW4gYWNjZXNzLWNvbnRyb2xsZXIgcHJvdmlkZXIgYXMgZGVm
aW5lZCBpbiB0aGUKPiA+ID4gKyAgYWNjZXNzLWNvbnRyb2xsZXJzIGZyYW1ld29yay4gUHJvdGVj
dGVkIGRldmljZXMgYXJlIGNvbnN1bWVycyB0aGF0IGRlY2xhcmUKPiA+ID4gKyAgdGhlaXIgYWNj
ZXNzIHBvbGljeSB2aWEgdGhlIGFjY2Vzcy1jb250cm9sbGVycyBwcm9wZXJ0eS4gVGhlIGhhcmR3
YXJlCj4gPiA+ICsgIHN1cHBvcnRzIHVwIHRvIDMyIFdvcmxkIElEcy4KPiA+ID4gKwo+ID4gPiAr
ICBUaGUgV29ybGQgSUQgYXV0aG9yaXplZCB0byBjb25maWd1cmUgV29ybGRHdWFyZCBibG9ja3Mg
aXMgc3BlY2lmaWVkIGJ5IHRoZQo+ID4gPiArICBzaWZpdmUsdHJ1c3RlZHdpZCBwcm9wZXJ0eSBp
biB0aGUgL2NwdXMgbm9kZS4KPiA+ID4gKwo+ID4gPiArYWxsT2Y6Cj4gPiA+ICsgIC0gJHJlZjog
L3NjaGVtYXMvYWNjZXNzLWNvbnRyb2xsZXJzL2FjY2Vzcy1jb250cm9sbGVycy55YW1sIwo+ID4g
PiArCj4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiArICBjb21wYXRpYmxlOgo+ID4gPiArICAgIG9u
ZU9mOgo+ID4gPiArICAgICAgLSBpdGVtczoKPiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiBxZW11
LHdnY2hlY2tlcjIKPiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiBzaWZpdmUsd2djaGVja2VyMgo+
ID4gPiArICAgICAgLSBjb25zdDogc2lmaXZlLHdnY2hlY2tlcjIKPiA+IAo+ID4gWW91IG5lZWQg
c29jIHNwZWNpZmljIGNvbXBhdGlibGVzLgo+ID4gCj4gPiBJIGRvIG5vdCBiZWxpZXZlIHRoZSB0
d28gcmV2aWV3IHRhZ3MgZGlkIGFueSBhY3R1YWwgcmVhbCByZXZpZXcuIFRoZXkKPiA+IHdvdWxk
IHRlbGwgeW91IHRvIHJlYWQgd3JpdGluZyBiaW5kaW5ncyBkb2N1bWVudCwgd291bGRuJ3QgdGhl
eT8KPiAKPiBJIGRpZCBva2F5IHRoZSBxZW11IGNvbXBhdGlibGUgRldJVywgdGhlIHN0YW5kYWxv
bmUgc2lmaXZlIG9uZSB0aG91Z2ggSQo+IGRpZCBub3QuCgpTdXJlLCB3aWxsIGZpeC4KCkJlc3Qg
cmVnYXJkcywKUGV0ZXIgTGluCgo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
