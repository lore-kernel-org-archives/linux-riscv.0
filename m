Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26131D59F68
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 19:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3qEsxQk62WDD/jCU76qM6dk2WdkUhmcIWxGU2OR84Y=; b=Uzf1U6PMJbmX3v
	MQUic91YAzczmfJd0q9Hn8Kj3s0xI3t/pTV/G2mQfWarNd99Xzdi5XXDAHT45PPiXmPFA0AtTPBte
	Y8mHGr1fitbjwOM45q7FsElnhNu1hHtZLKcgpVTbrcBbWecqUHEFZmQxn/zpDu8zKpm882DRDVnly
	6/f8o4Llre5XEAnvu/dJ1a/qaRbYweiqCOCzsewNIQtMAUQQURxc49dKjrk15Zh5WFQJw0M/DM9d7
	gGjfbYDkuyNBF5hq8vMLZaBYuwF1IxUNgQuEZYCaK1F4By/0aptfF5PAONOMvVldT4+a/fNutiNEU
	8KP/0FKrVQ9OAE2Fw/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lIf-00000004R77-1Hfc;
	Wed, 06 Nov 2024 19:02:41 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lH9-00000004QoS-46Ma
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 19:01:11 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-83ab21c26e5so5509339f.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730919666; x=1731524466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nokwy9FNt4uthy8MIjfBTH5T/UpMOLuozVjuYdrWGao=;
        b=lYRiQM+Q+IYIn6YPt2RQXxub68PYCNCqVarbTYkPyXmJT16/pBY6MIBz58hNZADHEN
         Ag23WZIJU612lk1+QMa55r0mkxeh/6oj3kf72G0gain0nRsQ2wQiUX8Q4aqqzNVL5Oyi
         pVRlFLM2f3ZFY2k/1ZsW1pNmWnEc64r7P+qqBPRUmvx+SmX1lr6Ule74ae1Z/iDLFgYz
         TZBH4pbNGu/CP06rIaRWgxUDE/UBCBJc4W08xBy0WMLC4lDOKa7SI/UpcjiHD2lpCLoC
         jpCT3pNkNWj5N9VItlLdtNns9LXVeRh2+elajAXv3x9u0pF7ueTpjJRwplkEAyhDqTKQ
         eSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919666; x=1731524466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nokwy9FNt4uthy8MIjfBTH5T/UpMOLuozVjuYdrWGao=;
        b=X1105SQTPXbUeHebs0clZm+yR9hooICLaZ6K+3xlGdnyRzAIAT8uSfoj3l/399NVYY
         6pvk8rF8L3+4iYBxxUkzpOywPYiUmyzPGG0KocTNr4G/JL7NCj5r7DB4cBz+Ou+AoCVG
         ROaETf3+iKndHaGiLnGWMT70rX2Y5sqezG8VJL7Agtb5LfH1eWFV91PBuBoh2StTPa7e
         Qc6MH/fQsXW/Uvcwm+BNbmhcB2l0U2u88jdw37TI3wRP/yngPQDqXDduerN7o2qvejXY
         b7cX7oGIZwiFBqHXXQv9eczQoYOkG8T3Szq0VQJGwIC9926bjFeQO7QlCcpXI1rDP2kJ
         wqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP61z0WBWF/iWjNixAXEifelZylAYyRZh7E4PVE6g6YFzgUbDwGc5xDJdUtXfujc+9ALcDWxQ+01F7mA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz//67lNR36GTdVWBS0Vm2y6yWMrXJrb5AQDzBh4YKaU3iS0mHi
	1hSKDP+3Dz7Gwi2KGOJ/nZoJ8LzMCxRx15TuW+GUExx0ocXW1HV2jKUBaxxSqIeLMgxQkqdnquh
	vYAOCJgA/j7IQzqVBCwG6O+hXclhAuiBJPYvh3Q==
X-Google-Smtp-Source: AGHT+IGKLw+vtB22wIL6ge+rYJfG2yKicRc2L7oxp3S9z+BUnDn7CDGeMTTQTITBq0NYmM5cY0+xV814s8EnnG1ZsZw=
X-Received: by 2002:a05:6e02:1568:b0:3a6:b258:fcf with SMTP id
 e9e14a558f8ab-3a6b25813e9mr226176725ab.2.1730919666151; Wed, 06 Nov 2024
 11:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20241106175102.219923-4-ajones@ventanamicro.com> <20241106175102.219923-5-ajones@ventanamicro.com>
In-Reply-To: <20241106175102.219923-5-ajones@ventanamicro.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 6 Nov 2024 11:00:55 -0800
Message-ID: <CAH2o1u5ttY+0d4v8U=H-PwLUHZo5uMxxCQ5NAXudOQvUUMcpfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/riscv: Free irq vectors on pci remove
To: Andrew Jones <ajones@ventanamicro.com>
Cc: iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_110108_373997_449234D1 
X-CRM114-Status: GOOD (  13.55  )
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

T24gV2VkLCBOb3YgNiwgMjAyNCBhdCA5OjUx4oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiByaXNjdl9pb21tdV9wY2lfcHJvYmUoKSBjYWxscyBw
Y2lfYWxsb2NfaXJxX3ZlY3RvcnMoKSB3aGljaAo+IHN0YXRlcyBwY2lfZnJlZV9pcnFfdmVjdG9y
cygpIG11c3QgYmUgY2FsbGVkIG9uIGNsZWFudXAuCj4KPiBGaXhlczogNjg2ODJlOTU3OGZiICgi
aW9tbXUvcmlzY3Y6IEFkZCBSSVNDLVYgSU9NTVUgUENJZSBkZXZpY2UgZHJpdmVyIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUtcGNpLmMgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jCj4gaW5kZXggYzdhODkx
NDMwMTRjLi4yNWEyN2U2MjdhMGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS1wY2kuYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMKPiBAQCAt
OTksNiArOTksNyBAQCBzdGF0aWMgdm9pZCByaXNjdl9pb21tdV9wY2lfcmVtb3ZlKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KQo+ICAgICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUg
PSBkZXZfZ2V0X2RydmRhdGEoJnBkZXYtPmRldik7Cj4KPiAgICAgICAgIHJpc2N2X2lvbW11X3Jl
bW92ZShpb21tdSk7Cj4gKyAgICAgICBwY2lfZnJlZV9pcnFfdmVjdG9ycyhwZGV2KTsKPiAgfQo+
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCByaXNjdl9pb21tdV9wY2lfdGJs
W10gPSB7Cj4gLS0KPiAyLjQ3LjAKPgoKQW5kcmV3LCBpbnRlcnJ1cHQgcmVsZWFzZSBjYWxsIHBj
aV9mcmVlX2lycV92ZWN0b3JzKCkgc2hvdWxkIGFscmVhZHkKYmUgY2FsbGVkIGJ5IGRldmljZQpt
YW5hZ2VkIHJlc291cmNlcyBmcmFtZXdvcmssIHdpdGggdW53aW5kIGFjdGlvbiBjYWxsYmFjayBw
Y2ltX21zaV9yZWxlYXNlKCkuCgpDYWxsYmFjayBpcyByZWdpc3RlcmVkIGR1cmluZyB2ZWN0b3Jz
IGFsbG9jYXRpb246CiBwY2lfYWxsb2NfaXJxX3ZlY3RvcnNfYWZmaW5pdHkoKQogIF9fcGNpX2Vu
YWJsZV9tc2l4X3JhbmdlKCkKICAgcGNpX3NldHVwX21zaV9jb250ZXh0KCkKICAgIHBjaW1fc2V0
dXBfbXNpX3JlbGVhc2UoKQoKVGhpcyBkcml2ZXIgZW5hYmxlcyBkZXZpY2UgcmVzb3VyY2VzIG1h
bmFnZW1lbnQgd2l0aCBpbml0aWFsIGNhbGwgdG8KcGNpbV9lbmFibGVfZGV2aWNlKCkuCgpBcmUg
dGhlcmUgYW55IGNvbmRpdGlvbnMgLyB0ZXN0aW5nIHNlcXVlbmNlIHRoZSByZWxlYXNlIGZ1bmN0
aW9uIGlzIG5vdCBjYWxsZWQ/CgpUaGFua3MsCi0gVG9tYXN6CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
