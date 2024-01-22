Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E863C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1l5ukuV1CEroVogPsp3FPdsNWNINVphbC4q36SXSbqM=; b=kFyySGoxVuaYML
	AUanHfECzosKkDOZpIO5mOihDumRPLmMUmBu/vehbVID0D8bigPT9q6zd9K6lZ+zfqGU2OR958qln
	49yuZ7I88ixWk674IPFF8PqjmIi3caF/Dui4bKBZszzu4tHil7kr69mZosbL7GX3bAvrfMC4V854e
	fDWZSD0sOzMSb4d/FjYhe00Ih+Eqdvq53uwZ1fKqqTK5HFItPy6+WHk36AiYjWc++zlMxhQSWylR8
	VQ35jA6WZ56sWvd/UCk9A3anvGAOqB5hL5Jpu11K8ZgGMqBNJiUbSRaFRGmJ7p3iuDK/r7anAiVkv
	25gnfuHhh7DSkYIcD3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvta-00Cap2-1H;
	Mon, 22 Jan 2024 15:07:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvtX-00CamV-23
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 15:07:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 23BA3B80C82;
	Mon, 22 Jan 2024 15:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E0CC433F1;
	Mon, 22 Jan 2024 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705936045;
	bh=C4Pf/vtgwLjODbCX6iJQ/lW7YJ0cu5nY/RezoggfNhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IbnVcHEyw4bB2vApZD4XltuW4l6nP3uGksN7ElYJtQWlQuCgEIWCTWEV0ce4jL4CK
	 E1NEtjVLHC+sPHWbkbWupyw20zhyH6Z48MHONKxH2sX3hcYlYnJ9koEvFfmpluFAS7
	 gxWP54ZbuFcwTNkq/WciHVXzXK2W2rcImGcFPBG+8o1Iu/qELd9AQn116bJwrsfi29
	 psHLU2D/6sre0i63ytF57ld9yZcbtXlbfDM0Oj2wF+OucVYdF2S60PkO+rqPuAVi2K
	 TG7p7/SAZBckT3zqJYe+cFxuYEXrxOxttcBG5Xte39hW+RqhF2YfHl/tvskMnKuYEO
	 tj+Y3osIlbI8A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH RESEND bpf-next v3 0/6] Zbb support and code
 simplification for RV64 JIT
In-Reply-To: <878r4hqvgq.fsf@all.your.base.are.belong.to.us>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <87il3lqvye.fsf@all.your.base.are.belong.to.us>
 <baffbab8-721f-462a-8b58-64972f5eae70@huaweicloud.com>
 <878r4hqvgq.fsf@all.your.base.are.belong.to.us>
Date: Mon, 22 Jan 2024 16:07:22 +0100
Message-ID: <874jf5qudx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_070727_821264_653CA449 
X-CRM114-Status: UNSURE (   5.28  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPgo+PiBPbiAyMDI0LzEvMjIgMjI6MzMsIEJq
w7ZybiBUw7ZwZWwgd3JvdGU6Cj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+
IHdyaXRlczoKPj4+IAo+Pj4+IEFkZCBaYmIgc3VwcG9ydCBbMF0gdG8gb3B0aW1pemUgY29kZSBz
aXplIGFuZCBwZXJmb3JtYW5jZSBvZiBSVjY0IEpJVC4KPj4+PiBNZWFud2hpbGUsIGFkanVzdCB0
aGUgY29kZSBmb3IgdW5pZmljYXRpb24gYW5kIHNpbXBsaWZpY2F0aW9uLiBUZXN0cwo+Pj4+IHRl
c3RfYnBmLmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUgcGFzc2VkLCBhcyB3ZWxsIGFzIHRoZSBy
ZWxhdGl2ZQo+Pj4+IHRlc3RjYXNlcyBvZiB0ZXN0X3Byb2dzKi4KPj4+Pgo+Pj4+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1iaXRtYW5pcC9yZWxlYXNlcy9kb3dubG9hZC8x
LjAuMC9iaXRtYW5pcC0xLjAuMC0zOC1nODY1ZTdhNy5wZGYgWzBdCj4+Pj4KPj4+PiB2MyByZXNl
bmQ6Cj4+Pj4gLSByZXNlbmQgZm9yIG1haWwgYmUgdHJlYXRlZCBhcyBzcGFtLgo+Pj4+Cj4+Pj4g
djM6Cj4+Pj4gLSBDaGFuZ2UgdG8gZWFybHktZXhpdCBjb2RlIHN0eWxlIGFuZCBtYWtlIGNvZGUg
bW9yZSBleHBsaWNpdC4KPj4+IAo+Pj4gTGVodWksCj4+PiAKPj4+IFNvcnJ5IGZvciB0aGUgZGVs
YXkuIEknbSBjaGFzaW5nIGEgc3RydWN0X29wcyBSSVNDLVYgQlBGIHJlZ3Jlc3Npb24gaW4KPj4+
IDYuOC1yYzEsIEkgd2lsbCBuZWVkIHRvIHdyYXAgbXkgaGVhZCBhcm91bmQgdGhhdCBwcmlvciBy
ZXZpZXdpbmcKPj4+IHByb3Blcmx5Lgo+Pj4gCj4+Cj4+IE9oLCBJIGFsc28gZm91bmQgdGhlIHBy
b2JsZW0gd2l0aCBzdHJ1Y3Qgb3BzIGFuZCBmaXhlZCBpdAoKUHUsIHdpdGggeW91ciBwYXRjaCBi
cGZfaXRlcl9zZXRzb2Nrb3B0LCBicGZfdGNwX2NhLCBhbmQgZHVtbXlfc3Rfb3BzCnBhc3NlcyEK
ClBsZWFzZSBzcGluIGEgcHJvcGVyIGZpeGVzIHBhdGNoLCBhbmQgZmVlbCBmcmVlIHRvIGFkZDoK
ClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpBY2tlZC1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCgpCasO2cm4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
