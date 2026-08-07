Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E55CC5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QkStPn5YB1y9FDmX24jpdwlt5surQCv1t3rsKwGrmc=; b=QagyfLEwD8DEtf
	TIgLMm/RkevooXaldyEEuIU+rPjp/Tdm9ugJc3Ju66Ge9zoWquEh2+wEmNibQYaKydo2T2jw4Hc7b
	+9y+tDM7Gf48RuhVQoHyqiWuSxAKwu6mujWoLJ+nXcetwyVFCki47UAIFHOsh+pl/n/Wxy3Kmr4nn
	eh0ESXHkCdcdC1rX5tTjxO22gm6aLN2hVo5xkVdi6xCO6rkJGeCVBR0giPbf9/fleAHJeaue4wB//
	UcIi/XRVNpmM534OjQTbABMf8vmmzCzpQfyDBTQ9KC198J0eRxhgZS1TIun3gtGQX+JRFoNEIpLlJ
	DxauW5mcfZip/Z5WIBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFST-00000007JVY-3DLM;
	Fri, 07 Aug 2026 07:57:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFSR-00000007JUy-31pK
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CW77S2KS53iUGhDCuDUUq6n8FNmbEq3lDEq9IFk7LgY=; b=EMwnZnvXSSPT4LJOAmshwscIHy
	6gupPoD12vjr8Ury8pvGnVUTzspwEEM7jYfY4quMa4snLOXZe6/FtGYuFHw6aC8RCGwBTfAWyArzM
	ElRer/1e/ZjTYKi3ddY51SSu2/7wJSWbtch+cIkQ0wKwzQUjsjV7aVzS3nHhLfXKA2iUJvCWX92eE
	r/Km5trsXAQ7A+lcBvEKWVUx5M3tMw1O0uDc1GYkSa8F7GSy1AV/bxgWMZsXtpIzVVxnOYoQIH6bs
	SFG6b+sgpvTi/6ynTVw39Segrvc0shihDf+IPNjITMKcrZ+ljD+hKLRUQ6Pok/PINlf5z3uT7gVbW
	Cj0FNDVg==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFSO-0000000CA6n-2Icm
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:57:34 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84a2dcede83so4375042b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786089450; x=1786694250; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CW77S2KS53iUGhDCuDUUq6n8FNmbEq3lDEq9IFk7LgY=;
        b=iMjNTYEUfwcFWoY/BiFyMCOMw9ANKbepe2wzOneS6T70gULNEhJxS/kj0GjXS0anI9
         xpUdwtHMTseF5AxSf/ChJSshIbKrLJ8nyGjXwGDisGv82Pz3mg5EH8kc5X6YX4WR9cJ/
         uuhb68z/XLjRYCEuEfbQwAQFh+5uO0GkZmbRt4RGV0CLQLEWoWbqi/ZAHGIm8sZqotwY
         nARH8gqBByBAwYKH8suMA7z4HT17eZ95+BstyiKo8YEOSKrdLOCgiXoSUKzdgIYhBGpr
         /cngLrhF6UFocJhHgi+f+MEIBVzeALmJyj7tMaPG5FNuLFaTkFwKCQxhidgaz+FWYxj5
         oWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089450; x=1786694250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CW77S2KS53iUGhDCuDUUq6n8FNmbEq3lDEq9IFk7LgY=;
        b=NB1gff/fn6YWy6bowtb3sqZLwuq4HFSG5bMraAbzpCJa0iztMD2prUNcluN0eXQ6VQ
         n6pkc51xMONrCZlH70+/k4w8XYYspXIHmCxTDDdr4JqxvJEIReI7YwuquFSx5s9+4bgK
         jDqMyQ1J0RKGC3de9C3941UeVtjUIIV9pKnwPdAWkH38QyhS5I5byB+KdAU9KqY7Rp2C
         dnvDGDtz4FYNF59eXKS7kLoNVP6IMZI7nMcSfvOmL6FFO9aVl14v8qVDK3F9h1YFuBzm
         fiXZXWMimXp366rSoTTZdavlZyWukkj6EoNdSU04F1Hjgt/32RWL8ulSoTw/QSxf+kvG
         PaNA==
X-Forwarded-Encrypted: i=1; AHgh+RrdX1rCCqjzUxRFZrrbEeoeZfnenFXDIcQ/hGYzNAx9y5bwvdNYL/yWhmKRb6Z5PPXRMfW0JkWZDeb7Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw84CspCiFX7yuqzkOPaPLN+C0e0b9KjKes87qvSUVUA7eaKUI6
	G2uQLkdiO8ewd7pkZGMZq/V5/2xX1Lgc7HSwGTI39gRzC/MADfVrpka2PHMJ4jRWXQE=
X-Gm-Gg: AR+sD10sODtVJiZqr9MuHiiQIig8UDgyQHiOsc2PEghcAWqzqY56EvO8im84UKAcLJh
	OPho8UH4IWYw9ftgh8XUVe0IQqkp5ot6fLtQwEOLxRIguuaRXmQPYWp3/4eeE+gM3YINNMmyyVn
	pTlGewB7fmgGmB1l7CUhG5QODWZQA0J8qOPDDtN64/gHt0vDWp9+9dVrVRgL8/GuIcQBtaQ1wYk
	8P5bLdpXMjW2TXKhXjDK2AFr1/iRmmYkL0tdfoAxx0Jqn+rN4dfEDOsthFbtMtg3mCXSW5uRU4n
	9VuDDFfn+bt76/hQXN8i6uAGk3Nx03AeUqAyqFLUmmrKFpfgpeMFE7Q00MkYloR3LP2QZ/EbK4m
	ed9dey/PetCVjCl52ryIa+G2+iP1ducZv/2yvrYtLh1m1JDwctWXR3CVGQJp9ZyxaH2uVf2og6e
	nyiOR9yTPQIZoHmCNv3ncuDXByZKFCswHME19jIt0Y7135sj9D4dvHWjO+XOOL
X-Received: by 2002:a05:6a00:8d96:b0:848:467d:293b with SMTP id d2e1a72fcca58-84f5df78196mr2125649b3a.11.1786089449949;
        Fri, 07 Aug 2026 00:57:29 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5528adsm611851b3a.45.2026.08.07.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:57:29 -0700 (PDT)
Date: Fri, 7 Aug 2026 15:57:20 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: anup@brainfault.org, guodong@riscstar.com,
	pincheng.plct@isrc.iscas.ac.cn, alex@ghiti.fr,
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, michal.simek@amd.com,
	dave.patel@riscstar.com, pjw@kernel.org,
	linux-riscv@lists.infradead.org, zhangchunyan@iscas.ac.cn,
	raymond.mao@riscstar.com, palmer@dabbelt.com,
	greentime.hu@sifive.com, dfustini@oss.tenstorrent.com,
	luxu.kernel@bytedance.com, conor+dt@kernel.org,
	akpm@linux-foundation.org, scott@riscstar.com, jim.shu@sifive.com,
	krzk+dt@kernel.org, robin.randhawa@sifive.com, zong.li@sifive.com,
	pawandeep.oza@oss.qualcomm.com, nick.hu@sifive.com,
	samuel.holland@sifive.com, darshan.prajapati@einfochips.com,
	junhui.liu@pigmoral.tech, dlan@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Message-ID: <anWP4Gyx9H3bMwUE@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-3-peter.lin@sifive.com>
 <178534841698.3259786.10094204605740986474.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178534841698.3259786.10094204605740986474.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_085732_806756_8D93C044 
X-CRM114-Status: GOOD (  14.31  )
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

SGkgYWxsLAoKT24gV2VkLCBKdWwgMjksIDIwMjYgYXQgMDE6MDY6NTlQTSAtMDUwMCwgUm9iIEhl
cnJpbmcgKEFybSkgd3JvdGU6Cj4gCj4gT24gVGh1LCAzMCBKdWwgMjAyNiAwMDozOTowNyArMDgw
MCwgWXUtQ2hpZW4gUGV0ZXIgTGluIHdyb3RlOgo+ID4gQWRkIHBlci1oYXJ0IERUIHByb3BlcnRp
ZXMgZm9yIHRoZSBSSVNDLVYgV29ybGRzIGFyY2hpdGVjdHVyZToKPiA+IHJpc2N2LHBtd2lkLCBy
aXNjdixwbXdpZGxpc3QsIGFuZCByaXNjdixwbWx3aWRsaXN0LiBUaGVzZQo+ID4gcGxhdGZvcm0t
ZGVmaW5lZCB2YWx1ZXMgYXJlIHByaW1hcmlseSB1c2VkIGJ5IE0tbW9kZSBmaXJtd2FyZQo+ID4g
dG8gY29uZmlndXJlIFdvcmxkIElEIENTUnMgYW5kIHJlc3RyaWN0IFdJRCB1c2FnZSBhY3Jvc3MK
PiA+IHByaXZpbGVnZSBsZXZlbHMuCj4gPiAKPiA+IEFsc28gYWRkIHNjaGVtYSB2YWxpZGF0aW9u
IHJ1bGVzIHRvIGVuZm9yY2UgdmFsaWQgcHJvcGVydHkKPiA+IGNvbWJpbmF0aW9ucyBiYXNlZCBv
biB0aGUgSVNBIGV4dGVuc2lvbnMgcHJlc2VudC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogWXUt
Q2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCAgICAgICB8IDYxICsrKysrKysrKysr
KysrKwo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3dvcmxkcy55YW1sICAgICB8
IDc3ICsrKysrKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEzOCBpbnNlcnRp
b25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi93b3JsZHMueWFtbAo+ID4gCj4gCj4gTXkgYm90IGZvdW5kIGVycm9ycyBy
dW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4gCj4geWFtbGxp
bnQgd2FybmluZ3MvZXJyb3JzOgo+IAo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Cj4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NwdS9pZGxlLXN0YXRlcy5leGFtcGxl
LmR0YjogY3B1QDAgKHJpc2N2KTogJ3Jpc2N2LHBtd2lkJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5
Cj4gCWZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmlzY3Yv
Y3B1cy55YW1sCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NwdS9pZGxlLXN0
YXRlcy5leGFtcGxlLmR0YjogY3B1QDEgKHJpc2N2KTogJ3Jpc2N2LHBtd2lkJyBpcyBhIHJlcXVp
cmVkIHByb3BlcnR5Cj4gCWZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvcmlzY3YvY3B1cy55YW1sCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2NwdS9pZGxlLXN0YXRlcy5leGFtcGxlLmR0YjogY3B1QDEwIChyaXNjdik6ICdyaXNjdixwbXdp
ZCcgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQo+IAlmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3Jpc2N2L2NwdXMueWFtbAo+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jcHUvaWRsZS1zdGF0ZXMuZXhhbXBsZS5kdGI6IGNwdUAxMSAocmlzY3Yp
OiAncmlzY3YscG13aWQnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAJZnJvbSBzY2hlbWEgJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9yaXNjdi9jcHVzLnlhbWwKCkkgcGxhbiB0
byByZW1vdmUgdGhlICdyZXF1aXJlZCcgY2hlY2sgZm9yIHJpc2N2LHBtd2lkIGluIHRoZSBuZXh0
CnZlcnNpb24uIFRoZSByaXNjdixwbXdpZCBwcm9wZXJ0eSBpcyBpbnRlbmRlZCB0byBwcm92aWRl
IGEgdmFsaWQKZmFsbGJhY2sgd2hlbiBTLWRvbWFpbiBXSUQgaXMgbm90IHNwZWNpZmllZC4gVGhp
cyBpcyBhIHBsYXRmb3JtCmludGVncmF0aW9uIHJlc3BvbnNpYmlsaXR5LCBub3QgYSBzY2hlbWEt
ZW5mb3JjZWQgY29uc3RyYWludC4KClRoZSBuZXh0IHZlcnNpb24gd2lsbCBvbmx5IHJldGFpbiBw
cm9oaWJpdGl2ZSBjaGVja3Mg4oCUIGUuZy4sIGlmIHRoZQpzbXdpZCBleHRlbnNpb24gaXMgYWJz
ZW50LCByaXNjdixwbXdpZGxpc3QgbXVzdCBub3QgYmUgcHJlc2VudC4KClJlZ2FyZHMsClBldGVy
IExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
