Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332DECD4F52
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 09:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnp5sPPoWBfKi01cZ5bjIWDtWeXQ8Y6FMi9/hm1Tjh4=; b=UqDcxb+fjQsUpq
	WbyY9DixMSxd+X66Zp/zXrKOcqyzyiUd4FL3zip+uClM8bHoWS972gcojRfcZ1WkoANUq/Kl4w2WR
	eHzbYI0kk5S9ZzsbZWpjCRyT/wxIxVA2H6x1WZsCe/igV/ffDvA09JRze2U2rOA/RrymMxq5tS7rl
	ZwsMRWechHOhj9WDg3fo8s9M6H7T79GLBSFiit2HUUeaZSW864fUHSeUt/7Muz9SnAIfp/R+bIiK1
	1bIaBhjzxy8f1VLFRrhfIA2C5HyvViHR4MlZ26IRuJgLLh7OAt9vgOlltZnFfp2h8S62xgIWhTTg5
	5ixx1MqBLnnH689cBrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuRY-0000000F3Vb-2K7V;
	Mon, 18 May 2026 09:39:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuRW-0000000F3VD-3Oi4
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 May 2026 09:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=000zMyWQNBtrwHuBXnMpWxXeGvvsu08kYMRtpb/bHJI=; b=J7pTKctV8KScZ7Zxr0UDowhACv
	L9fWjiFNjl3CuAXwQWIn1FXXv3eV7pemQ69+0iKeFHDsAQCOAkrE/s2roiEs/nblNpDZ+8XSL8j0Q
	kK7MZlGI5X5KFArk3N6kt74CET+hpS6HKqUssG4WlamUMcymhc+DfuWdPjE+V2UfUgHfAM19s0ofJ
	0w/rAUqqovPxWyW9Qm/h0Zm8C1cCQ9Yws/e/EGI1O5E6VCWxnJ77iYojF59ImPoKIHXAxWpFqsXq4
	RTQIIVvPb63H6+UioRtrtMRKnOksKgWtPRxknapu3EH+7EmOVOK1Gphw+IIAsfV4lxxtzFey1pTCk
	BEgETsVA==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuRQ-0000000AbVl-3tix
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 09:39:20 +0000
Received: from [10.213.6.35] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADXZAhA3gpqNVacEA--.3493S2;
	Mon, 18 May 2026 17:39:12 +0800 (CST)
Message-ID: <c5d3e02d-97cd-4779-ae1f-89a48d729b25@iscas.ac.cn>
Date: Mon, 18 May 2026 17:39:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Panic: Oops - store (or AMO) access fault in __memset
 during gcc/gentoo-sources compilation on riscv64 (JH7110 / Star64)
To: =?UTF-8?B?0JDRgNGC0LXQvCDQnNCw0LrRlNGU0LI=?= <artemmakieiev@gmail.com>
References: <CAB4LXH9MY8-2r4PH+ki_KtdmUXmjyWPe2rN5SnRoP1TU9s=knQ@mail.gmail.com>
 <f2709b23-769a-4694-8275-e601b1664b7f@iscas.ac.cn>
 <CAB4LXH8JNW3KRBMBQTzBesXFoOM-4093tsofeJ2BMmoVUvfaiw@mail.gmail.com>
Content-Language: en-US
Cc: linux-riscv@lists.infradead.org
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAB4LXH8JNW3KRBMBQTzBesXFoOM-4093tsofeJ2BMmoVUvfaiw@mail.gmail.com>
X-CM-TRANSID: zQCowADXZAhA3gpqNVacEA--.3493S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar13GFWDAFyxCFykCrWDCFg_yoW8AF47pF
	WxKF13tF4kKa18trZ2vw4xX3WrZa1fKFy5G3W3tr18A3Z8urWjvFWDKa1F9Fy7J395Ja4j
	y340vryDuFn8ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
	JbIYCTnIWIevJa73UjIFyTuYvjxUqlApDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_103917_813758_CE57AE98 
X-CRM114-Status: GOOD (  14.57  )
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

WyArY2MgbGludXgtcmlzY3YgXQoKSGkg0JDRgNGC0LXQvCwKCk9uIDUvMTgvMjYgMTc6MTUsINCQ
0YDRgtC10Lwg0JzQsNC60ZTRlNCyIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDE4LCAyMDI2IGF0IDY6
MjXigK9BTSBWaXZpYW4gV2FuZyA8d2FuZ3J1aWthbmdAaXNjYXMuYWMuY24+IHdyb3RlOgo+PiBJ
IGJlbGlldmUgdGhpcyBpcyBjYXVzZWQgYnkgc29tZSBvZiB5b3VyIGZpcm13YXJlIGNvbXBvbmVu
dHMgZmFpbGluZyB0bwo+PiByZXNlcnZlIHRoZSBiZWdpbm5pbmcgb2YgUkFNIGZvciBPcGVuU0JJ
LiBUaGlzIHdvdWxkIGNhdXNlIGNyYXNoZXMgd2hlbgo+PiBMaW51eCB0cmllcyB0byBhbGxvY2F0
ZSB0aGF0IHBhcnQgb2YgUkFNLCBzaW5jZSBPcGVuU0JJIHByb3RlY3RzIGl0c2VsZgo+PiBzb21l
d2hhdCBpbiB0aGF0IHJlZ2lvbiB3aXRoIFBNUC4gVGhpcyBpcyBhbHNvIGNvbnNpc3RlbnQgd2l0
aCB5b3VyCj4+IHJlcG9ydGluZyB0aGlzIGFzIGVhc2lseSByZXByb2R1Y2libGUgZHVyaW5nIGhl
YXZ5IGZpbGVzeXN0ZW0gb3IKPj4gY29tcGlsYXRpb24gdGFza3MsIHNpbmNlIHRoZXNlIHRhc2tz
IHdvdWxkIHVzZSBhIGxvdCBvZiBSQU0gZm9yCj4+IGNvbXB1dGF0aW9uIG9yIGFzIGZpbGVzeXN0
ZW0gY2FjaGUuCj4gQWJvdXQgPiB3b3VsZCB1c2UgYSBsb3Qgb2YgUkFNIDwuIEF0IHRoZSBtb21l
bnQgb2YgcGFuaWMgYmVsb3csIGh0b3AKPiB3cm90ZSBhYm91dCB1c2luZyAzLjVHLzhHLgo+IFll
c3RlcmRheSBJIGNhdWdodCBwYW5pYyBtZXJlbHkgYXQgdGhlIHN0YXJ0LCB3aGVuIG1ha2Ugd2Fz
IG1ha2luZwo+IHNvbWUgY2hlY2tzIChhbmQgdGhlcmUgd2FzICJDb21tOiBjcCIgaW4gcGFuaWMg
bG9nKQo+Cj4gWy4uLiBsb2cgcmVtb3ZlZCBpbiBjYXNlIG9mIHByaXZhdGUgaW5mb3JtYXRpb24g
XQoKVGhlIGFkZHJlc3MgaXMgc3RpbGwgc3RhcnQgb2YgUkFNLCBhbmQgdGhlIHN0YWNrIHRyYWNl
IGluZGljYXRlcyB0aGF0Cml0J3MgbmV3bHkgYWxsb2NhdGluZyBtZW1vcnksIHNvIHRoaXMgaXMg
c3RpbGwgY29uc2lzdGVudCB3aXRoIHRoZQpmaXJtd2FyZSBwcm9ibGVtIHdoZXJlIHRoZSBzdGFy
dCBvZiBtZW1vcnkgaXMgbm90IHJlc2VydmVkLiBJdCBhbHNvCm1ha2VzIHNlbnNlIHRoYXQgaXQn
cyBub3QgbmVjZXNzYXJpbHkgdXNpbmcgYWxsIG9mIFJBTSBhdCB0aGlzIHBvaW50LApzaW5jZSBS
QU0gYWxsb2NhdGlvbiBpcyBzb21ld2hhdCByYW5kb20gYW5kIG5vdCBndWFyYW50ZWVkIHRvIHVz
ZSB0aGUKc3RhcnQgb2YgUkFNIGxhc3QuCgpBcyBhIHNpZGUgbm90ZSwgaXQgd291bGQgYmUgYmV0
dGVyIHRvIHJlcGx5IGluIHB1YmxpYywga2VlcGluZyBDYyBvZiB0aGUKbWFpbGluZyBsaXN0LiBZ
b3VyIGVtYWlsIGNsaWVudCBtaWdodCBoYXZlIGEgIlJlcGx5IGFsbCIgb3IgIlJlcGx5IGxpc3Qi
CmJ1dHRvbiB0aGF0IHdvdWxkIGJlIHN1aXRhYmxlIGZvciB0aGlzIHB1cnBvc2UuIFRoaXMgd2F5
LCBhbGwgdGhlCmRpc2N1c3Npb24gY2FuIGJlIHJlY29yZGVkIGFuZCBiZW5lZml0IGFueW9uZSBy
dW5uaW5nIGludG8gYSBzaW1pbGFyCnByb2JsZW0gaW4gdGhlIGZ1dHVyZS4gSWYgeW91IGhhdmUg
bG9uZyBsb2dzIHdoZXJlIHJlZGFjdGlvbiBvZiBwcml2YXRlCmluZm9ybWF0aW9uIG1pZ2h0IGJl
IGltcHJhY3RpY2FsLCB0aGVuIGl0IG1heSBtYWtlIHNlbnNlIHRvIHJlcGx5IGluCnByaXZhdGUs
IGJ1dCB0aGF0IHNob3VsZCBiZSB0aGUgc3BlY2lhbCBjYXNlLgoKVml2aWFuICJkcmFtZm9yZXZl
ciIgV2FuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
