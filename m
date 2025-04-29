Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BFAC369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTVzD6DCXKvwROe2k9wwIJS1PrEa/0jf0yEooM8UY6w=; b=B9aXWSdOgreRuy
	e3F6fS3P681oLL0IDNM3kTe492ZtOzrmp0EZjr4qWVrcskoqu5zWQQ2WjEEbQTaHZ+NoBeBObGW8h
	HH/41+4Wj/J5Nn+LGYKCcVplZ3KCReiN8RkFvX7ttgPSzVucFPtb5Sr8DN1FyK3pGW4eSuxB0Xu0i
	MbdSgajY+HQGi0xU8yoDeW0lxLiFhp4cSrgfEMuhH2UtxVnVJIhye1oXfJM7MKRmgfn9eaZQdQzib
	Qq1TyVPAZMSZQc9nKH9OcY+nXwNqPeqysNfs4ekF2rKNpAYP4O6jNI+efBxgQTZWwnwQcuDSPQZqC
	0rcpIig3x5Jv3yknp88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9f5J-00000008hT8-0vLB;
	Tue, 29 Apr 2025 07:08:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9f3i-00000008h9c-1Jub
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 07:07:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39efc1365e4so2610972f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745910431; x=1746515231; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IouLfT/aoPa/R6OCtl0qGB7KPQxFbX8a1jsVDadjoIc=;
        b=MgZbO8VkYNboJBQue8Smb0ZUiadsnDnTHHlwBraKQIUrCttnN9+lz05AxeEGi8DVhc
         x55Qz2sdorTCGK0b66RN7y2LxJURWUYWk0XCb0kB36qKkpVmfnhkN+iNRXs1NhnawXX3
         s0AGSwXEriBugYrigO2ygaeph9qQ2tD7h3fL+PIxM+xV4m6/YEtceglkjSh90BjFZ3dA
         LPmD2qM11EDbKoScGg9xTVzqJhrL1knXU2OkbeB5FBda7gZVlw8mekEiu3zrpvR03Z88
         G+gNv58mPZ7gO8/MBQAstL9+Qy5AHDLLTG4LZcsPHGaTFgeJ1lVH7wMtI5YJAfbqvob/
         /jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745910431; x=1746515231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IouLfT/aoPa/R6OCtl0qGB7KPQxFbX8a1jsVDadjoIc=;
        b=ANHY5CXjt3oVY0jitpa/2VB+aj/BirPYsrex7UyGZh8obXOcvtRa+JdfeZMbOCsA15
         CBRO2+zXrpVAG59ygK31kfT3mnyDnzz9wSNHG9aif98TVq+4Mo35sJbU7h8PWGw1OxKJ
         p0tXnBJ43k/esf/DVHfKs4a+vIwKV2MA32Q0A4HN7QsuM7l54rcCNCAtdcmNQ/6gScIc
         Q9HK/B1BQNaVuDzpNWEMspXphogA7iwKiwe9DNL/FUnyVEmFFv5Xla2fQdWSvvePnm3+
         MNrmv/g6fCLeq3exfo8FLs6CI4uFLiHGeHWNsSxauLDf6/+KP97DzUcjMIxqYo44ueiM
         RFnw==
X-Forwarded-Encrypted: i=1; AJvYcCXllY+JOdpCPCqbo/xG5MZd/29p1hicxewjMmMZLUds0PJZo43IJ5J/v7v7L4mMgEAw2sStg7v6BaYGQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwupyQf8XTo4stzneqigY+i9LPnpZbNlMVDhxUhRwxnVATaO2wA
	zPNnVIsU7E3j9kTK9zwh+7Qj38pedp8ARJT0gsxoxPG/Zj4FqJK1Fg3Y+6kgWF8=
X-Gm-Gg: ASbGncs/V33fRGL/VmryEif3ojVv0NnlZ14hVeiNI9/ZgdgV+Akd91vjUhoUWEZRM+p
	RjfDdsUplIFxcw4naN9S0ifXh3YNNS59qILiLVV06b+vYyTL8lObZ+CAZ9y9SyNycv0UMMiHReZ
	fb2g8ON2UHBviYmhTCs0FF1t/G3T4f4abf9SRWpklFqzH/yDz3n78yjwTdG/ij7yTjaCg1uRxFh
	ubgHoTqpW1s8PlVXUPhJVt+FCMohYHR+bMz45z0I3kYjw5TMaWY+8iRV7SgnyGlaik9lLqLHGYB
	zGq8etC3if1nrZK56IC57BB8Fyim2PHiHz6yNLz/rZ5oA3KY9dujF8VspUZaav5RzkW6y1L7mC1
	5xFNBOKPuzw==
X-Google-Smtp-Source: AGHT+IFj2OXOUboew7ts54Nxo8wn4cB8hSI+ZHyOLFUpeeQtltGs4Zu4l7bQC4xebcFyF+TLDjHQIg==
X-Received: by 2002:a5d:64ce:0:b0:399:71d4:a9 with SMTP id ffacd0b85a97d-3a08a3c94b1mr1324087f8f.52.1745910430947;
        Tue, 29 Apr 2025 00:07:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a07a7c39a0sm10150725f8f.101.2025.04.29.00.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 00:07:10 -0700 (PDT)
Message-ID: <b779beed-e44e-4a5e-9551-4647682b0d21@rivosinc.com>
Date: Tue, 29 Apr 2025 09:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 jesse@rivosinc.com, evan@rivosinc.com, zhangchunyan@iscas.ac.cn,
 samuel.holland@sifive.com, zong.li@sifive.com
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com>
 <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
 <22a2c734-b446-4b1e-a2bc-a0080656fe29@ghiti.fr>
 <f4be063b-f321-45d4-9891-b50f30beb1ef@rivosinc.com>
 <CAHh=Yk-jk-KzDK_kJTbGi8HOZqsUPZjdGN8eF_op=HKF2V-Udw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAHh=Yk-jk-KzDK_kJTbGi8HOZqsUPZjdGN8eF_op=HKF2V-Udw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_000714_624504_2EF1B49F 
X-CRM114-Status: GOOD (  21.29  )
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

CgpPbiAyOS8wNC8yMDI1IDA3OjU3LCBOeWxvbiBDaGVuIHdyb3RlOgo+IEhpIENsw6ltZW50LAo+
IAo+IFRoYW5rIHlvdSBmb3Igc2hhcmluZyB5b3VyIHBhdGNoLiBJ4oCZdmUgcmV2aWV3ZWQgdGhl
IGNoYW5nZXMsIGJ1dCBJ4oCZbQo+IG5vdCBzdXJlIEkgZnVsbHkgZ3Jhc3AgdGhlIGRlc2lnbiBy
YXRpb25hbGUuCj4gQ291bGQgeW91IHBsZWFzZSBicmllZmx5IGV4cGxhaW4gdGhlIG1haW4gY29u
c2lkZXJhdGlvbnMgYmVoaW5kIHRoaXMKPiBtb2RpZmljYXRpb24/Cj4gCj4gV2XigJlyZSBhbHNv
IGRpc2N1c3NpbmcgaW50ZXJuYWxseSB0aGUgZGlmZmVyZW5jZXMgYmV0d2VlbiBteSBfbm9mYXVs
dAo+IGFwcHJvYWNoIGFuZCB5b3VyIElSUS1lbmFibGUgYXBwcm9hY2gsIGFuZCBJ4oCZZCBhcHBy
ZWNpYXRlIHlvdXIKPiBwZXJzcGVjdGl2ZSBvbiB0aGUgcHJvcyBhbmQgY29ucyBvZiBlYWNoLgoK
SGkgTnlsb24sCgpUaGVyZSBpcyBub3QgcmVhbGx5IHBybyB2cyBjb25zLiBVc2luZyBub2ZhdWx0
IHdvdWxkIGxlYWQgdG8gZmFpbHVyZSB0bwpyZWFkIGZyb20gdXNlciBtZW1vcnkgdGhhdCBpcyBw
YWdlZCBvdXQgZm9yIGluc3RhbmNlLiBUaGlzIGlzIG5vdCByZWFsbHkKYWNjZXB0YWJsZSwgd2Ug
c2hvdWxkIGhhbmRsZSB1c2VyIG1pc2FsaWduZWQgYWNjZXNzIGV2ZW4gYXQgYW4gYWRkcmVzcwp0
aGF0IHdvdWxkIGdlbmVyYXRlIGEgcGFnZSBmYXVsdC4gT25lIHdheSB0byBkbyBzbyBpcyB0byBy
ZWVuYWJsZSBJUlFzCndoZW4gY29taW5nIGZyb20gdXNlcnNwYWNlIGFuZCB1c2UgY29weV9mcm9t
L3RvX3VzZXIoKSBzaW5jZSBpdCBjYW4Kc2xlZXAgd2hpbGUgYWNjZXNzaW5nIG1lbW9yeS4gTXkg
bGF0ZXN0IHZlcnNpb24gb2YgdGhlIHNlcmllcyBbMV0gbm93CnJlZW5hYmxlcyBpbnRlcnJ1cHRz
IG9ubHkgd2hlbiBjb21pbmcgZnJvbSB1c2Vyc3BhY2UuCgpUaGFua3MsCgpDbMOpbWVudAoKWzFd
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDIyMTYyMzI0Ljk1NjA2
NS0xLWNsZWdlckByaXZvc2luYy5jb20vCj4gCj4gTG9va2luZyBmb3J3YXJkIHRvIHlvdXIgc3Vn
Z2VzdGlvbnMhCj4gCj4gTnlsb24KPiAKPiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+IOaWvCAyMDI15bm0NOaciDEx5pelIOmAseS6lCDkuIvljYg0OjM45a+r6YGT77yaCj4+
Cj4+Cj4+Cj4+IE9uIDExLzA0LzIwMjUgMTA6MzUsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+
IEhpIENsw6ltZW50LAo+Pj4KPj4+IE9uIDExLzA0LzIwMjUgMDk6MzYsIENsw6ltZW50IEzDqWdl
ciB3cm90ZToKPj4+PiBIaSBOeWxvbiwKPj4+Pgo+Pj4+IEkgYWxyZWFkeSBoYXZlIGEgcGVuZGlu
ZyBmaXggZm9yIHRoYXQgYnVnIHdoaWNoIGlzIHRvIHJlZW5hYmxlCj4+Pj4gaW50ZXJydXB0cyB3
aGlsZSBoYW5kbGluZyBtaXNhbGlnbmVkIGZhdWx0cy4gUGxlYXNlIHNlZToKPj4+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDMxNzE3MDYyNS4xMTQyODcwLTEyLQo+
Pj4+IGNsZWdlckByaXZvc2luYy5jb20vCj4+Pgo+Pj4KPj4+IENhbiB5b3UgZXh0cmFjdCB0aGlz
IGZpeCBmcm9tIHRoZSBzZXJpZXMgc28gdGhhdCBpdCBjYW4gYmUgbWVyZ2VkIGluIDYuMTU/Cj4+
Cj4+IEhpIEFsZXgsCj4+Cj4+IFllcyBzdXJlLCBJIGNhbiBzZW5kIGEgc21hbGwgc2VyaWVzIGFz
IHdlbGwuIEhvd2V2ZXIsIEknZCBsaWtlIHRoZQo+PiBhc3NvY2lhdGVkIGtzZWxmdGVzdCB0byBi
ZSByZXZpZXdlZCBzaW5jZSBpdCB3b3VsZCBhbGxvdyB0byBjYXRjaCBzdWNoCj4+IGJlaGF2aW9y
ICh0aGVyZSBpcyBubyB0ZXN0IGZvciBtaXNhbGlnbmVkIGRlbGVnYXRpb24geWV0KS4KPj4KPj4g
VGhhbmtzLAo+Pgo+PiBDbMOpbWVudAo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+PiBBbGV4Cj4+
Pgo+Pj4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+Pj4+IENsw6ltZW50Cj4+Pj4KPj4+PiBPbiAx
MS8wNC8yMDI1IDA5OjM4LCBOeWxvbiBDaGVuIHdyb3RlOgo+Pj4+PiBVc2UgY29weV9mcm9tX3Vz
ZXJfbm9mYXVsdCgpIGFuZCBjb3B5X3RvX3VzZXJfbm9mYXVsdCgpIGluc3RlYWQgb2YKPj4+Pj4g
Y29weV9mcm9tL3RvX3VzZXIgZnVuY3Rpb25zIGluIHRoZSBtaXNhbGlnbmVkIGFjY2VzcyB0cmFw
IGhhbmRsZXJzLgo+Pj4+Pgo+Pj4+PiBUaGUgZm9sbG93aW5nIGJ1ZyByZXBvcnQgd2FzIGZvdW5k
IHdoZW4gZXhlY3V0aW5nIG1pc2FsaWduZWQgbWVtb3J5Cj4+Pj4+IGFjY2Vzc2VzOgo+Pj4+Pgo+
Pj4+PiBCVUc6IHNsZWVwaW5nIGZ1bmN0aW9uIGNhbGxlZCBmcm9tIGludmFsaWQgY29udGV4dCBh
dCAuL2luY2x1ZGUvCj4+Pj4+IGxpbnV4L3VhY2Nlc3MuaDoxNjIKPj4+Pj4gaW5fYXRvbWljKCk6
IDAsIGlycXNfZGlzYWJsZWQoKTogMSwgbm9uX2Jsb2NrOiAwLCBwaWQ6IDExNSwgbmFtZTogdHdv
Cj4+Pj4+IHByZWVtcHRfY291bnQ6IDAsIGV4cGVjdGVkOiAwCj4+Pj4+IENQVTogMCBVSUQ6IDAg
UElEOiAxMTUgQ29tbTogdHdvIE5vdCB0YWludGVkIDYuMTQuMC1yYzUgIzI0Cj4+Pj4+IEhhcmR3
YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPj4+Pj4gQ2FsbCBUcmFjZToKPj4+Pj4g
ICBbPGZmZmZmZmZmODAwMTYwZWE+XSBkdW1wX2JhY2t0cmFjZSsweDFjLzB4MjQKPj4+Pj4gICBb
PGZmZmZmZmZmODAwMDIzMDQ+XSBzaG93X3N0YWNrKzB4MjgvMHgzNAo+Pj4+PiAgIFs8ZmZmZmZm
ZmY4MDAxMGZhZT5dIGR1bXBfc3RhY2tfbHZsKzB4NGEvMHg2OAo+Pj4+PiAgIFs8ZmZmZmZmZmY4
MDAxMGZlMD5dIGR1bXBfc3RhY2srMHgxNC8weDFjCj4+Pj4+ICAgWzxmZmZmZmZmZjgwMDRlNDRl
Pl0gX19taWdodF9yZXNjaGVkKzB4ZmEvMHgxMDQKPj4+Pj4gICBbPGZmZmZmZmZmODAwNGU0OTY+
XSBfX21pZ2h0X3NsZWVwKzB4M2UvMHg2Mgo+Pj4+PiAgIFs8ZmZmZmZmZmY4MDE5NjNjND5dIF9f
bWlnaHRfZmF1bHQrMHgxYy8weDI0Cj4+Pj4+ICAgWzxmZmZmZmZmZjgwNDI1MzUyPl0gX2NvcHlf
ZnJvbV91c2VyKzB4MjgvMHhhYQo+Pj4+PiAgIFs8ZmZmZmZmZmY4MDAwMjk2Yz5dIGhhbmRsZV9t
aXNhbGlnbmVkX3N0b3JlKzB4MjA0LzB4MjU0Cj4+Pj4+ICAgWzxmZmZmZmZmZjgwOWVhZTgyPl0g
ZG9fdHJhcF9zdG9yZV9taXNhbGlnbmVkKzB4MjQvMHhlZQo+Pj4+PiAgIFs8ZmZmZmZmZmY4MDlm
NGYxYT5dIGhhbmRsZV9leGNlcHRpb24rMHgxNDYvMHgxNTIKPj4+Pj4KPj4+Pj4gRml4ZXM6IGI2
ODZlY2RlYWNmNiAoInJpc2N2OiBtaXNhbGlnbmVkOiBSZXN0cmljdCB1c2VyIGFjY2VzcyB0bwo+
Pj4+PiBrZXJuZWwgbWVtb3J5IikKPj4+Pj4gRml4ZXM6IDQ0MTM4MTUwNmJhNyAoInJpc2N2OiBt
aXNhbGlnbmVkOiByZW1vdmUgQ09ORklHX1JJU0NWX01fTU9ERQo+Pj4+PiBzcGVjaWZpYyBjb2Rl
IikKPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29t
Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+
Cj4+Pj4+IC0tLQo+Pj4+PiAgIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8
IDQgKystLQo+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2Lwo+Pj4+PiBrZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5j
Cj4+Pj4+IGluZGV4IGQ3Mjc1ZGZiNmI3ZS4uNTYzZjczZjg4ZmE4IDEwMDY0NAo+Pj4+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4+Pj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4+Pj4+IEBAIC00NTUsNyArNDU1LDcgQEAg
c3RhdGljIGludCBoYW5kbGVfc2NhbGFyX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QKPj4+Pj4gcHRf
cmVncyAqcmVncykKPj4+Pj4gICAgICAgICB2YWwuZGF0YV91NjQgPSAwOwo+Pj4+PiAgICAgICBp
ZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4+Pj4+IC0gICAgICAgIGlmIChjb3B5X2Zyb21fdXNlcigm
dmFsLCAodTggX191c2VyICopYWRkciwgbGVuKSkKPj4+Pj4gKyAgICAgICAgaWYgKGNvcHlfZnJv
bV91c2VyX25vZmF1bHQoJnZhbCwgKHU4IF9fdXNlciAqKWFkZHIsIGxlbikpCj4+Pj4+ICAgICAg
ICAgICAgICAgcmV0dXJuIC0xOwo+Pj4+PiAgICAgICB9IGVsc2Ugewo+Pj4+PiAgICAgICAgICAg
bWVtY3B5KCZ2YWwsICh1OCAqKWFkZHIsIGxlbik7Cj4+Pj4+IEBAIC01NTYsNyArNTU2LDcgQEAg
c3RhdGljIGludCBoYW5kbGVfc2NhbGFyX21pc2FsaWduZWRfc3RvcmUoc3RydWN0Cj4+Pj4+IHB0
X3JlZ3MgKnJlZ3MpCj4+Pj4+ICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+Pj4+ICAg
ICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+Pj4+PiAtICAgICAgICBpZiAoY29weV90b191
c2VyKCh1OCBfX3VzZXIgKilhZGRyLCAmdmFsLCBsZW4pKQo+Pj4+PiArICAgICAgICBpZiAoY29w
eV90b191c2VyX25vZmF1bHQoKHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxlbikpCj4+Pj4+ICAg
ICAgICAgICAgICAgcmV0dXJuIC0xOwo+Pj4+PiAgICAgICB9IGVsc2Ugewo+Pj4+PiAgICAgICAg
ICAgbWVtY3B5KCh1OCAqKWFkZHIsICZ2YWwsIGxlbik7Cj4+Pj4KPj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+Pj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+PiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
