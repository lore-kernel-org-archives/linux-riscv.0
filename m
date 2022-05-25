Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F2BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 22:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcD4dU5Xo7B/Pa0tfNXMdt3XNsP6R6azWSO6oGTdJYs=; b=EL6vlwpYbmv2ON
	PrOtojr7jaTGztVKwQmRhEM6PVIz0OLXjq8WcMA7V+YepUWCYgm49aZLZIOSkhG4F/JoUcnH7INAv
	oy7SqEh7kxHnpcMFNIBHKDNysvMse8bu6oUkv66S++vb9NW3Chbb7rYIrMiBB+mL+IRVDFpkzLRGq
	kzEqCSgBYQwImcyRJSqsvnYmVmfQH4GgeZjcSsOhsax5YS1f6Eg6GwN2sSfOXMa5h/ZMR5eB6ClVm
	xQ3lLhbtvPw+jugYY0NsUaAmDJO61c8QaALIJkaLacc3RKR+0KxRn8tTI0Um2zZJp7loT73+DnzS/
	/2mBAIgFqHxSkHVEbDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntzvK-00CvV4-4a; Wed, 25 May 2022 22:56:14 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntzvH-00CvTi-Ny
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 22:56:13 +0000
Received: by mail-oi1-x22c.google.com with SMTP id k186so313597oia.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DbhXocVdJI108NLqeONWoZkfXcTtzL64FrHc9jEvSMY=;
        b=h7epTynqVLwlSXxaAhGIjxm24IKossrcYupb3DHhPMA/GpRdJolUTuELfnJuXY+lJO
         N7R+5/1pvc3LarzWT0gViUaDDMGGhSY6aP6y0OEHm5Ii7dSWk4G/HawIxMNilpECX9VI
         B4TL3tpmGKQnCc7UioiYqYV6tEVDBN6LKsUkkHRsq+ifHaKiLRADIhbmPhhDahfxI3lm
         ufoXZOxzOdjS27T4qzfPll/Mk/bOgZvBCnPfr83vKV4Qn3WeWt3FyzyL2DcAtD7I297b
         QxoqqhpbotMcYNzg1lWtyoukKFKInSg/SAlaPk54whSvzty2CxgrGeDG+tIr6VKP1PTo
         NF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DbhXocVdJI108NLqeONWoZkfXcTtzL64FrHc9jEvSMY=;
        b=d7ms6QnvCzR5NfdiurwBz9fHXqiN0MjJuh/2DVpPCJ2SwHK8yJXPsfoLBabyUZRh81
         OkLHfjGuxSz9b1NkXCZ7rMHQC5wSFW534Dvcmi1yRnyovf1iVTAuW8nKd7RIPKTwtJcQ
         kDKsDiCcRcTH/y0uEDjQPoO42qW25Nl8jyp+XwyLlZmsUWIU2V/8SgVE7PIIyQdCOk0l
         gRCsPV5bVsdv5DYkyf+ud+5PjFhhFIZn6zpciQWscnlGJRihSWxoiOxk/BbM8rqi6OP0
         SHDwik8ZQsUMWapPderNDfe6KOAVYAzabI4/gWlbvT6Mre5d4kHzs3JIwK3ZnArdLImX
         gbjA==
X-Gm-Message-State: AOAM530egOLFnepT1G46PODsLvYmk32D07B617f6RHiruvSbC9Gobx7N
	T7oNuy3ZDMmFTEMGGB8oXn8=
X-Google-Smtp-Source: ABdhPJyBxdz/4uWxT28qO5q67jZnYyhrQB81/44lp3PL6QjvdW6IfSt8sgcLAUT3/by8eikrUG+LgQ==
X-Received: by 2002:a05:6808:f0b:b0:328:bad3:2d92 with SMTP id m11-20020a0568080f0b00b00328bad32d92mr6515862oiw.277.1653519369605;
        Wed, 25 May 2022 15:56:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gn9-20020a056870d98900b000f27976b9d9sm32202oab.6.2022.05.25.15.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 15:56:08 -0700 (PDT)
Message-ID: <48ef770c-75bf-6c37-66fe-9719164bc6e0@roeck-us.net>
Date: Wed, 25 May 2022 15:56:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] riscv: compat: Using seperated vdso_maps for
 compat_vdso_info
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, guoren@linux.alibaba.com
References: <mhng-b37ccc06-67ad-4fd8-bcdb-0e5c9e5a4750@palmer-ri-x1c9>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <mhng-b37ccc06-67ad-4fd8-bcdb-0e5c9e5a4750@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_155611_823205_C5377FCD 
X-CRM114-Status: GOOD (  13.65  )
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

T24gNS8yNS8yMiAxNDozNCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gV2VkLCAyNSBNYXkg
MjAyMiAxNDoxNTowMyBQRFQgKC0wNzAwKSwgbGludXhAcm9lY2stdXMubmV0IHdyb3RlOgo+PiBP
biA1LzI1LzIyIDA5OjA0LCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPj4+IEZyb206IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPj4+Cj4+PiBUaGlzIGlzIGEgZml4dXAgZm9y
IHZkc28gaW1wbGVtZW50YXRpb24gd2hpY2ggY2F1c2VkIG11c2wgdG8KPj4+IGZhaWwuCj4+Pgo+
Pj4gW8KgwqAgMTEuNjAwMDgyXSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPj4+IFvC
oMKgIDExLjYyODU2MV0gaW5pdFsxXTogdW5oYW5kbGVkIHNpZ25hbCAxMSBjb2RlIDB4MSBhdAo+
Pj4gMHgwMDAwMDAwMDAwMDAwMDAwIGluIGxpYmMuc29bZmZmZmZmOGFkMzkwMDArYTQwMDBdCj4+
PiBbwqDCoCAxMS42MjkzOThdIENQVTogMCBQSUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFpbnRlZAo+
Pj4gNS4xOC4wLXJjNy1uZXh0LTIwMjIwNTIwICMxCj4+PiBbwqDCoCAxMS42Mjk0NjJdIEhhcmR3
YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPj4+IFvCoMKgIDExLjYyOTU0Nl0gZXBj
IDogMDBmZmZmZmY4YWRhMTEwMCByYSA6IDAwZmZmZmZmOGFkYTEzYzggc3AgOgo+Pj4gMDBmZmZm
ZmZjNTgxOTlmMAo+Pj4gW8KgwqAgMTEuNjI5NTg2XcKgIGdwIDogMDBmZmZmZmY4YWQzOTAwMCB0
cCA6IDAwZmZmZmZmOGFkZTA5OTggdDAgOgo+Pj4gZmZmZmZmZmZmZmZmZmZmZgo+Pj4gW8KgwqAg
MTEuNjI5NTk4XcKgIHQxIDogMDBmZmZmZmZjNTgxOWZkMCB0MiA6IDAwMDAwMDAwMDAwMDAwMDAg
czAgOgo+Pj4gMDBmZmZmZmY4YWRlMGNjMAo+Pj4gW8KgwqAgMTEuNjI5NjEwXcKgIHMxIDogMDBm
ZmZmZmY4YWRlMGNjMCBhMCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOgo+Pj4gMDBmZmZmZmZjNTgx
OWEwMAo+Pj4gW8KgwqAgMTEuNjI5NjIyXcKgIGEyIDogMDAwMDAwMDAwMDAwMDAwMSBhMyA6IDAw
MDAwMDAwMDAwMDAwMWUgYTQgOgo+Pj4gMDBmZmZmZmZjNTgxOWIwMAo+Pj4gW8KgwqAgMTEuNjI5
NjM0XcKgIGE1IDogMDBmZmZmZmZjNTgxOWIwMCBhNiA6IDAwMDAwMDAwMDAwMDAwMDAgYTcgOgo+
Pj4gMDAwMDAwMDAwMDAwMDAwMAo+Pj4gW8KgwqAgMTEuNjI5NjQ1XcKgIHMyIDogMDBmZmZmZmY4
YWRlMGFjOCBzMyA6IDAwZmZmZmZmOGFkZTBlYzggczQgOgo+Pj4gMDBmZmZmZmY4YWRlMDcyOAo+
Pj4gW8KgwqAgMTEuNjI5NjU2XcKgIHM1IDogMDBmZmZmZmY4YWRlMGE5MCBzNiA6IDAwMDAwMDAw
MDAwMDAwMDAgczcgOgo+Pj4gMDBmZmZmZmZjNTgxOWU0MAo+Pj4gW8KgwqAgMTEuNjI5NjY3XcKg
IHM4IDogMDBmZmZmZmY4YWRlMGNhMCBzOSA6IDAwZmZmZmZmOGFkZGJhNTAgczEwOgo+Pj4gMDAw
MDAwMDAwMDAwMDAwMAo+Pj4gW8KgwqAgMTEuNjI5Njc4XcKgIHMxMTogMDAwMDAwMDAwMDAwMDAw
MCB0MyA6IDAwMDAwMDAwMDAwMDAwMDIgdDQgOgo+Pj4gMDAwMDAwMDAwMDAwMDAwMQo+Pj4gW8Kg
wqAgMTEuNjI5Njg4XcKgIHQ1IDogMDAwMDAwMDAwMDAyMDAwMCB0NiA6IGZmZmZmZmZmZmZmZmZm
ZmYKPj4+IFvCoMKgIDExLjYyOTY5OV0gc3RhdHVzOiAwMDAwMDAwMDAwMDA0MDIwIGJhZGFkZHI6
IDAwMDAwMDAwMDAwMDAwMDAKPj4+IGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCj4+Pgo+Pj4gVGhl
IGxhc3QgX192ZHNvX2luaXQoJmNvbXBhdF92ZHNvX2luZm8pIHJlcGxhY2VzIHRoZSBkYXRhIGlu
IG5vcm1hbAo+Pj4gdmRzb19pbmZvLiBUaGlzIGlzIGFuIG9idmlvdXMgYnVnLgo+Pj4KPj4+IFJl
cG9ydGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPj4+IENjOiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQGRhYmJlbHQuY29tPgo+Pj4gQ2M6IEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2gu
ZGU+Cj4+Cj4+IFRlc3RlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+
IAo+IFNvcnJ5IEknbSBhIGJpdCBidXJpZWQgcmlnaHQgbm93LCB0aGlzIGlzIGZpeGluZyB0aGUg
aXNzdWUgeW91IHBvaW50ZWQgb3V0IGVhcmxpZXI/Cj4gClllcy4KClRoYW5rcywKR3VlbnRlcgoK
Pj4KPj4+IC0tLQo+Pj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jIHwgMTUgKysrKysrKysr
KysrKy0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdmRzby5jCj4+PiBpbmRleCA1MGZlNGM4Nzc2MDMuLjY5YjA1YjZjMTgx
YiAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+Pj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdmRzby5jCj4+PiBAQCAtMjA2LDEyICsyMDYsMjMgQEAgc3RhdGljIHN0
cnVjdCBfX3Zkc29faW5mbyB2ZHNvX2luZm8gX19yb19hZnRlcl9pbml0ID0gewo+Pj4gwqAgfTsK
Pj4+Cj4+PiDCoCAjaWZkZWYgQ09ORklHX0NPTVBBVAo+Pj4gK3N0YXRpYyBzdHJ1Y3Qgdm1fc3Bl
Y2lhbF9tYXBwaW5nIHJ2X2NvbXBhdF92ZHNvX21hcHNbXSBfX3JvX2FmdGVyX2luaXQgPSB7Cj4+
PiArwqDCoMKgIFtSVl9WRFNPX01BUF9WVkFSXSA9IHsKPj4+ICvCoMKgwqDCoMKgwqDCoCAubmFt
ZcKgwqAgPSAiW3Z2YXJdIiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuZmF1bHQgPSB2dmFyX2ZhdWx0
LAo+Pj4gK8KgwqDCoCB9LAo+Pj4gK8KgwqDCoCBbUlZfVkRTT19NQVBfVkRTT10gPSB7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgLm5hbWXCoMKgID0gIlt2ZHNvXSIsCj4+PiArwqDCoMKgwqDCoMKgwqAg
Lm1yZW1hcCA9IHZkc29fbXJlbWFwLAo+Pj4gK8KgwqDCoCB9LAo+Pj4gK307Cj4+PiArCj4+PiDC
oCBzdGF0aWMgc3RydWN0IF9fdmRzb19pbmZvIGNvbXBhdF92ZHNvX2luZm8gX19yb19hZnRlcl9p
bml0ID0gewo+Pj4gwqDCoMKgwqDCoCAubmFtZSA9ICJjb21wYXRfdmRzbyIsCj4+PiDCoMKgwqDC
oMKgIC52ZHNvX2NvZGVfc3RhcnQgPSBjb21wYXRfdmRzb19zdGFydCwKPj4+IMKgwqDCoMKgwqAg
LnZkc29fY29kZV9lbmQgPSBjb21wYXRfdmRzb19lbmQsCj4+PiAtwqDCoMKgIC5kbSA9ICZydl92
ZHNvX21hcHNbUlZfVkRTT19NQVBfVlZBUl0sCj4+PiAtwqDCoMKgIC5jbSA9ICZydl92ZHNvX21h
cHNbUlZfVkRTT19NQVBfVkRTT10sCj4+PiArwqDCoMKgIC5kbSA9ICZydl9jb21wYXRfdmRzb19t
YXBzW1JWX1ZEU09fTUFQX1ZWQVJdLAo+Pj4gK8KgwqDCoCAuY20gPSAmcnZfY29tcGF0X3Zkc29f
bWFwc1tSVl9WRFNPX01BUF9WRFNPXSwKPj4+IMKgIH07Cj4+PiDCoCAjZW5kaWYKPj4+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
