Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E3C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lxl8ZPVZ3AIKp3WjoGyldwftqyY4/kryYUksrCi7C/g=; b=uRi1DZVaFWXMyS
	xSN8KCp4a8wU5QH6OL6pAvxbRA+RsS0FQ6mkzMaIsxsD224qaIW0HDLBBVjRXlQ0DeT8gjohl+4jx
	lo2C9Fxf8nGoqCaR6JcMl4xuqqaiA+XuLQW2hJ5zkDUPyQOJxpvCAJATHWN8bIDPNGspuprjLOFp8
	l6DWbT5aY2w6WKd8nFpwh6BvZUXbIew/CUX9CvnnjKOow8g1YcVwEUbLu0NIMViQgCEEzlo36ORkU
	iTTys9e2SmU1v4gr+ezwcCl48XshNIvH9sbN3aSn4WAwLd62liW02owO1503nLNYhQDPzVxc7FCpN
	ZkXuV0jyLA24bZeTCBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOgs-0000000EY05-2xiS;
	Tue, 20 Feb 2024 11:53:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOgc-0000000EXpl-2kKX;
	Tue, 20 Feb 2024 11:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A32B0CE1821;
	Tue, 20 Feb 2024 11:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DC2C433F1;
	Tue, 20 Feb 2024 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708429998;
	bh=mDkSHpxdu2cA5WP+9/oozWeX576UlNHK6vE8pXxzyWc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eW/YQDDMY7IcgbQTXrZnI/rlEAieTspyc0S0pDPKjiIn2ZLmvjubztc+7ot/94/KT
	 HXapqcAGQuakJ3AdQkMhdhNnnzYUBgE3pu75mXEHbgwVNbc6aVNBfPytHp1DYBMKqR
	 uPa3F4M2+cbRGptaY+MUChgm4AUWQ67f9S+fkNLRgxyP3Qj9F3HPrNLHBGAU3YwjoK
	 Vmn7wJKaUanuIBA4uwwx1S5NP2s/jFDTZBMVD3IuaKZMjzDypIK12zm/62uSPhfwtw
	 p3Yj9wav9c8Glv8iIDusjL52dyDKS7rel4xurJO9gDrvqjQabBdlFdx1kzPnDGmEUc
	 jgJo9m+VnlUsg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish
 Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v13 06/13] irqchip: Add RISC-V incoming MSI controller
 early driver
In-Reply-To: <20240220060718.823229-7-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-7-apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 12:53:15 +0100
Message-ID: <87a5nvfj2s.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_035323_085265_3F893AE2 
X-CRM114-Status: UNSURE (   7.17  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gVGhlIFJJU0Mt
ViBhZHZhbmNlZCBpbnRlcnJ1cHQgYXJjaGl0ZWN0dXJlIChBSUEpIHNwZWNpZmljYXRpb24KPiBk
ZWZpbmVzIGEgbmV3IE1TSSBjb250cm9sbGVyIGNhbGxlZCBpbmNvbWluZyBtZXNzYWdlIHNpZ25h
bGxlZAo+IGludGVycnVwdCBjb250cm9sbGVyIChJTVNJQykgd2hpY2ggbWFuYWdlcyBNU0kgb24g
cGVyLUhBUlQgKG9yCj4gcGVyLUNQVSkgYmFzaXMuIEl0IGFsc28gc3VwcG9ydHMgSVBJcyBhcyBz
b2Z0d2FyZSBpbmplY3RlZCBNU0lzLgo+IChGb3IgbW9yZSBkZXRhaWxzIHJlZmVyIGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi9yaXNjdi1haWEpCj4KPiBMZXQgdXMgYWRkIGFuIGVhcmx5IGlycWNo
aXAgZHJpdmVyIGZvciBSSVNDLVYgSU1TSUMgd2hpY2ggc2V0cwo+IHVwIHRoZSBJTVNJQyBzdGF0
ZSBhbmQgcHJvdmlkZSBJUElzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+CgpUaGlzIHBhdGNoIGhhcyBhIGNvdXBsZSBvZiBjaGVja3BhdGNo
IGlzc3VlczoKCkNIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMK
Q0hFQ0s6IFBsZWFzZSBkb24ndCB1c2UgbXVsdGlwbGUgYmxhbmsgbGluZXMKQ0hFQ0s6IFBsZWFz
ZSB1c2UgYSBibGFuayBsaW5lIGFmdGVyIGZ1bmN0aW9uL3N0cnVjdC91bmlvbi9lbnVtIGRlY2xh
cmF0aW9ucwpDSEVDSzogVW5uZWNlc3NhcnkgcGFyZW50aGVzZXMgYXJvdW5kICdnbG9iYWwtPm5y
X2d1ZXN0X2lkcyA8IElNU0lDX01JTl9JRCcKQ0hFQ0s6IFVubmVjZXNzYXJ5IHBhcmVudGhlc2Vz
IGFyb3VuZCAnZ2xvYmFsLT5ucl9ndWVzdF9pZHMgPj0gSU1TSUNfTUFYX0lEJwpDSEVDSzogVW5u
ZWNlc3NhcnkgcGFyZW50aGVzZXMgYXJvdW5kICdnbG9iYWwtPm5yX2lkcyA8IElNU0lDX01JTl9J
RCcKQ0hFQ0s6IFVubmVjZXNzYXJ5IHBhcmVudGhlc2VzIGFyb3VuZCAnZ2xvYmFsLT5ucl9pZHMg
Pj0gSU1TSUNfTUFYX0lEJwpDSEVDSzogVW5uZWNlc3NhcnkgcGFyZW50aGVzZXMgYXJvdW5kIGds
b2JhbC0+bG9jYWwKQ0hFQ0s6IFVubmVjZXNzYXJ5IHBhcmVudGhlc2VzIGFyb3VuZCBpbXNpYy0+
bHByaXYKQ0hFQ0s6IGV4dGVybiBwcm90b3R5cGVzIHNob3VsZCBiZSBhdm9pZGVkIGluIC5oIGZp
bGVzCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
