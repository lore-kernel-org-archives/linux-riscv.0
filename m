Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F09C352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwam4nWMF77P8pPPHbZdHXo7oc/HnRNYIpOhYTO89N8=; b=kBE69FAoWDLg+G
	HDx94GRS828B0UWaOFGUbxnyhf49BX64KJZ+fbyYC8UHSFmQPD+bvZG38Cbp1LNPqDolTiwPRhIZN
	IR8v2HLBd6FRSfkof3eiJmaGbAJxVkjWK4Zgal5jOZtmjCDOug0idxOhPgauYgzpjRGlULXhfZVfp
	x+1hEtlWCGBS4NheVC+v0SWGdDCfJZQ3AZ+bKHM8atp1tfPMfwDGJ3zMW0vcXPuUBC3jnu7v+wLqW
	1KpWdVH172a9Tqv8bf11mexb1XpIYx9OBQ2rL8MsmQgwRH7SgNchRrZCS5E8x3zrngLVKkAN4OQ6A
	yievYVHH4uz4FTxOx4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2VeK-007qKx-23; Tue, 06 Dec 2022 10:58:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2VeH-007q3J-CB
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 10:58:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1F51EB818EE;
	Tue,  6 Dec 2022 10:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91942C433D7;
	Tue,  6 Dec 2022 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670324277;
	bh=oioQ2q8bR8USiRel0ZxqKjrQ/0jFx43JLXf+oz1BzU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fsXiDUxkzmX+RIzVJrKr6FEUqv0lA5yEYEqLlcrvSw/ZHQwn0/7rj6J1JVBgdcmEG
	 ZCqys/kjttsYYC4GTxw4gknCD3+UtvIOO2m6XhUVHmF+L7VahEjFyRetO4BbnQrRDo
	 VsTNc6pEwd8Jah2lpQa/RT3h0SG0F7HrE+fCd+Nq1XrgIJZTVGxPfyEzq7ysp7RHwD
	 jypzudpdjgf9q1+Yw+0mVSP4beWnejHxNYSgi4bw/zg4dFwYVX0/fZN+5OnClfKu0g
	 0Y9FzxFqWmYNp624YVhmdZhrGDKcpo4+TvvH9wJ8GrLnIHUx1HMy17nClrVvqd7NEB
	 Muu2urD/363oA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf v3] riscv, bpf: Emit fixed-length instructions for
 BPF_PSEUDO_FUNC
In-Reply-To: <20221206091410.1584784-1-pulehui@huaweicloud.com>
References: <20221206091410.1584784-1-pulehui@huaweicloud.com>
Date: Tue, 06 Dec 2022 11:57:55 +0100
Message-ID: <87fsds240c.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_025805_601834_9108D5BB 
X-CRM114-Status: UNSURE (   6.49  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBGb3IgQlBGX1BTRVVET19GVU5DIGluc3RydWN0
aW9uLCB2ZXJpZmllciB3aWxsIHJlZmlsbCBpbW0gd2l0aAo+IGNvcnJlY3QgYWRkcmVzc2VzIG9m
IGJwZl9jYWxscyBhbmQgdGhlbiBydW4gbGFzdCBwYXNzIG9mIEpJVC4KPiBTaW5jZSB0aGUgZW1p
dF9pbW0gb2YgUlY2NCBpcyB2YXJpYWJsZS1sZW5ndGgsIHdoaWNoIHdpbGwgZW1pdAo+IGFwcHJv
cHJpYXRlIGxlbmd0aCBpbnN0cnVjdGlvbnMgYWNjb3Jyb2RpbmcgdG8gdGhlIGltbSwgaXQgbWF5
Cj4gYnJva2UgY3R4LT5vZmZzZXQsIGFuZCBsZWFkIHRvIHVucHJlZGljdGFibGUgcHJvYmxlbSwg
c3VjaCBhcwo+IGluYWNjdXJhdGUganVtcC4gU28gbGV0J3MgZml4IGl0IHdpdGggZml4ZWQtbGVu
Z3RoIGluc3RydWN0aW9ucy4KPgo+IEZpeGVzOiA2OWMwODdiYTYyMjUgKCJicGY6IEFkZCBicGZf
Zm9yX2VhY2hfbWFwX2VsZW0oKSBoZWxwZXIiKQo+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxw
dWxlaHVpQGh1YXdlaS5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+CgpUaGFuayB5b3UhCgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
a2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
