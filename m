Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B66C282DE
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Mar 2025 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6UMCEzOjkgsCGl1jA0QKq1kH3touwM8Br3GUHPhIoeE=; b=rmb+Oxpr+AeGHW
	7RJw+iHGc4RETvSE+8vJPL6awwtCbnoeMq0gsJLvAN9jrD/Ht6aseNGg/lInk/bk3pj+aJ9wFpFXI
	ziIvs+Gyffuw09l2etF3n8mxhrtxj2siVFUdmY/YAu05usZIirn9SzeDt3eUh5qZ3Ccdy+1b454B/
	l+sgyUnP5/TMrwOJdu8YmW6+KUoHWMGUsKD0/Ht1QX43golXgQHMpbW7ZOy/GHqabJaIkEKrn8mXn
	gJQJ+NTDElwx6OjkRqx20S/SDUac9GamzDan3tiawR9fISVV9mu4jEAvCA1nBeT6Uew6d1ITNCdBh
	2xUF+RBdblbXCFnWzg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttmkM-000000009Og-2iJ1;
	Sun, 16 Mar 2025 12:05:38 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttmkJ-000000009OJ-3v1o
	for linux-riscv@lists.infradead.org;
	Sun, 16 Mar 2025 12:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742126719; x=1742731519; i=markus.elfring@web.de;
	bh=e9pi42+lpAEfqGuH7ny5kxkJc4GrAO5+Sa0jB/otWFc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SbW2bn/MzTWxWSdxkUwBl5Or867gbHNZyWHCLnoPbYDlXDqYcw5keEr8jGxSC3z8
	 udWlAgeCC+OMT4ED7fiN2j2zVLB54QGET1Lr0/sIBokgg4O6HeqhKG+n3g6k+tzB9
	 2OzdJKRaL2CiatIwDzrWAJpseag2a8geozR6DVlOCaKWN1CO5EJVHRiSXwxkuzRHx
	 yY4sYVdtfPjTtKQFN3QPrsUsam3YR2iQlyI63p5lJkrQa3qQV7eBn6KTBzLtllTvo
	 uxophOwCSCkiCTdE9pOjtTBARdMsZMShPJGB8xMIZpD8KuS53RjxEZK36QkG+eeMP
	 TsuP3vAUH/DGiHn1Vg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.60]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNwfU-1ta1rT2uMq-00NFqT; Sun, 16
 Mar 2025 13:05:19 +0100
Message-ID: <d90c0678-d2ed-4e77-901a-fdbab7dfca71@web.de>
Date: Sun, 16 Mar 2025 13:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>, linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
Subject: Re: [PATCH next] firmware: thead,th1520-aon: Fix use after free in
 th1520_aon_init()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
X-Provags-ID: V03:K1:N8yi/ML/6ATrEIfjSmcR+ncmpOEGOUb80sVSW2Mp4Ay37YbqHO8
 0dpdF55hEC2gXPezuq6AkCihIiKhPba4HX/9RgMgQXH9bKSCavrpAt2wydYUh/yNBvbswSx
 CUkhQ47nR/vMUouQNwFDVjGT+G0aXehQ4QcKQvEToL6T/+QqsLsEGyVYk3GpYtLFvTaNoYS
 Ktvr2SAzmzBNeEkFee8AQ==
UI-OutboundReport: notjunk:1;M01:P0:zyghqIrusQ0=;argRggwRiP8xq6mCQKaEC5lAM6M
 /6k59Ym3joLa1G20HgkaX5LTH3ed0xBI0SbZxMBc7r1SFwfcITYww1kpT/OI5qKuD8ib4pHEX
 OgWctpRmLfTFj04Z+OdDYKNagZq9AR0nl+oAYgC5kFtDMKqgE6vrQS5rKliYsIRgkeA6z5prN
 /b0p+/Ar6+M5SYIKSqjtlV7Kv5paxREK/8xmwnWK5eOpiituHSbvcbyCgg9CBH2N8T4BVNM4X
 wLyjSVA5lULNQm/D1RYbCqOAqtZvBXFysMwuVsUczzbR7KsB3JhUTyByPodm3smO1oxQRUcPc
 JR/GseSOs84DGGx3IUQhAS6lqXt8J9trpG/GWwUqUg3Lh0cbTGpWVTQbOjrGcsSkHpFbQKJvc
 K1iaY43M+JvoOF1Pv6w3DfCe5cnzql9c1DzMMPshgepVVlOLIKyH0nqB5vTNSMpgs9vZFO193
 KnJP0ydgyL4rC/7eICXLBQFHnMXeRfepHav7UxPOaYBLGdjH/PQaYGmQ9GOugikUjxdwaIX1P
 yI5h8ZOnWMoaHqYambHv9Xj0XyS7FLeXxClHnxf6S0HJPDPl0fX0ZNm5rs2ZNjq7DiqZnuAsl
 jIyg713uK7gnlvp1bMdP/naZ4Tfc8kgbsSqW+1vlbxdgGXElbVC3JUc+PHzU7rNU7KKMuFDl6
 zuSd4HrSg2+DijLZXTk6GjEKoMf3+4qWvCGsTQOoAps0T7mjKd9lzwnnjtGBWOeL+554rzeLY
 ai/kPxbReDGkg0wc8Laioq/C+ktJHhjC55fpesN9kTRRIWEE/7wA12e7lhDJ65lcLCkPawHkS
 Z24X/0C+H80bq/uyfV+hG5tUy6iDBsLE4TsWuNlyMMMmXnc8eMwSDkpYLsHP+QYe+hZOGdCks
 SDU502B3odT4PQ2HGGFSCWogS3MZPuJAoTmBxb5UyQ2v4nC66HfLpbtjAo45YXAyhVp8ekgyo
 7qojw36hqLRW60WVZx1WNYUgt4UVhvf3rv9oD/OlFBn+ZD/U2zHxYhmE4FZt2nZu9ffusf8EU
 3fwh+u2nZogefJWoAvXIO1fTN4bhfHJSZHoP9yHQ32vKP0c12zZ+KYnlNO4XcRbDtByrQZxR+
 aQDXjf2xpFNAmVs9QG/dMYcniR9TEE4IC72iqx95OHAd5G+DGXHjP/fMbiBXvajdvn0oLVzm/
 SCZEN40S4h8zfktWnw+ff5cAzbKZJAVEjjOH+5f5uHpI7+MKA1tqHb/JWliyPCrJgDm6H9T9o
 G5dvSi/QrBEXiqFSvbly7Bi6IlH+Hvi73FFY8S7YHruNGDkiw9CCZ+p3GubRXTpShCa3b/0qz
 UJL/aB/8Hhdjro3j7S+tViwv40E9SLkQXp1AB5cdJlu68G0V62U+Prb1qls4NEEyYJx0EYfTJ
 AeCIDNKu5p0zfeepaDjn46Vw98/qru87+/axf4RwDqqkxThjoXIxZR+lpyz52mNgIzXt01sDO
 hnHJUmovW1PTX8x6C5gflbLDdMOzq4DWxr52cDhZlaA63LQ5LMAXjto+cUIUUC1uX1kq31Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_050536_375192_93F7568E 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

PiBSZWNvcmQgdGhlIGVycm9yIGNvZGUgYmVmb3JlIGZyZWVpbmcgImFvbl9jaGFuIiB0byBhdm9p
ZCBhCj4gdXNlIGFmdGVyIGZyZWUuCgpXb3VsZCBpdCBiZWNvbWUgaGVscGZ1bCB0byBtZW50aW9u
IHdoaWNoIHNlbGVjdGlvbiBvZiBzb3VyY2UgY29kZQphbmFseXNpcyB0b29scyBkZXRlY3RlZCBz
dWNoIGEgcXVlc3Rpb25hYmxlIGltcGxlbWVudGF0aW9uIGRldGFpbD8KCgrigKYKPiArKysgYi9k
cml2ZXJzL2Zpcm13YXJlL3RoZWFkLHRoMTUyMC1hb24uYwo+IEBAIC0yMDMsNiArMjAzLDcgQEAg
c3RydWN0IHRoMTUyMF9hb25fY2hhbiAqdGgxNTIwX2Fvbl9pbml0KHN0cnVjdCBkZXZpY2UgKmRl
dikKPiAgewo+ICAJc3RydWN0IHRoMTUyMF9hb25fY2hhbiAqYW9uX2NoYW47Cj4gIAlzdHJ1Y3Qg
bWJveF9jbGllbnQgKmNsOwo+ICsJaW50IHJldDsKPgo+ICAJYW9uX2NoYW4gPSBremFsbG9jKHNp
emVvZigqYW9uX2NoYW4pLCBHRlBfS0VSTkVMKTsKPiAgCWlmICghYW9uX2NoYW4pCj4gQEAgLTIx
Nyw4ICsyMTgsOSBAQCBzdHJ1Y3QgdGgxNTIwX2Fvbl9jaGFuICp0aDE1MjBfYW9uX2luaXQoc3Ry
dWN0IGRldmljZSAqZGV2KQo+ICAJYW9uX2NoYW4tPmNoID0gbWJveF9yZXF1ZXN0X2NoYW5uZWxf
YnluYW1lKGNsLCAiYW9uIik7Cj4gIAlpZiAoSVNfRVJSKGFvbl9jaGFuLT5jaCkpIHsKPiAgCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZXF1ZXN0IGFvbiBtYm94IGNoYW5cbiIpOwo+ICsJCXJl
dCA9IFBUUl9FUlIoYW9uX2NoYW4tPmNoKTsKPiAgCQlrZnJlZShhb25fY2hhbik7Cj4gLQkJcmV0
dXJuIEVSUl9DQVNUKGFvbl9jaGFuLT5jaCk7Cj4gKwkJcmV0dXJuIEVSUl9QVFIocmV0KTsKPiAg
CX0KPgo+ICAJbXV0ZXhfaW5pdCgmYW9uX2NoYW4tPnRyYW5zYWN0aW9uX2xvY2spOwoKTWF5IHRo
ZSBhZGRpdGlvbmFsIHZhcmlhYmxlIChmb3IgYW4gaW5mb3JtYXRpb24pIGJlIGRlZmluZWQgb25s
eSBmb3IKdGhlIGFmZmVjdGVkIGlmIGJyYW5jaD8KV291bGQgYSBzbWFsbGVyIHNjb3BlIGJlIG1v
cmUgYXBwcm9wcmlhdGUgaGVyZT8KClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
