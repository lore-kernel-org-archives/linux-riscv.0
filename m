Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14478CDD1DC
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 20:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDKH3+4LarHm9huTMlGnaEVSeuKZ/m1qZJ9ErAS7P8I=; b=ixBvTWbvhQfewn
	lgJn5h8c4kyq5YQCvy6YkB9oe7NkP6AlDVvzRivSe2zcE5+e50qr+Dxy5CW6NFS8dzkExTCLlza9i
	7sD+LlWFxN26hFGaffiuSC2/69BJM7HrW/tkQUbZ5oXbIGJuLvzAGekK2YQkAclwE9Dt/vwimpuTu
	XwoUtLWBdfh6GNpOE8VdfMUI16KIHQWyysMI7wERkitWbquotplQ0P0AKHnNABgDP42eeKYikNJmy
	OQvcWXZC0voTUu58SqSPDjZbWIa0M4tmoyS59owGYxwUJOCwoodckm4JOXPxh/tM5/asWOAizZtvQ
	eSdftv1pPNzWqh5UuxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suHvj-0000000C5lu-0ZbW;
	Fri, 27 Sep 2024 20:51:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suHvg-0000000C5lY-49TQ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 20:51:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2059112f0a7so24328045ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 13:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727470268; x=1728075068; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shLDirPvQHu0zX2krQXjYGhHMytzkPRkdTMRivfTN8M=;
        b=aYldk9Ux0wqOG944MRZUtRQnAtpj+2wry8n20c5QydFqoNMLKH35CBSeR/5tj2149R
         Cc6Nf958DFYTcJY2/fa63XDP4MZlgGZz6tkN+h27JIpQlJJcJ7cSFdiMKy7E7Eup80HH
         YEULhCJvPzcVgODjN3qBuBGNke9XU9QgLkbSTRBIb6GGtJZQrEiTxwGU9jHuHZ/E1dC5
         kEjJrrhnOqHlNGOAYcYeAFB3rNbDZPr9v7Igi48DdLroYhSPGTTKWjM0dFKpvOMXBref
         7uYVqQEkIx6dAM5DplIBvSRpXHltXbFXr4D6SEzKJ7EasiTqAQDGS1ri5rYv+oyxAy83
         zrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727470268; x=1728075068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shLDirPvQHu0zX2krQXjYGhHMytzkPRkdTMRivfTN8M=;
        b=esTYQ0Drozx2MmSsdu13ytUgMfzrO6DWFx+odREMhNwzstkM3myql7V64MZ+k6I7b6
         KMuRL+SuYrUHCzlEifZTlHuwIQqHvQuJ0bgKHRw4be+eZlYoIbTrdXRXUm/Z10nGmKYI
         G5uRGvSa2GLjHVGrDyFMrmiLx22C5tyw4c89g4pXPOkp7Ys6JNVntajRDb9KHIpm/LNm
         u7NKaSf5hgioJcH/5OS3Mvz6AIIXBMVD8LFAB9ROLEbmOcQoyvVECRIKGwI2WElr2CXn
         A0E0VUTHqvFwcI1g6MPNhxTt7T9ZH+88ajwW6RuTrvJgTKVyHOFqiUpMw0RT4P3Qi9Bq
         HTlw==
X-Forwarded-Encrypted: i=1; AJvYcCVhdYUcM2/3mdB8vxuPGsnQvd3FR6V8tcljezVDfW1VzbaUKsMMsuFX46UHbNodEuH8I2+oHnx3OJtDBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZZenEu730z/K33IKSxqHmwRp8ybABjWCmkrXH1ugd6AoqGy6V
	EGW99vyRahqwlmFwQcIzaylEdxE3e8JKYZK2P4M+cxPOai3QBxFviViyuwWz4RvU8xw9ogkkWtd
	ErfPLW3JIE3GXhjBQ/roEywEzig4=
X-Google-Smtp-Source: AGHT+IFc1YB99jbzqgA1b3v/qMqek7DloIcwJTgr24Uxixyvc8uET1u/DUrw9pFeTRB5saCg2/+neLug3iuvpvUpUDM=
X-Received: by 2002:a17:90a:6d43:b0:2e0:8e36:132 with SMTP id
 98e67ed59e1d1-2e0b89ac7f4mr5057181a91.3.1727470267698; Fri, 27 Sep 2024
 13:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240927131355.350918-1-bjorn@kernel.org>
In-Reply-To: <20240927131355.350918-1-bjorn@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 27 Sep 2024 13:50:55 -0700
Message-ID: <CAEf4BzYCf2+8JkCjWZWGaNQcEc_=WO_emP2GPBQGZyrWm8APUg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] libbpf: Add missing per-arch include path
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Mykola Lysenko <mykolal@fb.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_135109_049699_A031B9E5 
X-CRM114-Status: GOOD (  16.18  )
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

T24gRnJpLCBTZXAgMjcsIDIwMjQgYXQgNjoxNOKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gbGliYnBmIGRvZXMgbm90IGluY2x1ZGUgdGhlIHBlci1hcmNoIHRvb2xzIGluY2x1
ZGUgcGF0aCwgZS5nLgo+IHRvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS4gU29tZSBhcmNoaXRlY3R1
cmVzIGRlcGVuZCB0aG9zZSBmaWxlcyB0bwo+IGJ1aWxkIHByb3Blcmx5Lgo+Cj4gSW5jbHVkZSB0
b29scy9hcmNoLyQoU1VCQVJDSCkvaW5jbHVkZSBpbiB0aGUgbGliYnBmIGJ1aWxkLgo+Cj4gRml4
ZXM6IDZkNzRkMTc4ZmU2ZSAoInRvb2xzOiBBZGQgcmlzY3YgYmFycmllciBpbXBsZW1lbnRhdGlv
biIpCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+
IC0tLQo+ICB0b29scy9saWIvYnBmL01ha2VmaWxlIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
Yi9icGYvTWFrZWZpbGUgYi90b29scy9saWIvYnBmL01ha2VmaWxlCj4gaW5kZXggMWIyMmYwZjM3
Mjg4Li44NTdhNWY3YjQxM2QgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGliL2JwZi9NYWtlZmlsZQo+
ICsrKyBiL3Rvb2xzL2xpYi9icGYvTWFrZWZpbGUKPiBAQCAtNjEsNyArNjEsOCBAQCBpZm5kZWYg
VkVSQk9TRQo+ICBlbmRpZgo+Cj4gIElOQ0xVREVTID0gLUkkKG9yICQoT1VUUFVUKSwuKSBcCj4g
LSAgICAgICAgICAtSSQoc3JjdHJlZSkvdG9vbHMvaW5jbHVkZSAtSSQoc3JjdHJlZSkvdG9vbHMv
aW5jbHVkZS91YXBpCj4gKyAgICAgICAgICAtSSQoc3JjdHJlZSkvdG9vbHMvaW5jbHVkZSAtSSQo
c3JjdHJlZSkvdG9vbHMvaW5jbHVkZS91YXBpIFwKPiArICAgICAgICAgIC1JJChzcmN0cmVlKS90
b29scy9hcmNoLyQoU1JDQVJDSCkvaW5jbHVkZQo+Cj4gIGV4cG9ydCBwcmVmaXggbGliZGlyIHNy
YyBvYmoKPgoKRG8geW91IGtub3cgd2hhdCBleGFjdGx5IGlzIHVzZWQgZnJvbSB0b29scy9hcmNo
LyQoU1JDQVJDSCkvaW5jbHVkZQpmb3IgKEkgYXNzdW1lKSBSSVNDLVY/IEknbSBhc2tpbmcgYmVj
YXVzZSB3ZSdkIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQKR2l0aHViIHZlcnNpb24gb2YgbGliYnBm
IE1ha2VmaWxlIGFuZCBpbmNsdWRlIGRpcmVjdG9yeSBoYXMgYWxsIHRoZQpuZWNlc3NhcnkgcGll
Y2VzIGFzIHdlbGwgKHNvIEknZCBhcHByZWNpYXRlIGlmIHlvdSBjb3VsZCB0YWtlIGEgbG9vawph
dCB0aGF0IGFzIHdlbGwsIGlmIHlvdSBoYXZlbid0IGFscmVhZHkpLgoKPgo+IGJhc2UtY29tbWl0
OiBkYjVjYTI2NWUzMzM0YjQ4YzRlM2ZhMDdlZWY3OWU4YmM1NzhjNDMwCj4gLS0KPiAyLjQzLjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
