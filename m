Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DB8C98325
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0OaNJ/Yh0d7lp/oZWC7VJAa4pObROf9uaLZEtxdq4U=; b=iWd3y3bYWEGq5W
	fQmKFrlkSXUV/z9kAq7WOCO78LUy2ZraBUKzuch5pwTceGLicuxJxOnwzCbI5OMnbTRrT1PDc2en1
	1FwmsY9zn2PdjIxYxeyVe+VxIu9VV1d9GBHR7L9NVrpKa78PDgDpjLqVtf0nhhBSckq4qadDLaDYp
	MQChJqOyopY9zpnboYGExAKtHPG+WyG2wg4fmol3f5kRza66VYP2KcXfeXQ3hyAYvPsK0b6N3UOrG
	gw/CX4BXFUYMO5zalX46cLfktV1MWDgRHlFXpdj0khcS1eJ7JnrQeN7rC+T6U2GCA8uvY71i+6+fC
	CvdQw/Epi2I9hqXdHE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8DF-0000000DrMa-0IK1;
	Fri, 25 Sep 2026 15:51:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8DD-0000000DrLm-1XFk
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=noVybGNNqVJKCVT0Wn7kCfbdAb1ukBVBJPW474QG+2s=; b=MZNewUENMC4YJoMsi2aqMkGxos
	AuxS4upYCDCo+i/n22ViR9vJDH5S+eSvU3X3rnzyxAD5KrBJIPHKtFcJta6SjDlh7EYWsvZI7zizg
	wnD3tOB8D9LFHbKNkZAM1ln/wghJRJkq8fucvQqt/8Ab/1+fmE3/Qzk9OceBH9XeEab/e7XehVrNi
	TnaK0XnX79u/9OePaUtgtj2+johJTsE7o4mlNSnJL2nCbWWRc1sdwTU+dMSov8352ALZBCoew2GyL
	GAYrt6KXGDTc0+1w6DD7396s3si1oyc1Rj1xRJqqkg9F8NYKH32XVaZTZvPZqfTBvlWfsU3dTz42h
	FPyKRn2A==;
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA8DA-0000000H5iv-2cRc
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:51:46 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48884b021dbso32178f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351502; cv=none;
        d=google.com; s=arc-20260327;
        b=ogkfRFNdB0Iy4IWBDrUAomE3R0k6FP2BDPS1usInavPsTl/cAMkimbA3TjJL/Nd7MP
         COaEpjD/GrBB1zG7BceR7ah8vVLz8D2XHGJ9JO8X0HNxNnQxFiuI9+t9Wp0SbcB88v1U
         KafSxxOZ0jkHW3XObBOvmeH1wzlNwANLiUWu5OtMi4bD7LvQYFaJoPSndiQhQGRtRn6T
         /OMXme1LZs3WMljW5Xqyshmx9+OdRc6R93xCPdQa0baieQIhdZejo3Jztywpe8vGoMZ5
         pmryTVVhSmJ37BwVAANRDyGyJN97f5sX4PyRLJUv0srL/cytHItIHLOl6vQ8IGZYQVKm
         j96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=noVybGNNqVJKCVT0Wn7kCfbdAb1ukBVBJPW474QG+2s=;
        fh=H5WwhnEgaNaZTKk19GJ1ONBlqCz1A00/ER6CJ4P2t28=;
        b=fqOw+KPYV0xbie4DbjTayWyxhEFiBoB8v7Fqoqu8kTnXimuLu0fBjb+gWTTQxmrdSr
         60vQSYT7GKn2nU9oJ5PIPE2mPOLN5S0tQJYa+rEXIOgW3mem9Nhbh5bHeWHIBfXEw8PW
         522ikZa0SJrj8GY+Gb/6MdvAXmsC2+2VcuciUHJm+UWPnmxLSa0kDSjfBnFAnOEHJuns
         tDjV3gMwObu+tnHajSy2NApjscGQRlV+snloZcA6r9xBOnbBi9gzzkwabPvpdeRSeedO
         q7wRPL4AQJ1rZuTEHZmKaSXzwUkxUNlSu4TTEzFnzQydWvwf6wEx9qx2I1GSPQtM+/nI
         CHiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790351502; x=1790956302; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=noVybGNNqVJKCVT0Wn7kCfbdAb1ukBVBJPW474QG+2s=;
        b=P9bd6r9hH4DmAe8vqb+NIoBVV7bF0N+30Ue2hFQZB4/6o1bjx6qH5qVZJoBc7cwlWH
         Ol2ZfSUS3AiaS+wxKW73JzYwArEQkrflHtNBXNv03WhKXv4vMVSTH5G2PAqMBZW27IO1
         cI59IkoFEJjUchXdFu2FwUnyWER3VyVFKBZhe19JLT3UdKO9KXqUhWNqVyc6aSxIqLMs
         caVXhQYte1v8s4UqGHVTqWjS07DGOCPMsU4H0h78RGtsF4aTg3+4kP81vZqe3tKgpAsn
         WwyY7tmII+YigZKkWCMrlDdClFzXUdENx48/yWdcfGS7P+yf84/0Gj6yKp7hwoHMyPQN
         hSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351502; x=1790956302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noVybGNNqVJKCVT0Wn7kCfbdAb1ukBVBJPW474QG+2s=;
        b=d3xvR+hgUbNopN8DzbS9M8YBYkGgnbvSMFq/e/c6Gb2iQbftUoXALH4gB9Fx5yCChU
         DUuYqXdtUPTo3HzghbJBB5gMjQxkSsqjk+r3SvB7wEBmpQHZnl/bbrp6t4rfcNw6+xBR
         1ZK+qOzcfPEqPSl1sisfxUyqQlYqU7vhT8fAQ5i0gcvLogGYNWn86KaxGV82/6YXQ1cy
         Si7JfgGpqqZM/AEUYs6mL9K+ocPHzXXWOEtOfbIN5SV9Cd4iMEEqtAPRN7Gge+UoGGIY
         sdrkANnt6DW2B3j7RwCozW1gYTUP26e3FI7IxFgqlITyAAZ6nsvgLVPY+b4W6DSqsBV6
         xjWw==
X-Gm-Message-State: AFuF++laY0poBkOIfAIpgXK2VXHL4mXJ2MbDQh6X3WzLw1PJMJyhmBCh
	rtE6XX31bxKNvWHANfcgL3HOp/HXy5XZkhEuXE9vUq6BPSLNOFQ7E1kxuLNVcPsYmLdUgJvCT4u
	XwxWBa0hO7Cpp4eeZ4lloM9aLpqDrxI5f93xgk2aITA==
X-Gm-Gg: AYBFou19FR8hCN29OZPQT1AkvRX5T/ad9udcf7HcDJb1AfHvYRwryv1RFtOS8lbcFmk
	BQppprydglFNthopsmjsUezcJR8D3csIuRVlzUt8pC6ktVvRsBFy6LqQo8O1VsNPLrwOzawQ0pq
	a5ipNLF8YvNTkAoXIQWtq+8Tek5fO8dT7DFe2aZaoFPHWSl373bZ/IlmIQNA2tRIBxY0D1tRM47
	/7G1LlatwzZLYqaOtW6RW5VuFAJHYRdPbvSz49ILzuPMAOb0ss2bDKlL4qzetR0nChcJpJx1QSK
	6x69ePggSiOgNF/+n+GX1gGbNZapZtv3bnw9CwdN5BZ4YBtzLIWLeZYQlV5OYFD1pn0lU4flcxl
	xmYZY5ZAb09GDhJZG4JXqs4yaXalDcrI6Vn14nVhWu9xUX1kr+ZEyRtRKMjEWUvwuSyQl9Kagq5
	M=
X-Received: by 2002:a5d:5e88:0:b0:487:9a9:6d24 with SMTP id
 ffacd0b85a97d-4887171a503mr9892842f8f.19.1790351502520; Fri, 25 Sep 2026
 08:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com> <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Sep 2026 21:21:28 +0530
X-Gm-Features: AclHuK9Smh7rGiwz-QHNVaoPdbwbyf3R_ZUrSV-K4y97wOA8f1Kpw1Exnt_jFjc
Message-ID: <CAAhSdy37AUsq0ixwiaGz5HwSJw+jTAonoCHG5Oi8h5=Hw+bXrw@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] irqchip/riscv-imsic: Add MSI address list
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, tglx@kernel.org, 
	kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_165144_777916_A9ADE59C 
X-CRM114-Status: GOOD (  21.48  )
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

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgODo0N+KAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVXBjb21pbmcgUklTQy1WIElPTU1VIGlu
dGVycnVwdCByZW1hcHBpbmcgbmVlZHMgdG8gbWFwIGV2ZXJ5IHBvc3NpYmxlCj4gaG9zdCBJTVNJ
QyB0YXJnZXQgaW50byBvbmUgY29udGlndW91cyBNU0kgSU9WQSByYW5nZS4gTVNJIG1lc3NhZ2UK
PiBjb21wb3NpdGlvbiB0aGVuIHVzZXMgdGhlIHRhcmdldCBDUFUncyBwb3NpdGlvbiB3aXRoaW4g
dGhhdCByYW5nZS4KPgo+IEJ1aWxkIGFuIElNU0lDIHBoeXNpY2FsIGFkZHJlc3MgYXJyYXkgaW5k
ZXhlZCBieSBsb2dpY2FsIENQVS4KPiBSZXF1aXJlIGV2ZXJ5IHBvc3NpYmxlIENQVSB0byBoYXZl
IGFuIGluaXRpYWxpemVkIElNU0lDIHBhZ2UgYmVmb3JlCj4gcHVibGlzaGluZyB0aGUgYXJyYXku
IFRoaXMgcHJlc2VydmVzIHBoeXNpY2FsIGFkZHJlc3MgemVybyBhcyBhIHZhbGlkCj4gdGFyZ2V0
IGFuZCBndWFyYW50ZWVzIHRoZSBhcnJheSBoYXMgbnVtX3Bvc3NpYmxlX2NwdXMoKSBlbnRyaWVz
Lgo+Cj4gVGhlIGFycmF5IHNpemUgYW5kIGVhY2ggdGFyZ2V0J3MgaW5kZXggY2FuIHRoZXJlZm9y
ZSBiZSBkZXJpdmVkCj4gZGlyZWN0bHksIHdpdGhvdXQgc3RvcmluZyBkdXBsaWNhdGUgY291bnQg
b3IgcGVyLUNQVSBpbmRleCBtZXRhZGF0YS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25l
cyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+Cj4gVGVzdGVkLWJ5OiBGYW5neXUgWXUg
PGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KCkxHTVQuCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW1zaWMtc3RhdGUuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5oIHwgIDMgKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1z
aWMtc3RhdGUuYwo+IGluZGV4IGRmMzhhNzY3MGE4OS4uYWJkMWNkYjY0MGVhIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+ICsrKyBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IEBAIC03MDksNiArNzA5LDMxIEBA
IHN0YXRpYyBpbnQgX19pbml0IGltc2ljX2dldF9tbWlvX3Jlc291cmNlKHN0cnVjdCBmd25vZGVf
aGFuZGxlICpmd25vZGUsCj4gICAgICAgICByZXR1cm4gb2ZfYWRkcmVzc190b19yZXNvdXJjZSh0
b19vZl9ub2RlKGZ3bm9kZSksIGluZGV4LCByZXMpOwo+ICB9Cj4KPiArc3RhdGljIGludCBfX2lu
aXQgaW1zaWNfaW5pdF9tc2lfcGFfbGlzdCh2b2lkKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgaW1z
aWNfZ2xvYmFsX2NvbmZpZyAqZ2xvYmFsID0gJmltc2ljLT5nbG9iYWw7Cj4gKyAgICAgICBwaHlz
X2FkZHJfdCAqbXNpX3BhX2xpc3Q7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgY3B1Owo+ICsKPiAr
ICAgICAgIG1zaV9wYV9saXN0ID0ga2NhbGxvYyhudW1fcG9zc2libGVfY3B1cygpLCBzaXplb2Yo
Km1zaV9wYV9saXN0KSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBpZiAoIW1zaV9wYV9saXN0KQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICAgICBmb3JfZWFjaF9w
b3NzaWJsZV9jcHUoY3B1KSB7Cj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBpbXNpY19sb2NhbF9j
b25maWcgKmxvY2FsID0gcGVyX2NwdV9wdHIoZ2xvYmFsLT5sb2NhbCwgY3B1KTsKPiArCj4gKyAg
ICAgICAgICAgICAgIGlmICghbG9jYWwtPm1zaV92YSkgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGtmcmVlKG1zaV9wYV9saXN0KTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT0RFVjsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgbXNpX3Bh
X2xpc3RbY3B1XSA9IGxvY2FsLT5tc2lfcGE7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgaW1z
aWMtPm1zaV9wYV9saXN0ID0gbXNpX3BhX2xpc3Q7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+
ICsKPiAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfcGFyc2VfZndub2RlKHN0cnVjdCBmd25vZGVf
aGFuZGxlICpmd25vZGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnICpnbG9iYWwsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHUzMiAqbnJfcGFyZW50X2lycXMsCj4gQEAgLTk1OSw2ICs5ODQsMTIg
QEAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndu
b2RlLCB2b2lkICpvcGFxdWUpCj4gICAgICAgICAgICAgICAgIGdvdG8gb3V0X2xvY2FsX2NsZWFu
dXA7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIHJjID0gaW1zaWNfaW5pdF9tc2lfcGFfbGlzdCgp
Owo+ICsgICAgICAgaWYgKHJjKSB7Cj4gKyAgICAgICAgICAgICAgIHByX2VycigiJXBmd1A6IGZh
aWxlZCB0byBpbml0aWFsaXplIE1TSSBhZGRyZXNzIGxpc3RcbiIsIGZ3bm9kZSk7Cj4gKyAgICAg
ICAgICAgICAgIGdvdG8gb3V0X2xvY2FsX2NsZWFudXA7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAg
ICAgLyogSW5pdGlhbGl6ZSBtYXRyaXggYWxsb2NhdG9yICovCj4gICAgICAgICByYyA9IGltc2lj
X21hdHJpeF9pbml0KCk7Cj4gICAgICAgICBpZiAocmMpIHsKPiBAQCAtOTg0LDYgKzEwMTUsNyBA
QCBpbnQgX19pbml0IGltc2ljX3NldHVwX3N0YXRlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25v
ZGUsIHZvaWQgKm9wYXF1ZSkKPiAgb3V0X2ZyZWVfbG9jYWw6Cj4gICAgICAgICBmcmVlX3BlcmNw
dShpbXNpYy0+Z2xvYmFsLmxvY2FsKTsKPiAgb3V0X2ZyZWVfcHJpdjoKPiArICAgICAgIGtmcmVl
KGltc2ljLT5tc2lfcGFfbGlzdCk7Cj4gICAgICAgICBrZnJlZShpbXNpYyk7Cj4gICAgICAgICBp
bXNpYyA9IE5VTEw7Cj4gICAgICAgICByZXR1cm4gcmM7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaCBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlz
Y3YtaW1zaWMtc3RhdGUuaAo+IGluZGV4IGM0MmVlMTgwYjMwNS4uZTUxYzYxZGNjZWQzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaAo+ICsrKyBi
L2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaAo+IEBAIC01MCw2ICs1MCw5
IEBAIHN0cnVjdCBpbXNpY19wcml2IHsKPiAgICAgICAgIC8qIEdsb2JhbCBjb25maWd1cmF0aW9u
IGNvbW1vbiBmb3IgYWxsIEhBUlRzICovCj4gICAgICAgICBzdHJ1Y3QgaW1zaWNfZ2xvYmFsX2Nv
bmZpZyAgICAgICAgICAgICAgZ2xvYmFsOwo+Cj4gKyAgICAgICAvKiBNU0kgdGFyZ2V0IHBoeXNp
Y2FsIGFkZHJlc3NlcyBpbmRleGVkIGJ5IGxvZ2ljYWwgQ1BVIGZvciBJT01NVSBtYXBwaW5nICov
Cj4gKyAgICAgICBwaHlzX2FkZHJfdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKm1zaV9w
YV9saXN0Owo+ICsKPiAgICAgICAgIC8qIFBlci1DUFUgc3RhdGUgKi8KPiAgICAgICAgIHN0cnVj
dCBpbXNpY19sb2NhbF9wcml2IF9fcGVyY3B1ICAgICAgICAqbHByaXY7Cj4KPiAtLQo+IDIuNDMu
MAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
