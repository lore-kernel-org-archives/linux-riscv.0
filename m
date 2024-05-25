Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E31C25B78
	for <linux-riscv@archiver.kernel.org>; Sat, 25 May 2024 10:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJMui8VW8zonptNnrrtauGLDhiqV5pAb/LvnXYElohQ=; b=3KCvxRVQKv5I2P
	U6zCOsVdFUDNTgLCc97DSKYTb6I2e6UKfNtJMq8Lf3fCfVc5oLWXrH4CBd0COt6axK/mzHW3IoMJ/
	WGPZFzlLfjD56GJIu7fXY8HZDzoPODytcl4n0rsmt/BSgaaduExaleA2QE0keS5QfWfClL1R0tDBA
	uNNvgoaww9Q4zegCk4J9WEWuwWXuGIj1ivrN8/PeUWjjFDvyI2vDG3v0HGG7ED0GRy2XWmMiTrDJk
	jGP4SCYDQK7WSWXH+2EO+MCRejrxp9/m3KiMFaD4G3/DSJON9pHfO2E5Q02Dam/igrYkj4kBCHlrz
	w1Rbn5pnOjwxpFsIzbiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAoOG-0000000Ajkx-2DeT;
	Sat, 25 May 2024 10:12:40 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAoOD-0000000Ajee-1QtJ
	for linux-riscv@lists.infradead.org;
	Sat, 25 May 2024 10:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716631925; x=1716891125;
	bh=gZ2fuCsQeBrVCBT3ISM0nKpgpPhN28e/OHnCBxchjV0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KPvVaMV8rHtHFWfPQ4g9yuJT+FTqXmIBJsbiiD0/kJKEgAxhj+9tl9/T6CC/21ihm
	 TFqp/JSHzZNpiUn+B61AKe7ZTDDRX8Pk7HtX/rk8c+166y661YiccTF81wc8HF1SEb
	 FCR+yAY79pPS/E36JEijEj21tNDnxo2JN8TpH9/nlnf8koxoEAkCP5/q6mPg10l0yE
	 2V+78ziri+plFLLwy2+eUMl4ysU2Lnqbkd3Q3gE/GwYUDrVANM5Zl2GliKnHMBzgF7
	 e9moymGlkAhC8UxTmQqj4U24OAPxS8KRpTzkNQ3AFeGDNSa1UOlWcdWmbeGyUSRXfZ
	 CVGPlK9GNZ/1A==
Date: Sat, 25 May 2024 10:12:01 +0000
To: Markus Elfring <Markus.Elfring@web.de>
From: Henry Bell <dmoo_dv@protonmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: add Star64 board devicetree
Message-ID: <caCBlFpvjmhO9G1A1_2qHImmuoGai2NoPYonB5RCVftq4zIrSxlP8Msh9z_FX9GwQXzfSrB40dRxy1zfxZesOJENeebWQsERa03sDvArzec=@protonmail.com>
In-Reply-To: <1b55aad1-1442-41a5-acc6-16baab90c021@web.de>
References: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com> <1b55aad1-1442-41a5-acc6-16baab90c021@web.de>
Feedback-ID: 106097379:user:proton
X-Pm-Message-ID: 587824850d8d4aa25dfd70065ed365efcfdc77de
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_031237_565126_62319104 
X-CRM114-Status: UNSURE (   6.16  )
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

T24gU2F0dXJkYXksIE1heSAyNXRoLCAyMDI0IGF0IDk6MzcgQU0sIE1hcmt1cyBFbGZyaW5nIDxN
YXJrdXMuRWxmcmluZ0B3ZWIuZGU+IHdyb3RlOgoKPiDigKYKPiAKPiA+IFRoZSBib2FyZCBmZWF0
dXJlczoKPiAKPiDigKYKPiAKPiBXb3VsZCB5b3UgbGlrZSB0byBhZGQgYW4gaW1wZXJhdGl2ZSB3
b3JkaW5nIGZvciBhbiBpbXByb3ZlZCBjaGFuZ2UgZGVzY3JpcHRpb24/Cj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni45I245
NAo+IAo+IFJlZ2FyZHMsCj4gTWFya3VzCgpJJ20gaGFwcHkgdG8gY2hhbmdlIGl0LCBidXQgd2Fz
IGdvaW5nIG9mZiB0aGUgZm9ybWF0IHVzZWQgaW4gQ29ub3IncyAgTWlsa3YgTWFycyBjb21taXQK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY29ub3IvbGlu
dXguZ2l0L2NvbW1pdC8/aWQ9MDRhMjI4YWFkYjg0ZDg5NDcyMWIxMzE5NzY0OWNhNzQxZjMwMThi
YwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
