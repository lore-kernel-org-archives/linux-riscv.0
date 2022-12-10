Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E39C10F1B
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 16:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhUMk7/NdQ1/tELTiYdCUqlXBH2bfcPzMykC16tccow=; b=YSutaTRhVRylP2
	RvC44pcpHi6vbFawKqlyKTH7HvmL6XzTuztp4dxMfam6t7XLXCrNGiUY+U/JUd+Spyz5XO4/H2JZS
	G1Yems1+kFyWCOTN+/BA7+AlHb0tOOFFvFP3mTkUpCPHrX7nPMJi2V9qDX+75g9ppJx9HZYnldMwu
	scbomIgrk7JJU+Gry3lgV7airgno+SNtLUdUT7G7f1zhCLDeMKc26JitcfIh4Zggidi4rEU/Q7NTg
	wV0Uf8H5cfGT6EFGSMfJW1o9Wptp3ZZzlyU3SSOCjcLauE0QghjnvJDLl8uXx0P+hYe5sZ/UkzKbp
	QCCmmlK9nIc//iPhzq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p42MP-001ypv-9Z; Sat, 10 Dec 2022 16:05:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p42ML-001yj4-V4
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 16:05:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5C146B82A85;
	Sat, 10 Dec 2022 16:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E582C433EF;
	Sat, 10 Dec 2022 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670688350;
	bh=RTJa209H796yp48LMbJyK45Y+jsR3vTqUZTkkFiVhKY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LO020q6nj+vKqmCbERgmxVz5Bxpb/uwwTIJDccRXXdpwh2DXAPGdpG78c8DkKInt8
	 6a7QTdj3gNDP+5XZ5oPXG6sxxez/+oDZUA1DX9I2pdtbiQr4UqyUPVZZgYz57BCscP
	 /KlXfaOZw90Fb0ht4FWkISACxBbJQm8xpc9GpQ7uG4rLSNug4Ao+9oyIA+RvmLr4Ob
	 B+8idd2c0TcOTqXSWfr2sMj4BQ/CwNd6xt8FTs/q3gR8uAIMdfvdL0Pp4TXYwU8oGy
	 WfWZ9Jo2Hh0YfjDtoMTTf5CrSoPxnxLMMVfvkf/UtYvkrN3VHS1OlaS9Jp4OPEO/kF
	 V/Qi2bph9VB+w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
 peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
 heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
 falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
 atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 mark.rutland@arm.com, zouyipeng@huawei.com, bigeasy@linutronix.de,
 David.Laight@aculab.com, chenzhongjin@huawei.com, greentime.hu@sifive.com,
 andy.chiu@sifive.com, ben@decadent.org.uk, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V10 04/10] riscv: entry: Convert to generic entry
In-Reply-To: <CAJF2gTTE_ZtKR6YTDEpF5uXHxUkuZ1PsZoL2Nf3NXpJWca9W7Q@mail.gmail.com>
References: <20221208025816.138712-1-guoren@kernel.org>
 <20221208025816.138712-5-guoren@kernel.org>
 <87tu26w6gn.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTTE_ZtKR6YTDEpF5uXHxUkuZ1PsZoL2Nf3NXpJWca9W7Q@mail.gmail.com>
Date: Sat, 10 Dec 2022 17:05:47 +0100
Message-ID: <871qp7tfac.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_080554_188907_F1DAF539 
X-CRM114-Status: UNSURE (   5.86  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4+ID4gIC0gTGl0dGxlIG1vZGlm
aWNhdGlvbiBvbiByZXRfZnJvbV9mb3JrICYgcmV0X2Zyb21fa2VybmVsX3RocmVhZAo+Pgo+PiBX
aGF0IGNoYW5nZXM/Cj4gIEVOVFJZKHJldF9mcm9tX2ZvcmspCj4gKyAgICAgICBjYWxsIHNjaGVk
dWxlX3RhaWwKPiArICAgICAgIG1vdmUgYTAsIHNwIC8qIHB0X3JlZ3MgKi8KPiAgICAgICAgIGxh
IHJhLCByZXRfZnJvbV9leGNlcHRpb24KPiAtICAgICAgIHRhaWwgc2NoZWR1bGVfdGFpbAo+ICsg
ICAgICAgdGFpbCBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlCj4gIEVORFBST0MocmV0X2Zyb21f
Zm9yaykKPgo+ICBFTlRSWShyZXRfZnJvbV9rZXJuZWxfdGhyZWFkKQo+ICAgICAgICAgY2FsbCBz
Y2hlZHVsZV90YWlsCj4gICAgICAgICAvKiBDYWxsIGZuKGFyZykgKi8KPiAtICAgICAgIGxhIHJh
LCByZXRfZnJvbV9leGNlcHRpb24KPiAgICAgICAgIG1vdmUgYTAsIHMxCj4gLSAgICAgICBqciBz
MAo+ICsgICAgICAgamFsciBzMAo+ICsgICAgICAgbW92ZSBhMCwgc3AgLyogcHRfcmVncyAqLwo+
ICsgICAgICAgbGEgcmEsIHJldF9mcm9tX2V4Y2VwdGlvbgo+ICsgICAgICAgdGFpbCBzeXNjYWxs
X2V4aXRfdG9fdXNlcl9tb2RlCj4gIEVORFBST0MocmV0X2Zyb21fa2VybmVsX3RocmVhZCkKClRo
YW5rcyBmb3IgY2xlYXJpbmcgdGhhdCB1cCEgSXQncyBtb3JlIHVzZWZ1bCB0byBoYXZlIGEgZGVz
Y3JpcHRpdmUKdGV4dCwgdGhhbiBqdXN0ICJ0aGVzZSBmdW5jdGlvbnMgd2VyZSBjaGFuZ2VkIi4g
KFdoeSBpbnN0ZWFkIG9mIHdoYXQpCgoKQ2hlZXJzLApCasO2cm4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
