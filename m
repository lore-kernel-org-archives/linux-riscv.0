Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B171C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbt5vMYXTzJQ3Qe/+aEPaa1RucJgr7fqNPqceDhwqeM=; b=UQ2mI+2Jt4Lmoz
	VktqzCejhIhoXoKtBmW5eWUd2dI+Y+ixkeZs29A/VUnVX0TlGe11GlPvEH7dq4p13O1Cdd+sJxuyI
	KPVM9Wz7Io2uxobIL6DpyUAF4E8d/l9G2gJfu0oI+DkEvY5ttmcbR6qcvy+/l3ZqB+Lmt1v2Khlcl
	g9LQNh8HSibjoOQZqcC9GwKL8UJZd/CsJC+934665cILXQwcuuA1DKDmBtXUu8L9sanRTwm1NbHkx
	ThyRVrzc8Ga2K7a6ndS/MYF9oqqEI3/uIinC4MwDF9zyi4see1+cifRSqbeDswsZLGQMJq1S9po5L
	wjBfMX8MC4gzqsahJ5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOOu-005V9M-55; Tue, 08 Nov 2022 13:12:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOOq-005V7r-9e
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 13:12:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 837E0B81AAC;
	Tue,  8 Nov 2022 13:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4FFC433C1;
	Tue,  8 Nov 2022 13:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667913137;
	bh=p3iKK8i/BkE9f32TxyOj+aZvkBrcSPGQ3okA10a8JP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IeTEoNtt464NHNuxhiKEfZV77NHJAAtKfCtHe8KqtGJFVFpvEQ7Ob0b2H5VgVLy7n
	 nMnfmwN/eeoguCvB0Zoc3Xjuo5vhaP5xitWrwI64RV36YwdQp/u8I2e9TLH5W+V0Jc
	 mtmf8r8mvCwSnuu+1Aputs0GzWdUn2ajBwuex9TXqP+gGY5kRu6o8V2h2ZdOgh4h4A
	 GaJd95OwRl2YXFsMzd59bHMcRUG99Y06RdWhgjO7ZNh2l7F26VzLNvEUipeCvDHiGI
	 0nBD5hJWymVXGL5j2/26NkwySZnL+l1m5wWWsC98JQUmTxAWWRYUjcdHSDrO8rANPX
	 Tljq0EPzoMZQQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: "liaochang (A)" <liaochang1@huawei.com>, Xim
 <chenguokai17@mails.ucas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 rostedt@goodmis.org, mingo@redhat.com, sfr@canb.auug.org.au,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Liao Chang
 <liaoclark@163.com>
Subject: Re: [PATCH v4 0/8] Add OPTPROBES feature on RISCV
In-Reply-To: <598bc40d-e826-f9cc-14fd-f4570051f4c6@huawei.com>
References: <20221106100316.2803176-1-chenguokai17@mails.ucas.ac.cn>
 <87y1sm1z8j.fsf@all.your.base.are.belong.to.us>
 <9A705974-A007-45E2-BC5D-A7E90821A258@mails.ucas.ac.cn>
 <598bc40d-e826-f9cc-14fd-f4570051f4c6@huawei.com>
Date: Tue, 08 Nov 2022 14:12:14 +0100
Message-ID: <87bkphr3o1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_051220_515575_9448E266 
X-CRM114-Status: UNSURE (   6.01  )
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

ImxpYW9jaGFuZyAoQSkiIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+IHdyaXRlczoKCj4+Pj4gKwkq
cmQgPSAoKGt3IHwgb3cpID09IDFVTCkgPyAwIDogX19idWlsdGluX2N0emwoKGt3IHwgb3cpICYg
fjFVTCk7Cj4+Pj4gKwkqcmEgPSAoa3cgPT0gMVVMKSA/IDAgOiBfX2J1aWx0aW5fY3R6bChrdyAm
IH4xVUwpOwo+Pj4KPj4+IEhtbSwgX19idWlsdGluX2N0emwgaXMgdW5kZWZpbmVkIGZvciAwLCBy
aWdodD8gQ2FuIHRoYXQgYmUgdHJpZ2dlcmVkCj4+PiBoZXJlPwo+Cj4gVGhpcyBjb3JuZXIgY2Fz
ZSBoYXMgYmVlbiB0YWtlbiBpbnRvIGFjY291bnQsIGxvb2sgdGhlc2UgY29uZGl0aW9uIHBhcnRz
LAo+IGlmIGt3ID09IDFVTCB0aGlzIGV4cHJlc3Npb24gd2lsbCByZXR1cm4gMCBkaXJlY3RseSwg
bm8gY2hhbmNlIHRvIGludm9rZSBfX2J1aWx0aW5fY3R6bC4KCkluZGVlZCEgVGhhbmtzIGZvciBt
YWtpbmcgdGhhdCBjbGVhciEgTG9va2luZyBmb3J3YXJkIHRvIHRoZSBuZXh0CnJldmlzaW9uIQoK
CkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
