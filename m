Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EEDC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 02:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tonpSUZovy9+0QxsSU6UNihclt4l0PTeTMPTSIp9BM=; b=45njPB4CIUT+iE
	2f3mK11b/QjzdC7DMIUxklk2x/d7axsEWdS0QP+Mma1Y1BnclOut1TlA+gIHVtrPMBXt192LiXzaj
	etLr6e44f5XJKcRr1jQhfM9MSJzGzeUGmXlGqBMmTbAfm7HqOuG+J/LPXmDxgz2pviZF/wcigc9Kh
	fYPjykKqMi93xiJWMns/c/BGgWyG2q1PqojlyS0d+FnlWIeMbMPKEbVX5DB43cWWGmHUjoziA4RxP
	pQ7wH1VSAQQ/BdvZM/BymwIByK3H1S+Nx8ZZ2M8hfyNVYvmDCzhwlh/UPq4yejMLdJkJB93hCpclB
	N6j+oNAta0Kmiij0uJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Shp-000cqV-9U; Fri, 09 Dec 2022 02:01:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Shm-000clK-BQ
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 02:01:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C5FD0B8270A
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 02:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13C4C4339B
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 02:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670551295;
	bh=SkG0VIqWAQWylgRHfoMeG8lBjjuRZ9GmA+y0TH1J3fc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OxMFuJAK3rAc1PnY53u3QDUfFVttYZYZfiGw5pEgn96yEXMo5CdKl/qc9/Z9zNAky
	 6LzbsRUJUFl4GYnKPVebOode5qURJq0CSVwyXn2fzTE4Mx9k0GSkYLNEgUR/VrKJyv
	 tY6fWQcabY2yJne/YtnclSXOvvSEjAOMHMlSPqu/OS25aqQzoh12B9H3MXOj41noHN
	 DeMX43aEcG5OTZfQ8BR3aVvhMJ2AuiaGp1XXNST6RFRLjxyEboOTW67+afB3ccvwUz
	 9ItzqMp00KcoZRr5vm2icwLDoq6QroF5C26+Cvi2qR7GffV150QmVfRH8MkiiqqbvN
	 zqIFww+131gmg==
Received: by mail-ed1-f52.google.com with SMTP id f7so1308050edc.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 18:01:34 -0800 (PST)
X-Gm-Message-State: ANoB5plwJ0qM/23sj6yifGTZOrlQOmGCFsqqnArdc2V1ok+GXJ+jahO0
	scZAQHa4k97m+5AMmgt9J2xPIHyFj/FDTlfWEDQ=
X-Google-Smtp-Source: AA0mqf5C/3tfEMZ0PsbumjXajBPqoEmuMmeihHRWIZKLRicqq0E/oDxh0zU8cL/o0mSjqj7e5LlTwvlQ3cMBhv+JcfE=
X-Received: by 2002:a05:6402:538a:b0:458:fbd9:e3b1 with SMTP id
 ew10-20020a056402538a00b00458fbd9e3b1mr28452851edb.6.1670551292956; Thu, 08
 Dec 2022 18:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20221208025816.138712-1-guoren@kernel.org> <20221208025816.138712-6-guoren@kernel.org>
 <87sfhqw6ge.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87sfhqw6ge.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 9 Dec 2022 10:01:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR3Eebw7juPiW4zA122qQKJjw4+7eC54vHgTDpctqJopA@mail.gmail.com>
Message-ID: <CAJF2gTR3Eebw7juPiW4zA122qQKJjw4+7eC54vHgTDpctqJopA@mail.gmail.com>
Subject: Re: [PATCH -next V10 05/10] riscv: entry: Remove extra level wrappers
 of trace_hardirqs_{on,off}
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	ben@decadent.org.uk, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_180138_566126_D9F5FD35 
X-CRM114-Status: GOOD (  12.10  )
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

T24gVGh1LCBEZWMgOCwgMjAyMiBhdCA2OjExIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Cj4gPiBGcm9tOiBK
aXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPgo+ID4gU2luY2UgcmlzY3YgaXMg
Y29udmVydGVkIHRvIGdlbmVyaWMgZW50cnksIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgdGhlCj4gPiBl
eHRyYSB3cmFwcGVycyBvZiB0cmFjZV9oYXJkaXJxc197b24sb2ZmfS4KPiA+Cj4gPiBUZXN0ZWQg
d2l0aCBsbHZtICsgaXJxc29mZi4KPgo+IFdoYXQgZG9lcyB0aGlzIG1lYW4/Ckl0J3MganVzdCBh
IHRlc3RlZCBlbnZpcm9ubWVudCBkZXNjcmlwdGlvbi4gVGhpcyBpcyBjb3ZlcmVkIGJ5IHRoZQpn
ZW5lcmljIGVudHJ5LiBUaGlzIHBhdGNoIHJlbW92ZXMgdW51c2VkIGNvZGUuCgpJIHdvdWxkIHJl
bW92ZSB0aGUgIlRlc3RlZCB3aXRoIGxsdm0gKyBpcnFzb2ZmLiIgc2VudGVuY2U7IGl0J3MgdW5u
ZWNlc3NhcnkuCgo+Cj4KPiBCasO2cm4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
