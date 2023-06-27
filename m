Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E679FC001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 07:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUxbhD5+kZYq8I4CK1KaLSH3sra9Xe2ErE2r1Cwu9lQ=; b=WQziZrr/hQjZqi
	6dzt+Ciw3Y4rP0vFiIjg8Q9bDn7sLVFKKVeXFCS9R4bE/aacCIpxRqkyiqL9X4z+xc4E/oeEonWhd
	hoRNUT2yQg3DJHGO/909ZzZFBKw7Novl3WR0t9y2YmHF++O+R2vQ4vT3UwK45r7qShtDmPrbQl4GT
	FrJASLuA4sqC/eY3Yk6uYn1GnoZkWPtleatKEO33nelrqQedXRdvlehPKy3YaDnRmR5RBeYbDWmZV
	3RhDDJvbliUpVXVx73eGycwz7EtGCFVGUDATOqdtzmYVOkSlayBv+lNUfB4lEO3nCrpHTRIpo3oKN
	+xCs78NphF6cZrKvI3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE37x-00CM3o-22;
	Tue, 27 Jun 2023 07:28:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE37v-00CM2H-0u
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 07:28:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C006A61014;
	Tue, 27 Jun 2023 07:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C51C433C0;
	Tue, 27 Jun 2023 07:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687850918;
	bh=Ehx4ssKA+amaQBLck7kEMbTIImfdpyG6kZ4sNlG+JsA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sglnolbv7aD061t3nh0jeDP8czxtbiHNIh8qdwvMAf8UUxpibV0d2eDehDwwOglNq
	 kynmTVu953QyoXAoRlWMsZzji6g02rDrBS9bRUvqwmCdWKEOecNHIOMozxsHQ/Ejlm
	 OsML9+qiwe/o3+4P59bc06rqYLq2Db1oDMjR7SB5lpyWqJWTogKljp7ImhglPeHE3I
	 B/6LpuvEN9KaoTVRSn6GVfeD11kNMEzEa7xHvUw9300sy5gi2KLoV59ViEeIYEOqy6
	 7OFhJJkiGL3Kn/7rtJjP3tCy7c/AYRChKBYUfnTAqZ0io7+cfi/gbyocmQH9PrVk0B
	 wKKn9w8HwvSug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 bjorn@rivosinc.com, Andy Chiu <andy.chiu@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>, Guo Ren
 <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [v1, 1/2] riscv: vector: clear V-reg in the first-use trap
In-Reply-To: <20230627015556.12329-2-andy.chiu@sifive.com>
References: <20230627015556.12329-1-andy.chiu@sifive.com>
 <20230627015556.12329-2-andy.chiu@sifive.com>
Date: Tue, 27 Jun 2023 09:28:35 +0200
Message-ID: <87v8f99xek.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_002839_360292_D75C027E 
X-CRM114-Status: UNSURE (   7.11  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBJZiB0aGVyZSBpcyBu
byBjb250ZXh0IHN3aXRjaCBoYXBwZW5zIGFmdGVyIHdlIGVuYWJsZSBWIGZvciBhIHByb2Nlc3Ms
Cj4gdGhlbiB3ZSByZXR1cm4gdG8gdXNlciBzcGFjZSB3aXRoIHdoYXRldmVyIGxlZnQgb24gdGhl
IENQVSdzIFYgcmVnaXN0ZXJzCj4gYWNjZXNzaWJsZSB0byB0aGUgcHJvY2Vzcy4gVGhlIGxlYWtl
ZCBkYXRhIGNvdWxkIGJlbG9uZyB0byBhbm90aGVyCj4gcHJvY2VzcydzIFYtY29udGV4dCBzYXZl
ZCBmcm9tIGxhc3QgY29udGV4dCBzd2l0Y2gsIGltcGFjdGluZyBwcm9jZXNzJ3MKPiBjb25maWRl
bnRpYWxpdHkgb24gdGhlIHN5c3RlbS4KPgo+IFRvIHByZXZlbnQgdGhpcyBmcm9tIGhhcHBlbmlu
Zywgd2UgY2xlYXIgViByZWdpc3RlcnMgYnkgcmVzdG9yaW5nCj4gemVybydkIFYgY29udGV4dCBh
ZnRlciB0dXJpbmluZyBvbiBWLgo+Cj4gRml4ZXM6IGNkMDU0ODM3MjQzYiAoInJpc2N2OiBBbGxv
Y2F0ZSB1c2VyJ3MgdmVjdG9yIGNvbnRleHQgaW4gdGhlIGZpcnN0LXVzZSB0cmFwIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgoKUmV2aWV3ZWQtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
