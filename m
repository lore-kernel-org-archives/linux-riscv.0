Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7493C83F33
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGNupWtLARprZ80+5xlDkYnoup4opabXxWVzZRfHuo8=; b=OQg4okd12y2Av1
	nXQ3Plp4mRCNZOM5eTwJBWzbjjrrPz/XPycPRsjW5WqI4YG4e6TUEd+IZWVcod6b6SsFP5+5xaFd3
	0OlHl8PwKUBF5/zlhAIHyeFB5NEy5px/NIq44e4wahvw1pbqSqezZTtc357ELKZVa79pquzRX8I2t
	BluuhggU7VcH22uMhVPDlHO6Ka4aMH/7SoA35GKkZjJ81XAZRwYCx7fyv4Im/J8dWSdzo0v9w2xal
	cy7KLJZ61XlhQTmEx7uGl+m+TyCyqCE0f6pDPbq1+/S0Z2PQsKuVoRJ1q8N2el9/HGVK7wnYg6kZ0
	l5owd02BR4t+I1xJxOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTLb-005nWM-2v;
	Tue, 05 Sep 2023 10:31:51 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTLY-005nTD-2b
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 10:31:50 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso339437466b.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 03:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693909906; x=1694514706; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S35RjLtTeUiL0oK4WaMu3773GIHLmxuJ99VNH62qR3I=;
        b=BB83d5EhTOi40EJ8V26yTC1q65fW3oxIvyIUtVoeGXowXLIVkwO22SXkHJ7MS/bv2w
         BEySdujRiabrVItPzSpMfPvXJ/nqopyVk4CpHAVfYj8TQKqYfvu00HGBq7Tl3ijD/1Nu
         BkWZEtN4zLsfUtMWSAJkCxyHHS5KZXWDsjl+PxEyegtrKAU9KcG54jaz7yKgry21+voo
         F5EWdE4MZ1huew24AN2wA8QeMNtAKSSnV/jmcQJCkl9qYC4J+1DvlqZqQ+czLEcOcY3F
         RVJs08bokhiUYyTUvhBzc7PcfpE6Bx//oOWXbGvZCRUXSnRlnnUgv1tiZJ0Ub/UfXSLh
         DS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693909906; x=1694514706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S35RjLtTeUiL0oK4WaMu3773GIHLmxuJ99VNH62qR3I=;
        b=EPdkANhOSxwZuK/djoLSc+Dnji1e4V40jWBYYJPTTbfOrsFQztTNBpxfxE59YDnDK1
         p76xA54UgEp2X3U00lJrk6kLITM5Ao1LgwPAONxVjZ5fWSpQsyxfYKMRxv2IaJ92bX5h
         LVm0lSq4Owt1P2QCZCfJ+yZfuWJEuFyn2KS3BR1c9Mpt32eTQf8HKZgtWyhvMfhvT8dc
         GprzF+OYQ/3fNf+Hd06mpnJePByWld3UdmNYL0d/0DmGpRygJXw5yCnmLpgu7jbiVFeL
         hGo0jM8Iq5DfuO2D/eiTjx0Zjgn3bMiNU7RnkcU7u24+RsdVDIu3JKDpG8YETRdf7cCF
         cjsw==
X-Gm-Message-State: AOJu0Ywv8efheHIviRHGTLBolxLbTxNUuukQ/LAvnPPzdiZs5eBegddd
	uVBSBnKnM7FVKnL3LvkaZlRPFg==
X-Google-Smtp-Source: AGHT+IHXiMYQ0dzTcFvGucvEc9/hoAyHyfOVwPGQSUHueN8hnJX8qAOgE5kuEmsUExIqJ9+lbjSNqw==
X-Received: by 2002:a17:906:319b:b0:9a1:fcd7:b825 with SMTP id 27-20020a170906319b00b009a1fcd7b825mr9273316ejy.71.1693909905990;
        Tue, 05 Sep 2023 03:31:45 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906850700b00993664a9987sm7371811ejx.103.2023.09.05.03.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 03:31:44 -0700 (PDT)
Date: Tue, 5 Sep 2023 12:31:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ardb@kernel.org" <ardb@kernel.org>, 
	"Li, Haicheng" <haicheng.li@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
Message-ID: <20230905-d4d7b1944ac3487156ce4f5c@orel>
References: <20230806024715.3061589-1-xiao.w.wang@intel.com>
 <CAAhSdy2_djw2JX+8tmF2V190+x9KLvt7u8rCX-TaGCKQrUVOYQ@mail.gmail.com>
 <DM8PR11MB57512001CAFA07EC58203A7BB8E6A@DM8PR11MB5751.namprd11.prod.outlook.com>
 <20230830-breeze-washboard-ef496d5c9d5a@wendy>
 <DM8PR11MB575116E5EE183D7D41361B74B8E5A@DM8PR11MB5751.namprd11.prod.outlook.com>
 <CAK9=C2XTS539ew_rty6_MOwyZkdBBbGBCzxp33u1UpMP5STAqQ@mail.gmail.com>
 <20230831-f0f847c5703875f1e67635c1@orel>
 <DM8PR11MB5751CDA12CB037C678F1B829B8E8A@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5751CDA12CB037C678F1B829B8E8A@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_033148_852442_E98C5A71 
X-CRM114-Status: GOOD (  39.22  )
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

CkhpIFhpYW8sCgpPbiBUdWUsIFNlcCAwNSwgMjAyMyBhdCAwOTo0NjoyMEFNICswMDAwLCBXYW5n
LCBYaWFvIFcgd3JvdGU6Cj4gCj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4g
RnJvbTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFNlbnQ6IEZy
aWRheSwgU2VwdGVtYmVyIDEsIDIwMjMgMTowMCBBTQo+ID4gVG86IEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gQ2M6IFdhbmcsIFhpYW8gVyA8eGlhby53LndhbmdAaW50
ZWwuY29tPjsgQ29ub3IgRG9vbGV5Cj4gPiA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+OyBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPjsKPiA+IHBhdWwud2FsbXNsZXlAc2lmaXZl
LmNvbTsgcGFsbWVyQGRhYmJlbHQuY29tOyBhb3VAZWVjcy5iZXJrZWxleS5lZHU7Cj4gPiBhcmRi
QGtlcm5lbC5vcmc7IExpLCBIYWljaGVuZyA8aGFpY2hlbmcubGlAaW50ZWwuY29tPjsgbGludXgt
Cj4gPiByaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1lZmlAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC0KPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIFJJU0MtVjogT3B0aW1pemUgYml0b3BzIHdpdGggWmJiIGV4dGVuc2lvbgo+ID4gCj4gPiBP
biBUaHUsIEF1ZyAzMSwgMjAyMyBhdCAwOTozNzozMFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3Rl
Ogo+ID4gPiArQW5kcmV3Cj4gPiA+Cj4gPiA+IE9uIFRodSwgQXVnIDMxLCAyMDIzIGF0IDk6Mjni
gK9QTSBXYW5nLCBYaWFvIFcgPHhpYW8udy53YW5nQGludGVsLmNvbT4KPiA+IHdyb3RlOgo+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4g
PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPiA+
ID4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMzAsIDIwMjMgMjo1OSBQTQo+ID4gPiA+ID4gVG86
IFdhbmcsIFhpYW8gVyA8eGlhby53LndhbmdAaW50ZWwuY29tPgo+ID4gPiA+ID4gQ2M6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+OyBwYXVsLndhbG1zbGV5QHNpZml2ZS5jb207Cj4g
PiA+ID4gPiBwYWxtZXJAZGFiYmVsdC5jb207IGFvdUBlZWNzLmJlcmtlbGV5LmVkdTsgYXJkYkBr
ZXJuZWwub3JnOyBMaSwKPiA+IEhhaWNoZW5nCj4gPiA+ID4gPiA8aGFpY2hlbmcubGlAaW50ZWwu
Y29tPjsgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtCj4gPiA+ID4gPiBl
ZmlAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4g
PiBTdWJqZWN0OiBSZTogW1BBVENIXSBSSVNDLVY6IE9wdGltaXplIGJpdG9wcyB3aXRoIFpiYiBl
eHRlbnNpb24KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBXZWQsIEF1ZyAzMCwgMjAyMyBhdCAwNjox
NDoxMkFNICswMDAwLCBXYW5nLCBYaWFvIFcgd3JvdGU6Cj4gPiA+ID4gPiA+IEhpLAo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4gPiA+
ID4gRnJvbTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+ID4gPiA+ID4gPiBT
ZW50OiBUdWVzZGF5LCBBdWd1c3QgMjksIDIwMjMgNzowOCBQTQo+ID4gPiA+ID4gPiA+IFRvOiBX
YW5nLCBYaWFvIFcgPHhpYW8udy53YW5nQGludGVsLmNvbT4KPiA+ID4gPiA+ID4gPiBDYzogcGF1
bC53YWxtc2xleUBzaWZpdmUuY29tOyBwYWxtZXJAZGFiYmVsdC5jb207Cj4gPiA+ID4gPiA+ID4g
YW91QGVlY3MuYmVya2VsZXkuZWR1OyBhcmRiQGtlcm5lbC5vcmc7IExpLCBIYWljaGVuZwo+ID4g
PiA+ID4gPiA+IDxoYWljaGVuZy5saUBpbnRlbC5jb20+OyBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eC0KPiA+ID4gPiA+ID4gPiBlZmlAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRD
SF0gUklTQy1WOiBPcHRpbWl6ZSBiaXRvcHMgd2l0aCBaYmIgZXh0ZW5zaW9uCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBPbiBTdW4sIEF1ZyA2LCAyMDIzIGF0IDg6MDnigK9BTSBYaWFvIFdh
bmcKPiA+IDx4aWFvLncud2FuZ0BpbnRlbC5jb20+Cj4gPiA+ID4gPiB3cm90ZToKPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGxldmVyYWdlcyB0aGUgYWx0ZXJuYXRp
dmUgbWVjaGFuaXNtIHRvIGR5bmFtaWNhbGx5Cj4gPiBvcHRpbWl6ZQo+ID4gPiA+ID4gPiA+ID4g
Yml0b3BzIChpbmNsdWRpbmcgX19mZnMsIF9fZmxzLCBmZnMsIGZscykgd2l0aCBaYmIgaW5zdHJ1
Y3Rpb25zLiBXaGVuCj4gPiA+ID4gPiA+ID4gPiBaYmIgZXh0IGlzIG5vdCBzdXBwb3J0ZWQgYnkg
dGhlIHJ1bnRpbWUgQ1BVLCBsZWdhY3kgaW1wbGVtZW50YXRpb24KPiA+IGlzCj4gPiA+ID4gPiA+
ID4gPiB1c2VkLiBJZiBaYmIgaXMgc3VwcG9ydGVkLCB0aGVuIHRoZSBvcHRpbWl6ZWQgdmFyaWFu
dHMgd2lsbCBiZQo+ID4gc2VsZWN0ZWQKPiA+ID4gPiA+ID4gPiA+IHZpYSBhbHRlcm5hdGl2ZSBw
YXRjaGluZy4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGUgbGVnYWN5IGJpdG9w
cyBzdXBwb3J0IGlzIHRha2VuIGZyb20gdGhlIGdlbmVyaWMgQwo+ID4gaW1wbGVtZW50YXRpb24g
YXMKPiA+ID4gPiA+ID4gPiA+IGZhbGxiYWNrLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+IElmIHRoZSBwYXJhbWV0ZXIgaXMgYSBidWlsZC10aW1lIGNvbnN0YW50LCB3ZSBsZXZlcmFn
ZSBjb21waWxlcgo+ID4gYnVpbHRpbiB0bwo+ID4gPiA+ID4gPiA+ID4gY2FsY3VsYXRlIHRoZSBy
ZXN1bHQgZGlyZWN0bHksIHRoaXMgYXBwcm9hY2ggaXMgaW5zcGlyZWQgYnkgeDg2IGJpdG9wcwo+
ID4gPiA+ID4gPiA+ID4gaW1wbGVtZW50YXRpb24uCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gRUZJIHN0dWIgcnVucyBiZWZvcmUgdGhlIGtlcm5lbCwgc28gYWx0ZXJuYXRpdmUgbWVj
aGFuaXNtIHNob3VsZCBub3QKPiA+IGJlCj4gPiA+ID4gPiA+ID4gPiB1c2VkIHRoZXJlLCB0aGlz
IHBhdGNoIGludHJvZHVjZXMgYSBtYWNybyBFRklfTk9fQUxURVJOQVRJVkUgZm9yCj4gPiB0aGlz
Cj4gPiA+ID4gPiA+ID4gPiBwdXJwb3NlLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSSBh
bSBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgY29tcGlsZSBlcnJvciB3aXRoIHRoaXMgcGF0Y2g6Cj4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgIEdFTiAgICAgTWFrZWZpbGUKPiA+ID4gPiA+ID4g
PiAgIFVQRCAgICAgaW5jbHVkZS9jb25maWcva2VybmVsLnJlbGVhc2UKPiA+ID4gPiA+ID4gPiAg
IFVQRCAgICAgaW5jbHVkZS9nZW5lcmF0ZWQvdXRzcmVsZWFzZS5oCj4gPiA+ID4gPiA+ID4gICBD
QyAgICAgIGtlcm5lbC9ib3VuZHMucwo+ID4gPiA+ID4gPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJv
bSAvaG9tZS9hbnVwL1dvcmsvcmlzY3YtCj4gPiA+ID4gPiA+ID4gdGVzdC9saW51eC9pbmNsdWRl
L2xpbnV4L2JpdG1hcC5oOjksCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICBmcm9tCj4g
PiA+ID4gPiA+ID4gL2hvbWUvYW51cC9Xb3JrL3Jpc2N2LQo+ID4gPiA+ID4gdGVzdC9saW51eC9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaDo5LAo+ID4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgZnJvbQo+ID4gPiA+ID4gPiA+IC9ob21lL2FudXAvV29yay9yaXNjdi0KPiA+
IHRlc3QvbGludXgvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oOjkwLAo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJdCBsb29rcyB0aGVyZSdzIGEgY3ljbGljIGhlYWRl
ciBpbmNsdWRpbmcsIHdoaWNoIGxlYWRzIHRvIHRoaXMgYnVpbGQgZXJyb3IuCj4gPiA+ID4gPiA+
IEkgY2hlY2tlZCBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4L3RyZWUvbWFzdGVy
IGFuZAo+ID4gPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvdHJlZS9t
YXN0ZXIsIGJ1dCBJIGRvbid0IHNlZQo+ID4gPiA+ID4gPiAiYXNtL2NwdWZlYXR1cmUuaCIgaXMg
aW5jbHVkZWQgaW4gYXNtL2h3Y2FwLmg6OTAsIG1heWJlIEkgbWlzcwo+ID4gPiA+ID4gc29tZXRo
aW5nLAo+ID4gPiA+ID4gPiBjb3VsZCB5b3UgaGVscCBwb2ludCBtZSB0byB0aGUgcmVwby9icmFu
Y2ggSSBzaG91bGQgd29yayBvbj8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBGcm9tIE1BSU5UQUlORVJT
Ogo+ID4gPiA+ID4gICAgICAgUklTQy1WIEFSQ0hJVEVDVFVSRQo+ID4gPiA+ID4gICAgICAgLi4u
Cj4gPiA+ID4gPiAgICAgICBUOiAgICAgIGdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhl
IGZvci1uZXh0IGJyYW5jaCB0aGVyZSBpcyB3aGF0IHlvdSBzaG91bGQgYmUgYmFzaW5nIHdvcmsg
b24gdG9wIG9mLgo+ID4gPiA+ID4gQUZBSUNULCB5b3UndmUgbWFkZSBiaXRvcHMuaCBpbmNsdWRl
IGh3Y2FwLmggd2hpbGUgY3B1ZmVhdHVyZS5oCj4gPiBpbmNsdWRlcwo+ID4gPiA+ID4gYm90aCBi
aXRvcHMuaCAoaW5kaXJlY3RseSkgYW5kIGh3Y2FwLmguCj4gPiA+ID4KPiA+ID4gPiBUaGFua3Mg
Zm9yIHRoZSBpbmZvLCBidXQgSSBjYW4ndCByZXByb2R1Y2UgQW51cCdzIGJ1aWxkIGVycm9yIHdp
dGggdGhpcyBmb3ItCj4gPiBuZXh0IGJyYW5jaCwgY3B1ZmVhdHVyZS5oIGlzIG5vdCBpbmNsdWRl
ZCBieSBod2NhcC5oIHRoZXJlLgo+ID4gPiA+IE1heWJlIEFudXAgY291bGQgaGVscCBkb3VibGUg
Y2hlY2sgdGhlIHRlc3QgZW52aXJvbm1lbnQ/Cj4gPiA+Cj4gPiA+IEkgZmlndXJlZCB0aGF0IGNw
dWZlYXR1cmUuaCBpbmNsdWRlZCBpbiBod2NhcC5oIGlzIGFkZGVkIGJ5Cj4gPiA+IERyZXcncyBw
YXRjaCAiUklTQy1WOiBFbmFibGUgY2JvLnplcm8gaW4gdXNlcm1vZGUiCj4gPiAKPiA+IEkgdGhp
bmsgd2Ugc2hvdWxkIHByb2JhYmx5IHNwbGl0IGh3Y2FwLmggaW50byB0d28gcGFydHMuIFRoZSBk
ZWZpbmVzIHN0YXkKPiA+IGFuZCB0aGUgcmVzdCBjYW4gbW92ZSB0byBjcHVmZWF0dXJlLmgKPiAK
PiBPSywgSSB3aWxsIGJhc2Ugb24geW91ciBjYm8uemVybyBlbmFibGluZyBwYXRjaCBzZXJpZXMg
dG8gbWFrZSBhIG5ldyB2ZXJzaW9uLiBXaWxsIG1vdmUgc29tZSBjb250ZW50cyBmcm9tIGh3Y2Fw
LmggaW50byBjcHVmZWF0dXJlLmggc28gdGhhdCB3ZSBjYW4gcmVtb3ZlIHRoZSBpbmNsdWRpbmcg
b2YgY3B1ZmVhdHVyZS5oIGluIGh3Y2FwLmguCj4gCgpJIGp1c3QgcmVhbGl6ZWQgSSBmb3Jnb3Qg
dG8gQ0MgeW91IG9uIG15IHYzIHBvc3Rpbmcgb2YgdGhlIGNiby56ZXJvCnNlcmllc1sxXSB5ZXN0
ZXJkYXkuIFNvcnJ5IGFib3V0IHRoYXQuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjMwOTA0MTcwMjIwLjE2NzgxNi04LWFqb25lc0B2ZW50YW5hbWljcm8uY29tLwoKVGhhbmtz
LApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
