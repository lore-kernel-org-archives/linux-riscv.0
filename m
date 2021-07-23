Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF3C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 06:50:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6094860ED7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 06:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6094860ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeieasNq2G7Sh7JzQd/gw8PvWPG7G3KktNU9Nw+AUoc=; b=B4Im41T4tXdZarRkZlCdHN1g9M
	gtpzck9Jr9+vWrLEBWdgheft0NAb36Xir/Wdqh9f/gwtBEvhz9f7NPOXQoDugjM6mkbf2vOWTN+2C
	Q45CsTd5w3JSL9BkXPBQex3xkHZbwhOH8amqia147rw51kLdEIjwP7NnnZJtAE14UB1N3k178xueP
	AIbdci+BV9CsrqErP7ZfyM6atPFgn/QzvXQXrl6crIE3Vxl6LMPx/GHXBmxSPsIi7NVmRQF1veLIH
	Pycl7MhBy8JWG7gcPK9ze5xQsRusE5dc3b/wkBdnbVNWWD9CsknESou0tw0AuZzzFLr8QPiRfB6hX
	Yi98QWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6p0D-003bRO-Mi; Fri, 23 Jul 2021 06:49:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6p0A-003bQ9-PC
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 06:49:45 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GWKbW3WJTzZs01;
 Fri, 23 Jul 2021 14:46:15 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 14:49:39 +0800
Received: from [10.174.177.250] (10.174.177.250) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 14:49:39 +0800
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
References: <87bl6yrcmd.fsf@igel.home>
 <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
 <CAOnJCU+Ss0cO1mqr=GDVnpxV075uR+KipSnr7dN93099dAH+vQ@mail.gmail.com>
 <20210722213724.1f12a0e7@xhacker> <87zguexslf.fsf@igel.home>
 <20210723075432.098634a2@xhacker>
 <52e3626a-2b40-bda6-de0e-68ea12a86dd9@huawei.com>
 <20210723122925.67a14562@xhacker> <20210723124025.669cb4ec@xhacker>
CC: Andreas Schwab <schwab@linux-m68k.org>, Atish Patra
 <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <7775c6bd-dc55-bb0b-10d9-cde5099b149a@huawei.com>
Date: Fri, 23 Jul 2021 14:49:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210723124025.669cb4ec@xhacker>
X-Originating-IP: [10.174.177.250]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_234943_334382_B7531363 
X-CRM114-Status: GOOD (  13.77  )
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

CgpPbiAyMDIxLzcvMjMgMTI6NDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gT24gRnJpLCAyMyBK
dWwgMjAyMSAxMjoyOToyNSArMDgwMAo+IEppc2hlbmcgWmhhbmcgPGpzemhhbmczQG1haWwudXN0
Yy5lZHUuY24+IHdyb3RlOgo+Cj4+IE9uIEZyaSwgMjMgSnVsIDIwMjEgMDk6MzY6NDcgKzA4MDAK
Pj4gdG9uZ3RpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+IHdyb3RlOgo+Pgo+Pj4gT24g
MjAyMS83LzIzIDc6NTQsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4+Pj4gT24gVGh1LCAyMiBKdWwg
MjAyMSAxNzo0Mjo1MiArMDIwMAo+Pj4+IEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAbGludXgtbTY4
ay5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4+IE9uIEp1bCAyMiAyMDIxLCBKaXNoZW5nIFpoYW5nIHdy
b3RlOgo+Pj4+Pgo+Pj4+Pj4gSSB0aGluayB3ZSBuZWVkIHRvIHBpbiB0aGUgc3RhY2sgYmVmb3Jl
IGNhbGxpbmcgZ2V0X3djaGFuKCksIGNvdWxkIHlvdSBwbGVhc2UKPj4+Pj4+IHRyeSBiZWxvdyBw
YXRjaD8KPj4+Pj4KPj4+Pj4gVGhhbmtzLCB0aGlzIGZpeGVzIHRoZSBjcmFzaCBmb3IgbWUuCj4+
Pj4+Cj4+Pj4+IEFuZHJlYXMuCj4+Pj4+Cj4+Pj4KPj4+PiBUaGFua3MgZm9yIHRlc3RpbmcuIEkg
d2lsbCBzZW5kIG91dCBmb3JtYWwgcGF0Y2ggbGF0ZXIKPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4+Cj4+
Pj4gLgo+Pj4+Cj4+Pgo+Pj4gSGkgYWxsOgo+Pj4gSSB0cmllZCB0byByZXByb2R1Y2VkIHRoaXMg
Y3Jhc2ggaW4gb3BlblNVU0UgY29kZSByZXBv77yICj4+PiBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnN1c2Uva2VybmVsIO+8iSwgYnV0IG5vdCByZXByb2R1Y2VkIHN1Y2Nlc3NmdWxseS4KPj4+Cj4+
PiAgRnJvbSB0aGUgcGF0Y2ggb2YgcHJvYmxlbSByZXBhaXIsIHRoZSBjcmFzaCBpcyBkdWUgdG8g
dGFzay0+c3RhY2sgaXMKPj4+IHJlbGVhc2VkIGJlZm9yZSBjYWxsaW5nIGdldF93Y2hhbiwgdGhl
IHRhc2sgc3RhdGUgb2YgbWF5YmUgVEFTS19ERUFELgo+Pj4KPj4+IFZNQVBfU1RBQ0sgaXMgdXNl
ZCB0byBkZXRlY3Qga2VybmVsIHN0YWNrIG92ZXJmbG93LCB0aGVyZSBpcyBubwo+Pj4gY29ubmVj
dGlvbiBiZXR3ZWVuIHRoZSB0d28sIGl0IG1ha2VzIG1lIGEgbGl0dGxlIGNvbmZ1c2VkLgo+Pgo+
PiBJIGJlbGlldmUgdGhlIGJ1ZyBleGlzdHMgZnJvbSB0aGUgZmlyc3QgZGF5IG9mIHJpc2N2IG1h
aW5saW5lZC4KPj4KPj4gU2luY2UgVEhSRUFEX0lORk9fSU5fVEFTSz15IGluIHJpc2N2LCBzbyB3
aGVuIHRhc2sgc3RhY2sgY2FuIGJlIGZyZWVkCj4+IGJlZm9yZSBiZWluZyBkZXN0cm95ZWQuCj4K
PiB0eXBvOiB0YXNrIHN0YWNrIGNhbiBiZSBmcmVlZCBiZWZvcmUgdGFzayBpcyBkZXN0cm95ZWQK
Pgo+Pgo+PiBXaGVuIFZNQVBfU1RBQ0s9biwgdGFzaydzIHN0YWNrIGlzIGFsbG9jYXRlZCBmcm9t
IGxpbmVhciBtYXBwaW5nLiBXaGVuCj4+IHRhc2sgc3RhY2sgaXMgZnJlZWQsIHRoZSBjb3JyZXNw
b25kaW5nIG1hcHBpbmcgc3RpbGwgZXhpc3RzLCBhbmQgc2luY2UKPj4gZ2V0X3djaGFuKCkgb25s
eSByZWFkLCBubyBoYXJtIGlzIG9ic2VydmVkIHNvIGZhci4KPj4KPj4gV2hlbiBWTUFQX1NUQUNL
PXksIHRhc2sncyBzdGFjayBpcyBhbGxvY2F0ZWQgZnJvbSB2bWFsbG9jIGFyZWEuIFdoZW4KPj4g
dGFzayBzdGFjayBpcyBmcmVlZCwgdGhlIGNvcnJlc3BvbmRpbmcgbWFwcGluZyBtYXkgbm90IGV4
aXN0LCBzbyBJIGV4cGVjdAo+PiBNTVUgZmF1bHQgaGVyZSwgdGh1cyB0aGUga2VybmVsIHBhbmlj
Lgo+Pgo+PiBJbiBzdW1tYXJ5LCB0aGUgYnVnIGlzbid0IHJlbGF0ZWQgd2l0aCBWTUFQX1NUQUNL
LCBidXQgVk1BUF9TVEFDSyBtYWtlcwo+PiB0aGUgYnVnIG9ic2VydmFibGUuCj4+Cj4+IFRoYW5r
cwoKVGhpcyBleHBsYW5hdGlvbiBpcyB1bmRlcnN0YW5kYWJsZSwgaXQgaXMgbmVjZXNzYXJ5IHRv
IHBlcmZvcm0gYSBzdGFjayAKdmFsaWRpdHkgY2hlY2sgYmVmb3JlIHdhbGtfc3RhY2tmcmFtZS4K
ClRoYW5rcwoKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo+Cj4KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
