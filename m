Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D510C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 17:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPQYKrmzxnfAmSz6C8LPbyCdVdTaBURk9zPqmJJhhlU=; b=e1hdtOBhtvUV8+
	mYFlCT89drkHVoeGEb00dKNsghi9ClK/acu5dPuDNhwipXODXrjKC784JW9pSUrs5mN8TLOGjxlnn
	PGUxOvi/UD0IHJ4/QHGvjOjmi1nrYu3jzah1gz1kN1O/b8BuMXRAQDxNz8ZTWImVYdM3TcGUHRtZN
	DzGr61ArF7bUUG/BfZ/OFT4e20wdssM8leSgEmqjHKpiwGEe8FoLwozmlHxfHzElFrPJX+01kK6eZ
	lH4c1qzgN2XCsPpSuu8tXW9E6Cs1JApD5nWWjtg8tXkLU8gu/S/bBTsqQN7JboJ4LKaAv0sfgK9d4
	CL90DGQMblRXE9ey8rjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1VLr-0098W1-38;
	Fri, 10 Nov 2023 17:31:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1VLq-0098Vd-1A
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 17:31:27 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so1972062b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 09:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699637481; x=1700242281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnwW179nyTllOKG0D16X3B6vz95PczJo8nLjcbrxEZU=;
        b=J2H2XU2af6LX7CvQ3rj2erbbKysq3pHBsZLC+fXuDxV9FkexTAZd2JUwM+Imhx1Qvz
         gTr7UsUAAWaYRQTt9oWxC6A4CYkiM8HZFpcPJWfkgJisui71n5WWEdL19hPt4wrCJipy
         fu3Dvkh28x8zRkWlwP+R3/aQdY8//Ibx7bGKgrwR96VZNbkd+29AMgPaHU1MhwNDaXMn
         iKMcECUj/SLI1bw5KckiCb59Pi2JK2cAh/Cfjz+qRQ2Mrqi3J0wuA0Fp71Wribd/uTjj
         zPP5/CblvfT3D6avFItnw4QNOVQSV/Ax6wSpGFIo7Lqw2GfchOaEyXuSr+z2uxTHO/ni
         2E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699637481; x=1700242281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnwW179nyTllOKG0D16X3B6vz95PczJo8nLjcbrxEZU=;
        b=NuooeK2LuUTZe1yitS5isPvOl4iy4xOvbVUqEhC/ypCQhxGGoBDb+k6d0nGi5MTUah
         uWCr7jOV1bYYAC/qNbhG69O0igTCMznJFpP1e++P7ZF6g1BiWX2aonL6pHvm9WiTAi4L
         O6W9WxJN+vJSVy8pr0+sL4eesvAWESNGCyRlokfJ7OuypjseqiSf303ap1q004pAfeYt
         RtW1r1j06fLLsOu6SHfP4PjvSJdqOKnxgNREBJ0eNsAdPdXR8hHx+9TS2CFdi2dKQQbN
         fUfWpYjGDAwNMyJ7rOdifNIxiqKiEF54b/PXXybySLHF3NkhGuJSfKoZNHP54fC2BCZN
         Ehlg==
X-Gm-Message-State: AOJu0YyMKmIuxiREeJNNuf+ZkV3vIEx0nd++xRh/E4sVF0bX0R1XpM8w
	/vC0/S5wTeb5YVUIBAc8nkI/GQ==
X-Google-Smtp-Source: AGHT+IFiAMSaqTolxOW1ag3pPDpxGq3qo4a1pcOE2s9npsdIWcyo8J+kunGA0rlXT5isrpxVTj+xew==
X-Received: by 2002:a05:6a21:2702:b0:17f:8f9f:14c2 with SMTP id rm2-20020a056a21270200b0017f8f9f14c2mr6512532pzb.27.1699637481277;
        Fri, 10 Nov 2023 09:31:21 -0800 (PST)
Received: from [10.46.15.71] ([156.39.10.100])
        by smtp.gmail.com with ESMTPSA id b10-20020a056a00114a00b0068bbd43a6e2sm13263773pfm.10.2023.11.10.09.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 09:31:20 -0800 (PST)
Message-ID: <bf3c7786-4b62-40d7-93c2-77665afe37ae@sifive.com>
Date: Fri, 10 Nov 2023 09:31:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 39/52] serial: sifive: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Nick Hu <nick.hu@sifive.com>,
 Tobias Klauser <tklauser@distanz.ch>, Ruan Jinjie <ruanjinjie@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yangtao Li <frank.li@vivo.com>,
 kernel@pengutronix.de, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
 <20231110152927.70601-40-u.kleine-koenig@pengutronix.de>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231110152927.70601-40-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_093126_430574_214C7BAE 
X-CRM114-Status: GOOD (  13.40  )
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

T24gMjAyMy0xMS0xMCA3OjMwIEFNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcwo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJs
ZSB0byBkbyBlcnJvciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dl
dmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydAo+IGZyb20gZW1pdHRpbmcg
YSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4K
PiAKPiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuCj4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcyBxdWVzdCBh
bGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvCj4gLnJlbW92ZV9uZXcoKSwgd2hpY2ggYWxyZWFk
eSByZXR1cm5zIHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMKPiBhcmUgY29udmVy
dGVkLCAucmVtb3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCj4gCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+Cj4gLS0tCj4gIGRyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYyB8IDYgKystLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpSZXZp
ZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
