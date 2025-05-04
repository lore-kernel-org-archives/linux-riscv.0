Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75863C369DC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 10:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9I9a6tiI2GJFpnmz3oOg+qgpqUODYejsyDYXN/1a7g=; b=qJr0UAbzXsvd0O
	bi1AleyvKefsQ2LsPTs9YFzg/mFCKpnwP34NG5rh035q5xEvzKpQ+YlBD+U4YGrXAp7hWipK3LW1D
	29VeXcA340wkVDhBOZiqCITqePrYkc74eTab8fxl0uaWkbs4Byuj9lf1609K6Ptc7tMeGwymScJqh
	jdQr2LdrTdXpVmyqaFoqkt9uTDpIVtZktpN4uVYyYcR6wXb9EQm1LPQySKADgndoNAS5KzPi/HSaG
	US0/ysCMSf2ZlcHQQ1UnHDah8cS0xZiGIZTfDJ8ZIzghbX0MD1Tn+z9UbA8xLfz0QndGGiqZY3iaY
	acYWrpoh2OTYr0mPerMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWzw-00000005D4T-3e9T;
	Sun, 04 May 2025 10:55:04 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWzs-00000005D3h-3rIS
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 10:55:03 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac3b12e8518so598603266b.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 May 2025 03:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746356099; x=1746960899; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X/Gw8AZoyqt4Qe9tKx7GhjTg65Csx1ptC6GhiSTdPJA=;
        b=MaVXu7CERImtQHcxXcvNQe9+tllWp+OjMJkNgpr9dC9YVGSXKeiRiUXm2CGf/GPQta
         yBrms0Xnxw2QRbbJu/KTrmhn0CQCJf0fIx3FWk2XypROlQChsZIv0pkKVmmdR0tX0h4y
         DdFUuZ4uIqH5j5VWxvtFu+BTesTsypYeHXBwDJV9Czl6mzH+IpcoSR1MQD+uND3v52qT
         9umhqwXNgEQ5xP9QqKnzI7AXlfnZzTnzQRkjXvXDCWJ/zv5VaKNqi0k0tm54VQpG41iY
         4i3DeunSrofZONW1OOYmzFISrWiJ1wDwpVQdefPYs05gTFwD6JKLs4fuERPm3gdP4CuX
         0P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746356099; x=1746960899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/Gw8AZoyqt4Qe9tKx7GhjTg65Csx1ptC6GhiSTdPJA=;
        b=fiaOagXM3HjNPpXxTQWygVIEicYABzyrIZvypT+KLn2saKdLwAeX2RMErexFo97/FQ
         TLNfL5meux/jR4umAuNt3jpVEuDpwSeqfr3mrZyxVyqNJJDw8cGy/dL/txIz0tFMNhTc
         9gvqsDh7FmrT5BCdba8EUQTRtH9sO5YyPJuQOpfBhY+CBa2Smih+MFYdZHq3Fg2zCJHV
         vMOxgKb8hrSBaVZMHDdxB8VZYFfyqJ7mIN5i97mdA2hWmm40AF3bijjf72Qqj1qA36k9
         PZCaZ1/bI9wjKqoSdVnsLrc6yYa5XlM1mjAxAjBLd1jIjFfHQbWsAMpGgaN555xTUadh
         tzEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvEfxRhX2BX8DhLJDXut7FIVQc8IQqerx6poLONwb4t5RRxUML7Z1XkmpC5VlFa/NAxaGu4guozQ3Vrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxxri08hryt8wltBvZD13pFjM1SnZ4dvbxg2Wpl+coe2H6v/7N
	H7HhcqD4Dcilb2SWbXvQRtzVc98EUEj5dEFB9dIMRYfQS+2uzsEj
X-Gm-Gg: ASbGnctKD6JLiDm4EFNkguRsokbU7u1SJYDdbBsJXfNqXHeHF7PSl7mEhLJ6CEqGWsn
	8D1zgwCN4S48cLuv7yxeXsXbdlhAIWsQzvzeOJ6YTVHVgb24c+M2dbazvnlPcrwg/n9yIVp50eK
	84CQbJvmpAA66KkOYSxbZMtdcxsZDxR6fdpQHO8yiBU8tOXqYoup6OxTf9jCHshxmOgPa7gPnKt
	Iy6tcK9bdOF81pEdJ7WA4Zw5Y2d3+OIikPMykn7aGsQo9GEVCtJOLILytELiJpEEiWNorVnvw3H
	bUvcP6dKMSBDZERNbjgR7D17WYF2K2La1e7OwR+t+/VA5YCWm6YF73quPany
X-Google-Smtp-Source: AGHT+IHtsqO7K3CdDxe3EOvKh/0HWmtCN5k0hmjmOgHDHjsnagKK75fxLjlAZX2eQdzhQSh6GTz2vA==
X-Received: by 2002:a17:907:3e05:b0:acb:33c6:5c71 with SMTP id a640c23a62f3a-ad1a49c3349mr354017666b.29.1746356098387;
        Sun, 04 May 2025 03:54:58 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b2bsm3858937a12.32.2025.05.04.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:54:57 -0700 (PDT)
Message-ID: <959c4537754ad014727e356c4b068bcf5a9b6a48.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] clk: sophgo: Add support for newly added precise
 compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sun, 04 May 2025 12:55:01 +0200
In-Reply-To: <20250504104553.1447819-3-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
	 <20250504104553.1447819-3-inochiama@gmail.com>
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_035500_962966_D625F870 
X-CRM114-Status: GOOD (  11.69  )
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

T24gU3VuLCAyMDI1LTA1LTA0IGF0IDE4OjQ1ICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+
IEFkZCBvZiBkZXZpY2UgaWQgZGVmaW5pdGlvbiBmb3IgbmV3bHkgYWRkZWQgcHJlY2lzZSBjb21w
YXRpYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFp
bC5jb20+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRs
aW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxODAwLmMg
fCAyICsrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvY2xrL3NvcGhnby9jbGstY3YxODAwLmMgYi9kcml2ZXJzL2Nsay9zb3BoZ28v
Y2xrLWN2MTgwMC5jCj4gaW5kZXggZTBjNGRjMzQ3NTc5Li5hNDExNmFjMWFkY2IgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9jbGsvc29waGdvL2Nsay1jdjE4MDAuYwo+ICsrKyBiL2RyaXZlcnMvY2xr
L3NvcGhnby9jbGstY3YxODAwLmMKPiBAQCAtMTUxOSw3ICsxNTE5LDkgQEAgc3RhdGljIGludCBj
djE4MDBfY2xrX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gwqAKPiDCoHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGN2MTgwMF9jbGtfaWRzW10gPSB7Cj4gwqAJ
eyAuY29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODAwLWNsayIsIC5kYXRhID0gJmN2MTgwMF9kZXNj
IH0sCj4gKwl7IC5jb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDBiLWNsayIsIC5kYXRhID0gJmN2
MTgwMF9kZXNjIH0sCj4gwqAJeyAuY29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODEwLWNsayIsIC5k
YXRhID0gJmN2MTgxMF9kZXNjIH0sCj4gKwl7IC5jb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MTJo
LWNsayIsIC5kYXRhID0gJmN2MTgxMF9kZXNjIH0sCj4gwqAJeyAuY29tcGF0aWJsZSA9ICJzb3Bo
Z28sc2cyMDAwLWNsayIsIC5kYXRhID0gJnNnMjAwMF9kZXNjIH0sCj4gwqAJeyB9Cj4gwqB9OwoK
LS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
