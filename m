Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D115DC54E41
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9l72H35T+lDQSycGtHvd/3UZJka77GdC/6odoi1yDaY=; b=Dj50pkUe7X7jXE
	9eokr0YuOfy2izRMbq9s8f0HYBnM07fNtghuYhSpuB4i86Td5gBm/RLW9fCJemV/RNoVMUysNUwJt
	iE2AcoEG1aDrE3b7goiDlFWiwHhjQreseGfWZ/clFqJ+jGJ00XeghJDx+4gjrdkbneN2d6hE8azYQ
	f0pBHfv3XtstUK/b9JQOdTU8sURE7qzOVxRxGnlpx70ftVVpqm+ouJO3tgNZtKKIhnJ7rUjQ/UCR9
	EFYNAtoVwVQAoL0246nmNrDLToMKJzJpl/G/wtgQ5RdAVEa3Nicfef/Fu2xv+z7galHa0Abs0jXXY
	tyqpYwMeg2kWCSj79qBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recRj-00000001I1e-0iN5;
	Mon, 26 Feb 2024 14:59:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recRg-00000001Hzv-21CW
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 14:59:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-412a314091aso294595e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 06:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708959546; x=1709564346; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbzdHiROhM3KOwFQ++XGfcTi7Kt4ditHOvX4BfEo9zQ=;
        b=0Wfaa1dpGKKJmSxUzsK4FaxBRRunYeskaWJzQJ3YCmuK1G93Gjtc1c1XJCyDP4gg+n
         xof4xRuVA8dGa9G7j8J5v0RDpV5W6bafhEM2pXCrub/yzsyMqio24Sq87qtnJTX6UueK
         4pNtSRL5FwfRhXjgpJEyQ0O4DtUR3Xz7mdhvJncud31W3AMhCQN3JisXjbiULTOk3SOW
         RkOIqhYsA3wRPLhCpvc1FG6wNSQWcBboQ3LbYzOiTU0+Qd0L5EcDLS7GG1mr7WNbIcqY
         3aSO7mYQQjKtScxy/Hj0+d57+xdaGScmvAheCnvcgJApxbt/RLFITxqyj9C/hHVAJKaZ
         gVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708959546; x=1709564346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbzdHiROhM3KOwFQ++XGfcTi7Kt4ditHOvX4BfEo9zQ=;
        b=QoXQDmbMbnJ+jEfjchFBQ3ChBwCUNBZuiZm3U6B6NCZLGzwJSAtBBqj8vTFWzIe+dV
         62TWQ+6PHGdDcPaaMm9EbXqIxWzDHWmnKNn8Jnmjm0WJgp5LQ48RnORENi6bPyKVdFgF
         KOUbXn1X8JPpCS+p8lMZTFdADCEMLJk8f0amhLYvCOJ1vCd9+V5W7IJFSCIthZEHNj5J
         plMBYoJQoNA7BlL4KfYaphGUjML3v+YWqaFOb/hmQwaaDdNkRQEoGjQdpqqINEj/9APj
         KRebiuOnZuGRMhumPRdOrvlnjxr+owg+yIuFbN3DlJcnMzTFvHL6S4E0zdYgrFsG2wqI
         otPA==
X-Forwarded-Encrypted: i=1; AJvYcCUuP24Yoip8qdvltC6BNtdUwN1v2xnrHEISBr1QAu+EZt+t4VoCseSlUSpMlYDhURazvVSToW+3aQB6wIdzyNO4qixdF2IrpAIDWwPetW9A
X-Gm-Message-State: AOJu0YwuSX48bYES9kAIzPelrN2NdUPuy7lNUTJjYFHHZZlmkaqb3ZYC
	R5VU51z7CPdIWENmFZsPyhGpZG9vPdsFOBQ8Ic2HcoP8ZhxM1iUaDxHpbqPfEwA=
X-Google-Smtp-Source: AGHT+IFAQUdjLR0gN1Ir02c0SaOnPg7uUNyhsMH8PQD/4SQJdQYSageDBv1veq6hfY3sd1X1CktvUg==
X-Received: by 2002:a05:600c:5125:b0:412:952d:3c6b with SMTP id o37-20020a05600c512500b00412952d3c6bmr5632433wms.2.1708959546547;
        Mon, 26 Feb 2024 06:59:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:83a3:2c00:c690:18b0? ([2a01:e0a:999:a3a0:83a3:2c00:c690:18b0])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b004128da16dddsm12030495wmm.15.2024.02.26.06.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 06:59:06 -0800 (PST)
Message-ID: <90b440e9-65b1-4482-88d4-f06e76863aa6@rivosinc.com>
Date: Mon, 26 Feb 2024 15:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
To: Damien Le Moal <dlemoal@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
References: <20240226140649.293254-1-cleger@rivosinc.com>
 <07675649-181a-4509-a595-d7ff9230e402@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <07675649-181a-4509-a595-d7ff9230e402@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_065908_544151_F07FB373 
X-CRM114-Status: GOOD (  15.56  )
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

CgpPbiAyNi8wMi8yMDI0IDE1OjU3LCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDI0LzAy
LzI2IDY6MDYsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4gRGVwcmVjYXRpb24gb2YgTk9NTVUg
c3VwcG9ydCBmb3IgcmlzY3Ygd2FzIGRpc2N1c3NlZCBkdXJpbmcgTFBDIDIwMjMKPj4gWzFdLiBS
ZWFzb25zIGZvciB0aGlzIGludm9sdmVzIGxhY2sgb2YgdXNlcnMgYXMgd2VsbCBhcyBtYWludGVu
YW5jZQo+PiBlZmZvcnRzIHRvIHN1cHBvcnQgdGhpcyBtb2RlLiBwc0FCSSBGRFBJQyBzcGVjaWZp
Y2F0aW9uIGFsc28gbmV2ZXIKPj4gbWFkZSBpdCB1cHN0cmVhbSBhbmQgbGFzdCBwdWJsaWMgbWVz
c2FnZXMgb2YgdGhpcyBkZXZlbG9wbWVudCBzZWVtcyB0bwo+PiBkYXRlIGJhY2sgZnJvbSAyMDIw
IFsyXS4gUGxhbiB0aGUgZGVwcmVjYXRpb24gdG8gYmUgZG9uZSBpbiAyIHllYXJzIGZyb20KPj4g
bm93LiBNYXJrIHRoZSBLY29uZmlnIG9wdGlvbiBhcyBkZXByZWNhdGVkIGJ5IGFkZGluZyBhIG5l
dyBkdW1teSBvcHRpb24KPj4gd2hpY2ggZXhwbGljaXRseSBkaXNwbGF5cyB0aGUgZGVwcmVjYXRp
b24gaW4gY2FzZSBvZiBDT05GSUdfTU1VPW4uIFRoaXMgb3B0aW9uCj4+IGlzIHNlbGVjdGVkIGlu
ZGlyZWN0bHkgYnkgQ09ORklHX1JJU0NWX01fTU9ERSBzaW5jZSBhbiBvcHRpb24gY2FuIG5vdAo+
PiBzZWxlY3QgYW5vdGhlciBvbmUgZGlyZWN0bHkgd2l0aCBhICJzZWxlY3QiIGluIGNhc2Ugb2Yg
c3VjaCBDT05GSUc9bi4KPj4gQWRkaXRpb25hbGx5LCBkaXNwbGF5IGEgcHJfZXJyKCkgbWVzc2Fn
ZSBhdCBib290IHRpbWUgaW4gY2FzZSBvZiBOT01NVQo+PiBidWlsZCB0byB3YXJuIGFib3V0IHVw
Y29taW5nIGRlcHJlY2F0aW9uLgo+Pgo+PiBMaW5rOiBodHRwczovL2xwYy5ldmVudHMvZXZlbnQv
MTcvY29udHJpYnV0aW9ucy8xNDc4LyBbMV0KPj4gTGluazogaHR0cHM6Ly9ncm91cHMuZ29vZ2xl
LmNvbS9hL2dyb3Vwcy5yaXNjdi5vcmcvZy9zdy1kZXYvYy9aallVSnN3a25RNC9tL1dZUlJ5bFR3
QUFBSiBbMl0KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgo+Pgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgfCA4ICsrKysr
KysrCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIHwgNCArKysrCj4+ICAyIGZpbGVzIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2Nv
bmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBpbmRleCBiZmZiZDg2OWEwNjguLjhkYTU4YzEw
MmQzZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4+ICsrKyBiL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+PiBAQCAtMjIxLDYgKzIyMSw3IEBAIGNvbmZpZyBBUkNIX01NQVBfUk5EX0NP
TVBBVF9CSVRTX01BWAo+PiAgIyBzZXQgaWYgd2UgcnVuIGluIG1hY2hpbmUgbW9kZSwgY2xlYXJl
ZCBpZiB3ZSBydW4gaW4gc3VwZXJ2aXNvciBtb2RlCj4+ICBjb25maWcgUklTQ1ZfTV9NT0RFCj4+
ICAJYm9vbAo+PiArCXNlbGVjdCBOT01NVQo+PiAgCWRlZmF1bHQgIU1NVQo+PiAgCj4+ICAjIHNl
dCBpZiB3ZSBhcmUgcnVubmluZyBpbiBTLW1vZGUgYW5kIGNhbiB1c2UgU0JJIGNhbGxzCj4+IEBA
IC0yMzYsNiArMjM3LDEzIEBAIGNvbmZpZyBNTVUKPj4gIAkgIFNlbGVjdCBpZiB5b3Ugd2FudCBN
TVUtYmFzZWQgdmlydHVhbGlzZWQgYWRkcmVzc2luZyBzcGFjZQo+PiAgCSAgc3VwcG9ydCBieSBw
YWdlZCBtZW1vcnkgbWFuYWdlbWVudC4gSWYgdW5zdXJlLCBzYXkgJ1knLgo+PiAgCj4+ICtjb25m
aWcgTk9NTVUKPj4gKwlkZXBlbmRzIG9uICFNTVUKPj4gKwlib29sICJOT01NVSBrZXJuZWwgKERF
UFJFQ0FURUQpIgo+PiArCWhlbHAKPj4gKwkgIE5PTU1VIGtlcm5lbCBpcyBkZXByZWNhdGVkIGFu
ZCBpcyBzY2hlZHVsZWQgZm9yIHJlbW92YWwgYnkKPj4gKwkgIHRoZSBiZWdpbm5pbmcgb2YgMjAy
Ny4KPiAKPiAyIHllYXJzIGZyb20gbm93IGlzIDIwMjYuLi4KCkd1ZXNzIEknbSBhIGJpdCB0aXJl
ZCAtXy0nCgo+IAo+PiArCj4+ICBjb25maWcgUEFHRV9PRkZTRVQKPj4gIAloZXgKPj4gIAlkZWZh
dWx0IDB4QzAwMDAwMDAgaWYgMzJCSVQgJiYgTU1VCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+PiBpbmRleCA0Zjcz
YzBhZTQ0YjIuLjg3OTk4MTZlZjBhNiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2V0dXAuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+IEBAIC0yOTUsNiAr
Mjk1LDEwIEBAIHZvaWQgX19pbml0IHNldHVwX2FyY2goY2hhciAqKmNtZGxpbmVfcCkKPj4gIAly
aXNjdl9zZXRfZG1hX2NhY2hlX2FsaWdubWVudCgpOwo+PiAgCj4+ICAJcmlzY3ZfdXNlcl9pc2Ff
ZW5hYmxlKCk7Cj4+ICsKPj4gKyNpZiAhZGVmaW5lZChDT05GSUdfTU1VKQo+IAo+IAlpZiAoIUlT
X0VOQUJMRUQoQ09ORklHX01NVSkpCj4gCj4gd291bGQgYmUgbW9yZSBlbGVnYW50IGhlcmUuLi4K
ClN1cmUuCgo+IAo+PiArCXByX2VycigiUklTQy1WIE5PTU1VIHN1cHBvcnQgaXMgZGVwcmVjYXRl
ZCBhbmQgc2NoZWR1bGVkIGZvciByZW1vdmFsIGJ5IHRoZSBiZWdpbm5pbmcgb2YgMjAyN1xuIik7
Cj4gCj4gV2h5IHByX2VycigpID8gcHJfd2FybigpIHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUuCgpB
Z3JlZWQuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPj4gKyNlbmRpZgo+PiAgfQo+PiAgCj4+ICBi
b29sIGFyY2hfY3B1X2lzX2hvdHBsdWdnYWJsZShpbnQgY3B1KQo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
