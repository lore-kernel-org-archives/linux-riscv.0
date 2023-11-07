Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95056C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 08:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9E8CbbpIYMgV2Vr0UuepAw6ik+roE4UibC9vThiFzDE=; b=JHrN0vvywroi1z
	JoSfwO/9jaJ79gWQS3WJ52vcCydRIFhgaU5fVq1EYYi3w9Z1X+azpIAgKjNkk+MBN9lPQzwu/7Csz
	LdO/UArB7RwawtOARWhulL6GZEqkGOFWt781skdb7OeS2RRZT/cBwsM/eczByYrgmVZdtEz78f0x1
	mCR98UwMUe0f567ruzYSzhcTlQpPyGh+y5LEVbs/LirnlS3vDN0F2Jr5I6uNAKh+mQ1b7d/sQ0D/8
	jriwsjDIK+uFTlLF/ZnOuhcHUG7SMetcWaDwJwF1J1OzqVI/4GgQWcdU4Wf0Jk22gBsT6dEkX86De
	JT0ZWeisQeiUI6q1S4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HbN-000po6-0I;
	Tue, 07 Nov 2023 08:38:25 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HbK-000pms-31
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 08:38:24 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5409bc907edso8930600a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 00:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699346300; x=1699951100; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6dvthR2+uXXaKtZhfu19I8uRaF5Ucp/hKjGsFNZse0=;
        b=YOj88Dskd8uNEL4Bqk/rOQqFmi/JMtanzmaSE1+ICpS3ZG3IPTYhTRX69lH0OnRJVG
         w3fBeEt2PzxLkMYFwIqhEoLfDZdLKZlru+OFEnWoOlAQYu6/tFMdnqVoTcNQcSPrZV/x
         DYrd4LipdD9kXQ4SHgKcZpLtXVG4WAIM9IQ3h/WK/xAK72SxBw9QYVnpxt6AiYrf4sNl
         gNEompgg2YfX9PjnoiwwHrS9AlPTkpw3Cmj2mx2IXNwRu4zxyU1r7mnZGJngP61aDM25
         3m/OobceX1m29xAcUpKszodEpnBB9mi/OiJnyZgeg1b1Den9a9VNMtnXB6Y1DDr0YkiW
         OzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699346300; x=1699951100;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6dvthR2+uXXaKtZhfu19I8uRaF5Ucp/hKjGsFNZse0=;
        b=xAaRKNhjHspi8H1w6cCvm3gL569yUSM1h5vhZCaC0HZyiKMV6lRZOCxHnj97Vf/nGH
         NB20bBJLy1pbJ1ciYN3xbFx/QrqWAiwBkh5QLgSKmKygklPcgVtCpclnEjHBUKduoIBs
         MSRmCLYvvXV65LEqMeBWfxaWerRvCp6x7wR1dLo2gQ+6M/Yy4mu09ChvXYzlvbWUQMU8
         tipRuqZ3avYDRSXPuIZ7cAgt5NGChsiJ8w//Tw/q5xpbLabX3U1QDrU1ZAm+LSui+Ooj
         dtIJzCJ6mSxKszWSiv4rdi/f8SpI9mIuYaXprylr1gChHl6D3LcS2nq31DDnof1RMc1a
         QQvg==
X-Gm-Message-State: AOJu0Yzgb6kY8xJIPejXM6i152If4WC0yqPJNqbkw0kK5TSSmvJKG/c6
	7SkyA8I935jLhFNjmat0IevSEfT6qNSj8t6n
X-Google-Smtp-Source: AGHT+IFAT164A5+0+DDOFocrTagB32BVc9/FCJDm9227j7/4JmRH7adGpr3sTfoKn2svR2FIqdu2QQ==
X-Received: by 2002:a05:6402:28b3:b0:540:118:e8f with SMTP id eg51-20020a05640228b300b0054001180e8fmr25487702edb.24.1699346299233;
        Tue, 07 Nov 2023 00:38:19 -0800 (PST)
Received: from smtpclient.apple ([132.69.236.77])
        by smtp.gmail.com with ESMTPSA id r15-20020aa7cfcf000000b0053e469f6505sm5095738edy.26.2023.11.07.00.38.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2023 00:38:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH v6 0/4] riscv: tlb flush improvements
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <mhng-4e3e3fa7-5e25-494c-a3ad-6ef7ec78cf20@palmer-ri-x1c9a>
Date: Tue, 7 Nov 2023 10:38:01 +0200
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>,
 linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Lad Prabhakar <prabhakar.csengg@gmail.com>
Message-Id: <D1DBDDD4-9B6A-40EA-993E-FF6CF02A2668@gmail.com>
References: <mhng-4e3e3fa7-5e25-494c-a3ad-6ef7ec78cf20@palmer-ri-x1c9a>
To: Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_003822_973670_5B38BAC5 
X-CRM114-Status: GOOD (  16.78  )
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

Cgo+IE9uIE5vdiA3LCAyMDIzLCBhdCA5OjAw4oCvQU0sIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+IAo+IE9uIE1vbiwgMzAgT2N0IDIwMjMgMDc6MDE6NDggUERU
ICgtMDcwMCksIG5hZGF2LmFtaXRAZ21haWwuY29tIHdyb3RlOgo+PiAKPj4+IE9uIE9jdCAzMCwg
MjAyMywgYXQgMzozMCBQTSwgQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29t
PiB3cm90ZToKPj4+ICsgb25fZWFjaF9jcHVfbWFzayhjbWFzaywKPj4+ICsgX19pcGlfZmx1c2hf
dGxiX3JhbmdlX2FzaWQsCj4+PiArICZmdGQsIDEpOwo+PiAKPj4gVW5yZWxhdGVkLCBidXQgaGF2
aW5nIGZlZAo+IAo+IERvIHlvdSBtZWFuIGBmdGRgPwo+IAo+IElmIHNvIEknbSBub3QgYWxsIHRo
YXQgY29udmluY2VkIHRoYXQncyBhIHByb2JsZW06IHN1cmUgaXQncyA0eGBsb25nYCwgc28gd2Ug
cGFzcyBpdCBvbiB0aGUgc3RhY2sgaW5zdGVhZCBvZiByZWdpc3RlcnMsIGJ1dCBvdGhlcndpc2Ug
d2UnZCBuZWVkIGFub3RoZXIgYG9uX2VhY2hfY3B1X21hc2soKWAgY2FsbGJhY2sgdG8gc2hpbSBz
dHVmZiB0aHJvdWdoIHZpYSByZWdpc3RlcnMuCgpJIGhhdmUgbm8gaWRlYSB3aHkgeW91IG5lZWQg
dG8gbW92ZSBzdHVmZiB0aHJvdWdoIHRoZSByZWdpc3RlcnMuCgo+PiBBY3R1YWxseSwgaXQgaXMg
YmVzdCBub3QgdG8gcHV0IGl0IG9uIHRoZSBzdGFjaywgaWYgcG9zc2libGUgdG8gcmVkdWNlCj4+
IGNhY2hlIHRyYWZmaWMuCj4gCj4gU29ycnkgaWYgSSdtIGp1c3QgbWlzc2luZyBzb21ldGhpbmcs
IGJ1dCBJJ20gbm90IGNvbnZpbmNlZCB0aGlzIGlzIGEgbWVhc3VyYWJsZSBwZXJmb3JtYW5jZSBw
cm9ibGVtLgoKSSBhbSBub3QgZ29pbmcgdG8gdHJ5IHRvIGNvbnZpbmNlIHlvdSAoSSByYW4gdGhl
IG51bWJlcnMgb24geDg2IGEgbG9uZwp0aW1lIGFnbykuCgpUaGVyZSBpcyBhIGNvc3Qgb2YgYm91
bmNpbmcgY2FjaGUtbGluZXMgKGJlY2F1c2UgbXVsdGlwbGUgY29yZXMgYWNjZXNzCnRoZSBzdGFj
ayksIFRMQi1taXNzIG9uIHJlbW90ZSBjb3JlcyAod2hpY2ggaXMgbW9zdGx5IGF2b2lkYWJsZSBp
ZiBmdGQKaXMgZ2xvYmFsKS4KCkhhdmluZyBzYWlkIHRoYXQsIHRoZSBvcHRpbWl6YXRpb25zIHlv
dSBhZGRlZCBub3cgYW5kIGludGVuZCB0byBhZGQgaW4KdGhlIG5leHQgc3RlcHMgYXJlIGRlZmlu
aXRlbHkgbW9yZSBpbXBvcnRhbnQgZm9yIHBlcmZvcm1hbmNlLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
