Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA3EC35FF3
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLVxY95TUZ9tOkA/UCu0TS2p5KqfEh+IByH6sk9jDRA=; b=vdsgD+xYOfm4wA
	g0eYTSTUdPy3Tn/vvs8Eksr1sZDJml1dRCRgR4x8MVfLNawI2afN3bfBzijMBObGyHXmwkZz3qepb
	rm8w/fdkXQLJtG4RPR8OtVihBt2uZUQ9aAsZgGRuPKP+NpSZKc45JOX8J/w/0zXc4LJxwKwIPzOfC
	UHUFyJ2aNK97kfCLi2BeS6mB7rGRqz6vUKAvz5+9CMbmCbHNjql0ZexpPUwxapYxINOcnUPVCQ70V
	iHc9R6Tqk6Y3v4reWovPPFHO3Y42pFPdphFII17Ng/sJJjbl7766RBQ+l5vrlyczggCr0GaPqiqj8
	H2wGoH2jOhb1EtGa4CTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVkx-00000005q0D-0z6y;
	Tue, 18 Mar 2025 12:09:15 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVgE-00000005pEa-0Nhn
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 12:04:23 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d45875d440so23081635ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742299461; x=1742904261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CJnOafkcvrR/l5VXbCtNpeHL6EGqqxqILSUHXldXfI=;
        b=REedrLreZeQZxzoXuPKGC9KvPRxZnIPWCBL6g5bBoyF0oVzMZ7BA/faaHOhLs+Dv8f
         1DbElbp8EQp3XuU7dVWFY7FwWeSZ0mAiks6A4Ut7cWUqSRMtK2wnD1dH8sN3jRfSN4eT
         YKZSdTj7qYo6kE0Pt+TwVIWc0vze6hGTc9dHA4l69+WkVGYXCKEFHZZxL5v83Py+cFmR
         ySCyqplPLy5ciJyI+S4cHM7lv7cgfDJIZAgfUe1/OYSOHyIlpcGq3in4gGNxDCETVNC9
         xv67O7sPJpwzrvT2kT5n4/cng//9fMSRKk17KoseNZWOS+TdVau5V2GSZSc/3nA4MqFv
         U4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742299461; x=1742904261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8CJnOafkcvrR/l5VXbCtNpeHL6EGqqxqILSUHXldXfI=;
        b=okJjfO1WgcdtWS7q9CAAdiUL8Eqm32BjVmVjEb2nLeNau68zCz9qcOjkiQQg3mR9Oz
         GZCVuBZIaP+alBMT4O3f21MfJkpAsC/1sumWE+4ihU2HaFreGusPHBva0YAplPLJnNL+
         dKxndsRTeIPkpEf7EECbou8LJnz3XAZYS5ki9tPBchAGMDOE9g2lBe9WS1k4POrLX0Yt
         HrXfnjyGzXYuKXMh/qPSDq3n21uEx86UFQmVIYzBZrZdBdtwFgIsHWaTqfdZvcDHTtoC
         Ej6NfNPpymq5T9u66Qmhynf5qZ9tHUKBRiecbPIB9ZR9hWPfkq/SeXKjW9iw6IGlKw9M
         8v2g==
X-Gm-Message-State: AOJu0Yx06pB21QT7wGTZeW2CmqMwy2dNrZ5ymAUKDDfI8ctU6lPyJtD4
	EGcbbHX1TqQjVEFRCwrx/MY5O9PTt6dTSURdEweyF9qCH3DO+f0fKRvknbJU00qFupleOwXxK7a
	a/1OulA==
X-Gm-Gg: ASbGncvr/UAfYRT1dit33RDL2Vp3Obikp3TnEv/snPRudLskEfcN135jZT2Rn10hzpN
	oekQfzwStSiJhADXsRCv7c2cpXRPbC/vXf0GTl1fisyn/yVRIZj2Xf0ZJYVbsMmeZnp6J8DVRz6
	k/bdp4eESdJ93xfMRyc2l/K3Bu62s1N4u7jQS8vvsP+3HnGQq309HvGfcYJY1MdMemlEo7XlnSL
	iwIp7hyrfudHGU1uHFQXqV/9ruzVJ84s+tUH+J4/p5qORWNxMaMMQRHkESeb1uCED2YwpfXJx7M
	I+NPXg1OqKqXH6EPMvcywCobcMTx2EIfv/LyWgCQPZAO9B8RoGX4G6xb5uFMT8Qhluxva4Xsisc
	0DGE/x0a5
X-Google-Smtp-Source: AGHT+IFS/pxfjNPDqJhNcLq/lECG72AhDNrlffrBV2L3kxYV1244Sdx32ia+HQiIA8St61CQNBlH4A==
X-Received: by 2002:a05:6e02:b46:b0:3d3:dfc2:912c with SMTP id e9e14a558f8ab-3d483a75837mr164324675ab.17.1742299460874;
        Tue, 18 Mar 2025 05:04:20 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a6683e1sm31287795ab.19.2025.03.18.05.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 05:04:20 -0700 (PDT)
Message-ID: <a7862a8b-4d81-4b1b-90d9-3cedde0699a5@riscstar.com>
Date: Tue, 18 Mar 2025 07:04:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@ieee.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
 <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_050422_394185_1B39266B 
X-CRM114-Status: GOOD (  11.02  )
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

T24gMy8xOC8yNSAxMjo0NCBBTSwgVHJveSBNaXRjaGVsbCB3cm90ZToKPj4gSSdsbCBsZWF2ZSBp
dCB1cCB0byB0aGUgbWFpbnRhaW5lciB0byBkZWNpZGUgd2hldGhlciB0aGVzZQo+PiBjb21tZW50
cyBjYW4ganVzdCBiZSBpZ25vcmVkLS1teSBSZXZpZXdlZC1ieSBpcyBmaW5lLCBldmVuCj4+IGlm
IHlvdSBkb24ndCBjaGFuZ2UgdGhlc2UuCj4+Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtQWxleAo+IEkga25vdyBpdCdzIHJpZ2h0IHdoYXQgeW91IHNhaWQuCj4g
QnV0IEkgZG9uJ3Qga25vdyBpZiBpdCdzIHdvcnRoIHRvIHNlbmQgdjg/Cj4gTWF5YmUgSSBjYW4g
Zml4IGl0IHdoZW4gSSBhZGQgRklGTyBmdW5jdGlvbj8KPiBJZiBJJ20gd3JvbmcsIGxldCBtZSBr
bm93LgoKVW5sZXNzIHRoZSBtYWludGFpbmVyIHdhbnRzIHlvdSBkbyBkbyB2OCwgcGxlYXNlIGp1
c3QKYWRkcmVzcyB0aGVzZSBzdWdnZXN0aW9ucyBsYXRlci4gIFRoYW5rIHlvdS4KCgkJCQkJLUFs
ZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
