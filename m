Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7E6C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 16:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjWuFw+cu7c2Cf6aMVVz1uBWeZNK23prAqe1i0WspFE=; b=EeY4/RlFd0p11w
	cihrF46LSqLPk6wXWKdaVRV6tqaPC40hOQ0x2eO+yG5k4nG4rF24nFvTae6oieRr1fI4UmSyiOEuS
	he5N16uYgNVDuYsjcv0XTdRFzmAfr0W1WN8pRgYq8HjirjWtCusFacTWaXi00RlnvuLSocmjhO7Ti
	i3t0D7cZ9louva93ok9xFqvZ2ZatwY5LR7rGN1YWTfvJS/ID7bxl3+2/f5BSLxKROLmvNTi2klzKp
	lr4/Wz14aJuQNmr3ZV/N25+iGCu0h3emN0BlG679Hpq03ZozFyu5OmSrgNHl5TELf5C6YP63ORmFX
	QqfPkIDOFaZk+YunqMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5Om-00GRRR-Jr; Mon, 07 Nov 2022 16:55:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5Oj-00GRLm-Nm
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 16:54:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C955611BD;
	Mon,  7 Nov 2022 16:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F495C433C1;
	Mon,  7 Nov 2022 16:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667840095;
	bh=KsObuJWXvLhwuEZHFp5QrxHieh8AflkZRl9asmg0/ho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HDLs2rV+veNGR/93J9a48Z2nfdcfUPYMYO/w0ExZeEA8ALJvqtekBQv2SlLgLHNlP
	 tQz55MGLqMyW7Gh61ziOjkrQt95I9kO3+Ov7/jn5evHwVzG9Q8FgQDxYAtbnF3bpBZ
	 gksxNByuoHmN7N+hprCfA6zX/R6jxYtaXeH2Kmfui7Amnb74aKeja9kp1LQkhPF+E6
	 6rH+4njXMHZgQJOhe4iQz6Z7rjE/W3sFQbrNlhSlsPDGbbiRLMKIthJXzx5tdFtLbe
	 pEsi/HQzjlbEPAGC/uucdFATTD6gHrCDn0mgdUXVUD8RBXcPpFd8AnHpcg0p3n4Rzd
	 aD3rrbKco0j+Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Liao Chang <liaoclark@163.com>
Subject: Re: [PATCH v4 0/8] Add OPTPROBES feature on RISCV
In-Reply-To: <20221106100316.2803176-1-chenguokai17@mails.ucas.ac.cn>
References: <20221106100316.2803176-1-chenguokai17@mails.ucas.ac.cn>
Date: Mon, 07 Nov 2022 17:54:52 +0100
Message-ID: <87y1sm1z8j.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_085457_837305_03D70F62 
X-CRM114-Status: UNSURE (   8.17  )
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
b206IExpYW8gQ2hhbmcgPGxpYW9jbGFya0AxNjMuY29tPgo+Cj4gRnJvbTogTGlhbyBDaGFuZyA8
bGlhb2NoYW5nMUBodWF3ZWkuY29tPgo+Cj4gQWRkIGp1bXAgb3B0aW1pemF0aW9uIHN1cHBvcnQg
Zm9yIFJJU0MtVi4KClRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzISBJIGhhdmUgc29tZSBjb21t
ZW50cyBvbiB0aGUgc2VyaWVzLCBidXQgSSdsbApkbyB0aGF0IG9uIGEgcGVyLXBhdGNoIGJhc2lz
LgoKSGF2ZSB5b3UgcnVuIHRoZSBzZXJpZXMgb24gcmVhbCBoYXJkd2FyZSwgb3IganVzdCBxZW11
PwoKCkNoZWVycywKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
