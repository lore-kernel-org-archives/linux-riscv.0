Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40EBC02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZPC/lbK6FYFiud3fwMyUY9nVp7flstDr0o4s8ExW5E=; b=o7ht9E425oJ3kX
	5IwZYdEg36ydEqGDIWSp5uUOegv2LO5cK+XRgV1Q6RkY4SsTzzPrDekjyWlCuqxCGwyHYrGIkZpus
	IDZncRMKrcU7mPaxenndDF5lWRdjmsKOG76BdCQ38OaTISB/DcObQ8XQXIRfFiJFdwB2sr1A5NhVO
	KNlmw3zREk/0d1WjlNWiFxUuXEMJjgIRDlTGdJr487DWVi0+aTzbpKUsvYQWld2bXE8DmwyfIVuN0
	FimZw92w7RaED0b4IbgIe6/kgQa+ara4s0QLeMNEjjD1P1Cljcbs5W7peManGRWQQ+Pa6Mvmrl6k2
	+98SmO6/sAUQKef2GHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thabv-00000001OUP-3gEf;
	Mon, 10 Feb 2025 20:42:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thabt-00000001OU0-0bw2
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:42:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43948021a45so10624785e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739220147; x=1739824947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngk+2o11cwbjEOvuqJJSSg9EaVmpQRDEI1AAFOBfzJ8=;
        b=MtT8TBJoR8Fcc8LVojeCq/qvoPvDTIi0t0EEuJ+RVCMPfhPQbfP67I+be7Tjh+NJWE
         Hfcf1xQrtIPcZ6QX2oZHiDcaZ3SEAcehJxcVsn9c2JAb3ZFY24BFxF78NvkuLku+waAC
         +6PaPgO0j3C1ni75dTYIBqh+Cdof14SVogZPkjO9oW7jDYf6sQwbe3TN8KlQx7a+/F0K
         OYGMDg+M8zetZgFSb9rUd5Kg7+2IvIvpukvU1lhEj6AZ0B6bgXjO8Uc/B6gr74+IXLFV
         8ubDMs/5x2hJ/RuZIrjjROAfBRaVOlAmpHO7wQ9DFfgxSG2n3xHhQ9ghHcFhHaY3oZxL
         y5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220147; x=1739824947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngk+2o11cwbjEOvuqJJSSg9EaVmpQRDEI1AAFOBfzJ8=;
        b=Oymf8kGpzOvH5vU+8K8Ck7V6WxGoPh8aU3O/oKDDh0el3soy7WYnGwR2nK6fpy8IbV
         QW2tzJv6WBfvMaELb9bayqumQBlnKtCWyS+3xWe2OLnL/WqSIgR97rs3Ushd56mZNZrJ
         n6yQnc9rBi/nA5qV8AZF7C3VyPyMg1LlDbrnruXBlGtGz9j2HtsxplAXHgrK2DOutODo
         Lb6aA1fKAeJeYracDTCmUyRZjuXUyM6k822unfhmAX7uSAULCDZHYdwJaJtxHuzUaIb1
         3zyr2PrkykKCCboeEMRcnRvcA+vhNPU88UJO3E32mJBPfWjKUFl+6F6e7wQib3woSW8p
         gUsA==
X-Forwarded-Encrypted: i=1; AJvYcCWyUKsReFORPVk1alQWxgb9gfbWtOp5ZI6yLcNR0WlVuAGvFxSGN563CBE7S4pLaxURWh7i8PDLV7f6CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPPpKMcMTY6xkLo3yaJRQXLcv6IWB/r+V9skTXWOPP3wWdNqxv
	/5EZwpvFZZN09Ew88thT7von+jG5LsyDWZImyoIwHBm9KUGFaO7OLGznELUxy0U=
X-Gm-Gg: ASbGnctprjER/y7iWsO79Toh2LeSAjp9lB5E6doMVzoMOmBRz0/xoddgl/TWK1GFkCd
	u+9WUCzpu0YLLiG2HJYahcO2/+gENkb49vEbEoZnFxsRtiDZAEkXPuy8mNtEzQg1jnbhly9cI/y
	pnSRliy02RB1oMVKwNkp5uIaS00Dzorp0n3bgRZYM4+ORweu5JubVEx7jAjUszeBuU2uvXDdEHw
	zfwc3jXX1k9UjP3WRn/TwXR3C5KfhZ3RAF6aozEuUJYwxLcKVazciWNB0M/g8doywTc75NHNPkS
	vRWB2m5Q/ZrZXaQw0N+DG+kfY3+VEOHaVrTt4mdVqFCEJqBCnWOvlUBJU3JS
X-Google-Smtp-Source: AGHT+IGf4kCwuAGcajiCoiFPLziEZ6q6Y8ZmC1h98VuSEnA8m72g4JwD12AEMH0pnvNSvi/JJXV1Pw==
X-Received: by 2002:a05:600c:3c84:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-43924991e0cmr125873475e9.14.1739220147395;
        Mon, 10 Feb 2025 12:42:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4393963c84esm77234155e9.27.2025.02.10.12.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 12:42:26 -0800 (PST)
Message-ID: <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com>
Date: Mon, 10 Feb 2025 21:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com,
 Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com> <Z6o1bQLJ8aUyjvrQ@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6o1bQLJ8aUyjvrQ@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_124229_185639_B17123C5 
X-CRM114-Status: GOOD (  31.82  )
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

CgpPbiAxMC8wMi8yMDI1IDE4OjIwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gTW9uLCBG
ZWIgMTAsIDIwMjUgYXQgMDM6MjA6MzRQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
Pgo+Pgo+PiBPbiAxMC8wMi8yMDI1IDE1OjA2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBN
b24sIEZlYiAxMCwgMjAyNSBhdCAxMjowNzo0MFBNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3Jv
dGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDEwLzAyLzIwMjUgMTE6MTYsIEFudXAgUGF0ZWwgd3JvdGU6
Cj4+Pj4+IE9uIFNhdCwgRmViIDgsIDIwMjUgYXQgNjo1M+KAr0FNIENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IE9uIEZyaSwgRmViIDA3
LCAyMDI1IGF0IDA1OjE5OjQ3UE0gKzAxMDAsIEFuZHJldyBKb25lcyB3cm90ZToKPj4+Pj4+PiBQ
cm9iaW5nIHVuYWxpZ25lZCBhY2Nlc3NlcyBvbiBib290IGlzIHRpbWUgY29uc3VtaW5nLiBQcm92
aWRlIGEKPj4+Pj4+PiBmdW5jdGlvbiB3aGljaCB3aWxsIGJlIHVzZWQgdG8gbG9vayB1cCB0aGUg
YWNjZXNzIHR5cGUgaW4gYSB0YWJsZQo+Pj4+Pj4+IGJ5IGlkIHJlZ2lzdGVycy4gVmVuZG9ycyB3
aGljaCBwcm92aWRlIHRhYmxlIGVudHJpZXMgY2FuIHRoZW4gc2tpcAo+Pj4+Pj4+IHRoZSBwcm9i
aW5nLgo+Pj4+Pj4KPj4+Pj4+IFRoZSBhY2Nlc3MgY2hlY2tlciBpbiBteSBleHBlcmllbmNlIGlz
IG9ubHkgdGltZSBjb25zdW1pbmcgb24gc2xvdwo+Pj4+Pj4gaGFyZHdhcmUuIEhhcmR3YXJlIHRo
YXQgc3VwcG9ydHMgZmFzdCB1bmFsaWduZWQgYWNjZXNzZXMgaXNuJ3QgcmVhbGx5Cj4+Pj4+PiBp
bXBhY3RlZCBieSB0aGlzPyBBdm9pZGluZyBhIGxpc3Qgb2YgaGFyZHdhcmUgdGhhdCBoYXMgc2xv
dy9mYXN0Cj4+Pj4+PiB1bmFsaWduZWQgYWNjZXNzZXMgaW4gdGhlIGtlcm5lbCB3YXMgdGhlIG1h
aW4gcmVhc29uIGZvciBkeW5hbWljYWxseQo+Pj4+Pj4gY2hlY2tpbmcuIFdlIGRpZCBpbnRyb2R1
Y2UgdGhlIGNvbmZpZyBvcHRpb24gdG8gY29tcGlsZSB0aGUga2VybmVsIHdpdGgKPj4+Pj4+IGFz
c3VtZWQgc2xvdy9mYXN0IGFjY2Vzc2VzLCB3aGljaCBvZiBjb3Vyc2UgaGFzIHRoZSBkb3duc2lk
ZSBvZgo+Pj4+Pj4gcmVjb21waWxpbmcgdGhlIGtlcm5lbCBhbmQgSSBhc3N1bWUgdGhhdCB5b3Ug
YWxyZWFkeSBjb25zaWRlcmVkIHRoYXQuCj4+Pj4+Cj4+Pj4+IFRoZSBrY29uZmlnIG9wdGlvbiBk
b2VzIG5vdCBhbGlnbiB3aXRoIHRoZSB2aXNpb24gb2YgcnVubmluZyB0aGUgc2FtZQo+Pj4+PiBr
ZXJuZWwgaW1hZ2UgYWNyb3NzIHBsYXRmb3Jtcy4KPj4+Pgo+Pj4+IEknZCB3b3VsZCBiZSBhZHZv
Y2F0aW5nIHRvIHJlbW92ZSBjb21waWxlIHRpbWUgb3B0aW9ucyBhcyB3ZWxsIGFuZCB1c2UKPj4+
PiBhbm90aGVyIHdheSB0byBza2lwIHRoZSBwcm9iZSAoc2VlIGJlbG93KS4KPj4+Pgo+Pj4+Pgo+
Pj4+Pj4KPj4+Pj4+IEluc3RlYWQgb2YgaGF2aW5nIGEgdGFibGUgaW4gdGhlIGtlcm5lbCwgc29t
ZXRoaW5nIHRoYXQgd291bGQgYmUgbW9yZQo+Pj4+Pj4gcGxhdGZvcm0gYWdub3N0aWMgd291bGQg
YmUgdG8gaGF2ZSBhbiBleHRlbnNpb24gdGhhdCBzaWduYWxzIHRoaXMKPj4+Pj4+IGluZm9ybWF0
aW9uLiBUaGF0IHNlZW1zIGxpa2UgaXQgd291bGQgYWNjb21wbGlzaCB0aGUgc2FtZSBnb2FsIGFu
ZAo+Pj4+Pj4gbGV2ZXJhZ2UgdGhlIGV4aXN0aW5nIGluZnJhc3RydWN0dXJlIGluIHRoZSBrZXJu
ZWwsIGFsYmVpdCB3aXRoIHRoZSBuZWVkCj4+Pj4+PiB0byBtYWtlIGEgbmV3IGV4dGVuc2lvbi4K
Pj4+Pj4+Cj4+Pj4+Cj4+Pj4+IElNTywgZXhwZWN0aW5nIGFuIElTQSBleHRlbnNpb24gdG8gYmUg
ZGVmaW5lZCBmb3IgYWxsIHBvc3NpYmxlCj4+Pj4+IG1pY3JvYXJjaGl0ZWN0dXJhbCBjaG9pY2Vz
IGlzIG5vdCBnb2luZyB0byBzY2FsZSBzbyBpdCBpcyBiZXR0ZXIKPj4+Pj4gdG8gaGF2ZSBpbmZy
YXN0cnVjdHVyZSBpbiBrZXJuZWwgaXRzZWxmIHRvIGluZmVyIG1pY3JvYXJjaGl0ZWN0dXJhbAo+
Pj4+PiBjaG9pY2VzIGJhc2VkIG9uIFJJU0MtViBpbXBsZW1lbnRhdGlvbiBJRC4KPj4+Pgo+Pj4+
IFNpbmNlIGFkZGluZyBhbiBleHRlbnNpb24gc2VlbXMgcXVpdGUgdW5saWtlbHksIGFuZCB0aGF0
IGEgZGV2aWNlLXRyZWUKPj4+PiBwcm9wZXJ0eSBpcyBsaWtlbHkgRFQgY2VudHJpYyBhbmQgbm90
IGFwcGxpY2FibGUgdG8gQUNQSSBhcyB3ZWxsLCB3YXMgYQo+Pj4+IGNvbW1hbmQgbGluZSBhcmd1
bWVudCBjb25zaWRlcmVkID8KPj4+Pgo+Pj4KPj4+IEkgZGlkIGNvbnNpZGVyIGFkZGluZyBhIGNv
bW1hbmQgbGluZSBvcHRpb24gaW4gYWRkaXRpb24gdG8gdGhlIHRhYmxlLAo+Pj4gYWxsb3dpbmcg
cGxhdGZvcm1zIHdoaWNoIG5laXRoZXIgaGF2ZSBhIHRhYmxlIGVudHJ5IFt5ZXRdIG5vciB3YW50
IHRvIGRvCj4+PiB0aGUgc3BlZWQgdGVzdCwgdG8gc2V0IHdoYXRldmVyIHRoZXkgbGlrZS4gSW4g
dGhlIGVuZCwgSSBkcm9wcGVkIGl0LCBzaW5jZQo+Pj4gSSBkb24ndCBoYXZlIGEgdXNlIGNhc2Ug
YXQgdGhpcyB0aW1lLiBIb3dldmVyLCBpZiB3ZSByZWFsbHkgZG9uJ3Qgd2FudCBhCj4+PiB0YWJs
ZSwgdGhlbiBJIGNhbiBsb29rIGludG8gdGhlIGNvbW1hbmQgbGluZSBvcHRpb24gaW5zdGVhZC4K
Pj4KPj4gU29ycnkgaWYgSSB3YXNuJ3QgY2xlYXIsIEkgd2Fzbid0IGNvbnNpZGVyaW5nIHRoaXMg
YXMgYSByZXBsYWNlbWVudCBmb3IKPj4geW91ciB0YWJsZSBidXQgcmF0aGVyIGFzIGEgcmVwbGFj
ZW1lbnQgdG8gQ2hhcmxpZSdzIGNvbXBpbGUgdGltZSBkZWZpbmUKPj4gdG8gc2tpcCBtaXNhbGln
bmVkIHNwZWVkIHByb2Jpbmcgc2luY2UgaXQgaXMgbGlrZSAibHBqPTx4PiIuIFlvdSBjYW4KPj4g
c3BlY2lmeSBpdCBvbiBjb21tYW5kIGxpbmUgaWYgeW91IHdhbnQgdG8gc2tpcCB0aGUgbG9vcCB0
aW1lIGRldGVjdGlvbgo+PiBvZiBsb29wcyBwZXIgamlmZmllcyBhbmQgaGF2ZSBmYXN0ZXIgYm9v
dC4KPiAKPiBKZXNzZSBzZW50IG91dCBhIHBhdGNoIGZvciBhIGtlcm5lbCBwYXJhbWV0ZXIgdG8g
c2V0IHRoZSBhY2Nlc3Mgc3BlZWQgdG8KPiB3aGF0ZXZlciBpcyBkZXNpcmVkIFsxXS4KCkhleSBD
aGFybGllLAoKVGhhbmtzIGJ1dCBpdCBzZWVtcyB5b3UgZm9yZ290IHRvIGFkZCB0aGUgbGluayA/
CgpIYXZpbmcgY29uZmlndXJhdGlvbiBvcHRpb24gKyBjb21tYW5kIGxpbmUgb3B0aW9uIHNlZW1z
IGxpa2Ugc29tZXRoaW5nCnBhcnRpY3VsYXJseSBoZWF2eSBmb3Igc3VjaCBmZWF0dXJlLiBUaGUg
aWZkZWZlcnkvY29uZmlnIG9wdGlvbnMKaW52b2x2ZWQgaW4gdGhlIG1pc2FsaWduZWQgcHJvYmlu
ZyBjb2RlIGlzIGFscmVhZHkgcXVpdGUgY29tcGxpY2F0ZWQuIElmCmFub3RoZXIgbWVhbiB0byBz
cGVjaWZ5IHRoZSBtaXNhbGlnbmVkIHNwZWVkIGFjY2VzcyBpcyBhZGRlZCwgSSB0aGluawphbGwg
Y29uZmlndXJhdGlvbiBvcHRpb25zIHRvIHNldCB0aGUgc3BlZWQgb2YgYWNjZXNzZXMgY2FuIHRo
ZW4gYmUKcmVtb3ZlZCBhbmQganVzdCBrZWVwIHRoZSBjb21tYW5kIGxpbmUuIFRoYXQgd2lsbCBj
ZXJ0YWlubHkgc2ltcGxpZnkgdGhlCmlmZGVmL2NvbmZpZyBvcHRpb25zLgoKQ2zDqW1lbnQKCj4g
Cj4gLSBDaGFybGllCj4gCj4+IC19Cj4+IC0jZWxzZSAvKiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5B
TElHTkVEX0FDQ0VTUyAqLwo+PiAtc3RhdGljIHZvaWQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3Nfc3BlZWRfYWxsX2NwdXModm9pZCkKPj4gLXsKPj4gLX0KPj4gLSNlbmRpZgo+PiAtCj4+
ICAjaWZkZWYgQ09ORklHX1JJU0NWX1BST0JFX1ZFQ1RPUl9VTkFMSUdORURfQUNDRVNTCj4+ICBz
dGF0aWMgdm9pZCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2VzcyhzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmsgX19hbHdheXNfdW51c2VkKQo+PiAgewo+PiBAQCAtMzcwLDYgKzM4MCwxMSBAQCBz
dGF0aWMgaW50IF9faW5pdCB2ZWNfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1
cyh2b2lkICp1bnVzZWQgX19hbHdheQo+PiAgfQo+PiAgI2VuZGlmCj4+ICAKPj4gK3N0YXRpYyBi
b29sIGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX3RhYmxlKHZvaWQpCj4+ICt7Cj4+ICsJ
cmV0dXJuIGZhbHNlOwo+PiArfQo+PiArCj4+ICBzdGF0aWMgaW50IHJpc2N2X29ubGluZV9jcHVf
dmVjKHVuc2lnbmVkIGludCBjcHUpCj4+ICB7Cj4+ICAJaWYgKCFoYXNfdmVjdG9yKCkpIHsKPj4g
QEAgLTM3Nyw2ICszOTIsOSBAQCBzdGF0aWMgaW50IHJpc2N2X29ubGluZV9jcHVfdmVjKHVuc2ln
bmVkIGludCBjcHUpCj4+ICAJCXJldHVybiAwOwo+PiAgCX0KPj4gIAo+PiArCWlmIChjaGVja192
ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc190YWJsZSgpKQo+PiArCQlyZXR1cm4gMDsKPj4gKwo+PiAg
I2lmZGVmIENPTkZJR19SSVNDVl9QUk9CRV9WRUNUT1JfVU5BTElHTkVEX0FDQ0VTUwo+PiAgCWlm
IChwZXJfY3B1KHZlY3Rvcl9taXNhbGlnbmVkX2FjY2VzcywgY3B1KSAhPSBSSVNDVl9IV1BST0JF
X01JU0FMSUdORURfVkVDVE9SX1VOS05PV04pCj4+ICAJCXJldHVybiAwOwo+PiBAQCAtMzkyLDEz
ICs0MTAsMTUgQEAgc3RhdGljIGludCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxf
Y3B1cyh2b2lkKQo+PiAgewo+PiAgCWludCBjcHU7Cj4+ICAKPj4gLQlpZiAoIWNoZWNrX3VuYWxp
Z25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKSkKPj4gKwlpZiAoIWNoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3NfdGFibGUoKSAmJgo+PiArCSAgICAhY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZF9hbGxfY3B1cygpKQo+PiAgCQljaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9j
cHVzKCk7Cj4+ICAKPj4gIAlpZiAoIWhhc192ZWN0b3IoKSkgewo+PiAgCQlmb3JfZWFjaF9vbmxp
bmVfY3B1KGNwdSkKPj4gIAkJCXBlcl9jcHUodmVjdG9yX21pc2FsaWduZWRfYWNjZXNzLCBjcHUp
ID0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1ZFQ1RPUl9VTlNVUFBPUlRFRDsKPj4gLQl9IGVs
c2UgaWYgKCFjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygp
ICYmCj4+ICsJfSBlbHNlIGlmICghY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfdGFibGUo
KSAmJgo+PiArCQkgICAhY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxs
X2NwdXMoKSAmJgo+PiAgCQkgICBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9QUk9CRV9WRUNUT1Jf
VU5BTElHTkVEX0FDQ0VTUykpIHsKPj4gIAkJa3RocmVhZF9ydW4odmVjX2NoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMsCj4+ICAJCQkgICAgTlVMTCwgInZlY19jaGVja191bmFs
aWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzIik7Cj4gCj4+Cj4+IFJlZ2FyZGluZyB5b3VyIHRh
YmxlLCBpdCBmZWVscyBsaWtlIGEgYml0IGdvaW5nIGJhY2sgdG8gb2xkIGhhcmRjb2RlZAo+PiBw
bGF0Zm9ybSBkZXNjcmlwdGlvbiA7KS4gSSB0aGluayBzb21lIGtpbmQgb2YgYXV0by1kZXRlY3Rp
b24gb2Ygc3BlZWQKPj4gKG5vdCBidWlsdGluIHRoZSBrZXJuZWwpIGZvciBwbGF0Zm9ybXMgY291
bGQgYmUgZ29vZCBhcyB3ZWxsIHRvIHNraXAKPj4gcHJvYmluZy4KPj4KPj4gQSBEVCBwcm9wZXJ0
eSBhbHNvIHNlZW1zIG9rIHRvIG1lIHNpbmNlIHRoZSBnb2FsIGlzIHRvIGRlc2NyaWJlCj4+IGhh
cmR3YXJlLiBXb3VsZCBhIGNvbW1vbiBEVC9BQ1BJIHByb3BlcnR5IGJlIGFwcHJvcHJpYXRlID8g
VGhlCj4+IGRldmljZV9wcm9wZXJ0eSBBUEkgdW5pZmllZCBib3RoIHNvIGlmIHdlIHVzZWQgc29t
ZSBjb21tb24gcHJvcGVydHkgdG8KPj4gZGVzY3JpYmUgdGhlIG1pc2FsaWduZWQgYWNjZXNzIHNw
ZWVkIChib3RoIGluIERUIGNwdSBub2RlLyBBQ1BJIENQVQo+PiBkZXZpY2UgcGFja2FnZSksIHdl
IGNvdWxkIGtlZXAgYSBzaW5nbGUgcGFyc2luZyBtZXRob2QuIEJ1dCBJJ20gbm8gQUNQSQo+PiBl
eHBlcnQgc28gSSBkb24ndCBrbm93IGlmIHRoYXQgcmVhbGx5IG1ha2Ugc2Vuc2UuCj4+Cj4+IFRo
YW5rcywKPj4KPj4gQ2zDqW1lbnQKPj4KPj4+Cj4+PiBUaGFua3MsCj4+PiBkcmV3Cj4+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
