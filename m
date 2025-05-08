Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39158C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cw69rI3zh6zlSysRbdToFndbskHmIevzRv0bQlPqwlg=; b=tCiozRRedw5hRc
	gjdPxZS9kIStvMOT0OTr05jwh6EkEUP9Ph4r/JXL+PDEgADIF/tycZgGj+Q+1ELva0tqSaa+R8H7+
	pT9lwKzBR+7TaRUuwQPfbfdV6FsdSzCLftvwV2UXfa/TEz7WfW5/SGvscdOeeDVlodE+d5/btWKig
	rl28fVbT6Q13gqU32yD5ukQE0NNJ5TtuHwLKtbmkR5G9NOIxU7NQARv9P2JakNXXbI2v+7cqHJYiw
	x0/63Nsa+Jx1SX4m6dC9d8zEUYcQIE/vNqfuhCtXjXynJ5BwVZir2ibCDdOcNAjAMWH9+3SyCfgJc
	dWhteh6K4Qbb4mSz/qMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzr9-00000000XPw-2X3m;
	Thu, 08 May 2025 11:56:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzpx-00000000XFf-1fAD
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 11:54:50 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22c33e4fdb8so7630425ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 04:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746705288; x=1747310088; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQ5nx7BEtPQhnhB8LNMmTDa+6EsEVgHuuZJiFmNN9Ms=;
        b=V8JeshDsqqzcwYSGkcyszOSO1r0rXXxCIvKO2L9niSWZLvbdf4vsGrjfD5TD9QRegq
         2cDWYujEcEPs++FiILZhR10Is1PP1zdO4kDdgpGIhESNcaKGxtPk4ZnbTXelM4gY6wgc
         cKXx1xdoSu/ALB0YYof3hO8VrmJCkO22njCo/PZ6EqANvV3DXIYV32kO+ZQD+64HPFZR
         FU9tJlHZaUz0TWovIzp09nOkQmsU2xi1Lg/71NZzA7ahJn3GF3lSjKIChisFge1Gr3CV
         N7mivR5vXCPFrQOfasvW56bDO5wlvWat4fPrHcGsYyXT37Sn0Mm2SGM96qZQ/n5XFF1p
         ttyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746705288; x=1747310088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ5nx7BEtPQhnhB8LNMmTDa+6EsEVgHuuZJiFmNN9Ms=;
        b=oN818Wt7T0X26Dg+2L4MGa5s9ExAKd76ixSUYL6JIONjIhuRuAzit/VufS+EQ18253
         BwAEwnWWu9rSqNb1lp0n07P/1MZgsxw41da/AuENTYnL8UcQD0R9jqXGiecOoa884eiM
         Gebe3t3ChUR6QTr+zQST/Qc+pxP7vmmSQvQdtqnMajlMUULlf8V0Jdl2D1qQcSwm1l4S
         BnMjOavXyZkvP/UGasLVkuWX5sh/U5OojtZmI/+3QdIqPmjb2sneX4bE2Gcz/aegycNx
         PntfN9r9f1CyLz0N26y4wocwjpjx4MiTAJ4U3NF2IeQfpHu46VPC49PhWaKB1qNrh8sa
         lW8A==
X-Gm-Message-State: AOJu0YzutDYQqIifgJuIAExEfZ9oBOifRLn7Tk9yS79rys+6skkgv+X+
	OciMET+yJoVEKMRAjQplmb8YyYHxBk/NckuH5Bcu13fp8BEjom3wl2kmh6q/Z6pVYudA05Ril/Y
	b
X-Gm-Gg: ASbGncs0pmfvhcFAVyjUz3Ykv7y0uCYOT2nJxB0GQM74u+BceiGpYkD/cCNHmnWLuPB
	J6r36WOR4HlCNjBx1ksazs4oBwrUdJS+TZ/KUzZoCZyBLIzKdawIwtG+8dmWzmqXswAgD1EsGfu
	GQm+CnvQHXhpeAAwsgMVrvquy3Y3PZHJsKKUDga0IGpsigzWHYmiCyINam19c94Nwn/9FZiQvet
	hFxdz93uRsroeokOG61jSlG8UqGsB1GefJrO/Yrprc5H4RsxgcLIkXZw1X+bxFHqZwo+BHe8cDD
	xa4cHUk1V/nEm/VjkABjMDFZ5K5W8Q2ylOmJcy+aUDv4txGxT9ipFA==
X-Google-Smtp-Source: AGHT+IHNkr+cYmPtqEDKPUm8A/UvsVB8Ee40tnr1fJFsnH5tHlLIOarW/VG1HJ4MVlRL7k8EI2tcYQ==
X-Received: by 2002:a17:903:22c9:b0:224:249f:9734 with SMTP id d9443c01a7336-22e85613e37mr50522725ad.4.1746705288109;
        Thu, 08 May 2025 04:54:48 -0700 (PDT)
Received: from [192.168.62.7] ([110.226.169.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e84956656sm14404295ad.79.2025.05.08.04.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:54:47 -0700 (PDT)
Message-ID: <57f163bb-1b4e-4f57-8f93-aee6ce1bd317@ventanamicro.com>
Date: Thu, 8 May 2025 17:24:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware
 break/watchpoints
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
 <20240222125059.13331-3-hchauhan@ventanamicro.com> <aBltPLLrvUNKR857@ghost>
 <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>
 <aBvRacm66QK_UHXF@ghost>
Content-Language: en-US
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
In-Reply-To: <aBvRacm66QK_UHXF@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_045449_440028_15668BE0 
X-CRM114-Status: GOOD (  27.27  )
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

T24gNS84LzI1IDAzOjAyLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMDcs
IDIwMjUgYXQgMDQ6NTg6NTZQTSArMDUzMCwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPj4gSGkg
Q2hhcmxpZSwKPj4KPj4gT24gNS82LzI1IDA3OjMwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+
PiBPbiBUaHUsIEZlYiAyMiwgMjAyNCBhdCAwNjoyMDo1OVBNICswNTMwLCBIaW1hbnNodSBDaGF1
aGFuIHdyb3RlOgo+Pj4+IFJJU0MtViBoYXJkd2FyZSBicmVha3BvaW50IGZyYW1ld29yayBpcyBi
dWlsdCBvbiB0b3Agb2YgcGVyZiBzdWJzeXN0ZW0gYW5kIHVzZXMKPj4+PiBTQkkgZGVidWcgdHJp
Z2dlciBleHRlbnNpb24gdG8gaW5zdGFsbC91bmluc3RhbGwvdXBkYXRlL2VuYWJsZS9kaXNhYmxl
IGhhcmR3YXJlCj4+Pj4gdHJpZ2dlcnMgYXMgc3BlY2lmaWVkIGluIFNkdHJpZyBJU0EgZXh0ZW5z
aW9uLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUgQ2hhdWhhbiA8aGNoYXVoYW5A
dmVudGFuYW1pY3JvLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBhcmNoL3Jpc2N2L0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCj4+Pj4gICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d19icmVha3BvaW50LmggfCAzMjcgKysrKysrKysrKysrCj4+Pj4gICAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rZGVidWcuaCAgICAgICAgfCAgIDMgKy0KPj4+PiAgICBhcmNoL3Jpc2N2L2tlcm5l
bC9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArCj4+Pj4gICAgYXJjaC9yaXNjdi9rZXJuZWwv
aHdfYnJlYWtwb2ludC5jICAgICAgfCA2NTkgKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+
ICAgIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgICAgICAgIHwgICA2ICsKPj4+PiAg
ICA2IGZpbGVzIGNoYW5nZWQsIDk5NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4g
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdfYnJlYWtwb2lu
dC5oCj4+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2h3X2JyZWFr
cG9pbnQuYwo+Pj4+Cj4+PiAuLi4KPj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2h3X2JyZWFrcG9pbnQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2h3X2JyZWFrcG9pbnQuYwo+
Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi43Nzg3MTIz
YzcxODAKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvaHdf
YnJlYWtwb2ludC5jCj4+Pj4gKwo+Pj4+ICt2b2lkIGNsZWFyX3B0cmFjZV9od19icmVha3BvaW50
KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKQo+Pj4+ICtzdGF0aWMgaW50IF9faW5pdCBhcmNoX2h3
X2JyZWFrcG9pbnRfaW5pdCh2b2lkKQo+Pj4+ICt7Cj4+Pj4gKwl1bnNpZ25lZCBpbnQgY3B1Owo+
Pj4+ICsJaW50IHJjID0gMDsKPj4+PiArCj4+Pj4gKwlmb3JfZWFjaF9wb3NzaWJsZV9jcHUoY3B1
KQo+Pj4+ICsJCXJhd19zcGluX2xvY2tfaW5pdCgmcGVyX2NwdShlY2FsbF9sb2NrLCBjcHUpKTsK
Pj4+PiArCj4+Pj4gKwlpZiAoIWRidHJfaW5pdCkKPj4+PiArCQlpbml0X3NiaV9kYnRyKCk7Cj4+
Pj4gKwo+Pj4+ICsJaWYgKGRidHJfdG90YWxfbnVtKSB7Cj4+Pj4gKwkJcHJfaW5mbygiJXM6IHRv
dGFsIG51bWJlciBvZiB0eXBlICVkIHRyaWdnZXJzOiAldVxuIiwKPj4+PiArCQkJX19mdW5jX18s
IGRidHJfdHlwZSwgZGJ0cl90b3RhbF9udW0pOwo+Pj4+ICsJfSBlbHNlIHsKPj4+PiArCQlwcl9p
bmZvKCIlczogTm8gaGFyZHdhcmUgdHJpZ2dlcnMgYXZhaWxhYmxlXG4iLCBfX2Z1bmNfXyk7Cj4+
Pj4gKwkJZ290byBvdXQ7Cj4+Pj4gKwl9Cj4+Pj4gKwo+Pj4+ICsJLyogQWxsb2NhdGUgcGVyLWNw
dSBzaGFyZWQgbWVtb3J5ICovCj4+Pj4gKwlzYmlfZGJ0cl9zaG1lbSA9IF9fYWxsb2NfcGVyY3B1
KHNpemVvZigqc2JpX2RidHJfc2htZW0pICogZGJ0cl90b3RhbF9udW0sCj4+Pj4gKwkJCQkJUEFH
RV9TSVpFKTsKPj4+PiArCj4+Pj4gKwlpZiAoIXNiaV9kYnRyX3NobWVtKSB7Cj4+Pj4gKwkJcHJf
d2FybigiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSBzaGFyZWQgbWVtb3J5LlxuIiwgX19mdW5jX18p
Owo+Pj4+ICsJCXJjID0gLUVOT01FTTsKPj4+PiArCQlnb3RvIG91dDsKPj4+PiArCX0KPj4+PiAr
Cj4+Pj4gKwkvKiBIb3RwbHVnIGhhbmRsZXIgdG8gcmVnaXN0ZXIvdW5yZWdpc3RlciBzaGFyZWQg
bWVtb3J5IHdpdGggU0JJICovCj4+Pj4gKwlyYyA9IGNwdWhwX3NldHVwX3N0YXRlKENQVUhQX0FQ
X09OTElORV9EWU4sCj4+PiBXaGVuIHVzaW5nIHRoaXMsIG9ubHkgaGFydCAwIGlzIGdldHRpbmcg
c2V0dXAuIEkgdGhpbmsgaW5zdGVhZCB3ZSB3YW50Cj4+PiB0aGUgZm9sbG93aW5nIHRvIGhhdmUg
YWxsIGhhcnRzIGdldCBzZXR1cDoKPj4+Cj4+PiAJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4+
PiAJCWFyY2hfc21wX3NldHVwX3NiaV9zaG1lbShjcHUpOwo+Pj4KPj4+IAkvKiBIb3RwbHVnIGhh
bmRsZXIgdG8gcmVnaXN0ZXIvdW5yZWdpc3RlciBzaGFyZWQgbWVtb3J5IHdpdGggU0JJICovCj4+
PiAJcmMgPSBjcHVocF9zZXR1cF9zdGF0ZV9ub2NhbGxzKENQVUhQX0FQX09OTElORV9EWU4sCj4+
IGNwdWhwX3NldHVwX3N0YXRlKCkgaW5zdGFsbCB0aGUgY2FsbGJhY2tzIGFuZCBpbnZva2UgdGhl
IEBzdGFydHVwIGNhbGxiYWNrCj4+IChpZiBub3QgTlVMTCkgZm9yIGFsbCBvbmxpbmUgQ1BVcy4g
U28gdGhlcmUgaXMgbm8gbmVlZCB0byBjYWxsCj4+ICJhcmNoX3NtcF9zZXR1cF9zYmlfc2htZW0i
IGZvciBlYWNoIENQVSBhbmQgdGhlbiBpbnN0YWxsIHRoZSBob3RwbHVnCj4+IGhhbmRsZXIuCj4g
VGhhdCdzIHdoYXQgSSB0aG91Z2h0IGFzIHdlbGwsIGJ1dCB3aGVuIHRlc3RpbmcgdGhhdCBpcyBu
b3Qgd2hhdCB3YXMKPiBoYXBwZW5pbmcuCgpJIHNlZSB0aGUgaW5pdGlhbGl6YXRpb24gaGFwcGVu
aW5nIG9uIGFsbCB0aGUgQ1BVcy4gSSBhbSB1c2luZyBPcGVuU0JJIApUb3Atb2YtbGluZS4KCkxp
bnV4IGtlcm5lbCBpcyBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS92ZW50YW5hbWljcm8vbGludXgu
Z2l0IFticmFuY2g6IApkZXYtdXBzdHJlYW1dCgpQYXJ0IG9mIGJvb3QgbG9nOgoKW8KgwqDCoCAw
LjI2NzI1MF0gYXJjaF9od19icmVha3BvaW50X2luaXQ6IHRvdGFsIG51bWJlciBvZiB0eXBlIDYg
dHJpZ2dlcnM6IDIKW8KgwqDCoCAwLjI2ODEwOF0gQ1BVIDA6IEhXIEJyZWFrcG9pbnQgc2hhcmVk
IG1lbW9yeSByZWdpc3RlcmVkLgpbwqDCoMKgIDAuMjY4ODM1XSBDUFUgMTogSFcgQnJlYWtwb2lu
dCBzaGFyZWQgbWVtb3J5IHJlZ2lzdGVyZWQuClvCoMKgwqAgMC4yNjk5MzJdIENQVSAyOiBIVyBC
cmVha3BvaW50IHNoYXJlZCBtZW1vcnkgcmVnaXN0ZXJlZC4KW8KgwqDCoCAwLjI3MDQ2OF0gQ1BV
IDM6IEhXIEJyZWFrcG9pbnQgc2hhcmVkIG1lbW9yeSByZWdpc3RlcmVkLgpbwqDCoMKgIDAuMjc2
NTU0XSBzc2U6IFNCSSBTU0UgZXh0ZW5zaW9uIGRldGVjdGVkClvCoMKgwqAgMC4zMDgxNzJdIEh1
Z2VUTEI6IGFsbG9jYXRpb24gdG9vayAwbXMgd2l0aCAKaHVnZXBhZ2VfYWxsb2NhdGlvbl90aHJl
YWRzPTEKW8KgwqDCoCAwLjMwOTY4Ml0gSHVnZVRMQjogcmVnaXN0ZXJlZCAyLjAwIE1pQiBwYWdl
IHNpemUsIHByZS1hbGxvY2F0ZWQgMCBwYWdlcwoKQ2FuIHlvdSBwbGVhc2Ugc2VuZCBtZSB5b3Vy
IGNvbmZpZyBhbmQgYm9vdGxvZz8KClJlZ2FyZHMKCkhpbWFuc2h1CgoKPj4gSWYgeW91IGFyZSBy
dW5uaW5nIHRoaXMgb24gUUVNVSwgY291bGQgeW91IHBsZWFzZSBzaGFyZSB0aGUgcWVtdSBjb21t
YW5kIHlvdQo+PiBhcmUgaW52b2tpbmc/IEkgd2lsbCB0ZXN0IGF0IG15IGVuZCBhbmQgdXBkYXRl
IHlvdS4KPiBUaGlzIGlzIG15IHFlbXUgY29tbWFuZDoKPgo+IHFlbXUtc3lzdGVtLXJpc2N2NjQg
LW5vZ3JhcGhpYyAtbSAxRyAtbWFjaGluZSB2aXJ0IC1zbXAgNCBcCj4gICAgICAta2VybmVsIGFy
Y2gvcmlzY3YvYm9vdC9JbWFnZSAtYmlvcyAvaG9tZS9jaGFybGllL29wZW5zYmkvYnVpbGQvcGxh
dGZvcm0vZ2VuZXJpYy9maXJtd2FyZS9md19keW5hbWljLmJpbiBcCj4gICAgICAtYXBwZW5kICJy
b290PS9kZXYvdmRhIHJ3IGVhcmx5Y29uIGNvbnNvbGU9dHR5UzAiIFwKPiAgICAgIC1kcml2ZSBm
aWxlPS9ob21lL2NoYXJsaWUvYnVpbGRyb290L291dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsZm9y
bWF0PXJhdyxpZD1oZDAsaWY9bm9uZSBcCj4gICAgICAtY3B1IHJ2NjQsemljb25kPXRydWUgXAo+
ICAgICAgLWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1oZDAgLWdkYiB0Y3A6OjEyMzQK
Pgo+IC0gQ2hhcmxpZQo+Cj4+IFJlZ2FyZHMKPj4KPj4gSGltYW5zaHUKPj4KPj4+Cj4+PiBIb3dl
dmVyLCBJIGFtIHRlc3RpbmcgYWdhaW5zdCB0aXAtb2YtdHJlZSBvcGVuc2JpIGFuZCBhbSBoaXR0
aW5nIGFuCj4+PiBpc3N1ZSBkdXJpbmcgdGhlIHNldHVwIG9uIGFsbCBoYXJ0czoKPj4+Cj4+PiBb
ICAgIDAuMjAyMzMyXSBhcmNoX3NtcF9zZXR1cF9zYmlfc2htZW06IEludmFsaWQgYWRkcmVzcyBw
YXJhbWV0ZXIgKDE4NDQ2NzQ0MDczNzA5NTUxNjExKQo+Pj4gWyAgICAwLjIwMjc5NF0gQ1BVIDA6
IEhXIEJyZWFrcG9pbnQgc2hhcmVkIG1lbW9yeSByZWdpc3RlcmVkLgo+Pj4KPj4+IEFkZGl0aW9u
YWxseSwgdGhpcyBzZWVtcyBsaWtlIGl0IHNob3VsZCBiZSBhIGZhdGFsIGVycm9yLCBidXQgaXQK
Pj4+IGNvbnRpbnVlcyBvbiB0byBwcmludCB0aGF0IHRoZSBzaGFyZWQgbWVtb3J5IGlzIHJlZ2lz
dGVyZWQgYmVjYXVzZSB0aGVyZQo+Pj4gaXMgbm8gY2hlY2sgYmVmb3JlIHByaW50aW5nIHRoaXMg
c2VlbWluZ2x5IHN1Y2Nlc3NmdWwgbWVzc2FnZS4KPj4+Cj4+PiBJIGtub3cgSSBhbSByZXZpdmlu
ZyBhbiBvbGQgdGhyZWFkLCBidXQgZG8geW91IGhhdmUgYW55IGluc2lnaHQgaW50bwo+Pj4gd2hh
dCBtaWdodCBiZSBoYXBwZW5pbmc/Cj4+Pgo+Pj4gLSBDaGFybGllCj4+Pgo+Pj4+ICsJCQkgICAg
ICAgInJpc2N2L2h3X2JyZWFrcG9pbnQ6cHJlcGFyZSIsCj4+Pj4gKwkJCSAgICAgICBhcmNoX3Nt
cF9zZXR1cF9zYmlfc2htZW0sCj4+Pj4gKwkJCSAgICAgICBhcmNoX3NtcF90ZWFyZG93bl9zYmlf
c2htZW0pOwo+Pj4+ICsKPj4+PiArCWlmIChyYyA8IDApIHsKPj4+PiArCQlwcl93YXJuKCIlczog
RmFpbGVkIHRvIHNldHVwIENQVSBob3RwbHVnIHN0YXRlXG4iLCBfX2Z1bmNfXyk7Cj4+Pj4gKwkJ
ZnJlZV9wZXJjcHUoc2JpX2RidHJfc2htZW0pOwo+Pj4+ICsJCXJldHVybiByYzsKPj4+PiArCX0K
Pj4+PiArIG91dDoKPj4+PiArCXJldHVybiByYzsKPj4+PiArfQo+Pj4+ICthcmNoX2luaXRjYWxs
KGFyY2hfaHdfYnJlYWtwb2ludF9pbml0KTsKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4+PiBpbmRleCBhMWI5
YmUzYzQzMzIuLjUzZTFkZmU1NzQ2YiAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+Pj4+IEBAIC0y
NzcsNiArMjc3LDEyIEBAIHZvaWQgaGFuZGxlX2JyZWFrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+
Pj4+ICAgIAlpZiAocHJvYmVfYnJlYWtwb2ludF9oYW5kbGVyKHJlZ3MpKQo+Pj4+ICAgIAkJcmV0
dXJuOwo+Pj4+ICsjaWZkZWYgQ09ORklHX0hBVkVfSFdfQlJFQUtQT0lOVAo+Pj4+ICsJaWYgKG5v
dGlmeV9kaWUoRElFX0RFQlVHLCAiRUJSRUFLIiwgcmVncywgMCwgcmVncy0+Y2F1c2UsIFNJR1RS
QVApCj4+Pj4gKwkgICAgPT0gTk9USUZZX1NUT1ApCj4+Pj4gKwkJcmV0dXJuOwo+Pj4+ICsjZW5k
aWYKPj4+PiArCj4+Pj4gICAgCWN1cnJlbnQtPnRocmVhZC5iYWRfY2F1c2UgPSByZWdzLT5jYXVz
ZTsKPj4+PiAgICAJaWYgKHVzZXJfbW9kZShyZWdzKSkKPj4+PiAtLSAKPj4+PiAyLjM0LjEKPj4+
Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+PiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
