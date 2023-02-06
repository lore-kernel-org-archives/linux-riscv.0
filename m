Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5911C636D3
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 20:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=153FOBPertSF7Cb0sdDgVPKQTx7Yb/wPIc0Ldm9sDVA=; b=aqoqzGKcxDRTye
	dVbIOPcHFWaF0JxGXxFSWrath3rQ3foMfaKOaH49i9PDQHy6W7uUmHZ2Z1Ne8BjEoiKrDynr4q78z
	7ypMCh4frsG560vDFOtLH4xzPF+mBJfHq5c/UD+MEI10uLE652/05+jGuaybuTEn7wfKPREErO2dg
	i5dE7h02SEbNNSaLo3mRL9mQ7WL6XJUfGj/WNXc8COFUzEK+jvkHtmyOspMjSWeAyZ4MaS6dfgCgO
	oUcLhgm/3cmBa/L37jiVbA4v64g48YHp2MWx+qO/+0ZiHRdjpoZix5yAF77WoWH3DADZLtw/cWnJ3
	ZjPIiy7NSjH72ROpZVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7lB-009nZ9-LL; Mon, 06 Feb 2023 20:06:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7l9-009nYB-JT
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 20:06:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E16A5CE1C04;
	Mon,  6 Feb 2023 20:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0507AC433EF;
	Mon,  6 Feb 2023 20:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675713994;
	bh=3Yg7D05MkzSc67p0IllIeOFYuHpgtoWHEDyGg89cEn4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TrFanAIL/NQxsb91JvfkKgGGInV2GbJv83xXwVospLmonVoYF0qugCWhOe08RPwaX
	 KSz2R1yQLjbocys0qpEKTIJcvGgasxF/iufKfZWM+KLnESrINJ3xvu3fY01VN9IBBd
	 A14tJwz1NoSgpuJDM1gKfn9n4bZjtVGyWg1FSCcjcagioOTF4tpLoxfVEQ3ZgZwQ/X
	 1DTz425W+yIiGefj9MW9+XxaZDTOhpCSDxfOWIbHdEj1cNpx4bg45I7e94f2NXzAcH
	 p/5XOjHti0H5HYdlYMgGbFgyQK/fMQnqBl9p3+VIiziorpSavNm5enxgwyrcpj7Rpb
	 iz3O+/RqhOzlA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Michal
 Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, Linus
 Torvalds <torvalds@linux-foundation.org>, Mark Rutland
 <mark.rutland@arm.com>
Subject: Re: [PATCH 09/10] riscv: fix livelock in uaccess
In-Reply-To: <Y9l02DvS6CYThTEG@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l02DvS6CYThTEG@ZenIV>
Date: Mon, 06 Feb 2023 21:06:31 +0100
Message-ID: <87h6vyimns.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_120639_850253_28828848 
X-CRM114-Status: UNSURE (   8.35  )
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

QWwgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+IHdyaXRlczoKCj4gcmlzY3YgZXF1aXZh
bGVudCBvZiAyNjE3OGVjMTFlZjMgIng4NjogbW06IGNvbnNvbGlkYXRlIFZNX0ZBVUxUX1JFVFJZ
IGhhbmRsaW5nIgo+IElmIGUuZy4gZ2V0X3VzZXIoKSB0cmlnZ2VycyBhIHBhZ2UgZmF1bHQgYW5k
IGEgZmF0YWwgc2lnbmFsIGlzIGNhdWdodCwgd2UgbWlnaHQKPiBlbmQgdXAgd2l0aCBoYW5kbGVf
bW1fZmF1bHQoKSByZXR1cm5pbmcgVk1fRkFVTFRfUkVUUlkgYW5kIG5vdCBkb2luZyBhbnl0aGlu
Zwo+IHRvIHBhZ2UgdGFibGVzLiAgSW4gc3VjaCBjYXNlIHdlIG11c3QgKm5vdCogcmV0dXJuIHRv
IHRoZSBmYXVsdGluZyBpbnNuIC0KPiB0aGF0IHdvdWxkIHJlcGVhdCB0aGUgZW50aXJlIHRoaW5n
IHdpdGhvdXQgbWFraW5nIGFueSBwcm9ncmVzczsgd2hhdCB3ZSBuZWVkCj4gaW5zdGVhZCBpcyB0
byB0cmVhdCB0aGF0IGFzIGZhaWxlZCAodXNlcikgbWVtb3J5IGFjY2Vzcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEFsIFZpcm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPgoKUmVwcm9kdWNlZCB3aXRo
IE1hcmsncyB1c2VybGFuZCBwcm9ncmFtIC0tIHRoYW5rcyEKClRlc3RlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
