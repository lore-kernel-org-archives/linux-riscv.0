Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44618D10372
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 02:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBmaU7+Rprg5J6FJse5P9UW+tzSQbArFn3MVn0/IXYs=; b=SaL83yCxelwfq8
	3+HaM5SoUCFJ1HwJ5rD2B3dN/8OsjPVnmUJNO/YeP31sHR/hG8RCf+KKdMtKIHNJ78cenRxV8S1xg
	NXcxhJEegAz94JTX4xTk20r9gK/L9tDy9jlJShrZTYizMsK9Z0u9NLYzFRxiYrBi8L3MCr30+tnnC
	Sk2JJVHVJY40PYBqym5wJuGDSwj/0nz3bLQmM7ihPF3Hzszz4iy/UCi7FEhvwxc/LusgqVeHveRFb
	+8ipcK2gupzpPqzqvIDoCo/SKrJc4g4Qni0Oyp/TtxuV6TS1KUcuUSdI41DvyruhfzPWTmWlcRAGk
	fN1ZrUORVxHw0aK8ANjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO5cp-0000000EGWa-2utr;
	Wed, 26 Nov 2025 02:51:23 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO5cj-0000000EGVJ-06h2
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 02:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764125408;
	bh=XJOpPYZjaJRWccjVxi9dhHN3qiSJeRfkHuTBVyFKxLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=IyF3IUnxjqBYQSjsmSqCji7RsbXvVERpjlJLpVdCCjQAIfI6H4qJrtbBQZG2eqWrR
	 +AhDrzovp9RpKmkS+CvLNCMmUKeHoNQ7RZbt8iQNjoD33crKaoPWWCuyf+eEDelm1g
	 FDQteRryWRV6wlrR/9TDGW51jOJoaoQXh8uiK6ZU=
X-QQ-mid: esmtpsz18t1764125397tac080787
X-QQ-Originating-IP: UEl+Av4ckTsfsHc37ZGqCRNl+H3K7DoOfDcFYABRAW4=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 10:49:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7550926216381406590
Message-ID: <EDFB880EFCC6C35F+1cf65f69-6feb-4c59-8c6f-aa22c0b95ecf@uniontech.com>
Date: Wed, 26 Nov 2025 10:49:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi/riscv: Remove the useless failure return message
 print
To: ardb@kerne.org, Paul Walmsley <pjw@kernel.org>
Cc: ardb@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251031024328.735161-1-maqianga@uniontech.com>
 <f9d632d5-22dc-8b14-8a70-37737a78f206@kernel.org>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <f9d632d5-22dc-8b14-8a70-37737a78f206@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MKbpLBOB35np1S6I4VJSlLS9XZiaEL1bpIEl65371hcPX3/16D54OuLq
	5jyNwngaaC7MOUTXm9XId/3lVzmDI9gGn5MU16nJZLMi2J7U4tpHPy1wS2qD9QIMV01PjuD
	2vpNeP+/OhslDt1A0+t9rUyA0iU8HL3AbnrLW+A1W88DlnTUeVqL652aAQSd7hkL2P0N5r4
	GSMPqU6eXv4rczcZadDqEvdZ28AJZHDP696y1cz8+Ro9QwRB5rc4pNQQ1H0d2qhwVZkvT4C
	3YDKaTZnNUK9YqbTvW6w/S67QvbqihpBX+MFe2ORAu/lNu4f0fUqN+Iw9VDfUwGFzIm6BgH
	Mli3a+J2JZR1z923XGaP9zeNIV6/F4nj3ZWzqLE4xm4pnLzU6THnqarX/wUBcPQ+Y9ZqW8B
	ye+UMTDybV5MVtcnn8wPF4rEgKWz3NxR7vGEJw5YlRztvqGRXzDYvqcwToVY0I1dqHuSV56
	gLghiJG/jk2YOV+yV5FuWQuecOAdcggFqUyKjdms0nm0V+6kv/6tkrIXX6DI5TXidCV0Ysh
	PLM6fcUlBhdD8y9QrDJ/KbZFvMIY+ogWHTcPZT4SUJV25cPOBozeEakModDNz4STylwiNpn
	+p/UAc3x4qnWYS3QXpjj96hz1/qF7L6OfrNLAo1jNxJWOfWee4Mj9puJ19QSoWPvhEQfdiW
	JnQ8f9dXk9xXesRtB46mo5+x4dfFfJfdqkdUUB6BtM6YtFgdRuKlIRFeBw4dUXmRdDIiGSn
	X0I0OdF1mo6qb0Xjoz4G6GPnpCbyS0zmzNGFa8cX1q8VeQrlYol4jQDDR6fXpCQ5HXPlJrW
	auc27a7YDzIg9I8HkW9tNKKpw/mjdXdLJ/nHsx4jUzQ1SyNaypwQsHy2QleHAEIjda5uzxg
	DJQN7z4ypdKEddbuChOpJFFS6TIw/FKy4Hdldl4B2IKr4ZG7TA3hRPFrXvrZaJmXcItU5A+
	dyFOVNDuZ08ue25DFg21IOxXfbfCDRmQEpWuCZRwcxrEH7QJlz9dUpyz3iUlNvU1bSaGqwl
	6Cdtd20w==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_185117_927428_8839A2BD 
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
QXJkLCBJJ2QgdGFrZSBpdC4KCkhpLCBBcmQsIHdoYXQgYXJlIHlvdXIgc3VnZ2VzdGlvbnMgZm9y
IHRoaXMgcGF0Y2g/CgpDb3VsZCB5b3UgYWRkIGEgUmV2aWV3ZWQtYnk6IG9yIGFuIEFja2VkLWJ5
OiB0byB0aGlzIHBhdGNoPwoKPgo+Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLAo+Cj4gLSBQYXVs
Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
