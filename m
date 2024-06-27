Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0E5C30653
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIMXvtP0ldHWp5BoLxXQ6Er8SN7mus7LMxD7JKAMyM8=; b=AsqX/1Jc4OBw7Q
	PlVA60noeJz4VKkCwamWiUbknmUFBRsisnMr2b2bh4nDlmR7LXoiuUWGM199St1xHcgh1+utJ0lAH
	TgnPpgoAo+u4wqtd0gxy/uuDdd0WeRYfnGCoQ4Y8l+sBH0sU2As3zdADTCrY/OCcQrt25p19PfAs1
	Ia6CaO+xPK7Uik3rMpTB1FJgU8dSXCgJ5/Akbt4dLzp3c1kbllEv4Z2L1knwtl5RQu9gMNzI/txY+
	wPp0rSXDqg9cayPUNexFfLTweazbDi6w+2A10LIN9v0PfL+8QD3Tnhu1UtkU6Oi7NrVGxq6segfsJ
	6iXlzewIeeQ5HuX58yJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMm6W-00000009tfZ-3uFl;
	Thu, 27 Jun 2024 10:11:48 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMm6B-00000009tVI-2rRf
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 10:11:29 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-1fab50496f0so1399755ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 03:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719483086; x=1720087886; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nhaug2EPx+qEgt62m3ojcCaUyh05yCww5PDEVq+nvig=;
        b=bm8jLcjU/SxFJOVO6H7SbmZFjJzwuh+zUV94YueOuPj2zWPvYjRBPNIsQhoLacZIQ/
         ad8qiEjRr24Uldi42ndaIOZ8I6mWZxXT+VcntfaJz6S3muB/ZzLHHjt0csXCr2RMXez4
         MqsiQGA/tOzy1puPPUlgsZd62lCViuKQDlTujl3YN92L+Q+UFv5GVO4JMpRKSINFCtgU
         8kCsEE+Llf7diEo/ZFT2R9UEK7Gk0YH9JjQq40Gz5VQHqyqQvh7AEhZtnmcw6zx47ncz
         PKNNdCRtAg6Qq0AX18HvvcB4cO6FL454DdErRVi5+Ujtj562xuOjrQhI9c1Vd5ihiaCA
         4Khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719483086; x=1720087886;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nhaug2EPx+qEgt62m3ojcCaUyh05yCww5PDEVq+nvig=;
        b=SIme32M63FzNt0vwwu3hhakBJVFc71J8QwjjydNDLy/O9o8wHeGEXpXChDNTqZgLyF
         8XrwiZfzhn5z7pdDnn2+eWSIzeP5gReu2bEiq8DENB8LBJyR74rEcmHVoP+cvZjeSHFp
         66Bl7f9aQJYFgnB+7fR8a1h+u3Un2oveqjvCUgqV5r3HaUQck/xM+4oO1v2qy3kBsgnd
         EEzDItvxJrwdsXlVVmuYlhDqonGz1t7UMr3o1yEX6OIFWBoUHLkPODwqp1vR+Zwe/W4w
         WcwbrboqJ7exd0WKKsY8zAzsnX6V9dPeiskr6/Ym0A89NLbDiOaGb8BCm0USj2itiA7j
         irRw==
X-Forwarded-Encrypted: i=1; AJvYcCXQvv31SdnNuNYhPQgY6KQxHfOtjMJ5yZ+4OTIsZ0QNiYie40XZjydl6dSdIBtZopiju+65q4k7pMZTfQt11QgJfZ2mk+E4cDhWRx6+37LO
X-Gm-Message-State: AOJu0YyYXochs0VE6E5QDv1GrhfhnmwpnoMzF1X/0uTPQ8kV90k2X4hT
	MFyg3nBLIqZ9iDpcXnzNlkVFsQ4711UN9WrDx3FTwhzBZvG13VaM
X-Google-Smtp-Source: AGHT+IFL/5dOdrZlFA7z1Hme4OgjQs+yGKzHZKmAuRfJKku11yeI6TkI4Fbw35ApU3NgfKrtdnA0IQ==
X-Received: by 2002:a17:902:6bc3:b0:1f8:68b8:3736 with SMTP id d9443c01a7336-1fa23f89653mr94251095ad.35.1719483086201;
        Thu, 27 Jun 2024 03:11:26 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac8e194asm9744445ad.11.2024.06.27.03.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 03:11:25 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <ccf089fd-613d-475c-aeb1-8abc92873a90@gmail.com>
Date: Thu, 27 Jun 2024 18:11:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
Content-Language: en-GB-large
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andreas Schwab <schwab@suse.de>, David Laight <David.Laight@aculab.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Ivan A. Melnikov" <iv@altlinux.org>
References: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
 <20240627071422.GA2626@altlinux.org>
 <9c102328-6bb3-46b6-bc2f-d011a284d5b0@gmail.com>
 <CA+FstbVf7TJx==WsY5fBoFrdeY8php5ETn8kMq5s6YScy-2O=A@mail.gmail.com>
In-Reply-To: <CA+FstbVf7TJx==WsY5fBoFrdeY8php5ETn8kMq5s6YScy-2O=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_031127_749933_0E55C320 
X-CRM114-Status: GOOD (  27.57  )
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

Ck9uIDIwMjQtMDYtMjcgMTc6NDMsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gT24gVGh1LCBKdW4g
MjcsIDIwMjQgYXQgOTo0N+KAr0FNIENlbGVzdGUgTGl1IDxjb2VsYWNhbnRodXNoZXhAZ21haWwu
Y29tPiB3cm90ZToKPj4KPj4gT24gMjAyNC0wNi0yNyAxNToxNCwgRG1pdHJ5IFYuIExldmluIHdy
b3RlOgo+Pgo+Pj4gSGksCj4+Pgo+Pj4gT24gVHVlLCBBdWcgMDEsIDIwMjMgYXQgMTA6MTU6MTZQ
TSArMDgwMCwgQ2VsZXN0ZSBMaXUgd3JvdGU6Cj4+Pj4gV2hlbiB3ZSB0ZXN0IHNlY2NvbXAgd2l0
aCA2LjQga2VybmVsLCB3ZSBmb3VuZCBlcnJubyBoYXMgd3JvbmcgdmFsdWUuCj4+Pj4gSWYgd2Ug
ZGVueSBORVRMSU5LX0FVRElUIHdpdGggRUFGTk9TVVBQT1JULCBhZnRlciBmMGJkZGY1MDU4NmQs
IHdlIHdpbGwKPj4+PiBnZXQgRU5PU1lTIGluc3RlYWQuIFdlIGdvdCBzYW1lIHJlc3VsdCB3aXRo
IGNvbW1pdCA5YzI1OThkNDM1MTAgKCJyaXNjdjoKPj4+PiBlbnRyeTogU2F2ZSBhMCBwcmlvciBz
eXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkiKS4KPj4+Pgo+Pj4+IEFmdGVyIGFuYWx5c2lu
ZyBjb2RlLCB3ZSB0aGluayB0aGF0IHJlZ3MtPmEwID0gLUVOT1NZUyBzaG91bGQgb25seSBiZQo+
Pj4+IGV4ZWN1dGVkIHdoZW4gc3lzY2FsbCAhPSAtMS4gSW4gX19zZWNjb21wX2ZpbHRlciwgd2hl
biBzZWNjb21wIHJlamVjdGVkCj4+Pj4gdGhpcyBzeXNjYWxsIHdpdGggc3BlY2lmaWVkIGVycm5v
LCB0aGV5IHdpbGwgc2V0IGEwIHRvIHJldHVybiBudW1iZXIgYXMKPj4+PiBzeXNjYWxsIEFCSSwg
YW5kIHRoZW4gcmV0dXJuIC0xLiBUaGlzIHJldHVybiBudW1iZXIgaXMgZmluYWxseSBwYXNzIGFz
Cj4+Pj4gcmV0dXJuIG51bWJlciBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlLCBhbmQg
dGhlbiBpcyBjb21wYXJlZCB3aXRoCj4+Pj4gTlJfc3lzY2FsbHMgYWZ0ZXIgY29udmVydGVkIHRv
IHVsb25nIChzbyBpdCB3aWxsIGJlIFVMT05HX01BWCkuIFRoZQo+Pj4+IGNvbmRpdGlvbiBzeXNj
YWxsIDwgTlJfc3lzY2FsbHMgd2lsbCBhbHdheXMgYmUgZmFsc2UsIHNvIHJlZ3MtPmEwID0gLUVO
T1NZUwo+Pj4+IGlzIGFsd2F5cyBleGVjdXRlZC4gSXQgY292ZXJlZCBhMCBzZXQgYnkgc2VjY29t
cCwgc28gd2UgYWx3YXlzIGdldAo+Pj4+IEVOT1NZUyB3aGVuIG1hdGNoIHNlY2NvbXAgUkVUX0VS
Uk5PIHJ1bGUuCj4+Pj4KPj4+PiBGaXhlczogZjBiZGRmNTA1ODZkICgicmlzY3Y6IGVudHJ5OiBD
b252ZXJ0IHRvIGdlbmVyaWMgZW50cnkiKQo+Pj4+IFJlcG9ydGVkLWJ5OiBGZWxpeCBZYW4gPGZl
bGl4b25tYXJzQGFyY2hsaW51eC5vcmc+Cj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBSdWl6aGUgUGFu
IDxjMTQxMDI4QGdtYWlsLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBSdWl6aGUgUGFuIDxjMTQx
MDI4QGdtYWlsLmNvbT4KPj4+PiBDby1kZXZlbG9wZWQtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBp
c3JjLmlzY2FzLmFjLmNuPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBp
c3JjLmlzY2FzLmFjLmNuPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENlbGVzdGUgTGl1IDxDb2VsYWNh
bnRodXNIZXhAZ21haWwuY29tPgo+Pj4+IFRlc3RlZC1ieTogRmVsaXggWWFuIDxmZWxpeG9ubWFy
c0BhcmNobGludXgub3JnPgo+Pj4+IFRlc3RlZC1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Cj4+Pj4gUmV2aWV3ZWQtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4+PiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8
Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+Pj4gLS0tCj4+Pj4KPj4+PiB2NCAtPiB2NTogYWRkIFRlc3Rl
ZC1ieSBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2Fs
LmNvbT4KPj4+PiB2MyAtPiB2NDogdXNlIGxvbmcgaW5zdGVhZCBvZiB1bG9uZyB0byByZWR1Y2Ug
dHlwZSBjYXN0IGFuZCBhdm9pZAo+Pj4+ICAgICAgICAgICBpbXBsZW1lbnRhdGlvbi1kZWZpbmVk
IGJlaGF2aW9yLCBhbmQgbWFrZSB0aGUganVkZ21lbnQgb2Ygc3lzY2FsbAo+Pj4+ICAgICAgICAg
ICBpbnZhbGlkIG1vcmUgZXhwbGljaXQKPj4+PiB2MiAtPiB2MzogdXNlIGlmLXN0YXRlbWVudCBp
bnN0ZWFkIG9mIHNldCBkZWZhdWx0IHZhbHVlLAo+Pj4+ICAgICAgICAgICBjbGFyaWZ5IHRoZSB0
eXBlIG9mIHN5c2NhbGwKPj4+PiB2MSAtPiB2MjogYWRkZWQgZXhwbGFuYXRpb24gb24gd2h5IGFs
d2F5cyBnb3QgRU5PU1lTCj4+Pj4KPj4+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDYg
KysrLS0tCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4+PiBpbmRleCBmOTEwZGZjY2JmNWQyLi43MjlmNzlj
OTdlMmJmIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4+PiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+Pj4gQEAgLTI5Nyw3ICsyOTcsNyBAQCBh
c21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfYnJlYWsoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCj4+Pj4gIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0
aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pj4+ICB7Cj4+
Pj4gICAgICBpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4+Pj4gLSAgICAgICAgICAgIHVsb25nIHN5
c2NhbGwgPSByZWdzLT5hNzsKPj4+PiArICAgICAgICAgICAgbG9uZyBzeXNjYWxsID0gcmVncy0+
YTc7Cj4+Pj4KPj4+PiAgICAgICAgICAgICAgcmVncy0+ZXBjICs9IDQ7Cj4+Pj4gICAgICAgICAg
ICAgIHJlZ3MtPm9yaWdfYTAgPSByZWdzLT5hMDsKPj4+PiBAQCAtMzA2LDkgKzMwNiw5IEBAIGFz
bWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0
cnVjdCBwdF9yZWdzICpyZWdzKQo+Pj4+Cj4+Pj4gICAgICAgICAgICAgIHN5c2NhbGwgPSBzeXNj
YWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+Pj4+Cj4+Pj4gLSAgICAg
ICAgICAgIGlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4+Pj4gKyAgICAgICAgICAgIGlmIChz
eXNjYWxsID49IDAgJiYgc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgIHN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsKPj4+PiAtICAgICAgICAgICAg
ZWxzZQo+Pj4+ICsgICAgICAgICAgICBlbHNlIGlmIChzeXNjYWxsICE9IC0xKQo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgIHJlZ3MtPmEwID0gLUVOT1NZUzsKPj4+Pgo+Pj4+ICAgICAgICAgICAg
ICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+Pj4KPj4+IFVuZm9ydHVuYXRlbHks
IHRoaXMgY2hhbmdlIGludHJvZHVjZWQgYSByZWdyZXNzaW9uOiBpdCBicm9rZSBzdHJhY2UKPj4+
IHN5c2NhbGwgdGFtcGVyaW5nIG9uIHJpc2N2LiAgV2hlbiB0aGUgdHJhY2VyIGNoYW5nZXMgc3lz
Y2FsbCBudW1iZXIgdG8gLTEsCj4+PiB0aGUga2VybmVsIGZhaWxzIHRvIGluaXRpYWxpemUgYTAg
d2l0aCAtRU5PU1lTIGFuZCBzdWJzZXF1ZW50bHkgZmFpbHMgdG8KPj4+IHJldHVybiB0aGUgZXJy
b3IgY29kZSBvZiB0aGUgZmFpbGVkIHN5c2NhbGwgdG8gdXNlcnNwYWNlLgo+Pgo+PiBJbiB0aGUg
cGF0Y2ggdjIsIHdlIGFjdHVhbGx5IGRvIHRoZSByaWdodCB0aGluZy4gQnV0IGFzIEJqw7ZybiBU
w7ZwZWwncwo+PiBzdWdnZXN0aW9uIGFuZCB3ZSBmb3VuZCBjYXN0IGxvbmcgdG8gdWxvbmcgaXMg
aW1wbGVtZW50YXRpb24tZGVmaW5lZAo+PiBiZWhhdmlvciBpbiBDLCBzbyB3ZSBjaGFuZ2UgaXQg
dG8gY3VycmVudCBmb3JtLiBTbyByZXZlcnQgdGhpcyBwYXRjaCBhbmQKPj4gYXBwbHkgcGF0Y2gg
djIgc2hvdWxkIGZpeCB0aGlzIGlzc3VlLiBQYXRjaCB2MiB1c2VzIHRocyBzYW1lIHdheSB3aXRo
Cj4+IG90aGVyIGFyY2hpdGVjdHVyZXMuCj4+Cj4+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjMwNzE4MTYyOTQwLjIyNjExOC0xLUNvZWxhY2FudGh1c0hleEBnbWFpbC5jb20v
Cj4gCj4gTm90IHJldmVydGluZywgYnV0IGEgZml4IHRvIG1ha2Ugc3VyZSB0aGF0IGEwIGlzIGlu
aXRpYWxpemVkIHRvIC1FTk9TWVMsIGUuZy46CgpPaC4gSSBqdXN0IHdhbnQgdG8gZGVzY3JpYmUg
d2hhdCBjaGFuZ2Ugd2UgbmVlZCwgbm90IHRvIHNheSBhY3R1YWwgJ2dpdCByZXZlcnQnLgoKPiAK
PiAtLTg8LS0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMKPiBpbmRleCAwNWExNmIxZjBhZWUuLjUxZWJmZDIzZTAwNyAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHMuYwo+IEBAIC0zMTksNiArMzE5LDcgQEAgdm9pZCBkb190cmFwX2VjYWxs
X3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gCj4gICByZWdzLT5lcGMgKz0gNDsKPiAgIHJlZ3Mt
Pm9yaWdfYTAgPSByZWdzLT5hMDsKPiArIHJlZ3MtPmEwID0gLUVOT1NZUzsKPiAKPiAgIHJpc2N2
X3ZfdnN0YXRlX2Rpc2NhcmQocmVncyk7Cj4gCj4gQEAgLTMyOCw4ICszMjksNyBAQCB2b2lkIGRv
X3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAKPiAgIGlmIChzeXNjYWxsID49
IDAgJiYgc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQo+ICAgc3lzY2FsbF9oYW5kbGVyKHJlZ3MsIHN5
c2NhbGwpOwo+IC0gZWxzZSBpZiAoc3lzY2FsbCAhPSAtMSkKPiAtIHJlZ3MtPmEwID0gLUVOT1NZ
UzsKPiArCj4gICAvKgo+ICAgKiBVbHRpbWF0ZWx5LCB0aGlzIHZhbHVlIHdpbGwgZ2V0IGxpbWl0
ZWQgYnkgS1NUQUNLX09GRlNFVF9NQVgoKSwKPiAgICogc28gdGhlIG1heGltdW0gc3RhY2sgb2Zm
c2V0IGlzIDFrIGJ5dGVzICgxMCBiaXRzKS4KPiAtLTg8LS0KClRoaXMgaXMgYWxzbyB3aGF0IEkg
dGhpbmsuCgo+IENlbGVzdGUsIGRvIHlvdSB3YW50IHRvIGNvb2sgdGhhdCBmaXggcHJvcGVybHk/
CgpZZWFoLiBJIHdpbGwgc2VudCBwYXRjaCB0byBtYWlsIGxpc3Qgc29vbi4KCj4gCj4gCj4gQmrD
tnJuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
