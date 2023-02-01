Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A981BC636CD
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPCvPO8EMBr12OTZXiCjMQeYfHJ0gAnYEb8nIZ5VFho=; b=UX7K7Y9Xhh1fKg
	7SWNshqcCykrHD5HpBIG7iJ2xC7ZYXryE5KlS+YdKmpCe6mcSegPsiRVPBfrgQSIVz3tbrV0+XUFr
	m7iF81Ldgj5I5idKSBN3Yi4RL2d1TTFeoKgKR2dJgOPLZHbKCLUKdBc4xNJj9w6XsCoSVOwyt/82U
	9A+ixNbSoCYU0BPu7TK1Wri7cgsGdA8EYxh2NhT97eI8cNSbdjmmIlFQYcNyXZ2LPPJ2yYptlBjmJ
	BlPrFJvycRShpe5O47IhOyNSIqLrmqaL68s9wim0F5TnL7JHnrr6ldmbzTTebC8hPdhEJXWNjZt2I
	eas/DgzVqJTdVx90j75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDBh-00C4EY-H6; Wed, 01 Feb 2023 13:30:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDBf-00C4CL-7T
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 13:30:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D0BB1B82188;
	Wed,  1 Feb 2023 13:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB4AC433D2;
	Wed,  1 Feb 2023 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675258204;
	bh=PDRhcGJ17Tvv0fPAUYuSJW7rVUzUKearobtYgs9at/A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pAatRhSGMokeGNVuQJGZ/boTlD0T2LGuzdJOv8rZSmG4QFGAETe9dW4CL/5uqX1tf
	 hiRntJ9OyEP63OdrKLI6KDbSVtG92Raz+N9mboJgHl8s2TExUOpVQSrqFYIUbCS4kD
	 kl0NChOBUxSId6xbchT7g5mhstI1LuaRZ1wRDBKmefzp/JQkkofF4vioCEVDmN8uis
	 ApkXnWjUJYiRRzCiaY/KSNcrxTFC1BC7Tf7IiirCK0B3ShUTDYOFwpA87MYn0ANbEQ
	 E5Ceioh9LdJgQKlgQcv45liEpDv2xEfVOrTZ4rrUPaRa9bL6C5rfZJ92oeE0Hece1M
	 WsO8Zd8qtAI0Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v6 06/13] riscv/kprobe: Add code to check if kprobe can
 be optimized
In-Reply-To: <20230127130541.1250865-7-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
 <20230127130541.1250865-7-chenguokai17@mails.ucas.ac.cn>
Date: Wed, 01 Feb 2023 14:30:01 +0100
Message-ID: <87wn51tsx2.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_053007_442047_E94AF66C 
X-CRM114-Status: UNSURE (   9.06  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEZy
b206IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPgo+IEZvciB0aGUgUlZJIGFu
ZCBSVkMgaHlicmlkIGVuY29kaW5nIGtlcm5lbCwgYWx0aG91Z2ggQVVJUEMvSkFMUiBqdXN0Cj4g
b2NjdXB5IDggYnl0ZXMgc3BhY2UsIHRoZSBwYXRjaGVkIGNvZGUgaXMgMTAgYnl0ZXMgYXQgdGhl
IHdvcnN0IGNhc2UKPiB0byBlbnN1cmUgbm8gUlZJIGlzIHRydW5jYXRlZCwgc28gdG8gY2hlY2sg
aWYga3Byb2JlIHNhdGlzZmllcyB0aGUKPiByZXF1aXJlbWVudCBvZiBqdW1wIG9wdGltaXphdGlv
biwgaXQgaGFzIHRvIGZpbmQgb3V0IGFuIGluc3RydWN0aW9uCj4gd2luZG93IGxhcmdlIGVub3Vn
aCB0byBwYXRjaCBBVUlQQy9KQUxSKGFuZCBwYWRkaW5nIEMuTk9QKSwgYW5kIGVuc3VyZQo+IG5v
IGluc3RydWN0aW9uIG5lYXJieSBqdW1wcyBpbnRvIHRoZSBwYXRjaGluZyB3aW5kb3cuCj4KPiBC
ZXNpZGVzIHRoYXQsIHRoaXMgc2VyaWVzIGRvZXMgbm90IHN1cHBvcnQgdGhlIHNpbXVsYXRpb24g
b2YgcGMtcmVsYXRpdmUKPiBpbnN0cnVjdGlvbiBpbiBvcHRwcm9iZSBoYW5kbGVyIHlldCwgc28g
dGhlIHBhdGNoaW5nIHdpbmRvdyBzaG91bGQgbm90Cj4gaW5jbHVkZXMgcGMtcmVsYXRpdmUgaW5z
dHJ1Y3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBMaWFvIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdl
aS5jb20+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBDaGVuIEd1b2thaSA8Y2hlbmd1b2thaTE3QG1haWxz
LnVjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0Bt
YWlscy51Y2FzLmFjLmNuPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
