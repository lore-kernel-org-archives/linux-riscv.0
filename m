Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A5EC0219B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 17:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZ/Yq7IT/2xL1/qrlN60w9vYTNa70jFOwDAPRXpNLQw=; b=SUonzJuMjGNnTq
	dGQV0c4c+/mjyNSjJwvv4jgEOaMfYl7bci5M7+aUd6zvAaU4Lhqal77eelmb3ky24dudQbkGFQUZk
	PxsYYlG/EOK9T03wAL13QZjxPCFrChgOAg7bWUmUjDSwniuTAv6G/4YWM/rjluU14fMy/6zRuV7tq
	duJD3lVgpn6QrDlcaCdAVfTkUWGs0V8sqeQe/iIDCxc17OD920+zUiSYZ/G1UxWaa4VNyb3oCrD/P
	i7yzZInLDtT/OFiEd5dYOUsR2xVuZBADjjp5c43qVxDZt7vcEg+LuiYiYdCC/qnLX2381m6+rFPzB
	QcwgNQq17GlsVSZda2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSQG-0000000AXqK-3XO0;
	Fri, 07 Feb 2025 17:45:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSHI-0000000AVx7-3Yma
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 17:36:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436202dd730so16338185e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 09:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738949791; x=1739554591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdGyH2E/lzVgHpl45+X40ixl6XWf7SNcyX4xVKMs5qs=;
        b=QUC2DJokSTyuyDbv4E3z7LeFEtukKoyKvAm1ZPyJnf1Rdl69CZrzsZBoqYceiHOUGJ
         JzuHW9KgQN+eQ74tVpgVBwuYVUG+1dDK33SKo2crt8qn6VD2ObpY/sC+DNWxFKClDJGJ
         cRXdTSOZz8iWELkRbHh4JKMMJ1EKVx1ZyMSkEH0ppdQveCalQjEEdw+MMIGv0zMzHpV1
         vzYuNsTPi/oDwb5PNEJJmVjZptDQriQvM3JHuBZEfxKUDUrLQ4aLMiD7vdPLqdFB1Z5q
         VLPn1d0uMLDAMrQWdhSFLuOI2Wj/UAI1KH5jvtfaSVw3Hn1VbDkhNyDJgipTgPeY33KN
         kjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949791; x=1739554591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdGyH2E/lzVgHpl45+X40ixl6XWf7SNcyX4xVKMs5qs=;
        b=XalhEapHOQp5XWOHXPdGfQeDWPqv/gU2BMrfsck6PGa3LvqiU2mkcFJxGKEtkF7Yyv
         NqJ/3hdbHlO2IeU5a/m2BmB5XEMJfiqTnwNLhhc1j63iUXjOzgYhMNLS1t77lm4pWJK5
         BE1CqIZkOFTLUszHiUHQdAzJ5I6X33iCT6qgqgOp42nsyOliAtm4yXCuqKWZjlTva3zP
         l44IKkAzYQMlcA/S8cvYmSGoWTdTRfsJnmxhXj218No6Z39oIMPSZvPlFgxz+9VbaccX
         rq1iNF9tQyNs9BUBfuy9IsM4Vd/eOZFfElgLwH4mrYq8NKY6y4D06GHO2XRzxWL7mZU3
         a7pg==
X-Forwarded-Encrypted: i=1; AJvYcCXaO+04UZguC1bvUlNDgvBPtd7nosriYsdOkEp8Pj2gqW0z9BrkrvKaNFrDawwU8qQAazcnNtVFGWAuDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlZu6K6OgnZZkNLEydsOTeBSIXxUaf5v6SQLGUMmQMMjq3KU2H
	oxR43kdlAorTRs5//7TIDFNloTXdplTZ+ZZJIHPdJ5ojY8GQArXr9/c2zY7pG7I=
X-Gm-Gg: ASbGncvo+T/+/QzaDiKnM0V2zeuLnyjW8oWn6ViptCmqEYtUMCIsBedQl8BM3J1Q/OC
	iVAQ+ziboPlwiAaEKoEtVYYhzpHDZHINlbLbd7FBXEvigMqdnGdYD45hMQEz3VctNYIgJ9rCR+W
	/hId+0Fmjckws+tdAf+XR32yxdb8oEpdD3cKX9pdPcswTmdn+6trJ26ctPUEkc+ZFmPljXN0EU/
	Mo4V/5ayud2CG7Rzqa3uMOF7f3xpGdWdNutA4Ma+DVAjUPBbEoCMhXnJ/pH7ACIY9zdwhIz8ctD
	clemd9AFOJWWZJuu3o2i9RD+r0peWQ1y6xL298/A83LoN4p6DjTWchV8t22o
X-Google-Smtp-Source: AGHT+IHbBPJuhBLqD2SYb4O4hhJVyROZRDiyBlna50+qnrh0+hL0DpVP0IyiE7EUFVMyiXckoCu9TQ==
X-Received: by 2002:a05:600c:3ba3:b0:434:f609:1afa with SMTP id 5b1f17b1804b1-43924972d28mr34925535e9.4.1738949790180;
        Fri, 07 Feb 2025 09:36:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd0d3120fsm651772f8f.70.2025.02.07.09.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:36:29 -0800 (PST)
Message-ID: <00cbde9c-39b4-4445-98af-70dfd1fbd62a@rivosinc.com>
Date: Fri, 7 Feb 2025 18:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] riscv: Fix set up of vector cpu hotplug callback
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-17-ajones@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207161939.46139-17-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_093632_888731_6907A0C1 
X-CRM114-Status: GOOD (  18.25  )
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

CgpPbiAwNy8wMi8yMDI1IDE3OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gV2hldGhlciBvciBu
b3Qgd2UgaGF2ZSBSSVNDVl9QUk9CRV9WRUNUT1JfVU5BTElHTkVEX0FDQ0VTUyB3ZSBuZWVkIHRv
Cj4gc2V0IHVwIGEgY3B1IGhvdHBsdWcgY2FsbGJhY2sgdG8gY2hlY2sgaWYgd2UgaGF2ZSB2ZWN0
b3IgYXQgYWxsLAo+IHNpbmNlLCB3aGVuIHdlIGRvbid0IGhhdmUgdmVjdG9yLCB3ZSBuZWVkIHRv
IHNldAo+IHZlY3Rvcl9taXNhbGlnbmVkX2FjY2VzcyB0byB1bnN1cHBvcnRlZCByYXRoZXIgdGhh
biBsZWF2ZSBpdCB0aGUKPiBkZWZhdWx0IG9mIHVua25vd24uCj4gCj4gRml4ZXM6IGU3YzlkNjZl
MzEzYiAoIlJJU0MtVjogUmVwb3J0IHZlY3RvciB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIGh3cHJv
YmUiKQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8
IDMxICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRf
YWNjZXNzX3NwZWVkLmMKPiBpbmRleCBjOWQzMjM3NjQ5YmIuLmQ5ZDRjYTFmYWRjNyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKPiBAQCAtMzU2LDYg
KzM1NiwyMCBAQCBzdGF0aWMgdm9pZCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2VzcyhzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51cwo+ICAJcGVyX2NwdSh2ZWN0b3JfbWlz
YWxpZ25lZF9hY2Nlc3MsIGNwdSkgPSBzcGVlZDsKPiAgfQo+ICAKPiArLyogTWVhc3VyZSB1bmFs
aWduZWQgYWNjZXNzIHNwZWVkIG9uIGFsbCBDUFVzIHByZXNlbnQgYXQgYm9vdCBpbiBwYXJhbGxl
bC4gKi8KPiArc3RhdGljIGludCBfX2luaXQgdmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWRfYWxsX2NwdXModm9pZCAqdW51c2VkIF9fYWx3YXlzX3VudXNlZCkKPiArewo+ICsJc2NoZWR1
bGVfb25fZWFjaF9jcHUoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3MpOwpIZXkgQW5kcmV3
LAoKV2hpbGUgYXQgaXQsIGNvdWxkIHlvdSBhZGQgYSBjb21tZW50IHN0YXRpbmcgdGhhdCBzY2hl
ZHVsZV9vbl9jcHUoKQood2hpbGUgZG9jdW1lbnRlZCBhcyByZWFsbHkgc2xvdykgaXMgdXNlZCBk
dWUgdG8ga2VybmVsX3ZlY3Rvcl9iZWdpbigpCm5lZWRpbmcgaW50ZXJydXB0cyB0byBiZSBlbmFi
bGVkID8gSSBzdHVtYmxlZCB1cG9uIHRoYXQgd2hpbGUgcmV3b3JraW5nCm1pc2FsaWduZWQuCgpU
aGFua3MsCgpDbMOpbWVudAoKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsjZWxzZSAvKiBDT05G
SUdfUklTQ1ZfUFJPQkVfVkVDVE9SX1VOQUxJR05FRF9BQ0NFU1MgKi8KPiArc3RhdGljIGludCBf
X2luaXQgdmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9pZCAqdW51
c2VkIF9fYWx3YXlzX3VudXNlZCkKPiArewo+ICsJcmV0dXJuIDA7Cj4gK30KPiArI2VuZGlmCj4g
Kwo+ICBzdGF0aWMgaW50IHJpc2N2X29ubGluZV9jcHVfdmVjKHVuc2lnbmVkIGludCBjcHUpCj4g
IHsKPiAgCWlmICghaGFzX3ZlY3RvcigpKSB7Cj4gQEAgLTM2MywyNyArMzc3LDE2IEBAIHN0YXRp
YyBpbnQgcmlzY3Zfb25saW5lX2NwdV92ZWModW5zaWduZWQgaW50IGNwdSkKPiAgCQlyZXR1cm4g
MDsKPiAgCX0KPiAgCj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfUFJPQkVfVkVDVE9SX1VOQUxJR05F
RF9BQ0NFU1MKPiAgCWlmIChwZXJfY3B1KHZlY3Rvcl9taXNhbGlnbmVkX2FjY2VzcywgY3B1KSAh
PSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1VOS05PV04pCj4gIAkJcmV0dXJuIDA7
Cj4gIAo+ICAJY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoTlVMTCk7Cj4g
IAljaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2VzcyhOVUxMKTsKPiAtCXJldHVybiAwOwo+IC19
Cj4gLQo+IC0vKiBNZWFzdXJlIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgb24gYWxsIENQVXMgcHJl
c2VudCBhdCBib290IGluIHBhcmFsbGVsLiAqLwo+IC1zdGF0aWMgaW50IF9faW5pdCB2ZWNfY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2b2lkICp1bnVzZWQgX19hbHdheXNf
dW51c2VkKQo+IC17Cj4gLQlzY2hlZHVsZV9vbl9lYWNoX2NwdShjaGVja192ZWN0b3JfdW5hbGln
bmVkX2FjY2Vzcyk7Cj4gKyNlbmRpZgo+ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gLSNlbHNlIC8q
IENPTkZJR19SSVNDVl9QUk9CRV9WRUNUT1JfVU5BTElHTkVEX0FDQ0VTUyAqLwo+IC1zdGF0aWMg
aW50IF9faW5pdCB2ZWNfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2b2lk
ICp1bnVzZWQgX19hbHdheXNfdW51c2VkKQo+IC17Cj4gLQlyZXR1cm4gMDsKPiAtfQo+IC0jZW5k
aWYKPiAgCj4gIHN0YXRpYyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2Nw
dXModm9pZCkKPiAgewo+IEBAIC00MDksMTAgKzQxMiw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGNo
ZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXModm9pZCkKPiAgCWNwdWhwX3NldHVwX3N0YXRl
X25vY2FsbHMoQ1BVSFBfQVBfT05MSU5FX0RZTiwgInJpc2N2Om9ubGluZSIsCj4gIAkJCQkgIHJp
c2N2X29ubGluZV9jcHUsIHJpc2N2X29mZmxpbmVfY3B1KTsKPiAgI2VuZGlmCj4gLSNpZmRlZiBD
T05GSUdfUklTQ1ZfUFJPQkVfVkVDVE9SX1VOQUxJR05FRF9BQ0NFU1MKPiAgCWNwdWhwX3NldHVw
X3N0YXRlX25vY2FsbHMoQ1BVSFBfQVBfT05MSU5FX0RZTiwgInJpc2N2Om9ubGluZSIsCj4gIAkJ
CQkgIHJpc2N2X29ubGluZV9jcHVfdmVjLCBOVUxMKTsKPiAtI2VuZGlmCj4gIAo+ICAJcmV0dXJu
IDA7Cj4gIH0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
