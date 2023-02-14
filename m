Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E6FC05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvyNwzMue5GQFY4IaMa5V89I7Uj3PvWXkukrJWR5c2M=; b=3W8xamHTe5wQos
	lH6qjhdnMa+8ByEIMn3/OS26mHTizTyrQ74ZkMAGTRAyja34115sKow2n5EPGYE717q1gKpyyIMZD
	5jkJqLIuY1qIEcVe8Cj5/iNRqgFZ4NQLUzQMCR6cVXf9TwudecPJ+wVWLKy/7g0tcOix4K5CRHFG4
	AR8jwFZfuIXP75YLUVABFmR6OzeFSJbUGXy2D5YzO442n5a/PvaHwmNyINK3Q9b6Q3fXaa647Npl1
	TbCjmz2w09NFoIk+C52KPEtY4E0+n7Y3JJll0IZNKXEGjUTfwWiAFVyDw4uJlOl/+N3hI6GOp5uv3
	uHh3P/QymcK2AtotYSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRz2h-00308p-7J; Tue, 14 Feb 2023 17:24:35 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRz2d-003076-Ue
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 17:24:33 +0000
Received: by mail-pj1-x1029.google.com with SMTP id bx22so15742131pjb.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 09:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3rJmmxER8Kegw8UROXilPnl76lOFWCMz2/TCfvPwNE=;
        b=PPPJDva1Cm+L2OTjSqS4bvcheGtxqIFDQa7EkVMZ73Wx4F/3dyyHkJR+pyVITO8qt2
         BdsqOwRvy8M8EBgi34XjxnvIKNGVr5G+dORSiZIWjBDCz4Tp8Gx3oDt+/XgMxO3baA/k
         BKSLuo/k36M83kYZB4uRGNURwXkry9vA7JNtXjXgtjTE5J4spoPpPcw/DSLoewXZCkhA
         N20KqKlAAAImHAyYLaNJPr388S0ITgyN/1nIPKYFtmLd7lhU2wpdVe1tFREatXitVDum
         QX8aB+oMef1slp16b0rruu7+RcFlYQt/xm/QfaIoVIzc/wNtxxmMbuqPwUqji+DduzFE
         IqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3rJmmxER8Kegw8UROXilPnl76lOFWCMz2/TCfvPwNE=;
        b=WCjk/J7uol5bAHEvfOMt20mQTR1BCocoEUoj63EKXdygm1bX5rCXK0mNgI9g4sUe/y
         Hp44RVYvUXYGc0VLek28UXQO+TDEmNny77h6fLL2uNBjgIbdUrR59/7DNcQsRPkaUunj
         bg6AKeUgtH9cOTSPYilnr0A5j5g8LWAANHDsz5h4eumyq5YJ8YOHpp5eW9aZRf78qIBX
         tqBtAMFGMrm3gQMgIMBhkw6UOUrTiS2RbCBqlbOdQd4FYvqLnaT1Er/ekqAU3GrZ2yIU
         vog18b+nRSsYM5eqIQ3VHuBfj6VkeMoUSGPpz2wGwcxn71432nWHg8xzJF4VNqZO0q4x
         a30Q==
X-Gm-Message-State: AO0yUKVZ4UVk1LP8vSZcWfSHCZZm/W6MG6cJtP7WNk6dxCnzPbFlAZUj
	yM2A8C3rPkhLHLqTwzfvF2VWww==
X-Google-Smtp-Source: AK7set/e9e6INXRM8UZSttrpCCUWQNukafGMuRBR8M97UGEQ6RAhBU8kgbj2HiXIHnEsnJ/EZ/+0pg==
X-Received: by 2002:a17:90a:19c:b0:22c:1217:b0d9 with SMTP id 28-20020a17090a019c00b0022c1217b0d9mr3442271pjc.15.1676395468942;
        Tue, 14 Feb 2023 09:24:28 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id bt14-20020a17090af00e00b002341ae23ad7sm1869693pjb.1.2023.02.14.09.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 09:24:28 -0800 (PST)
Message-ID: <5e440cfa-27c5-f216-5529-350ac19c07ff@rivosinc.com>
Date: Tue, 14 Feb 2023 09:24:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang
 <jszhang@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Guo Ren <guoren@kernel.org>, Li Zhengyu <lizhengyu3@huawei.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us>
 <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
 <87sff8ags6.fsf@all.your.base.are.belong.to.us>
 <CABgGipXSsqgtTx9bCy-gt7CTBkXN--t1wHgLfCxA3=vs6y+qUw@mail.gmail.com>
 <873578faxg.fsf@all.your.base.are.belong.to.us>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <873578faxg.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_092432_243821_53EFC2CF 
X-CRM114-Status: GOOD (  28.93  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyLzE0LzIzIDA4OjUwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEFuZHkgQ2hpdSA8YW5k
eS5jaGl1QHNpZml2ZS5jb20+IHdyaXRlczoKPgo+PiBIZXkgQmrDtnJuLAo+Pgo+PiBPbiBUdWUs
IEZlYiAxNCwgMjAyMyBhdCAyOjQzIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pj4gU28sIHR3byBjaGFuZ2VzOgo+Pj4KPj4+IDEuIERpc2FsbG93IFYtZW5hYmxl
bWVudCBpZiB0aGUgZXhpc3RpbmcgYWx0c3RhY2sgZG9lcyBub3QgZml0IGEgVi1zaXplZAo+Pj4g
ICAgIGZyYW1lLgo+PiBUaGlzIGNvdWxkIHBvdGVudGlhbGx5IGJyZWFrIG9sZCBwcm9ncmFtcyAo
bm9uLVYpIHRoYXQgbG9hZCBuZXcgc3lzdGVtCj4+IGxpYnJhcmllcyAod2l0aCBWKSwgSWYgdGhl
IHByb2dyYW0gc2V0cyBhIHNtYWxsIGFsdCBzdGFjayBhbmQgdGFrZXMKPj4gdGhlIGZhdWx0IGlu
IHNvbWUgbGlicmFyaWVzIHRoYXQgdXNlIFYuIEhvd2V2ZXIsIGV4aXN0aW5nCj4+IGltcGxlbWVu
dGF0aW9uIHdpbGwgYWxzbyBraWxsIHRoZSBwcm9jZXNzIHdoZW4gdGhlIHNpZ25hbCBhcnJpdmVz
LAo+PiBmaW5kaW5nIGluc3VmZmljaWVudCBzdGFjayBmcmFtZSBpbiBzdWNoIGNhc2VzLiBJJ2Qg
Y2hvb3NlIHRoZSBzZWNvbmQKPj4gb25lIGlmIHdlIG9ubHkgaGF2ZSB0aGVzZSB0d28gb3B0aW9u
cywgYmVjYXVzZSB0aGVyZSBpcyBhIGNoYW5jZSB0aGF0Cj4+IHRoZSBzaWduYWwgaGFuZGxlciBt
YXkgbm90IGV2ZW4gcnVuLgo+IEkgdGhpbmsgd2UgbWlnaHQgaGF2ZSBkaWZmZXJlbnQgdmlld3Mg
aGVyZS4gQSBwcm9jZXNzIGhhcyBhIHByZS1WLCBhIGFuZAo+IHBvc3QtViBzdGF0ZS4gSXMgYWxs
b3dpbmcgYSBwcm9jZXNzIHRvIGVudGVyIFYgd2l0aG91dCB0aGUgY29ycmVjdAo+IHByZWNvbmRp
dGlvbnMgYSBnb29kIGlkZWE/IEFsbG93IHRvIHJ1biB3aXRoIFYgdHVybmVkIG9uLCBidXQgbm90
IGFibGUKPiB0byBjb3JyZWN0bHkgaGFuZGxlIGEgc2lnbmFsICh0aGUgc3RhY2sgaXMgdG9vIHNt
YWxsKT8KClRoZSByZXF1aXJlbWVudCBpcyBzYW5lLCBidXQgdGhlIGlzc3VlIGlzIHVzZXIgZXhw
ZXJpZW5jZTogVXNlciB0cnlpbmcgCnRvIGJyaW5nIHVwIHNvbWUgViBjb2RlIGhhcyBubyBjbHVl
IHRoYXQgZGVlcCBpbiBzb21lIHN0YXJ0dXAgY29kZSBzb21lIAphbHQgc3RhY2sgaGFkIGJlZW4g
c2V0dXAgYW5kIGNhdXNpbmcgaGlzIHByb2Nlc3MgdG8gYmUgdGVybWluYXRlZCBvbiAKZmlyc3Qg
ViBjb2RlLgoKPgo+IFRoaXMgd2FzIHRoZSBzYW1lIGFyZ3VtZW50IHRoYXQgdGhlIEludGVsIGZv
bGtzIGhhZCB3aGVuIGVuYWJsaW5nCj4gQU1YLiBTdXJlLCBBTVggcmVxdWlyZXMgKmV4cGxpY2l0
KiBlbmFibGVtZW50LCBidXQgc2FtZSBydWxlcyBzaG91bGQKPiBhcHBseSwgbm8/Cj4KPj4+IDIu
IFNhbml0aXplIGFsdHN0YWNrIGNoYW5nZXMgd2hlbiBWIGlzIGVuYWJsZWQuCj4+IFllcywgSSdk
IGxpa2UgdG8gaGF2ZSB0aGlzLiBCdXQgaXQgbWF5IGJlIHRyaWNreSB3aGVuIGl0IGNvbWVzIHRv
Cj4+IGRlY2lkaW5nIHdoZXRoZXIgViBpcyBlbmFibGVkLCBkdWUgdG8gdGhlIGZpcnN0LXVzZSB0
cmFwLiBJZiBWIGlzCj4+IGNvbW1vbmx5IHVzZWQgaW4gc3lzdGVtIGxpYnJhcmllcyB0aGVuIGl0
IGlzIGxpa2VseSB0aGF0IFYgd2lsbCBiZQo+PiBlbmFibGVkIGJlZm9yZSBhbiB1c2VyIHNldCBh
biBhbHRzdGFjay4gU2FuaXRpemluZyB0aGlzIGNhc2Ugd291bGQgYmUKPj4gZWFzeSBhbmQgc3Ry
YWlnaHRmb3J3YXJkLgoKR29vZC4gTGV0cyBoYXZlIHRoaXMgaW4gdjE0IGFzIGl0IHNlZW1zIHJl
YXNvbmFibHkgZWFzeSB0byBpbXBsZW1lbnQuCgo+PiBCdXQgd2hhdCBpZiB0aGUgdXNlciBzZXRz
IGFuIGFsdHN0YWNrIGJlZm9yZQo+PiBlbmFibGluZyBWIGluIHRoZSBmaXJzdC11c2UgdHJhcD8g
VGhpcyBjb3VsZCBoYXBwZW4gb24gYSBzdGF0aWNhbGx5Cj4+IHByb2dyYW0gdGhhdCBoYXMgaGFu
ZC13cml0dGVuIFYgcm91dGluZXMuIFRoaXMgdGFrZXMgdXMgdG8gdGhlIDFzdAo+PiBxdWVzdGlv
biBhYm92ZSwgc2hvdWxkIHdlIGZhaWwgdGhlIHVzZXIgcHJvZ3JhbSBpbW1lZGlhdGVseSBpZiB0
aGUKPj4gYWx0c3RhY2sgaXMgc2V0IHRvbyBzbWFsbD8KClBsZWFzZSBsZXRzIG5vdCBjcm9zcyB0
aHJlYWRzLiBXZSBkaXNjdXNzZWQgdGhpcyBhbHJlYWR5IGF0IHRvcC4gV2hpbGUgCmlkZWFsbHkg
cmVxdWlyZWQsIHNlZW1zIHRyaWNreSBzbyBsZXRzIHN0YXJ0IHdpdGggcG9zdC1WIGFsdCBzdGFj
ayBjaGVjay4KCj4gRm9yIG1lIGl0J3Mgb2J2aW91cyB0byBmYWlsIChhbHdheXMpICJpZiB0aGUg
YWx0c3RhY2sgaXMgdG9vIHNtYWxsIHRvCj4gZW5hYmxlIFYiLCBiZWNhdXNlIGl0IGFsbG93cyB0
byBleGVjdXRlIFYgd2l0aG91dCBwcm9wZXIgcHJlY29uZGl0aW9ucy4KPgo+IFBlcnNvbmFsbHks
IEkgcHJlZmVyIGEgc3RyaWN0ZXIgbW9kZWwuIE9ubHkgZW50ZXIgViBpZiB5b3UgY2FuLCBhbmQK
PiBhZnRlciBlbnRlcmluZyBpdCBkaXNhbGxvdyBjaGFuZ2luZyB0aGUgYWx0c3RhY2suCj4KPiBU
aGVuIGFnYWluLCB0aGlzIGlzICpteSogb3BpbmlvbiBhbmQgY29uY2Vybi4gV2hhdCBkbyBvdGhl
ciBwZW9wbGUKPiB0aGluaz8gSSBkb24ndCB3YW50IHRvIHN0YWxsIHRoZSBzZXJpZXMuCgpJIGNv
bmN1ciB0aGF0IHRoZSBhbHQgc3RhY2sgY2hlY2tpbmcgcmVxdWlyZW1lbnRzIGFyZSBzZW5zaWJs
ZSBpbiB0aGUgCmxvbmcgcnVuLiBXZSBjYW4gYWRkIHRoZSBvYnZpb3VzIGNoZWNrIGZvciBwb3N0
LVYgY2FzZSBhbmQgc2VlIGlmIHRoZXJlIAppcyBhIHNhbmUgd2F5IHRvIGZsYWcgcHJlLVYgY2Fz
ZSB0by4KCgo+Cj4+PiBPdGhlciB0aGFuIHRoZSBhbHRzdGFjayBoYW5kbGluZywgSSB0aGluayB0
aGUgc2VyaWVzIGlzIGEgZ29vZCBzdGF0ZSEgSXQKPj4+IHdvdWxkIGdyZWF0IGlmIHdlIGNvdWxk
IHNlZSBhIHYxNCBsYW5kIGluIC1uZXh0Li4uCj4+IFRoYW5rcy4gSSBhbSByZWZvcm1pbmcgdGhl
IHYxNCBwYXRjaCBhbmQgaG9waW5nIHRoZSBzYW1lIHRvIGhhcHBlbiBzb29uIHRvbyEKPiBUaGFu
ayB5b3UgZm9yIHlvdXIgaGFyZCB3b3JrISBJdCB3b3VsZCBiZSBhd2Vzb21lIHRvICpmaW5hbGx5
KiBoYXZlCj4gdmVjdG9yIHN1cHBvcnQgaW4gdGhlIGtlcm5lbCEKCkluZGVlZCB3ZSd2ZSBjb21l
IGEgbG9uZyB3YXksIGxldHMgcHVzaCB0aGUgZ2VhciBzbyB3ZSBjYW4gdXNlIHRoZSAKY29taW5n
IGN5Y2xlIHRvIGZsZXNoIG91dCBhbnkgY2hhbmdlcyBmb3IgYSBwb3NzaWJsZSA2LjQgaW5jbHVz
aW9uLgoKVGh4LAotVmluZWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
