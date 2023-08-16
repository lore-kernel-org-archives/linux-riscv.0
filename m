Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5684CC001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agUzaZQ0wpfZ7RVE26RjrbFEsVGMFtbVOl53QPZqmW4=; b=ZZzllpce8G8wqM
	lCVyVPWyR0VJkdjH82g/VsHgLZ9OnJ9eJGn77P+YJiUaMoHBlFp3VebMgXVZJ9Ki7/RDgWp+inXW/
	JQBAJO+yMo54HXksxT33+DXqnEwB1v/+F4FPu1C6dY3c9BcDc4WbOdTtv5pSFLz4T2XWhGoY5MPjQ
	oE71IlT5FQldnvOljrf3S66ZkLbC2Kp9y/xMaR7hsZLoesC5NtbVx4jPwZukWR4qzLCFxrMPdKXrU
	7GNaj91nzdKkb3zlIeHR+eDi18mctqso2xkjrflrBEhvT6mb/NcO5kj+eb+6JXV+v4+awMy90w4V5
	THXcODnd11Z146Be5XqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIAk-004SOH-1J;
	Wed, 16 Aug 2023 15:10:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIAi-004SNe-0I
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 15:10:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2AAD964D9E;
	Wed, 16 Aug 2023 15:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7BEC433BC;
	Wed, 16 Aug 2023 15:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692198654;
	bh=0x89vx8T7ctChfZuk4nUajsbvgaqWMb4v5FnF8RzIps=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=d2ilGcmUc2lIoXlJIxwbA9xsJE8ThubtKAfd5IO0NRTSTadGqUE8bCddtcFkE2AbS
	 YiUjYK9SeLUS95ZDV49L5iI/kuFcZFS1nydpgRoIR3FB+TMv7PDkUakxLkecYndN/W
	 WsB6X0Kc7+N/iH7zGCSZuHfNlA9PZv0t2S/7TcYm7l6CJMSCkKk0LJ8h6YOzGsws6T
	 /Ek8MmIsJcdtaj3NuAvIvUwgmva44HAZbG1kDsBLeeLn4E8w2diMJyJmBBMbNZE7FZ
	 ITi1FtPkH6JNTxdVqvyiNJC6aEcrqX1VlUUvUIX+FuxC6x7fQnvYSQ7hZuPlGv47bb
	 DX2l/+G/IS98A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>, conor.dooley@microchip.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterz@infradead.org, mpe@ellerman.id.au, jpoimboe@kernel.org,
 mark.rutland@arm.com, svens@linux.ibm.com, cuiyunhui@bytedance.com,
 guoren@kernel.org, jszhang@kernel.org, ebiederm@xmission.com,
 bjorn@rivosinc.com, heiko@sntech.de, xianting.tian@linux.alibaba.com,
 mnissler@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Dump user opcode bytes on fatal faults
In-Reply-To: <20230329082950.726-1-cuiyunhui@bytedance.com>
References: <20230329082950.726-1-cuiyunhui@bytedance.com>
Date: Wed, 16 Aug 2023 17:10:51 +0200
Message-ID: <87v8dfqays.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_081056_190403_13F5E975 
X-CRM114-Status: GOOD (  12.86  )
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

SGkgWXVuaHVpLAoKV2FraW5nIHVwIHRoZSBkZWFkISA7LSkKCll1bmh1aSBDdWkgPGN1aXl1bmh1
aUBieXRlZGFuY2UuY29tPiB3cml0ZXM6Cgo+IFdlIGVuY291bnRlcmVkIHN1Y2ggYSBwcm9ibGVt
IHRoYXQgd2hlbiB0aGUgc3lzdGVtIHN0YXJ0cyB0byBleGVjdXRlCj4gaW5pdCwgaW5pdCBleGl0
cyB1bmV4cGVjdGVkbHkgd2l0aCBlcnJvciBtZXNzYWdlOiAidW5oYW5kbGVkIHNpZ25hbCA0Cj4g
Y29kZSAweDEgLi4uIi4KPgo+IFdlIGFyZSBtb3JlIGN1cmlvdXMgYWJvdXQgd2hpY2ggaW5zdHJ1
Y3Rpb24gZXhlY3V0aW9uIGNhdXNlZCB0aGUKPiBleGNlcHRpb24uIEFmdGVyIGR1bXBpbmcgaXQg
dGhyb3VnaCBzaG93X29wY29kZXMoKSwgd2UgZm91bmQgdGhhdCBpdAo+IHdhcyBjYXVzZWQgYnkg
YSBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbi4KPgo+IEluIHRoaXMgd2F5LCB3ZSBmb3VuZCB0
aGUgcHJvYmxlbTogaW4gdGhlIHN5c3RlbSBicmluZ3VwICwgaXQgaXMKPiBwcmVjaXNlbHkgdGhh
dCB3ZSBoYXZlIG5vdCBlbmFibGVkIHRoZSBmbG9hdGluZyBwb2ludCBmdW5jdGlvbihDT05GSUdf
RlBVCj4gaXMgc2V0LCBidXQgbm90IGVuYWxiZSBDT01QQVRfSFdDQVBfSVNBX0YvRCBpbiB0aGUg
ZHRzIG9yIGFjcGkpLgo+Cj4gTGlrZSBjb21taXQgYmE1NGQ4NTZhOWQ4ICgieDg2L2ZhdWx0OiBE
dW1wIHVzZXIgb3Bjb2RlIGJ5dGVzIG9uIGZhdGFsCj4gZmF1bHRzIiksIHdoZW4gYW4gZXhjZXB0
aW9uIG9jY3VycywgaXQgaXMgbmVjZXNzYXJ5IHRvIGR1bXAgdGhlCj4gaW5zdHJ1Y3Rpb24gdGhh
dCBjYXVzZWQgdGhlIGV4Y2VwdGlvbi4KClg4NidzIHNob3dfb3Bjb2RlcygpIGlzIHVzZWQgYm90
aCBmb3Iga2VybmVsIG9vcHM6ZXMsIGFuZCB1c2VybGFuZAp1bmhhbmRsZWQgc2lnbmFscy4gT24g
UklTQy1WIHRoZXJlJ3MgZHVtcF9rZXJuZWxfaW5zdHIoKSBhZGRlZCBpbiBjb21taXQKZWIxNjVi
ZmE4ZWFmICgicmlzY3Y6IEFkZCBpbnN0cnVjdGlvbiBkdW1wIHRvIFJJU0MtViBzcGxhdHMiKS4K
CldkeXQgYWJvdXQgcmV3b3JraW5nIHRoYXQgZnVuY3Rpb24sIHNvIHRoYXQgaXQgd29ya3MgZm9y
IHVzZXJsYW5kIGVwYyBhcwp3ZWxsPyBJIHRoaW5rIGl0J3MgdXNlZnVsIHRvIGhhdmUgdGhlIHN1
cnJvdW5kaW5nIGluc3RydWN0aW9uIGNvbnRleHQsCmFuZCBub3QganVzdCBvbiBpbnN0cnVjdGlv
bi4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
