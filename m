Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A71ACFB44C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OPlgViiwYTACWJGShLTLkEv0blY8fBvnAwyhzZ1ww0=; b=QKPSokD/mn8WPK
	PGI8eptZvNRuyfVg8OUjgKld3UP6OkWWOcwEPxG3nGByz9YEf7HdDugepQedGZW0yT9dsF/QelazF
	WvrON1WA6HZvYp1//h/T1zn7Unv4aewMP3QT5oKH5y6XMR0B+xDk43bzD2AA/VKHCnBQMLlzygvMr
	MQrXPEeAMoTD7N6sl76f8ZPX560mIhiRMaNl4RD1sCW8KsBsSSnyY8+1FpYn/Lkp62rP5lTaf3vIF
	gIlzKMZXCaOQjS7NKDUlBIcWKKMHtZ2Y6bLraDBhEUzMNbPhNynDFZv0iYyMQnJu6IQgpCwBdxVLw
	1BCaQUCagJdePIdkEZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqrb-00000003CsI-0j2O;
	Mon, 07 Oct 2024 16:45:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqrY-00000003Cre-3VKJ
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 16:45:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 588E4A41AEF;
	Mon,  7 Oct 2024 16:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441B8C4CEC6;
	Mon,  7 Oct 2024 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728319535;
	bh=RHLEWzCLyBN4xFFOl+qf15YS/UdOA1RB+ZXNvpTNpWo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JFpqTEZouLwUu4N+gjdJrc/Rc6hlA9F+JKUncCBWBDKlFVq267zmTBUSEnemXr5/F
	 0p6Af4rNvAtTuc2BsI9iWuH8FehyWQ/Wjya9t5tGjNnaDsXFfiIDBWwnd8P+zaCqt/
	 vRJnMzpd8Gba5qKWgRShwexTkj9QKexMmo53xcfDf6TXg+FuqXsWJZ20b5kdMowEIo
	 JHtY1qXK72SD2ZqaWeSB9oElI+Ui2XTHIcye8i4h+mi4/OwWM3JgetOQ3IOHj7KrPW
	 MWXY6EoqiGjG7TXPQQwh1yLkvhpDKjkKf3c4yVxJU4TCGM+RdZmRI09bnY2+ETyOHD
	 0rtJTFbKPo02A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Shuah Khan
 <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org, Anders Roxell
 <anders.roxell@linaro.org>
Subject: Re: [PATCH v2] selftests: sched_ext: Add sched_ext as proper
 selftest target
In-Reply-To: <ZwQKRe7iIzZjjEQd@finisterre.sirena.org.uk>
References: <20241007073133.989166-1-bjorn@kernel.org>
 <ZwQBqlG6MShCkNrU@finisterre.sirena.org.uk>
 <87r08rnbra.fsf@all.your.base.are.belong.to.us>
 <ZwQKRe7iIzZjjEQd@finisterre.sirena.org.uk>
Date: Mon, 07 Oct 2024 18:45:32 +0200
Message-ID: <87msjfn9oz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_094536_960074_8E0BECA1 
X-CRM114-Status: GOOD (  11.80  )
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

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9uIE1vbiwgT2N0IDA3
LCAyMDI0IGF0IDA2OjAwOjU3UE0gKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IE1hcmsg
QnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JpdGVzOgo+PiA+IE9uIE1vbiwgT2N0IDA3LCAy
MDI0IGF0IDA5OjMxOjMyQU0gKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4KPj4gPiAgIENM
TkctQlBGIGNyZWF0ZV9kc3EuYnBmLm8KPj4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gY3JlYXRl
X2RzcS5icGYuYzo5Ogo+PiA+IC9ob21lL2Jyb29uaWUvZ2l0L2xpbnV4L3Rvb2xzL3NjaGVkX2V4
dC9pbmNsdWRlL3NjeC9jb21tb24uYnBmLmg6MzM6MTc6IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJl
ZCBpZGVudGlmaWVyICdTQ1hfRFNRX0ZMQUdfQlVJTFRJTicKPj4gPiAgICAzMyB8ICAgICAgICAg
X1N0YXRpY19hc3NlcnQoU0NYX0RTUV9GTEFHX0JVSUxUSU4sCj4+ID4gICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgIF4KPgo+PiBUaGlzIGlzIG1vc3QgbGlrZWx5IGR1ZSB0byBpbmNvcnJl
Y3QgVk1MSU5VWF9CVEZfUEFUSFMsIHNvIHRoYXQKPj4gdm1saW51eC5oIGlzIGluY29ycmVjdGx5
IGdlbmVyYXRlZC4gVHJ5IGdyZXBwaW5nIGZvcgo+PiBTQ1hfRFNRX0ZMQUdfQlVJTFRJTiBpbiB2
bWxpbnV4LmguCj4KPiBZZWFoLCBpdCdzIG5vdCBpbiB0aGUgZ2VuZXJhdGVkIGZpbGVzOgo+Cj4g
YnJvb25pZUBmaW5pc3RlcnJlOn4vZ2l0L2xpbnV4JCBncmVwIFNDWF9EU1FfRkxBR19CVUlMVElO
IC4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc2NoZWRfZXh0L2J1aWxkL2luY2x1ZGUvdm1saW51
eC5oIC4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc2NoZWRfZXh0L2J1aWxkL29iai9icGZ0b29s
L3ZtbGludXguaAo+IGJyb29uaWVAZmluaXN0ZXJyZTp+L2dpdC9saW51eCQgCj4KPiBJIGRpZG4n
dCBhY3R1YWxseSBidWlsZCBhIGtlcm5lbCwgaWYgdGhlIGJ1aWxkIHN5c3RlbSBuZWVkcyBhIGtl
cm5lbAo+IGl0J3MganVzdCBzaWxlbnRseSBub3QgZGV0ZWN0ZWQgdGhhdCBpdCdzIG1pc3Npbmc/
CgpJdCB0cmllcyB0byBmaW5kIGEga2VybmVsIHdpdGggQlRGOgogIHwgVk1MSU5VWF9CVEZfUEFU
SFMgPz0gJChpZiAkKE8pLCQoTykvdm1saW51eCkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCiAgfCAgICAgICAgICAgICAgICAgICAgICAkKGlmICQoS0JVSUxEX09VVFBVVCks
JChLQlVJTERfT1VUUFVUKS92bWxpbnV4KSAgICAgICAgICAgIFwKICB8ICAgICAgICAgICAgICAg
ICAgICAgIC4uLy4uLy4uLy4uL3ZtbGludXggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAogIHwgICAgICAgICAgICAgICAgICAgICAgL3N5cy9rZXJuZWwvYnRmL3ZtbGlu
dXggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgfCAgICAgICAgICAgICAg
ICAgICAgICAvYm9vdC92bWxpbnV4LSQoc2hlbGwgdW5hbWUgLXIpCgpTaW1pbGFyIHRvIGFsbCB0
aGUgb3RoZXIgc2VsZnRlc3RzIHVzaW5nIEJQRi4KCihPaCwgYW5kIGF0IHNvbWUgcG9pbnQgdGhl
IEJQRiBwYXJ0cyBzaG91bGQgYmUgaW4gbGliLm1rLi4uKQoKCkJqw7ZybgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
