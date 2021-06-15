Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89573C49361
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:55:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AAF36128B
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AAF36128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/g5vN4bJoh4LQZA/jvomYdK5YsVsOUoxVVgDUv9Q/I=; b=RA/m9CuTPIaGL+aZJS7E/UJotl
	kd/eZlSR2sk4pUUSaUBW4LnC/w9D9FDZsq5V6SINSUgcE9Tyaa7ER95HMbmnLE8aFLrZrnneL6JRl
	iNxhETJRDkN3t8RZZ3XJHryyr1EMYnwPljqRYNnZd5+hY4EEfwG4puQU14ah0ZyGvoA/zXcCpSFua
	d5pSDPYUdLJJJs+ALdlSlwjj0f/yZSSVbQiFvTeK/UE5v37r0wilortlhd2pR38dyptqt6ChmMp9S
	1i3UMhPAcPjuBHA/ErsBdkr1VVRUrSZumNEEpfw55QHU540suXVTGMkhKU60FLgMk12ikRVMkOXDF
	TxWm692g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltH1B-003LnF-I1; Tue, 15 Jun 2021 21:54:45 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltDzX-002CIB-2z
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 18:40:53 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15FIenFG054092
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 21:40:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623782444; x=1626374444;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lU3S79OL8aRFG8ZByT/siWnFf5JF+7RmA4BPFIBrq4I=;
 b=RxKhO0KuZKkNykzDOLAoyMVll28GHzN3MXSgEPavidtja4FgNOXQ6OgfYYEHvKR7
 rCxbg6+AmwNj62zrLI0x62BvwIOSRGyAdjyV6lDOyN2n0GZysnIG55oh4vvfDEuE
 dsqGjGDr2qU17Xw6taVnLCREqJTmbdtDAO4SCL81B1Ut/tja2bcPZFAEblbn/34n
 2U573H/zV0Nj//7ALGb6hSa/eruWcy7JUbJvBYVihg395W/gnoX5TBbhNLX4R8kB
 9ySrxkKPcJ8olyvHIraCsB8dAoI2pjy1eVYy894DHtHvNcxe6MBiqkhWcrqOzJ7y
 SJJ+xN7zxQ7S7XFBQwKOVA==;
X-AuditID: 8b5b014d-96ef2700000067b6-32-60c8f42bf9cf
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 3F.54.26550.B24F8C06; Tue, 15 Jun 2021 21:40:44 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 15 Jun 2021 21:40:43 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Frank Rowand
 <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: Remove non-standard linux,elfcorehdr handling
Organization: FORTH
In-Reply-To: <bcc5c666f4ada9a8bbc26f559751f0da67f769f8.1623780059.git.geert+renesas@glider.be>
References: <cover.1623780059.git.geert+renesas@glider.be>
 <bcc5c666f4ada9a8bbc26f559751f0da67f769f8.1623780059.git.geert+renesas@glider.be>
Message-ID: <abadee118c1945c44d9bff7675b12ec4@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42Lpjp6urKvz5USCwd/FzBZbf89it3i/rIfR
 Yv6Rc6wWM9/8Z7OYO3sSo8Wmx9dYLS7vmsNmse1zC5tF87tz7BYvL/cwW7TN4rdo3XuE3aLl
 jqkDr8eaeWsYPd68fMnicbjjC7vHxLO6Hjtn3WX3eLjpEpPHplWdbB6bl9R7XGq+zu7xeZNc
 AFcUl01Kak5mWWqRvl0CV8bjk3dYC35xVczauZSpgbGDs4uRk0NCwERi0q0dTF2MXBxCAkcZ
 JR7+eM4GkTCVmL23kxHE5hUQlDg58wkLiM0sYCEx9cp+RghbXqJ562zmLkYODhYBVYl/DxxA
 wmwCmhLzLx0EKxcRMJDYev4ZG8h8ZoHfzBL7DrezgiSEBXwlfs28yA5i8wsIS3y6exEszikQ
 J3F5Vxs7xEF9jBKzXr1jBFnAK+AisfetCcRtKhIffj9gBwmLAtmb5ypNYBScheTSWUgunYXk
 0gWMzKsYBRLLjPUyk4v10vKLSjL00os2MYLjitF3B+PtzW/1DjEycTAeYpTgYFYS4dUtPpEg
 xJuSWFmVWpQfX1Sak1p8iFGag0VJnJdXb0K8kEB6YklqdmpqQWoRTJaJg1OqgWmOnO2lS2Kz
 3wuGGSy8uGHPVHHf0FK2AzXn8rLuvSpdOt8wp0t/E2cgn26o5+6znEXfcvM2FtlOULl/wNgv
 UvXMyi6+yoUbv03c8W9mgrvv7/OvJs9d+feWiem9ta8OKuWomW4+ILjcdfvJDhb78lOZvAde
 X7Ky/huw8GX0r1X7mUMOxRk7epRlsp7lCGM31Lv36lTdr+2vf7McEyqIduo/m/Tm4NzcRfaH
 FMTibFT/e+2dsEW+Z8Ws263VqvOenpQ3KCh9H3H/iq3R7RMvns1x2h6y1sv5HJvri/Df80UY
 RbbsjJK/utXQ4CfX9mtnN1ie1e+Jby5VU52ZeHT9T+tNvYdPTOKY72hnK1ubd+WbEktxRqKh
 FnNRcSIA8LuqARoDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_114051_571969_5AFC7DD5 
X-CRM114-Status: GOOD (  12.00  )
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

zqPPhM65z4IgMjAyMS0wNi0xNSAyMToxNywgR2VlcnQgVXl0dGVyaG9ldmVuIM6tzrPPgc6xz4jO
tToKPiBSSVNDLVYgdXNlcyBwbGF0Zm9ybS1zcGVjaWZpYyBjb2RlIHRvIGxvY2F0ZSB0aGUgZWxm
IGNvcmUgaGVhZGVyIGluCj4gbWVtb3J5LiAgSG93ZXZlciwgdGhpcyBkb2VzIG5vdCBjb25mb3Jt
IHRvIHRoZSBzdGFuZGFyZAo+ICJsaW51eCxlbGZjb3JlaGRyIiBEVCBiaW5kaW5ncywgYXMgaXQg
cmVsaWVzIG9uIGEgcmVzZXJ2ZWQgbWVtb3J5IG5vZGUKPiB3aXRoIHRoZSAibGludXgsZWxmY29y
ZWhkciIgY29tcGF0aWJsZSB2YWx1ZSwgaW5zdGVhZCBvZiBvbiBhCj4gImxpbnV4LGVsZmNvcmVo
ZHIiIHByb3BlcnR5IHVuZGVyIHRoZSAiL2Nob3NlbiIgbm9kZS4KPiAKPiBUaGUgbm9uLWNvbXBs
aWFudCBjb2RlIGNhbiBqdXN0IGJlIHJlbW92ZWQsIGFzIHRoZSBzdGFuZGFyZCBiZWhhdmlvciBp
cwo+IGFscmVhZHkgaW1wbGVtZW50ZWQgYnkgcGxhdGZvcm0tYWdub3N0aWMgaGFuZGxpbmcgaW4g
dGhlIEZEVCBjb3JlIGNvZGUuCj4gCj4gRml4ZXM6IDU2NDA5NzUwMDNkMDIzNGQgKCJSSVNDLVY6
IEFkZCBjcmFzaCBrZXJuZWwgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCk5BQ0sKClRoZXJlIGlzIG5vdGhpbmcg
c3RhbmRhcmQgYWJvdXQgImxpbnV4LGVsZmNvcmVoZHIiLCBpdCdzIGFuIAphcm02NC1zcGVjaWZp
YyBwcm9wZXJ0eSBvbiAvY2hvc2VuIGFuZCBpdCdzIHN1Ym9wdGltYWwsIGl0IGdldHMgdGhlIAph
ZGRyL2xlbmd0aCBvZiBFTEYgY29yZSBvZiB0aGUgcHJldmlvdXMga2VybmVsIHRocm91Z2ggdGhh
dCBwcm9wZXJ0eSBhbmQgCnRoZW4gZ29lcyBvbiB0byByZXNlcnZlIHRoYXQgcmVnaW9uIGF0Ogpo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMy1yYzYvc291cmNlL2FyY2gvYXJt
NjQvbW0vaW5pdC5jI0wxNTUKCldoeSBvbiBlYXJ0aCBpcyB0aGlzIGNsZWFuZXIgdGhhbiBqdXN0
IGRlZmluaW5nIGEgcmVzZXJ2ZWQtcmVnaW9uIGluIHRoZSAKZmlyc3QgcGxhY2UgKGEgc3RhbmRh
cmQgYmluZGluZykgd2l0aCBhbmQgaG9vayB1cCBhIGNhbGxiYWNrIHdpdGggClJFU0VSVkVETUVN
X09GX0RFQ0xBUkUgZm9yIGl0IHRvIGFsc28gaW5pdGlhbGl6ZSBlbGZjb3JlaGRyX2FkZHIvc2l6
ZSA/IApJZiB5b3UgZG9uJ3QgbGlrZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcgSSdtIG9rIHRvIGNo
YW5nZSBpdCwgYnV0IHRoaXMgCnBhdGNoIGJyZWFrcyBrZHVtcCBvbiByaXNjdiBzaW5jZSB0aGF0
IHJlZ2lvbiB3b24ndCBiZSByZXNlcnZlZCBhbnkgbW9yZSAKYW5kIGtlcm5lbCB3aWxsIGNvcnJ1
cHQgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
