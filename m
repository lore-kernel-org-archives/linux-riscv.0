Return-Path: <SRS0=KDuJ=NA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA248C4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 01:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70C4E60D07
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 01:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70C4E60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLNUV1iitOwZADxncYL1gFw/vnc32Hi9Rn1xoVtNxmQ=; b=sc9eAl6R0fAdOGRH+syM+WkHpF
	tG4C6Q32mveu/pCjBLPqJxiImMBzf/+yvXm0DT4vaPlJcHsQS5OVokv+ysxMusiTQoOOCcxRLBDLG
	ZDuhy5+s6k/mBYMA0iKbcnKENxwhvFuhNayNqg7/P38XbsgMuqzi1ZTLUpL+UDFo9A8jSIdC/EyR2
	JhfKxgxw8hgBEYIV3hynNhmg70lDQsecsRK5j/WmCcArBdMicpxNbDbn2L50MsmroBuJn1zYtM5R0
	D+gheESxA1Dgd1gwgnYPX1J00aka8XbVx8aVA5pGNMnqziKvZ9OWrKaNKZ33zwQTQzZd9SqRmEI1n
	yStlPM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCuWI-00GuSf-AN; Mon, 09 Aug 2021 01:56:02 +0000
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCuWG-00GuRP-5s
 for linux-riscv@lists.infradead.org; Mon, 09 Aug 2021 01:56:01 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R421e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UiL9Iwy_1628474143; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0UiL9Iwy_1628474143) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 09 Aug 2021 09:55:44 +0800
Subject: Re: [PATCH] riscv: add ARCH_DMA_MINALIGN support
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, arnd@arndb.de
References: <20210807145537.124744-1-xianting.tian@linux.alibaba.com>
 <20210809003044.6692ddce@xhacker>
From: Xianting TIan <xianting.tian@linux.alibaba.com>
Message-ID: <6a189d9d-b35d-3a15-5bfa-172c50e60c8c@linux.alibaba.com>
Date: Mon, 9 Aug 2021 09:55:43 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210809003044.6692ddce@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_185600_404548_3D81982D 
X-CRM114-Status: GOOD (  14.25  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CuWcqCAyMDIxLzgvOSDkuIrljYgxMjozMCwgSmlzaGVuZyBaaGFuZyDlhpnpgZM6Cj4gT24gU2F0
LCAgNyBBdWcgMjAyMSAyMjo1NTozNyArMDgwMAo+IFhpYW50aW5nIFRpYW4gPHhpYW50aW5nLnRp
YW5AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4+IEludHJvZHVjZSBBUkNIX0RNQV9NSU5B
TElHTiB0byByaXNjdiBhcmNoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFudGluZyBUaWFuIDx4
aWFudGluZy50aWFuQGxpbnV4LmFsaWJhYmEuY29tPgo+PiAtLS0KPj4gICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2NhY2hlLmggfCAyICsrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZS5oCj4+IGluZGV4IDliNThiMTA0NS4uMjk0NWJi
ZTJiIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlLmgKPj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZS5oCj4+IEBAIC0xMSw2ICsxMSw4IEBACj4+
ICAgCj4+ICAgI2RlZmluZSBMMV9DQUNIRV9CWVRFUwkJKDEgPDwgTDFfQ0FDSEVfU0hJRlQpCj4+
ICAgCj4+ICsjZGVmaW5lIEFSQ0hfRE1BX01JTkFMSUdOCUwxX0NBQ0hFX0JZVEVTCj4gSXQncyBu
b3QgYSBnb29kIGlkZWEgdG8gYmxpbmRseSBzZXQgdGhpcyBmb3IgYWxsIHJpc2N2LiBGb3IgImNv
aGVyZW50Igo+IHBsYXRmb3JtcywgdGhpcyBpcyBub3QgbmVjZXNzYXJ5IGFuZCB3aWxsIHdhc3Rl
IG1lbW9yeS4KPgp0aGFua3MgZm9yIHRoZSByZXBseSwKClNvIHJpc2N2IGlzIHRoZSAiY29oZXJl
bnQiIHBsYXRmb3JtPwoKSSBzdWJtaXQgdGhpcyBwYXRjaCBhcyBJIGdvdCBhIGZpeCBzdWdnZXN0
aW9uIG9mIGFub3RoZXIgcGF0Y2ggdG8gdXNlIApBUkNIX0RNQV9NSU5BTElHTiwgYnV0IHJpc2N2
IGRvZXNuJ3QgZGVmaW5lIGl0LgoKaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvOC82LzcyMyA8
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvOC82LzcyMz4KCkNvbnNpZGVyaW5nIHRoZSBwb3J0
YWJpbGl0eSBvZiB0aGUgY29kZSwgaW4gbXkgb3BpbmlvbiwgaXQgaXMgYmV0dGVyIHRvIApkZWZp
bmUgaXQgZm9yIHJpc2N2IGlmIGl0IGlzIG5vdCAiY29oZXJlbnQiIHBsYXRmb3JtLgoKPj4gKwo+
PiAgIC8qCj4+ICAgICogUklTQy1WIHJlcXVpcmVzIHRoZSBzdGFjayBwb2ludGVyIHRvIGJlIDE2
LWJ5dGUgYWxpZ25lZCwgc28gZW5zdXJlIHRoYXQKPj4gICAgKiB0aGUgZmxhdCBsb2FkZXIgYWxp
Z25zIGl0IGFjY29yZGluZ2x5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
