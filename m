Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10A4E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VltVEzCsPgb2BycSSQtoMIih3hDfRRK8kNunOS6ZjgA=; b=BuIsaJGmhwgn+k
	BxWeHR9whbckBIpsRjpkSDdRZQYCEmWwPd4csjbqggrt/I7i2fScuN40VeEEg3wgQv9EDxd4aoaqa
	23vyjzpKi+DWw51MG8YNnZz2qZ5Jf3Jl52oeDovBQCkYg8OtYICou0EZBLuxJkeX4Lg6W42sZMJHe
	5rMZClS5bHImaF1Ows+map/zFFty2XJFAClx/T+8sDvVEoXo/Rk1Pk/hbYM+pxNvCqKvhxDIvQjhx
	RO58jT1kMVv4LzfGYxEaL0ucJ7vVDV2XqqDHWwXTCVbtTRMYYma/mKTRLr7fWVG1gH3l85LXy51+p
	14L0lfhwjFi/EPmEU50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoaA-00000001h6M-2K9v;
	Mon, 06 Jan 2025 14:59:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoRl-00000001ePi-3MNF
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 14:51:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2163bd70069so18976225ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736175073; x=1736779873; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOK73fk5BcqpXBWGXiXK/2r2Q/HSBhtDNxcil5lgxY4=;
        b=18IjkdZB1sl23hKyRLpYhwGphxIsy4RpOW9LY3SBxuhujxI2LPePTKySl/8RGe0S9W
         m1D9+B0AaWz0fjd3EdS4U95YL8QAvGPJ6nmt1046RKrnFKooV0PCa8hXQHI7Ses68gvF
         I7rcf5V6K6kFkojS6X2QhDF1SylcQQ1fXSbwa8mr+RPmILUq3NZ+Zgf8NX38ZjCHaxSV
         kOR6wgFn5K0F/nOJzywrutoJ/PmTK8XUImDB4VO1YXHH2j4249+hAzxIstX2YpjcSfZl
         a6uR99fOsLQf/AD0Gjj+TowrnXo0JOtVKRn1yLfi2Rl8ckr48c4pNznmiDiPt7SOsonR
         wshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736175073; x=1736779873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOK73fk5BcqpXBWGXiXK/2r2Q/HSBhtDNxcil5lgxY4=;
        b=Tvucl4cPpMyey5fz4ZHxD+M46Pj5Qmh9GycLt9+puYbCzj+VEM9G6TQHW7Jk3bH1EM
         BkJLXivMPCfrOKCIoInBl+E3op2u0cTu3A8Nptfulum3OCIW1p2WFe2JyWbL6/+BFaAF
         xHt9MvfOWNcgEILbF+v5SAB0d7TINYd87FEnO+CHKWp+X2Jm/3FrdyZSjV4ZEE1Y4vic
         axTQjSiLxbcw2ML4Cb8R/JwGEbjI3kP9qlSu9HGFnO+70UwZJX8rz18XEbuHm8e8Jhsb
         tfRbiqDzpcXDMZDhdJrfEflMtQsJLyBW8ZWn645MEUvMMaXDL++JpksWzDSos/vgOTGb
         6uEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnCiNf4iuRAlMM0K6eqDcTIfIr2bHYd4bW5eulTdVD9NU28+d+2c6PbdbiHyl/LnJXQyrvNDXNw15+Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSSXN4X0qF6xl9fMKpf5KCjTYQ/z8dOb5Tr7RqW85Frs56gE5i
	KXBuPmbMcB1QLOd9X2pJELFbK9S1OwN0WPO0WVWqIWorFLZZZ0ljuxjZoSrFz1I=
X-Gm-Gg: ASbGncuPtpWuuSWdpl7BEHTQptjvay5yh76sDwlDkVYAGUHxtePN14egjEa4xq+mvrR
	yrTRCYvRsA3OSF4QWtY0or5ZaA5WWfKw/BNgbDPWCXDf6uRDIc5aGMinwKpGJ/2Opyv4tm2HdX1
	DP5uv9ohfgnE8qlEgfEqJU2GGGNXJGdszQiKruMsBFUrcrvUksiexy8haChvMsVyzciWrvjLuP6
	aq2MAL4zLTB1WO88bet9J19RJG7g7hKLGT/BAI4tKOSJ6wqFj4mMoD4rAhqMu9eX96cBrjbzJdr
	FR6Bx7OGD3ZZAWlCEod04Sy8Hw==
X-Google-Smtp-Source: AGHT+IEMyRp3uhokE5fpsrQ0ahliyXQ4FuvbhV4LWvfkPAe+5IdC+g7MYTMXOyD8XUASqnvoHf7qZw==
X-Received: by 2002:a05:6a21:1517:b0:1e1:adb9:d1a6 with SMTP id adf61e73a8af0-1e5e08439e8mr92752061637.41.1736175073132;
        Mon, 06 Jan 2025 06:51:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad830acdsm31491327b3a.46.2025.01.06.06.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:51:12 -0800 (PST)
Message-ID: <f9c8a934-2d44-4be7-899b-4853945e3eaa@rivosinc.com>
Date: Mon, 6 Jan 2025 15:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: misaligned: disable pagefault before accessing
 user memory
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>
References: <20250103160214.657508-1-cleger@rivosinc.com>
 <e68e8c3a-2d22-4385-9de5-e167974604fd@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <e68e8c3a-2d22-4385-9de5-e167974604fd@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_065113_844267_EC81710F 
X-CRM114-Status: GOOD (  22.17  )
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

CgpPbiAwNi8wMS8yMDI1IDE1OjM3LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gSGkgQ2zDqW1l
bnQsCj4gCj4gT24gMDMvMDEvMjAyNSAxNzowMiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBD
YWxsaW5nIGNvcHlfe2Zyb20vdG99X3VzZXIoKSBpbiBpbnRlcnJ1cHQgY29udGV4dCBtaWdodCBh
Y3R1YWxseSBzbGVlcAo+PiBhbmQgZGlzcGxheSBhIEJVRyBtZXNzYWdlOgo+Pgo+PiBbwqDCoCAx
MC4zNzcwMTldIEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250
ZXh0IGF0Cj4+IGluY2x1ZGUvbGludXgvdWFjY2Vzcy5oOjE2Mgo+PiBbwqDCoCAxMC4zNzk4Njhd
IGluX2F0b21pYygpOiAwLCBpcnFzX2Rpc2FibGVkKCk6IDEsIG5vbl9ibG9jazogMCwgcGlkOgo+
PiA4OCwgbmFtZTogc3NoLWtleWdlbgo+PiBbwqDCoCAxMC4zODAwMDldIHByZWVtcHRfY291bnQ6
IDAsIGV4cGVjdGVkOiAwCj4+IFvCoMKgIDEwLjM4MDMyNF0gQ1BVOiAwIFVJRDogMCBQSUQ6IDg4
IENvbW06IHNzaC1rZXlnZW4gTm90IHRhaW50ZWQKPj4gNi4xMy4wLXJjNS0wMDAxMy1nMzQzNWNk
NWYxMzMxLWRpcnR5ICMxOQo+PiBbwqDCoCAxMC4zODA2MzldIEhhcmR3YXJlIG5hbWU6IHJpc2N2
LXZpcnRpbyxxZW11IChEVCkKPj4gW8KgwqAgMTAuMzgwNzk4XSBDYWxsIFRyYWNlOgo+PiBbwqDC
oCAxMC4zODExMDhdIFs8ZmZmZmZmZmY4MDAxM2QzMD5dIGR1bXBfYmFja3RyYWNlKzB4MWMvMHgy
NAo+PiBbwqDCoCAxMC4zODE2OTBdIFs8ZmZmZmZmZmY4MDAwMjJkOD5dIHNob3dfc3RhY2srMHgy
OC8weDM0Cj4+IFvCoMKgIDEwLjM4MTgxMl0gWzxmZmZmZmZmZjgwMDBlZTFjPl0gZHVtcF9zdGFj
a19sdmwrMHg0YS8weDY4Cj4+IFvCoMKgIDEwLjM4MTk1OF0gWzxmZmZmZmZmZjgwMDBlZTRlPl0g
ZHVtcF9zdGFjaysweDE0LzB4MWMKPj4gW8KgwqAgMTAuMzgyMDQ3XSBbPGZmZmZmZmZmODAwNjVl
MGE+XSBfX21pZ2h0X3Jlc2NoZWQrMHhmYS8weDEwNAo+PiBbwqDCoCAxMC4zODIxNzJdIFs8ZmZm
ZmZmZmY4MDA2NWU1Nj5dIF9fbWlnaHRfc2xlZXArMHg0Mi8weDY2Cj4+IFvCoMKgIDEwLjM4MjI2
N10gWzxmZmZmZmZmZjgwMWIwYzVlPl0gX19taWdodF9mYXVsdCsweDFjLzB4MjQKPj4gW8KgwqAg
MTAuMzgyMzYzXSBbPGZmZmZmZmZmODA0NDE1ZTQ+XSBfY29weV9mcm9tX3VzZXIrMHgyOC8weGMy
Cj4+IFvCoMKgIDEwLjM4MjQ1OV0gWzxmZmZmZmZmZjgwMDE1MmNhPl0gaGFuZGxlX21pc2FsaWdu
ZWRfbG9hZCsweDFjYS8weDJmYwo+PiBbwqDCoCAxMC4zODI1NjVdIFs8ZmZmZmZmZmY4MGEwMzNh
MD5dIGRvX3RyYXBfbG9hZF9taXNhbGlnbmVkKzB4MjQvMHhlZQo+PiBbwqDCoCAxMC4zODI3MTRd
IFs8ZmZmZmZmZmY4MGEwZGM2Nj5dIGhhbmRsZV9leGNlcHRpb24rMHgxNDYvMHgxNTIKPj4KPj4g
SW4gb3JkZXIgdG8gc2FmZWx5IGhhbmRsZSB1c2VyIG1lbW9yeSBhY2Nlc3MgZnJvbSB0aGlzIGNv
bnRleHQsIGRpc2FibGUKPj4gcGFnZSBmYXVsdCB3aGlsZSBjb3B5aW5nIHVzZXIgbWVtb3J5LiBB
bHRob3VnaCB0aGlzIG1pZ2h0IGxlYWQgdG8gY29weQo+PiBmYWlsdXJlIGluIHNvbWUgY2FzZXMg
KG9mZmxpbmVkIHBhZ2UpLCB0aGlzIGlzIHRoZSBiZXN0IHdlIGNhbiB0cnkgdG8gYmUKPj4gc2Fm
ZS4KPj4KPj4gRml4ZXM6IGI2ODZlY2RlYWNmNiAoInJpc2N2OiBtaXNhbGlnbmVkOiBSZXN0cmlj
dCB1c2VyIGFjY2VzcyB0bwo+PiBrZXJuZWwgbWVtb3J5IikKPj4gU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+Pgo+PiAtLS0KPj4gwqAgYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVk
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC8KPj4gdHJhcHNfbWlzYWxpZ25lZC5jCj4+IGluZGV4IDdj
YzEwOGFlZDc0ZS4uNzVhMDhlZDIwMDcwIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCj4+IEBAIC0zNTUsNyArMzU1LDcgQEAgc3RhdGljIGludCBoYW5kbGVfc2NhbGFy
X21pc2FsaWduZWRfbG9hZChzdHJ1Y3QKPj4gcHRfcmVncyAqcmVncykKPj4gwqAgewo+PiDCoMKg
wqDCoMKgIHVuaW9uIHJlZ19kYXRhIHZhbDsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGVw
YyA9IHJlZ3MtPmVwYzsKPj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nIGluc247Cj4+ICvCoMKgwqAg
dW5zaWduZWQgbG9uZyBpbnNuLCBjb3B5X2xlbjsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25n
IGFkZHIgPSByZWdzLT5iYWRhZGRyOwo+PiDCoMKgwqDCoMKgIGludCBmcCA9IDAsIHNoaWZ0ID0g
MCwgbGVuID0gMDsKPj4gwqAgQEAgLTQ0MSw3ICs0NDEsMTYgQEAgc3RhdGljIGludCBoYW5kbGVf
c2NhbGFyX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QKPj4gcHRfcmVncyAqcmVncykKPj4gwqAgwqDC
oMKgwqDCoCB2YWwuZGF0YV91NjQgPSAwOwo+PiDCoMKgwqDCoMKgIGlmICh1c2VyX21vZGUocmVn
cykpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChjb3B5X2Zyb21fdXNlcigmdmFsLCAodTggX191
c2VyICopYWRkciwgbGVuKSkKPj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogV2UgY2FuIG5vdCBzbGVlcCBpbiBleGNlcHRpb24gY29udGV4dC4gRGlzYWJsZSBwYWdl
ZmF1bHQgdG8KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBhdm9pZCBhIHBvdGVudGlhbCBzbGVlcCB3
aGlsZSBhY2Nlc3NpbmcgdXNlciBtZW1vcnkuIFNpZGUKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBl
ZmZlY3QgaXMgdGhhdCBpZiBpdCB3b3VsZCBoYXZlIHNsZWVwLCB0aGVuIHRoZSBjb3B5IHdpbGwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBmYWlsLgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiAr
wqDCoMKgwqDCoMKgwqAgcGFnZWZhdWx0X2Rpc2FibGUoKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGNv
cHlfbGVuID0gY29weV9mcm9tX3VzZXIoJnZhbCwgKHU4IF9fdXNlciAqKWFkZHIsIGxlbik7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBwYWdlZmF1bHRfZW5hYmxlKCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoY29weV9sZW4pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtMTsKPj4g
wqDCoMKgwqDCoCB9IGVsc2Ugewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KCZ2YWwsICh1
OCAqKWFkZHIsIGxlbik7Cj4+IEBAIC00NjMsNyArNDcyLDcgQEAgc3RhdGljIGludCBoYW5kbGVf
c2NhbGFyX21pc2FsaWduZWRfc3RvcmUoc3RydWN0Cj4+IHB0X3JlZ3MgKnJlZ3MpCj4+IMKgIHsK
Pj4gwqDCoMKgwqDCoCB1bmlvbiByZWdfZGF0YSB2YWw7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQg
bG9uZyBlcGMgPSByZWdzLT5lcGM7Cj4+IC3CoMKgwqAgdW5zaWduZWQgbG9uZyBpbnNuOwo+PiAr
wqDCoMKgIHVuc2lnbmVkIGxvbmcgaW5zbiwgY29weV9sZW47Cj4+IMKgwqDCoMKgwqAgdW5zaWdu
ZWQgbG9uZyBhZGRyID0gcmVncy0+YmFkYWRkcjsKPj4gwqDCoMKgwqDCoCBpbnQgbGVuID0gMCwg
ZnAgPSAwOwo+PiDCoCBAQCAtNTM5LDcgKzU0OCwxNiBAQCBzdGF0aWMgaW50Cj4+IGhhbmRsZV9z
Y2FsYXJfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4gwqAgwqDCoMKgwqDCoCBpZiAodXNlcl9t
b2RlKHJlZ3MpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoY29weV90b191c2VyKCh1OCBfX3Vz
ZXIgKilhZGRyLCAmdmFsLCBsZW4pKQo+PiArwqDCoMKgwqDCoMKgwqAgLyoKPj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiBXZSBjYW4gbm90IHNsZWVwIGluIGV4Y2VwdGlvbiBjb250ZXh0LiBEaXNhYmxl
IHBhZ2VmYXVsdCB0bwo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGF2b2lkIGEgcG90ZW50aWFsIHNs
ZWVwIHdoaWxlIGFjY2Vzc2luZyB1c2VyIG1lbW9yeS4gU2lkZQo+PiArwqDCoMKgwqDCoMKgwqDC
oCAqIGVmZmVjdCBpcyB0aGF0IGlmIGl0IHdvdWxkIGhhdmUgc2xlZXAsIHRoZW4gdGhlIGNvcHkg
d2lsbAo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGZhaWwuCj4+ICvCoMKgwqDCoMKgwqDCoMKgICov
Cj4+ICvCoMKgwqDCoMKgwqDCoCBwYWdlZmF1bHRfZGlzYWJsZSgpOwo+PiArwqDCoMKgwqDCoMKg
wqAgY29weV9sZW4gPSBjb3B5X3RvX3VzZXIoKHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxlbik7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBwYWdlZmF1bHRfZW5hYmxlKCk7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoY29weV9sZW4pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtMTsK
Pj4gwqDCoMKgwqDCoCB9IGVsc2Ugewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KCh1OCAq
KWFkZHIsICZ2YWwsIGxlbik7Cj4gCj4gCj4gSSdtIHdvbmRlcmluZyB3aHkgdGhlIGlycXMgYXJl
IGRpc2FibGVkIGhlcmU/IFdoYXQgcHJldmVudHMgdXMgZnJvbQo+IGVuYWJsaW5nIHRoZW0/IElJ
VUMsIGlmIGZvciBzb21lIHJlYXNvbiB0aGUgdXNlciBwYWdlIGlzIG5vdCBpbiBtZW1vcnksCj4g
d2Ugd2lsbCBmYWlsIHRoZSBtaXNhbGlnbmVkIGFjY2VzcyBhbmQga2lsbCB0aGUgcHJvY2Vzcywg
c28gc3VjaAo+IGZhaWx1cmVzIGNvdWxkIGJlIGNvbXBsZXRlbHkgcmFuZG9tIHJpZ2h0Pwo+IAo+
IEJ1dCBpZiB3ZSBnbyBmb3IgdGhpcyBzb2x1dGlvbiwgSSB0aGluayB0aGUgc2FtZSBuZWVkcyB0
byBiZSBkb25lIGluCj4gX19yZWFkX2luc24oKS4KCkZvcmdvdCB0byBhbnN3ZXIgdG8gdGhhdCBx
dWVzdGlvbjoKCkluZGVlZCwgaXQgc2hvdWxkIGJlIG1vZGlmaWVkIHRoZSBzYW1lIHdheSB0aG91
Z2ggSXQgZGlkIG5vdCB0cmlnZ2VyZWQKYW55IHdhcm5pbmcgc2luY2UgaW4gdXNlcyB0aGUgInJh
dyIgYWNjZXNzIHNvIHRoZXJlIGlzIG5vIGNoZWNrIGRvbmUKYmVmb3JlIGFjY2Vzc2luZyB0aGUg
bWVtb3J5IChpZSBubyBjYWxsIHRvIG1pZ2h0X3NsZWVwKCkpLiBJJ2xsIHNlbmQgYSBWMi4KClRo
YW5rcywKCkNsw6ltZW50Cgo+IAo+IExldCBtZSBrbm93IGlmIEkgbWlzdW5kZXJzdG9vZCBzb21l
dGhpbmcuCj4gCj4gVGhhbmtzLAo+IAo+IEFsZXgKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
