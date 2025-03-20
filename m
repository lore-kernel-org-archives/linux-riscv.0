Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA5DC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpyl55CbJgChXPlpKzi/tSnTcufXYoniqVu/YIhfwOI=; b=wyUPlMsVE8qMw7
	Mn8cTFX/HHyZExk88VvPTvhSNiq9Z97tnIGopXgRqUjHAuV2Cz6M45ta1DZrRwDWWRUMitNLnCd63
	ICz6U45koePLWBxlPFt7uF8ixkXpkvROjicdaql9JfHDcynOsRYejwx+7StBKAcSv0Hmxly0MAZZV
	BIwDYSThLJyZJKK/Ow/1PlR4LOWxVrOn2QOWCi55EuYWo14TjUwe7zx+hdax0vfWW3RPmSPRdDpjc
	ieTX6A/L217twx3PpvthCBdbNP75OmqWGq8sQBeUP2XHm6FVNsJ7NTWGPQhUpncTzi3OJe91MMjHS
	1LpvZqNVMQtwLVWPF1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOXo-0000000DOgz-0B2o;
	Thu, 20 Mar 2025 22:39:20 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOXl-0000000DOgZ-0CkE
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:39:18 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-726819aa3fcso843399a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742510356; x=1743115156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0fpBn8OJHb2DipzRLEI+UAj/Fv1bNkdtkXE17lBcc20=;
        b=NhI1qCjRvo7aPoXh2sgvdILa8bBcJYBXeiHFwkCW9Nxy2XnHBJM1segVrI4goBrNZH
         dlnmKN4Fcj94NlnFmyXpkFALggR0Xmze5teqc4zwZbNdSg6kzXfmLzLvTEcsmE/4X9r/
         S/+cnkGImgfi0fg7WRjx7BONpopz1pk/QYUbhUQ7FC5QeJs4GDOvCn1oNX8upSBS2oQy
         wmg3FI+JJt25mAd8QUFwBzZNp7f1xT3O36Sk1GDVClnyrX5XtyaHr+NKyM7+kN2SOzCv
         a4+1SC/xM9iWHkWkL3Em4lq3ZgNRl5jrq3W+zXZSkKdd+lr/qJXpTlOTtRzLdO+h2pqb
         Msmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510356; x=1743115156;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fpBn8OJHb2DipzRLEI+UAj/Fv1bNkdtkXE17lBcc20=;
        b=akp2v1Ajcn8z5bz//VedxhASoSqvUQ9B72n8DnElmPSr3h8i5Y8eE3a+KgsD4LPZJo
         G7fpbU3HYJEjT9N7Bo3oBkaoyZPJhyM2vNWhb7NzOp9uKskm4fJbHdmmuqV6lvG2P4HY
         7af43M1ePHBD5A6ggdmj+PmZ7KDR8vR5G67whLIvjlu2KMwo49gFAMcx7qzxFSybxdD2
         m0KnooquwidE4yHKl4J3PmjoxoNYU+/xJWLEe93uUHHcDLeunf0rcN9jCkYdbu5JyLHT
         TptUtBi5VNJLi61Lv4ySowDTevqpnsL7b+YgzT1ogqxA3I1n0vpKe17Yrkxq6YEy08Fo
         pHEQ==
X-Gm-Message-State: AOJu0Yzf7vGE7D1d4fGk4kuQNgxChb9DAlk+EXkdR6q9c39nUvT0iiLC
	xDMwZlY8u5l2dAoUSs4y3qsWM8v5rM2f1xSEuLbDjKVTAbkL3B91F4rP+fBRgeA=
X-Gm-Gg: ASbGncuMosSE4a2a0wGPv99cYvsjqroyw4nh5w2HGcl+y1CKJb7O3sWL/t/LGhsQqq3
	881j5mrbL4sZ/fjAcqubObBhpSCfAtm4sGvwyL4EWlZ6UmfwNE2vVaeEezCALOrzrJ48Fhgmvvn
	a8BSo9TBu8vxUFIyNKEDaCPjWDC7UkjdOGczb3y0WPL3XOAj5N9OhQ2T3YTY7mLrJ+ZFq8iBW0X
	3vNak/i5T8UVCFkWHmWmKQx/yeHEebkDuQdew8xcV6YUrUE+aQ0UYPPOp7sm0scmk8OVngvHXjx
	YlXNH7MuUoxvuXSs38siBx69CmiU7DuNk1S5EfqdZTxNkQl+fWct0516YH03F12yrmPUsm/D+8z
	3y/DO2c+JF1rofWwFWg==
X-Google-Smtp-Source: AGHT+IGazuW7zMOIIFe93a/pSjwb+ABWXp4kDIdJjL+/LiLiDiWbJ1EYQxh1QRi47IqHdMLVTvHmPg==
X-Received: by 2002:a05:6830:7302:b0:72a:1626:21e9 with SMTP id 46e09a7af769-72c0ae6a1f9mr908678a34.10.1742510355967;
        Thu, 20 Mar 2025 15:39:15 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c0abac23esm140838a34.7.2025.03.20.15.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 15:39:15 -0700 (PDT)
Message-ID: <84232793-9cba-4148-9875-d996e85b81be@riscstar.com>
Date: Thu, 20 Mar 2025 17:39:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
From: Alex Elder <elder@riscstar.com>
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Guodong Xu <guodong@riscstar.com>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <d625c473-789c-42f9-918c-8a649d058513@riscstar.com>
Content-Language: en-US
In-Reply-To: <d625c473-789c-42f9-918c-8a649d058513@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_153917_308821_FA276A8B 
X-CRM114-Status: GOOD (  25.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMy8xMS8yNSA2OjE5IFBNLCBBbGV4IEVsZGVyIHdyb3RlOgo+IE9uIDMvNi8yNSAxMTo1NyBB
TSwgSGF5bGVuIENodSB3cm90ZToKPj4gVGhlIGNsb2NrIHRyZWUgb2YgSzEgU29DIGNvbnRhaW5z
IHRocmVlIG1haW4gdHlwZXMgb2YgY2xvY2sgaGFyZHdhcmUKPj4gKFBMTC9ERE4vTUlYKSBhbmQg
aGFzIGNvbnRyb2wgcmVnaXN0ZXJzIHNwbGl0IGludG8gc2V2ZXJhbCBtdWx0aWZ1bmN0aW9uCj4+
IGRldmljZXM6IEFQQlMgKFBMTHMpLCBNUE1VLCBBUEJDIGFuZCBBUE1VLgo+Pgo+PiBBbGwgcmVn
aXN0ZXIgb3BlcmF0aW9ucyBhcmUgZG9uZSB0aHJvdWdoIHJlZ21hcCB0byBlbnN1cmUgYXRvbWlj
aXkKPj4gYmV0d2VlbiBjb25jdXJyZW50IG9wZXJhdGlvbnMgb2YgY2xvY2sgZHJpdmVyIGFuZCBy
ZXNldCwKPj4gcG93ZXItZG9tYWluIGRyaXZlciB0aGF0IHdpbGwgYmUgaW50cm9kdWNlZCBpbiB0
aGUgZnV0dXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIYXlsZW4gQ2h1IDxoZXlsZW5heUA0ZDIu
b3JnPgo+IAo+IEknbSB2ZXJ5IGdsYWQgeW91IGhhdmUgdGhlIERUIGlzc3VlcyByZXNvbHZlZCBu
b3cuCj4gCj4gSSBhZ2FpbiBoYXZlIGxvdHMgb2YgY29tbWVudHMgb24gdGhlIGNvZGUsIGFuZCBJ
IHRoaW5rIEkndmUKPiBpZGVudGlmaWVkIGEgZmV3IGJ1Z3MuwqAgTW9zdCBvZiBteSBjb21tZW50
cywgaG93ZXZlciwgYXJlCj4gc3VnZ2VzdGluZyBtaW5vciBjaGFuZ2VzIGZvciBjb25zaXN0ZW5j
eSBhbmQgcmVhZGFiaWxpdHkuCj4gCj4gSSdtIGdvaW5nIHRvIHNraXAgb3ZlciBhIGxvdCBvZiAi
Y2N1LWsxLmMiIGJlY2F1c2UgbW9zdCBvZiB3aGF0IEkKPiBzYXkgYXBwbGllcyB0byB0aGUgZGVm
aW5pdGlvbnMgaW4gdGhlIGhlYWRlciBmaWxlcy4KCkZZSSBJIGVuY291bnRlcmVkIGEgcHJvYmxl
bSBJIG1lbnRpb25lZCBiZWxvdy4KCi4gLiAuCgo+PiArLyogZnJlcXVlbmN5IHVuaXQgTWh6LCBy
ZXR1cm4gcGxsIHZjbyBmcmVxICovCj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBjY3VfcGxsX2dl
dF92Y29fZnJlcShzdHJ1Y3QgY2xrX2h3ICpodykKPj4gK3sKPj4gK8KgwqDCoCBjb25zdCBzdHJ1
Y3QgY2N1X3BsbF9yYXRlX3RibCAqcGxsX3JhdGVfdGFibGU7Cj4+ICvCoMKgwqAgc3RydWN0IGNj
dV9wbGwgKnAgPSBod190b19jY3VfcGxsKGh3KTsKPj4gK8KgwqDCoCBzdHJ1Y3QgY2N1X2NvbW1v
biAqY29tbW9uID0gJnAtPmNvbW1vbjsKPj4gK8KgwqDCoCB1MzIgc3djcjEsIHN3Y3IzLCBzaXpl
Owo+PiArwqDCoMKgIGludCBpOwo+PiArCj4+ICvCoMKgwqAgY2N1X3JlYWQoc3djcjEsIGNvbW1v
biwgJnN3Y3IxKTsKPj4gK8KgwqDCoCBjY3VfcmVhZChzd2NyMywgY29tbW9uLCAmc3djcjMpOwo+
IAo+IFlvdSBhcmUgbWFza2luZyBvZmYgdGhlIEVOIGJpdCwgYnV0IHlvdSBzaG91bGQgcmVhbGx5
IGJlCj4gdXNpbmcgYSBtYXNrIGRlZmluaW5nIHdoaWNoIGJpdHMgYXJlIHZhbGlkIGluc3RlYWQu
wqAgQXMKPiBJIHNhaWQgZWFybGllcjoKPiAKPiAjZGVmaW5lIFNQQUNFTUlUX1BMTF9TV0NSM19N
QVNLwqDCoMKgIH4oU1BBQ0VNSVRfUExMX1NXQ1IzX0VOKQo+IAo+PiArwqDCoMKgIHN3Y3IzICY9
IH5QTExfU1dDUjNfRU47Cj4gCj4gIMKgwqDCoMKgc3djcjMgJj0gU1BBQ0VNSVRfUExMX1NXQ1Iz
X01BU0s7Cj4+ICsKPj4gK8KgwqDCoCBwbGxfcmF0ZV90YWJsZSA9IHAtPnBsbC5yYXRlX3RibDsK
Pj4gK8KgwqDCoCBzaXplID0gcC0+cGxsLnRibF9zaXplOwo+PiArCj4+ICvCoMKgwqAgZm9yIChp
ID0gMDsgaSA8IHNpemU7IGkrKykgewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHBsbF9yYXRlX3Rh
YmxlW2ldLnN3Y3IxID09IHN3Y3IxICYmCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBsbF9y
YXRlX3RhYmxlW2ldLnN3Y3IzID09IHN3Y3IzKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gcGxsX3JhdGVfdGFibGVbaV0ucmF0ZTsKPj4gK8KgwqDCoCB9Cj4+ICsKPiAKPiBJIGhh
dmUgYSBnZW5lcmFsIHF1ZXN0aW9uIGhlcmUuwqAgT25jZSB5b3Ugc2V0IG9uZSBvZiB0aGVzZQo+
IGNsb2NrIHJhdGVzLCBpdCB3aWxsIGFsd2F5cyB1c2Ugb25lIG9mIHRoZSByYXRlcyBkZWZpbmVk
Cj4gaW4gdGhlIHRhYmxlLgo+IAo+IEJ1dCB3aGF0IGFib3V0IGluaXRpYWxseT/CoCBDb3VsZCB0
aGUgaGFyZHdhcmUgc3RhcnQgaW4gYQo+IHN0YXRlIHRoYXQgaXMgbm90IGRlZmluZWQgYnkgdGhp
cyBjb2RlP8KgIERvIHlvdSAqc2V0KiB0aGUKPiByYXRlIGluaXRpYWxseT/CoCBTaG91bGQgeW91
IChhdCBsZWFzdCB0aGUgZmlyc3QgdGltZSB0aGUKPiBjbG9jayBpcyBwcmVwYXJlZC9lbmFibGVk
KT8KCldoZW4gZG9pbmcgc29tZSB0ZXN0aW5nIHRvZGF5IEkgZm91bmQgdGhhdCB0aGUgV0FSTl9P
Tl9PTkNFKCkKZ290IGNhbGxlZC4gIEkgYWRkZWQgc29tZSBpbmZvcm1hdGlvbiBhbmQgbGVhcm5l
ZCB0aGF0IHRoZQp2YWx1ZXMgaW4gaGFyZHdhcmUgb2YgdGhlIHN3Y3IxIGFuZCBzd2NyMyByZWdp
c3RlcnMgd2VyZToKICAgc3djcjE6ICAweDAwNTBjZDYxCiAgIHN3Y3IzOiAgMHgzZmUwMDAwMApJ
J20gbm90IHN1cmUgd2hpY2ggUExMIHdhcyBiZWluZyB1c2VkLgoKU28gY2xlYXJseSB0aGlzIGNh
biBoYXBwZW4uICBTb21laG93IHlvdSBuZWVkIHRvIGZpbmQgYSB3YXkKdG8gZW5zdXJlIHRoYXQg
dGhlc2UgcmVnaXN0ZXJzIGFyZSBpbml0aWFsaXplZCB0byBhIHNhbmUKc3RhdGUgKG1lYW5pbmcg
b25lIGRlZmluZWQgd2l0aGluIHBsbF9yYXRlX3RhYmxlW10pLgoKCQkJCQktQWxleAoKPj4gK8Kg
wqDCoCBXQVJOX09OX09OQ0UoMSk7Cj4gCj4gTWF5YmUgV0FSTl9PTkNFKHRydWUsICJtc2ciKTsu
IC4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
