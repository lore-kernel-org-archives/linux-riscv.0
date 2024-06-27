Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A3CC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irgfgJ4f6M92g7bu/4MWkzHF/MukFs7Deu/QtmEjNdo=; b=KBh8DxfI/770xs
	E+xz6QDHpd+hbYTJABxiqd+f1upiYkigprmrbW7bl/zYhbhUT0VEyWEQda//aWJGQTRRTp+R2NNm5
	2eebUT2jn/za73n1siEw4iE8O8a+4XePbO5XwWJK9ozukIJTI7V7lR+BU9iYOgDpy/tGRvl4cmScC
	kzumIUDOBAYYDg7pr43EAQwCQFl2QUzsCfE6mkTQumlQ5svyYNcfElY1YmP890me7EeQrYaP9pxqo
	yzoMeJjjhTtlru9N+uBUfMDmHR6qYzZQQtyY3+LA9lSwnhGr7466j/Y4c9pTFOvzcNCDrQCxnLXst
	xKpMW1o+dbXYPu16O3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmWa-00000009znP-2DFg;
	Thu, 27 Jun 2024 10:38:44 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmW0-00000009zax-2luf
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 10:38:21 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-7226821ad86so2101644a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 03:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719484688; x=1720089488; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VP116iJGPVlyOU9i7r1chrOZ2teOoateaPGqU1Fh3fA=;
        b=Jy9F7AAlNd+N/CvtvD8lHtWwqLKt8aHi1sbgbKIjLHoyrETXE7Hl6PIWQyp0j9Jpfz
         Ne3zLMOGeaGs+tfXfL7v/9yODM8gzq786r6jivuWLY2hqUkp35kyGwq/pL3BJr13nfEv
         Zpg5hxFfBmmNDcEmAqr+8MW47FwMz2sVH3N2iCtE6yGfHCxL6Ct++CJ0oDvu14ThQKQZ
         VTOhDvDksJXg4bFgVNxxo33xVAYhHkEnG9yqSVuiyio8uOxC4dgww6eVRtdTwIMJgC1s
         BUb3ySmiD77NVCmfKr7QMEOTJFHcMx1aBa4T52vUou2ElIz1S2UIHisbmky2Y8unsJxF
         hoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484688; x=1720089488;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VP116iJGPVlyOU9i7r1chrOZ2teOoateaPGqU1Fh3fA=;
        b=sfcjMnzNnRwKaag6yo8uYvn8qYGDULN6FWmUt1MgratQY9DSCPtYpMkfT60lDNaAiz
         8chd9afh/nkCNEQoD7SISeUZ0oFHC4QBFyxw6eKkKhr/UcfFbRnOHBMhP9ymZ92CV0KC
         EXveXVtmZe2oL0MfdWgMhCmNOa3HTXi5sWgh+xmf+Ci7ALpb9Qv/2O/qNTgc523pZ2Yt
         xCMxNepxSsFQXH0NQSkXU4OMCPT2KUtF07PoInpKzN5RwR+s3vJpP/jD10zuuyNrzGHK
         tr6aVJ6FXm6z2NR0IiNk9aW2baFPqiqLSbYPJhciNkxSi3oCuxbqCDoNi/gFHifckFwA
         E9fg==
X-Forwarded-Encrypted: i=1; AJvYcCWo4cH78qJ9kmA/Wj9pEn1nPGD8MF7THgXemQTdaA98l1gdZWiN25FWcKxu/KO7SGgEl45DSjrkbLx8T1Rn8g+OCsJWXnI0ukFRe7M14TSQ
X-Gm-Message-State: AOJu0Yy9ZEZD21EhBeEkxF0yHwlOhEQfhO1mIkhneQgpyO5nYnp/Aft0
	wjTAh1jJamVC+p0XjA2opO20omzeitDY36JAof6ifrQ942jBWVoZ
X-Google-Smtp-Source: AGHT+IFk0Amdhpf4cK0iUI4x3T9hkQpae0MzhAzCcaQlXIdwTZ4OZp2YM86yegLigF9y+e3nhCl4WA==
X-Received: by 2002:a05:6a21:19b:b0:1b5:44eb:2eda with SMTP id adf61e73a8af0-1bcf7e6a28amr14131000637.5.1719484687761;
        Thu, 27 Jun 2024 03:38:07 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac8fcd45sm10248005ad.116.2024.06.27.03.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 03:38:07 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <d16afaac-2eeb-4b43-b2bb-4d2282b9f97f@gmail.com>
Date: Thu, 27 Jun 2024 18:38:01 +0800
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
X-CRM114-CacheID: sfid-20240627_033819_067733_DDED597B 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyNC0wNi0yNyAxNzo0MywgQmrDtnJuIFTDtnBlbCB3cm90ZToKCj4gT24gVGh1LCBKdW4g
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
aXRpYWxpemVkIHRvIC1FTk9TWVMsIGUuZy46Cj4gCj4gLS04PC0tCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gaW5k
ZXggMDVhMTZiMWYwYWVlLi41MWViZmQyM2UwMDcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtMzE5
LDYgKzMxOSw3IEBAIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+
IAo+ICAgcmVncy0+ZXBjICs9IDQ7Cj4gICByZWdzLT5vcmlnX2EwID0gcmVncy0+YTA7Cj4gKyBy
ZWdzLT5hMCA9IC1FTk9TWVM7Cj4gCj4gICByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpOwo+
IAo+IEBAIC0zMjgsOCArMzI5LDcgQEAgdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MpCj4gCj4gICBpZiAoc3lzY2FsbCA+PSAwICYmIHN5c2NhbGwgPCBOUl9zeXNjYWxs
cykKPiAgIHN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsKPiAtIGVsc2UgaWYgKHN5c2Nh
bGwgIT0gLTEpCj4gLSByZWdzLT5hMCA9IC1FTk9TWVM7Cj4gKwo+ICAgLyoKPiAgICogVWx0aW1h
dGVseSwgdGhpcyB2YWx1ZSB3aWxsIGdldCBsaW1pdGVkIGJ5IEtTVEFDS19PRkZTRVRfTUFYKCks
Cj4gICAqIHNvIHRoZSBtYXhpbXVtIHN0YWNrIG9mZnNldCBpcyAxayBieXRlcyAoMTAgYml0cyku
Cj4gLS04PC0tCj4gCj4gQ2VsZXN0ZSwgZG8geW91IHdhbnQgdG8gY29vayB0aGF0IGZpeCBwcm9w
ZXJseT8KClBhdGNoIGhhcyBiZWVuIHNlbnQuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNDA2MjcxMDMyMDUuMjc5MTQtMi1Db2VsYWNhbnRodXNIZXhAZ21haWwuY29tLwoKQW5kIGxp
bnV4LXJpc2N2IG1haWwgbGlzdCBwcm9ibGFibHkgaGFzIHNvbWUgaXNzdWU6IHRoZXJlIGFyZSB0
d28gY29waWVzCm9mIHBhdGNoLCBvcmdpbmFsIG9uZSBhbmQgYW5vdGhlciBvbmUgd2l0aCBsaW51
eC1yaXNjdiBmb290LgoKPiAKPiAKPiBCasO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
