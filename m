Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18A3EB64DA
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 02:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJW4fdsJppD/5QR3JlTsEAf82lgDcvI9ZurAjd8zDqw=; b=0R5mmYWqelRL3m
	BSpnWmkeTu0qcYpYBSZ8JB9yjZlvucGBgIO4qVb1ilv4qwKMYURTCKmZXI2q5z/govPmbkzaoubrl
	XUq8Lqphdr5g9fmJpWITYPQdUSO4u4sAktth1TsasxojDCWVC4cKCKwDNNTqhUTz7h47KuFQ2NN3n
	l9Ex8J/Xc5X9VK8iJ1K7amoZzZTBFskYRIekajYi4yx7+yVwdhqkpCC4y6aH8GDROKosuKCRvkHbb
	7znbH82Nb3QUACKIlVWNd9JfOjJlpl0KlMFmAFrLSifZHOxCIp5y9YIePxAdjSpTmsDs3cUgl15YO
	dh4nC1NKPGEWQsXqFiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIKCA-008B1J-0g;
	Sun, 09 Jul 2023 02:30:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIKC7-008B0N-11
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 02:30:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54D2C60B7B
	for <linux-riscv@lists.infradead.org>; Sun,  9 Jul 2023 02:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58C0C43397
	for <linux-riscv@lists.infradead.org>; Sun,  9 Jul 2023 02:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688869836;
	bh=ExIY4X1/6WBZDcceYJulXe9AXws94ZhD3WBbuCHUE6E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nac9IehWe3mHd7f4j/uWewTT/i+BFlYKfZ7gn5k9QJ9U3xityI4bJX9ZdXhOhbtn5
	 KTThX7ukwtNQCwv8P92YbIzux18NeIqXeNAP0ZSx+StByIr1piST8ZCbolBb1FnO0V
	 4TlYUvp27unXCEnzaLZvJTVtFuvWsG9G3LN5Uk+hhA1ztWrWPnRW3e5uliMyOLBVbq
	 XQXxCKKt+h8HovFU6s3NRY87n4MApHwoPIutnH0+WQ/HSDbD0KFEc/zfPVamMBdQsF
	 +0g+kU/G3mLejCoZnrNCxPwdnfKEnCvJ6zS/xqrJOx9j3u3+1ha9DmRYZ2q48aAI9L
	 mJuRm+SKqSf9A==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9922d6f003cso438057066b.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Jul 2023 19:30:36 -0700 (PDT)
X-Gm-Message-State: ABy/qLYeVkZ7cuYXcOCfq55uahmjv5QEUSiKutb6bT2j2GOvLs90IJ30
	rS854qEmt5h3V4cBQQbI9wyuRgbh7XaTvBMHHHg=
X-Google-Smtp-Source: APBJJlF+0ioRn75qNrO9bVL/zSUpGN/gURCXjEqGnwflHc3JbebPSMWPoOFD6j8qvVU2qPB/tccSjcTMfsMyHi84C1U=
X-Received: by 2002:a17:906:4307:b0:992:c5ad:18bc with SMTP id
 j7-20020a170906430700b00992c5ad18bcmr7156335ejm.70.1688869834776; Sat, 08 Jul
 2023 19:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230702025708.784106-1-guoren@kernel.org> <20230704164003.GB83892@hirez.programming.kicks-ass.net>
In-Reply-To: <20230704164003.GB83892@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 9 Jul 2023 10:30:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTc0Gyo=K-0dCW6wu7q=Wq34hgTB69qJ7VSF_KAgKhavA@mail.gmail.com>
Message-ID: <CAJF2gTTc0Gyo=K-0dCW6wu7q=Wq34hgTB69qJ7VSF_KAgKhavA@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, mark.rutland@arm.com, 
	bjorn@kernel.org, palmer@dabbelt.com, bjorn@rivosinc.com, 
	daniel.thompson@linaro.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230708_193039_436485_6E96DE4C 
X-CRM114-Status: GOOD (  26.26  )
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

T24gV2VkLCBKdWwgNSwgMjAyMyBhdCAxMjo0MOKAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIEp1bCAwMSwgMjAyMyBhdCAxMDo1Nzow
N1BNIC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1
b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGUgaXJxZW50cnlfbm1pX2VudGVyL2V4
aXQgd291bGQgZm9yY2UgdGhlIGN1cnJlbnQgY29udGV4dCBpbnRvIGluX2ludGVycnVwdC4KPiA+
IFRoYXQgd291bGQgdHJpZ2dlciB0aGUga2VybmVsIHRvIGRlYWQgcGFuaWMsIGJ1dCB0aGUga2Ri
IHN0aWxsIG5lZWRzICJlYnJlYWsiIHRvCj4gPiBkZWJ1ZyB0aGUga2VybmVsLgo+ID4KPiA+IE1v
dmUgaXJxZW50cnlfbm1pX2VudGVyL2V4aXQgdG8gZXhjZXB0aW9uX2VudGVyL2V4aXQgY291bGQg
Y29ycmVjdCBoYW5kbGVfYnJlYWsKPiA+IG9mIHRoZSBrZXJuZWwgc2lkZS4KPgo+IFRoaXMgZG9l
c24ndCBleHBsYWluIG11Y2ggaWYgYW55dGhpbmcgOi8KPgo+IEknbSBjb25mdXNlZCAocHJvYmFi
bHkgYmVjYXVzZSBJIGRvbid0IGtub3cgUklTQy1WIHZlcnkgd2VsbCksIHdoYXQncwo+IEVCUkVB
SyBhbmQgaG93IGRvZXMgaXQgaGFwcGVuPwpFQlJFQUsgaXMganVzdCBhbiBpbnN0cnVjdGlvbiBv
ZiByaXNjdiB3aGljaCB3b3VsZCByaXNlIGJyZWFrcG9pbnQgZXhjZXB0aW9uLgoKCj4KPiBTcGVj
aWZpY2FsbHksIGlmIEVCUkVBSyBjYW4gaGFwcGVuIGluc2lkZSBhbiBsb2NhbF9pcnFfZGlzYWJs
ZSgpIHJlZ2lvbiwKPiB0aGVuIHRoZSBiZWxvdyBjaGFuZ2UgaXMgYWN0aXZlbHkgd3JvbmcuIEFu
eSBleGNlcHRpb24vaW50ZXJydXB0IHRoYXQKPiBjYW4gaGFwcGVuIHdoaWxlIGxvY2FsX2lycV9k
aXNhYmxlKCkgbXVzdCBiZSB0cmVhdGVkIGxpa2UgYW4gTk1JLgpXaGVuIHRoZSBlYnJlYWsgaGFw
cGVuZCBvdXQgb2YgbG9jYWxfaXJxX2Rpc2FibGUgcmVnaW9uLCBidXQKX19ubWlfZW50ZXIgZm9y
Y2VzIGhhbmRsZV9icmVhaygpIGludG8gaW5faW50ZXJ1cHQoKSBzdGF0ZS4gU28gaG93CmFib3V0
OgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jCmluZGV4IGY5MTBkZmNjYmY1ZC4uNjlmNzA0M2E5OGI5IDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMKQEAgLTE4LDYgKzE4LDcgQEAKICNpbmNsdWRlIDxsaW51eC9pcnEuaD4KICNpbmNsdWRlIDxs
aW51eC9rZXhlYy5oPgogI2luY2x1ZGUgPGxpbnV4L2VudHJ5LWNvbW1vbi5oPgorI2luY2x1ZGUg
PGxpbnV4L2NvbnRleHRfdHJhY2tpbmcuaD4KCiAjaW5jbHVkZSA8YXNtL2FzbS1wcm90b3R5cGVz
Lmg+CiAjaW5jbHVkZSA8YXNtL2J1Zy5oPgpAQCAtMjg1LDEyICsyODYsMTggQEAgYXNtbGlua2Fn
ZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZApkb190cmFwX2JyZWFrKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQogICAgICAgICAgICAgICAgaGFuZGxlX2JyZWFrKHJlZ3MpOwoKICAgICAgICAg
ICAgICAgIGlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwotICAgICAgIH0gZWxzZSB7
CisgICAgICAgfSBlbHNlIGlmIChpbl9pbnRlcnJ1cHQoKSl7CiAgICAgICAgICAgICAgICBpcnFl
bnRyeV9zdGF0ZV90IHN0YXRlID0gaXJxZW50cnlfbm1pX2VudGVyKHJlZ3MpOwoKICAgICAgICAg
ICAgICAgIGhhbmRsZV9icmVhayhyZWdzKTsKCiAgICAgICAgICAgICAgICBpcnFlbnRyeV9ubWlf
ZXhpdChyZWdzLCBzdGF0ZSk7CisgICAgICAgfSBlbHNlIHsKKyAgICAgICAgICAgICAgIGVudW0g
Y3R4X3N0YXRlIHByZXZfc3RhdGUgPSBleGNlcHRpb25fZW50ZXIoKTsKKworICAgICAgICAgICAg
ICAgaGFuZGxlX2JyZWFrKHJlZ3MpOworCisgICAgICAgICAgICAgICBleGNlcHRpb25fZXhpdChw
cmV2X3N0YXRlKTsKICAgICAgICB9CiB9CgoKPgo+IElmIHRoYXQgbWFrZXMga2RiIHVuaGFwcHks
IGZpeCBrZGIuCj4KPiA+IEZpeGVzOiBmMGJkZGY1MDU4NmQgKCJyaXNjdjogZW50cnk6IENvbnZl
cnQgdG8gZ2VuZXJpYyBlbnRyeSIpCj4gPiBSZXBvcnRlZC1ieTogRGFuaWVsIFRob21wc29uIDxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1
b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPgo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IC0tLQo+ID4g
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgfCA1ICsrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+IGlu
ZGV4IGVmYzZiNjQ5OTg1YS4uZWQwZWI5NDUyZjllIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHMuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4g
QEAgLTE4LDYgKzE4LDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+Cj4gPiAgI2luY2x1
ZGUgPGxpbnV4L2tleGVjLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2VudHJ5LWNvbW1vbi5oPgo+
ID4gKyNpbmNsdWRlIDxsaW51eC9jb250ZXh0X3RyYWNraW5nLmg+Cj4gPgo+ID4gICNpbmNsdWRl
IDxhc20vYXNtLXByb3RvdHlwZXMuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL2J1Zy5oPgo+ID4gQEAg
LTI1NywxMSArMjU4LDExIEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZv
aWQgZG9fdHJhcF9icmVhayhzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+Cj4gPiAgICAgICAgICAg
ICAgIGlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+ID4gICAgICAgfSBlbHNlIHsK
PiA+IC0gICAgICAgICAgICAgaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X25taV9l
bnRlcihyZWdzKTsKPiA+ICsgICAgICAgICAgICAgZW51bSBjdHhfc3RhdGUgcHJldl9zdGF0ZSA9
IGV4Y2VwdGlvbl9lbnRlcigpOwo+ID4KPiA+ICAgICAgICAgICAgICAgaGFuZGxlX2JyZWFrKHJl
Z3MpOwo+ID4KPiA+IC0gICAgICAgICAgICAgaXJxZW50cnlfbm1pX2V4aXQocmVncywgc3RhdGUp
Owo+ID4gKyAgICAgICAgICAgICBleGNlcHRpb25fZXhpdChwcmV2X3N0YXRlKTsKPiA+ICAgICAg
IH0KPiA+ICB9Cj4gPgo+ID4gLS0KPiA+IDIuMzYuMQo+ID4KCgoKLS0KQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
