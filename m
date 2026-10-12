Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF2CCA9EC5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Cc:Date:Subject:Message-Id:
	References:In-Reply-To:Mime-Version:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2A2RbS3SOYEwpNPn5QojCa4JcYl4sb9F81iDVZUQT54=; b=OZOV1Uc1m3fsHBdB2UPHgrsiz5
	vchqpPxo/acrRGKboLNn6KVH/t/sG8g/Tz45p8+Z+duCiLc81N8DTJBTX6cb0oVg7EDOR7rTfuKSH
	arR8GX60O1qlnMiT6phXZoVQfiFgbbEGvUY5WJxTL9Tg44n2A71oavchT40zuAi9LCFn+QS5dHL7u
	yL0vThCUrXkoM43mMhX11pTcCdA5RZS7WEq5E4jxBmlFIwccxEkaJqtJyl4ptbdzaMKiyjmBX0GQX
	Mbrn2RKfY8+BMuwUhrlnhtT1hoGLwpqwc1IdUdNDQlGrGsCgXSfkifemd0r2K19RSmFnyxm+amz9r
	6Kw/ASvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAfA-00000009rW1-3A6Q;
	Mon, 12 Oct 2026 07:41:37 +0000
Received: from va-2-29.ptr.blmpb.com ([209.127.231.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAf8-00000009rV6-2uBH
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 07:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1791790889; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zmEh4cTAxa7xgsge4k/LVo6mx9qvDtVNKZ1PhKVMXvg=;
 b=BbdxnSa61GpXQ8yN9rzHgGcEvFla5HONAZm6BjcYD9wndF9CW1pIGLB0YhUXCXw8S0Y0GL
 HBVKZdG9HREnmbX8nBHrz36pV7eSts/fdomqDYAeVzwRv4teqjE7S51uEfCo/L/Bz/yCJQ
 QcRV14qL1pT8dPyD979s7dLH6Z106HzKIxi2O1pW0+PQ6OO9FcBJqLmGepzEeyIkR7OHEH
 +Mekqlp5SVpnI+2c2cpnFiJfPuJrYkTKqtgIV1dZ+H4+PMoK1YCemevAG2LQSYlk0reKuD
 ToZ+IjPK1dsJNbKUSH9DSSdTmW1ggBVgN7zbJhTdZWPAX8cTeOMnVdxrR0FUDQ==
To: "yunhui cui" <cuiyunhui@bytedance.com>
Mime-Version: 1.0
In-Reply-To: <CAEEQ3wmDTJfbgScq=XC2GO+Coz=bpzXu9TUO1Hf87sE279g6+w@mail.gmail.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26acc8f27+cff2e4+lists.infradead.org+yang.yicong@picoheart.com>
References: <20260915083305.81913-1-yang.yicong@picoheart.com> <96d80aaf-5cf3-424e-848b-a98f97e94f92@picoheart.com> <CAEEQ3wmDTJfbgScq=XC2GO+Coz=bpzXu9TUO1Hf87sE279g6+w@mail.gmail.com>
Message-Id: <3725326c-1cd8-4e96-b729-d731896c1b8e@picoheart.com>
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH v4 0/5] Add workarounds for Picoheart erratas
Date: Mon, 12 Oct 2026 15:41:24 +0800
Received: from [10.192.33.16] ([210.22.96.226]) by smtp.feishu.cn with ESMTPS; Mon, 12 Oct 2026 15:41:26 +0800
Content-Language: en-US
Cc: <yang.yicong@picoheart.com>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_004134_921368_11E51D58 
X-CRM114-Status: UNSURE (   8.75  )
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

T24gMTAvMTIvMjYgMzoxMCBQTSwgeXVuaHVpIGN1aSB3cm90ZToKPiBIaSBZaWNvbmcsCj4gCj4g
T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMjo0MuKAr1BNIFlpY29uZyBZYW5nIDx5YW5nLnlpY29u
Z0BwaWNvaGVhcnQuY29tPiB3cm90ZToKPj4KPj4gYSBnZW50bGUgcGluZyBmb3IgdGhpcyBwYXRj
aHNldC4uLgo+Pgo+PiB0aGFua3MuCj4gCj4gICBUaGFua3MgZm9yIHRoZSBzZXJpZXMuIFR3byBp
c3N1ZXMgZm91bmQgaW4gdjQ6Cj4gCj4gICAxLiBUaGUgQ0JPIGVycmF0dW0gdXNlcyBNTVUtb25s
eSB1YWNjZXNzIGhlbHBlcnMsIHNvIHRoZSBOT01NVSBidWlsZAo+ICAgICAgY3VycmVudGx5IGZh
aWxzLiBDb3VsZCBFUlJBVEFfUElDT0hFQVJUX0NCT19DTEVBTiBkZXBlbmQgb24gTU1VPwo+ICAg
ICAgVXNpbmcgdW5zaWduZWQgbG9uZyBmb3IgYWRkciB3b3VsZCBhbHNvIGF2b2lkIHRoZSBSVjMy
IHdhcm5pbmcuCgp0aGFua3MgZm9yIGNhdGNoaW5nLiB3aWxsIG1ha2UgaXQgZGVwZW5kIG9uIE1N
VSBhbmQgdXNlIHVuc2lnbmVkIGxvbmcgZm9yIGFkZHIuCgo+IAo+ICAgMi4gU1JfTVhSIHJlbWFp
bnMgZW5hYmxlZCBhY3Jvc3MgZ2V0X3VzZXIoKSwgd2hvc2UgbWlnaHRfZmF1bHQoKSBtYXkKPiAg
ICAgIHNjaGVkdWxlLiBXb3VsZCBpdCBiZSBzYWZlciB0byBwcmVwYXJlIGZvciB0aGUgZmF1bHQg
Zmlyc3QsIHRoZW4gdXNlCj4gICAgICBfX2dldF91c2VyKCkgd2l0aCBNWFIgZW5hYmxlZCBhbmQg
cmVzdG9yZSB0aGUgb3JpZ2luYWwgTVhSIHN0YXRlPwo+IAoKdGhlIE1YUiBpcyBzYXZlZC9yZXN0
b3JlZCBkdXJpbmcgY29udGV4dCBzd2l0Y2ggaW4gX19zd2l0Y2hfdG8oKSwgYWxvbmcgd2l0aAp0
aGUgU1JfU1VNLiBzbyB0aGUgc2NoZWR1bGluZyB3b24ndCBiZSBhIHByb2JsZW0uIGRvIEkgbWlz
cyBzb21ld2hlcmU/Cgp0aGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
