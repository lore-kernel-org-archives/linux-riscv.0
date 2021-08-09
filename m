Return-Path: <SRS0=KDuJ=NA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84C2C4320A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 09:01:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6403861056
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 09:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6403861056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRrThPG1xVaI7w+R29yjXvtLo5/6q2CwH+HkCvqFpIQ=; b=xCRhAVaVgGO7dFwHOSF+mw3ubC
	SUID4EonsTNo5Ehrcp1Sn9eXrsl+Vi7torn04ox6sAOiGexGI5m42N6gvXIO2O9mXIgbWB8EG4KPw
	32YIDIAAOsZxRMOgcHh5/PuAFoUHf8bi/ZInRyCocZfiMz6/j7qGsZeXnNrsSv/KoEgzRf/jXsZ9X
	ZgwZcj6p+kUJGzfwE0OaD5LwC3mVnsZ4qp9Cw+570mC4Y9pHHDuPDghyDhi1sENHhBoeS0eH3pgv6
	KV7dpJoanbegUCct3v3ofKgLU/VJjNBKIPHuTUSmFmjWxM6jShUhCd+CLVgqWVyETl8BWd6x9X1/M
	RGHfjcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD19H-00HX80-Ue; Mon, 09 Aug 2021 09:00:43 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD19E-00HX6h-RL
 for linux-riscv@lists.infradead.org; Mon, 09 Aug 2021 09:00:42 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0UiPJFgZ_1628499636; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0UiPJFgZ_1628499636) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 09 Aug 2021 17:00:37 +0800
Subject: Re: [PATCH] riscv: add ARCH_DMA_MINALIGN support
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210807145537.124744-1-xianting.tian@linux.alibaba.com>
 <20210809003044.6692ddce@xhacker>
 <c09fc86d-1e6a-3315-7489-9e269935ba55@linux.alibaba.com>
 <CAK8P3a1wyhLp1hUUotzwqc1pyCyfWhO7O_pvt5O_U=qZp-ZhnA@mail.gmail.com>
From: Xianting TIan <xianting.tian@linux.alibaba.com>
Message-ID: <5b7bfc3f-4fe8-bd7e-561b-0f99cf1df9b0@linux.alibaba.com>
Date: Mon, 9 Aug 2021 17:00:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1wyhLp1hUUotzwqc1pyCyfWhO7O_pvt5O_U=qZp-ZhnA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_020041_137450_BBA7A2BE 
X-CRM114-Status: GOOD (  22.96  )
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

CuWcqCAyMDIxLzgvOSDkuIvljYgzOjQ5LCBBcm5kIEJlcmdtYW5uIOWGmemBkzoKPiBPbiBNb24s
IEF1ZyA5LCAyMDIxIGF0IDg6MjAgQU0gWGlhbnRpbmcgVElhbgo+IDx4aWFudGluZy50aWFuQGxp
bnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPj4+PiArI2RlZmluZSBBUkNIX0RNQV9NSU5BTElHTiAg
IEwxX0NBQ0hFX0JZVEVTCj4+PiBJdCdzIG5vdCBhIGdvb2QgaWRlYSB0byBibGluZGx5IHNldCB0
aGlzIGZvciBhbGwgcmlzY3YuIEZvciAiY29oZXJlbnQiCj4+PiBwbGF0Zm9ybXMsIHRoaXMgaXMg
bm90IG5lY2Vzc2FyeSBhbmQgd2lsbCB3YXN0ZSBtZW1vcnkuCj4+IEkgY2hlY2tlZCBBUkNIX0RN
QV9NSU5BTElHTiBkZWZpbml0aW9uLCAgIklmIGFuIGFyY2hpdGVjdHVyZSBpc24ndCBmdWxseQo+
PiBETUEtY29oZXJlbnQsIEFSQ0hfRE1BX01JTkFMSUdOIG11c3QgYmUgc2V0Ii4KPj4KPj4gc28g
dGhhdCB0aGUgbWVtb3J5IGFsbG9jYXRvciBtYWtlcyBzdXJlIHRoYXQga21hbGxvYydlZCBidWZm
ZXIgZG9lc24ndAo+PiBzaGFyZSBhIGNhY2hlIGxpbmUgd2l0aCB0aGUgb3RoZXJzLgo+Pgo+PiBE
b2N1bWVudGF0aW9uL2NvcmUtYXBpL2RtYS1hcGktaG93dG8ucnN0Cj4+Cj4+IDIpIEFSQ0hfRE1B
X01JTkFMSUdOCj4+Cj4+ICAgICAgQXJjaGl0ZWN0dXJlcyBtdXN0IGVuc3VyZSB0aGF0IGttYWxs
b2MnZWQgYnVmZmVyIGlzCj4+ICAgICAgRE1BLXNhZmUuIERyaXZlcnMgYW5kIHN1YnN5c3RlbXMg
ZGVwZW5kIG9uIGl0LiBJZiBhbiBhcmNoaXRlY3R1cmUKPj4gICAgICBpc24ndCBmdWxseSBETUEt
Y29oZXJlbnQgKGkuZS4gaGFyZHdhcmUgZG9lc24ndCBlbnN1cmUgdGhhdCBkYXRhIGluCj4+ICAg
ICAgdGhlIENQVSBjYWNoZSBpcyBpZGVudGljYWwgdG8gZGF0YSBpbiBtYWluIG1lbW9yeSksCj4+
ICAgICAgQVJDSF9ETUFfTUlOQUxJR04gbXVzdCBiZSBzZXQgc28gdGhhdCB0aGUgbWVtb3J5IGFs
bG9jYXRvcgo+PiAgICAgIG1ha2VzIHN1cmUgdGhhdCBrbWFsbG9jJ2VkIGJ1ZmZlciBkb2Vzbid0
IHNoYXJlIGEgY2FjaGUgbGluZSB3aXRoCj4+ICAgICAgdGhlIG90aGVycy4gU2VlIGFyY2gvYXJt
L2luY2x1ZGUvYXNtL2NhY2hlLmggYXMgYW4gZXhhbXBsZS4KPj4KPj4gICAgICBOb3RlIHRoYXQg
QVJDSF9ETUFfTUlOQUxJR04gaXMgYWJvdXQgRE1BIG1lbW9yeSBhbGlnbm1lbnQKPj4gICAgICBj
b25zdHJhaW50cy4gWW91IGRvbid0IG5lZWQgdG8gd29ycnkgYWJvdXQgdGhlIGFyY2hpdGVjdHVy
ZSBkYXRhCj4+ICAgICAgYWxpZ25tZW50IGNvbnN0cmFpbnRzIChlLmcuIHRoZSBhbGlnbm1lbnQg
Y29uc3RyYWludHMgYWJvdXQgNjQtYml0Cj4+ICAgICAgb2JqZWN0cykuCj4gVGhlIHBsYXRmb3Jt
IHNwZWMgWzFdIHNheXMgYWJvdXQgdGhpczoKPgo+IHwgTWVtb3J5IGFjY2Vzc2VzIGJ5IEkvTyBt
YXN0ZXJzIGNhbiBiZSBjb2hlcmVudCBvciBub24tY29oZXJlbnQKPiB8IHdpdGggcmVzcGVjdCB0
byBhbGwgaGFydC1yZWxhdGVkIGNhY2hlcy4KPgo+IFNvIHRoZSBrZXJuZWwgaW4gaXRzIGRlZmF1
bHQgY29uZmlndXJhdGlvbiBjYW4gbm90IGFzc3VtZSB0aGF0IERNQSBpcwo+IGNhY2hlIGNvaGVy
ZW50IG9uIFJJU0MtVi4gTWFraW5nIHRoaXMgY29uZmlndXJhYmxlIGltcGxpZXMgdGhhdAo+IGEg
a2VybmVsIHRoYXQgaXMgY29uZmlndXJlZCBmb3IgY2FjaGUtY29oZXJlbnQgbWFjaGluZXMgY2Fu
IG5vIGxvbmdlcgo+IHJ1biBvbiBhbGwgaGFyZHdhcmUgdGhhdCBmb2xsb3dzIHRoZSBwbGF0Zm9y
bSBzcGVjLgo+Cj4gV2UgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtIG9uIGFybTY0LCB3aGVyZSBtb3N0
IG9mIHRoZSBzZXJ2ZXIgcGFydHMKPiBhcmUgY2FjaGUgY29oZXJlbnQsIGJ1dCB0aGUgbWFqb3Jp
dHkgb2YgdGhlIGxvdy1lbmQgZW1iZWRkZWQgZGV2aWNlcwo+IGFyZSBub3QsIGFuZCB3ZSByZXF1
aXJlIHRoYXQgYSBzaW5nbGUga2VybmVsIHJhbiBydW4gb24gYWxsIG9mIHRoZSBhYm92ZS4KPgo+
IE9uZSBpZGVhIHRoYXQgd2UgaGF2ZSBkaXNjdXNzZWQgc2V2ZXJhbCB0aW1lcyBpcyB0byBzdGFy
dCB0aGUga2VybmVsCj4gd2l0aG91dCB0aGUgc21hbGwga21hbGxvYyBjYWNoZXMgYW5kIGRlZmVy
IHRoZWlyIGNyZWF0aW9uIHVudGlsIGEKPiBsYXRlciBwb2ludCBpbiB0aGUgYm9vdCBwcm9jZXNz
IGFmdGVyIGRldGVybWluaW5nIHdoZXRoZXIgYW55Cj4gbm9uLWNvaGVyZW50IGRldmljZXMgaGF2
ZSBiZWVuIGRpc2NvdmVyZWQuIEFueSBpbi1rZXJuZWwgc3RydWN0dXJlcwo+IHRoYXQgaGF2ZSBh
biBleHBsaWNpdCBBUkNIX0RNQV9NSU5BTElHTiBhbGlnbm1lbnQgd29uJ3QKPiBiZW5lZml0IGZy
b20gdGhpcywgYnV0IGFueSBzdWJzZXF1ZW50IGttYWxsb2MoKSBjYWxscyBjYW4gdXNlIHRoZQo+
IHNtYWxsZXIgY2FjaGVzLiBUaGUgdHJpY2t5IGJpdCBpcyBmaW5kaW5nIG91dCB3aGV0aGVyIC9l
dmVyeXRoaW5nLyBvbgo+IHRoZSBzeXN0ZW0gaXMgY2FjaGUtY29oZXJlbnQgb3Igbm90LCBzaW5j
ZSB3ZSBkbyBub3QgaGF2ZSBhIGdsb2JhbAo+IGZsYWcgZm9yIHRoYXQgaW4gdGhlIERULiBTZWUg
WzJdIGZvciBhIHJlY2VudCBkaXNjdXNzaW9uLgo+Cj4gICAgICAgICBBcm5kCj4KPiBbMV0gaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXBsYXRmb3JtLXNwZWNzL2Jsb2IvbWFpbi9yaXNj
di1wbGF0Zm9ybS1zcGVjLmFkb2MjYXJjaGl0ZWN0dXJlCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMTA1MjcxMjQzNTYuMjIzNjctMS13aWxsQGtlcm5l
bC5vcmcvCkFybmQsIHRoYW5rcyBmb3IgaW5mbyzCoCBhY2NvcmRpbmcgdG8gdGhlIGRlc2NyaXB0
aW9uLCBzZWVtcyB3ZSBuZWVkIHRvIAphcHBseSB0aGlzIHBhdGNoIHRvIHJpc2N2LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
