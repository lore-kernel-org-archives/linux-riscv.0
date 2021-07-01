Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C264FC11F68
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:09:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C57E61418
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C57E61418
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJgSMr6cC6W8VcoIWYXIyHjGMl1oslrl+Xpf7m8sqxM=; b=tlQ+09WVDsiPREWOqd9YSiIpp3
	KbPaWwuEpVjoIWZ9Sq8qaSRBY5YSwpI1vaF8Mh/HEqvDlvx80v52wx/2A06M385t/sc1nui/a3cNQ
	j8yh3ByPP5jlvyI+6e4Zsj/dxvba7wxwO4cm4bV16kXySQAuqaz0crqStWpdmH9gTJPRvJaFOt6vX
	iGdZhH02zzafdT6mkUFDUcuhOlFpy8M23SSojohtYpOGE0nRRxoX3gJs5u1kHKSbWwMlw5UB4sfwg
	IIfTSHD2+JB3QXTZttLrQHy7pt6y3mELhigNFkGymwlE8NfoV9W2J7LODBnJU4ud7iRT/1fDteEgE
	U9h7bIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lym8H-00FrmD-GG; Thu, 01 Jul 2021 02:08:49 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lym8D-00FrlM-VZ
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 02:08:47 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GFhPS3Wgtz76Rf;
 Thu,  1 Jul 2021 10:05:16 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Jul 2021 10:08:38 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Jul 2021 10:08:38 +0800
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
To: Bin Meng <bmeng.cn@gmail.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>, Atish Patra
 <atish.patra@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, stable
 <stable@vger.kernel.org>
References: <20210627135117.28641-1-bmeng.cn@gmail.com>
 <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
 <CAEUhbmV=h3nZ8Aa94_uyjrZ_NGe+9-xAorUMubSPJXu3y60PeQ@mail.gmail.com>
 <aa1f027c-bbc7-92f8-80a6-fe290cd1cdf8@huawei.com>
 <CAEUhbmXeqAsLxm+oCHRPHMZq2mQXPD6fJOFerwp_BRv1kCc7ow@mail.gmail.com>
 <CAEUhbmUvDSocWobb26PcrV6vi6kHjg8o6pNomt9AnGWGbvAuhw@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <94a92009-ce49-bbe4-794c-0631520e4c3d@huawei.com>
Date: Thu, 1 Jul 2021 10:08:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUvDSocWobb26PcrV6vi6kHjg8o6pNomt9AnGWGbvAuhw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_190846_223385_D2BC5CFB 
X-CRM114-Status: GOOD (  18.44  )
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

Ck9uIDIwMjEvNi8zMCAxOTo1OCwgQmluIE1lbmcgd3JvdGU6Cj4gT24gTW9uLCBKdW4gMjgsIDIw
MjEgYXQgMTE6MjEgQU0gQmluIE1lbmcgPGJtZW5nLmNuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE9u
IE1vbiwgSnVuIDI4LCAyMDIxIGF0IDEwOjI4IEFNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndh
bmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT24gMjAyMS82LzI4IDk6MTUsIEJpbiBNZW5n
IHdyb3RlOgo+Pj4+IE9uIE1vbiwgSnVuIDI4LCAyMDIxIGF0IDg6NTMgQU0gS2VmZW5nIFdhbmcg
PHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cm90ZToKPj4+Pj4gSGnvvIwgc29ycnkgZm9y
IHRoZSBtaXN0YWtl77yMdGhlIGJ1ZyBpcyBmaXhlZCBieQo+Pj4+Pgo+Pj4+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIxMDYwMjA4NTUxNy4xMjc0ODEtMi13YW5na2Vm
ZW5nLndhbmdAaHVhd2VpLmNvbS8KPj4+PiBXaGF0IGFyZSB3ZSBvbiB0aGUgcGF0Y2ggeW91IG1l
bnRpb25lZD8KPj4+Pgo+Pj4+IEkgZG9uJ3Qgc2VlIGl0IGFwcGxpZWQgaW4gdGhlIGxpbnV4L21h
c3Rlci4KPj4+Pgo+Pj4+IEFsc28gdGhlcmUgc2hvdWxkIGJlIGEgIkZpeGVzIiB0YWcgYW5kIHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcgY2MnZWQKPj4+PiBiZWNhdXNlIDMyLWJpdCBpcyBicm9rZW4g
c2luY2UgdjUuMTIuCj4+PiBodHRwczovL2tlcm5lbC5nb29nbGVzb3VyY2UuY29tL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eC8rL2M5ODExZTM3OWIyMTFjNjdiYTI5ZmIwOWQ2
ZjY0NGRkNDRjZmNmZjIKPj4+Cj4+PiBpdCdzIG9uIFBhbG1lcicgcmlzY3YtbmV4dC4KPj4gTm90
IHN1cmUgcmlzY3YtbmV4dCBpcyBmb3Igd2hpY2ggcmVsZWFzZT8gVGhpcyBpcyBhIHJlZ3Jlc3Np
b24gYW5kCj4+IHNob3VsZCBiZSBvbiA1LjEzLgo+Pgo+Pj4gSGkgUGFsbWVyLCBzaG91bGQgSSBy
ZXNlbmQgb3IgY291bGQgeW91IGhlbHAgbWUgdG8gYWRkIHRoZSBmaXhlcyB0YWc/Cj4gWW91ciBw
YXRjaCBtaXhlZCAyIHRoaW5ncyAoZml4IHBsdXMgb25lIGZlYXR1cmUpIHRvZ2V0aGVyLCBzbyBp
dCBpcwo+IG5vdCBwcm9wZXIgdG8gYmFjayBwb3J0IHlvdXIgcGF0Y2guCgoibWVtPSIgd2lsbCBj
aGFuZ2UgdGhlIHJhbmdlIG9mIG1lbWJsb2NrLCBzbyB0aGUgZml4IHBhcnQgbXVzdCBiZSBpbmNs
dWRlZC4KCgo+Cj4gSGVyZSBpcyBteSAyIGNlbnRzOgo+Cj4gMS4gRHJvcCB5b3VyIHBhdGNoIGZy
b20gcmlzY3YtbmV4dAo+IDIuIEFwcGx5IG15IHBhdGNoIGFzIGl0IGlzIGEgc2ltcGxlIGZpeCB0
byBwcmV2aW91cyBjb21taXQuIFRoaXMKPiBhbGxvd3Mgc3RhYmxlIGtlcm5lbCB0byBjaGVycnkt
cGljayB0aGUgZml4IHRvIHY1LjEyIGFuZCB2NS4xMy4KPiAzLiBSZWJhc2UgeW91ciBwYXRjaCBh
Z2FpbnN0IG1pbmUsIGFuZCByZXNlbmQgdjIKPgo+IExldCBtZSBrbm93IGlmIHRoaXMgbWFrZXMg
c2Vuc2UuCgpJdCBpcyBub3QgYSBiaWcgcHJvYmxlbSBmb3IgbWUsIGJ1dCBJIGhhdmUgbm8gcmln
aHQgYWJvdXJ0IHJpc2N2LW5leHQsCgpsZXQncyB3YWl0IFBhbG1lcidzIGFkdmlzZS4KCj4KPiBS
ZWdhcmRzLAo+IEJpbgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
