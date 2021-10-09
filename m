Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F223C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 13:19:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4541960EE4
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 13:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4541960EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQuBrgLvYOOYEjLTtx5XTxTsI91lcDg/DQPGWEaErUs=; b=tvsgMhMgfTV+g2rwANtfwF94ih
	4FHyg349ZsdAXWto20rFLn5/LTMYwFGEThxLWDcC4a7UzmjncQJ9klwoRr51IKHnzAVQZBU8yEi9N
	hWd4EXq/fhZ5B7IJWrNMr137iQq0DjuNgP/D1gDZCWHjTcUcohMwIVBxBq4td7UZjgMt3/Bukeo6I
	Eo05ALC+9tN+thuG0ykIiRXt35Q2gfeFZg9Xq7HyrkDBamk6+r2rX6b4wW5INmXk5qAxZeEvDavJi
	R0P8gFbz4rds6Bn7/8VZo3LvVXFTeR4qUJfHRbH3AbiGM/SnhM9pvH95vVf6vqBGsNJIbcYRDRgIr
	jB8mwX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZCFo-005dfm-Ug; Sat, 09 Oct 2021 13:19:08 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZCFm-005df1-Ea
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 13:19:08 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 199DIstO033910
 for <linux-riscv@lists.infradead.org>; Sat, 9 Oct 2021 16:18:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1633785529; x=1636377529;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ckKyUHmU7gJo2+oFHkmh6RC60f+uVdxjSMn5gB9IgbY=;
 b=Qwc+i07qGWbXH0b7vJAVLxw2ZH19m7ZBDydSyaSvcejdyZ+1gqm8MnOTOwKFoNrn
 CdRJJiEhrP4SakknRldySe4UGSZfma8xQYc1afXgu4/4eDsweJ1ECdM0gTNIDMah
 uY8tEwUKG0dHT5VWwmg+ncmWLYR32B82AX8sWyK8S5GZ9BlMwdo/cewHxktW1fMh
 rIIjtpHgWRIMQofUcOWskTYGKbYKf/jDt2ohegLKJA1bzB6RAQg63lZVXXK2JPns
 r8d7vt6geI6k04qIc1yIr8TRqeSfL2vVPsKA8QtvENwxG6GCxKbJRSCINc7Vf/m/
 fL2VcXEuA83eSZyOhD7Y1g==;
X-AuditID: 8b5b014d-b84f570000005d46-85-616196b990c7
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 4E.86.23878.9B691616; Sat,  9 Oct 2021 16:18:49 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 09 Oct 2021 16:18:48 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Don't use va_pa_offset on kdump
Organization: FORTH
In-Reply-To: <CA+zEjCtJqNVrtr_Wkij2c=3+P5kL6jJN5RPULfZj2c5mGzCVjw@mail.gmail.com>
References: <20211002122026.1451269-1-mick@ics.forth.gr>
 <CA+zEjCtJqNVrtr_Wkij2c=3+P5kL6jJN5RPULfZj2c5mGzCVjw@mail.gmail.com>
Message-ID: <ae122f06f0de1075cf266b639ce36da3@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsXSHT1dWXfntMREgxlfJC3WLbrAarH19yx2
 i8u75rBZbPvcwmbR/O4cu8XLyz3MFm2z+B3YPWY19LJ5vHn5ksXjcMcXdo+Hmy4xeWxeUu9x
 qfk6u8fnTXIB7FFcNimpOZllqUX6dglcGUtaZrIUbOaqmHf6NnsDYydHFyMnh4SAiUTb/MWs
 XYxcHEICRxklDs1oYIZImErM3tvJCGLzCghKnJz5hAXEZhawkJh6ZT8jhC0v0bx1Nlg9i4Cq
 RN/lT2wgNpuApsT8SwfB6kUEjCUen5jIDLKAWWALk8TP00fYQRLCAtYSHb8eg9n8AsISn+5e
 ZAWxOQUCJTY9uwc2VEigXmLLtW1MEEe4SOybO4UN4jgViQ+/HwD1cnCIAtmb5ypNYBScheTU
 WUhOnYXk1AWMzKsYBRLLjPUyk4v10vKLSjL00os2MYJjgNF3B+PtzW/1DjEycTAeYpTgYFYS
 4dUySUwU4k1JrKxKLcqPLyrNSS0+xCjNwaIkzsurNyFeSCA9sSQ1OzW1ILUIJsvEwSnVwGSw
 5ruPkY3r7XOrlqRtNmWsenIj6vXyx/uTPx9qjGC2m9/xImfnknXiLz+02Nf4aj1vV3ruXlO1
 c9LWbW3qb5hn8HYkuUYYiLGelZ0pffCr641/SzZeSdsomj+h0f1vRNSXvW2XU25K8cQcnSb5
 bpbP1sfiQS4tDhXKEifsOcIL/zI9PqRV37ivktn1k5zUAr/essre4oK13+/NW5z/XHjd74Rf
 D/xrFKPL7rboV/ctyPy24EQQb+Rtn8e/WabW/tYvlme8/r39QqdlosT9uCmxs8LUvzPcNbPP
 kfSundW0lyuJdf7pK1Pku1tur6lReezOM1NU31to0fs5cTuSZGe2z7GYmOlb2/FA9cABUyWW
 4oxEQy3mouJEANaGCTzwAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_061906_904417_9AB161D2 
X-CRM114-Status: GOOD (  15.88  )
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

zqPPhM65z4IgMjAyMS0xMC0wNiAxNDoxMywgQWxleGFuZHJlIEdoaXRpIM6tzrPPgc6xz4jOtToK
Pj4gKwo+PiArICAgICAgIC8qIFRoaXMgd2lsbCB0cmlnZ2VyIGEganVtcCB0byBDU1JfU1RWRUMg
YW55d2F5ICovCj4+ICAgICAgICAgamFsciAgICB6ZXJvLCBhMiwgMAo+IAo+IFRoZSBsYXN0IGp1
bXAgdG8gYTIgY2FuIGJlIHJlbW92ZWQgc2luY2UgdGhlIGZhdWx0IHdpbGwgYmUgdHJpZ2dlcmVk
Cj4gYmVmb3JlIGV2ZW4gcmVhY2hpbmcgdGhpcyBpbnN0cnVjdGlvbi4KPiAKCkp1c3Qgc3dpdGNo
aW5nIFNBVFAgdG8gemVybyBkb2Vzbid0IGdlbmVyYXRlIGEgdHJhcCB1bmxlc3MgbXN0YXR1cy5U
Vk0gCmlzIHNldCAoZm9yIHZpc3VhbGl6YXRpb24gcHVycG9zZXMpLiBUaGUgaGFydCB3aWxsIHRy
eSBhbmQgZXhlY3V0ZSB0aGUgCm5leHQgaW5zdHJ1Y3Rpb24gYnV0IGl0J3Mgbm90IGNsZWFyIGlu
IHRoZSBzcGVjIHdoYXQgaGFwcGVucyBpbiBjYXNlIHRoZSAKY29kZSBpcyBjYWNoZWQsIEkgZG9u
J3Qgd2FudCB0byByZWx5IHNvbGVseSBvbiBTVFZFQy4gSSBwcmVmZXIgaGF2aW5nIAp0aGlzIGlu
c3RydWN0aW9uIHRoZXJlLCBub3RlIHRoYXQgc29tZSBlYXJsaWVyIFFFTVUgdmVyc2lvbnMgYWxz
byBoYWQgCnRoaXMgYmVoYXZpb3IgKHRoZSBvcmlnaW5hbCBrZHVtcCBwYXRjaCBkaWRuJ3Qgc2V0
IFNUVkVDIGFuZCBpdCB3b3JrZWQgCmZpbmUgYWZ0ZXIgc2V0dGluZyBTQVRQIHRvIHplcm8pLgoK
PiAKPiBUaGlzIHBhdGNoIGZpeGVzIGEgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIHdoZW4gbW92aW5n
IHRoZSBrZXJuZWwgdG8gdGhlCj4gZW5kIG9mIHRoZSBhZGRyZXNzIHNwYWNlLCBzbyB3ZSBzaG91
bGQgYWRkOgo+IEZpeGVzOiAyYmZjNmNkODFiZDEgKCJyaXNjdjogTW92ZSBrZXJuZWwgbWFwcGlu
ZyBvdXRzaWRlIG9mIGxpbmVhciAKPiBtYXBwaW5nIikKPiAKPiBBbmQgaXQgc2hvdWxkIGJlIGJh
Y2twb3J0ZWQgdG8gNS4xMyBhbmQgNS4xNC4gSXQgc2VlbXMgdGhhdCB0aGUKPiBmb2xsb3dpbmcg
dGFncyBzaG91bGQgYmUgZW5vdWdoOgo+IAo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4g
IyA1LjEzCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDUuMTQKPiAKPiBBbmQgZmlu
YWxseSwgeW91IGNhbiBhZGQ6Cj4gCj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxl
eEBnaGl0aS5mcj4KPiAKCkFDSywgdGhhbmtzICEgSSdsbCByZXNlbmQgdGhlIHBhdGNoIHdpdGgg
dGhlIHRhZ3MgeW91IG1lbnRpb25lZC4KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
