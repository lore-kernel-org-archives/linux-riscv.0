Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4015DC001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tYWCfNHAus0QDMwFoeHgRwgxGsa6zyWwDHWO4auV7Y=; b=tiGf61naFakFg8
	msipxL/jtySm0qiZo01ksQGSqPB2Yt26qtMQqhCrmB4G5BrdV5SVp3pE0R4fOwujVu427kDF3cc+1
	qmp8X3+J9VMTrG2IT1ylscvFMGabuD+I3g91eBgE4JkPI09e5dPh5uvp2oUv7UIJXX5rPgYykiMTu
	5UV30QUCnhXxHZ45FheVKRY2zR8xEIFahvbpml06r2RW9WWsVQVk+fXDn2886te20tENF/TKu9jGk
	9UO9G1Tbb63csBQUVqvj0D1N7PklGormZDvmPNzTJG44QhTViRtSaosn5X/y6zx7DsE3qtuVUF4h+
	BHXaLquTKCtwLLnvl4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qupIj-006eBy-1n;
	Mon, 23 Oct 2023 07:24:37 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qupIh-006eBO-1S
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 07:24:37 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bbbe81185dso6799531fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698045872; x=1698650672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKdg99eVmqTJQsPp1Hlo5pZF0dZtBhRpT+d6cOzhUQw=;
        b=q7k4Q+3Rzq/ZMviXxfCl41FJWR/tnR9LVdiQ4nhoA9roqvyl+uhtCvT3oE+Lk5472Z
         HkZ2v0QAgGk7BOkR95xd9vT6MVF7nnYCQxHoTH2pdm2MbYL9SR3XLqRA1V2ibHxWTCrN
         EprJAiivEJQSk7tM7TdDMr11W74QUAMJnvnzg36A1LIJFoPzL0zq7nV2o+cDRm8N4VKW
         fZ03Dn6iV2Wx7IkFYK4iUkEzmw3gy4mOEn3bEVKh8cDOZnsVg3f3ryurF/wUHQAmR/li
         CQ1p5sYh8aQvfrthXJPGia5h4J4HiPgknjNiqHGIBgM4Ik56qRwg67c5nBaQdFw4dsHE
         JDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698045872; x=1698650672;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKdg99eVmqTJQsPp1Hlo5pZF0dZtBhRpT+d6cOzhUQw=;
        b=J18ktGrGDzWWSqXn4BaptQdSklTS7w2P/2LmrTbLbzppmNrokKCNjCGgc796wkpB46
         N61vMTL/kWVrC+KUa1FWtQlfkEFLOyeC4cbuc6QVbtKwRcgU/X1rVCOh9301eNfj3OrJ
         l0Uu7DDkc56nDvKPOCgto4we5isAqrFDRwt+ZI0gkOTzJAdbszQVRVPJb7qYhbhjPd/1
         nIYG4nv2/5iNx2n0HJAQ1mQ5c9A8Z/vhDQNz3/M4EUxJbGHVT+qxk1DW2Lzsc14HdzsR
         dXQ+ZmWBwBkB1ebpzKFXv2sAgKnM7gJ6O1sf68cgchNkCQGjexvBaXvbK3SD6i0EaX7m
         G7UA==
X-Gm-Message-State: AOJu0YzdLZIq+jdJdHLAtsug0dJJa+4DJQm0QyxEBbBP72Q8YZCI3nXN
	vuTbtXhkydrpDKKvsGovRuo73Q==
X-Google-Smtp-Source: AGHT+IHeLcw0Gv1b3ochJlwAxOBaEeux/G3ce+Ey9OlLNTwkHWbN+mde2nshq6mVDd2Bj3+G98CePg==
X-Received: by 2002:a2e:a179:0:b0:2bc:d505:2bf3 with SMTP id u25-20020a2ea179000000b002bcd5052bf3mr5395573ljl.1.1698045871829;
        Mon, 23 Oct 2023 00:24:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:17bb:4fd9:531:a7cc? ([2a01:e0a:999:a3a0:17bb:4fd9:531:a7cc])
        by smtp.gmail.com with ESMTPSA id x22-20020a05600c189600b004083a105f27sm13228369wmp.26.2023.10.23.00.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 00:24:31 -0700 (PDT)
Message-ID: <3f383b96-87ae-4580-a23d-0196bbd8ec91@rivosinc.com>
Date: Mon, 23 Oct 2023 09:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Jerry Shih <jerry.shih@sifive.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
 <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
 <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
 <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com>
 <20231019-nuclear-vista-ef3e0b9bef71@spud>
 <CALs-HssWZyhnbo=ErH+LEfMi4m04i39Cw3PGXP1WhCFfSP8G=A@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HssWZyhnbo=ErH+LEfMi4m04i39Cw3PGXP1WhCFfSP8G=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_002435_512028_4E4C5079 
X-CRM114-Status: GOOD (  24.58  )
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

CgpPbiAxOS8xMC8yMDIzIDE4OjE5LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFRodSwgT2N0IDE5
LCAyMDIzIGF0IDg6MzPigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Pgo+PiBPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCAxMTozNTo1OUFNICswMjAwLCBDbMOpbWVu
dCBMw6lnZXIgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDE4LzEwLzIwMjMgMTk6MjYsIEV2YW4gR3Jl
ZW4gd3JvdGU6Cj4+Pj4gT24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgNTo1M+KAr0FNIENsw6ltZW50
IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+
Pj4+IE9uIDE4LzEwLzIwMjMgMDM6NDUsIEplcnJ5IFNoaWggd3JvdGU6Cj4+Pj4+PiBPbiBPY3Qg
MTcsIDIwMjMsIGF0IDIxOjE0LCBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pj4+Pj4+IEBAIC0yMjEsNiArMjYxLDIyIEBAIGNvbnN0IHN0cnVjdCByaXNjdl9p
c2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+Pj4+Pj4+ICAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemt0LCBSSVNDVl9JU0FfRVhUX1pLVCksCj4+Pj4+Pj4gICAgICBfX1JJU0NWX0lT
QV9FWFRfREFUQSh6a3NlZCwgUklTQ1ZfSVNBX0VYVF9aS1NFRCksCj4+Pj4+Pj4gICAgICBfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6a3NoLCBSSVNDVl9JU0FfRVhUX1pLU0gpLAo+Pj4+Pj4+ICsgICAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYiwgUklTQ1ZfSVNBX0VYVF9aVkJCKSwKPj4+Pj4+PiAr
ICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyksCj4+Pj4+
Pj4gKyAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pWS0IpLAo+
Pj4+Pj4KPj4+Pj4+IFRoZSBgWnZrYmAgaXMgdGhlIHN1YnNldCBvZiBgWnZiYmBbMV0uIFNvLCB0
aGUgYFp2a2JgIHNob3VsZCBiZSBidW5kbGVkIHdpdGggYFp2YmJgLgo+Pj4+Pgo+Pj4+PiBIaSBK
ZXJyeSwKPj4+Pj4KPj4+Pj4gVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLCBJIHRoaW5rIHNvbWUg
b3RoZXIgZXh0ZW5zaW9ucyB3aWxsIGZhbGwgaW4KPj4+Pj4gdGhpcyBjYXRlZ29yeSBhcyB3ZWxs
IHRoZW4gKFp2a25oYS9admtuaGIpLiBJIHdpbGwgdmVyaWZ5IHRoYXQuCj4+Pj4KPj4+PiBUaGUg
YnVuZGxpbmcgbWVjaGFuaXNtIHdvcmtzIHdlbGwgd2hlbiBhbiBleHRlbnNpb24gaXMgYSBwdXJl
IGxhc3NvCj4+Pj4gYXJvdW5kIG90aGVyIGV4dGVuc2lvbnMuIFdlJ2QgaGF2ZSB0byB0d2VhayB0
aGF0IGNvZGUgaWYgd2Ugd2FudGVkIHRvCj4+Pj4gc3VwcG9ydCBjYXNlcyBsaWtlIHRoaXMsIHdo
ZXJlIHRoZSBleHRlbnNpb24gaXMgYSBzdXBlcnNldCBvZiBvdGhlcnMsCj4+Pj4gYnV0IGFsc28g
Y29udGFpbnMgbG9vc2UgY2hhbmdlIG5vdCBwcmVzZW50IGFueXdoZXJlIGVsc2UgKGFuZAo+Pj4+
IHRoZXJlZm9yZSBhbHNvIG5lZWRzIHRvIHN0YW5kIGFzIGEgc2VwYXJhdGUgYml0KS4KPj4+Cj4+
PiBGb3IgWnZiYiBhbmQgWnZrbmhiLCBJIHVzZWQgdGhlIGZvbGxvd2luZyBjb2RlOgo+Pj4KPj4+
IHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZiYl9idW5kbGVkX2V4dHNbXSA9IHsK
Pj4+ICAgICAgIFJJU0NWX0lTQV9FWFRfWlZLQiwKPj4+ICAgICAgIFJJU0NWX0lTQV9FWFRfWlZC
Qgo+Pj4gfTsKPj4+Cj4+PiBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a25oYl9i
dW5kbGVkX2V4dHNbXSA9IHsKPj4+ICAgICAgIFJJU0NWX0lTQV9FWFRfWlZLTkhBLAo+Pj4gICAg
ICAgUklTQ1ZfSVNBX0VYVF9aVktOSEIKPj4+IH07Cj4+Pgo+Pj4gV2hpY2ggY29ycmVjdGx5IHJl
c3VsdHMgaW4gYm90aCBleHRlbnNpb24gKHN1cGVyc2V0ICsgYmFzZSBzZXQpIGJlaW5nCj4+PiBl
bmFibGVkIHdoZW4gb25seSBvbmUgaXMgc2V0LiBJcyB0aGVyZSBzb21ldGhpbmcgdGhhdCBJJ20g
bWlzc2luZyA/Cj4+Pgo+Pj4+Cj4+Pj4gSU1PLCBkZWNvbXBvc2luZyAicHVyZSIgYnVuZGxlcyBt
YWtlcyBzZW5zZSBzaW5jZSBvdGhlcndpc2UgdXNlcm1vZGUKPj4+PiB3b3VsZCBoYXZlIHRvIHF1
ZXJ5IG11bHRpcGxlIGRpc3RpbmN0IGJpdG1hcHMgdGhhdCBtZWFudCB0aGUgc2FtZQo+Pj4+IHRo
aW5nIChlZyBjaGVjayB0aGUgWmsgYml0LCBvciBtYXliZSBjaGVjayB0aGUgWmtuL1prci9aa3Qg
Yml0cywgb3IKPj4+PiBtYXliZSBjaGVjayB0aGUgWmJrYi9aYmtjLi4uIGJpdHMsIGFuZCB0aGV5
J3JlIGFsbCBlcXVpdmFsZW50KS4gQnV0Cj4+Pj4gd2hlbiBhbiBleHRlbnNpb24gaXMgYSBzdXBl
cnNldCB0aGF0IGFsc28gY29udGFpbnMgbG9vc2UgY2hhbmdlLCB0aGVyZQo+Pj4+IHJlYWxseSBh
cmVuJ3QgdHdvIGVxdWl2YWxlbnQgYml0bWFza3MsIGVhY2ggYml0IGFkZHMgc29tZXRoaW5nIG5l
dy4KPj4+Cj4+PiBBZ3JlZWQgYnV0IGlmIGEgc3lzdGVtIG9ubHkgcmVwb3J0IFpWQkIgZm9yIGlu
c3RhbmNlIGFuZCB0aGUgdXNlciB3YW50cwo+Pj4gWlZLQiwgdGhlbiBpdCBpcyBjbGVhciB0aGF0
IFpWS0Igc2hvdWxkIGJlIHJlcG9ydGVkIGFzIHdlbGwgSSBndWVzcy4gU28KPj4+IGluIHRoZSBl
bmQsIGl0IHdvcmtzIG11Y2ggbGlrZSAiYnVuZGxlIiBleHRlbnNpb24sIGp1c3QgdGhhdCB0aGUg
YnVuZGxlCj4+PiBpcyBhY3R1YWxseSBhICJyZWFsIiBJU0EgZXh0ZW5zaW9uIGJ5IGl0c2VsZi4K
Pj4+Cj4+PiBDbMOpbWVudAo+Pj4KPj4+Pgo+Pj4+IFRoZXJlJ3MgYW4gYXJndW1lbnQgdG8gYmUg
bWFkZSBmb3Igc3RpbGwgdHVybmluZyBvbiB0aGUgY29udGFpbmluZwo+Pj4+IGV4dGVuc2lvbnMg
dG8gY292ZXIgZm9yIHNpbGx5IElTQSBzdHJpbmdzIChlZyBJU0Egc3RyaW5ncyB0aGF0Cj4+Pj4g
YWR2ZXJ0aXNlIHRoZSBzdXBlcnNldCBidXQgZmFpbCB0byBhZHZlcnRpc2UgdGhlIGNvbnRhaW5p
bmcKPj4+PiBleHRlbnNpb25zKS4gV2UgY2FuIGRlY2lkZSBpZiB3ZSB3YW50IHRvIHdvcmsgdGhh
dCBoYXJkIHRvIGNvdmVyCj4+Pj4gaHlwb3RoZXRpY2FsIGJyb2tlbiBJU0Egc3RyaW5ncyBub3cs
IG9yIHdhaXQgdW50aWwgdGhleSBzaG93IHVwLgo+Pj4+IFBlcnNvbmFsbHkgSSB3b3VsZCB3YWl0
IHVudGlsIHNvbWV0aGluZyBicm9rZW4gc2hvd3MgdXAuIEJ1dCBvdGhlcnMKPj4+PiBtYXkgZmVl
bCBkaWZmZXJlbnRseS4KPj4KPj4gSSdtIG5vdCByZWFsbHkgc3VyZSB0aGF0IHRob3NlIGFyZSAi
c2lsbHkiIElTQSBzdHJpbmdzLiBQZW9wbGUgYXJlIGdvaW5nCj4+IHRvIGRvIGl0IHRoYXQgd2F5
IGJlY2F1c2UgaXQgaXMgbXVjaCBlYXNpZXIgdGhhbiBzcGVsbGluZyBvdXQgNSBkb3plbgo+PiBz
dWItY29tcG9uZW50cywgYW5kIGl0IGlzIHByZXR0eSBpbmV2aXRhYmxlIHRoYXQgc3Vic2V0cyB3
aWxsIGJlCj4+IGludHJvZHVjZWQgaW4gdGhlIGZ1dHVyZSBmb3IgZXh0ZW5zaW9ucyB3ZSBjdXJy
ZW50bHkgaGF2ZS4KPj4KPj4gSU1PLCBpdCdzIHBlcmZlY3RseSB2YWxpZCB0byBzYXkgeW91IGhh
dmUgdGhlIHN1cGVyc2V0cyBhbmQgbm90IHNwZWxsCj4+IG91dCBhbGwgdGhlIHN1YmNvbXBvbmVu
dHMuCj4gCj4gSG0sIG9rLiBJZiBJU0Egc3RyaW5ncyBhcmUgbGlrZWx5IHRvIGJlIHdyaXR0ZW4g
dGhhdCB3YXksIHRoZW4gSSBhZ3JlZQo+IGhhdmluZyB0aGUga2VybmVsIGZsaXAgb24gYWxsIHRo
ZSBjb250YWluZWQgZXh0ZW5zaW9ucyBpcyBhIGdvb2QgaWRlYS4KPiBXZSBjYW4gdHdlYWsgcGF0
Y2ggMiB0byBzdXBwb3J0IHRoZSBwYXJzaW5nIG9mIHN0cnVjdAo+IHJpc2N2X2lzYV9leHRfZGF0
YSB3aXRoIGJvdGggLmlkIGFuZCAuYnVuZGxlX3NpemUgc2V0IChpbnN0ZWFkIG9mIG9ubHkKPiBv
bmUgb3IgdGhlIG90aGVyIGFzIGl0IGlzIG5vdykuIExvb2tpbmcgYmFjayBhdCB0aGF0IHBhdGNo
LCBpdCBsb29rcwo+IHF1aXRlIGRvYWJsZS4gQWxyaWdodCEKCkhleSBFdmFuLAoKZG8geW91IGhh
dmUgYW55dGhpbmcgYWdhaW5zdCB1c2luZyB0aGlzIGNvZGU6CgpzdGF0aWMgY29uc3QgdW5zaWdu
ZWQgaW50IHJpc2N2X3p2YmJfYnVuZGxlZF9leHRzW10gPSB7CglSSVNDVl9JU0FfRVhUX1pWS0Is
CglSSVNDVl9JU0FfRVhUX1pWQkIKfTsKCi4uLgoKVGhlbiBkZWNsYXJpbmcgenZiYiBsaWtlIHRo
YXQ6CgpfX1JJU0NWX0lTQV9FWFRfQlVORExFKHp2YmIsIHJpc2N2X3p2YmJfYnVuZGxlZF9leHRz
KSwKCkkgYWdyZWUgdGhhdCBpdCBpcyAqbm90KiBhIGJ1bmRsZWQgZXh0ZW5zaW9uIGJ1dCBpdCBh
Y3R1YWxseSBhbHJlYWR5CndvcmtzIHdpdGggQ29ub3IncyBjb2RlLiBOb3Qgc3VyZSB0aGF0IGFk
ZGluZyBtb3JlIGNvZGUgaXMgbmVlZGVkIHRvCmhhbmRsZSB0aGF0IGNhc2UuCgpDbMOpbWVudAoK
Cj4gCj4gLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
