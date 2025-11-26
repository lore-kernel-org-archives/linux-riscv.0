Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95486D1036F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 02:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uG+fEwRpFrB+/wgjzd18yRUGIEbZkoIyHOPl4t8atU4=; b=14L3nEhm7MkuXn
	v3mr5GNw35ltTvB1lGhf7YB+zo5kZffRM9FfbF/NthJFr7meuvWHSKDX7fZw2Gwc8JPi1dIJLV4dY
	8i5KeLZ7G3++YfUeVtLQGa1s6SRfJ4HSEDMKf47r76mD9d3TTc+YRRivGMeWPxYAhyvB2+kTDCKcn
	XHwBlNGHtTjI/Ar1fqfvy6zIul8HeybynTHxOmy+FDton5nMJrdeiMcMK6RZQGviue0kLzjJWL8wI
	e9SsTas5nM8cFxbTob48n3ThtH7FZS8BvjecOPL8t/SGFJAfl021nYl8MJBz9Xp7iH10y2Cce0qyi
	LGUtT35Z+PGW2Ob1+hVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO5fO-0000000EGhU-13HS;
	Wed, 26 Nov 2025 02:54:02 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO5fL-0000000EGgg-1oPF
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 02:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764125584;
	bh=cwmHQUiktpfIe9jPsWOgiNlI4Nxy8A4DW1msOvdmXiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Arw4/rWC9AoA2khaGM7E+LPnIw+Qzi5Mb8SqIhHQA/yVfC/esowoQ4JUs0Jdl5ymo
	 EnR4M08i7ke3GVOW4NxuFzn8vNf80emgijSv0VAKWQDv3oAf5ytFhipCMHZihtW/G3
	 Pu7EM5QkHyWJ5qQ14qcpKWcq7815pwqRGdK5Z2HE=
X-QQ-mid: zesmtpsz3t1764125581t91fcaecd
X-QQ-Originating-IP: mfsAZRNMoXh2lPIXQzm05bW8CpUAHvM4VX6rncFsP1o=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 10:52:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3106249551322280944
Message-ID: <37CDF8D84A26949E+cc84e626-911b-40ac-90ef-ff5a2df585a9@uniontech.com>
Date: Wed, 26 Nov 2025 10:52:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi/riscv: Remove the useless failure return message
 print
To: Paul Walmsley <pjw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: ardb@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251031024328.735161-1-maqianga@uniontech.com>
 <f9d632d5-22dc-8b14-8a70-37737a78f206@kernel.org>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <f9d632d5-22dc-8b14-8a70-37737a78f206@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NkdVy0O1B8HBKdGcy6k0vTTz66BlM6AXNiu1Gv93w8QUHFpI5Qorre8u
	hjH/R67FEp3Un/ud1gBs26xz9ZDpxhchEwx3C/mVQLHve7Dc9H+Q/zYPqGjLrEFWie3+4dg
	NW9+eL/DrtxY5AUpMIF2jt6pJ4QNEdhI69Wkk8HvGRdTnrvhwaklRUvUgvvJzCz/NXSzlVD
	GEvF3RWgSZuhJ3SUBfbwTVJjEFWc1dVyY8jIG494np3iGE+IDfeavjMd2PH4xjhmW3EZszn
	RX+aLPFhC3d169zL479FDcgkT+ZMH1Kmvxtz0+2ZQqNB4UVCTFoM6HCRtIlYTbxG1lZoWYd
	tEefmWkHhpwISAMjUoCmmnTS3Q5wKrYOMGLrb/NsrJykhBMACYd37ri1GV/+qJnazcrZEBg
	MVqeGBoAb2fKfPqGzYqfV/+jMLUemRtAqL4M6RjUSvAfeTHA7dmtt6BO6aCyjDoqA1UTGeW
	Q3Mi/19Exjb59yPj1mSY318hKzdI+O4u8oWl0RaFm9Q/8TcROTjfuBzo28WWHb72Z0reuDh
	Hbj26hZ4CuHH69kP/0484G8bSZMcGUMM8ULIFUspNejmUobS7CrYdkD2GNp0HFdfb4aqFYc
	4GeHBw7JQ/fBicN4kaAWRgIWqlGy85YcHoxUJsk1zMQgHpMIzCJumNCPrIfvo9KXCN6JuvV
	wH+QVl2Sh54n+2buszTdzpKS8SmVIcrBoPSifmBJyn0Nr2OaI+jRF6irl+hxGXoB1+8Q9xO
	GsFVO+3JmIpTkoLFOfrIH77NjknOsqGaRTlgOvMHmUFsZaQifCjPMbcVOSytocJHYIag4dh
	Azcm0tvZKvfSeA8Tq7yy0DErbzhggmlJm6jpvdqCoCDtY/1sqKiCtB984BdSSk08nwv2O9y
	P+nshudjEkSAamQlDJsrlfrUUBztYcvQN963m30ShcDyXvVqrbqKJr5QtYHHlhJxln3KaV9
	WhvE48ujXSvAlVD75CrZPsW9z9G3KkNI03hS3CqcTB44xQbvINCVsg/LLUOIg88gusetHaV
	JH6q5bYuRdBoaUjFDyBB0QFhTxTy32PHwRDqm2Ru2y4BGVYoMuJuXV+7ctqWMka2a8lPikJ
	oTMgpe3xfndhQjhle5kGwI=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_185359_927454_50326995 
X-CRM114-Status: GOOD (  12.37  )
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

CuWcqCAyMDI1LzExLzI2IDA4OjI3LCBQYXVsIFdhbG1zbGV5IOWGmemBkzoKPiBPbiBGcmksIDMx
IE9jdCAyMDI1LCBRaWFuZyBNYSB3cm90ZToKPgo+PiBJbiB0aGUgZWZpX2NyZWF0ZV9tYXBwaW5n
KCkgaW4gYXJjaC9yaXNjdi9rZXJuZWwvZWZpLmMsCj4+IHRoZSByZXR1cm4gdmFsdWUgaXMgYWx3
YXlzIDAsIGFuZCB0aGlzIGRlYnVnIG1lc3NhZ2UKPj4gaXMgdW5uZWNlc3NhcnkuIFNvLCByZW1v
dmUgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFFpYW5nIE1hIDxtYXFpYW5nYUB1bmlvbnRlY2gu
Y29tPgo+IENvbnNpZGVyaW5nIHRoYXQgQXJkIGRvZXNuJ3QgdGhpbmsgZWZpX2NyZWF0ZV9tYXBw
aW5nKCkgc2hvdWxkIGJlIGNoYW5nZWQKPiB0byByZW1vdmUgdGhlIHJldHVybiB2YWx1ZSwgYW5k
IHRoYXQgdGhlIEFSTSB2ZXJzaW9uIG9mIHRoaXMgY29kZSByZXRhaW5zCj4gdGhlIGRlYnVnIG1l
c3NhZ2UsIHdlIHNob3VsZCBwcm9iYWJseSBrZWVwIHRoaW5ncyB0aGUgd2F5IHRoZXkgYXJlLiAg
QnV0Cj4gaWYgeW91IGNhbiBnZXQgYSBSZXZpZXdlZC1ieTogb3IgYW4gQWNrZWQtYnk6IGZyb20g
QXJkLCBJJ2QgdGFrZSBpdC4KSGksIEFyZCwgd2hhdCBhcmUgeW91ciBzdWdnZXN0aW9ucyBmb3Ig
dGhpcyBwYXRjaD8KCkNvdWxkIHlvdSBhZGQgYSBSZXZpZXdlZC1ieTogb3IgYW4gQWNrZWQtYnk6
IHRvIHRoaXMgcGF0Y2g/Cj4KPgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwKPgo+IC0gUGF1bAo+
Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
