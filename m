Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C154C0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVrLgCLkNX2ljEDBTPWDe4m5/YYPfKHoCKA9piA86E0=; b=yrVyNxWBOtNTSB
	4O6+g4zpQKfVrhnL1dCenktvxGkWZDhVWKExCLUnEF10JXYjfr4LtiuzAWqaXymLXdbA6qgzN8STh
	0VfJpZ1Wea1BaFlgxeOGtdhDCsC/MoKckVIV4bOf9Xc98uUO8qY2KwAPivzL9kI2Y+gplILYL+tPg
	lUP4G2OUCK/PIiGovqOXMEiYIUZSWfvabfWMpHECpEfuEwvpDtEsh6N1Zbyms7ZT5vSXuwhikXyFO
	znJy74Hr16WH67xGoollGqawWJrV+vL//e0oh8M+U6xJhAR0Kme5DwamuY+svvpEIO+ja6Wm2BvXV
	0GkXK8+E7LQ2nlJwLv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUeQ-000000006gQ-2uud;
	Mon, 10 Feb 2025 14:20:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUeN-000000006fw-2DnQ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 14:20:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43618283dedso43975255e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 06:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739197238; x=1739802038; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgszuVpBHpm7kgwMFZqetPdXB23RF5n9Jkx4SmORsb8=;
        b=TBdY300rbMPB0MxQwabkwh7FgykTquUnPEkLdLltgWZ1TPndeERcS/dvwspQIEp2pK
         zsBmNx6eNl4mhmxEob9mzB/VUHNznOUmab8mnEsj1+Fig29HJT742kWMQORPXIkSOb87
         VDX0F5e6AqKJoQTIVyX6gMUkHiy8jZCSKvPiqannq34jrXRJsFREv8khpd7Ug3vBjt3n
         I0eC3hw3CEd/ykiZQFlaUO2xp5uf8L4TTmmAQqmiSCEMV1j63w+tzyBwpFIv/To3dYg8
         7Sl7VvJ/fmkwhb+gQIW56tM5XZ/sLRkeaSaePlEm33NICoS8aGNMT6AdbrkAroOaDIXC
         zBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197238; x=1739802038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgszuVpBHpm7kgwMFZqetPdXB23RF5n9Jkx4SmORsb8=;
        b=XahynUvQSLJsIyg6u4QnlqnvVM850ZpUSU8ED9mYlF6R+4V0Yt9emI71R9zZaSqwd8
         AAhLKTBq/BKTfymGRB6uU+dHhCz1/51ugvyXdkVswX/2gMqs2fgpZjMLXn+CjrQinggj
         bXUDUQIBWqBR9KOs01o6Fp3QRpo8/Kr4KREZQ75rJVdjFhjC8esIPZV0xsbNH6QRtXOs
         wdLxxMvg47XMBW6QqyN0wZnygnOiaYj54XKNPdD+qe2K5/eCVwRuzCtDHoEfYn03P6XM
         7IQxHLbYG301u/62jHO0Y5dSJRO9P5ozcvj1wEN1uTroIEaVotiLFQ7eeiBv1zbNe/4H
         Zl5w==
X-Forwarded-Encrypted: i=1; AJvYcCXyhUoKDGq8eCxzD027acUIep9dhPHZRjtv1HVrAnN73vKyAHjb4retJRcSRQDpZU1s7DepXSj/FLiAtw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx53nFle+3DbCE/CRPuEHrMElytNo0oka8TkI2f/E8W+sqLSMGb
	9yoNqtP8z9Ur3clc0D/2arHDxqchdRIbaDOA9BDw5244g0uz20OPj9v+GmVTBYMjgylP7akO3zR
	2Fys=
X-Gm-Gg: ASbGncv/Eegc8lLAc7UaOMjb/gLja4Bxg9Ms96EhQPAMqf8ydaxX/66nOtiWm3U4tct
	l8xSUrRq2opynpKESpoy9gNZJJHcG8PzV2K53bEsNdxaZCXkaJnRIVgFdhUysDxfDhy3PRtpDjK
	QuuaFUgnNe/qTit+anUnmsuhvL05hyDv1UhyS2B8RR1ZAdhgEFuh8A0TCzjeGex42RqR/htG3xA
	OTtobHmSE7fmyFATcIYn39F+itsmX1UjIzWB1oD8o2JCnloeBHDcTE7ujCwW3p9HxPCSgUqyclJ
	G1rq4T+eXvG/KiZmZGLanMHRzl8Mogg1TXaFEDDqPelTU2rL7SNMirQawjEg
X-Google-Smtp-Source: AGHT+IGKStkLxD9udujUP1zu76uCLYtJOZTx3Zzwydhoh1KZeTcF+eyoEegxFpUsUPG4WioYRaf5+A==
X-Received: by 2002:a05:600c:899:b0:439:3d5c:8bfb with SMTP id 5b1f17b1804b1-4393d5c8d77mr45714375e9.22.1739197237724;
        Mon, 10 Feb 2025 06:20:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm184114345e9.3.2025.02.10.06.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:20:37 -0800 (PST)
Message-ID: <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>
Date: Mon, 10 Feb 2025 15:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Charlie Jenkins <charlie@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com,
 Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_062039_801347_7DA4AE7F 
X-CRM114-Status: GOOD (  24.18  )
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

CgpPbiAxMC8wMi8yMDI1IDE1OjA2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBGZWIg
MTAsIDIwMjUgYXQgMTI6MDc6NDBQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxMC8wMi8yMDI1IDExOjE2LCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4gT24gU2F0LCBG
ZWIgOCwgMjAyNSBhdCA2OjUz4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiBGcmksIEZlYiAwNywgMjAyNSBhdCAwNToxOTo0N1BN
ICswMTAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+Pj4+IFByb2JpbmcgdW5hbGlnbmVkIGFjY2Vz
c2VzIG9uIGJvb3QgaXMgdGltZSBjb25zdW1pbmcuIFByb3ZpZGUgYQo+Pj4+PiBmdW5jdGlvbiB3
aGljaCB3aWxsIGJlIHVzZWQgdG8gbG9vayB1cCB0aGUgYWNjZXNzIHR5cGUgaW4gYSB0YWJsZQo+
Pj4+PiBieSBpZCByZWdpc3RlcnMuIFZlbmRvcnMgd2hpY2ggcHJvdmlkZSB0YWJsZSBlbnRyaWVz
IGNhbiB0aGVuIHNraXAKPj4+Pj4gdGhlIHByb2JpbmcuCj4+Pj4KPj4+PiBUaGUgYWNjZXNzIGNo
ZWNrZXIgaW4gbXkgZXhwZXJpZW5jZSBpcyBvbmx5IHRpbWUgY29uc3VtaW5nIG9uIHNsb3cKPj4+
PiBoYXJkd2FyZS4gSGFyZHdhcmUgdGhhdCBzdXBwb3J0cyBmYXN0IHVuYWxpZ25lZCBhY2Nlc3Nl
cyBpc24ndCByZWFsbHkKPj4+PiBpbXBhY3RlZCBieSB0aGlzPyBBdm9pZGluZyBhIGxpc3Qgb2Yg
aGFyZHdhcmUgdGhhdCBoYXMgc2xvdy9mYXN0Cj4+Pj4gdW5hbGlnbmVkIGFjY2Vzc2VzIGluIHRo
ZSBrZXJuZWwgd2FzIHRoZSBtYWluIHJlYXNvbiBmb3IgZHluYW1pY2FsbHkKPj4+PiBjaGVja2lu
Zy4gV2UgZGlkIGludHJvZHVjZSB0aGUgY29uZmlnIG9wdGlvbiB0byBjb21waWxlIHRoZSBrZXJu
ZWwgd2l0aAo+Pj4+IGFzc3VtZWQgc2xvdy9mYXN0IGFjY2Vzc2VzLCB3aGljaCBvZiBjb3Vyc2Ug
aGFzIHRoZSBkb3duc2lkZSBvZgo+Pj4+IHJlY29tcGlsaW5nIHRoZSBrZXJuZWwgYW5kIEkgYXNz
dW1lIHRoYXQgeW91IGFscmVhZHkgY29uc2lkZXJlZCB0aGF0Lgo+Pj4KPj4+IFRoZSBrY29uZmln
IG9wdGlvbiBkb2VzIG5vdCBhbGlnbiB3aXRoIHRoZSB2aXNpb24gb2YgcnVubmluZyB0aGUgc2Ft
ZQo+Pj4ga2VybmVsIGltYWdlIGFjcm9zcyBwbGF0Zm9ybXMuCj4+Cj4+IEknZCB3b3VsZCBiZSBh
ZHZvY2F0aW5nIHRvIHJlbW92ZSBjb21waWxlIHRpbWUgb3B0aW9ucyBhcyB3ZWxsIGFuZCB1c2UK
Pj4gYW5vdGhlciB3YXkgdG8gc2tpcCB0aGUgcHJvYmUgKHNlZSBiZWxvdykuCj4+Cj4+Pgo+Pj4+
Cj4+Pj4gSW5zdGVhZCBvZiBoYXZpbmcgYSB0YWJsZSBpbiB0aGUga2VybmVsLCBzb21ldGhpbmcg
dGhhdCB3b3VsZCBiZSBtb3JlCj4+Pj4gcGxhdGZvcm0gYWdub3N0aWMgd291bGQgYmUgdG8gaGF2
ZSBhbiBleHRlbnNpb24gdGhhdCBzaWduYWxzIHRoaXMKPj4+PiBpbmZvcm1hdGlvbi4gVGhhdCBz
ZWVtcyBsaWtlIGl0IHdvdWxkIGFjY29tcGxpc2ggdGhlIHNhbWUgZ29hbCBhbmQKPj4+PiBsZXZl
cmFnZSB0aGUgZXhpc3RpbmcgaW5mcmFzdHJ1Y3R1cmUgaW4gdGhlIGtlcm5lbCwgYWxiZWl0IHdp
dGggdGhlIG5lZWQKPj4+PiB0byBtYWtlIGEgbmV3IGV4dGVuc2lvbi4KPj4+Pgo+Pj4KPj4+IElN
TywgZXhwZWN0aW5nIGFuIElTQSBleHRlbnNpb24gdG8gYmUgZGVmaW5lZCBmb3IgYWxsIHBvc3Np
YmxlCj4+PiBtaWNyb2FyY2hpdGVjdHVyYWwgY2hvaWNlcyBpcyBub3QgZ29pbmcgdG8gc2NhbGUg
c28gaXQgaXMgYmV0dGVyCj4+PiB0byBoYXZlIGluZnJhc3RydWN0dXJlIGluIGtlcm5lbCBpdHNl
bGYgdG8gaW5mZXIgbWljcm9hcmNoaXRlY3R1cmFsCj4+PiBjaG9pY2VzIGJhc2VkIG9uIFJJU0Mt
ViBpbXBsZW1lbnRhdGlvbiBJRC4KPj4KPj4gU2luY2UgYWRkaW5nIGFuIGV4dGVuc2lvbiBzZWVt
cyBxdWl0ZSB1bmxpa2VseSwgYW5kIHRoYXQgYSBkZXZpY2UtdHJlZQo+PiBwcm9wZXJ0eSBpcyBs
aWtlbHkgRFQgY2VudHJpYyBhbmQgbm90IGFwcGxpY2FibGUgdG8gQUNQSSBhcyB3ZWxsLCB3YXMg
YQo+PiBjb21tYW5kIGxpbmUgYXJndW1lbnQgY29uc2lkZXJlZCA/Cj4+Cj4gCj4gSSBkaWQgY29u
c2lkZXIgYWRkaW5nIGEgY29tbWFuZCBsaW5lIG9wdGlvbiBpbiBhZGRpdGlvbiB0byB0aGUgdGFi
bGUsCj4gYWxsb3dpbmcgcGxhdGZvcm1zIHdoaWNoIG5laXRoZXIgaGF2ZSBhIHRhYmxlIGVudHJ5
IFt5ZXRdIG5vciB3YW50IHRvIGRvCj4gdGhlIHNwZWVkIHRlc3QsIHRvIHNldCB3aGF0ZXZlciB0
aGV5IGxpa2UuIEluIHRoZSBlbmQsIEkgZHJvcHBlZCBpdCwgc2luY2UKPiBJIGRvbid0IGhhdmUg
YSB1c2UgY2FzZSBhdCB0aGlzIHRpbWUuIEhvd2V2ZXIsIGlmIHdlIHJlYWxseSBkb24ndCB3YW50
IGEKPiB0YWJsZSwgdGhlbiBJIGNhbiBsb29rIGludG8gdGhlIGNvbW1hbmQgbGluZSBvcHRpb24g
aW5zdGVhZC4KClNvcnJ5IGlmIEkgd2Fzbid0IGNsZWFyLCBJIHdhc24ndCBjb25zaWRlcmluZyB0
aGlzIGFzIGEgcmVwbGFjZW1lbnQgZm9yCnlvdXIgdGFibGUgYnV0IHJhdGhlciBhcyBhIHJlcGxh
Y2VtZW50IHRvIENoYXJsaWUncyBjb21waWxlIHRpbWUgZGVmaW5lCnRvIHNraXAgbWlzYWxpZ25l
ZCBzcGVlZCBwcm9iaW5nIHNpbmNlIGl0IGlzIGxpa2UgImxwaj08eD4iLiBZb3UgY2FuCnNwZWNp
ZnkgaXQgb24gY29tbWFuZCBsaW5lIGlmIHlvdSB3YW50IHRvIHNraXAgdGhlIGxvb3AgdGltZSBk
ZXRlY3Rpb24Kb2YgbG9vcHMgcGVyIGppZmZpZXMgYW5kIGhhdmUgZmFzdGVyIGJvb3QuCgpSZWdh
cmRpbmcgeW91ciB0YWJsZSwgaXQgZmVlbHMgbGlrZSBhIGJpdCBnb2luZyBiYWNrIHRvIG9sZCBo
YXJkY29kZWQKcGxhdGZvcm0gZGVzY3JpcHRpb24gOykuIEkgdGhpbmsgc29tZSBraW5kIG9mIGF1
dG8tZGV0ZWN0aW9uIG9mIHNwZWVkCihub3QgYnVpbHRpbiB0aGUga2VybmVsKSBmb3IgcGxhdGZv
cm1zIGNvdWxkIGJlIGdvb2QgYXMgd2VsbCB0byBza2lwCnByb2JpbmcuCgpBIERUIHByb3BlcnR5
IGFsc28gc2VlbXMgb2sgdG8gbWUgc2luY2UgdGhlIGdvYWwgaXMgdG8gZGVzY3JpYmUKaGFyZHdh
cmUuIFdvdWxkIGEgY29tbW9uIERUL0FDUEkgcHJvcGVydHkgYmUgYXBwcm9wcmlhdGUgPyBUaGUK
ZGV2aWNlX3Byb3BlcnR5IEFQSSB1bmlmaWVkIGJvdGggc28gaWYgd2UgdXNlZCBzb21lIGNvbW1v
biBwcm9wZXJ0eSB0bwpkZXNjcmliZSB0aGUgbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgKGJvdGgg
aW4gRFQgY3B1IG5vZGUvIEFDUEkgQ1BVCmRldmljZSBwYWNrYWdlKSwgd2UgY291bGQga2VlcCBh
IHNpbmdsZSBwYXJzaW5nIG1ldGhvZC4gQnV0IEknbSBubyBBQ1BJCmV4cGVydCBzbyBJIGRvbid0
IGtub3cgaWYgdGhhdCByZWFsbHkgbWFrZSBzZW5zZS4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+
IFRoYW5rcywKPiBkcmV3CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
