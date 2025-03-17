Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84083C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 23:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5agr3oIQNMy9HrikSP5JZ3GTvwW8D1+6MzxPeoJk9mY=; b=OFFBij9lr6Fca4
	yZo6InWt/aNbyJaIrPrtHzICl7kLA06WEZbODNcAA4O/AWz+BwI75Bbo15DwTX0ylIDxITlzLRXlw
	chAW8lvkVOWMV6G0TrFj2tpjkpOTHI+bZT8o3/K3Qew4ueCgzya+fZj/gqFO3mI46IG9fr8K0Es/b
	4nVP/2fyXCCZjKuh61BriapHp0+dxbv40EvE48jQhUA/I7GWPtBcRvGRQZfKa2WFKXtu+KOvb97/t
	FVyuvKyQ6XCXGtE4XyjD/83lCNAaPUh2L7KDnB5m1UAnjd/5IYpf1F3axbLAyhnL+3KsV+UOw6kS6
	cw3Yxt1TNTxik4P5JQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKIr-00000004DVQ-3idP;
	Mon, 17 Mar 2025 23:55:29 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKGE-00000004Cox-2vMq
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 23:52:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22435603572so79770595ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 16:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742255565; x=1742860365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxmDLHNz0YKCNn7QowjgfshGeZoAAPDlOKgnwh1cfXM=;
        b=WDE8OEY0p3EsObXu4JFWWggznD/NQxVgHCoftqfhJOgDx8C8xwPZM0CelbLkz384qO
         pAcq7KgBcJ5PiCgb9azbhJshnXPwvFc2QNmKcpxZ9o3DoUJnxLfPcjA9NCVmf2y8hq/j
         +L2pY5itirIzch09UPmv/xNk88YpiqseuFmNQY/RnoHWPqDHfBOPVdY8mxoRa5t9GXnS
         TMRs6qAP+eLtMeaBIkTr4Qw08zf861lOWGmu8+02LskalLPEdOXa52ZBCfeQcXyi7fVU
         FL2f67MOAuC+7kQSeAwkVLBNJGaPoX2IDHld7NTPaL5/qlyGXq7TVOosygReOlrcesg5
         Be9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742255565; x=1742860365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxmDLHNz0YKCNn7QowjgfshGeZoAAPDlOKgnwh1cfXM=;
        b=udlwJCM03ZBGz4ENA4ahbrGD5y0xsPf4rDQ4xZK0IEBj7QLlINgb7reMQIKvPTtjL6
         NIK3SNj+OasWCZcMiHlo99LdQQ9yEjPz7W+5lCRNsc4wqGA5AU6BqSTDHNL6r6HcT0Wh
         I7Y4qTMTX6sjm1ygO05ta468kEAjJEeXuYbzRZzQUA1a7Q0wmEMj8Kv9YNaQxwG0HX0w
         5mNX4vGbDKSfqqX3NDohdDdITMp97kioUxLdS+XgzLUWuTwxL3TtGezBNf3g2WF4qkPP
         nIzFfudPj/XYRRX6jhXpXC5adb6JToYmgrI/WgcaCvcC9+Y444/4FGp7l7kPvHZhn1aJ
         iLkQ==
X-Gm-Message-State: AOJu0Yyhf5wMfe/D6187FkiBuTX0PdCIGyrRxQppVvbTjpV7+V4eraSD
	lpCBdVjHGNrIx8MBgW45g6pmt8X8kBVLTu8TmVD3uRwPJg1+IEWKEGKMrEuyHHw9J/bCvkYy8IJ
	BHw==
X-Gm-Gg: ASbGncsD1uN2iGC6gaRZ7OSWQFab8ma5fd8illPQ1jVaFYsple9Pr0FFXTza1ncbA/U
	VGtBZBqqIAivx+y7LpWLmXR1FiEPG3n9WRL41tZMD84W6DXjya1XQDzUDIiJA3CW18R60+KKX4u
	A+uPJKqxu4cHWic0XR+EGATzSGTNqBiKR4gN4Xiq/98GoKY1mLiZuH0BzenlMtMQEe/p/fEKXQA
	GdNUnnLt0OeVUPK1FVWXe9A69EpJg2eQDG4H5OMhxwtbR7OvBZGYCe31OCI+tIWY6qkVTwTyXhN
	FMZ2KlQkipaEq8JaWlGgM3gIDvybVZ69O3flRR4Iy4j8IdIFgE5NF+wrkzvjm21HVA==
X-Google-Smtp-Source: AGHT+IHEaWFQPJgATLqlBvt+CrmK5I3xjJbeWq+yPmOIb1jAsrVlkN08/4lnKJV9n6F8WYuZ0znVBg==
X-Received: by 2002:a17:903:1c7:b0:224:160d:3f54 with SMTP id d9443c01a7336-225e0a9860dmr158406905ad.31.1742255565320;
        Mon, 17 Mar 2025 16:52:45 -0700 (PDT)
Received: from [192.168.50.200] ([202.172.96.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167da28sm8235760b3a.89.2025.03.17.16.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 16:52:44 -0700 (PDT)
Message-ID: <ac5b93be-5b9c-4d39-bce6-a78032e43fbf@tenstorrent.com>
Date: Tue, 18 Mar 2025 10:52:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v3 0/4] riscv: uaccess: optimizations
To: Ben Dooks <ben.dooks@codethink.co.uk>, Alexandre Ghiti <alex@ghiti.fr>,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 charlie@rivosinc.com, jrtc27@jrtc27.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
 <4f6c83c0-39f6-467d-83c6-13d37440fb20@ghiti.fr>
 <5a81a72d-550d-42b4-8549-176f2b27ffc9@codethink.co.uk>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <5a81a72d-550d-42b4-8549-176f2b27ffc9@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_165246_734938_4871EF65 
X-CRM114-Status: GOOD (  30.90  )
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

CgpPbiAxNS8zLzIwMjUgMTI6NDkgYW0sIEJlbiBEb29rcyB3cm90ZToKPiBPbiAxNC8wMy8yMDI1
IDEzOjI4LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+IEhpIEN5cmlsLAo+Pgo+PiBPbiAyMS8w
Mi8yMDI1IDAxOjA5LCBDeXJpbCBCdXIgd3JvdGU6Cj4+PiBUaGlzIHNlcmllcyB0cmllcyB0byBv
cHRpbWl6ZSByaXNjdiB1YWNjZXNzIGJ5IGFsbG93aW5nIHRoZSB1c2Ugb2YKPj4+IHVzZXJfYWNj
ZXNzX2JlZ2luKCkgYW5kIHVzZXJfYWNjZXNzX2VuZCgpIHdoaWNoIHBlcm1pdHMgZ3JvdXBpbmcg
dXNlciAKPj4+IGFjY2Vzc2VzCj4+PiBhbmQgYXZvaWRpbmcgdGhlIENTUiB3cml0ZSBwZW5hbHR5
IGZvciBlYWNoIGFjY2Vzcy4KPj4+Cj4+PiBUaGUgZXJyb3IgcGF0aCBjYW4gYWxzbyBiZSBvcHRp
bWlzZWQgdXNpbmcgYXNtIGdvdG8gd2hpY2ggcGF0Y2hlcyAzIAo+Pj4gYW5kIDQKPj4+IGFjaGll
dmUuIFRoaXMgd2lsbCBzcGVlZCB1cCBqdW1waW5nIHRvIGxhYmVscyBieSBhdm9pZGluZyB0aGUg
bmVlZCBvZiBhbgo+Pj4gaW50ZXJtZWRpYXJ5IGVycm9yIHR5cGUgdmFyaWFibGUgd2l0aGluIHRo
ZSB1YWNjZXNzIG1hY3Jvcwo+Pj4KPj4+IEkgZGlkIHJlYWQgdGhlIGRpc2N1c3Npb24gdGhpcyBz
ZXJpZXMgZ2VuZXJhdGVkLiBJdCBpc24ndCBjbGVhciB0byBtZQo+Pj4gd2hpY2ggZGlyZWN0aW9u
IHRvIHRha2UgdGhlIHBhdGNoZXMsIGlmIGFueS4KPj4+Cj4+PiBWMjoKPj4+IEkndmUgdGFrZW4g
b24gdGhpcyBzZXJpZXMgYXMgdGhlcmUgaXNuJ3QgYW55IHJlc3BvbnNlIGZyb20gSmlzaGVuZy4g
Tm8KPj4+IHNpZ25pZmljYW50IGNoYW5nZXMgb3RoZXIgdGhhbiBidWlsZCBmaXhlcy4KPj4+IC0g
Rml4ZXMgYnVpbGQgYnJlYWthZ2UgaW4gcGF0Y2ggMyB0byBkbyB3aXRoIG5vdCBoYXZpbmcgdXNl
ZCAnZ290bycgCj4+PiBrZXl3b3JkLgo+Pj4gLSBGaXhlcyBidWlsZCBicmVha2FnZSBpbiBwYXRj
aCA0IG9uIDMyYml0IG5vdCBoYXZpbmcgZGVsY2FyZWQgX19wdHIgCj4+PiBpbiB0aGUKPj4+IMKg
wqAgbWFjcm8uCj4+Pgo+Pj4gVjM6Cj4+PiBTaWduaWZpY2FudCBjb21taXQgbWVzc2FnZSByZXdy
aXRlcy4KPj4+IMKgIC0gQ29ycmVjdGVkIHRoZSBqdXN0aWZpY2F0aW9uIGZvciBwYXRjaCAyCj4+
PiDCoCAtIEJldHRlciBleHBsYWluZWQvanVzdGlmaWVkIHBhdGNoZXMgMyBhbmQgNAo+Pj4gTWlu
b3IgY29kZSBjaGFuZ2VzIGZvciBsZWdpYmlsaXR5IGFuZCBtb3JlIGNvbW1lbnRzLgo+Pj4KPj4+
IEppc2hlbmcgWmhhbmcgKDQpOgo+Pj4gwqDCoCByaXNjdjogaW1wbGVtZW50IHVzZXJfYWNjZXNz
X2JlZ2luKCkgYW5kIGZhbWlsaWVzCj4+PiDCoMKgIHJpc2N2OiB1YWNjZXNzOiB1c2UgaW5wdXQg
Y29uc3RyYWludHMgZm9yIHB0ciBvZiBfX3B1dF91c2VyKCkKPj4+IMKgwqAgcmlzY3Y6IHVhY2Nl
c3M6IHVzZSAnYXNtIGdvdG8nIGZvciBwdXRfdXNlcigpCj4+PiDCoMKgIHJpc2N2OiB1YWNjZXNz
OiB1c2UgJ2FzbV9nb3RvX291dHB1dCcgZm9yIGdldF91c2VyKCkKPj4+Cj4+PiDCoCBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDIwNSArKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTUyIGluc2VydGlvbnMoKyksIDUzIGRlbGV0
aW9ucygtKQo+Pj4KPj4gRm9sbG93aW5nIHVwIG9uIEJlbidzIGNvbW1lbnQgaGVyZSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC0gCj4+IHJpc2N2LyBiNDVhYWIxZS02ZDM3LTQwMjctOWEx
NS00ZmE5MTdkODA2YjlAY29kZXRoaW5rLmNvLnVrLwo+Pgo+PiBUaGUgcHJvYmxlbSB0aGF0IEJl
biBtZW50aW9ucyBpcyBjYXVzZWQgYnkgdGhlIHVzZSBvZiAqbWFjcm9zKiB3aGljaCAKPj4gdXNl
ZCB0byBtYWtlIHRoZSBldmFsdWF0aW9uIG9mIHRoZSBwYXJhbWV0ZXIgaW5zaWRlIHRoZSB1c2Vy
LSAKPj4gYWNjZXNzaWJsZSBzZWN0aW9uLCBhbmQgc2luY2UgdGhpcyBwYXJhbWV0ZXIgY291bGQg
YmUgYSBzbGVlcGluZyAKPj4gZnVuY3Rpb24sIHdlIGNvdWxkIHNjaGVkdWxlIGFub3RoZXIgcHJv
Y2VzcyB3aXRoIHRoZSBTVU0gYml0IHNldCwgCj4+IHdoaWNoIGNvdWxkIGJlIGNsZWFyZWQgYnkg
dGhpcyBwcm9jZXNzLCB3aGljaCB3b3VsZCBtYWtlIHRoZSBmaXJzdCAKPj4gcHJvY2VzcyBmYXVs
dCB3aGVuIHRyeWluZyB0byBhY2Nlc3MgdXNlciBtZW1vcnkuIEkgZGlkIG5vdCBmaW5kIGFueSAK
Pj4gbWFjcm8gdXNpbmcgdW5zYWZlX1hYWCgpIGZ1bmN0aW9ucyB3aGljaCBjb3VsZCBjYXVzZSBh
IHByb2JsZW0gcmlnaHQgCj4+IG5vdywgYnV0IEkgbWF5IGhhdmUgbWlzc2VkIG9uZSBhbmQgbmV3
IGNvdWxkIGNvbWUgdXAgbGF0ZXIsIHNvIHdlIGhhdmUgCj4+IG11bHRpcGxlIHNvbHV0aW9ucyBo
ZXJlOgo+Pgo+PiAtIHN1cHBvc2UgdGhhdCBhIG1hY3JvIHVzaW5nIHVuc2FmZV9nZXQvcHV0X3Vz
ZXIoKSBhbmQgcGFzc2luZyBhIAo+PiBzbGVlcGluZyBmdW5jdGlvbiBhcyBhcmd1bWVudCB3b24n
dCBoYXBwZW4gYW5kIHRoZW4gZG8gbm90aGluZwo+PiAtIG9yIHNhdmUvcmVzdG9yZSBDU1Igc3N0
YXR1cyB3aGVuIHN3aXRjaGluZyBwcm9jZXNzZXMKPj4gLSBvciBzaW1wbHkgY2hlY2sgdGhhdCBT
VU0gaXMgbm90IHNldCB3aGVuIHN3aXRjaGluZyBwcm9jZXNzZXMKPj4KPj4gTGV0IG1lIGtub3cg
d2hhdCB5b3UgdGhpbmsuCj4gCj4gSSdtIG9uIHRoZSBzYXZlIHRoZSBmbGFnIHNpZGUsIGZvciB0
aGVzZSByZWFzb25zOgo+IAo+ICMxIHNsZWVwaW5nIGZ1bmN0aW9ucyBjYW4gaGFwcGVuIG1vcmUg
b2Z0ZW4gd2hlbiB2YXJpb3VzIGNoZWNrcwo+ICDCoMKgIGdldCBlbmFibGVkIGluIHRoZSBrZXJu
ZWwgKHRoaXMgd2FzIHdoeSB0aGUgb3JpZ2luYWwgZmF1bHQKPiAgwqDCoCB3YXMgZm91bmQpLsKg
IEFkZGluZyBsYXJnZXIgc2VjdGlvbnMgaXMganVzdCBnb2luZyB0byBtYWtlCj4gIMKgwqAgdGhl
IGZhdWx0IHBvcCB1cCBhZ2FpbiBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUuCj4gCj4gIzIg
dGhlIHNhdmUvcmVzdG9yZSBpcyBhIHNtYWxsIGFkZGl0aW9uIHRvIHRoZSBzd2FwIHJlZ2lzdGVy
cwo+IAo+ICMzIHNhdmluZyBTVU0gb3ZlciBhIHJlZ3Mgc3dhcCBpcyBhbHdheXMgZ29pbmcgdG8g
bWFrZSBzdXJlIHdlCj4gIMKgwqAgbmV2ZXIgc2VlIHRoaXMgZ3JlbWxpbiB0dXJuIHVwIGFnYWlu
Cj4gCj4gRllJLCBJIHRoaW5rIEkgbWF5IGhhdmUgcG9zdGVkIG91ciBvcmlnaW5hbCB0ZXN0IHRo
cmVhZCBhdCBzb21lCj4gcG9pbnQsIGJ1dCBJIGNvdWxkIGRvIHNvIGFnYWluLgoKWWVzLCBhZnRl
ciBCZW4gcG9pbnRlZCBvdXQgdGhlIGlzc3VlIEkgY2FtZSB0byB0aGUgY29uY2x1c2lvbiB3ZSAK
cHJvYmFibHkgd2FudCBCZW5zIHBhdGNoIHdoaWNoIHNhdmVzIHRoZSBiaXQuIEFwb2xvZ2llcyBp
ZiBJIGRpZG4ndCAKZXhwcmVzcyB0aGlzIHRob3VnaHQgaW4gZW1haWwuCgpJJ20gaGFwcHkgdG8g
dGFrZSB0aGUgcGF0Y2ggYW5kIHB1dCBpdCBvbiB0aGUgZnJvbnQgb2YgdGhpcyBzZXJpZXMsIAph
bHRob3VnaCBwZXJoYXBzIGl0IG1ha2VzIG1vcmUgc2Vuc2UgeW91IHRvIHJldml2ZSB0aGUgcGF0
Y2ggc2luY2UgCnlvdSdyZSBzdGlsbCBhcm91bmQgQmVuPwoKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+
PiBBbGV4Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKPj4KPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
