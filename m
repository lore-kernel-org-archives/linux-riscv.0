Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B719C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjLmIvZeb1Hxkta8LTN213O2D9y6mTUTHx4NBMUtdGw=; b=b6ycOCR89paeac
	b1Imkg+WtBsKF7QP432pzlMos4qTPgu+vn2DEm1DBnTt4NOr17XZh9veT4kFDR4ugKq0DOPD0I3VQ
	AOZCVnEXm1R+JbbL3h6jyiyYZzMRl+fUlK/6mJZEY83fHdoRIq3QYGJdsvUKpFS9F0Ob/m2qLguGE
	ogUWri8ZYWJcRAnxxVbodrJJyjGdscf8+m9oXtlTpR+nVJzf0IaSUgXNLoJGBDxVgoBt+So4oOFDA
	xpKD8MGOC2vMd1Wv2eoZk9BybmGICAgNiwrzYpXBVUDqBe82LzkzSZdzzJjri7FJyV75IXgS4BI1w
	zGBxc/ugTitV0OYVDwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjrQ-00000009bud-43ML;
	Thu, 27 Jun 2024 07:48:05 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjrM-00000009btM-422B
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 07:48:03 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-2c8517aab46so3750153a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 00:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474478; x=1720079278; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1VniVF/Cma/D69twcQIBZj8lIAajcHSZqsODsZ7jwnI=;
        b=YD/v15o3IHL9EQAy4N7r83e9zs7th4+dy4tSjyuefCkpjC+kd+rVOE15rnb8Vrk9xy
         qKAlrhxaTYpEh58bbkPy8KNeQm8KF5BYxmd5k1eAdHMQp2o6czKm09OtR/slmcQ5t4sH
         g6KglDiZSD+dK0GZDrk0gGGckRvTfB2AdDL0P9LKUJPxXMzks1IlO6jWVAdWHv9tqvTe
         lSwRg9tEKjvy/h+6NtT4OMp1RgzXer/u8cfU97EDPi8OakAwH1oDJRiSu6msBYRLu4T0
         GZ6y3s4GGm7ewrntheg7bOGaWQg5ckGHoH0YrwABRn3ZAmuuIk3zqh3boIEljaHFkVvs
         xw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474478; x=1720079278;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1VniVF/Cma/D69twcQIBZj8lIAajcHSZqsODsZ7jwnI=;
        b=oZikxCM1+S7lDNG5kMLKhb71AB9gHKpCHai3u++xp/q+3BOkgbkzCXtyektTYqQv2e
         QEX6ITgajqlkNhymKiRUEyxedHs+0S3kgd/qgh5NTLTaXkC7XSrkKny0eQj90b64Rh5U
         88ngxNLB8DinarXKB1+GgZ2wc+mB4qTCv8Ty3aYPq9v9YADUO8GEqsj8jZOsBr9mNMIM
         Hc3cXZBpfU+dGHL3r82HUDS9TJgRq52Xj6qRKaDfziRRvOGCLrrhNr75rlxLwE40r706
         gms1/4luxw61Jh9CGFsD3i30erli/llI6xi3lyfu+RTW2Dp5oj41O7zyUo2HFePzXSRO
         zzAg==
X-Forwarded-Encrypted: i=1; AJvYcCVxEDEyofnryo+axSQ3F8Ssj+ucTqufIoUbVDJrZfagQeoyv4RE98xtaauzpod0jnvk7XSUSjWnbI3O6YYOpp48YlwSATEC0dNP5k5VN/kF
X-Gm-Message-State: AOJu0Yxdc+jkg1QGfko1IQS6ndRxyYalIJPIFrCDNnYXTqI4+tSN8cjR
	EZzmyz7wemmSQ0r3yqTdQkDTRLz+vrLvY+B5GAfECfd5aIZgHl5z
X-Google-Smtp-Source: AGHT+IEL1xLC2GJqJfnIsftcppBDozb/ub7R/JIjyrWfp+cD3gnjoeGw9JF3AhLkTejjcdKjubEaoA==
X-Received: by 2002:a17:90b:2382:b0:2c8:e1f6:7d84 with SMTP id 98e67ed59e1d1-2c8e1f67da9mr2696347a91.25.1719474478000;
        Thu, 27 Jun 2024 00:47:58 -0700 (PDT)
Received: from [127.0.0.1] ([45.62.172.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8d81d2ae1sm2929963a91.50.2024.06.27.00.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 00:47:57 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <9c102328-6bb3-46b6-bc2f-d011a284d5b0@gmail.com>
Date: Thu, 27 Jun 2024 15:47:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andreas Schwab <schwab@suse.de>, David Laight <David.Laight@ACULAB.COM>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Ivan A. Melnikov" <iv@altlinux.org>
References: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
 <20240627071422.GA2626@altlinux.org>
Content-Language: en-GB-large
In-Reply-To: <20240627071422.GA2626@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_004801_178145_92E73277 
X-CRM114-Status: GOOD (  27.04  )
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

T24gMjAyNC0wNi0yNyAxNToxNCwgRG1pdHJ5IFYuIExldmluIHdyb3RlOgoKPiBIaSwKPiAKPiBP
biBUdWUsIEF1ZyAwMSwgMjAyMyBhdCAxMDoxNToxNlBNICswODAwLCBDZWxlc3RlIExpdSB3cm90
ZToKPj4gV2hlbiB3ZSB0ZXN0IHNlY2NvbXAgd2l0aCA2LjQga2VybmVsLCB3ZSBmb3VuZCBlcnJu
byBoYXMgd3JvbmcgdmFsdWUuCj4+IElmIHdlIGRlbnkgTkVUTElOS19BVURJVCB3aXRoIEVBRk5P
U1VQUE9SVCwgYWZ0ZXIgZjBiZGRmNTA1ODZkLCB3ZSB3aWxsCj4+IGdldCBFTk9TWVMgaW5zdGVh
ZC4gV2UgZ290IHNhbWUgcmVzdWx0IHdpdGggY29tbWl0IDljMjU5OGQ0MzUxMCAoInJpc2N2Ogo+
PiBlbnRyeTogU2F2ZSBhMCBwcmlvciBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkiKS4K
Pj4KPj4gQWZ0ZXIgYW5hbHlzaW5nIGNvZGUsIHdlIHRoaW5rIHRoYXQgcmVncy0+YTAgPSAtRU5P
U1lTIHNob3VsZCBvbmx5IGJlCj4+IGV4ZWN1dGVkIHdoZW4gc3lzY2FsbCAhPSAtMS4gSW4gX19z
ZWNjb21wX2ZpbHRlciwgd2hlbiBzZWNjb21wIHJlamVjdGVkCj4+IHRoaXMgc3lzY2FsbCB3aXRo
IHNwZWNpZmllZCBlcnJubywgdGhleSB3aWxsIHNldCBhMCB0byByZXR1cm4gbnVtYmVyIGFzCj4+
IHN5c2NhbGwgQUJJLCBhbmQgdGhlbiByZXR1cm4gLTEuIFRoaXMgcmV0dXJuIG51bWJlciBpcyBm
aW5hbGx5IHBhc3MgYXMKPj4gcmV0dXJuIG51bWJlciBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNl
cl9tb2RlLCBhbmQgdGhlbiBpcyBjb21wYXJlZCB3aXRoCj4+IE5SX3N5c2NhbGxzIGFmdGVyIGNv
bnZlcnRlZCB0byB1bG9uZyAoc28gaXQgd2lsbCBiZSBVTE9OR19NQVgpLiBUaGUKPj4gY29uZGl0
aW9uIHN5c2NhbGwgPCBOUl9zeXNjYWxscyB3aWxsIGFsd2F5cyBiZSBmYWxzZSwgc28gcmVncy0+
YTAgPSAtRU5PU1lTCj4+IGlzIGFsd2F5cyBleGVjdXRlZC4gSXQgY292ZXJlZCBhMCBzZXQgYnkg
c2VjY29tcCwgc28gd2UgYWx3YXlzIGdldAo+PiBFTk9TWVMgd2hlbiBtYXRjaCBzZWNjb21wIFJF
VF9FUlJOTyBydWxlLgo+Pgo+PiBGaXhlczogZjBiZGRmNTA1ODZkICgicmlzY3Y6IGVudHJ5OiBD
b252ZXJ0IHRvIGdlbmVyaWMgZW50cnkiKQo+PiBSZXBvcnRlZC1ieTogRmVsaXggWWFuIDxmZWxp
eG9ubWFyc0BhcmNobGludXgub3JnPgo+PiBDby1kZXZlbG9wZWQtYnk6IFJ1aXpoZSBQYW4gPGMx
NDEwMjhAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBSdWl6aGUgUGFuIDxjMTQxMDI4QGdt
YWlsLmNvbT4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBTaGlxaSBaaGFuZyA8c2hpcWlAaXNyYy5pc2Nh
cy5hYy5jbj4KPj4gU2lnbmVkLW9mZi1ieTogU2hpcWkgWmhhbmcgPHNoaXFpQGlzcmMuaXNjYXMu
YWMuY24+Cj4+IFNpZ25lZC1vZmYtYnk6IENlbGVzdGUgTGl1IDxDb2VsYWNhbnRodXNIZXhAZ21h
aWwuY29tPgo+PiBUZXN0ZWQtYnk6IEZlbGl4IFlhbiA8ZmVsaXhvbm1hcnNAYXJjaGxpbnV4Lm9y
Zz4KPj4gVGVzdGVkLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhp
bmdAY2Fub25pY2FsLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJp
dm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+
PiAtLS0KPj4KPj4gdjQgLT4gdjU6IGFkZCBUZXN0ZWQtYnkgRW1pbCBSZW5uZXIgQmVydGhpbmcg
PGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Cj4+IHYzIC0+IHY0OiB1c2UgbG9u
ZyBpbnN0ZWFkIG9mIHVsb25nIHRvIHJlZHVjZSB0eXBlIGNhc3QgYW5kIGF2b2lkCj4+ICAgICAg
ICAgICBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIGJlaGF2aW9yLCBhbmQgbWFrZSB0aGUganVkZ21l
bnQgb2Ygc3lzY2FsbAo+PiAgICAgICAgICAgaW52YWxpZCBtb3JlIGV4cGxpY2l0Cj4+IHYyIC0+
IHYzOiB1c2UgaWYtc3RhdGVtZW50IGluc3RlYWQgb2Ygc2V0IGRlZmF1bHQgdmFsdWUsCj4+ICAg
ICAgICAgICBjbGFyaWZ5IHRoZSB0eXBlIG9mIHN5c2NhbGwKPj4gdjEgLT4gdjI6IGFkZGVkIGV4
cGxhbmF0aW9uIG9uIHdoeSBhbHdheXMgZ290IEVOT1NZUwo+Pgo+PiAgYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHMuYyB8IDYgKysrLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gaW5kZXggZjkxMGRmY2NiZjVkMi4u
NzI5Zjc5Yzk3ZTJiZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+IEBAIC0yOTcsNyArMjk3LDcgQEAg
YXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2JyZWFrKHN0
cnVjdCBwdF9yZWdzICpyZWdzKQo+PiAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rp
b24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICB7Cj4+ICAJ
aWYgKHVzZXJfbW9kZShyZWdzKSkgewo+PiAtCQl1bG9uZyBzeXNjYWxsID0gcmVncy0+YTc7Cj4+
ICsJCWxvbmcgc3lzY2FsbCA9IHJlZ3MtPmE3Owo+PiAgCj4+ICAJCXJlZ3MtPmVwYyArPSA0Owo+
PiAgCQlyZWdzLT5vcmlnX2EwID0gcmVncy0+YTA7Cj4+IEBAIC0zMDYsOSArMzA2LDkgQEAgYXNt
bGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICAKPj4gIAkJc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJv
bV91c2VyX21vZGUocmVncywgc3lzY2FsbCk7Cj4+ICAKPj4gLQkJaWYgKHN5c2NhbGwgPCBOUl9z
eXNjYWxscykKPj4gKwkJaWYgKHN5c2NhbGwgPj0gMCAmJiBzeXNjYWxsIDwgTlJfc3lzY2FsbHMp
Cj4+ICAJCQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7Cj4+IC0JCWVsc2UKPj4gKwkJ
ZWxzZSBpZiAoc3lzY2FsbCAhPSAtMSkKPj4gIAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKPj4gIAo+
PiAgCQlzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+IAo+IFVuZm9ydHVuYXRlbHks
IHRoaXMgY2hhbmdlIGludHJvZHVjZWQgYSByZWdyZXNzaW9uOiBpdCBicm9rZSBzdHJhY2UKPiBz
eXNjYWxsIHRhbXBlcmluZyBvbiByaXNjdi4gIFdoZW4gdGhlIHRyYWNlciBjaGFuZ2VzIHN5c2Nh
bGwgbnVtYmVyIHRvIC0xLAo+IHRoZSBrZXJuZWwgZmFpbHMgdG8gaW5pdGlhbGl6ZSBhMCB3aXRo
IC1FTk9TWVMgYW5kIHN1YnNlcXVlbnRseSBmYWlscyB0bwo+IHJldHVybiB0aGUgZXJyb3IgY29k
ZSBvZiB0aGUgZmFpbGVkIHN5c2NhbGwgdG8gdXNlcnNwYWNlLgoKSW4gdGhlIHBhdGNoIHYyLCB3
ZSBhY3R1YWxseSBkbyB0aGUgcmlnaHQgdGhpbmcuIEJ1dCBhcyBCasO2cm4gVMO2cGVsJ3MKc3Vn
Z2VzdGlvbiBhbmQgd2UgZm91bmQgY2FzdCBsb25nIHRvIHVsb25nIGlzIGltcGxlbWVudGF0aW9u
LWRlZmluZWQKYmVoYXZpb3IgaW4gQywgc28gd2UgY2hhbmdlIGl0IHRvIGN1cnJlbnQgZm9ybS4g
U28gcmV2ZXJ0IHRoaXMgcGF0Y2ggYW5kCmFwcGx5IHBhdGNoIHYyIHNob3VsZCBmaXggdGhpcyBp
c3N1ZS4gUGF0Y2ggdjIgdXNlcyB0aHMgc2FtZSB3YXkgd2l0aApvdGhlciBhcmNoaXRlY3R1cmVz
LgoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA3MTgxNjI5NDAuMjI2MTE4
LTEtQ29lbGFjYW50aHVzSGV4QGdtYWlsLmNvbS8KCj4gCj4gSSB3aXNoIHlvdSB3ZXJlIHJ1bm5p
bmcgc3RyYWNlIHRlc3Qgc3VpdGUgYmVmb3JlIGNoYW5naW5nIHRoaXMgcGFydCBvZiB0aGUKPiBr
ZXJuZWwuICBOb3cgSSdtIGdvaW5nIHRvIGFwcGx5IGEgd29ya2Fyb3VuZCBbMV0gaW4gc3RyYWNl
LCBidXQgcGxlYXNlCj4gbm90ZSB0aGF0IHJpc2N2IHNlZW1zIHRvIGJlIHRoZSBvbmx5IGxpbnV4
IGFyY2hpdGVjdHVyZSB3aGVyZSBzdWNoIGEKPiB3b3JrYXJvdW5kIGlzIGN1cnJlbnRseSByZXF1
aXJlZC4KPiAKPiBUaGVyZSB3YXMgYSBzaW1pbGFyIGtlcm5lbCBidWcgb25jZSBvbiBwYXJpc2Ms
IGJ1dCBpdCB3YXMgZml4ZWQgWzJdCj4gc2V2ZXJhbCB5ZWFycyBhZ28gYnkgY29tbWl0IGI3ZGM1
YTA3MWRkZi4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2UvY29tbWl0
L2MzYWUyYjI3NzMyOTUyNjYzYTM2MDAyNjk4ODRlMzYzY2I3N2EwMjQKPiBbMl0gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy90b3J2YWxkcy9jL2I3ZGM1YTA3MWRkZjY5YzAzNTAzOTZiMjAzY2JhMzJm
ZTViYWI1MTAKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
