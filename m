Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D84C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GklZV9eHM/VobnPHZmXe9Cb22CNSlW0cxG55gJfapqM=; b=BsvTS577NENXwP
	s5Tk4zhzaF7xSUngEY4BDg9vBIdhxMT7dF5icXSy1fa5Gp7fr76wZCpxBXZHb+1hMaI6HMpvaf2eU
	An4zl1ldjv4Vr1HZXdZIKgZP2F48kt7cxIZfK4nTYpakiPPy/CQg5lbl4SCYzG3lo0ZAyCNhD4zPz
	0Dp7cQArE2zu/JOnfL2YyCQv3xce9OxXrJstDWwWelJI2huYhDsgDyazNFSIRx3uCEm596V2CGc2I
	u0Za9ll4wdS70Q2XaUHbezwPzERgbpLSMAbxLOoFU1RFNDVP8C7rowBCQuyQ1ZlMjnkuvNVZ95bXk
	ehPWL5+JinzjOQkYL6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9uc-0000000DMYX-3MS5;
	Wed, 30 Apr 2025 16:03:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9XM-0000000DJZi-1zSJ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 15:39:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso10767f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746027591; x=1746632391; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AgReYpbiEfzzRjpl9plzaSPk0WShKygYvywpy8RPSlc=;
        b=CGloNruqJ+DNFrU9RPoiS7Ay/AYQKiIkmlF8t5zLiECcXeKF7u7b73V5i1FMUUh2CK
         Tn4XMax4OO3wMdpDTIZJezIu8Q00IYyftDeszASlXdQfHGoZDNi8/nUHnJW+s6megjMc
         26dwf1SOhN22DzPU5Wp57lTCWopw6VETaGX/gUmdmjBAUum7C9ESCstThIsXedVg5Mlx
         6Erbo5sxHzkajWN0JBNrgbQPZoLInOdXnBKp4zoSnTXAr2IcI0mYztUuq0ci/9aqUkVz
         LrEPyruBi6UCZ8sSfPJDYqVckgygZoEuBd2ahpCGBbI/9rbHtVHXnnPPLrlR/YXMASU7
         RDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027591; x=1746632391;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgReYpbiEfzzRjpl9plzaSPk0WShKygYvywpy8RPSlc=;
        b=ffVVGeK1Pfk4V+fgOTCcqxhAb3MT1NjDIC34soiCDC0QVhvtiEDVRGxHbhHJA4ybbT
         8eBZIUQujkK386YQKp38nO43A/aTfM/mGx3arOObx4rJ4dQvxn0mpNZo4by0mizYAYzU
         ajf7+69KxNfZID0Sriqdo8CgDBVqaGfXumpkq2lNohGUtpTBZjzD+Ti31t7TX0g7x6jZ
         AliisMT1ayKhG5lE95uDRilv51cm2ofeARSsjXhjUbjGRyl7l76XOGH0PR9350UJJjcB
         mRUn4gJieZopCeqcMSdDq68XC2hovxSfsW9JJWeF3fQ1UVldUyMZkoENh8lKIErhk3mC
         /MhA==
X-Forwarded-Encrypted: i=1; AJvYcCUtSnf7oNgqSjua8Vmiua6hw2s/KR3F6KaMarlpZkQ3yMY6QqX6nqI7i7kbnu1JpuM6av499rBn06fpZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YybYT7glEVxUr9xHrVCzdtNpHpZjABiTyOSL27N1FPXyaOAHZF0
	7OHfC5JlUcIIrTt7qaLnftlE55oaF64usfhfTMVqJCNxvl43cV4o
X-Gm-Gg: ASbGncsaLswqWfjjgMXhevFLBJLTC8wCeaju6gxwmtYZtraQvG1IT0804/1qpe4uKhB
	RAf41MKSQY/U5NFomd6Wm/1KP/W7/OrbQB0/Oo9JGxFdwImrVm13K3i6RZNTv37b7Q+olPNNIb4
	PFWkQTLkKwnM0LAJ69rAJQQFQzl+bJ1o4cWhm0o+HMr8YbSxBNOA3/LDFdKqadRMc6YAljluR6I
	p72qBIFlhPbtJynIo50xz4Ym0N5Y4izh03rjkeH76hz9+ycRRtHoRhsLSPYOoA4yItXyrBY+8va
	MbRbDw1FNASHGRe5Wu6gozuQMuHjozX2Qm9DQn+SRaH/Wv8MCAId3WL7PxLzHTVDmLJK37s=
X-Google-Smtp-Source: AGHT+IHcVYNpX6kC+rpllRwGYlEvC7hfE7RUIIVLkUZ5sknWEbkBsoGfPhKSTHjS/hL2h6rPpP2B+A==
X-Received: by 2002:a05:6000:430c:b0:3a0:85e4:2268 with SMTP id ffacd0b85a97d-3a08fb450d8mr3047261f8f.10.1746027590590;
        Wed, 30 Apr 2025 08:39:50 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28732sm28740255e9.37.2025.04.30.08.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:39:50 -0700 (PDT)
Message-ID: <9ea234373b18a91c6a2f7a41c441002de1e92e98.camel@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Wed, 30 Apr 2025 17:39:52 +0200
In-Reply-To: <20250430020932.307198-3-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
	 <20250430020932.307198-3-inochiama@gmail.com>
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_083952_510568_B7287BBE 
X-CRM114-Status: GOOD (  13.04  )
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

SGkgSW5vY2hpIQoKT24gV2VkLCAyMDI1LTA0LTMwIGF0IDEwOjA5ICswODAwLCBJbm9jaGkgQW1h
b3RvIHdyb3RlOgo+IEFkZCBvZiBkZXZpY2UgaWQgZGVmaW5pdGlvbiBmb3IgbmV3bHkgYWRkZWQg
cHJlY2lzZSBjb21wYXRpYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlu
b2NoaWFtYUBnbWFpbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLWN2MTgw
MC5jIHwgMyArKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jbGsvc29waGdvL2Nsay1jdjE4MDAuYyBiL2RyaXZlcnMvY2xrL3Nv
cGhnby9jbGstY3YxODAwLmMKPiBpbmRleCBlMGM0ZGMzNDc1NzkuLmUxMDIyMWRmNjM4NSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLWN2MTgwMC5jCj4gKysrIGIvZHJpdmVy
cy9jbGsvc29waGdvL2Nsay1jdjE4MDAuYwo+IEBAIC0xNTE5LDggKzE1MTksMTEgQEAgc3RhdGlj
IGludCBjdjE4MDBfY2xrX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gwqAK
PiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGN2MTgwMF9jbGtfaWRzW10gPSB7
Cj4gwqAJeyAuY29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODAwLWNsayIsIC5kYXRhID0gJmN2MTgw
MF9kZXNjIH0sCj4gKwl7IC5jb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDBiLWNsayIsIC5kYXRh
ID0gJmN2MTgwMF9kZXNjIH0sCj4gwqAJeyAuY29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODEwLWNs
ayIsIC5kYXRhID0gJmN2MTgxMF9kZXNjIH0sCj4gKwl7IC5jb21wYXRpYmxlID0gInNvcGhnbyxj
djE4MTJoLWNsayIsIC5kYXRhID0gJmN2MTgwMF9kZXNjIH0sCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgpTaG91bGQgaXQgaGF2ZSBi
ZWVuICJjdjE4MTBfZGVzYyIgaW5zdGVhZD8KCj4gwqAJeyAuY29tcGF0aWJsZSA9ICJzb3BoZ28s
c2cyMDAwLWNsayIsIC5kYXRhID0gJnNnMjAwMF9kZXNjIH0sCj4gKwl7IC5jb21wYXRpYmxlID0g
InNvcGhnbyxzZzIwMDItY2xrIiwgLmRhdGEgPSAmc2cyMDAwX2Rlc2MgfSwKPiDCoAl7IH0KPiDC
oH07Cj4gwqBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBjdjE4MDBfY2xrX2lkcyk7CgotLSAKQWxl
eGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
