Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48105EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hNCzf62Dc55292HCpv7l3f07vnXc2l59w+UpXifdbY=; b=echY2k4/bGwm2u
	62T7SrfPFR1/okO8civ8yceyP6vvLR4qh9cYMapENCWbM26G0R61CP8lKg+SHO9rKJCJaPiDZyGKb
	8foWVMGacDOAOYwmLEbpkZe+4N1mhwhU2dpTg4MOesphtHtJwqDcQkCpU25CxNMDikCqM3B2OdQiZ
	ig6KwWGYoJC+MW3mtmGBK/0JjODA7yLzt2viM3N4nnovOax1Q2iQ+ccIOOib25oamFFg2zfsSMxmY
	WJnmijDxPjHeP+bxbXFF1TZFSpNWmcV+GGsuvyz5H2PPsyz6cI8eaCMAk21y577xsoXUSfbnH0vqP
	4MR8cwlSHsWGE0nVuTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDncC-00AR3U-0i;
	Mon, 26 Jun 2023 14:54:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDncA-00AR3C-18
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 14:54:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBB0560E07;
	Mon, 26 Jun 2023 14:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA946C433C0;
	Mon, 26 Jun 2023 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687791288;
	bh=xsBZxBjaxJ+sEzlG5Nyk5uqR3QjLibnxVP5duMqoqgo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LDAX75YqQLEYNZb0d5SbXIg6N0Y6wQ/Ik4C2aMVQ4vOwRHcT4eOroNMO9xJLo/5i6
	 xamPEUo+drlKVIkTQN0qdOQRAKkc+2OFuO6xDAK1fDsfpWdlyNR6tehiH9vIW/PdGS
	 lzDhVe17ddM/Wd7lPUQekypzHfwkHi9/SZ70WD9/jBahXfA5cFWFcb+SNp3FssFQjt
	 TIfOeu1+hm170M2DZXz6CTB2brWYhVgVGU1/tv4Jlilc/MXwsuY4SfEWzA80nGtrw9
	 4lI8VdEoOmtPwOGyEt740dFVzNiPB+RIMrIKwJi7nrRW+sbAp9aIb8HkFIvkdTtI6Y
	 VgYZF8RgC/WQA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <CABgGipVRf6ahuSvZvgpew91o_xjviiMKAp0nNF0S7XwLgXgREQ@mail.gmail.com>
References: <871qi4334n.fsf@all.your.base.are.belong.to.us>
 <20230622154738.6403-1-andy.chiu@sifive.com>
 <87edm3jvub.fsf@all.your.base.are.belong.to.us>
 <CABgGipVRf6ahuSvZvgpew91o_xjviiMKAp0nNF0S7XwLgXgREQ@mail.gmail.com>
Date: Mon, 26 Jun 2023 16:54:45 +0200
Message-ID: <87cz1inuiy.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_075450_448828_B27B1D75 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBPbiBGcmksIEp1biAy
MywgMjAyMyBhdCAxMjozOOKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdy
b3RlOgo+PiBUaGlzIGZsb3cgZG9lcyBhdm9pZCBzb21lIGNvbnRleHQgc3dpdGNoIGNvc3RzLCBi
dXQgSSB3b25kZXIgaWYgdGhpcyBpcwo+PiBzb21lIHRoYXQgY2FuIGJlIGFkZGVkIGxhdGVyLCB3
aGVuIHdlIGNhbiBtb3JlIHJlbGlhYmxlIG1lYXN1cmUgdGhlCj4+IG92ZXJoZWFkLiBQcmVtYXR1
cmUgb3B0aW1pemF0aW9uLCBhbmQgYWxsIHRoYXQuIDstKQo+Pgo+Cj4gU3VyZSwgZG8geW91IHN1
Z2dlc3QgYW55IGtpbmRzIG9mIG1lYXN1cmVtZW50LCBleHBlcmltZW50LCBvcgo+IGJlbmNobWFy
a2luZyB0aGF0IGNvdWxkIGdpdmUgb3V0IGEgZmlndXJlIG9uIGhvdyB0aGluZ3MgYXJlIGRpZmZl
cmVudD8KCk15IHRha2Ugd2FzOyBJZiB5b3UgaGF2ZSBhY2Nlc3MgdG8gYWN0dWFsIFYgMS4wIGhh
cmR3YXJlLCBhbmQganVzdCBub3QKUWVtdSwgdGhlbiB3ZSBjb3VsZCBkbyBzb21lIGFjdHVhbCBy
ZWFsIHRlc3RzLCBtZWFzdXJpbmcgY29udGV4dCBzd2l0Y2gKY29zdHMgZXRjIQoKCkJqw7ZybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
