Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D437C369A8
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ibqWQHIgRozFzWCdywED7h9njYO5eeGUe+CFAz3Zrk=; b=kz2x+UsHy8236P
	AYDu5yW4R5rnsc5d21bxoz6KS6GlNh+mlM9752fyOK9hH06A9DGs03+nDaQ1D1muB9PRdl5Laf4G/
	UgNSPW5qu8DYJSIAs6I4ihLCPK38y65rdWbPxomcdEy0f6xg1RIVou7+fFDXNla2oDIRlpiejT122
	NrDfGIdr0ki7BjLhsd5Yn4giqmGqh0ivBFnrXYLRnGkXCB/HFYzrJy2/vyf6/mVmx3fK+a++QkJS9
	Nc8n9zmj9Z7gIqV2RFJ33lu0cAn3IRi1tdD0Oo7hZtvGS7TvK7ZPHFvVKnw4IJe3U0H/xAcL0YkcV
	wTw06UFXk9DzRUGqNk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3B9K-0000000DH4v-19gu;
	Fri, 11 Apr 2025 09:58:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39uF-0000000D3Ay-1T2l
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Apr 2025 08:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aAL/6p83YpXkd2lWxaTuipFX1SLH+v+iTkrYyMI4qJI=; b=ivuiUrhw57/XNg2nGQ9P00N2U9
	pABYaGFL3hp4crszK0GkBHJH6Blxn+ekMjEhUskKu0ZpTsObelbLajOjgkp5X2hqITs31QABb8Uqw
	DU+VQugsGbBlrlz4DrKvjckSWmoD8e2qOfjb2y5PJPmprL2hBViYIJzG+5Os3u2o6O8EGKbCOzL0o
	c9fxCQS9Cd4pzJrL3w44VSUIrVElxc82ADvAmUAVIoBD+X1eukwxNcAipCW2gJk27PKW/ROWBJX/w
	vDErwxtnjB2y+qGtkaTzQoXPOALLa6LeqcCN0l0I/ABjITq3PjB8BTylIXOsS9gsebdBNK2KPFsHk
	L+wMDRHg==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u39uB-00000008z3C-3JcI
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 08:38:34 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-730517040a9so2086015b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744360709; x=1744965509; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAL/6p83YpXkd2lWxaTuipFX1SLH+v+iTkrYyMI4qJI=;
        b=yAzMW0x7btFOuek2SzSGqCfXEgfjmzQmFqjINc30sqGveJIufA4WBpqVA38/qfZPaT
         FgmE+zOfMXzr4uqjqFvNSH/hgh4sYQZ5EscLxSn6GO23z8MsCFTNSDsmtTuSDhH9PNG3
         cE/wqNOssnfylMKrQbWYHQAg0NoNQUy/r8YnAl94RPfn5YFXz9fkFA6FdZ1MH42fQGmf
         uDWGmJB9MKNMcePe6O/IFIu1VwRSyRbUjcKS6WG+6TGoyFgm5BbQR4jYSJgYwcN1GY9X
         6251mzwhcKfQ8o5eY6rWNUdwfoanKUMMR0WMnjD0oJYbYo3kgtHQIaqDXoRHa4b8ohuY
         F1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360709; x=1744965509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAL/6p83YpXkd2lWxaTuipFX1SLH+v+iTkrYyMI4qJI=;
        b=CWJ5Z13qVqoT0bWWPFFssLi865Nxa4E/bPSM+CvK7bk7mPC8xcN1H+Bx6c5bg+cJ3r
         g6l/1WYM0DQ9kECIXjlZ843GQioojnHOy8fOYRyd5ev0r2xwkZ0e5snNLb9BjQjW/Js8
         I6jE9bATaoo8ylCbVptfgWE6FPMOf6p9cssRb39lh9HrSy7wzh1k6Z0dVLAaSiiLr5M3
         ugm6E1vs4X4V+yYNF2/T//58MNrkro5CZvSw96QSl8fyw6EKDn5LKNJwvOqL6dJJSLNs
         IneNP27vBiBvJoi0TgKTXRL4t6hUpFVdEwzFwarChnieKNVj0K8ZjbkxI+I+Eo+/FWDW
         ftOw==
X-Gm-Message-State: AOJu0YxKot0CbBxNu4jKzXrWo+jrWq5EfsL93AXOa6ygNQ3WrQP5Bzo1
	iyM/q/5zb6PiwXSFZhjNYW5ZSna90QY3X8ngji8RtwA91w7QiMzKJSY2Od6r70E=
X-Gm-Gg: ASbGncsShIpitcvGBA+M/az/AjKPa1QVVihc8WTHsm5aXKTYPHEZSVUjir25garmsBu
	aG2nCiJDQITRmnLmcMQ5V/f9iTImM4+zkoi/O9CLd2uwhZg+DHlB+0iht8gOBzKFpZrS81SWEcC
	50m7ZNsIN1i3hbqo7iADBvCEy+XzuhTb5HU+86kGHkZV+qC9JGIbu5UdghST/jeGc9Nbc4ybzgP
	j1tKTvOKBxLFBsS7p3D02Il6b5yELoFnbdcVNGdCZOpAj9rsbGPT4CdDKZx7IJKnz8tHo7AqG7k
	gc+zy+JJUieVtjrQw8aFdnxBcdphO29W2Ixk37davjLKts2C0beXXYmoFSZpePWIw2Rwza4zaFF
	sVFtwXhUvXQ==
X-Google-Smtp-Source: AGHT+IEc1zf/fjqiNF1HMx499nzROimsFdgb4amqFTVGVHXlXwhSyAjiyD+tanp9f2f2sNWK6e9KZA==
X-Received: by 2002:a05:6a00:1147:b0:732:5276:4ac9 with SMTP id d2e1a72fcca58-73bd11dd516mr2510411b3a.9.1744360708569;
        Fri, 11 Apr 2025 01:38:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c65c9sm964123b3a.61.2025.04.11.01.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:38:27 -0700 (PDT)
Message-ID: <f4be063b-f321-45d4-9891-b50f30beb1ef@rivosinc.com>
Date: Fri, 11 Apr 2025 10:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: Alexandre Ghiti <alex@ghiti.fr>, Nylon Chen <nylon.chen@sifive.com>,
 linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 jesse@rivosinc.com, evan@rivosinc.com, zhangchunyan@iscas.ac.cn,
 samuel.holland@sifive.com, zong.li@sifive.com
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com>
 <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
 <22a2c734-b446-4b1e-a2bc-a0080656fe29@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <22a2c734-b446-4b1e-a2bc-a0080656fe29@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_093832_038876_180BBAF4 
X-CRM114-Status: GOOD (  15.65  )
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

CgpPbiAxMS8wNC8yMDI1IDEwOjM1LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gSGkgQ2zDqW1l
bnQsCj4gCj4gT24gMTEvMDQvMjAyNSAwOTozNiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBI
aSBOeWxvbiwKPj4KPj4gSSBhbHJlYWR5IGhhdmUgYSBwZW5kaW5nIGZpeCBmb3IgdGhhdCBidWcg
d2hpY2ggaXMgdG8gcmVlbmFibGUKPj4gaW50ZXJydXB0cyB3aGlsZSBoYW5kbGluZyBtaXNhbGln
bmVkIGZhdWx0cy4gUGxlYXNlIHNlZToKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvMjAyNTAzMTcxNzA2MjUuMTE0Mjg3MC0xMi0KPj4gY2xlZ2VyQHJpdm9zaW5jLmNvbS8K
PiAKPiAKPiBDYW4geW91IGV4dHJhY3QgdGhpcyBmaXggZnJvbSB0aGUgc2VyaWVzIHNvIHRoYXQg
aXQgY2FuIGJlIG1lcmdlZCBpbiA2LjE1PwoKSGkgQWxleCwKClllcyBzdXJlLCBJIGNhbiBzZW5k
IGEgc21hbGwgc2VyaWVzIGFzIHdlbGwuIEhvd2V2ZXIsIEknZCBsaWtlIHRoZQphc3NvY2lhdGVk
IGtzZWxmdGVzdCB0byBiZSByZXZpZXdlZCBzaW5jZSBpdCB3b3VsZCBhbGxvdyB0byBjYXRjaCBz
dWNoCmJlaGF2aW9yICh0aGVyZSBpcyBubyB0ZXN0IGZvciBtaXNhbGlnbmVkIGRlbGVnYXRpb24g
eWV0KS4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFRoYW5rcywKPiAKPiBBbGV4Cj4gCj4gCj4+
Cj4+IFRoYW5rcywKPj4KPj4gQ2zDqW1lbnQKPj4KPj4gT24gMTEvMDQvMjAyNSAwOTozOCwgTnls
b24gQ2hlbiB3cm90ZToKPj4+IFVzZSBjb3B5X2Zyb21fdXNlcl9ub2ZhdWx0KCkgYW5kIGNvcHlf
dG9fdXNlcl9ub2ZhdWx0KCkgaW5zdGVhZCBvZgo+Pj4gY29weV9mcm9tL3RvX3VzZXIgZnVuY3Rp
b25zIGluIHRoZSBtaXNhbGlnbmVkIGFjY2VzcyB0cmFwIGhhbmRsZXJzLgo+Pj4KPj4+IFRoZSBm
b2xsb3dpbmcgYnVnIHJlcG9ydCB3YXMgZm91bmQgd2hlbiBleGVjdXRpbmcgbWlzYWxpZ25lZCBt
ZW1vcnkKPj4+IGFjY2Vzc2VzOgo+Pj4KPj4+IEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVk
IGZyb20gaW52YWxpZCBjb250ZXh0IGF0IC4vaW5jbHVkZS8KPj4+IGxpbnV4L3VhY2Nlc3MuaDox
NjIKPj4+IGluX2F0b21pYygpOiAwLCBpcnFzX2Rpc2FibGVkKCk6IDEsIG5vbl9ibG9jazogMCwg
cGlkOiAxMTUsIG5hbWU6IHR3bwo+Pj4gcHJlZW1wdF9jb3VudDogMCwgZXhwZWN0ZWQ6IDAKPj4+
IENQVTogMCBVSUQ6IDAgUElEOiAxMTUgQ29tbTogdHdvIE5vdCB0YWludGVkIDYuMTQuMC1yYzUg
IzI0Cj4+PiBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+PiBDYWxsIFRy
YWNlOgo+Pj4gwqAgWzxmZmZmZmZmZjgwMDE2MGVhPl0gZHVtcF9iYWNrdHJhY2UrMHgxYy8weDI0
Cj4+PiDCoCBbPGZmZmZmZmZmODAwMDIzMDQ+XSBzaG93X3N0YWNrKzB4MjgvMHgzNAo+Pj4gwqAg
WzxmZmZmZmZmZjgwMDEwZmFlPl0gZHVtcF9zdGFja19sdmwrMHg0YS8weDY4Cj4+PiDCoCBbPGZm
ZmZmZmZmODAwMTBmZTA+XSBkdW1wX3N0YWNrKzB4MTQvMHgxYwo+Pj4gwqAgWzxmZmZmZmZmZjgw
MDRlNDRlPl0gX19taWdodF9yZXNjaGVkKzB4ZmEvMHgxMDQKPj4+IMKgIFs8ZmZmZmZmZmY4MDA0
ZTQ5Nj5dIF9fbWlnaHRfc2xlZXArMHgzZS8weDYyCj4+PiDCoCBbPGZmZmZmZmZmODAxOTYzYzQ+
XSBfX21pZ2h0X2ZhdWx0KzB4MWMvMHgyNAo+Pj4gwqAgWzxmZmZmZmZmZjgwNDI1MzUyPl0gX2Nv
cHlfZnJvbV91c2VyKzB4MjgvMHhhYQo+Pj4gwqAgWzxmZmZmZmZmZjgwMDAyOTZjPl0gaGFuZGxl
X21pc2FsaWduZWRfc3RvcmUrMHgyMDQvMHgyNTQKPj4+IMKgIFs8ZmZmZmZmZmY4MDllYWU4Mj5d
IGRvX3RyYXBfc3RvcmVfbWlzYWxpZ25lZCsweDI0LzB4ZWUKPj4+IMKgIFs8ZmZmZmZmZmY4MDlm
NGYxYT5dIGhhbmRsZV9leGNlcHRpb24rMHgxNDYvMHgxNTIKPj4+Cj4+PiBGaXhlczogYjY4NmVj
ZGVhY2Y2ICgicmlzY3Y6IG1pc2FsaWduZWQ6IFJlc3RyaWN0IHVzZXIgYWNjZXNzIHRvCj4+PiBr
ZXJuZWwgbWVtb3J5IikKPj4+IEZpeGVzOiA0NDEzODE1MDZiYTcgKCJyaXNjdjogbWlzYWxpZ25l
ZDogcmVtb3ZlIENPTkZJR19SSVNDVl9NX01PREUKPj4+IHNwZWNpZmljIGNvZGUiKQo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPj4+IFNpZ25lZC1v
ZmYtYnk6IE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4KPj4+IC0tLQo+Pj4gwqAg
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgNCArKy0tCj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2
Lwo+Pj4ga2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+Pj4gaW5kZXggZDcyNzVkZmI2YjdlLi41
NjNmNzNmODhmYTggMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+
Pj4gQEAgLTQ1NSw3ICs0NTUsNyBAQCBzdGF0aWMgaW50IGhhbmRsZV9zY2FsYXJfbWlzYWxpZ25l
ZF9sb2FkKHN0cnVjdAo+Pj4gcHRfcmVncyAqcmVncykKPj4+IMKgIMKgwqDCoMKgwqAgdmFsLmRh
dGFfdTY0ID0gMDsKPj4+IMKgwqDCoMKgwqAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+Pj4gLcKg
wqDCoMKgwqDCoMKgIGlmIChjb3B5X2Zyb21fdXNlcigmdmFsLCAodTggX191c2VyICopYWRkciwg
bGVuKSkKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoY29weV9mcm9tX3VzZXJfbm9mYXVsdCgmdmFs
LCAodTggX191c2VyICopYWRkciwgbGVuKSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtMTsKPj4+IMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBtZW1jcHkoJnZhbCwgKHU4ICopYWRkciwgbGVuKTsKPj4+IEBAIC01NTYsNyArNTU2LDcgQEAg
c3RhdGljIGludCBoYW5kbGVfc2NhbGFyX21pc2FsaWduZWRfc3RvcmUoc3RydWN0Cj4+PiBwdF9y
ZWdzICpyZWdzKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4+
IMKgIMKgwqDCoMKgwqAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+Pj4gLcKgwqDCoMKgwqDCoMKg
IGlmIChjb3B5X3RvX3VzZXIoKHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxlbikpCj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKGNvcHlfdG9fdXNlcl9ub2ZhdWx0KCh1OCBfX3VzZXIgKilhZGRyLCAm
dmFsLCBsZW4pKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC0xOwo+Pj4g
wqDCoMKgwqDCoCB9IGVsc2Ugewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweSgodTggKilh
ZGRyLCAmdmFsLCBsZW4pOwo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
