Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8B5C56202
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 01:00:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C552F2075A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 01:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z7KXoGS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C552F2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kHIHlIyLTwCRAMmIw5d2MDOLKuRX4mppHd8Jie+dhbU=; b=z7KXoGS0M5VLhlWzQf5em95dX
	cW385228P8GYiZSPUqUeleKZ2SDl2UMzwMQi2GmcLfrJPnsS2syjgMVFfcARd4Py03TKXJp9fV+6C
	hX7ZJZcy1dEG4upRqAO2d7IofyUJBo6O5xMTH1h1F+iyd4IfPTluRSurtT9jzrY0tI75m+1r0I5Fl
	NpxoQ55z46yf4gP8RGc4VzWfViueI+qFXHfC3875j8La3vzVPRNcwZGD3mBnlb5itnKA4lJTrOTeI
	UAblCjxp45GbYnNCjkVtplEgAk8C5nADyx+EfHjOBI1JVciYWirJKxA+M23MikWSrgPtpMI+2wvJ0
	WzKHwysww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki5e3-0006ju-Nf; Thu, 26 Nov 2020 01:00:23 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki5e1-0006j9-5B
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 01:00:22 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ChKDG0pcXzhgHw;
 Thu, 26 Nov 2020 08:59:58 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 09:00:08 +0800
Subject: Re: [PATCH] drivers: clocksource: timer-riscv: Depend on the SBI
To: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
References: <20201125195804.3780975-1-palmer@dabbelt.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <d5ce9003-b070-0dfc-042c-a2879b992959@huawei.com>
Date: Thu, 26 Nov 2020 09:00:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201125195804.3780975-1-palmer@dabbelt.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_200021_468252_3DF8ED95 
X-CRM114-Status: GOOD (  16.07  )
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
Cc: tglx@linutronix.de, Palmer Dabbelt <palmerdabbelt@google.com>,
 kernel-team@android.com, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVy77yMwqAgSSBzZW5kIGEgc2FtZSBwYXRjaCBhbmQgaGF2ZSBiZWVuIGFja2VkIGZy
b20geW91IDogKQoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJp
c2N2L3BhdGNoLzIwMjAxMDI4MTMxMjMwLjcyOTA3LTEtd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5j
b20vCgpPbiAyMDIwLzExLzI2IDM6NTgsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IEZyb206IFBh
bG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+Cj4KPiBGdW5kYW1lbnRhbGx5
IHRoaXMgaXMgYW4gU0JJIHRpbWVyIGRyaXZlciwgc28gaXQgY2Fubm90IGJlIGVuYWJsZWQgd2l0
aG91dAo+IHN1cHBvcnQgZm9yIHRoZSBSSVNDLVYgU0JJLgo+Cj4gRml4ZXM6IGQ1YmU4OWE4ZDEx
OCAoIlJJU0MtVjogUmVzdXJyZWN0IHRoZSBNTUlPIHRpbWVyIGltcGxlbWVudGF0aW9uIGZvciBN
LW1vZGUgc3lzdGVtcyIpCj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRh
YmJlbHRAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZyB8
IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmln
Cj4gaW5kZXggNjhiMDg3YmZmNTljLi4zZWVhZjBlZmJhOGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9jbG9ja3NvdXJjZS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmln
Cj4gQEAgLTY1NSw2ICs2NTUsNyBAQCBjb25maWcgQVRDUElUMTAwX1RJTUVSCj4gICBjb25maWcg
UklTQ1ZfVElNRVIKPiAgIAlib29sICJUaW1lciBmb3IgdGhlIFJJU0MtViBwbGF0Zm9ybSIgaWYg
Q09NUElMRV9URVNUCj4gICAJZGVwZW5kcyBvbiBHRU5FUklDX1NDSEVEX0NMT0NLICYmIFJJU0NW
Cj4gKwlkZXBlbmRzIG9uIFJJU0NWX1NCSQo+ICAgCXNlbGVjdCBUSU1FUl9QUk9CRQo+ICAgCXNl
bGVjdCBUSU1FUl9PRgo+ICAgCWhlbHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
