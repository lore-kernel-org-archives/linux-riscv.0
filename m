Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2888C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpGJ6j17FjmsjxLmoU+oySVI68WpEjWD+IHh53Cz6GU=; b=ksnz2YXqaYieF0
	WO/NERbVCyWNPGgqwKfGPZ5VfT0Y9btNOoe3cBWgXdqZt4d7L+K9TRiQhG6k13iXfM3zA0sKOLl9A
	b8kCDZRXXtlvsnvhx+CnFLvqknVmh9/8P+eHZ9PMWBRQYy/vh3v/ZF4ZYj9ZiWISuSh+F7TBWdWPc
	iFSQ+rS6RnddD2V1gGZ0jBYHEjIwtL7npckDLwiC51tUvRklUE/jsl1Dtme7zhaq2AyLNFfCzGf0Y
	x0XrlxkKHUPI6PSmSZylkgCAQBUWYrYOiO5YdQrcJKXYbqih5CyN6Pl9Zyi3Cjc0Rviund+llkzCK
	U/BYbpPcD/++aJcYBWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNcc-00000008RWP-24rZ;
	Fri, 07 Aug 2026 16:40:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNca-00000008RV3-25WO
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 16:40:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso1540876f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 09:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786120834; cv=none;
        d=google.com; s=arc-20260327;
        b=m1Nce1VI5ohXHcWD3jM7uZ8hfVmJFf2b29Jicjp2B6gpSvVjWdVrgPut3KPD7CKHYO
         KvsiZw6MLOkIVLeX8Z+FBcY0282/Fck3cB2vToPHm0jYNjSK1fOeEz9Hp8UuLYW+2cAv
         1zlBMmavOHxCDFLUczS9YAv6SPaBe+s5xSEmkuplQQVpCTKzcbhEQ3nw3H/vVl12RWg9
         Ifsosa70G1o//iM39jzUfYoSLQZibBim8If+mYwLcwLwsdg7zy1xOiqNHe3ugVNbB/Q7
         ibDjx29jht+R9bKg3x7UEn35I2usEWf3z/wrziWscVNczBrYMzHCzL6U2yTHTJIvOCDs
         TB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivwd8b6C0kvbJOzxDYFzgKuMZMZM9eaqiKpZX0jjZbI=;
        fh=RhKO13zNETncReLSFugkWVqtMecqwQm6WjbDzjjM02o=;
        b=CXuTdVSXpMZuSTUWeaaqRbP6OAs1+BuCYM/c+ZV3uuQri1+fasAkiyAp7ZYLPivc+A
         MfXpA5UhZ77D53bUWITvWC3gw2vjNaB8gCkO4Gsr1nOf30vcOyQg8wPREwhD+BGxBLcT
         2JeXq2vs8Gvu+uLXsXob3o2GPE4a3Upja5ZlO25QHCeI7GusC0StgA5+HotVDamx+4PQ
         8Yy6w+RQNVaPNS+2gkQ/J1n+0JM+Ww4wmOMLhcc/4QJ6vZZ+yvgFgfzY7SqbrEKRQTSr
         fJ2ADo2XNiZ0UOQcV20tgSxAoE4vr6Z5fC1zlU04ub/7RA4V/J2Xpi2E4LcpDeMCdung
         vVaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786120834; x=1786725634; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ivwd8b6C0kvbJOzxDYFzgKuMZMZM9eaqiKpZX0jjZbI=;
        b=uf2B79vvYzeL+mqtexVBncUwCCfWIGLibKQfC8OGKJ+xriNQR5jL9clKOw4DqvS9ny
         FZ1vfLFwqUAV4Sb0z3eYnpx4Mvj4FfzOzQVdP8+gY6RUgzz5Q7FNh1FVGHNUeZFi7Ta9
         8GeMHCigynyv0BUV9WOaoqLqSz0h8vVLZ+6CUa5v/p/aoQFpWF6KYFb385XuxvyH8MPE
         C+il6ewa4KhcwxBYV/t6ZO8zCBScRY2sGj5a/pthDduHzStBEsUB0TKS+Jibf+ipYlx2
         3Sai9BS2MQityXXXKTqbcNrLZBeaIsF5Uszi4ZhjGM7+e0dAdAwNj1WzxwnnYh+e/wVN
         TPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120834; x=1786725634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivwd8b6C0kvbJOzxDYFzgKuMZMZM9eaqiKpZX0jjZbI=;
        b=nACNPWORob8LNwURvUTxv40RhuCWp6VMN1FQq3gyjKZgmyOy3BGkE7ZIOXZPtcz+FG
         Z/ZASPrA83w6JY59qlAD/93u4R5Q9eF8EAL1hUJvd7Flr6j8fqaxLxIlOOidTEES9pTS
         V5K9Cwk9FHGePsRWF89IB6W5MRPFsKIfmZKN8X9IBYHlDwbZx6VL08voqln2yhwtlWfj
         bhxk2T1mGFxCs9DT3vZa5BtokVhzXOhkFkf34WyAgZscQ9hrtbVwoajdKxFfRUUMlKrT
         ou0R5NKY6pGiMqXL28aLg0QNJgl3d3y0GY0bvKx8iWP3gEv9OtRl5L2OvxkfsKOKZhv1
         KpQg==
X-Forwarded-Encrypted: i=1; AHgh+RpQ4yyoTkIn6xoLIx3XYEqejsEx/3MIuN+hSG8FZjSLgHOruj0jGqdasmKGrNRZfS6Id1pKq1ChHJx0kA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxDyslhTxzXgquKKIhz81+zMh6nl9RuIMUffI9T7Ej1DW8vceA
	coomfP20mYPWqGzyF9JIrKhMr9R1Edse+lMgqb7ALSzu8pC7/zOzVwz/RKBclbIDfzeUidPGapQ
	hkDb7WeSvE0SaXcgwLTdTjXzlX21NIf7Q3TNsjb1GfA==
X-Gm-Gg: AR+sD13NnHlcYSUJ/NV20S8vyNXhotDtCip2v3j7k8YioGRYwXsugpLL3sBUpCbkSzh
	lPURbwnAvAI7+hgPeoIX6bQTG1sVQqwBnz17GO7X/pA4zf+j4IiZST1RaRyTABshTMBNZzyS1J4
	YpfQ3glvM4lAORGeMNV+5RuQWCewI3OUg6URymEC7rgDeBs5EjbRp7QJE1V68L6a6T8zDZBnMWG
	FhwM2vzNOJuElC8MqPz/GpSUGAfQhDVgB0gjPc9JEvVO++WMF+VjvUGzuiac6ureE7kWChXhFSP
	B8CMv0owekmKk4JMXuP6KCtW06Lj9i3ydhkLxBrYcEK+CwAGrrOpzGCkF9pm1/6K52swyZAQgdL
	nJDtfojBaQ0m8u2aqekRTSZwfRPOt+ACGkfToMnR3NDuzT4o4/xIa0z19JdsTqhFL
X-Received: by 2002:a05:6000:491e:b0:47d:ee9d:90c8 with SMTP id
 ffacd0b85a97d-47fec4e2910mr44316338f8f.3.1786120834611; Fri, 07 Aug 2026
 09:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260718040000.005.6ede2881-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718040000.005.6ede2881-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Aug 2026 22:10:23 +0530
X-Gm-Features: AUfX_mwYx18eRgllpSc1cuoaEbtIanIWNOsGbSu5y1XnuqpHv0835ozA8nP-WMI
Message-ID: <CAAhSdy2j+0sV0_XD=ieDgSDPTK8eAxJBy6EFjR+yFxT0XH-5cQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Reject overlapping AIA IMSIC address fields
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094036_574590_FF4CCFF7 
X-CRM114-Status: GOOD (  16.08  )
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTA6MDXigK9BTSBQZW5ncGVuZyBIb3UgPHBlbmdwZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEtWTSBsZXRzIHVzZXJzcGFjZSBjb25maWd1cmUgdGhl
IElNU0lDIGd1ZXN0LCBIQVJULCBncm91cC13aWR0aCwgYW5kCj4gZ3JvdXAtc2hpZnQgZmllbGRz
IGluZGVwZW5kZW50bHkuIFRoZSBpbmRpdmlkdWFsIGJvdW5kcyBhbGxvdyBhIGxheW91dAo+IHN1
Y2ggYXMgZ3Vlc3RfYml0cz03LCBoYXJ0X2JpdHM9NiwgZ3JvdXBfYml0cz0xLCBhbmQgZ3JvdXBf
c2hpZnQ9MjQuCj4KPiBUaGF0IGxheW91dCBwbGFjZXMgdGhlIGdyb3VwIGluZGV4IGJpdCBhdCBi
aXQgMjQgd2hpbGUgdGhlIGxvd2VyCj4gZ3Vlc3QrSEFSVCBmaWVsZCBhbHNvIGV4dGVuZHMgdGhy
b3VnaCBiaXQgMjQuIFRoZSBJTVNJQyBhZGRyZXNzIGhlbHBlcnMKPiBsYXRlciBjb25zdW1lIHRo
ZXNlIHZhbHVlcyBhcyBvbmUgYWRkcmVzcyBsYXlvdXQ6IGFpYV9pbXNpY19wcG4oKSBtYXNrcwo+
IHRoZSBsb3dlciBndWVzdCtIQVJUIGZpZWxkIGFuZCB0aGUgZ3JvdXAgZmllbGQsIHdoaWxlCj4g
YWlhX2ltc2ljX2hhcnRfaW5kZXgoKSBjb21iaW5lcyB0aGUgZ3JvdXAgYW5kIEhBUlQgaW5kZXgu
IEFsbG93aW5nIGFuCj4gb3ZlcmxhcHBpbmcgY29uZmlndXJhdGlvbiB0aGVyZWZvcmUgZ2l2ZXMg
b25lIGFkZHJlc3MgYml0IHR3byBkaWZmZXJlbnQKPiBtZWFuaW5ncy4KPgo+IFJlamVjdCBncm91
cC1pbmRleCBsYXlvdXRzIHRoYXQgc3RhcnQgYmVmb3JlIHRoZSBlbmQgb2YgdGhlIGd1ZXN0K0hB
UlQKPiBmaWVsZCBiZWZvcmUgaW5pdGlhbGl6aW5nIHRoZSBpbi1rZXJuZWwgaXJxY2hpcC4KPgo+
IEZpeGVzOiA4OWQwMTMwNmUzNGQgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IGRldmljZSBpbnRl
cmZhY2UgZm9yIEFJQSBpcnFjaGlwIikKPiBTaWduZWQtb2ZmLWJ5OiBQZW5ncGVuZyBIb3UgPHBl
bmdwZW5nQGlzY2FzLmFjLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuMwoKVGhhbmtz
LApBbnVwCgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jIHwgNiArKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+IGlu
ZGV4IGJlODNjMmQ1ZmMzMDguLjA3OTNkNGQ0Y2Y1ZTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vYWlhX2RldmljZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jCj4g
QEAgLTI0OCw2ICsyNDgsMTIgQEAgc3RhdGljIGludCBhaWFfaW5pdChzdHJ1Y3Qga3ZtICprdm0p
Cj4gICAgICAgICBpZiAoYWlhLT5ucl9zb3VyY2VzICYmIGFpYS0+YXBsaWNfYWRkciA9PSBLVk1f
UklTQ1ZfQUlBX1VOREVGX0FERFIpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
Cj4gKyAgICAgICAvKiBHcm91cCBpbmRleCBiaXRzIG11c3Qgbm90IG92ZXJsYXAgZ3Vlc3QgYW5k
IEhBUlQgaW5kZXggYml0cy4gKi8KPiArICAgICAgIGlmIChhaWEtPm5yX2dyb3VwX2JpdHMgJiYK
PiArICAgICAgICAgICBhaWEtPm5yX2dyb3VwX3NoaWZ0IDwgSU1TSUNfTU1JT19QQUdFX1NISUZU
ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhaWEtPm5yX2d1
ZXN0X2JpdHMgKyBhaWEtPm5yX2hhcnRfYml0cykKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gKwo+ICAgICAgICAgLyogSW5pdGlhbGl6ZSBBUExJQyAqLwo+ICAgICAgICAgcmV0
ID0ga3ZtX3Jpc2N2X2FpYV9hcGxpY19pbml0KGt2bSk7Cj4gICAgICAgICBpZiAocmV0KQo+IC0t
Cj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
