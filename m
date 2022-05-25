Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08B6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 21:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWqkH2fr66BphbP15CHHHuNKuWENVzEXA/W+2Cn3i1s=; b=MhPdTw0c/PltUs
	o6h1JzV73JtpJ0t+J5IHN9qgUPubuyRl/z3qtrrUQdT4DlDVpBOXA1EEZh0iNI99D2PlfSOOnzpih
	yZmZZFfxcJ2sKHJefSlFzlgQCSM5yTfQwiti/C3hEnDGmvUmQ+2j+g5JoEjLRtaWxO5sY1ZIQ2jwp
	B03qaXQjECouLQbo0a9WoFPjvTKvwhMAlMMrLnVaiwNbkpiOj0lglRrXGu22eJ3y/FHriHVv26rzA
	BS12vvjhaWnbV06+UFosB4GteDZDHHaYYTcZ+oYymf4mn7wp7hCx923bB527l3V/dGyMGaiqRw8aN
	/N5+RM92APbG406c3POg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntyLZ-00CjWT-1q; Wed, 25 May 2022 21:15:13 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntyLW-00CjVk-3f
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 21:15:11 +0000
Received: by mail-oi1-x22c.google.com with SMTP id e189so23310oia.8
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 14:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CyIVEDRhT/M7EHYfzJq+drDcdbp/lDyRu17RaUijUkM=;
        b=dm3oVIEB25+vDzpB8AA76nAKlTtzq6VJF6QwnO3F+9nfqQn/grLvmiiCBRrr8A35j/
         YwY+O5IBfoLxf6RXdAuQtXpnqQFq9SFOW+EI7EJ3OK56jBl0XaFIbJriNGZ2k+9BU8Fc
         ezHnCF2xD5Y0XLS4fucTTwZxnETqWfX/dUoXl+rgfu0q3xzaEVCHBT1nEI/xdm9+KDKQ
         O9BB5LBs1F7E3J60o5kMhf2pObt2geYeoc3DqEWQ14RMrrQ3a8gsUeOyyB0hegn3WOtl
         HgZfxfGoQp/IJqw7JIDzI8XMXbEYmpZy1JeNc+K5y42FnJ/zbaJ/uEkIXflivV1lqMpo
         Pkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CyIVEDRhT/M7EHYfzJq+drDcdbp/lDyRu17RaUijUkM=;
        b=ycTDJDsztf/UWfBcnbpNQT6F6Ix4jLAR+jvfPUPhbCdBvuxu+WsOjneLdbhjf136xg
         yUEOB4LgeROCReQPFXNFHWjvebGNSE9VVQMaaoRNbO8LR7dIW+RiFEtw9eQULjvlnMDm
         kCCT4dSMIIMFMcjfmZFUN3S4ywT8NGHGxCO6SYcwgDEqTOPdLp63QZB/EaMAoSks7cLQ
         1+mgTyvYnHnJGg97zVbflQgjFChxpB62OCRbyEyUQ7ykoSZvxAXgciI28rONTopVeH2z
         w+o66TRY8w9izRv1koB39BMRj6KEH9HgZMkVPYauAuCO3duGEzz981IyBde/Najv4AZ/
         fxWA==
X-Gm-Message-State: AOAM530aJHST/TwcjlhE62ERhH9joj4POsujqU4me2tnKyzVEJ5VlXHf
	pZpIzrXhTFNM/IEIDnaKSxJEgNF9ksJMXg==
X-Google-Smtp-Source: ABdhPJz9jAZDYSt+Q/kkrzMX1JtzWFXqg3ASxtU1e/YjSzMldZ6xlAFfe3xpoKOLfQniTCPVVIcYig==
X-Received: by 2002:a05:6808:571:b0:32a:fdb8:167d with SMTP id j17-20020a056808057100b0032afdb8167dmr6271502oig.198.1653513307023;
        Wed, 25 May 2022 14:15:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n11-20020a9d4d0b000000b0060b1fefeb52sm2572003otf.66.2022.05.25.14.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 14:15:06 -0700 (PDT)
Message-ID: <a0bffec3-cf43-417e-3804-9248325266c3@roeck-us.net>
Date: Wed, 25 May 2022 14:15:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] riscv: compat: Using seperated vdso_maps for
 compat_vdso_info
Content-Language: en-US
To: guoren@kernel.org, palmer@rivosinc.com, arnd@arndb.de,
 palmer@dabbelt.com, heiko@sntech.de
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
References: <20220525160404.2930984-1-guoren@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220525160404.2930984-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_141510_211522_B090314B 
X-CRM114-Status: GOOD (  17.72  )
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

T24gNS8yNS8yMiAwOTowNCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gRnJvbTogR3VvIFJl
biA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+IFRoaXMgaXMgYSBmaXh1cCBmb3IgdmRz
byBpbXBsZW1lbnRhdGlvbiB3aGljaCBjYXVzZWQgbXVzbCB0bwo+IGZhaWwuCj4gCj4gWyAgIDEx
LjYwMDA4Ml0gUnVuIC9zYmluL2luaXQgYXMgaW5pdCBwcm9jZXNzCj4gWyAgIDExLjYyODU2MV0g
aW5pdFsxXTogdW5oYW5kbGVkIHNpZ25hbCAxMSBjb2RlIDB4MSBhdAo+IDB4MDAwMDAwMDAwMDAw
MDAwMCBpbiBsaWJjLnNvW2ZmZmZmZjhhZDM5MDAwK2E0MDAwXQo+IFsgICAxMS42MjkzOThdIENQ
VTogMCBQSUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFpbnRlZAo+IDUuMTguMC1yYzctbmV4dC0yMDIy
MDUyMCAjMQo+IFsgICAxMS42Mjk0NjJdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11
IChEVCkKPiBbICAgMTEuNjI5NTQ2XSBlcGMgOiAwMGZmZmZmZjhhZGExMTAwIHJhIDogMDBmZmZm
ZmY4YWRhMTNjOCBzcCA6Cj4gMDBmZmZmZmZjNTgxOTlmMAo+IFsgICAxMS42Mjk1ODZdICBncCA6
IDAwZmZmZmZmOGFkMzkwMDAgdHAgOiAwMGZmZmZmZjhhZGUwOTk4IHQwIDoKPiBmZmZmZmZmZmZm
ZmZmZmZmCj4gWyAgIDExLjYyOTU5OF0gIHQxIDogMDBmZmZmZmZjNTgxOWZkMCB0MiA6IDAwMDAw
MDAwMDAwMDAwMDAgczAgOgo+IDAwZmZmZmZmOGFkZTBjYzAKPiBbICAgMTEuNjI5NjEwXSAgczEg
OiAwMGZmZmZmZjhhZGUwY2MwIGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6Cj4gMDBmZmZmZmZj
NTgxOWEwMAo+IFsgICAxMS42Mjk2MjJdICBhMiA6IDAwMDAwMDAwMDAwMDAwMDEgYTMgOiAwMDAw
MDAwMDAwMDAwMDFlIGE0IDoKPiAwMGZmZmZmZmM1ODE5YjAwCj4gWyAgIDExLjYyOTYzNF0gIGE1
IDogMDBmZmZmZmZjNTgxOWIwMCBhNiA6IDAwMDAwMDAwMDAwMDAwMDAgYTcgOgo+IDAwMDAwMDAw
MDAwMDAwMDAKPiBbICAgMTEuNjI5NjQ1XSAgczIgOiAwMGZmZmZmZjhhZGUwYWM4IHMzIDogMDBm
ZmZmZmY4YWRlMGVjOCBzNCA6Cj4gMDBmZmZmZmY4YWRlMDcyOAo+IFsgICAxMS42Mjk2NTZdICBz
NSA6IDAwZmZmZmZmOGFkZTBhOTAgczYgOiAwMDAwMDAwMDAwMDAwMDAwIHM3IDoKPiAwMGZmZmZm
ZmM1ODE5ZTQwCj4gWyAgIDExLjYyOTY2N10gIHM4IDogMDBmZmZmZmY4YWRlMGNhMCBzOSA6IDAw
ZmZmZmZmOGFkZGJhNTAgczEwOgo+IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgMTEuNjI5Njc4XSAg
czExOiAwMDAwMDAwMDAwMDAwMDAwIHQzIDogMDAwMDAwMDAwMDAwMDAwMiB0NCA6Cj4gMDAwMDAw
MDAwMDAwMDAwMQo+IFsgICAxMS42Mjk2ODhdICB0NSA6IDAwMDAwMDAwMDAwMjAwMDAgdDYgOiBm
ZmZmZmZmZmZmZmZmZmZmCj4gWyAgIDExLjYyOTY5OV0gc3RhdHVzOiAwMDAwMDAwMDAwMDA0MDIw
IGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAKPiBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZAo+IAo+
IFRoZSBsYXN0IF9fdmRzb19pbml0KCZjb21wYXRfdmRzb19pbmZvKSByZXBsYWNlcyB0aGUgZGF0
YSBpbiBub3JtYWwKPiB2ZHNvX2luZm8uIFRoaXMgaXMgYW4gb2J2aW91cyBidWcuCj4gCj4gUmVw
b3J0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiBTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+Cj4gQ2M6IEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+CgpUZXN0
ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KCj4gLS0tCj4gICBhcmNo
L3Jpc2N2L2tlcm5lbC92ZHNvLmMgfCAxNSArKysrKysrKysrKysrLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKPiBpbmRl
eCA1MGZlNGM4Nzc2MDMuLjY5YjA1YjZjMTgxYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC92ZHNvLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKPiBAQCAtMjA2LDEy
ICsyMDYsMjMgQEAgc3RhdGljIHN0cnVjdCBfX3Zkc29faW5mbyB2ZHNvX2luZm8gX19yb19hZnRl
cl9pbml0ID0gewo+ICAgfTsKPiAgIAo+ICAgI2lmZGVmIENPTkZJR19DT01QQVQKPiArc3RhdGlj
IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgcnZfY29tcGF0X3Zkc29fbWFwc1tdIF9fcm9fYWZ0
ZXJfaW5pdCA9IHsKPiArCVtSVl9WRFNPX01BUF9WVkFSXSA9IHsKPiArCQkubmFtZSAgID0gIlt2
dmFyXSIsCj4gKwkJLmZhdWx0ID0gdnZhcl9mYXVsdCwKPiArCX0sCj4gKwlbUlZfVkRTT19NQVBf
VkRTT10gPSB7Cj4gKwkJLm5hbWUgICA9ICJbdmRzb10iLAo+ICsJCS5tcmVtYXAgPSB2ZHNvX21y
ZW1hcCwKPiArCX0sCj4gK307Cj4gKwo+ICAgc3RhdGljIHN0cnVjdCBfX3Zkc29faW5mbyBjb21w
YXRfdmRzb19pbmZvIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKPiAgIAkubmFtZSA9ICJjb21wYXRfdmRz
byIsCj4gICAJLnZkc29fY29kZV9zdGFydCA9IGNvbXBhdF92ZHNvX3N0YXJ0LAo+ICAgCS52ZHNv
X2NvZGVfZW5kID0gY29tcGF0X3Zkc29fZW5kLAo+IC0JLmRtID0gJnJ2X3Zkc29fbWFwc1tSVl9W
RFNPX01BUF9WVkFSXSwKPiAtCS5jbSA9ICZydl92ZHNvX21hcHNbUlZfVkRTT19NQVBfVkRTT10s
Cj4gKwkuZG0gPSAmcnZfY29tcGF0X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9WVkFSXSwKPiArCS5j
bSA9ICZydl9jb21wYXRfdmRzb19tYXBzW1JWX1ZEU09fTUFQX1ZEU09dLAo+ICAgfTsKPiAgICNl
bmRpZgo+ICAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
