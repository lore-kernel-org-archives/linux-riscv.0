Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D93C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 22:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPjz6hQY/RLYJVhLuIxygVmi/1MVPLyNTGzDytxkIIg=; b=J9YqNbQqrcAzq9
	DV7ZIujzcdyTS2FqbcFfe9/+FOa5wFnvX6wgQnKvTUE2oeIbTz+WokSkeKESSom3DCxNwDqxmpJTk
	A9zXQBOxdQcD+cBYyP8/sn2SQAd1Ao+sRamKpo3TkSIFc8PTXC0TgLNXL9Ufqxg+qjp8URELlYciY
	EY/nWWmXVHDsBIK5C1jYYuAx7iC4/zU7dAVuURcdUuCVQAzm8peGRbf5bWnkWK6rR54pUHiH2fOww
	s/kmoKpr0x9RV/Ho15eI01ela2KxRSpGveADuf0YO2ezPx6em0MRvpzonJM1BWiTwhntgkSd8Ciry
	0LOcsNSiUfBFTkEAeMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmLJX-0000000ALvh-36H0;
	Mon, 18 Mar 2024 22:18:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmLJU-0000000ALv0-1x4Z
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 22:18:38 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e6aaa2f02cso3760494b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 15:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710800314; x=1711405114; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ILYPvp8Ak4s9l6tgpwG+m1fN8r//ZZrkBh7CU9o4fKU=;
        b=2DlHvn39iyjOfhbzF3JCDzgfrvJQiRr898OvuWtX0wcNubqgbJg8MLa245Fm7YYd9l
         fdrcGcHSz63JupLqZlf1ECYxz2hk8nB05GulAkvSSbL1kEP/yPUkLbos+5Yn8MJ/cGD3
         52OQtrE6oNAVtyjgadd2Rb7euwKiFBVnGfAyX5HhDmLAq8XpCErQh1tWhGJIqR3p6CDQ
         egDywX/Ld/HDoOnzKOzGUQ2UB1n5IbsZ7o3MTdxWcJ9DdR8skpiFAljmSwujy93UUaM6
         cRO6LK4LXat5BVa6sPIA+rmmmsYI8DhKbaTIU3/RAyOgd2Qex6uUkmeA1a/DWIxi0sa2
         KdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710800314; x=1711405114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILYPvp8Ak4s9l6tgpwG+m1fN8r//ZZrkBh7CU9o4fKU=;
        b=DoePvx4bqfgBZTBPXjIDFTPd/6RPiflmwDlT+n9MMJrOSaKMYI8Q4lOBFUCCmXdU4K
         fU/LZEyYR9qcF5rYjK9wAkWTQsgt98oodV5z4WH3PE4QIazm7XZYQpiNhpRryHaligqt
         g5f4Wmb3VqvQMCaib3k7ed4P8DNKDxw25Tf3r9pStWXewVNFL0loqmV4A9vzG2X+iGfv
         7YajW2HWrc5pfrDf1USsC+Og1z3BhFUN72wMhFuxZOYJJiZ+qBbIcWL7pvGg54i85wHF
         cmWmTYXm0xPZiQw4XIC7YtElbvHKM66D+dnuqDK5fAa6z4yg0mqaj/ESH5itvAYUGKOs
         iIYQ==
X-Gm-Message-State: AOJu0YxO5N+glO/x+z8FIHBDp+gwolYIYAVHhBkig5xlkQ+RkFE7W30V
	1cA85tWgPp6r5VG7f8vxwAE+FQvcJPPdqxGfhvebHu8YwlvRnK15eNARhNtO02R2+4cMsTjTzoT
	V
X-Google-Smtp-Source: AGHT+IFsHy5yD+gzr39EKHXxtIh2X0j/TH5JyFYWV2ry7g07iQU0IDOlZtz6sT6u/sCTkpZbAgH2CA==
X-Received: by 2002:a05:6a00:99c:b0:6e6:976d:7f53 with SMTP id u28-20020a056a00099c00b006e6976d7f53mr1159736pfg.16.1710800313994;
        Mon, 18 Mar 2024 15:18:33 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::546? ([2601:647:4180:9630::546])
        by smtp.gmail.com with ESMTPSA id a5-20020aa78e85000000b006e6857da474sm8607252pfr.178.2024.03.18.15.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 15:18:33 -0700 (PDT)
Message-ID: <03e5da66-d2ee-482c-9fdd-333f18ca90a1@rivosinc.com>
Date: Mon, 18 Mar 2024 15:18:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISC-V PMU driver issue
Content-Language: en-US
To: =?UTF-8?B?6Zu35Y2a5ra1?= <garthlei@pku.edu.cn>,
 Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org
References: <CC51D53B-846C-4D81-86FC-FBF969D0A0D6@pku.edu.cn>
 <CAOnJCUK7OMq97y__M98G1r24zQFQbkyNgxrVdj5tVFJF6znXrA@mail.gmail.com>
 <022728E0-4238-4EC4-A6CC-71C62E114019@pku.edu.cn>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <022728E0-4238-4EC4-A6CC-71C62E114019@pku.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_151836_637092_535D5165 
X-CRM114-Status: GOOD (  30.53  )
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

T24gMy8xMi8yNCAyMToyOSwg6Zu35Y2a5ra1IHdyb3RlOgo+IFNvcnJ5IGZvciB0aGUgZHVwbGlj
YXRlZCBtZXNzYWdlLiBUaGUgbGFzdCBvbmUgd2FzIGFuIEhUTUwgZS1tYWlsIHNvIEkgcmVzZW5k
IHRoaXMuCj4gCj4+IDIwMjTlubQz5pyIMTPml6UgMDg6MDLvvIxBdGlzaCBQYXRyYSA8YXRpc2hw
QGF0aXNocGF0cmEub3JnPiDlhpnpgZPvvJoKPj4KPj4gT24gVHVlLCBGZWIgMjcsIDIwMjQgYXQg
Nzo0OeKAr1BNIOmbt+WNmua2tSA8Z2FydGhsZWlAcGt1LmVkdS5jbj4gd3JvdGU6Cj4+Pgo+Pj4g
SGkgYWxsLAo+Pj4KPj4+IEkgYW0gaGF2aW5nIHByb2JsZW1zIHdpdGggdGhlIFJJU0MtViBQTVUg
ZHJpdmVyLiBUaGUgb3ZlcmZsb3cgaGFuZGxlciBvZiBteSBjdXN0b20gcGVyZiBldmVudCBrZXJu
ZWwgY291bnRlciBzZWVtcyB0byByZWFkIGFuIGluY29ycmVjdCB2YWx1ZSBmcm9tIHRoZSBldmVu
dC4KPj4KPj4gSWYgSSB1bmRlcnN0YW5kIHlvdSBjb3JyZWN0bHksIHlvdSBoYXZlIGEgY3VzdG9t
IGtlcm5lbCBjb3VudGVyIGZvcgo+PiB0aGUgcGVyZiBldmVudCA/IENhbiB5b3UgZXhwbGFpbiB0
aGUgdXNlIGNhc2UgZm9yIHRoYXQgPwo+IAo+IEFjdHVhbGx5IGl0IHdhcyB0aGUgcGVyZi1ldmVu
dCBiYWNrZW5kIG9mIGFuIG9wZW4tc291cmNlIHRvb2wgY2FsbGVkIFBNQ1RyYWNrIChodHRwczov
L2dpdGh1Yi5jb20vamNzYWV6YWwvcG1jdHJhY2spLCB3aGljaCBJIHdhcyB0cnlpbmcgdG8gcG9y
dCB0byBSSVNDLVYuIEl0IGNyZWF0ZXMgYSBrZXJuZWwgY291bnRlciB1c2luZyBgcGVyZl9ldmVu
dF9jcmVhdGVfa2VybmVsX2NvdW50ZXJgLCByZWdpc3RlcmluZyBhbiBvdmVyZmxvdyBoYW5kbGVy
LiBUaGUgcmVnaXN0ZXJlZCBvdmVyZmxvdyBoYW5kbGVyIGNhbGxzIGBwZXJmX2V2ZW50X3JlYWRf
dmFsdWVgIHRvIHJlYWQgdGhlIGNvdW50ZXIgdmFsdWUuCj4gCgpUaGFua3MuIEl0IG1ha2VzIHNl
bnNlIG5vdy4KCj4+Cj4+PiBJdCBzZWVtcyB0aGF0IHRoZSBpc3N1ZSBsaWVzIGluIHRoZSBmdW5j
dGlvbiBgcmlzY3ZfcG11X2V2ZW50X3NldF9wZXJpb2RgLCB3aGljaCBzZXRzIGBwcmV2X2NvdW50
YCB0byBhIG5ldyB2YWx1ZSBidXQgZG9lcyBub3QgbW9kaWZ5IHRoZSB1bmRlcmx5aW5nIGhhcmR3
YXJlIGNvdW50ZXIuIFdoZW4gYHBlcmZfZXZlbnRfcmVhZF92YWx1ZWAgZ2V0cyBjYWxsZWQgbGF0
ZXIgaW4gdGhlIHVzZXItZGVmaW5lZCBvdmVyZmxvdyBoYW5kbGVyLCBgcmlzY3ZfcG11X2V2ZW50
X3VwZGF0ZWAgd2lsbCB1cGRhdGUgdGhlIGBjb3VudGAgZmllbGQgYWdhaW4gYmFzZWQgb24gdGhl
IHVubW9kaWZpZWQgaGFyZHdhcmUgY291bnRlciB2YWx1ZSBhbmQgdGhlIG1vZGlmaWVkIGBwcmV2
X2NvdW50YCBmaWVsZCwgd2hpY2ggY2F1c2VzIGFuIGluY29ycmVjdCByZWFkaW5nLgo+Pgo+PiBX
aGF0IGRvIHlvdSBtZWFuIGJ5IHVzZXIgZGVmaW5lZCBvdmVyZmxvdyBoYW5kbGVyID8gVGhlIG92
ZXJmbG93Cj4+IGhhbmRsZXIgcmVnaXN0ZXJlZCB2aWEgdGhlIGN1c3RvbSBwZXJmIGV2ZW50IGtl
cm5lbCBjb3VudGVyIHdoaWNoIGdldHMKPj4gaW52b2tlZCBmcm9tIHBlcmZfZXZlbnRfb3ZlcmZs
b3cgPwo+IAo+IFllcy4KPiAKPj4KPj4+IEkgbm90aWNlZCB0aGF0IG90aGVyIFBNVSBkcml2ZXJz
LCBzdWNoIGFzIHRoZSBBUk0gb25lLCB3cml0ZSB0byB0aGUgdW5kZXJseWluZyBjb3VudGVyIGlu
IHRoZWlyIHNldF9wZXJpb2QgZnVuY3Rpb25zLCB3aGljaCBwcmV2ZW50cyB0aGUgcHJvYmxlbS4g
SG93ZXZlciwgdGhlIFJJU0MtViBTQkkgc3BlY2lmaWNhdGlvbiBkb2VzIG5vdCBoYXZlIHN1Y2gg
YW4gQVBJIHRvIHdyaXRlIHRvIGEgY291bnRlciB3aXRob3V0IHN0YXJ0aW5nIGl0LiBVc2luZyBg
bG9jYWw2NF9yZWFkKCZod19ldnQtPnBlcmlvZF9sZWZ0KSA8PSAwYCBkaXJlY3RseSBhcyB0aGUg
Z3VhcmQgY29uZGl0aW9uIHRvIHBsYWNlIGByaXNjdl9wbXVfZXZlbnRfc2V0X3BlcmlvZChldmVu
dClgIGFmdGVyIGl0IHNlZW1zIHRvIHdvcmssIGJ1dCBJIGFtIG5vdCBzdXJlIHdoZXRoZXIgaXQg
Y2FuIGNhdXNlIG90aGVyIGlzc3Vlcy4KPj4KPj4gTm90IHN1cmUgdGhlIGV4YWN0IGNvZGUgcGF0
aCB5b3UgYXJlIHJlZmVycmluZyB0by4gWW91IGRvbid0IHdhbnQgdG8KPj4gaW52b2tlICByaXNj
dl9wbXVfZXZlbnRfc2V0X3BlcmlvZCBpZiBwZXJpb2RfbGVmdCA8PSAwID8KPiAKPiBGaXJzdCwg
YHBtdV9zYmlfb3ZmX2hhbmRsZXJgIGNhbGxzIGByaXNjdl9wbXVfZXZlbnRfdXBkYXRlYCwgc28g
dGhlIHBlcmYgZXZlbnQgY291bnRlciB2YWx1ZSAoYGV2ZW50LT5jb3VudGApIGlzIHVwZGF0ZWQu
IEl0IGNhbGxzIGByaXNjdl9wbXVfZXZlbnRfc2V0X3BlcmlvZGAgbGF0ZXIsIHdoaWNoIGNhbGxz
IGBsb2NhbDY0X3NldCgmaHdjLT5wcmV2X2NvdW50LCAodTY0KS1sZWZ0KWAuIFdoZW4gYHBlcmZf
ZXZlbnRfcmVhZF92YWx1ZWAgZ2V0cyBpbnZva2VkIGluIHRoZSByZWdpc3RlcmVkIG92ZXJmbG93
IGhhbmRsZXIsIGByaXNjdl9wbXVfZXZlbnRfdXBkYXRlYCB3aWxsIGJlIGludm9rZWQgZXZlbnR1
YWxseS4gQmVjYXVzZSBgcHJldl9jb3VudGAgaGFzIGJlZW4gc2V0IHRvIGAodTY0KS1sZWZ0YCBh
bmQgdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUgY291bnRlciB2YWx1ZSAodGhlIHZhbHVlIHJlYWQg
dmlhIGBydnBtdS0+Y3RyX3JlYWQoZXZlbnQpYCkgaGFzIG5vdCBiZWVuIGNoYW5nZWQsIGBldmVu
dC0+Y291bnRgIHdpbGwgYmUgdXBkYXRlZCBhZ2FpbiwgYW5kIHRoZSB2YWx1ZSB0aGlzIHRpbWUg
d2lsbCBiZSBpbmNvcnJlY3QuCgpHb3QgaXQuIFRoaXMgaXMgYSBnZW51aW5lIGlzc3VlLiBJIGNh
biByZXByb2R1Y2UgaXQgYXMgd2VsbCB3aXRoIGt2bSBwbXUgCnN1cHBvcnQgYXMgaXQgY3JlYXRl
cyBhIGtlcm5lbCBwZXJmIGV2ZW50IGFzIHdlbGwuCgo+IAo+IEkgaGF2ZSBmb3VuZCB0aGF0IHRo
ZSBBUk0gUE1VIGRvZXMgbm90IGhhdmUgdGhlIHByb2JsZW0uIFRoZSBmdW5jdGlvbiBgYXJtcG11
X2V2ZW50X3NldF9wZXJpb2RgIGluIGBhcm1fcG11LmNgIGNhbGxzIGBhcm1wbXUtPndyaXRlX2Nv
dW50ZXIoZXZlbnQsICh1NjQpKC1sZWZ0KSAmIG1heF9wZXJpb2QpYCBhZnRlciBgbG9jYWw2NF9z
ZXQoJmh3Yy0+cHJldl9jb3VudCwgKHU2NCktbGVmdClgLCBzbyB0aGF0IHRoZSB1bmRlcmx5aW5n
IGhhcmR3YXJlIGNvdW50ZXIgaXMgYWxzbyBzZXQgdG8gYSBuZXcgdmFsdWUuIFRodXMsIHdoZW4g
YGFybXBtdV9ldmVudF91cGRhdGVgIGdldHMgY2FsbGVkIGxhdGVyIGluIHRoZSByZWdpc3RlcmVk
IGhhbmRsZXIsIGl0IHdpbGwgZmluZCB0aGF0IHRoZSB1bmRlcmx5aW5nIGNvdW50ZXIgaGFzIHRo
ZSBzYW1lIHZhbHVlIGFzIGBwcmV2X2NvdW50YCwgc28gYGV2ZW50LT5jb3VudGAgY2FuIGtlZXAg
dGhlIGNvcnJlY3QgdmFsdWUuCj4gCj4gSG93ZXZlciwgYXMgSSBtZW50aW9uZWQgYmVmb3JlLCB0
aGUgUklTQy1WIFNCSSBzcGVjaWZpY2F0aW9uIGRvZXMgbm90IGhhdmUgc3VjaCBhbiBBUEkgYXMg
4oCcd3JpdGVfY291bnRlcizigJ0gc28gdGhlIEFSTSBzb2x1dGlvbiBjb3VsZCBub3QgYmUgYWRh
cHRlZCBlYXNpbHkuIEkgd2FzIHdvbmRlcmluZyBpZiB3ZSBjb3VsZCBwb3N0cG9uZSBgcmlzY3Zf
cG11X2V2ZW50X3NldF9wZXJpb2RgIGFmdGVyIHRoZSBpZi1ibG9jaywgbGlrZSB0aGlzOgo+IAo+
IGBgYAo+IGlmIChsb2NhbDY0X3JlYWQoJmh3X2V2dC0+cGVyaW9kX2xlZnQpIDw9IDApIHsKPiAg
ICBwZXJmX2V2ZW50X292ZXJmbG93KGV2ZW50LCAmZGF0YSwgcmVncyk7Cj4gfQo+IHJpc2N2X3Bt
dV9ldmVudF9zZXRfcGVyaW9kKGV2ZW50KTsKPiBgYGAKPiAKPiBUaGlzIHdheSBgcGVyZl9ldmVu
dF9yZWFkX3ZhbHVlYCBjYW4gcmV0dXJuIHRoZSBjb3JyZWN0IGNvdW50ZXIgdmFsdWUuIGByaXNj
dl9wbXVfZXZlbnRfc2V0X3BlcmlvZGAgZ2V0cyBpbnZva2VkIGFmdGVyIHBlcmZfZXZlbnRfb3Zl
cmZsb3cuIEhvd2V2ZXIsIEkgYW0gbm90IHN1cmUgaWYgaXQgY2FuIGNhdXNlIG90aGVyIHByb2Js
ZW1zLgo+IAoKVGhhdCBzZWVtcyBsaWtlIGEgaGFjay4gSSB0aGluayB3ZSBjYW4gYXZvaWQgdXBk
YXRpbmcgYWdhaW4gYmFzZWQgb24gCnBlcmYgc3RhdGUgd2hpY2ggY2FuIGluZGljYXRlIHRoYXQg
ZXZlbnQtPmNvdW50IGlzIGFscmVhZHkgdXBkYXRlZC4gClRodXMsIG5vIG5lZWQgdG8gdXBkYXRl
IGl0IGFnYWluLiBJIHdpbGwgdG95IGFyb3VuZCB3aXRoIHRoaXMgaWRlYSBhbmQgCmdldCBiYWNr
IHRvIHlvdS4KCj4+Cj4+Pgo+Pj4gVGhhbmsgeW91LAo+Pj4gQm9oYW4gTGVpCj4+Cj4+Cj4+IC0t
IAo+PiBSZWdhcmRzLAo+PiBBdGlzaAo+IAo+IC0tCj4gUmVnYXJkcywKPiBCb2hhbiBMZWkKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
