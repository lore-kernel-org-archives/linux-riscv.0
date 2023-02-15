Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000CEC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJ2oP7XgoOsL9fFAqqbbYt2voiwysD/fVs417cumoG8=; b=lLMJZRxbssJF05
	WBz6ghfxbeR96xL7s+tPzzeWMJxacecPZwn8CZI8Ik1ocBSkhaWlH/qaB/DvklTqMZDo3br7Uiw55
	PXF5lICsmuyKbH8wD0RqBGQVPIV7jGhGVR8H5VXpFaFybM5HOKZ6XEihvHWOoQv6pbDqwTFolx9W4
	iJKEtVKtD7I0TtxghKtb0LMX+LtDg8rcxjn3xfRJXU7qddz/sM0mPcieQ/Ye6Sd6vovmgTpN+XyP6
	rTPWNOBe4amCLOwniG62MTE1nvIZL7sV0RXiRgMn0EYBohp9ZUyGCxyf2ySbQACZVgStPglajjjnq
	MmjxREEESLaiGs2N5WHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ23-006FuG-8q; Wed, 15 Feb 2023 14:45:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ20-006FtV-RM
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:45:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B491B8223B;
	Wed, 15 Feb 2023 14:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65161C433D2;
	Wed, 15 Feb 2023 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676472309;
	bh=bnWl6GLIuptbwEqTWE8WhV0O9nBtEn5SL4rBx9vtF8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sOGDwE1w4CBDcGSuFbtLps2hGPxxSPFBXzByncCsgw2aWgVU6Z2WewfglHBiIcAXL
	 qiNTt5LN9VpWlXC4gAx4x+OiGq2DBJAZLkQSl3yAtxP3Ro3AS4z/dxSICGv6byBkrL
	 r0bT6OksFen8zrzA/jWpUNVKAfx9yQlUX+wWZPhbdgRHYORHWDv1zxSCctzsrIZoJF
	 FjOcFhYuFa4MywHf0NSapBbJ9VnEuSiG3P2R9UxpF8CbWhIQbZtODpogU7iv+wziw8
	 IJ9wcVH+Mhgc3OFOoNbQXWmAR/LVtezPebB2BLKvcCr2aAGZj5X8nkQhvkdzbU2PLs
	 bAO9JG1G62RoA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren
 <guoren@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v1 0/4] Support bpf trampoline for RV64
In-Reply-To: <20230215135205.1411105-1-pulehui@huaweicloud.com>
References: <20230215135205.1411105-1-pulehui@huaweicloud.com>
Date: Wed, 15 Feb 2023 15:45:06 +0100
Message-ID: <87mt5ft2bx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_064513_056445_729DD35C 
X-CRM114-Status: UNSURE (   8.84  )
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

SGkgTGVodWksCgpQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKCj4g
QlBGIHRyYW1wb2xpbmUgaXMgdGhlIGNyaXRpY2FsIGluZnJhc3RydWN0dXJlIG9mIHRoZSBicGYK
PiBzdWJzeXN0ZW0sIGFjdGluZyBhcyBhIG1lZGlhdG9yIGJldHdlZW4ga2VybmVsIGZ1bmN0aW9u
cwo+IGFuZCBCUEYgcHJvZ3JhbXMuIE51bWVyb3VzIGltcG9ydGFudCBmZWF0dXJlcywgc3VjaCBh
cwo+IHVzaW5nIGVicGYgcHJvZ3JhbSBmb3IgemVybyBvdmVyaGVhZCBrZXJuZWwgaW50cm9zcGVj
dGlvbiwKPiByZWx5IG9uIHRoaXMga2V5IGNvbXBvbmVudC4gV2UgY2FuJ3Qgd2FpdCB0byBzdXBw
b3J0IGJwZgo+IHRyYW1wb2xpbmUgb24gUlY2NC4gU2luY2UgUlY2NCBkb2VzIG5vdCBzdXBwb3J0
IGZ0cmFjZQo+IGRpcmVjdCBjYWxsIHlldCwgdGhlIGN1cnJlbnQgUlY2NCBicGYgdHJhbXBvbGlu
ZSBpcyBvbmx5Cj4gdXNlZCBpbiBicGYgY29udGV4dC4KClRoYW5rcyBhIGxvdCBmb3IgY29udGlu
dWluZyB0aGlzIHdvcmsuIEkgYWdyZWUgd2l0aCB5b3UgdGhhdCBpdCdzCnZhbHVhYmxlIHRvIGhh
dmUgQlBGIHRyYW1wb2xpbmUgc3VwcG9ydCwgZXZlbiB3aXRob3V0IHByb3BlciBkaXJlY3QgY2Fs
bApzdXBwb3J0ICh3ZSdsbCBnZXQgdGhlcmUgc29vbikuIFRoZSB0cmFtcG9saW5lIGVuYWJsZXMg
a2Z1bmMgY2FsbHMuIE9uCnRoYXQgbm90ZTsgSSBkb24ndCBzZWUgdGhhdCB5b3UgZW5hYmxlICJi
cGZfaml0X3N1cHBvcnRzX2tmdW5jX2NhbGwoKSIKYW55d2hlcmUgaW4gdGhlIHNlcmllcy4gIFdp
dGggQlBGIHRyYW1wb2xpbmUgc3VwcG9ydCwgdGhlIFJJU0MtViBCUEYKZmluYWxseSBjYW4gc3Vw
cG9ydCBrZnVuYyBjYWxscyEKCkknZCBhZGQgdGhlIGZvbGxvd2luZyB0byBicGZfaml0X2NvbXA2
NC5jOgoKYm9vbCBicGZfaml0X3N1cHBvcnRzX2tmdW5jX2NhbGwodm9pZCkKewogICAgICAgIHJl
dHVybiB0cnVlOwp9Cgo6LSkKCkknbGwgZG8gYSByZXZpZXcgQVNBUC4KCgpCasO2cm4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
