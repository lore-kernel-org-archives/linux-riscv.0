Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AE5C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 03:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6couP9NqBwwqqASMMvsEaf9+dc3bqlXnS0P6aDk/EE=; b=0ZO5Cs/if+3Wc8
	5WBfctfE+8n5t4sku5/DKMA0VOb5Rh6wGnbIxWC2pQ7cRy3/y+8hCyNaQ0pN58LgVZJZHnn2q86el
	NMG9T9YEqiek43cFGCq+WXHaj5j3Un4FA0qd8eZM6ZNr923d1/4PBWZnUH4BA61IqssxRFw/bg/+a
	Wl1NYzobdYKM5vv9A5gFxGhHUML69qhrQU1kySvcbB10p72kmdSVTRG9hAVcfwnbkjpOga7v7YZWW
	Ci7f3casNWlNfqALYQILcWmKlSuoakUp0BezUYzb3DYEF1Tgu3qffDZfJ4ms2pY4UdI+lPEaFkonS
	siMadmJnpb5Jgl/e2ibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUI0L-0000000B5hu-3qos;
	Mon, 29 Jan 2024 03:08:13 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUI0I-0000000B5gW-3gwj
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 03:08:12 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2144c37f3d3so590757fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jan 2024 19:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706497627; x=1707102427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VmEsB3BrVhcksANfHb/8QboZcv6m1DkmrrBxCJMlos=;
        b=ELI/KJ0zcXAvEjJUOWCaMcdIphqU7I5gy6doxS9Hx8z3TjM7eb+BvwoPAmT0OUn6SR
         4jT2BrhZ1ieay54JjzUGEciGAhj48lOAqQ994l5OGVdiYKEjTYeGHf/yObi6Dtdj1mhY
         8vPB/+6KCW9oDdBwDQhMQXY6Ol1gv2VJyCy5NJA0cPEWgnD6jZq3rJprbDbyH+THA/K8
         uZUsoQCcRQwyORWLP01vvDne0GnpVy7W0vtV7vAgM/tBc2hxgp6TiHgGM7ghAlnbGm4j
         I9ep2e2lHDnwfYy5hc71VjRSTenw7PcLsgcd4s2odJkF+BBb0zNGI0fq8qKh2TWmM9NR
         LXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706497627; x=1707102427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VmEsB3BrVhcksANfHb/8QboZcv6m1DkmrrBxCJMlos=;
        b=CFpKNmHdFsVAY8lsgGZ04iAplCEZ+ByfmN2NzgL/1sJY7A4bAPng/qObwQK4BVXULD
         zBptxL9Dv6sxhIgIQzpz2qId4BMDlIlLa7Pl9+/jrRn+HFpn/KXFiTZl9hh9yQgjoMdK
         7J46IAjny8uwrvfgJr9d79TmRq5RI6QaiX5ueXj6fHATMhzng49loU0DNfhpMXpb4cXX
         IdwYBFo5MH6BMJLu3L45tJWhXxgJnUeRWjPBAhXpuMXmk70RPI115GRhBgO5pwbibSL8
         JR/LLx/VTpVjm4qsLU/pV6BVlEgN46AnPj6iZ0rrSWRkqxnqc62K/hGKRmGBr8tpVtWX
         agzA==
X-Gm-Message-State: AOJu0YxatiwGwLGI35B9X81EvWsDswM0Qg194JbP1zFQxlXafh7ofsN0
	ScFVlw0mcDr99k2TXzqDaCznHiVJAH+dp+Y9OPKTENO9Hga2xQRjNhU+Lx2SBmkyS6sdDD0vzDL
	vdI/40WtqA0Y87UH7DiJk/NIYiqdXROnuhLUv0Q==
X-Google-Smtp-Source: AGHT+IEWlpSCuURK2908qpVhjPZ38PveXtCpdAx9PaagZ0ywJkZb7DWA1aHVXgttgRYK55tCSUygd093guftonqGw1g=
X-Received: by 2002:a05:6870:b401:b0:214:fc3f:3471 with SMTP id
 x1-20020a056870b40100b00214fc3f3471mr1192447oap.40.1706497627335; Sun, 28 Jan
 2024 19:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20240128120405.25876-1-alexghiti@rivosinc.com>
In-Reply-To: <20240128120405.25876-1-alexghiti@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 29 Jan 2024 11:06:56 +0800
Message-ID: <CAEEQ3wmXvnqdvv39JZhkfUsoLbJr4B2WwdgWnGY=aHgE8A-+0g@mail.gmail.com>
Subject: Re: [External] [PATCH -fixes] riscv: Flush the tlb when a page
 directory is freed
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_190810_986204_EB71E998 
X-CRM114-Status: GOOD (  15.96  )
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

SGkgQWxleGFuZHJlLAoKT24gU3VuLCBKYW4gMjgsIDIwMjQgYXQgODowNOKAr1BNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgcmlzY3YgcHJp
dmlsZWdlZCBzcGVjaWZpY2F0aW9uIG1hbmRhdGVzIHRvIGZsdXNoIHRoZSBUTEIgd2hlbmV2ZXIg
YQo+IHBhZ2UgZGlyZWN0b3J5IGlzIG1vZGlmaWVkLCBzbyBhZGQgdGhhdCB0byB0bGJfZmx1c2go
KS4KPgo+IEZpeGVzOiBjNWU5YjJjMmFlODIgKCJyaXNjdjogSW1wcm92ZSB0bGJfZmx1c2goKSIp
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYi5oIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGIu
aAo+IGluZGV4IDFlYjU2ODJiMmFmNi4uNTBiNjNiNWMxNWJkIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdGxiLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Rs
Yi5oCj4gQEAgLTE2LDcgKzE2LDcgQEAgc3RhdGljIHZvaWQgdGxiX2ZsdXNoKHN0cnVjdCBtbXVf
Z2F0aGVyICp0bGIpOwo+ICBzdGF0aWMgaW5saW5lIHZvaWQgdGxiX2ZsdXNoKHN0cnVjdCBtbXVf
Z2F0aGVyICp0bGIpCj4gIHsKPiAgI2lmZGVmIENPTkZJR19NTVUKPiAtICAgICAgIGlmICh0bGIt
PmZ1bGxtbSB8fCB0bGItPm5lZWRfZmx1c2hfYWxsKQo+ICsgICAgICAgaWYgKHRsYi0+ZnVsbG1t
IHx8IHRsYi0+bmVlZF9mbHVzaF9hbGwgfHwgdGxiLT5mcmVlZF90YWJsZXMpCj4gICAgICAgICAg
ICAgICAgIGZsdXNoX3RsYl9tbSh0bGItPm1tKTsKCldoeSBpcyBpdCBuZWNlc3NhcnkgdG8gZmx1
c2ggYWxsIFRMQiBlbnRyaWVzIG9mIHRoZSBwcm9jZXNzPwoKVGhhbmtzLApZdW5odWkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
