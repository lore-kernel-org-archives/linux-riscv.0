Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50FAC3DA66
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 18:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NssqtEB3jV8Jg+/2beYDAtzWVeDqsgSXsS1ye8EyzlA=; b=TTcGN6lIeLTnS9
	8y5/EnkuAYwny0HYNnLFwLcfjSoFTOrHXA2CkqOWo2J9YxQQl2Q2tWFUAcT8qAHfJssYa7zUK8ikB
	fLo0snl2ebfyUjkxyMqRtyww65GiWBcwd+OiqtiaVo0aZ1B3UPvp4P5pOr/VwxvtRCQ53Px//gQhY
	fZz1O5e5jzAHGUg9a3f/U7d67K9FWJlHGlCvxK58kX3zGTvLNXCyFCndVm4ldRtbpIVQQm39+RP6h
	oSHc42lBPP3WrSANoDJ+Rld49eON0n3X4QX9IwIWoDLC6cd3CyZljp0Qtk6XwyZ1Bv+vmIgnatiqZ
	iqY0JlXUHPDsW83sZwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsZb-001K73-2W;
	Wed, 23 Aug 2023 18:27:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsZY-001K66-0e
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 18:27:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A07CB65001;
	Wed, 23 Aug 2023 18:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4EBC433C7;
	Wed, 23 Aug 2023 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692815234;
	bh=WN9L1KlrQREqfwZPOPGJuWCDtRAjdgEQksUouW9qf9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y/hxvHUoxtBes39p/jN0qliJnRZK9bsMzMPSyB9IzlUpMCqaSXbqonYuSX0KYNSed
	 7ucAHpMo+3h/LoupE//4Dahe+bBhetrQCCBoCd1QOn2T4y0pSH3Zui96QG5PEZHzY4
	 lRyIh392RGpXlHS72s4eQtGxBSaw2K7reeUDguxRTUsk0YEQdUFB+dLtPpk59UBclh
	 UfN01KzI/dKFIBJaYvwE9jMie80LXbq8+Vml4ETXbI9dDKwVBj7OAxK9xh0THqNfmy
	 KEmDdJ7JY37mDg9tqNdgl5TO+YmobL0IBGNa5RL0HaeSiKALbS+hKB0ub5hpE3As19
	 2FEvD0AqxjqcA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Yonghong Song <yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri
 Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xu Kuohai
 <xukuohai@huawei.com>, Puranjay Mohan <puranjay12@gmail.com>, Pu Lehui
 <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next 3/7] riscv, bpf: Support sign-extension mov insns
In-Reply-To: <87pm3dlj80.fsf@all.your.base.are.belong.to.us>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-4-pulehui@huaweicloud.com>
 <87pm3dlj80.fsf@all.your.base.are.belong.to.us>
Date: Wed, 23 Aug 2023 20:27:11 +0200
Message-ID: <87ttspk41s.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_112716_287534_3F18987E 
X-CRM114-Status: UNSURE (   8.58  )
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
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPgo+PiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1
aUBodWF3ZWkuY29tPgo+Pgo+PiBBZGQgc3VwcG9ydCBzaWduLWV4dGVuc2lvbiBtb3YgaW5zdHJ1
Y3Rpb25zIGZvciBSVjY0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBo
dWF3ZWkuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAx
NCArKysrKysrKysrKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29t
cDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+IGluZGV4IGZkMzZjYjE3
MTAxYS4uZDE0OTcxODJjYWNmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4gQEAg
LTEwNDcsNyArMTA0NywxOSBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3RydWN0IGJw
Zl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPj4gIAkJCWVtaXRfemV4
dF8zMihyZCwgY3R4KTsKPj4gIAkJCWJyZWFrOwo+PiAgCQl9Cj4+IC0JCWVtaXRfbXYocmQsIHJz
LCBjdHgpOwo+PiArCQlzd2l0Y2ggKGluc24tPm9mZikgewo+PiArCQljYXNlIDA6Cj4+ICsJCQll
bWl0X212KHJkLCBycywgY3R4KTsKPj4gKwkJCWJyZWFrOwo+PiArCQljYXNlIDg6Cj4+ICsJCWNh
c2UgMTY6Cj4+ICsJCQllbWl0X3NsbGkocnMsIHJzLCA2NCAtIGluc24tPm9mZiwgY3R4KTsKPj4g
KwkJCWVtaXRfc3JhaShyZCwgcnMsIDY0IC0gaW5zbi0+b2ZmLCBjdHgpOwo+Cj4gWW91J3JlIGNs
b2JiZXJpbmcgdGhlIHNvdXJjZSByZWdpc3RlciAocnMpIGhlcmUsIHdoaWNoIGlzIGNvcnJlY3Qu
CgpUb28gcXVpY2shIHMvY29ycmVjdC9pbmNvcnJlY3QvISA6LSkKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
