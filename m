Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7465CC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 05:45:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CED6239EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 05:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CED6239EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yg9t3DhSFuT0Nb+4hYNkpW6pCBOD0e/aPgAqkp1TMOs=; b=LzlauuPuXnsviU8Ls7yTylr66
	vPLL2lTpYYqu5agiyeb/pkULHYOVzx17RZI/pachPsIoZLu4NimYsohCpXsx/kLaSBnFtaKUtj42g
	86ndXTI4O9T8qZTteDOnMBJ9UB39MdXU0SnRNB0BOmHDOaLO9LQNRwXDegQapgsj6FibPb5Yt5MZ8
	ovqTIFT37s4FEBp2sKx0NkR9ioqTlexDhSM/pKLolkfARi2PClvEbkeHOdto42r+E7Qdsu97mC+69
	YunTaz9LxedwBIbOgu2N4NJfc/SmCjyIz2XJOFhUZHWfjA64HysP1CZYIS+ZL4iEnnFoxijbIxcq6
	qrDoKQkAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Huq-0003AF-Oq; Fri, 15 Jan 2021 05:44:56 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Hum-00038D-Fy; Fri, 15 Jan 2021 05:44:53 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DH98s0gH1zj4lX;
 Fri, 15 Jan 2021 13:43:57 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 13:44:42 +0800
Subject: Re: [PATCH v2] initramfs: Provide a common initrd reserve function
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-68a3f8a1-02f5-4487-ae17-fc06c81f072c@penguin>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <6ad30931-85a1-37a1-ce80-9a8752ebb22a@huawei.com>
Date: Fri, 15 Jan 2021 13:44:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-68a3f8a1-02f5-4487-ae17-fc06c81f072c@penguin>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_004452_794057_BC62A952 
X-CRM114-Status: GOOD (  14.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Atish Patra <Atish.Patra@wdc.com>, guoren@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjEvMS8xNSAxMDozMywgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gV2VkLCAxMyBK
YW4gMjAyMSAxODozMzo1OCBQU1QgKC0wODAwKSwgd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20g
Cj4gd3JvdGU6Cj4+IFRoZSBBUk0gYW5kIHJpc2N2IGhhdmUgc2FtZSBsb2dpYyB0byBjaGVjayBh
bmQgcmVzZXJ2ZQo+PiB0aGUgbWVtb3J5IG9mIGluaXRyZCwgbGV0J3MgcHJvdmlkZSBhIGNvbW1v
biBmdW5jdGlvbiB0bwo+PiByZWR1Y2UgZHVwbGljYXRlZCBjb2RlLgo+Pgo+PiBBZGQgX19MSU5V
WF9JTklUUkRfSCBkZWZpbmUgaW4gaW5pdHJkLmggdG8gcHJldmVudCBidWlsZCBlcnJvcgo+PiAo
Zm91bmQgYnkga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+KSBmcm9tIHRoZSBtdWx0
aXBsZQo+PiBpbmNsdXNpb24gb2Ygc2FtZSBoZWFkZXIgZmlsZSBtdWx0aXBsZSB0aW1lLgo+Cj4g
VGhpcyBpcyBkb2luZyBhIGJ1bmNoIG9mIGRpZmZlcmVudCB0aGluZ3M6Cj4KPiAqIEZpeGluZyB0
aGUgbGFjayBvZiBhIHByZXByb2Nlc3NvciBndWFyZCBpbiBpbml0cmQuaAo+ICogQWRkaW5nIHNv
bWUgZ2VuZXJpYyBjb2RlLgo+ICogQ29udmVydGluZyB0d28gYXJjaGl0ZWN0dXJlcyBvdmVyIHRv
IHRoYXQgZ2VuZXJpYyBjb2RlLgo+Cj4gSXQgbmVlZHMgdG8gYmUgc3BsaXQgaW50byBmb3VyIHBh
dGNoZXMuwqAgSSdtIGhhcHB5IHRvIHRha2UgdGhlbSB2aWEgCj4gdGhlIFJJU0MtViB0cmVlICh3
aXRoIGFuIEFjayBmcm9tIGZvciB0aGUgYXJjaC9hcm0vIHN0dWZmKSwgYnV0IG5vdCAKPiBhbGwg
dG9nZXRoZXIuCj4KPiBJdCBsb29rcyBsaWtlIGNza3kgY29waWVkIHRoaXMgYXMgd2VsbCwgdGhl
eSBhdCBsZWFzdCBoYXZlIGV4YWN0bHkgdGhlIAo+IHNhbWUgbWVzc2FnZS4KClNlbmQgdjPvvIwg
YWNjb3JkaW5nIHRvIHRoZSBzdWdnZXN0aW9u77yMdGhhbmtzLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
