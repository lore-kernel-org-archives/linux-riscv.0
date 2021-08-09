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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B153C4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 06:20:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FCC16101D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 06:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FCC16101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rs4JTqck3LHU4WeYVDcXVPyeaa3UfPdJjkvYP6XlN3U=; b=3Lpbuvm8Egb3GDr4PhToQHW2Iy
	ext+uEuqh9bLCwa//R/+52UEGe+NglgTn+1ilZ2tFa0Q//giGGmj7Q/1QHzntMw5rzPzVaAujqETT
	fMIJM1lclQ1VjLIwjOqcQog2MgSuEXszdRhCOuBcPaQ7iatM3tvDXoGbiju4lvRE2ILqu/H11hs4N
	dsuxt4/2urDwO45tPDRXJlURcot/QvgS/ilb8LptCFGpG46EZftQZls5yz+jVdbjnQQhXlVf9rind
	agSJ7r61ilLdeqoEIMyw7cgy+HHei3oDjnfd5TE50r4zwbu3W2Smg+zi/tisbJNFkmgMgue1R3cOv
	4dbR3lyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCydv-00HFKE-R8; Mon, 09 Aug 2021 06:20:11 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCydt-00HFJV-4a
 for linux-riscv@lists.infradead.org; Mon, 09 Aug 2021 06:20:10 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R471e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0UiMSubG_1628490005; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0UiMSubG_1628490005) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 09 Aug 2021 14:20:05 +0800
Subject: Re: [PATCH] riscv: add ARCH_DMA_MINALIGN support
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210807145537.124744-1-xianting.tian@linux.alibaba.com>
 <20210809003044.6692ddce@xhacker>
From: Xianting TIan <xianting.tian@linux.alibaba.com>
Message-ID: <c09fc86d-1e6a-3315-7489-9e269935ba55@linux.alibaba.com>
Date: Mon, 9 Aug 2021 14:20:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210809003044.6692ddce@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_232009_407244_644CF4E7 
X-CRM114-Status: GOOD (  13.70  )
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
IG1lbW9yeS4KCkkgY2hlY2tlZCBBUkNIX0RNQV9NSU5BTElHTiBkZWZpbml0aW9uLMKgICJJZiBh
biBhcmNoaXRlY3R1cmUgaXNuJ3QgZnVsbHkgCkRNQS1jb2hlcmVudCwgQVJDSF9ETUFfTUlOQUxJ
R04gbXVzdCBiZSBzZXQiLgoKc28gdGhhdCB0aGUgbWVtb3J5IGFsbG9jYXRvciBtYWtlcyBzdXJl
IHRoYXQga21hbGxvYydlZCBidWZmZXIgZG9lc24ndCAKc2hhcmUgYSBjYWNoZSBsaW5lIHdpdGgg
dGhlIG90aGVycy4KCkRvY3VtZW50YXRpb24vY29yZS1hcGkvZG1hLWFwaS1ob3d0by5yc3QKCjIp
IEFSQ0hfRE1BX01JTkFMSUdOCgogwqDCoCBBcmNoaXRlY3R1cmVzIG11c3QgZW5zdXJlIHRoYXQg
a21hbGxvYydlZCBidWZmZXIgaXMKIMKgwqAgRE1BLXNhZmUuIERyaXZlcnMgYW5kIHN1YnN5c3Rl
bXMgZGVwZW5kIG9uIGl0LiBJZiBhbiBhcmNoaXRlY3R1cmUKIMKgwqAgaXNuJ3QgZnVsbHkgRE1B
LWNvaGVyZW50IChpLmUuIGhhcmR3YXJlIGRvZXNuJ3QgZW5zdXJlIHRoYXQgZGF0YSBpbgogwqDC
oCB0aGUgQ1BVIGNhY2hlIGlzIGlkZW50aWNhbCB0byBkYXRhIGluIG1haW4gbWVtb3J5KSwKIMKg
wqAgQVJDSF9ETUFfTUlOQUxJR04gbXVzdCBiZSBzZXQgc28gdGhhdCB0aGUgbWVtb3J5IGFsbG9j
YXRvcgogwqDCoCBtYWtlcyBzdXJlIHRoYXQga21hbGxvYydlZCBidWZmZXIgZG9lc24ndCBzaGFy
ZSBhIGNhY2hlIGxpbmUgd2l0aAogwqDCoCB0aGUgb3RoZXJzLiBTZWUgYXJjaC9hcm0vaW5jbHVk
ZS9hc20vY2FjaGUuaCBhcyBhbiBleGFtcGxlLgoKIMKgwqAgTm90ZSB0aGF0IEFSQ0hfRE1BX01J
TkFMSUdOIGlzIGFib3V0IERNQSBtZW1vcnkgYWxpZ25tZW50CiDCoMKgIGNvbnN0cmFpbnRzLiBZ
b3UgZG9uJ3QgbmVlZCB0byB3b3JyeSBhYm91dCB0aGUgYXJjaGl0ZWN0dXJlIGRhdGEKIMKgwqAg
YWxpZ25tZW50IGNvbnN0cmFpbnRzIChlLmcuIHRoZSBhbGlnbm1lbnQgY29uc3RyYWludHMgYWJv
dXQgNjQtYml0CiDCoMKgIG9iamVjdHMpLgoKPgo+PiArCj4+ICAgLyoKPj4gICAgKiBSSVNDLVYg
cmVxdWlyZXMgdGhlIHN0YWNrIHBvaW50ZXIgdG8gYmUgMTYtYnl0ZSBhbGlnbmVkLCBzbyBlbnN1
cmUgdGhhdAo+PiAgICAqIHRoZSBmbGF0IGxvYWRlciBhbGlnbnMgaXQgYWNjb3JkaW5nbHkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
