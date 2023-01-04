Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7C4C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeMgoq4sjM5bZq3+QUrHMguap/WveLKJTErF1YtShks=; b=xt9n4fpc7Accyr
	6/bdW+0GAgEtXkqZE9DxgRIS/fqD7tsPfYxeNLmeD4DyNdK1ntmBfzZW9MHt5b5PJrN7GVenSWdp8
	ZNX9Zb4ZzOijL1z3f04tE69BUu+EhUPNfM44ZQznf+O24+IHwpZ6gOr19hx/oGqfBb5wwyaAQT5iN
	yIOQLR6hpHdy5Br0mHz1wRZaxtfluRNMnBfQ8+5la/LP2boy/166tx2XEMe+3kHzYc0t7HuBo6gs9
	wvJBYuJZ28qfCiUMUvhifalDJuossXZ1KmBXRB1UJ1j1qlTt7ujEH1ofJBkIAODw3LGwSFTouEXzU
	P/Tlggl1j+2x5J0BIc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzRQ-007ljm-NI; Wed, 04 Jan 2023 08:48:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzOl-007kNb-QK
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:45:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3FA89615C8;
	Wed,  4 Jan 2023 08:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CDEC433F0;
	Wed,  4 Jan 2023 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672821919;
	bh=8hocUuWWasyP5ATR86FZNJuCPicwzIw4Gka8O+mb7pE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dCIxLhZ4PiGyU2kJ/PeK5kv5dlDHHaPzno4Dz/MQo4zoV+23V+XtqPUAF/BYgiHA/
	 PNpGWAZ9efU1rDOeDCaqPsAufN9yl4EX0GJOqyLEBnJaS34L7tgrWgBB1FLCJhCqOh
	 Dx3+MJjI2zN7psei+eI4O4xbQZ62hg5ZgTDhDnbdUpv2pM80ZxQhHloIH6wVDnR1lh
	 tU+FsyWHsnbNyBLG7Kw9ZQfa8CGNUHGzm8ocTcgbMBbvjv4aNZ1+ABqwfly1HYFOq/
	 usc1HKBFnrss/18hITpoCMePHkQrAhGai27X/jJ1d6EkdOLRCYQ3kLE/NRlfCWP5Ti
	 BIrMQJzUSrh2w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Xim <chenguokai17@mails.ucas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 rostedt@goodmis.org, mingo@redhat.com, sfr@canb.auug.org.au,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, "liaochang
 (A)" <liaochang1@huawei.com>
Subject: Re: [PATCH v5 0/9] Add OPTPROBES feature on RISCV
In-Reply-To: <A8ECFC78-661F-405D-8222-F8D1A73EA732@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <87y1qkvmpf.fsf@all.your.base.are.belong.to.us>
 <A8ECFC78-661F-405D-8222-F8D1A73EA732@mails.ucas.ac.cn>
Date: Wed, 04 Jan 2023 09:45:17 +0100
Message-ID: <87edsasn6q.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_004529_364882_2DD890E5 
X-CRM114-Status: UNSURE (   9.32  )
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

WGltIDxjaGVuZ3Vva2FpMTdAbWFpbHMudWNhcy5hYy5jbj4gd3JpdGVzOgoKPiBIaSBCasO2cm4s
Cj4KPiBUaGFua3MgZm9yIHlvdXIgZGV0YWlsZWQgcmV2aWV3ISBJIG1hZGUgdGVzdHMgbWFpbmx5
IG9uIHNvbWUgc3lzY2FsbC90aW1lciByZWxhdGVkCj4gZnVuY3Rpb25zIHdoZXJlIHRoZXNlIGlz
c3VlcyB3ZXJlIG5vdCB0cmlnZ2VyZWQuIEkgd2lsbCBjaGVjayBhbGwgdGhlc2UgaXNzdWVzIGFz
IHdlbGwKPiBhcyBjb21tZW50cyB0aGF0IHNwcmVhZCBwZXItcGF0Y2ggYmVmb3JlIGEgbmV3IHZl
cnNpb24gb2YgcGF0Y2ggc2V0IGlzIHNlbnQuCj4KPiBGWUkgdGhlIDMyYiBzdXBwb3J0IGlzIGlu
Y2x1ZGVkIGFuZCB3YXMgdGVzdGVkIHdpdGggbW9zdGx5IHNhbWUgY2FzZXMgYXMgdGhlIDY0YiBv
bmUuCgpPayEgVGhhbmsgeW91IGZvciBjbGFyaWZ5aW5nIQoKCkJqw7ZybgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
