Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3CEC282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hl281KRLBU2tWZzMby0HWeUgWlCmx8m4wSMqYw+R9+k=; b=iNkuITX++U5jD0
	hle60opHbkIC9vLklRzl0KlHBPbIjIvstO124ihD5tD2oOHm7zwvw07f4maidqpvp6yB9y5jRfaNO
	a0GXC+lJyjeo0LZL07gr91clbyXZxBulyhifB4i61W+dAKJklKcoJqG5wzfBdH9UgJTQLATC2LBb6
	bx4yF/ziAFO8hv1D0bCqn2lq3S0zqc8OHNGcKETrHpQG3BsbvDKnPYSSq7Tx/tWtVrDKCVecASz9y
	7fE0XY7f7wolzck7UkGmuzX1aBYRqIQRQ8S/6ao/nVf9zafGmBiDRCCvxzqpcF6fl1+J9P4qsEtsH
	qcxkLAN01FXcMeZ9Y1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Xb-0000000E42I-3qKz;
	Fri, 14 Mar 2025 11:49:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3XZ-0000000E41S-1Qbc
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:49:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso13455775e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741952964; x=1742557764; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MnZSC151vp8qwLt12oXOY4820tmPnxSjOaRjWV8Cing=;
        b=K/k+Ko8ye5pbRYfWEQA1GeNqR1p7auP2V1g0N8uUYDJzcRc9XE5fgvvOioXa+KqXab
         CA+vO0stf7HNn3Q/8LjLGG+ogLbWLKYps5CaRqZ8BKNUxzga7dERqs0vgdLgIoX1/hWO
         bZOsRX20BykFYtYRmV65z/25+IbLgKdPzLDRVcMW0POg1Lm0kOx1v4imDALqmH2rwUiz
         jw3YpShvrRFfRK/sOBRmp4J55VDpVO+FWeXOZuOGZtdE1HS4UXJH3gynR/WeZ6mfKY1L
         i/0NB7XhjN9vDhxi9DeRoKCE69j+v812b1QlmeMjAr7xFdmTIWG8hJ5UZgPDqZ03Lh+A
         vViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741952964; x=1742557764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnZSC151vp8qwLt12oXOY4820tmPnxSjOaRjWV8Cing=;
        b=wH2cFCuhQf1ba+5mU3WSu8RUkBeDkjzchXeqLwIIw/A3cnTbZZeSAz7V3x0Fl85m+h
         zn6+rZIisMrpapDeqsjEogNF71QS3w5YTRLKLe/8p6W4fKEwmSm91L2Bhs+g7zYkSW9V
         +Bs24sbBqxUUqqMaBmOnFCifmpLw/hHfjzAtHP8+4IE3VcekSd7gzagYvYKNq+XVMh+P
         dhR4LQHGtaOWS7NEfPKXq+q2hCe8yiiXSwsXQdeJW9kav+3yf41NTS9zbhChEdzUKY+i
         eF6J5WZPLFcIQ6w/QL6qtewVtBzwUq/aci8dWgtfWhXZwpV21nnusJ/GrvOxgdTfPQt+
         g5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Y/O6u+NXVB3njZlOaz6V+qMpsDJf600YfEhIhmx3NnHASaX3QPhNav8fK/tLgKvB+O01ikiDWZaXnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzuwoLaws6TcNEbkK9zvoFUQVNI3d+SAQ5xN7RMXIcseq8tZaY
	pLkuAHdxIWdSjTInbq5LuIMEHlk07eVTNhTLkETWlHrOtPoyZgmK5bNvrcRaiC4=
X-Gm-Gg: ASbGncuDiYh2cKlbEpPL3H/ldPK78yR3nrb3t38gA/JwDCxmcyMIGigv578MJ+JyOeu
	luyVFjQ6aDOAedNUW9+7hCk3/2cvcd0hovMBLaCN/F9lmW/XHgg4ybMHvWVof3pDALZTRmn5XQy
	iMz13Vit3FTwwLQPxA/QBt4/4wwFP04JqG2zcKkL/rr6O9gAUJZU1VBcC+SjcE50E1a16CYzbnj
	AS567UYVcjhz0sl68kEy1g+7IYtgxVWvikrE6ZCnpBQxbDR2ym+IGZG0BYCLww0Go/LU2u0hd2c
	znbOkBOPF4ANauZ+YrSlGaNM+P9QIvsUIs70Pip5tF8R4WR+EkMAmnhfAmP3jugFejFPnKexuZ1
	gQaAKD3YAxAhdwQ==
X-Google-Smtp-Source: AGHT+IFooexJGdlE71HjFHejmIN5yPGDOB48jansbCISOaAARNem81Cu631A445Q7st6CHhGvoNF9A==
X-Received: by 2002:a05:600c:5105:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43d225b23e7mr10331325e9.13.1741952963792;
        Fri, 14 Mar 2025 04:49:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb92csm5408510f8f.91.2025.03.14.04.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:49:23 -0700 (PDT)
Message-ID: <7073c4de-4735-429b-b520-f18c33ecaab7@rivosinc.com>
Date: Fri, 14 Mar 2025 12:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/17] riscv: misaligned: add a function to check
 misalign trap delegability
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-9-cleger@rivosinc.com>
 <20250313-4bea400c5770a5a5d3d70b38@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-4bea400c5770a5a5d3d70b38@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_044925_644813_2F99F001 
X-CRM114-Status: GOOD (  16.21  )
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

CgpPbiAxMy8wMy8yMDI1IDE0OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MTVQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBD
aGVja2luZyBmb3IgdGhlIGRlbGVnYWJpbGl0eSBvZiB0aGUgbWlzYWxpZ25lZCBhY2Nlc3MgdHJh
cCBpcyBuZWVkZWQKPj4gZm9yIHRoZSBLVk0gRldGVCBleHRlbnNpb24gaW1wbGVtZW50YXRpb24u
IEFkZCBhIGZ1bmN0aW9uIHRvIGdldCB0aGUKPj4gZGVsZWdhYmlsaXR5IG9mIHRoZSBtaXNhbGln
bmVkIHRyYXAgZXhjZXB0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
cHVmZWF0dXJlLmggIHwgIDUgKysrKysKPj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYyB8IDE3ICsrKysrKysrKysrKysrKy0tCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZS5oCj4+IGluZGV4IGFkN2QyNjc4OGU2YS4uOGI5N2NiYTk5ZmMzIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+PiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+PiBAQCAtNjksMTIgKzY5LDE3IEBAIGludCBjcHVf
b25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KTsKPj4gICNpZiBk
ZWZpbmVkKENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCkKPj4gIHZvaWQgdW5hbGlnbmVk
X2VtdWxhdGlvbl9maW5pc2godm9pZCk7Cj4+ICBib29sIHVuYWxpZ25lZF9jdGxfYXZhaWxhYmxl
KHZvaWQpOwo+PiArYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lkKTsKPj4g
IERFQ0xBUkVfUEVSX0NQVShsb25nLCBtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCk7Cj4+ICAjZWxz
ZQo+PiAgc3RhdGljIGlubGluZSBib29sIHVuYWxpZ25lZF9jdGxfYXZhaWxhYmxlKHZvaWQpCj4+
ICB7Cj4+ICAJcmV0dXJuIGZhbHNlOwo+PiAgfQo+PiArc3RhdGljIGlubGluZSBib29sIG1pc2Fs
aWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKHZvaWQpCj4+ICt7Cj4+ICsJcmV0dXJuIGZhbHNlOwo+
PiArfQo+PiAgI2VuZGlmCj4+ICAKPj4gIGJvb2wgY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nl
c3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCk7Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGln
bmVkLmMKPj4gaW5kZXggZGIzMTk2NmE4MzRlLi5hNjdhNmU3MDlhMDYgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+PiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4gQEAgLTcxNiwxMCArNzE2LDEwIEBAIHN0YXRp
YyBpbnQgY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHVuc2lnbmVk
IGludCBjcHUpCj4+ICB9Cj4+ICAjZW5kaWYKPj4gIAo+PiAtI2lmZGVmIENPTkZJR19SSVNDVl9T
QkkKPj4gLQo+PiAgc3RhdGljIGJvb2wgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQ7Cj4+ICAK
Pj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfU0JJCj4+ICsKPj4gIHN0YXRpYyBpbnQgY3B1X29ubGlu
ZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBjcHUpCj4+ICB7Cj4+ICAJaWYgKHNi
aV9md2Z0X3NldChTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywgMSwgMCkgJiYKPj4gQEAg
LTc2MSw2ICs3NjEsNyBAQCBzdGF0aWMgaW50IGNwdV9vbmxpbmVfc2JpX3VuYWxpZ25lZF9zZXR1
cCh1bnNpZ25lZCBpbnQgY3B1IF9fYWx3YXlzX3VudXNlZCkKPj4gIHsKPj4gIAlyZXR1cm4gMDsK
Pj4gIH0KPj4gKwo+PiAgI2VuZGlmCj4+ICAKPj4gIGludCBjcHVfb25saW5lX3VuYWxpZ25lZF9h
Y2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQo+PiBAQCAtNzczLDMgKzc3NCwxNSBAQCBpbnQg
Y3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQgaW50IGNwdSkKPj4gIAo+
PiAgCXJldHVybiBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoY3B1
KTsKPj4gIH0KPj4gKwo+PiArYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lk
KQo+PiArewo+PiArCS8qCj4+ICsJICogRWl0aGVyIHdlIHN1Y2Nlc3NmdWxseSByZXF1ZXN0ZWQg
bWlzYWxpZ25lZCB0cmFwcyBkZWxlZ2F0aW9uIGZvciBhbGwKPj4gKwkgKiBDUFVTIG9yIHRoZSBT
QkkgZG9lcyBub3QgaW1wbGVtZW50ZWQgRldGVCBleHRlbnNpb24gYnV0IGRlbGVnYXRlZCB0aGUK
Pj4gKwkgKiBleGNlcHRpb24gYnkgZGVmYXVsdC4KPj4gKwkgKi8KPj4gKwlyZXR1cm4gbWlzYWxp
Z25lZF90cmFwc19kZWxlZ2F0ZWQgfHwKPj4gKwkgICAgICAgYWxsX2NwdXNfdW5hbGlnbmVkX3Nj
YWxhcl9hY2Nlc3NfZW11bGF0ZWQoKTsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0xfR1BMKG1pc2Fs
aWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKTsKPj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxl
Cj4gCj4gQ2hlY2sgeW91ciBlZGl0b3Igc2V0dGluZ3MuCgpJIGp1c3QgZW5hYmxlZCBFZGl0b3JD
b25maWcgYXMgd2VsbCBhcyBjbGFuZy1mb3JtYXQgc28gaG9wZWZ1bGx5IHRoYXQKd2lsbCBiZSBv
ayBpbiB0aGUgbmV4dCBzZXJpZXMuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPj4gLS0gCj4+IDIu
NDcuMgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8u
Y29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
