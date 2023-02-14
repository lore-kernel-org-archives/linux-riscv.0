Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07509C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m90L5Lv4+Qnfadd5L480AUvdftVNYGUfT3E3aFmd3xc=; b=W8oZ9mTPkzyOtM
	T3gkjJtBG7YftXn1W9sbfHyt0mVb62OXPVlp6WkUXlP7ABQOdk3mXt5whiDNtLbnWSGUHaMY7KG7Z
	z338nIxYrwIeMze6sliIW4O0f9f0X4Lf7Asn8hSuyc2Fetij98Ck2oVH2tmcKZr13w/VnNzabyTKU
	oR78k5wOYwpEIA9TiHPJbbpxKgzVJ7l86H0gCIAN1qvXLmCBmQYl+QcOQT+vUDBmrNQr3Or5ZskF3
	6T8y32hbA4jliRypcDmwX/qtbfCcwn8B2B1rCKIhqtcwoSL7Vqchl9pN9Nl4BT3UjnZMaux1ycjL2
	LZgMBIgXn1ekAbgPaf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRxMm-002dYq-D0; Tue, 14 Feb 2023 15:37:12 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRxMj-002dWu-0H
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 15:37:11 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-52f1b1d08c2so86891127b3.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEuk2za66kOkzZCxlnBgVGetnMABoCd3uDWCBjrbGcw=;
        b=GFNAmADgTDKiWX4VP2eDzfePJv77VBs2WJ62TpuHlgj6w85SpvYvwVT87guHSXvRIS
         AOUHn1K558M0QPVik1c1qYq3x8CgP7PC35U1hmNUtbmz1KZk5x46dL3T+/rudKmu1ME7
         6kfbk+cGETsRDrU0VwdThvwRY9xqTl5y5CUYlUj5I5szAwHoCc7Pe97o5IRR/hH2ZFJe
         pl1PehY2/uII+5d0PXsA2C7/+SwBHcaQ7B0O6mt6DxsHuN0HPXamJkdl8oBXF3C6psyv
         tyMCi49+fk6rN0ngeq1R2wtmvGJvB4RhFNiUhAYDe4VnXi7reT8jdX3eJUjdKSAAuIzs
         koxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEuk2za66kOkzZCxlnBgVGetnMABoCd3uDWCBjrbGcw=;
        b=CLP39BjByphAGpcCiLE81fkWmoitRBEpG1+76tg5Zy2kvefbzmihB4XhnIKRgnFmcx
         lQxz+wD1EO4Kp/v8/mNddsb3Zs87nRHV35rrToIMgxDgSmeRF6q+425CKycM6Bc11iSA
         rZDgRiQzPTq/NK1KAMbpFAYFGoYR7ah10Alj/tYDfVEHXjaep5nQDorQRlklB7MX3RVq
         bUMWdvla29B/9iKGTsC4MGjeyMY8UPffBFvZcJyi8zC0qMi1+3I3V7/0d+tWzyeucqld
         6pLry/xVvAiudzdXZjtuXgaUqewP/dRo0cpxE/vSqQtG3fiDqKV3bBzzHVknckbPnITH
         711Q==
X-Gm-Message-State: AO0yUKXc05HWQ0mUgF/00+CaaozTdLVK1dF3Neq5cRvzWkygKd94GGme
	LiHo2QtRQT9O7spSgEHZ14Iv/kWBbO+SOm6i0atuGQ==
X-Google-Smtp-Source: AK7set9UOGxhLQ7LTLbDJLqA5joDujWSvNR7Bwc91q06oKcAtFSH8GpNFvsMBb71n1m18g0vufqH8x9TatF3NDHac8M=
X-Received: by 2002:a0d:dd81:0:b0:509:5557:c194 with SMTP id
 g123-20020a0ddd81000000b005095557c194mr236278ywe.449.1676389026067; Tue, 14
 Feb 2023 07:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us> <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
 <87sff8ags6.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87sff8ags6.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 14 Feb 2023 23:36:55 +0800
Message-ID: <CABgGipXSsqgtTx9bCy-gt7CTBkXN--t1wHgLfCxA3=vs6y+qUw@mail.gmail.com>
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Vineet Gupta <vineetg@rivosinc.com>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Li Zhengyu <lizhengyu3@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_073709_078369_12F8BF11 
X-CRM114-Status: GOOD (  14.16  )
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

SGV5IEJqw7ZybiwKCk9uIFR1ZSwgRmViIDE0LCAyMDIzIGF0IDI6NDMgUE0gQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gU28sIHR3byBjaGFuZ2VzOgo+Cj4gMS4gRGlz
YWxsb3cgVi1lbmFibGVtZW50IGlmIHRoZSBleGlzdGluZyBhbHRzdGFjayBkb2VzIG5vdCBmaXQg
YSBWLXNpemVkCj4gICAgZnJhbWUuClRoaXMgY291bGQgcG90ZW50aWFsbHkgYnJlYWsgb2xkIHBy
b2dyYW1zIChub24tVikgdGhhdCBsb2FkIG5ldyBzeXN0ZW0KbGlicmFyaWVzICh3aXRoIFYpLCBJ
ZiB0aGUgcHJvZ3JhbSBzZXRzIGEgc21hbGwgYWx0IHN0YWNrIGFuZCB0YWtlcwp0aGUgZmF1bHQg
aW4gc29tZSBsaWJyYXJpZXMgdGhhdCB1c2UgVi4gSG93ZXZlciwgZXhpc3RpbmcKaW1wbGVtZW50
YXRpb24gd2lsbCBhbHNvIGtpbGwgdGhlIHByb2Nlc3Mgd2hlbiB0aGUgc2lnbmFsIGFycml2ZXMs
CmZpbmRpbmcgaW5zdWZmaWNpZW50IHN0YWNrIGZyYW1lIGluIHN1Y2ggY2FzZXMuIEknZCBjaG9v
c2UgdGhlIHNlY29uZApvbmUgaWYgd2Ugb25seSBoYXZlIHRoZXNlIHR3byBvcHRpb25zLCBiZWNh
dXNlIHRoZXJlIGlzIGEgY2hhbmNlIHRoYXQKdGhlIHNpZ25hbCBoYW5kbGVyIG1heSBub3QgZXZl
biBydW4uCj4gMi4gU2FuaXRpemUgYWx0c3RhY2sgY2hhbmdlcyB3aGVuIFYgaXMgZW5hYmxlZC4K
WWVzLCBJJ2QgbGlrZSB0byBoYXZlIHRoaXMuIEJ1dCBpdCBtYXkgYmUgdHJpY2t5IHdoZW4gaXQg
Y29tZXMgdG8KZGVjaWRpbmcgd2hldGhlciBWIGlzIGVuYWJsZWQsIGR1ZSB0byB0aGUgZmlyc3Qt
dXNlIHRyYXAuIElmIFYgaXMKY29tbW9ubHkgdXNlZCBpbiBzeXN0ZW0gbGlicmFyaWVzIHRoZW4g
aXQgaXMgbGlrZWx5IHRoYXQgViB3aWxsIGJlCmVuYWJsZWQgYmVmb3JlIGFuIHVzZXIgc2V0IGFu
IGFsdHN0YWNrLiBTYW5pdGl6aW5nIHRoaXMgY2FzZSB3b3VsZCBiZQplYXN5IGFuZCBzdHJhaWdo
dGZvcndhcmQuIEJ1dCB3aGF0IGlmIHRoZSB1c2VyIHNldHMgYW4gYWx0c3RhY2sgYmVmb3JlCmVu
YWJsaW5nIFYgaW4gdGhlIGZpcnN0LXVzZSB0cmFwPyBUaGlzIGNvdWxkIGhhcHBlbiBvbiBhIHN0
YXRpY2FsbHkKcHJvZ3JhbSB0aGF0IGhhcyBoYW5kLXdyaXR0ZW4gViByb3V0aW5lcy4gVGhpcyB0
YWtlcyB1cyB0byB0aGUgMXN0CnF1ZXN0aW9uIGFib3ZlLCBzaG91bGQgd2UgZmFpbCB0aGUgdXNl
ciBwcm9ncmFtIGltbWVkaWF0ZWx5IGlmIHRoZQphbHRzdGFjayBpcyBzZXQgdG9vIHNtYWxsPwo+
Cj4gT3RoZXIgdGhhbiB0aGUgYWx0c3RhY2sgaGFuZGxpbmcsIEkgdGhpbmsgdGhlIHNlcmllcyBp
cyBhIGdvb2Qgc3RhdGUhIEl0Cj4gd291bGQgZ3JlYXQgaWYgd2UgY291bGQgc2VlIGEgdjE0IGxh
bmQgaW4gLW5leHQuLi4KVGhhbmtzLiBJIGFtIHJlZm9ybWluZyB0aGUgdjE0IHBhdGNoIGFuZCBo
b3BpbmcgdGhlIHNhbWUgdG8gaGFwcGVuIHNvb24gdG9vIQoKQ2hlZXJzLApBbmR5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
