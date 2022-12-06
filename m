Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6F5C352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 04:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFZbo5q9ZIs9EPFbz/o632Rwd9OwTr5d0LfI8VBd+zQ=; b=HSK7O/rOfJjpoP
	yHMUbGUcPF8jc/MbWArW/kXIt7ft4wm5aIWZhI8jCYRphUH5x8VUUkgl956JqgonrGyyTjTsvnWbB
	yN8Wd+uT8pa/D7V/CcO2Mw7MtwrWzhJlob43yzdc9r2klV7qZQSrJDg8nKQUvYNBpHWaf4Rr6RtER
	/V8fYlUF06JMz0aoADfjWAZXvj5V815Vlw3aET0BuAwjsdZcyX4MTM3gs7u9tJNs3hkiQiQ8j71oT
	AnwDjexgdhsIcMajdDg5ePAEDdhh/6Q/K4J3pYH6wMSrIsGwSVwysxPsEvlpxOECFpPLKjbn6FMka
	UYOiukR8XJXYgaqaU/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Pln-000Ef8-6a; Tue, 06 Dec 2022 04:41:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Plk-000EPZ-BJ
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 04:41:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 244586154E
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 04:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6706C43149
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 04:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670301680;
	bh=CDi3F0YVIiQYZgfK8bLLmzIPGqtLt6inzEmlZ6Doajc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=phdmyBu2AMK0GuM/x7DhbD6rF9+EtZ1698DONdfwzMNnBLj9CKA2M/bQSaYncOzSG
	 o9MYZ2hu2fWIAuIMbQkansUR2ed8GOI4bjS4jAfSCXaURAeuBra9d6OmAvmj2gKA0b
	 c2LjXI24O9vJhHBu8Fd+dsp4R9XuRBnzXtyLQNSiaU6XCIn8R3dijTmkAI/VCLAyS5
	 JO43dj8jPuZ1vZe6NHxq2JY/oFSfCeDgr2w68aCrPuJPRN5BW0x2t1YogckA5xw+IA
	 2z9QbypmivV9iXLYCCPWvMmg/3bjROUwOBkg9aeT70WdQ2b10BW/lPieVDFe7Jl6JZ
	 CHA4vupfUkWiA==
Received: by mail-ed1-f47.google.com with SMTP id c17so10122923edj.13
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 20:41:20 -0800 (PST)
X-Gm-Message-State: ANoB5plQbaHnFM73lH5J1dqHLzpK/E9m68yAb4VPql5Kyr1sJEVTVuJB
	qCkkPUt6XFzAB2EJnVMC8Vmd4IgHCLbZXQVSvrs=
X-Google-Smtp-Source: AA0mqf4ch/b78ULRR94neIazv0nnRnB3t7URjN2prrntaPmGs+FOXh9jatMztYw4hLNzF3ljnWjF7Mo1NzmnxKn7/zU=
X-Received: by 2002:a05:6402:289d:b0:46c:2460:cdf with SMTP id
 eg29-20020a056402289d00b0046c24600cdfmr15398312edb.103.1670301679047; Mon, 05
 Dec 2022 20:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20221103075047.1634923-1-guoren@kernel.org> <20221103075047.1634923-5-guoren@kernel.org>
 <87bkoi9otu.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87bkoi9otu.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Dec 2022 12:41:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRqnuYVHKoB_7GCK_JwvUK0gYUs9eOAzXL-CKWQ-AuO+Q@mail.gmail.com>
Message-ID: <CAJF2gTRqnuYVHKoB_7GCK_JwvUK0gYUs9eOAzXL-CKWQ-AuO+Q@mail.gmail.com>
Subject: Re: [PATCH -next V8 04/14] riscv: ptrace: Remove duplicate operation
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	Oleg Nesterov <oleg@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_204124_471046_54B1CD3A 
X-CRM114-Status: GOOD (  16.57  )
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

T24gTW9uLCBEZWMgNSwgMjAyMiBhdCA1OjM0IFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Cj4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gVGhlIFRJRl9TWVNDQUxM
X1RSQUNFIGlzIGNvbnRyb2xsZWQgYnkgYSBjb21tb24gY29kZSwgc2VlCj4gPiBrZXJuZWwvcHRy
YWNlLmMgYW5kIGluY2x1ZGUvbGludXgvdGhyZWFkLmguCj4KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeXl4gdGhyZWFkX2luZm8uaAo+ID4KPiA+IGNsZWFyX3Rhc2tfc3lz
Y2FsbF93b3JrKGNoaWxkLCBTWVNDQUxMX1RSQUNFKTsKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBPbGVnIE5lc3Rlcm92IDxv
bGVnQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyB8
IDEgLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNl
LmMKPiA+IGluZGV4IDJhZTgyODBhZTQ3NS4uNDRmNGIxY2EzMTVkIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3B0
cmFjZS5jCj4gPiBAQCAtMjEyLDcgKzIxMiw2IEBAIHVuc2lnbmVkIGxvbmcgcmVnc19nZXRfa2Vy
bmVsX3N0YWNrX250aChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgaW50IG4pCj4gPgo+
ID4gIHZvaWQgcHRyYWNlX2Rpc2FibGUoc3RydWN0IHRhc2tfc3RydWN0ICpjaGlsZCkKPiA+ICB7
Cj4gPiAtICAgICBjbGVhcl90c2tfdGhyZWFkX2ZsYWcoY2hpbGQsIFRJRl9TWVNDQUxMX1RSQUNF
KTsKPiA+ICB9Cj4gPgo+ID4gIGxvbmcgYXJjaF9wdHJhY2Uoc3RydWN0IHRhc2tfc3RydWN0ICpj
aGlsZCwgbG9uZyByZXF1ZXN0LAo+Cj4gVGhpcyBwYXRjaCBpcyBhbHNvIG5vdCBuZWNjZXNhcnkg
Zm9yIHRoZSBzZXJpZXMsIGJ1dCBzaG91bGQgYmUgYQo+IHNlcGFyYXRlIGNsZWFudXAuCk1heWJl
IEkgd291bGQgZGVwcmVjYXRlIHRoaXMgcGF0Y2ggYmVjYXVzZSB0aGUgZ2VuZXJpYyBlbnRyeSB3
b3VsZApkZWxldGUgdGhlIHdob2xlIHB0cmFjZV9kaXNhYmxlKCkuCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
