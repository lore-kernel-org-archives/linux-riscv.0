Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C81AC0219D
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfRwYEOedm1q3IEJQMMBfZGJNvs6wYPbX1cYPXA+Fiw=; b=CEKY6KGeu4xlzn
	S0XcEq/N5onV27/T6ghYMGU0RavFq5H5GEehEtIE8ovLMDrsyOgIV+1LZ3yxeDpRCfkIeea66DT+5
	rp6mpX0O6uY/J4zB63t8AJau+Mijb2+SxX80RqbjYM7MDhpvmCHHiulfPxgO6mTIrD8+DK8XbSjke
	03X8oe+8vA+T8BNuDLKe9JZLmMzCxWS+a5gcZgyyP3n7B6VQRgRtw2AUS8WluW4W+mIj40N+c7Qay
	HJCbPSbRgZXTsxj7ibTQGLgICeVVDxJVIWsfEIlpmkiSTjyOrwiqNLgu+FesxdSMqSb3Lc/9okYK0
	eg3aySPcXny0IF1vVrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaqR-00000001QCO-1hSP;
	Mon, 10 Feb 2025 20:57:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaqP-00000001QAu-1iMS
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:57:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38dd011ff8bso2658919f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739221048; x=1739825848; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDpSBUEru1GjuW8rBX7StgLUADCWp/1IiJrzvyyQuCY=;
        b=Mo/RG/Xh2G7x5FsM4zaGkW1slkL9ck6GL0Z9G5DnQVU1HfZIIGpKBPGl/Fc33dX/Cp
         GFGG8RHqTYzku9PLMIRFGcRJp2AvhQkiHvx/eF64BTNsS4R17It6FGzRByaFzZq/moRw
         BMyfe8WebR7VZHzUdU7r31Ua0fs4ClA4piIXp73dYOXShrvXl8huU6VUAATgxHN7yawB
         /0IQrMgzPmCo3iMLhTb/nvZv4G8j5RN/wGFnRrcawEr3VHj6hinhVVqYplvMnEIz1V6T
         g6lpwWhQ6AgruyfpJQJmxudvZ7yuX/JpZFwzlRSd132v/+tv7jiRqCAkxYmSl3YKukPo
         cabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739221048; x=1739825848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDpSBUEru1GjuW8rBX7StgLUADCWp/1IiJrzvyyQuCY=;
        b=jTl3lmRykhcvZKBcOUUm3QjuRKchjLhXRcoQnOv0nLZDRslVlxtQq6kCdVj2/Q/9wr
         HquY6f47eCq/j+I39zM+wLTrknsWk2cPF3X4qPkWLtKNVJXaL9XuO8MXFbFC4gqZWlu0
         rkcgd2YGLdtKNedqfydVX4BLjb4Qgpi6pLJtIDL6kLmKyXg02vBw6zkksINrbYfyDz2f
         VKTFSkETVYopauyRkmMMrFdJ4w7qJlMAG25U7GnqAFAHFHrYVemjylqF7fZgsTlyXlxN
         KZLrWwl2IrL1wbY8yWj8QbUXfOKDMBD9BMaeDuT7FkaB/ZTtJX7gUluiadr/LajkHapn
         iGXA==
X-Forwarded-Encrypted: i=1; AJvYcCXxkBqnXhoYEVLTb9jU3+Aq9rvpNXg6+VvXlYZgy2YHn+li1PsGlMPVt9nM6SHf75Yyt8azfwMcJSxtdw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy49Y83KNmSP95WQu9+Y5sPpslhAHjeHlLwJzegInwU8buZmTos
	StpH4xNXchTEo+73FH68rsepOpidKLaD6apMzRJZO3Rfajimlre7eAmZV1FmF4M=
X-Gm-Gg: ASbGnctEbJ54lmAzN8zL4iV89xmlB8W+FpvjxIVr6W/1Sm4jSDNOqGj20eUi9D7xYHr
	h4IQeAJOMraAvkqbRXj8IDp9OaR47V6EYG1ReqRV2C+mkw2UUEXno3akA5qiIMRmmIRK36OJIWp
	lSxxLzW7cWmFwc2j41SIsJHP1DazAidbevrDXIpRoq+exquY/IRyPArbN5c6oq1UA5lhZjF3Hn5
	LvhfU+S2YNvQaicGWa3hHQrCoQEMoq8wONAC+mug7b9HIPs+L/tQOdvnZC1/PQ0de139/KsV+I2
	jdCwyQQFHtc4YbQr7TCpzofGJZWl5dIXZYvagzuNGdnQCAOTI2Whnwr23n9v
X-Google-Smtp-Source: AGHT+IE9FXp0xRj66yJcpzXhagu6NIdiDdGVBmnYp/nyc2iynWuLkOdUocKBJA2QhB9wdY+yGkYUeQ==
X-Received: by 2002:adf:e90e:0:b0:38a:41a3:ac4 with SMTP id ffacd0b85a97d-38dc937334bmr9237507f8f.45.1739221047634;
        Mon, 10 Feb 2025 12:57:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43941ddc8e9sm50907695e9.26.2025.02.10.12.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 12:57:26 -0800 (PST)
Message-ID: <fb67c9e8-0de4-4e11-929a-49d36e81a1a2@rivosinc.com>
Date: Mon, 10 Feb 2025 21:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com,
 "palmer@dabbelt.com Anup Patel" <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com> <Z6o1bQLJ8aUyjvrQ@ghost>
 <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com> <Z6pnTG7YoiDW_Gkq@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6pnTG7YoiDW_Gkq@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_125729_466435_B72BD39E 
X-CRM114-Status: GOOD (  36.68  )
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

CgpPbiAxMC8wMi8yMDI1IDIxOjUzLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gTW9uLCBG
ZWIgMTAsIDIwMjUgYXQgMDk6NDI6MjVQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
Pgo+Pgo+PiBPbiAxMC8wMi8yMDI1IDE4OjIwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+PiBP
biBNb24sIEZlYiAxMCwgMjAyNSBhdCAwMzoyMDozNFBNICswMTAwLCBDbMOpbWVudCBMw6lnZXIg
d3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDEwLzAyLzIwMjUgMTU6MDYsIEFuZHJldyBKb25lcyB3
cm90ZToKPj4+Pj4gT24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMTI6MDc6NDBQTSArMDEwMCwgQ2zD
qW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAxMC8wMi8yMDI1IDEx
OjE2LCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4+Pj4+IE9uIFNhdCwgRmViIDgsIDIwMjUgYXQgNjo1
M+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBPbiBGcmksIEZlYiAwNywgMjAyNSBhdCAwNToxOTo0N1BNICswMTAwLCBB
bmRyZXcgSm9uZXMgd3JvdGU6Cj4+Pj4+Pj4+PiBQcm9iaW5nIHVuYWxpZ25lZCBhY2Nlc3NlcyBv
biBib290IGlzIHRpbWUgY29uc3VtaW5nLiBQcm92aWRlIGEKPj4+Pj4+Pj4+IGZ1bmN0aW9uIHdo
aWNoIHdpbGwgYmUgdXNlZCB0byBsb29rIHVwIHRoZSBhY2Nlc3MgdHlwZSBpbiBhIHRhYmxlCj4+
Pj4+Pj4+PiBieSBpZCByZWdpc3RlcnMuIFZlbmRvcnMgd2hpY2ggcHJvdmlkZSB0YWJsZSBlbnRy
aWVzIGNhbiB0aGVuIHNraXAKPj4+Pj4+Pj4+IHRoZSBwcm9iaW5nLgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBUaGUgYWNjZXNzIGNoZWNrZXIgaW4gbXkgZXhwZXJpZW5jZSBpcyBvbmx5IHRpbWUgY29uc3Vt
aW5nIG9uIHNsb3cKPj4+Pj4+Pj4gaGFyZHdhcmUuIEhhcmR3YXJlIHRoYXQgc3VwcG9ydHMgZmFz
dCB1bmFsaWduZWQgYWNjZXNzZXMgaXNuJ3QgcmVhbGx5Cj4+Pj4+Pj4+IGltcGFjdGVkIGJ5IHRo
aXM/IEF2b2lkaW5nIGEgbGlzdCBvZiBoYXJkd2FyZSB0aGF0IGhhcyBzbG93L2Zhc3QKPj4+Pj4+
Pj4gdW5hbGlnbmVkIGFjY2Vzc2VzIGluIHRoZSBrZXJuZWwgd2FzIHRoZSBtYWluIHJlYXNvbiBm
b3IgZHluYW1pY2FsbHkKPj4+Pj4+Pj4gY2hlY2tpbmcuIFdlIGRpZCBpbnRyb2R1Y2UgdGhlIGNv
bmZpZyBvcHRpb24gdG8gY29tcGlsZSB0aGUga2VybmVsIHdpdGgKPj4+Pj4+Pj4gYXNzdW1lZCBz
bG93L2Zhc3QgYWNjZXNzZXMsIHdoaWNoIG9mIGNvdXJzZSBoYXMgdGhlIGRvd25zaWRlIG9mCj4+
Pj4+Pj4+IHJlY29tcGlsaW5nIHRoZSBrZXJuZWwgYW5kIEkgYXNzdW1lIHRoYXQgeW91IGFscmVh
ZHkgY29uc2lkZXJlZCB0aGF0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhlIGtjb25maWcgb3B0aW9uIGRv
ZXMgbm90IGFsaWduIHdpdGggdGhlIHZpc2lvbiBvZiBydW5uaW5nIHRoZSBzYW1lCj4+Pj4+Pj4g
a2VybmVsIGltYWdlIGFjcm9zcyBwbGF0Zm9ybXMuCj4+Pj4+Pgo+Pj4+Pj4gSSdkIHdvdWxkIGJl
IGFkdm9jYXRpbmcgdG8gcmVtb3ZlIGNvbXBpbGUgdGltZSBvcHRpb25zIGFzIHdlbGwgYW5kIHVz
ZQo+Pj4+Pj4gYW5vdGhlciB3YXkgdG8gc2tpcCB0aGUgcHJvYmUgKHNlZSBiZWxvdykuCj4+Pj4+
Pgo+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEluc3RlYWQgb2YgaGF2aW5nIGEgdGFibGUgaW4g
dGhlIGtlcm5lbCwgc29tZXRoaW5nIHRoYXQgd291bGQgYmUgbW9yZQo+Pj4+Pj4+PiBwbGF0Zm9y
bSBhZ25vc3RpYyB3b3VsZCBiZSB0byBoYXZlIGFuIGV4dGVuc2lvbiB0aGF0IHNpZ25hbHMgdGhp
cwo+Pj4+Pj4+PiBpbmZvcm1hdGlvbi4gVGhhdCBzZWVtcyBsaWtlIGl0IHdvdWxkIGFjY29tcGxp
c2ggdGhlIHNhbWUgZ29hbCBhbmQKPj4+Pj4+Pj4gbGV2ZXJhZ2UgdGhlIGV4aXN0aW5nIGluZnJh
c3RydWN0dXJlIGluIHRoZSBrZXJuZWwsIGFsYmVpdCB3aXRoIHRoZSBuZWVkCj4+Pj4+Pj4+IHRv
IG1ha2UgYSBuZXcgZXh0ZW5zaW9uLgo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSU1PLCBleHBl
Y3RpbmcgYW4gSVNBIGV4dGVuc2lvbiB0byBiZSBkZWZpbmVkIGZvciBhbGwgcG9zc2libGUKPj4+
Pj4+PiBtaWNyb2FyY2hpdGVjdHVyYWwgY2hvaWNlcyBpcyBub3QgZ29pbmcgdG8gc2NhbGUgc28g
aXQgaXMgYmV0dGVyCj4+Pj4+Pj4gdG8gaGF2ZSBpbmZyYXN0cnVjdHVyZSBpbiBrZXJuZWwgaXRz
ZWxmIHRvIGluZmVyIG1pY3JvYXJjaGl0ZWN0dXJhbAo+Pj4+Pj4+IGNob2ljZXMgYmFzZWQgb24g
UklTQy1WIGltcGxlbWVudGF0aW9uIElELgo+Pj4+Pj4KPj4+Pj4+IFNpbmNlIGFkZGluZyBhbiBl
eHRlbnNpb24gc2VlbXMgcXVpdGUgdW5saWtlbHksIGFuZCB0aGF0IGEgZGV2aWNlLXRyZWUKPj4+
Pj4+IHByb3BlcnR5IGlzIGxpa2VseSBEVCBjZW50cmljIGFuZCBub3QgYXBwbGljYWJsZSB0byBB
Q1BJIGFzIHdlbGwsIHdhcyBhCj4+Pj4+PiBjb21tYW5kIGxpbmUgYXJndW1lbnQgY29uc2lkZXJl
ZCA/Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBJIGRpZCBjb25zaWRlciBhZGRpbmcgYSBjb21tYW5kIGxp
bmUgb3B0aW9uIGluIGFkZGl0aW9uIHRvIHRoZSB0YWJsZSwKPj4+Pj4gYWxsb3dpbmcgcGxhdGZv
cm1zIHdoaWNoIG5laXRoZXIgaGF2ZSBhIHRhYmxlIGVudHJ5IFt5ZXRdIG5vciB3YW50IHRvIGRv
Cj4+Pj4+IHRoZSBzcGVlZCB0ZXN0LCB0byBzZXQgd2hhdGV2ZXIgdGhleSBsaWtlLiBJbiB0aGUg
ZW5kLCBJIGRyb3BwZWQgaXQsIHNpbmNlCj4+Pj4+IEkgZG9uJ3QgaGF2ZSBhIHVzZSBjYXNlIGF0
IHRoaXMgdGltZS4gSG93ZXZlciwgaWYgd2UgcmVhbGx5IGRvbid0IHdhbnQgYQo+Pj4+PiB0YWJs
ZSwgdGhlbiBJIGNhbiBsb29rIGludG8gdGhlIGNvbW1hbmQgbGluZSBvcHRpb24gaW5zdGVhZC4K
Pj4+Pgo+Pj4+IFNvcnJ5IGlmIEkgd2Fzbid0IGNsZWFyLCBJIHdhc24ndCBjb25zaWRlcmluZyB0
aGlzIGFzIGEgcmVwbGFjZW1lbnQgZm9yCj4+Pj4geW91ciB0YWJsZSBidXQgcmF0aGVyIGFzIGEg
cmVwbGFjZW1lbnQgdG8gQ2hhcmxpZSdzIGNvbXBpbGUgdGltZSBkZWZpbmUKPj4+PiB0byBza2lw
IG1pc2FsaWduZWQgc3BlZWQgcHJvYmluZyBzaW5jZSBpdCBpcyBsaWtlICJscGo9PHg+Ii4gWW91
IGNhbgo+Pj4+IHNwZWNpZnkgaXQgb24gY29tbWFuZCBsaW5lIGlmIHlvdSB3YW50IHRvIHNraXAg
dGhlIGxvb3AgdGltZSBkZXRlY3Rpb24KPj4+PiBvZiBsb29wcyBwZXIgamlmZmllcyBhbmQgaGF2
ZSBmYXN0ZXIgYm9vdC4KPj4+Cj4+PiBKZXNzZSBzZW50IG91dCBhIHBhdGNoIGZvciBhIGtlcm5l
bCBwYXJhbWV0ZXIgdG8gc2V0IHRoZSBhY2Nlc3Mgc3BlZWQgdG8KPj4+IHdoYXRldmVyIGlzIGRl
c2lyZWQgWzFdLgo+Pgo+PiBIZXkgQ2hhcmxpZSwKPj4KPj4gVGhhbmtzIGJ1dCBpdCBzZWVtcyB5
b3UgZm9yZ290IHRvIGFkZCB0aGUgbGluayA/Cj4gCj4gT29wcywgSSBmcmVxdWVudGx5IGRvIHRo
YXQuLi4KPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDgwNTE3
MzgxNi4zNzIyMDAyLTEtamVzc2VAcml2b3NpbmMuY29tLwo+IAo+Pgo+PiBIYXZpbmcgY29uZmln
dXJhdGlvbiBvcHRpb24gKyBjb21tYW5kIGxpbmUgb3B0aW9uIHNlZW1zIGxpa2Ugc29tZXRoaW5n
Cj4+IHBhcnRpY3VsYXJseSBoZWF2eSBmb3Igc3VjaCBmZWF0dXJlLiBUaGUgaWZkZWZlcnkvY29u
ZmlnIG9wdGlvbnMKPj4gaW52b2x2ZWQgaW4gdGhlIG1pc2FsaWduZWQgcHJvYmluZyBjb2RlIGlz
IGFscmVhZHkgcXVpdGUgY29tcGxpY2F0ZWQuIElmCj4+IGFub3RoZXIgbWVhbiB0byBzcGVjaWZ5
IHRoZSBtaXNhbGlnbmVkIHNwZWVkIGFjY2VzcyBpcyBhZGRlZCwgSSB0aGluawo+PiBhbGwgY29u
ZmlndXJhdGlvbiBvcHRpb25zIHRvIHNldCB0aGUgc3BlZWQgb2YgYWNjZXNzZXMgY2FuIHRoZW4g
YmUKPj4gcmVtb3ZlZCBhbmQganVzdCBrZWVwIHRoZSBjb21tYW5kIGxpbmUuIFRoYXQgd2lsbCBj
ZXJ0YWlubHkgc2ltcGxpZnkgdGhlCj4+IGlmZGVmL2NvbmZpZyBvcHRpb25zLgo+IAo+IFllYWgg
dGhhdCdzIHdoeSBpdCBkaWRuJ3QgZ2V0IG1lcmdlZCBiZWNhdXNlIGl0IGZlbHQgbGlrZSBvdmVy
a2lsbC4gSQo+IHJlc3BvbmRlZCBvbiB0aGUgdGhyZWFkIHRvIEFudXAgYXMgd2h5IEkgd291bGQg
cHJlZmVyIGNvbmZpZyBvcHRpb25zLiBJdAo+IGp1c3QgY29tZXMgZG93biB0byBjb25maWcgb3B0
aW9ucyBiZWluZyByZXF1aXJlZCB0byBlbmFibGUgY29tcGlsZXIKPiBmZWF0dXJlcy4gVGhlIGtl
cm5lbCBpcyBvbmx5IGJ1aWx0IHdpdGggcnY2NGdjIGFuZCB1c2FnZSBvZiBhbGwgb3RoZXIKPiBl
eHRlbnNpb25zIHJlcXVpcmVzIGhhbmQgd3JpdHRlbiBhc3NlbWJseS4gVGhlcmUgYXJlIGVhc3kg
cGVyZm9ybWFuY2UKPiBnYWlucyB3aGVuIGNvbXBpbGluZyB0aGUga2VybmVsIHdpdGggcnY2NGdj
X3piYV96YmJfemJrYiBldGMuCj4gUGVyZm9ybWFuY2UgZm9jdXNlZCBrZXJuZWxzIHdpbGwgbmVl
ZCB0byBiZSByZWNvbXBpbGVkIGFueXdheSBzbyBJIGFtIG9mCj4gdGhlIG9waW5pb24gdGhhdCBn
cm91cGluZyBpbiBvdGhlciBwZXJmb3JtYW5jZSBmZWF0dXJlcyBhcyBjb25maWcKPiBvcHRpb25z
IGxpa2UgdGhpcyBpcyB0aGUgZWFzaWVzdCB0aGluZyB0byBkbyBhbmQgcmVkdWNlcyB0aGUgYW1v
dW50IG9mCj4gY29kZSBpbiB0aGUga2VybmVsLgoKQXMgYW5zd2VyZWQgb24gdGhlIG90aGVyIHRo
cmVhZCwgdG90YWxseSBhZ3JlZSwgZXhjZXB0IGZvciB0aGUKbWlzYWxpZ25lZCBhY2Nlc3NlcyBw
cm9iaW5nIGNvbmZpZyBvcHRpb25zIDspLiBVbHRpbWF0ZWx5LCB3ZSBuZWVkCnByb2ZpbGVzIGNv
bmZpZ3VyYXRpb24sIGVpdGhlciB2aWEgZGVmY29uZmlncyB0aGF0IGVuYWJsZXMgYSBidW5jaCBv
ZgpvcHRpbWl6YXRpb24gdmlhIElTQSBleHRlbnNpb24gb3IgY29uZmlndXJhdGlvbiBvcHRpb25z
IHRoYXQgZ3JvdXBzCnRoZXNlIGNvbmZpZyBvcHRpb25zLgoKQ2zDqW1lbnQKCj4gCj4gLSBDaGFy
bGllCj4gCj4+Cj4+IENsw6ltZW50Cj4+Cj4+Pgo+Pj4gLSBDaGFybGllCj4+Pgo+Pj4+IC19Cj4+
Pj4gLSNlbHNlIC8qIENPTkZJR19SSVNDVl9QUk9CRV9VTkFMSUdORURfQUNDRVNTICovCj4+Pj4g
LXN0YXRpYyB2b2lkIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVz
KHZvaWQpCj4+Pj4gLXsKPj4+PiAtfQo+Pj4+IC0jZW5kaWYKPj4+PiAtCj4+Pj4gICNpZmRlZiBD
T05GSUdfUklTQ1ZfUFJPQkVfVkVDVE9SX1VOQUxJR05FRF9BQ0NFU1MKPj4+PiAgc3RhdGljIHZv
aWQgY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3Moc3RydWN0IHdvcmtfc3RydWN0ICp3b3Jr
IF9fYWx3YXlzX3VudXNlZCkKPj4+PiAgewo+Pj4+IEBAIC0zNzAsNiArMzgwLDExIEBAIHN0YXRp
YyBpbnQgX19pbml0IHZlY19jaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKHZv
aWQgKnVudXNlZCBfX2Fsd2F5Cj4+Pj4gIH0KPj4+PiAgI2VuZGlmCj4+Pj4gIAo+Pj4+ICtzdGF0
aWMgYm9vbCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc190YWJsZSh2b2lkKQo+Pj4+ICt7
Cj4+Pj4gKwlyZXR1cm4gZmFsc2U7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gIHN0YXRpYyBpbnQgcmlz
Y3Zfb25saW5lX2NwdV92ZWModW5zaWduZWQgaW50IGNwdSkKPj4+PiAgewo+Pj4+ICAJaWYgKCFo
YXNfdmVjdG9yKCkpIHsKPj4+PiBAQCAtMzc3LDYgKzM5Miw5IEBAIHN0YXRpYyBpbnQgcmlzY3Zf
b25saW5lX2NwdV92ZWModW5zaWduZWQgaW50IGNwdSkKPj4+PiAgCQlyZXR1cm4gMDsKPj4+PiAg
CX0KPj4+PiAgCj4+Pj4gKwlpZiAoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfdGFibGUo
KSkKPj4+PiArCQlyZXR1cm4gMDsKPj4+PiArCj4+Pj4gICNpZmRlZiBDT05GSUdfUklTQ1ZfUFJP
QkVfVkVDVE9SX1VOQUxJR05FRF9BQ0NFU1MKPj4+PiAgCWlmIChwZXJfY3B1KHZlY3Rvcl9taXNh
bGlnbmVkX2FjY2VzcywgY3B1KSAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1VO
S05PV04pCj4+Pj4gIAkJcmV0dXJuIDA7Cj4+Pj4gQEAgLTM5MiwxMyArNDEwLDE1IEBAIHN0YXRp
YyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXModm9pZCkKPj4+PiAg
ewo+Pj4+ICAJaW50IGNwdTsKPj4+PiAgCj4+Pj4gLQlpZiAoIWNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3NfZW11bGF0ZWRfYWxsX2NwdXMoKSkKPj4+PiArCWlmICghY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c190YWJsZSgpICYmCj4+Pj4gKwkgICAgIWNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRf
YWxsX2NwdXMoKSkKPj4+PiAgCQljaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVz
KCk7Cj4+Pj4gIAo+Pj4+ICAJaWYgKCFoYXNfdmVjdG9yKCkpIHsKPj4+PiAgCQlmb3JfZWFjaF9v
bmxpbmVfY3B1KGNwdSkKPj4+PiAgCQkJcGVyX2NwdSh2ZWN0b3JfbWlzYWxpZ25lZF9hY2Nlc3Ms
IGNwdSkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1VOU1VQUE9SVEVEOwo+Pj4+
IC0JfSBlbHNlIGlmICghY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxs
X2NwdXMoKSAmJgo+Pj4+ICsJfSBlbHNlIGlmICghY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nl
c3NfdGFibGUoKSAmJgo+Pj4+ICsJCSAgICFjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19l
bXVsYXRlZF9hbGxfY3B1cygpICYmCj4+Pj4gIAkJICAgSVNfRU5BQkxFRChDT05GSUdfUklTQ1Zf
UFJPQkVfVkVDVE9SX1VOQUxJR05FRF9BQ0NFU1MpKSB7Cj4+Pj4gIAkJa3RocmVhZF9ydW4odmVj
X2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMsCj4+Pj4gIAkJCSAgICBOVUxM
LCAidmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMiKTsKPj4+Cj4+Pj4K
Pj4+PiBSZWdhcmRpbmcgeW91ciB0YWJsZSwgaXQgZmVlbHMgbGlrZSBhIGJpdCBnb2luZyBiYWNr
IHRvIG9sZCBoYXJkY29kZWQKPj4+PiBwbGF0Zm9ybSBkZXNjcmlwdGlvbiA7KS4gSSB0aGluayBz
b21lIGtpbmQgb2YgYXV0by1kZXRlY3Rpb24gb2Ygc3BlZWQKPj4+PiAobm90IGJ1aWx0aW4gdGhl
IGtlcm5lbCkgZm9yIHBsYXRmb3JtcyBjb3VsZCBiZSBnb29kIGFzIHdlbGwgdG8gc2tpcAo+Pj4+
IHByb2JpbmcuCj4+Pj4KPj4+PiBBIERUIHByb3BlcnR5IGFsc28gc2VlbXMgb2sgdG8gbWUgc2lu
Y2UgdGhlIGdvYWwgaXMgdG8gZGVzY3JpYmUKPj4+PiBoYXJkd2FyZS4gV291bGQgYSBjb21tb24g
RFQvQUNQSSBwcm9wZXJ0eSBiZSBhcHByb3ByaWF0ZSA/IFRoZQo+Pj4+IGRldmljZV9wcm9wZXJ0
eSBBUEkgdW5pZmllZCBib3RoIHNvIGlmIHdlIHVzZWQgc29tZSBjb21tb24gcHJvcGVydHkgdG8K
Pj4+PiBkZXNjcmliZSB0aGUgbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgKGJvdGggaW4gRFQgY3B1
IG5vZGUvIEFDUEkgQ1BVCj4+Pj4gZGV2aWNlIHBhY2thZ2UpLCB3ZSBjb3VsZCBrZWVwIGEgc2lu
Z2xlIHBhcnNpbmcgbWV0aG9kLiBCdXQgSSdtIG5vIEFDUEkKPj4+PiBleHBlcnQgc28gSSBkb24n
dCBrbm93IGlmIHRoYXQgcmVhbGx5IG1ha2Ugc2Vuc2UuCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4K
Pj4+PiBDbMOpbWVudAo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+Pj4gZHJldwo+Pj4+Cj4+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
