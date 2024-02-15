Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E39AC48BC4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 21:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/XarPw9CW3HCvJ7rVa7ojJ5QCGT7o+43w25Ga6R74Y=; b=lNfk1xhCuTbLd6
	5nzG8Z7ZVvci4o6XuXAIuGXMryvcyYuAWnUn9DnisxjZWsHue/woIlZS19Rg/hjVP6vB9QtKWxTTT
	M3NI45MEhdUSIoHYgmSRJyTpkl9tE9ZnOUcRpUGgrjqN+8NAxV5h6jDBwjAA1Wk0/ELnOtDpbzlKO
	9U8NgRbuskDfRBVJtRSJ0XHmajwvee4SpYsF9YcEMFT3d63zf/WcMPhR7Gl1YJUv8zL3D94qrWuqr
	u7KVYH7SfkD1/CRE8jGNHRRI8mFPxEsNQmTDHvtpr6w/pWVd/ayJuBZa8o4bJkKgjh/A34IYMQhiL
	lPc0JipkQlQjgLQJjWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raisD-000000008m8-2SXX;
	Thu, 15 Feb 2024 21:02:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rahtg-0000000Haz6-3Y4T;
	Thu, 15 Feb 2024 20:00:30 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708027189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JSYfftfvnoNIEsV/zUwUyNXq3OsLbyrS3xmJdbEjgcg=;
	b=FC2rV3J7iMT20bfmDpKIzYMB6ZmyLIA/IJRb4Tx8xL2Qxt1IsRvPEyD2xPtSipTMBYLgTr
	7nxv5wFY8MllxiR/F0Y2y7blCZLBfc8c8+2e8CH87qyRxCNJZUgqLxj7LE+4e+3RRNOXHH
	lkMZ8JrZZXYDs+HoHK4mDrwGYN3dga8dU/SJ3KSsZeCzs0mxe7rYGaOLqOcczSA8KaubWT
	n1g+WSqIL5bnK7cZzxRg40w+MJ9a3WxFS1CtLqCZqSnQwUt6qT0pkRNFXqYwFNJRI+hQ19
	3N5SN3FMJB8mwHBpH7Vqbb9IH7Hy+EPm8f/W6z4e/7UHow3CcU77GADiJE6xCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708027189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JSYfftfvnoNIEsV/zUwUyNXq3OsLbyrS3xmJdbEjgcg=;
	b=vvEDjueYHLIdYonrN/q3kU2Ip6cwkYGmm05lIBYR4BpbPCEnN8wSz1ZvlaD2M3vGVpsr8f
	7P1l5q83KTxAcAAg==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
In-Reply-To: <CAK9=C2WsSSHgDF+7ruxx_QF0Lk+Dsx2F2Y-_NabnxrJ_qWhgGQ@mail.gmail.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <CAK9=C2Vwtj2gZg-P73yLMxu0rPXQ3YrRRuxq6HcpHMXgs-jHaw@mail.gmail.com>
 <87bk8ig6t2.ffs@tglx>
 <CAK9=C2WsSSHgDF+7ruxx_QF0Lk+Dsx2F2Y-_NabnxrJ_qWhgGQ@mail.gmail.com>
Date: Thu, 15 Feb 2024 20:59:48 +0100
Message-ID: <87v86pcxcb.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_115953_221487_2D6E1F19 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, "Ahmed S.
 Darwish" <darwi@linutronix.de>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW51cCEKCk9uIFRodSwgRmViIDE1IDIwMjQgYXQgMTE6MTgsIEFudXAgUGF0ZWwgd3JvdGU6Cj4g
T24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMToyNOKAr0FNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPj4gVGhhbmtzIGZvciBwaWNraW5nIHRoaXMgdXAgYW5kIGRy
aXZpbmcgaXQgZm9yd2FyZCEKPgo+IFRoYW5rcyBUaG9tYXMsIEkgd2lsbCBiZSBzZW5kaW5nIHYx
MyBvZiB0aGlzIHNlcmllcyBuZXh0IHdlZWsuCj4KPiBGb3IgdGhlIHRpbWUgYmVpbmcsIEkgd2ls
bCBjYXJyeSB0aGUgMTMgaW5mcmFzdHJ1Y3R1cmUgcGF0Y2hlcyBpbgo+IHRoaXMgc2VyaWVzIHVu
dGlsIHRoZXkgbGFuZCBpbiB1cHN0cmVhbSBMaW51eCBzbyB0aGF0IGl0IGlzIGVhc2llcgo+IGZv
ciBwZW9wbGUgdG8gdHJ5IHRoaXMgc2VyaWVzLgoKSSBwdXNoZWQgb3V0IHRoZSBsb3Qgb24gdG9w
IG9mIDYuOC1yYzQgKG5vIG90aGVyIGNoYW5nZXMpIHRvCgogICAgIGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdpdCBpcnEvbXNpCgp3aXRoIHNv
bWUgbWluaW1hbCBjaGFuZ2VzIChERVZJQ0VfSU1TIC0+IERFVklDRV9NU0ksIHJlbW92YWwgb2Yg
YW4KdW51c2VkIGludGVyZmFjZSkuCgpJJ20gZ29pbmcgb3ZlciB0aGUgcmVzdCBvZiB0aGUgc2Vy
aWVzIGFmdGVyIEkgZGVhbHQgd2l0aCBteSBvdGhlciBwYXRjaApiYWNrbG9nLgoKVGhhbmtzLAoK
ICAgICAgICB0Z2x4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
