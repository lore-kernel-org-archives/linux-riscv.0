Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0889AC8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCAml0bR48g6NMZeIOU+x3zVd2FfThBby3pmzmJwfgo=; b=ETxk/GIiVZVM7s
	3+MwVTPEf4REPEW/27ElDt7TlHrW3MAm80sT6MRj8Xa7PGLi46A3D9K1Xh/IuJAacbdAsLd4XYu/u
	WI8TztbV9tFJk7YiLLGDYDAsZdvztpuIutDGkI4QMnLa1NPyq7qJy1DvAsoCHGzp2pAekcd0N25+i
	dkVzP+1iUV8RJ6voAHQanwK+QWQNfIPBKx6yo7ngxUM/Ku0Ujjlq4a0w2vnsMt0DVIN6Oe51HdF9o
	BGw1rcMn8ibOwpVMaiX/pdLrXVGRb62Satmrjj7RwCQJ/iuXTuA3lf/fIS+xHRKqRsvwqU9d7foM8
	q3HHwqZi01C13In9wp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhgx-00000001uXG-3qR2;
	Mon, 07 Jul 2025 08:59:15 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYghQ-00000001lX9-2S6K
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 07:55:41 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-234bfe37cccso29790645ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751874939; x=1752479739; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aApJabUejUWlSHVtY2EMwiJ02+kG5XX+8RqRV7KPGb4=;
        b=bG9gqWtVY4fuAGcxxlMZSVMCjLOkouz+dqKGUv3/zc7qfEZfQ2ET1LNK9lOaYLnMHC
         rb1zlOJsT7pgK2pq5mlXqhvQD8LIdcwNp2uietzbESBYhpfpvNnQJV0krR041U163p4b
         m06MrqdPhR8nnztkJ4rUFRksnfu1j+6c3n/llHTJqnqHvb5jHZLjdpUMntAF4bpSXcX+
         Mtlbb5XwDR8B+Wl3xAkgaeeDtXYKCcnWEBMSN5BKoMvCmJIG/ZwALGzU9GAL1OBa/diB
         79HF2SmOsWVnUYEJbOoKR+c0l7kf7nUO8Xqpw7yImQs+rXC0f5rZc/kbDzbsdV62tJsu
         zfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874939; x=1752479739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aApJabUejUWlSHVtY2EMwiJ02+kG5XX+8RqRV7KPGb4=;
        b=aMcCcWrs33uTpS9yYIbzwYTSHX2PxrwGq/lKLeExvwE5moX9pWL603Aadx8IJxXzHx
         oSCUOlmtWlwQvHvx4eZAURSZn/DZBRR5u//wLE6B0D81e03lT8odFV4+bR6onmUt6pyY
         h1ElTY0P3vn0fRqDBR3Er3nKKAcZem29cxFq7uThabWTbUFhyN8folQvUIGEBI5joA/W
         gg3MlYoDr1GIuEog2iv5mDJw8p0QLYcYCXoI+mdbUd06wL06qHr6P9Rxwt4DWK/tWzxt
         TdHgJpYVl4AmxYO5HuGwYv/LgivOhgjc5CCVb2sF7Wa//v21it9zMOYfjRxCzEwTusLa
         KBRA==
X-Forwarded-Encrypted: i=1; AJvYcCUqcz8b6kyOMJmp9X2EFbsCxT92GKGFVUhCmmUVfhNvvXwDpqvifHkPRWyyuiHwuxrk073fTnY9GjQxig==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCYZmu3tG5p33z5+R5jokAeDFLfckBmeM4no+fJQVxGekN/Mgv
	uib2r3Cst1W/bAeJpIFLOoPtZ6mS56GcmITi6JodEpa4w0JW7T7cpx9LnshPh2In8mY=
X-Gm-Gg: ASbGncv3o1RTQ9K7oyFAUUEgxmoa0jef+FEdUZwSKiUFcMHAZvs2Djr3OMgyvUEQKmx
	mun+rW+VNSd52OJlYJJBA737m+A89n0NmuYUKAh5ZKrmYTCIhxyKxaDk+cnKwT6YxJ6IecJRnf+
	CJZwsrncofkwk7TLkJ9fB6PqSnxzBApREa3/mNPZCv6FpLBz2JWbMUPg2+A9P0z2wmHfU2uFlcE
	2s6T/S6bZLEHC8Yw9RzKik7oy9OgEvo9H46Sl6QpPaGU8Jf0U/kJ37GfcK/d6LtHC5ehXFwJJaV
	ipCVGbDxPgmrrwWX1kYZSJm75yLfHSANnTTxrySby+7xHRkNXK0E4ILwv4Ng2ikOs9kanz7iZ9E
	d6qIMTMGNafUA2Rl2Vw4QkkUcvHRhpJA=
X-Google-Smtp-Source: AGHT+IFfTih1LqKT1LDm5be4/O7hUomMhMwDtvn8B+cv+CxwUB3mfhw4Xg4ugcd+O6z8cN5GXNsIqg==
X-Received: by 2002:a17:902:ce81:b0:234:c549:d9dd with SMTP id d9443c01a7336-23c90ffd4ddmr129310345ad.48.1751874939247;
        Mon, 07 Jul 2025 00:55:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a381sm78207605ad.20.2025.07.07.00.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 00:55:38 -0700 (PDT)
Message-ID: <977847c2-d94b-44a9-9c1f-f1ff95ffb985@rivosinc.com>
Date: Mon, 7 Jul 2025 09:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] RISC-V: Fix a register to store the percpu offset
To: Yunhui Cui <cuiyunhui@bytedance.com>, masahiroy@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, dennis@kernel.org,
 tj@kernel.org, cl@gentwo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com,
 bjorn@rivosinc.com, cyrilbur@tenstorrent.com, rostedt@goodmis.org,
 puranjay@kernel.org, ben.dooks@codethink.co.uk, zhangchunyan@iscas.ac.cn,
 ruanjinjie@huawei.com, jszhang@kernel.org, charlie@rivosinc.com,
 antonb@tenstorrent.com, ajones@ventanamicro.com, debug@rivosinc.com,
 haibo1.xu@intel.com, samuel.holland@sifive.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250704084500.62688-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005540_733325_10DAB7E8 
X-CRM114-Status: GOOD (  23.05  )
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

CgpPbiAwNC8wNy8yMDI1IDEwOjQ1LCBZdW5odWkgQ3VpIHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcg
ZGF0YSB3YXMgY29sbGVjdGVkIGZyb20gdGVzdHMgY29uZHVjdGVkIG9uIHRoZQo+IFNwYWNlbWl0
KFIpIFg2MCB1c2luZyB0aGUgZml4ZWQgcmVnaXN0ZXIgbWV0aG9kOgo+IAo+IE5vIG1vZGlmaWNh
dGlvbnM6Cj4gNi43NywgNi43OTEsIDYuNzkyLCA2LjgyNiwgNi43ODQsIDYuODM5LCA2Ljc3Niwg
Ni43MzMsIDYuNzk1LCA2Ljc2Mwo+IEF2ZXJhZ2U6IDYuNzg2ODM5MzA1Cj4gCj4gZmZpeC14Mjc6
Cj4gNy4xMDYsIDcuMDM1LCA3LjM2MiwgNy4xNDEsIDcuMDk2LCA3LjE4MiwgNy4xMDksIDcuMTI2
LCA3LjE4NiwgNy4xMgo+IEF2ZXJhZ2U6IDcuMTQ1ODI2NTM5Cj4gCj4gZmZpeC14MjcgKyB4Mjco
czExKSB1c2VkIGZvciBvZmZzZXQgb3B0aW1pemF0aW9uOgo+IDcuMDU5LCA2Ljk1MSwgNi45NjEs
IDYuOTg1LCA2LjkzLCA2Ljk2NCwgNi45NzcsIDYuOTA3LCA2Ljk4MywgNi45NDQKPiBBdmVyYWdl
OiA2Ljk2NTk5MzE3MwoKSGkgWXVuaHVpLAoKT3V0IG9mIGN1cmlvc2l0eSwgZGlkIHlvdSB0cmll
ZCB1c2luZyBhIHJlZ2lzdGVyIGRpZmZlcmVudCB0aGFuIHgyNyA/CgpUaGFua3MsCgpDbMOpbWVu
dAoKPiAKPiBBbmFseXNpczoKPiBUaGUgZml4ZWQgcmVnaXN0ZXIgbWV0aG9kIHJlZHVjZWQgcGVy
Zm9ybWFuY2UgYnkgNS4yOSUuCj4gVGhlIHBlci1DUFUgb2Zmc2V0IG9wdGltaXphdGlvbiBpbXBy
b3ZlZCBwZXJmb3JtYW5jZSBieSAyLjUyJS4KPiAKPiBJc3N1ZXMgd2l0aCB0aGUgZml4ZWQgcmVn
aXN0ZXIgbWV0aG9kIChiZXlvbmQgY29kZSBzaXplKToKPiBQZXJmb3JtYW5jZSBkZWdyYWRhdGlv
biBkdWUgdG8gdGhlIGxvc3Mgb2Ygb25lIGdlbmVyYWwtcHVycG9zZSByZWdpc3Rlci4KPiBFYWNo
IGhhbmRsZV9leGNlcHRpb24oKSBjYWxsIHJlcXVpcmVzIGxvYWRpbmcgdGhlIHBlci1DUFUgb2Zm
c2V0IGludG8gdGhlCj4gZml4ZWQgcmVnaXN0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogWXVuaHVp
IEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIE1ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGVyY3B1
LmggfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2FzbS1v
ZmZzZXRzLmMgfCAgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgfCAxMSAr
KysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgICAgIHwgIDMgKysrCj4g
IDUgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGVyY3B1LmgKPiAKPiBkaWZm
IC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IGI3ZDVmMmYwZGVmMC4uZTI5MWY4
NjVhZGM0IDEwMDY0NAo+IC0tLSBhL01ha2VmaWxlCj4gKysrIGIvTWFrZWZpbGUKPiBAQCAtMTAy
Niw4ICsxMDI2LDggQEAgaW5jbHVkZSAkKGFkZHByZWZpeCAkKHNyY3RyZWUpLywgJChpbmNsdWRl
LXkpKQo+ICAKPiAgIyBBZGQgdXNlciBzdXBwbGllZCBDUFBGTEFHUywgQUZMQUdTLCBDRkxBR1Mg
YW5kIFJVU1RGTEFHUyBhcyB0aGUgbGFzdCBhc3NpZ25tZW50cwo+ICBLQlVJTERfQ1BQRkxBR1Mg
Kz0gJChLQ1BQRkxBR1MpCj4gLUtCVUlMRF9BRkxBR1MgICArPSAkKEtBRkxBR1MpCj4gLUtCVUlM
RF9DRkxBR1MgICArPSAkKEtDRkxBR1MpCj4gK0tCVUlMRF9BRkxBR1MgICArPSAkKEtBRkxBR1Mp
IC1mZml4ZWQteDI3Cj4gK0tCVUlMRF9DRkxBR1MgICArPSAkKEtDRkxBR1MpIC1mZml4ZWQteDI3
Cj4gIEtCVUlMRF9SVVNURkxBR1MgKz0gJChLUlVTVEZMQUdTKQo+ICAKPiAgS0JVSUxEX0xERkxB
R1NfTU9EVUxFICs9IC0tYnVpbGQtaWQ9c2hhMQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BlcmNwdS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaAo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi41ZDZiMTA5Y2ZhYjcKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaAo+IEBA
IC0wLDAgKzEsMjIgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eSAqLwo+ICsKPiArI2lmbmRlZiBfX0FTTV9QRVJDUFVfSAo+ICsjZGVmaW5lIF9fQVNNX1BFUkNQ
VV9ICj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2V0X215X2NwdV9vZmZzZXQodW5zaWduZWQg
bG9uZyBvZmYpCj4gK3sKPiArCWFzbSB2b2xhdGlsZSgiYWRkaSBzMTEsICUwLCAwIiA6OiAiciIg
KG9mZikpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgX19rZXJuX215
X2NwdV9vZmZzZXQodm9pZCkKPiArewo+ICsJdW5zaWduZWQgbG9uZyBvZmY7Cj4gKwlhc20gKCJt
diAlMCwgczExIiA6Ij1yIiAob2ZmKSA6KTsKPiArCXJldHVybiBvZmY7Cj4gK30KPiArCj4gKyNk
ZWZpbmUgX19teV9jcHVfb2Zmc2V0IF9fa2Vybl9teV9jcHVfb2Zmc2V0KCkKPiArCj4gKyNpbmNs
dWRlIDxhc20tZ2VuZXJpYy9wZXJjcHUuaD4KPiArCj4gKyNlbmRpZgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9m
ZnNldHMuYwo+IGluZGV4IGEwMzEyOWY0MGM0Ni4uMGNlOTZmMzBiZjMyIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9hc20tb2Zmc2V0cy5jCj4gQEAgLTM1LDYgKzM1LDcgQEAgdm9pZCBhc21fb2Zmc2V0cyh2b2lk
KQo+ICAJT0ZGU0VUKFRBU0tfVEhSRUFEX1M5LCB0YXNrX3N0cnVjdCwgdGhyZWFkLnNbOV0pOwo+
ICAJT0ZGU0VUKFRBU0tfVEhSRUFEX1MxMCwgdGFza19zdHJ1Y3QsIHRocmVhZC5zWzEwXSk7Cj4g
IAlPRkZTRVQoVEFTS19USFJFQURfUzExLCB0YXNrX3N0cnVjdCwgdGhyZWFkLnNbMTFdKTsKPiAr
CU9GRlNFVChUQVNLX1RJX0NQVSwgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLmNwdSk7Cj4gIAlP
RkZTRVQoVEFTS19USV9GTEFHUywgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLmZsYWdzKTsKPiAg
CU9GRlNFVChUQVNLX1RJX1BSRUVNUFRfQ09VTlQsIHRhc2tfc3RydWN0LCB0aHJlYWRfaW5mby5w
cmVlbXB0X2NvdW50KTsKPiAgCU9GRlNFVChUQVNLX1RJX0tFUk5FTF9TUCwgdGFza19zdHJ1Y3Qs
IHRocmVhZF9pbmZvLmtlcm5lbF9zcCk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gaW5kZXggOWQxYTMwNWQ1NTA4
Li41MjlkNjU3NjI2NWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiBAQCAtNzcsNiArNzcsMTMgQEAgU1lN
X0NPREVfU1RBUlQoaGFuZGxlX2V4Y2VwdGlvbikKPiAgCSAqLwo+ICAJY3NydyBDU1JfU0NSQVRD
SCwgeDAKPiAgCj4gKwkvKiBsb2FkIF9fcGVyX2NwdV9vZmZzZXRbY3B1XSB0byBzMTEqLwo+ICsJ
UkVHX0wgdDYsIFRBU0tfVElfQ1BVKHRwKQo+ICsJc2xsaSB0NiwgdDYsIDMKPiArCWxhIHMxMSwg
X19wZXJfY3B1X29mZnNldAo+ICsJYWRkIHMxMSwgczExLCB0Ngo+ICsJUkVHX0wgczExLCAwKHMx
MSkKPiArCj4gIAkvKiBMb2FkIHRoZSBnbG9iYWwgcG9pbnRlciAqLwo+ICAJbG9hZF9nbG9iYWxf
cG9pbnRlcgo+ICAKPiBAQCAtMjk4LDcgKzMwNSw3IEBAIFNZTV9GVU5DX1NUQVJUKF9fc3dpdGNo
X3RvKQo+ICAJUkVHX1MgczgsICBUQVNLX1RIUkVBRF9TOF9SQShhMykKPiAgCVJFR19TIHM5LCAg
VEFTS19USFJFQURfUzlfUkEoYTMpCj4gIAlSRUdfUyBzMTAsIFRBU0tfVEhSRUFEX1MxMF9SQShh
MykKPiAtCVJFR19TIHMxMSwgVEFTS19USFJFQURfUzExX1JBKGEzKQo+ICsJLyogUkVHX1MgczEx
LCBUQVNLX1RIUkVBRF9TMTFfUkEoYTMpICovCj4gIAkvKiBTYXZlIHRoZSBrZXJuZWwgc2hhZG93
IGNhbGwgc3RhY2sgcG9pbnRlciAqLwo+ICAJc2NzX3NhdmVfY3VycmVudAo+ICAJLyogUmVzdG9y
ZSBjb250ZXh0IGZyb20gbmV4dC0+dGhyZWFkICovCj4gQEAgLTMxNSw3ICszMjIsNyBAQCBTWU1f
RlVOQ19TVEFSVChfX3N3aXRjaF90bykKPiAgCVJFR19MIHM4LCAgVEFTS19USFJFQURfUzhfUkEo
YTQpCj4gIAlSRUdfTCBzOSwgIFRBU0tfVEhSRUFEX1M5X1JBKGE0KQo+ICAJUkVHX0wgczEwLCBU
QVNLX1RIUkVBRF9TMTBfUkEoYTQpCj4gLQlSRUdfTCBzMTEsIFRBU0tfVEhSRUFEX1MxMV9SQShh
NCkKPiArCS8qIFJFR19MIHMxMSwgVEFTS19USFJFQURfUzExX1JBKGE0KSAqLwo+ICAJLyogVGhl
IG9mZnNldCBvZiB0aHJlYWRfaW5mbyBpbiB0YXNrX3N0cnVjdCBpcyB6ZXJvLiAqLwo+ICAJbW92
ZSB0cCwgYTEKPiAgCS8qIFN3aXRjaCB0byB0aGUgbmV4dCBzaGFkb3cgY2FsbCBzdGFjayAqLwo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zbXBib290LmMKPiBpbmRleCBmYjZhYjdmOGJmYmQuLjZmYTEyY2M4NDUyMyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zbXBib290LmMKPiBAQCAtNDMsNiArNDMsNyBAQCBzdGF0aWMgREVDTEFSRV9DT01QTEVU
SU9OKGNwdV9ydW5uaW5nKTsKPiAgCj4gIHZvaWQgX19pbml0IHNtcF9wcmVwYXJlX2Jvb3RfY3B1
KHZvaWQpCj4gIHsKPiArCXNldF9teV9jcHVfb2Zmc2V0KHBlcl9jcHVfb2Zmc2V0KHNtcF9wcm9j
ZXNzb3JfaWQoKSkpOwo+ICB9Cj4gIAo+ICB2b2lkIF9faW5pdCBzbXBfcHJlcGFyZV9jcHVzKHVu
c2lnbmVkIGludCBtYXhfY3B1cykKPiBAQCAtMjQwLDYgKzI0MSw4IEBAIGFzbWxpbmthZ2UgX192
aXNpYmxlIHZvaWQgc21wX2NhbGxpbih2b2lkKQo+ICAJbW1ncmFiKG1tKTsKPiAgCWN1cnJlbnQt
PmFjdGl2ZV9tbSA9IG1tOwo+ICAKPiArCXNldF9teV9jcHVfb2Zmc2V0KHBlcl9jcHVfb2Zmc2V0
KGN1cnJfY3B1aWQpKTsKPiArCj4gIAlzdG9yZV9jcHVfdG9wb2xvZ3koY3Vycl9jcHVpZCk7Cj4g
IAlub3RpZnlfY3B1X3N0YXJ0aW5nKGN1cnJfY3B1aWQpOwo+ICAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
