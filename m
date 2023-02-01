Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C10C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2LsTZEdJvNV0WXeP8yMcQNBbXtweAdR3lTBXaw7Rw8=; b=LyBiYCWZ1huMbb
	ugI38Fm284NOgSu1v89rmP1cp4i7RLZ255uVcc527p8/CnhKwEoGlZMb91TdBM6Yy8maAXYz+GAov
	k9aWskv0eYls1RFGP5VyUymx46DGmoeZr6+CuyRnK8oh02ygNgdavfLtGmurnOd3ZE5hCJLJ9rkOW
	gYkczjht52mbe/V1UjM07nqvoqdgyXh0jcJALCc1+dj0Wf9hkg4wp47V/iubf/OSICFY97PGybRhn
	IQOop6F8VIOjY+JN2Da7MTUdXeirIDdaYmm96eTtew4ASbjGsvSP945eipfzF1dVkSzgD56h2T8GE
	POJsy7AxLWBf9aqnmI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDDA-00C50M-4U; Wed, 01 Feb 2023 13:31:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDD5-00C4wR-7Y
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 13:31:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D32E3B82184;
	Wed,  1 Feb 2023 13:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD08C433D2;
	Wed,  1 Feb 2023 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675258292;
	bh=kd4WPoU9evsMcNwChABWzHebzvoWpWd1TGsGdrEabso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dphgVWlyyQ9/+CiOzWhauSG/G8ZtT2bbsdsmOzFhqOnHb6+r2MLYtyx6yXq5sbogI
	 qdMdIWx1dIhz23KxahTP765pqEi05kH8ELR2PsiHqRyFSqWh3iwaLO3fiTj3ImGmIZ
	 eNaIIi/Q6rpKxkMYG9wvHmLvvGG3O/gz8RLX16rT34MF5BM+0MjVd6nZDgZoAimd3y
	 nPIPqUobUSj7Pik3DP4F8thvdpKBiEyO1FHqwH6lQ/O+ffU9Y3Syf6LTsGAZfritNX
	 YlkBJ2OjengnI3qRZdB55OrLXp6OcXBvgJ+mcWTaUxgpW41dluwldZxgMFMDs77l+5
	 Zv7o4R9Y5OX8A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v6 09/13] riscv/kprobe: Search free registers from
 unused caller-saved ones
In-Reply-To: <20230127130541.1250865-10-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
 <20230127130541.1250865-10-chenguokai17@mails.ucas.ac.cn>
Date: Wed, 01 Feb 2023 14:31:30 +0100
Message-ID: <87pmattsul.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_053135_457599_68C64456 
X-CRM114-Status: UNSURE (   6.82  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IFRo
aXMgcGF0Y2ggZnVydGhlciBhbGxvd3Mgb3B0cHJvYmUgdG8gdXNlIGNhbGxlci1zYXZlZCByZWdp
c3RlcnMgdGhhdAo+IGlzIG5vdCB1c2VkIGFjcm9zcyB0aGUgZnVuY3Rpb24gYmVpbmcgb3B0aW1p
emVkIGFzIGZyZWUgcmVnaXN0ZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBHdW9rYWkgPGNo
ZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPgo+IENvLWRldmVsb3BlZC1ieTogTGlhbyBDaGFu
ZyA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExpYW8gQ2hhbmcgPGxp
YW9jaGFuZzFAaHVhd2VpLmNvbT4KPiBSZXBvcnRlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
a2VybmVsLm9yZz4KClJlcG9ydGVkLWJ5OiBzaG91bGQgYmUgdXNlZCBmb3IgZml4ZXMuIFBsZWFz
ZSBjaGFuZ2UgdG8gU3VnZ2VzdGVkLWJ5OiwKb3Igc2ltcGx5IHJlbW92ZS4KCgpCasO2cm4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
