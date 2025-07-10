Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DCEC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 07:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLhbNv5CkpMRaPwpJt49fFfIeJ7CxyFw5olMfnrjpPw=; b=dNJOzsOJs9QcV0
	M5TWRBbAqNXd4Axjo/CLTKftog4k63nk5vMMbiiVkIsQ8FeX/l4Mo1P7toy83jTKwSq6WpfjAdHjz
	kNH8C2xpFEdqHv3m/gS6fgVfWxp3eE7T8wQwZzKTr6+4tjJh4gTgkQ7Zp1tmjHqgQBeqBMZ2gB3Kv
	auYo4i38nDR9gRqbKylJBj4owEKmFfscaonjmPOcemR2W51tf/7X6c+FYJg/zZqbzIy5XI3TmTEf7
	RjZG1iQDysWJ58U7AzMyPg+4+cs0bO5lTE8jRURAySzZ2X6SIIabSM1B1QqXnDrUIIxyhVffsRX6H
	FD9VRLEVIWyN61aP8N/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZleN-0000000AzxV-20Qc;
	Thu, 10 Jul 2025 07:24:59 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZker-0000000Ar2N-2OGV
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 06:21:27 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-5346b75d719so624662e0c.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 23:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752128484; x=1752733284; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG4giksOjxTPwU+J2iWDHmet2nmN8VvPq1vMXwURQq4=;
        b=CXGFA/uLN5WW4wMLjNudJhZVP5/JJggFLKsCr4u9Kx0dGqVezq61so9U+r5MEsziok
         oSNuPudIYdZK2VJxx7yvPQk7rTfWd84McLDuxjUnIJqR37ldUGZxmE2DDeIvmXLC4J+H
         LRbwyAt2mIhCycPCmchvQJWWMygjAnIvo+q+bnvRZaYjbkMJz6Ej6QLZeuFhpaxUIHN1
         NZaqUg9dYH6ahbudVjb78Vb3FWm+uLLDDls5qczNGo2Q+KddSlkkPHm6cxbLU/Np0OWN
         tF83XpypB/sqonY5ZnZq9EFk0zXr/4UWo1nQvnSiIbmaUEe5+DfIHKanOM0R8gCARVUp
         Qn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752128484; x=1752733284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BG4giksOjxTPwU+J2iWDHmet2nmN8VvPq1vMXwURQq4=;
        b=WpXe+gtZwLHPlE2B2xAFIeoSM4LE7jy5gP3JSmBEhGNDsuIt9Gja3kyCO847vrZCQ8
         DQCncRwouc06XEuG3Yrtu1qYGDMWYliuvUl6jcpTOW65ntlAE5kLwmhdP9xjDuzs9OIL
         cA068LLKR+O4ykPpUvj0aanWpjSw/DQZ+ny+SH7PH3oHxbfjm7grTXB81J+w5sujvCGG
         J14RBetGx3yra2nh+EXu0sjNqFk4ZJSfO86/d//obNTZ/ALPsrJJiI5u7OtczdwlRoeW
         yusrSWyLKkyxUEdCLXJIKdxXTTrM7Rx2z2i5ELa55+vAJDpY5TEw9H+B/zVHp9mqJpu6
         HLQw==
X-Forwarded-Encrypted: i=1; AJvYcCUQZnoXidZdcuYq+/J8dSoGojxL0fEpVEKZBpeFuXdWEOpUQGEGnCYRyOapGqkxFD3xpQGkDi6ono/WQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXJVwpRMNCuAcHJrmVUEmKmWQbaG2kmW/Z0Knnae9uCNXgkwym
	5xJt1o7TBZvKpPuzOmv0lLUNtp9wF4cmB9uJP3Wsyz6PAHGPweDbbd3ER/+JatWTu8/xRUOZLLn
	duVSZqdl2faw050yVnrI/n7ZdxZSFC7w=
X-Gm-Gg: ASbGncvXFxjydSxYHl6H8KdXJzkK1PPFdi1M3heFb7QtMTpiKrYSpoY3T9qXfCDBCmy
	hjgeeBWmqrdae29I1RyrnJDvQ1Ovsd9edBo43uz/mIIkZvHZonJhzI/38YBwiwlTZ1XJtlX2Tlf
	W69TFYgUPceplDrmWXJnJNS6mHQ+8Bqj5AcpPbxi8=
X-Google-Smtp-Source: AGHT+IEgfvNN9FUwR3ZzrltKi9tZrr8t/tLqZDsrlrxTUcs2wTebLZttNZHuq1wo9nJSxTMEW3FjE5Desh6wAFxUVFQ=
X-Received: by 2002:a05:6122:1ad0:b0:531:2906:752d with SMTP id
 71dfb90a1353d-535d73ce217mr4038139e0c.11.1752128483540; Wed, 09 Jul 2025
 23:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com>
In-Reply-To: <20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com>
From: Han Gao <rabenda.cn@gmail.com>
Date: Thu, 10 Jul 2025 14:21:11 +0800
X-Gm-Features: Ac12FXztJeD7IrDDbYBNj91A-BzmMZeUwgymejmbAOGChNwao1zJg6R95vGMKZc
Message-ID: <CAAT7Ki-+xk-NDixFhSKNQ_zcfzkQMHfBODVuw_Q52ocJQAHaSQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: ftrace: Properly acquire text_mutex to fix a race condition
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_232125_617010_EA13EFBF 
X-CRM114-Status: GOOD (  16.30  )
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

T24gVHVlLCBKdWwgOCwgMjAyNSBhdCA0OjM04oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEFzIHJlcG9ydGVkIGJ5IGxvY2tkZXAsIHNvbWUg
cGF0Y2hpbmcgd2FzIGRvbmUgd2l0aG91dCBhY3F1aXJpbmcKPiB0ZXh0X211dGV4LCBzbyB0aGVy
ZSBjb3VsZCBiZSBhIHJhY2Ugd2hlbiBtYXBwaW5nIHRoZSBwYWdlIHRvIHBhdGNoCj4gc2luY2Ug
d2UgdXNlIHRoZSBzYW1lIGZpeG1hcCBlbnRyeS4KPgo+IFJlcG9ydGVkLWJ5OiBIYW4gR2FvIDxy
YWJlbmRhLmNuQGdtYWlsLmNvbT4KPiBSZXBvcnRlZC1ieTogVml2aWFuIFdhbmcgPHdhbmdydWlr
YW5nQGlzY2FzLmFjLmNuPgo+IFJlcG9ydGVkLWJ5OiBZYW8gWmkgPHppeWFvQGRpc3Jvb3Qub3Jn
Pgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvYUdPRE1wcTdU
R0lOZGR6TUBwaWUubGFuLwo+IFRlc3RlZC1ieTogWWFvIFppIDx6aXlhb0BkaXNyb290Lm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
ClRlc3RlZC1ieTogSGFuIEdhbyA8cmFiZW5kYS5jbkBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gv
cmlzY3Yva2VybmVsL2Z0cmFjZS5jIHwgMTYgKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4g
aW5kZXggNGM2YzI0MzgwY2ZkOWQ2YzUxZjBlNDM0MGNkNjc0MTYwYjgzYTYxMC4uMjJlN2JkZjhk
ZTJiNmNhOTUwY2YyYzhiNzM0YmM4MmVhNDZiYThiZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9mdHJhY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4gQEAg
LTE0LDYgKzE0LDE2IEBACj4gICNpbmNsdWRlIDxhc20vdGV4dC1wYXRjaGluZy5oPgo+Cj4gICNp
ZmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0UKPiArdm9pZCBmdHJhY2VfYXJjaF9jb2RlX21vZGlm
eV9wcmVwYXJlKHZvaWQpCj4gK3sKPiArICAgICAgIG11dGV4X2xvY2soJnRleHRfbXV0ZXgpOwo+
ICt9Cj4gKwo+ICt2b2lkIGZ0cmFjZV9hcmNoX2NvZGVfbW9kaWZ5X3Bvc3RfcHJvY2Vzcyh2b2lk
KQo+ICt7Cj4gKyAgICAgICBtdXRleF91bmxvY2soJnRleHRfbXV0ZXgpOwo+ICt9Cj4gKwo+ICB1
bnNpZ25lZCBsb25nIGZ0cmFjZV9jYWxsX2FkanVzdCh1bnNpZ25lZCBsb25nIGFkZHIpCj4gIHsK
PiAgICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0NBTExf
T1BTKSkKPiBAQCAtMjksMTAgKzM5LDggQEAgdW5zaWduZWQgbG9uZyBhcmNoX2Z0cmFjZV9nZXRf
c3ltYWRkcih1bnNpZ25lZCBsb25nIGZlbnRyeV9pcCkKPgo+ICB2b2lkIGFyY2hfZnRyYWNlX3Vw
ZGF0ZV9jb2RlKGludCBjb21tYW5kKQo+ICB7Cj4gLSAgICAgICBtdXRleF9sb2NrKCZ0ZXh0X211
dGV4KTsKPiAgICAgICAgIGNvbW1hbmQgfD0gRlRSQUNFX01BWV9TTEVFUDsKPiAgICAgICAgIGZ0
cmFjZV9tb2RpZnlfYWxsX2NvZGUoY29tbWFuZCk7Cj4gLSAgICAgICBtdXRleF91bmxvY2soJnRl
eHRfbXV0ZXgpOwo+ICAgICAgICAgZmx1c2hfaWNhY2hlX2FsbCgpOwo+ICB9Cj4KPiBAQCAtMTQ5
LDYgKzE1Nyw4IEBAIGludCBmdHJhY2VfaW5pdF9ub3Aoc3RydWN0IG1vZHVsZSAqbW9kLCBzdHJ1
Y3QgZHluX2Z0cmFjZSAqcmVjKQo+ICAgICAgICAgdW5zaWduZWQgaW50IG5vcHNbMl0sIG9mZnNl
dDsKPiAgICAgICAgIGludCByZXQ7Cj4KPiArICAgICAgIGd1YXJkKG11dGV4KSgmdGV4dF9tdXRl
eCk7Cj4gKwo+ICAgICAgICAgcmV0ID0gZnRyYWNlX3JlY19zZXRfbm9wX29wcyhyZWMpOwo+ICAg
ICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiBAQCAtMTU3LDkg
KzE2Nyw3IEBAIGludCBmdHJhY2VfaW5pdF9ub3Aoc3RydWN0IG1vZHVsZSAqbW9kLCBzdHJ1Y3Qg
ZHluX2Z0cmFjZSAqcmVjKQo+ICAgICAgICAgbm9wc1swXSA9IHRvX2F1aXBjX3QwKG9mZnNldCk7
Cj4gICAgICAgICBub3BzWzFdID0gUklTQ1ZfSU5TTl9OT1A0Owo+Cj4gLSAgICAgICBtdXRleF9s
b2NrKCZ0ZXh0X211dGV4KTsKPiAgICAgICAgIHJldCA9IHBhdGNoX2luc25fd3JpdGUoKHZvaWQg
KilwYywgbm9wcywgMiAqIE1DT1VOVF9JTlNOX1NJWkUpOwo+IC0gICAgICAgbXV0ZXhfdW5sb2Nr
KCZ0ZXh0X211dGV4KTsKPgo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+Cj4gLS0tCj4gYmFz
ZS1jb21taXQ6IGQ3YjhmOGUyMDgxM2YwMTc5ZDhlZjUxOTU0MWEzNTI3ZTc2NjFkM2EKPiBjaGFu
Z2UtaWQ6IDIwMjUwNzA4LWFsZXgtZml4ZXMtMWU3MTliOTg5OWYzCj4KPiBCZXN0IHJlZ2FyZHMs
Cj4gLS0KPiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
