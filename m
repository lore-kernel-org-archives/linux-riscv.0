Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA43EE14C3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 20:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ok7R6FIvXUYRKpT4Uf6iV19SZLYh5sRjV1MDkf2npCk=; b=VJpT5oSBayUGX2
	CMoy6g55fsYNMFANRrQ67mBYtkKeyKUGdkYGEqGfEPpsV6nlgatot640RuhwWSwdoZ8laLd7Mxcqz
	+4m+Qz6i41Zj9DzYrnD1bfgPezE2Ua+ruBTi9Noa5lySeuKxASUGKWV/RGKkg8HZTarooMjbRwxaH
	Lse+YB+t0cNcBZFoxCKbK+C1g6Wsz+dgWRC7Ad1M/yoYWv+FYIMU6KYNVTXB/6Wv1hUUopod+MKav
	lOjP3g7+DNaQFNomROrKF+rBOARTjesQDf/12MF7HrGUrraqfJoHwSxdZKTDjrGxogiFFR2ZGRk1D
	4DEQi++Qu+XIXWBEj/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdz2m-00AqUA-0q;
	Wed, 06 Sep 2023 20:22:32 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdz2k-00AqTE-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 20:22:31 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5654051b27fso223083a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 13:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694031747; x=1694636547; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OD7kjBc/iBCRToogLtJPKs8deknmulxtzUCmXzFwU6E=;
        b=UrQ/EdoOgZ59wLcBWKkkjJCVIqQqnbpaf7ohvrQPHS2s8JkmQpA/zNdr4sQ+i0Aukl
         AdPhmAFLxdMzjsGUbBV4Z4zmnKfgn1OfD6J8QU3DgdR3hKsj+NzJra6W3EDLCkLv0b3c
         rnkvzaaaDiSiVaSkhTHKX2rGp0eZ/gF9w/f9uhRsp7ljCsNe1KGKQj0pcDibalGpCG5i
         H7pFbdALzMKhtzr7DIBj1xn8LSAhy0+2QNlEiCKzdV1vlRVm4y2S0B5pIyZxNeMcAimg
         uUajwzscNkvqRCDwX9zQ1o5ZkF5vHifKbD3d7KacNHpSTTbFpjv+/48QoijB+eJwGflt
         vk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694031747; x=1694636547;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OD7kjBc/iBCRToogLtJPKs8deknmulxtzUCmXzFwU6E=;
        b=fEb6Q2wY3n4qOJC9Tt9pW73jhIfhTHfMJrypzyKYJsVWzbNBQNVE1edVRMB3ABdGa2
         KEN1eh07/cQxP4E2Jasz6jZ+ftSCF3+G32taPYxVy7nT0fyYdGy8xxqqgaQj23X8U/+7
         P5aqc5FWRtgTCQuGZ03/XnKBbFA/VppejL9AAgVb0oG8CJtGO/TmkPTX/OPf70C8cJsn
         742QEDGwxs+R0DStnAQdKTfQtA5m/fMvgysWZJYDEnIaxN+W8w8GI537diHSaE+DQKEA
         iSP8I/5ZXPfQ3U2KhxTE4950RJtjGyi+npr9Ad6kBg//5jzCjndNBLeRPcBVzYfr3p5J
         zJlg==
X-Gm-Message-State: AOJu0YwvAVcnIU4v6PqiWylYkqK/MuUeCpFWIQsQ4+qLd4yP4thfJaL3
	KQZb5nlF172Nc+fjMeWGM8U=
X-Google-Smtp-Source: AGHT+IGmvOVV/7HqCSH46swl/UmrMsBdSsMfSDMwiGwNRsu0ygeNZKfizRBSj3U2w7qfL3CnxZ0o2w==
X-Received: by 2002:a17:90b:212:b0:271:ae19:c608 with SMTP id fy18-20020a17090b021200b00271ae19c608mr15956217pjb.41.1694031746571;
        Wed, 06 Sep 2023 13:22:26 -0700 (PDT)
Received: from smtpclient.apple ([66.170.99.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a17090ae99700b00256a4d59bfasm169219pjy.23.2023.09.06.13.22.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Sep 2023 13:22:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
Date: Wed, 6 Sep 2023 13:22:13 -0700
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>,
 linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>
Message-Id: <C92430BE-4DA3-487B-BFD2-58EE4A93396F@gmail.com>
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com>
 <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_132230_544269_A607C1D2 
X-CRM114-Status: GOOD (  19.52  )
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

Cgo+IE9uIFNlcCA2LCAyMDIzLCBhdCA0OjQ4IEFNLCBMYWQsIFByYWJoYWthciA8cHJhYmhha2Fy
LmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IAo+IEhpIEFsZXhhbmRyZSwKPiAKPiBPbiBUdWUs
IEF1ZyAxLCAyMDIzIGF0IDk6NTjigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZv
c2luYy5jb20+IHdyb3RlOgo+PiAKPj4gVGhpcyBmdW5jdGlvbiB1c2VkIHRvIHNpbXBseSBmbHVz
aCB0aGUgd2hvbGUgdGxiIG9mIGFsbCBoYXJ0cywgYmUgbW9yZQo+PiBzdWJ0aWxlIGFuZCB0cnkg
dG8gb25seSBmbHVzaCB0aGUgcmFuZ2UuCj4+IAo+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IHdlIGNh
biBvbmx5IHVzZSBQQUdFX1NJWkUgYXMgc3RyaWRlIHNpbmNlIHdlIGRvbid0IGtub3cKPj4gdGhl
IHNpemUgb2YgdGhlIHVuZGVybHlpbmcgbWFwcGluZyBhbmQgdGhlbiB0aGlzIGZ1bmN0aW9uIHdp
bGwgYmUgaW1wcm92ZWQKPj4gb25seSBpZiB0aGUgc2l6ZSBvZiB0aGUgcmVnaW9uIHRvIGZsdXNo
IGlzIDwgdGhyZXNob2xkICogUEFHRV9TSVpFLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+PiBSZXZpZXdlZC1ieTogQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPj4gLS0tCj4+IGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGxiZmx1c2guaCB8IDExICsrKysrLS0tLS0KPj4gYXJjaC9yaXNjdi9tbS90bGJm
bHVzaC5jICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+PiAy
IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+PiAKPiBB
ZnRlciBhcHBseWluZyB0aGlzIHBhdGNoLCBJIGFtIHNlZWluZyBtb2R1bGUgbG9hZCBpc3N1ZXMg
b24gUlovRml2ZQo+IChjb21wbGV0ZSBsb2cgWzBdKS4gSSBhbSB0ZXN0aW5nIGRlZmNvbmZpZyAr
IFsxXSAocnovZml2ZSByZWxhdGVkCj4gY29uZmlncykuCj4gCj4gQW55IHBvaW50ZXJzIG9uIHdo
YXQgY291bGQgYmUgYW4gaXNzdWUgaGVyZT8KCk5vbmUgb2YgbXkgYnVzaW5lc3MsIGJ1dCBsb29r
aW5nIGF0IHlvdXIgY29kZSwgaXQgc2VlbXMgdGhhdCB5b3UgZG8gbm90IG1lbW9yeQpiYXJyaWVy
IGJlZm9yZSByZWFkaW5nIG1tX2NwdW1hc2soKSBpbiBfX2ZsdXNoX3RsYl9yYW5nZSgpLiBJIGJl
bGlldmUgeW91CndvdWxkIHdhbnQgdG8gc3luY2hyb25pemUgX19mbHVzaF90bGJfcmFuZ2Ugd2l0
aCBzd2l0Y2hfbW0oKSBzaW1pbGFybHkgdG8gdGhlCndheSBpdCBpcyBkb25lIGluIHg4Ni4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
