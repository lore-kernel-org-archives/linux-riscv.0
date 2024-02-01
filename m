Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DE5C4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJigS3edOhEBVhXgMPa5l9phUTkexvTdsP+yee3HVdo=; b=yIUqZ3j5V9F02P
	LPZvR+V8K/gq0kua5RxhqrJaLlPwD4aJnzu4Nn3XdautsWJ+SjRI63Yp5Am7M4vjg7MBFc2izlzCZ
	CcWRrgrM8CeSZe8FLOEFtPLsLactuZlCu7QerLPto4L7HfwXXykMbRBlani81aGrLsEohr44xq5kv
	tpB3zzHBS9/v9RX6xV/hXs1++ghgMrpRRolrEet63/m27BlVmWPDn3Cu3S2542ovYqauEEFkopA51
	ZXEYZ1FY7uPanLq1eOPaG1V1pulF8tNfxgCwXd3O51pL09wfJNj9O8ZL6coYHOcjqEoVEi21kxzjR
	E7Xp/0XxddE3TIHHw46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVate-00000008nei-1HRV;
	Thu, 01 Feb 2024 17:30:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVatb-00000008ndk-1yyB
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 17:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBDC86200C;
	Thu,  1 Feb 2024 17:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279E3C433F1;
	Thu,  1 Feb 2024 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706808638;
	bh=i5MzbQtJxIJyUIioRZmwoAWCq7On376ElDaTQVJNDRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fK/ob+v7AOYnbbecuKFi2nISpVtsgLLSChG+9Wtqi4VPBBMhhbooyaUJYNEtpPnPm
	 1vLOp+/Ospfhf+IfugDdf95OuGpu5c2riFWTR9Fuu5S2k2b2zs3hBHPkxCLmhjYqAy
	 0gmL03GHU1088tECMtgAz6OktfBytZWF1G6Ed3sXYNtaq0YDc417G8pWPJ2k5ToMcR
	 qCD+Ipsd6x62DEAqZP3CPmN0VXsbac/kLz1uu27rBAJCswFcLQflNacfckx3/j1A9t
	 E/F2ls7LUcjh+st2+jsXjsWunA9DA1MXYFwBirRQBRl/tlx+4zAGERFC1LuhS1LZtG
	 6xSO0ZeY5y1mA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Daniel Borkmann
 <daniel@iogearbox.net>
Cc: Pu Lehui <pulehui@huaweicloud.com>, bpf <bpf@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Network Development
 <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Andrii
 Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong
 Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui
 <pulehui@huawei.com>, Leon Hwang <hffilwlqm@gmail.com>
Subject: Re: [PATCH bpf-next v3 0/4] Mixing bpf2bpf and tailcalls for RV64
In-Reply-To: <CAADnVQ+rLneO4t=YYmLYtc945Fz0=ucNTWZBxgvs8toFY-onRg@mail.gmail.com>
References: <20240201083351.943121-1-pulehui@huaweicloud.com>
 <1e7181e4-c4c5-d307-2c5c-5bf15016aa8a@iogearbox.net>
 <CAADnVQ+rLneO4t=YYmLYtc945Fz0=ucNTWZBxgvs8toFY-onRg@mail.gmail.com>
Date: Thu, 01 Feb 2024 18:30:35 +0100
Message-ID: <871q9w9jno.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_093039_572809_10118AF9 
X-CRM114-Status: GOOD (  13.31  )
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

QWxleGVpIFN0YXJvdm9pdG92IDxhbGV4ZWkuc3Rhcm92b2l0b3ZAZ21haWwuY29tPiB3cml0ZXM6
Cgo+IE9uIFRodSwgRmViIDEsIDIwMjQgYXQgMjo1NuKAr0FNIERhbmllbCBCb3JrbWFubiA8ZGFu
aWVsQGlvZ2VhcmJveC5uZXQ+IHdyb3RlOgo+Pgo+PiA+IHdpbGwgYmUgZGVzdHJveWVkLiBTbyB3
ZSBpbXBsZW1lbnRlZCBtaXhpbmcgYnBmMmJwZiBhbmQgdGFpbGNhbGxzCj4+ID4gc2ltaWxhciB0
byB4ODZfNjQsIGkuZS4gdXNpbmcgYSBub24tY2FsbGVlIHNhdmVkIHJlZ2lzdGVyIHRvIHRyYW5z
ZmVyCj4gLi4uCj4+IElpdWMsIHRoaXMgc3RpbGwgbmVlZHMgYSByZXNwaW4gYXMgcGVyIHRoZSBv
bmdvaW5nIGRpc2N1c3Npb25zLiBBbHNvLAo+PiBpZiB5b3UgaGF2ZSB3b3JrZWQgb24gQlBGIHNl
bGZ0ZXN0cyB3aGljaCBleGVyY2lzZSB0aGUgY29ybmVyIGNhc2UKPj4gYXJvdW5kIGE2LCBwbGVh
c2UgaW5jbHVkZSB0aGVtIGluIHRoZSBzZXJpZXMgYXMgd2VsbCBmb3IgY292ZXJhZ2UuCj4KPiBI
b2xkIG9uLCBmb2xrcy4KPiBJJ20gbm90IHN1cmUgaXQncyBzdWNoIGEgY29kZSBpZGVhIHRvIHN1
cHBvcnQgdGFpbGNhbGxzIGZyb20gc3VicHJvZ3MKPiBpbiByaXNjLXYuCj4gVGhleSdyZSBicm9r
ZW4gb24geDg2LTY0IGFuZCBzbyBmYXIgc2V2ZXJhbCBhdHRlbXB0cyB0byBmaXggdGhlbQo+IHdl
cmUgbm90IHN1Y2Nlc3NmdWwuCj4gSWYgd2UgZG9uJ3QgaGF2ZSBhIGZpeCBzb29uIHdlIHdpbGwg
ZGlzYWJsZSB0aGlzIGZlYXR1cmUgY29tcGxldGVseQo+IGluIHRoZSB2ZXJpZmllci4KPiBJbiBn
ZW5lcmFsIHRhaWxjYWxsaW5nIGZyb20gc3VicHJvZ3MgaXMgYSBuaWNoZSB1c2UgY2FzZS4KPiBJ
ZiB0aGVyZSBhcmUgdXNlcnMgdGhleSBzaG91bGQgdHJhbnNpdGlvbiB0byB0YWlsIGNhbGwgZnJv
bSBtYWluIHByb2cgb25seS4KPgo+IFNlZQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi9D
QUFEblZRSjFzenJ5OVAwMHd3ZVZEdTRkMEFRb01fNDlxVC1fdWVpcnZnZ0FpQ1pycHdAbWFpbC5n
bWFpbC5jb20vCgpHb3QgaXQuIC4uLmFuZCBpdCdzIGJyb2tlbiBvbiBhcm02NCBhcyB3ZWxsPwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
