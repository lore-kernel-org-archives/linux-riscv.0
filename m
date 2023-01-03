Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E951EC4708E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJsUyk92MX2cSeBlTy/+P70CaCo8zCeqt7PPJIS32Jg=; b=gJrPh52Awf13xM
	sihMJoier976eIHSYLiVuRVacT9Pj2Dqop3rhr5Xy1hHvMKdvtRj35Jzz4eMY1PXHWLDNALBWb33h
	e4ZTRbssC2sYqRpS5ipZ80Tgvruht1wfJONPftlCH5eWssoHYqZ/FxR5evvODv7b+J7+Ep4AL+PMm
	ahiF6g8eY9E+dMTs+lID+QYRAwRxxGNS/Dx4nLwZw6EqjT91tEXmfW8GUvv4rK2tITjdS2VZdZ4x9
	1N0ixxiDeX7Dn2ffEP4b6io0mCRdQdS+Z0ZCwpgLyRkh43HqyqHUlNG7Jiw90xkhjcOfqYRS3W+Zo
	z9q/2HimSgFTkkZj3yjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcZt-0009Hm-Nt; Tue, 03 Jan 2023 08:23:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcYZ-0008vR-NX
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 08:22:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5373BB80E3E;
	Tue,  3 Jan 2023 08:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BD6C433D2;
	Tue,  3 Jan 2023 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672734117;
	bh=dqCGbesuZiSsICKd93nHojCpNBxlFGWi0BSgSMEb2pA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sBpIsLtIFN6ZpAAvncp4NPROcu9aq/ZhbboTy6pAxSq/YNT6got2j0ZNoYXyxaDjA
	 eIn959uLAsLuVQgktqfl8IuQA5Y5wBcm59pMAGl7AY35WHlusiPuKfc9LwCyGHi+cw
	 eqVTyM/iRFa0WtcwwB4ePCn78mcqXX28noBbCHMuUbFHCDZ/jdSOHlenB5ofbSL01E
	 jBpGE2PlGurycpmFSrC591OzUqC/cuOj4cB1v5llVIt/FJGAv/CKcFezFbVqd5QdJs
	 qqje8Q32aPVfIa4ZJ8llY8VX4AAu62dOZ7EJi+VAc2790Kg7+XWsg4SgVoEmwrbYOu
	 BqBCMxrNobCvg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH bpf-next 3/4] riscv, bpf: Add bpf_arch_text_poke
 support for RV64
In-Reply-To: <713f9f26-da42-eda8-c804-338d61b1557c@huawei.com>
References: <20221219133736.1387008-1-pulehui@huaweicloud.com>
 <20221219133736.1387008-4-pulehui@huaweicloud.com>
 <87v8looypd.fsf@all.your.base.are.belong.to.us>
 <713f9f26-da42-eda8-c804-338d61b1557c@huawei.com>
Date: Tue, 03 Jan 2023 09:21:54 +0100
Message-ID: <877cy4xc2l.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_002159_997218_5FCC27BA 
X-CRM114-Status: UNSURE (   9.40  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4gd3JpdGVzOgoKPiBPbiAyMDIzLzEvMyAxNToz
NywgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQu
Y29tPiB3cml0ZXM6Cj4+IAo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+PiBpbmRleCBiZjQ3
MjFhOTlhMDkuLmZhOGIwM2M1MjQ2MyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2Jw
Zl9qaXRfY29tcDY0LmMKPj4+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMK
Pj4gCj4+PiBAQCAtMTI2Niw3ICsxMzg5LDcgQEAgaW50IGJwZl9qaXRfZW1pdF9pbnNuKGNvbnN0
IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgsCj4+PiAg
IAo+Pj4gICB2b2lkIGJwZl9qaXRfYnVpbGRfcHJvbG9ndWUoc3RydWN0IHJ2X2ppdF9jb250ZXh0
ICpjdHgpCj4+PiAgIHsKPj4+IC0JaW50IHN0YWNrX2FkanVzdCA9IDAsIHN0b3JlX29mZnNldCwg
YnBmX3N0YWNrX2FkanVzdDsKPj4+ICsJaW50IGksIHN0YWNrX2FkanVzdCA9IDAsIHN0b3JlX29m
ZnNldCwgYnBmX3N0YWNrX2FkanVzdDsKPj4+ICAgCWJvb2wgaXNfbWFpbl9wcm9nID0gY3R4LT5w
cm9nLT5hdXgtPmZ1bmNfaWR4ID09IDA7Cj4+IAo+PiBUaGlzIGxpbmUgbWFnaWNhbGx5IGFwcGVh
cmVkLCBhbmQgbWFrZXMgaXQgaGFyZCB0byBhcHBseSB0aGUgc2VyaWVzCj4+IHdpdGhvdXQgaGFj
a2luZyB0aGUgcGF0Y2hlcyBtYW51YWxseS4gR29pbmcgZm9yd2FyZCwgcGxlYXNlIHN1cHBseSBh
Cj4+IGJhc2UgdHJlZSBjb21taXQgdG8gdGhlIHNlcmllcyAob3IgYSBsaW5rIHRvIGEgY29tcGxl
dGUgZ2l0IHRyZWUpLgo+PiAKPgo+IEEgcmViYXNlIHZlcnNpb24gaGFzIGJlZW4gcmVzZW5kIGFz
IGZvbGxvdzoKPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDIyMTIyMDAyMTMxOS4x
NjU1ODcxLTEtcHVsZWh1aUBodWF3ZWljbG91ZC5jb20vCgpZZXMsIGJ1dCB3aXRoIHRoZSBzYW1l
IGlzc3VlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyMjEyMjAwMjEzMTkuMTY1NTg3
MS00LXB1bGVodWlAaHVhd2VpY2xvdWQuY29tLwoKVGhlICJpc19tYWluX3Byb2ciIGxpbmUgaXMg
c3RpbGwgYXJvdW5kIGluIHRoZSByZXNlbmQuCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
