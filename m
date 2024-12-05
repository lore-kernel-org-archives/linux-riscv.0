Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E441E77171
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLLXNu8rZLdsLHoPNNV5OI8U1KiG0JEA7De4dPQ+59I=; b=4aI2uVj5LKwxn+
	qinLLBnW7vjXShSmd6Bx7SArvSHFL48jIHsE/LAxRiboS/AV2l2RKHaORSUehbKAqvfPHxj4jTj1Z
	kU8uGDOFs1IdMqEApDUtrFiEtU9rgrr4armukrEO0sR6D2GVb5xXTjlcoQqnBJwAPTc+5CgZWGvBa
	vtK4CJ/ZIFDI83wRtcYQqd8PcvCKqQsO3cVhjKFux6ls7NTLjUblOEe1Rz0xldIGgit32f+9ceKrI
	UXb5PsX30SYCCfRUYI5XkipX37phmjMyZTuW+pL2aJWBO7jLk9kogHifA60wZzDKDUP175RQShNxk
	oLrdXNhugmR62WY0SCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ52z-0000000Erb8-3ZYn;
	Thu, 05 Dec 2024 06:09:09 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ52x-0000000EraE-0Hq3
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 06:09:08 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3a7d7c1b190so1822835ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Dec 2024 22:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1733378945; x=1733983745; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrCPi2+AMoUIBBeZZDnWKQXoZCoTjeNpyWsA1Y4tP7o=;
        b=KXHfCt8alaqZDGajTd86QUU3MvTCPhzAKmiNcVtcg+mmy1wOxbZdYgXEG4zIsp6481
         QH7/epxat9j35VAAPGQzq0D+2oC1QYZ71izoqOqqoebfJlUvAm7/lE25oDVerCN8zFLX
         ++Zz0A5flaZpCXlPONXxHgAHQFiVfh2QPRaog7MwscDNBy9qi/l4ndfOQS1RP0hyfpuw
         XTq+dFIAbc6T19nvUBN1zLzd5zbKjBAcRwCXtlrL6E6+PNLo2udRSYlAjZjWBtXFU6jX
         zTYu7oM4AYiWOZ7t6RNNOHwXApbE3gpmayyzP0zFrTmTELWZJD4uvznh41Yo1Q3M0OJH
         eJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733378945; x=1733983745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrCPi2+AMoUIBBeZZDnWKQXoZCoTjeNpyWsA1Y4tP7o=;
        b=WvCa1Y1wMbeclH6yighKCJLGCmHAuix02k91c8HzxCpbZvGm25sqNCk4HNhgn8fm3z
         kyjwzUSmD5nbjfFdmV+ov3dJA85RXf3P5uH4xeqvy1BcLYKTe/sAFbUU2GZkeScoCR1l
         +adO2NUJhtKvJ6rNejq6G8eN6cTGM3sNNTKuu9WZqaB6eoJwp9yb1nJnYqmekxq+qM7k
         rBQP1qWN6IqXkM55q5buFU+vVu7cwHRNsI5hLq5TF6aZ0aXKX4TVQQbjG6jprsw0RS1x
         uq7gnDkYOV7wae73GUo3rK58lPssJNSiE/l/wr4BOhTqTRCZyOQjtxIhHcVD/a78ZK0g
         0E9g==
X-Forwarded-Encrypted: i=1; AJvYcCUWwHm4dWCQrUeUuERaBBZyRyTYtDaSnx8wb3YXCyNp6q7OaF4aTIryAmqwdy+PG+6ghg8Ab3M53DR+9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCLq4j+dQ+q9d2IwSQZAfzf50eHpT0jTaiznWH/mcpz9qswMPL
	VnJYxS9FaCYp55MtMaXZFdKcsXLdNdUpf3pujSW/U0Fw0sO/cekGQ/rxHvl/GqwecKWA3BqqklO
	DvZMJsQ2y9+oOaS6cpk/psU4YLMwpXiT/51kPhA==
X-Gm-Gg: ASbGncvQw0x1+nMolJK3v+r4V8EV5YmEkhaW54+UEQ4gJ9BkMXSldN9TviXVSmduEPT
	Om/ILMNUuOMyGPAFk8KcvS2y24lUa7w==
X-Google-Smtp-Source: AGHT+IG+hl0wHP0dEke+gpe/cNmc8vXAXG5KPxuXeiFJOV5qm4qiuy11WTTZwG8ObUypt84YHw3PTwYSwFiBKlujZIw=
X-Received: by 2002:a05:6e02:1c07:b0:3a7:e67f:3c5b with SMTP id
 e9e14a558f8ab-3a7f9a3674cmr111507425ab.2.1733378944964; Wed, 04 Dec 2024
 22:09:04 -0800 (PST)
MIME-Version: 1.0
References: <20241017074538.18867-4-ajones@ventanamicro.com>
In-Reply-To: <20241017074538.18867-4-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Dec 2024 11:38:53 +0530
Message-ID: <CAAhSdy3jNRhGbx3PzEMaB0Efx3XWAn=h0t7DHMGCJLc_2VipkQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: KVM: SBI system suspend support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_220907_114138_84F07035 
X-CRM114-Status: GOOD (  14.44  )
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

T24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgMToxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIFNCSSBzcGVjIHByb3ZpZGVzIGEgc3BlY2lm
aWNhdGlvbiBmb3Igc3lzdGVtIHN1c3BlbmQgdG8gUkFNIGFuZCBMaW51eAo+IGFscmVhZHkgc3Vw
cG9ydHMgaW52b2tpbmcgdGhlIFNCSSBjYWxsIGZvciBzdXNwZW5kIHRvIFJBTSB3aGVuCj4gQ09O
RklHX1NVU1BFTkQgaXMgc2VsZWN0ZWQuIEltcGxlbWVudCBzdXBwb3J0IGZvciB0aGUgU0JJIGNh
bGwgaW4gS1ZNCj4gc28gZ3Vlc3RzIG1heSBpbml0aWF0ZSBhIHN5c3RlbSBzdXNwZW5kLiBIb3dl
dmVyLCBzaW5jZSB3aGF0IGEgInN5c3RlbQo+IHN1c3BlbmQiIG1lYW5zIGZvciBhIFZNIG1heSBk
aWZmZXIgYmV0d2VlbiBWTSBwcm92aWRlcnMsIGxlYXZlIGl0IHVwCj4gdG8gdGhlIFZNTSB0byBk
ZWNpZGUgd2hhdCB0byBkby4gS1ZNIG9ubHkgbmVlZHMgdG8gZW5zdXJlIHRoZSBlbnRyeQo+IGNy
aXRlcmlhIGZvciBzeXN0ZW0gc3VzcGVuZCAocGVyIHRoZSBzcGVjKSBpcyBtZXQgYW5kIHByZXBh
cmUgdGhpbmdzIGZvcgo+IHRoZSByZXN1bWUgZm9yIHdoZW4gdGhlIFZNTSB0cmlnZ2VycyBpdC4K
Pgo+IFRlc3RlZCB3aXRoIHRoaXMga3ZtdG9vbCBicmFuY2ggWzFdCj4KPiBbMV0gaHR0cHM6Ly9n
aXRodWIuY29tL2pvbmVzLWRyZXcva3ZtdG9vbC9jb21taXRzL3Jpc2N2L3NiaS1zeXMtc3VzcC8K
Pgo+Cj4gQW5kcmV3IEpvbmVzICgyKToKPiAgIFJJU0MtVjogS1ZNOiBBZGQgU0JJIHN5c3RlbSBz
dXNwZW5kIHN1cHBvcnQKPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFNCSSBTVVNQIHRv
IGdldC1yZWctbGlzdCB0ZXN0CgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIDYuMTQKClRoYW5rcywK
QW51cAoKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oICAgICAgICAg
fCAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICB8
ICAxICsKPiAgYXJjaC9yaXNjdi9rdm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgICAgICAgICAgfCAg
NCArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N5c3RlbS5jICAgICAgICAgICAgICB8IDcz
ICsrKysrKysrKysrKysrKysrKysKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1s
aXN0LmMgICAgICAgIHwgIDYgKy0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9zeXN0ZW0uYwo+Cj4gLS0KPiAyLjQ2LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
