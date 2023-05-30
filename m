Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E18C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 02:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vk0l/1cIy+QGWQBqDXFcpkq8vSp2IR/g0UFkH9mtExg=; b=XnWWCoRQV5iuJs
	qGTyi4f8y7z06mZLVsl69vrmoWZqvDoyr/vQLe474yvfkhKlK9rT00yWDMOO+olUz/Fh6ghxo2toA
	4w4Fz88wEcjWaDaGnShwP1za7AWgO54mtLIb8zkfWAnulwFbfK9Sn+gCv5DOOTGy1ZEwxESoqGWeA
	JeFjulu5aTWbbMduib8ps9vOdGSfNAgXPR+iBGzCzujXqrznBtEcz2MmbZXNnh1veFtCkpCemZG7U
	WGnjqw1E64DXGNAqisgYODCOp3PMldn+GyTlmSBAXNKffzgh5qIHv0gNNejIoswV+69JvrUDjF/EI
	fBgDshkqd5SpFBkvG3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pa9-00CG3T-0F;
	Tue, 30 May 2023 02:59:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pa5-00CG2w-2y
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 02:59:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4542D60DFD
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 02:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0389C4339B
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 02:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685415568;
	bh=wEuys/ept9SxgsrESA2dJvolxDiyhIWiuVW3VCQrAU4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ftXDHZUW2eUlkyR2HcYaUsPKFR1nSV3H0e26TTOG/Chs+IuqwHgg4ksAzBF73s5OM
	 u7Vj2nUduAoJUfyXutNUiV5gg7rI2p19gg1/5p10JLvJuXGFwDSRwJ2IDRsmehNsYm
	 7OZG3nfBs+A4dd9BEivk8sozw1wouBmiO3GvT2Ddb5TCJLKML5f57BuHHAX2bPPczl
	 /UN1d9pauLTfi1r8eSBIrF7Obi43z/UQnGmnGg7XMX0+ma7rVjdo9XcFPKo9gl35rp
	 p9bnGjS5vwiqds2s4aCQBz7tFvCHONPpeaQO0RdoGySN2WnvwCEPpvJflc9+Gl2XsN
	 N4KxOO5Z0pE0A==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5148e4a2f17so5765524a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 May 2023 19:59:28 -0700 (PDT)
X-Gm-Message-State: AC+VfDydUpp67iCqHDWNZBB7t1gVXFiqlMATAcGPIrxwCGfr0/AxjKGe
	yvKmwvUaxwI6VYmZsm3EF+NI93g6RYaDvjbQbQA=
X-Google-Smtp-Source: ACHHUZ4/zl+1rtgPVprtzBxAUtPl09fa84vSaubO1V4vVcGTKJs6j11bXnSSmaQi4f8VjVFbneN1HvjlKdRQvgvYmKI=
X-Received: by 2002:aa7:c743:0:b0:514:a5f7:a6d1 with SMTP id
 c3-20020aa7c743000000b00514a5f7a6d1mr552034eds.1.1685415566870; Mon, 29 May
 2023 19:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230529073845.2859178-1-guoren@kernel.org> <20230529-jasmine-amigo-6d01f6852b35@wendy>
In-Reply-To: <20230529-jasmine-amigo-6d01f6852b35@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 May 2023 10:59:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRSoZbexqka=_7nf4+dHZW2FGf++BiTMypfTbeoGAbUiA@mail.gmail.com>
Message-ID: <CAJF2gTRSoZbexqka=_7nf4+dHZW2FGf++BiTMypfTbeoGAbUiA@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fixup modules compile error
To: Conor Dooley <conor.dooley@microchip.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, andy.chiu@sifive.com, 
	paul.walmsley@sifive.com, palmer@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_195930_025571_683B64E5 
X-CRM114-Status: GOOD (  18.45  )
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

T24gTW9uLCBNYXkgMjksIDIwMjMgYXQgOTo0M+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMjksIDIwMjMgYXQgMDM6
Mzg6NDVBTSAtMDQwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVu
IDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gU29tZSAua28gYWxzbyBuZWVkIHRo
ZSByaXNjdl92X3VzZXJfYWxsb3dlZCBzeW1ib2wuCj4gPgo+ID4gRVJST1I6IG1vZHBvc3Q6ICJy
aXNjdl92X3VzZXJfYWxsb3dlZCIgW2FyY2gvcmlzY3Yva3ZtL2t2bS5rb10KPiA+IHVuZGVmaW5l
ZCEKPiA+IG1ha2VbM106ICoqKgo+ID4gWy9ob21lL2d1b3Jlbi9zb3VyY2Uva2VybmVsL2xpbnV4
L3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxMzY6Cj4gPiBNb2R1bGUuc3ltdmVyc10gRXJyb3Ig
MQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gLS0t
Cj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
dmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gaW5kZXggMWM0YWM4MjFl
MDA4Li4zYWUwODgxNmQ2MDggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0
b3IuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiA+IEBAIC0xMjksNiAr
MTI5LDcgQEAgYm9vbCByaXNjdl92X3VzZXJfYWxsb3dlZCh2b2lkKQo+ID4gIHsKPiA+ICAgICAg
IHJldHVybiByaXNjdl92X2dldF9jdXJfY3RybChjdXJyZW50KSA9PSBQUl9SSVNDVl9WX1ZTVEFU
RV9DVFJMX09OOwo+ID4gIH0KPiA+ICtFWFBPUlRfU1lNQk9MKHJpc2N2X3ZfdXNlcl9hbGxvd2Vk
KTsKPgo+IElzIHRoZXJlIGEgcmVhc29uIHRoYXQgdGhpcyBzaG91bGQgbm90IGJlIEVYUE9SVF9T
WU1CT0xfR1BMKCk/Ckdvb2QgcXVlc3Rpb24sIGJ1dCBJIGp1c3QgZm9sbG93IG91ciBhcmNoL3Jp
c2N2IGhhYmJpdCwgbWF5YmUgd2UKc2hvdWxkIGNoYW5nZSBhbGwgb2YgdGhhdCBpbiBhbm90aGVy
IHBhdGNoLgoK4p6cICBsaW51eC1zNjRpbHAzMiBnaXQ6KHM2NGlscDMyKSDinJcgZ3JlcCBFWFBP
UlRfU1lNQk9MICBhcmNoL3Jpc2N2IC1yIHwgd2MgLWwKNjYK4p6cICBsaW51eC1zNjRpbHAzMiBn
aXQ6KHM2NGlscDMyKSDinJcgZ3JlcCBFWFBPUlRfU1lNQk9MX0dQTCAgYXJjaC9yaXNjdiAtciB8
IHdjIC1sCjE1Cgo+Cj4gSSBmaWd1cmUgQW5keSB3aWxsIHJvbGwgdGhpcyBpbnRvIHRoaXMgbmV4
dCByZXZpc2lvbi4KPgo+IENoZWVycywKPiBDb25vci4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3Vv
IFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
