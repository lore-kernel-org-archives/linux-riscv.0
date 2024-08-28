Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7BCC636E5
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoNFQV2/Ci9fYTTGcAWmrlWRvF1VxbqMxk1qsqnRSxc=; b=ypizLsLSZE4Xn0
	Q7kNEMXg+whGToelzkTMq0B7M9eII09Sw5I+I7nuy7ZhIXlkeKkjS5TB8aNqhYJy8Cp5G7BVOR0XE
	IIxqf606DCUdojsMTh3e9jN/74EfuQTSXqiECBpLs/b+61vO5tHTtIXAr5b5BRp44GBXa1K1MhZoO
	iLnAnb3jG5m9aB6RTn6Rg72EU5HPyQ0qA/hQiLMhqUVEkdqRbIM6IM81i7xTITSWy7KiwNRI2lNDw
	xrHvfLtebHMVDNhzpWREc0mlZr5UjTa7RpPgAwbKVyjdlDcnJA4JOqtJjMCIwWvRZ4Fx54lWpeTem
	aZyDL42NnP0cmm43Hc9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMFw-0000000GKCB-1vPN;
	Wed, 28 Aug 2024 17:14:52 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMF5-0000000GJuX-0YYI
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 17:14:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71430e7eaf8so5613509b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724865237; x=1725470037; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZcWjsx2GFVbGR3sFLDnaT6Mg3/3VJFqnuVHgVecU75g=;
        b=YVIVmMW3ZvLB8FGavadD4WaR8JKshxglSw9+hZXtg+X70HWnBJZ9N86JUoe96BhrQo
         sScQCRwrMV6cRqUwLjzALY9/T/tCU/p8g5EINO7XOMrHx8zQYxOuhlUVlBjmyTCCKVft
         rJAbrRBLhsdapW28PffjvUGh2tHYNO0DnFr+c2IZXzeXkwSLkuicM0a4UtPKgkpOaKc1
         6CtAC6TXdZ/r1NdXrNuZEn73kGm1PIJm2MungGZ1KUYHciO3iyrVciixkmZqQj25sMNJ
         6/fz4GyMYsL0BhU0gqzLAye6DdFagD2iEC3lwxwJlM+4Vtm52vWnbHmUI6qCn7zOB9ol
         z9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724865237; x=1725470037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcWjsx2GFVbGR3sFLDnaT6Mg3/3VJFqnuVHgVecU75g=;
        b=vJ0sFO3CVvJEyk1bASMaqFRuXmhry/5zDBvavo65HNwH5DerqE3FcPrNLHICjRHkI3
         mc/o41M5fOd9VDS/GoLz2RFKM4ydZOL6d1mmr8p1/grq8ZAzeWAVUBDFpH0aTBCt/v6G
         90tn4rFEVxPfU+GJfGvRrZYbNJNManNFPRCV8jq7EB78Z5ADvliiUj36XInVYCeE1mz/
         M9V2IGA8Vl8UdzteGxhyQCepEin3OjVMIfi+KWfC5F0o7stcle44e/thNQ6KP4vG01vj
         aa09vSXPg7L94cnRXSzWBQ0EwuylXspACpQLlOAjQN+khsnmwa73j6n/yp3/bto+T+lO
         lMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvc0yd5Z0KyuZoCylo2v9hP3AWL+YV0wJeDqjBibdoAYbtDAqv2zuhE7vnYuiF1xNu1dQwR6t9cLsiaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIp5pNLxDBlhyHRzbgcl+hvt+JC3Bn8joYvolwEcUKPdLFUQSC
	C6S/KQyefQPVDAW1q4fxS1JMLkLxNMcuMIMfJZh/BWWQ1ry8Buizp8iw78OHPDhErbrMUsZuxFN
	w
X-Google-Smtp-Source: AGHT+IG95WpJ3Jo/yJiFE1+k5pgv7fknE0kbuwHFJ+rJt/S10BTiSVq+7xHMaRQYqpPuPYgiaBY1xg==
X-Received: by 2002:aa7:88c5:0:b0:70d:3777:da8b with SMTP id d2e1a72fcca58-715dfc43e15mr166538b3a.25.1724865237485;
        Wed, 28 Aug 2024 10:13:57 -0700 (PDT)
Received: from [192.168.1.74] (c-73-42-218-101.hsd1.wa.comcast.net. [73.42.218.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e2c83sm10342909b3a.133.2024.08.28.10.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 10:13:57 -0700 (PDT)
Message-ID: <526b1130-afec-4c75-8d86-74c5b7e272fe@rivosinc.com>
Date: Wed, 28 Aug 2024 10:13:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] drivers: perf: Fix smp_processor_id() use in
 preemptible code
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nam Cao <namcao@linutronix.de>
References: <20240826165210.124696-1-alexghiti@rivosinc.com>
 <20240827125335.GD4772@willie-the-truck>
 <CAHVXubiwHe+5nD0kftRwnNdqAhP1ofSoaUzk4vhDKPrYXVz88g@mail.gmail.com>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <CAHVXubiwHe+5nD0kftRwnNdqAhP1ofSoaUzk4vhDKPrYXVz88g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_101359_364748_B483E00A 
X-CRM114-Status: GOOD (  25.26  )
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

T24gOC8yOC8yNCA1OjM2IEFNLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gSGkgV2lsbCwKPiAK
PiBPbiBUdWUsIEF1ZyAyNywgMjAyNCBhdCAyOjUz4oCvUE0gV2lsbCBEZWFjb24gPHdpbGxAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDA2OjUyOjEwUE0g
KzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+IEFzIHJlcG9ydGVkIGluIFsxXSwgdGhl
IHVzZSBvZiBzbXBfcHJvY2Vzc29yX2lkKCkgaW4KPj4+IHBtdV9zYmlfZGV2aWNlX3Byb2JlKCkg
bXVzdCBiZSBwcm90ZWN0ZWQgYnkgZGlzYWJsaW5nIHRoZSBwcmVlbXB0aW9uLCBzbwo+Pj4gc2lt
cGxlIHVzZSBnZXRfY3B1KCkvcHV0X2NwdSgpIGluc3RlYWQuCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6
IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgo+Pj4gQ2xvc2VzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDgyMDA3NDkyNS5SZU1LVVBQM0BsaW51dHJvbml4
LmRlLyBbMV0KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwg
NyArKysrKystCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBi
L2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPj4+IGluZGV4IDMxYTE3YTU2ZWIzYi4uMjVi
MWI2OTliM2UyIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+
Pj4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+Pj4gQEAgLTEzNzMsMTEgKzEz
NzMsMTUgQEAgc3RhdGljIGludCBwbXVfc2JpX2RldmljZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+Pj4KPj4+ICAgICAgICAvKiBTQkkgUE1VIFNuYXBzcGhvdCBpcyBvbmx5
IGF2YWlsYWJsZSBpbiBTQkkgdjIuMCAqLwo+Pj4gICAgICAgIGlmIChzYmlfdjJfYXZhaWxhYmxl
KSB7Cj4+PiArICAgICAgICAgICAgIGludCBjcHU7Cj4+PiArCj4+PiAgICAgICAgICAgICAgICBy
ZXQgPSBwbXVfc2JpX3NuYXBzaG90X2FsbG9jKHBtdSk7Cj4+PiAgICAgICAgICAgICAgICBpZiAo
cmV0KQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF91bnJlZ2lzdGVyOwo+Pj4K
Pj4+IC0gICAgICAgICAgICAgcmV0ID0gcG11X3NiaV9zbmFwc2hvdF9zZXR1cChwbXUsIHNtcF9w
cm9jZXNzb3JfaWQoKSk7Cj4+PiArICAgICAgICAgICAgIGNwdSA9IGdldF9jcHUoKTsKPj4+ICsK
Pj4+ICsgICAgICAgICAgICAgcmV0ID0gcG11X3NiaV9zbmFwc2hvdF9zZXR1cChwbXUsIGNwdSk7
Cj4+PiAgICAgICAgICAgICAgICBpZiAocmV0KSB7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAg
IC8qIFNuYXBzaG90IGlzIGFuIG9wdGlvbmFsIGZlYXR1cmUuIENvbnRpbnVlIGlmIG5vdCBhdmFp
bGFibGUgKi8KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgcG11X3NiaV9zbmFwc2hvdF9mcmVl
KHBtdSk7Cj4+PiBAQCAtMTM5MSw2ICsxMzk1LDcgQEAgc3RhdGljIGludCBwbXVfc2JpX2Rldmlj
ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgKi8KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgc3RhdGljX2JyYW5jaF9lbmFi
bGUoJnNiaV9wbXVfc25hcHNob3RfYXZhaWxhYmxlKTsKPj4+ICAgICAgICAgICAgICAgIH0KPj4+
ICsgICAgICAgICAgICAgcHV0X2NwdSgpOwo+Pgo+PiBBcmUgeW91IHN1cmUgaXQncyBzYWZlIHRv
IGVuYWJsZSB0aGUgc3RhdGljIGtleSB3aXRoIHByZWVtcHRpb24gZGlzYWJsZWQ/Cj4+IEkgdGhv
dWdodCB0aGF0IGNvdWxkIGJsb2NrIG9uIGEgbXV0ZXguCj4gCgpUaGFua3MgV2lsbCBmb3IgcG9p
bnRpbmcgdGhhdCBvdXQuCgo+IFllcCwgaXQgc2VlbXMgeW91J3JlIHJpZ2h0LCB0aGFua3MgZm9y
IGp1bXBpbmcgaW4uCj4gCj4gSSdtIGRpc2N1c3Npbmcgd2l0aCBBdGlzaCBob3cgdG8gZml4IHRo
YXQgZGlmZmVyZW50bHksIEknbGwgYmUgYmFjawo+IHdpdGggYW5vdGhlciB2ZXJzaW9uIHZlcnkg
c29vbi4KPiAKCkxvb2tpbmcgYXQgdGhlIGRyaXZlciBjb3JlIGZyYW1ld29yayBjb2RlLCBJIGFt
IHdvbmRlcmluZyBpZiBhIHByb2JlIApmdW5jdGlvbiBjYW4gYmUgcHJlZW1wdGVkIHRvIHJ1biBv
biBhIGRpZmZlcmVudCBjcHUuIElmIGl0IGNhbiBvbmx5IGJlIApwcmVlbXB0ZWQgYnkgaGlnaGVy
IHByaW9yaXR5IGtlcm5lbCB0aHJlYWRzIG9yIGludGVycnVwdHMgYnV0IGlzIApndWFyYW50ZWVk
IHRvIHJ1biBvbiB0aGUgc2FtZSBjcHUgYWdhaW4sIHdlIGNhbiBqdXN0IHVzZSB0aGUgCnJhd19z
bXBfcHJvY2Vzc29yX2lkLgoKSG93ZXZlciwgaWYgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIHRoZW4g
d2UgY2FuIGp1c3QgaW52b2tlIApnZXRfY3B1L3B1dF9jcHUgYXJvdW5kIHBtdV9zYmlfc25hcHNo
b3Rfc2V0dXAuCgo+IFRoYW5rcyBhZ2FpbiwKPiAKPiBBbGV4Cj4gCj4+Cj4+IFdpbGwKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
