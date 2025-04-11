Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDBEC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iH5or2kBtfKVFtmgFRx96BklmzjKA+ehbvCesNFx+s8=; b=S/jubUlr0PJnM3
	2C2cv7wEKXA9FIlZUGHMJbHB5yT4VWG0w4bhCWl6JZMpNganTAB/aig+tB5BP+bjLEr8iSsi/+XwH
	Xr4xLSGGDxONiXkVCM4jZR4noWBwb8HM0UZvH9hBcPXf0kaVMkg2ut+69Z9kHGTOOaTuE4Z6Tu37y
	xXVm+94lW33eC1ON2Bz/T5BGKI3Npkcvolj2KXyVtkXmmLyAkAsSuL9l534OKYlbgjTXamTTRU0rZ
	7VOgPtgfBks90iZ8xyxTcg0dLBp/PQr2M0YqMVzHMKP4saeu0FuFi9Ejd4B6yTzgLJsUswsi8eOcn
	PXbKBfCxojgCzRSEcM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39jX-0000000D0o3-3EiZ;
	Fri, 11 Apr 2025 08:27:31 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39gz-0000000D0Lu-3qu0
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 08:24:55 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 8293F83E3B; Fri, 11 Apr 2025 10:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1744358813; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=pp7EveThjN+U7MZImYci+9zKtm2WOJLrI3s59J1I5GUQwwHiXtBQAbUyCPz6UTFD8
	 SB2v+p9cDMmp9jTr7PN3uf/82QEX5yPTNSGodhHG1mkEg2rHsJyjdeB0nq6zBGIaY5
	 4RNgipkc1P8Q/Xm84gITWnBJLFf14Jn/RzQo86spjd9mPWo1JabVP1zfe5m6iYUIpR
	 MwqF6M1VWLTe3PZkRosqPLYeGS3ceQ+PaUcqysc4dqlnWDtf6dcaVHYjLtr9CVPDPW
	 pmbVkJvwbMOo+AgnA/OK6b+kCPEHYyaGUbrMzw9+tCEf3WRbecu2hD25TI6B3UrcRQ
	 JAkitspKHfFvA==
Received: by mail.commetro.pl for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 08:05:47 GMT
Message-ID: <20250411084500-0.1.1y.muzr.0.5zmmpv29wn@commetro.pl>
Date: Fri, 11 Apr 2025 08:05:47 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_012454_077351_FA526FAD 
X-CRM114-Status: UNSURE (  -0.24  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IHBvdHJ6ZWJ1asSFIFBhxYRzdHdvIGFrdHVhbG5pZSBub3d5Y2gg
a2xpZW50w7N3ID8KClNrdXRlY3puaWUgcG9tYWdhbXkgcm96cG9jenluYcSHIHJvem1vd3kgaGFu
ZGxvd2UgeiBrbGllbnRhbWkgemFpbnRlcmVzb3dhbnltaSBQYcWEc3R3YSBvZmVydMSFLgoKWmFw
cmFzemFtIGRvIGtvbnRha3R1IHp3cm90bmVnby4KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUKSmFy
b3PFgmF3IEtvd25hY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
