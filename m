Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813C6C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 02:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbv1aM4kjPbNcqwISeRgzR5SL8bPivlxeOnLGkl0bCY=; b=2DXdNFcuypWT1d
	9iQXNLo/eTmrAaHnZjWuIZqC6yfME2oGdNGB7p5dnzhOSN3Rt9gLVaCUpT6pTZXY9ssBUsSh3opLZ
	2luj0PW692F7vahbc7Zn3UoT+2TVhV6h2xGzFzPeizlwwxHpyH4kDPGmNrTjmHIV1rHWIYCV4FTku
	Gmk+zMBJ+lqokZkYz09Z6PncAz2+6aapWdkf4mrjn3OVdiB8Od1RKJ9ugE2EKhZL2wetTfy0NW5JJ
	2CPv5resVTAleOLxGErUb7UbY8AP4cSSxxZYFAQSsABljA5x46I9iUSvte8Byq1f8XtpXKlmZ2jWp
	VvQfukGSZAw0QtRh+1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Ss2-000n1Z-0k; Fri, 09 Dec 2022 02:12:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Srz-000mzW-Gb
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 02:12:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF4A9620DA
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 02:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34476C433F0
	for <linux-riscv@lists.infradead.org>; Fri,  9 Dec 2022 02:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670551930;
	bh=rVgKlffiEF2OtdlS00jROW43FCHOBRtxFF76SiaLxlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g9JvhGCrD0QapB7/ih8KC+9k5a69NF+gOr+Se463cyRY4QYyHoyPgaRv8aYKN0IMO
	 z3aiHQzln/a3AheZHGQMewXtpYtA82iDMnMmrmNyrn3GIkfxPAW//jB+pK1/ywgCZR
	 SHuFZywKDCWGMUxEItiKGzzpore1Ijf3Nsq2rC8dRXjA9F1BKaUAkzJ56lq9FrPuAe
	 rBfwhNjBmAOWxUCL/G5qwimFUaS8OKJZK1092uYej+zzVEmGeQDjrgkDDsBhvbWuQy
	 JDsJkohC2NOQX5nmwGxBkJp3ljlhZWOLbByYSPp4Eo8GWWlKPbFcJAeyrLQXguBro9
	 zRSgmmV+KMl+A==
Received: by mail-ej1-f47.google.com with SMTP id t17so8356300eju.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 18:12:10 -0800 (PST)
X-Gm-Message-State: ANoB5pn6NlbcHRNKuZSw1nI1mbxdSXLHVqVIhoU2aNOy6rxat5cjBkMJ
	BV0Uh1cDi8YsI39FLU8pRPkLpadwyrOJED5y2zc=
X-Google-Smtp-Source: AA0mqf6qZESy7WGR2SxFc18ZJVgTfGA4tBgU5tArg1J1Ui4W5i5IwgHDF/9ZnULCqfySS6hAFP7XNiojuRKfKUdCQUc=
X-Received: by 2002:a17:906:b213:b0:7c0:f7af:7c5e with SMTP id
 p19-20020a170906b21300b007c0f7af7c5emr13505347ejz.406.1670551928446; Thu, 08
 Dec 2022 18:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20221208025816.138712-1-guoren@kernel.org> <20221208025816.138712-11-guoren@kernel.org>
 <87mt7yw6eh.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87mt7yw6eh.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 9 Dec 2022 10:11:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR+zbuJDQuW+=wEmQjF7xEsMokBW+yvTxXff38VYwSSKA@mail.gmail.com>
Message-ID: <CAJF2gTR+zbuJDQuW+=wEmQjF7xEsMokBW+yvTxXff38VYwSSKA@mail.gmail.com>
Subject: Re: [PATCH -next V10 10/10] riscv: stack: Add config of thread stack size
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	ben@decadent.org.uk, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_181211_603148_03E7DB14 
X-CRM114-Status: GOOD (  10.41  )
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

T24gVGh1LCBEZWMgOCwgMjAyMiBhdCA2OjEyIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Cj4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gMGNhYzIxYjAyYmE1ICgi
cmlzYyB2OiB1c2UgMTZLQiBrZXJuZWwgc3RhY2sgb24gNjQtYml0IikgaW5jcmVhc2UgdGhlCj4K
PiBjaGVja3BhdGNoIGNvbXBsYWlucyBoZXJlOiBVc2UgImNvbW1pdCBTSEEuLi4iLgpPa2F5LCBJ
IHdvdWxkIGNoZWNrIHRoYXQuCgo+Cj4gPiB0aHJlYWQgc2l6ZSBtYW5kYXRvcnksIGJ1dCBzb21l
IHNjZW5hcmlvcywgc3VjaCBhcyBEMSB3aXRoIGEgc21hbGwKPiA+IG1lbW9yeSBmb290cHJpbnQs
IHdvdWxkIHN1ZmZlciBmcm9tIHRoYXQuIEFmdGVyIGluZGVwZW5kZW50IGlycSBzdGFjawo+ID4g
c3VwcG9ydCwgbGV0J3MgZ2l2ZSB1c2VycyBhIGNob2ljZSB0byBkZXRlcm1pbmUgdGhlaXIgY3Vz
dG9tIHN0YWNrIHNpemUuCj4KPiAuLi5hbmQgYWdhaW4sIG15ICJ3aHkgaXMgdGhpcyBpbiB0aGUg
Z2VuZXJpYyBlbnRyeSIgc2VyaWVzIHJhbnQuIDotKQpJIHdvdWxkIHJlbW92ZSBpdCBmcm9tIHRo
ZSBnZW5lcmljIGVudHJ5IHNlcmllcy4KCj4KPgo+IEJqw7ZybgoKCgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
