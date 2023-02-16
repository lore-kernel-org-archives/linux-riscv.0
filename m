Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3841CC636D4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 01:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BduVwZ1FhHcUjh2iOHxYrhxgZYzSF8YUk1INtJIHpkU=; b=p3TmNuKpCD/J9h
	ntPLgZBl8ajOC1gNdBSvpaEwd+sg7J7vhlhjKd/7lczKXUhnOVkKITjo7rbNsPI58DfTocj8opyZV
	Ktm6OhEiwsNyhMeu57g249s0sp31aC0JuC0TYZo2sIc2aTebFlVVxhn0w1ui5Oosg1lr/WeKYi7/W
	/SSgdFa2m7LwYIBn4GwtLiK9CGLEUkswH9WEprh+UiamnU0kd0XIvDT0KEunNurPags6rKyBlRMUp
	oaPN/KFC0UO3g/mTggyCKeOaWIQRAUV3BphTTCE6djMvxDCkdU3VZxKMe47gjAYByOv+9uAko1t1v
	BoGl6/poNQHD9c6LRRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSSzN-008C1j-Sn; Thu, 16 Feb 2023 01:23:09 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSSzK-008C1F-HR
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 01:23:08 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4PHHJ455cSz4f3jMN
	for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 09:23:00 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgA3LRt2he1jx4OFDQ--.43193S2;
	Thu, 16 Feb 2023 09:23:02 +0800 (CST)
Message-ID: <f4f01d2a-666b-58a1-cf76-84541643bdc3@huaweicloud.com>
Date: Thu, 16 Feb 2023 09:23:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next v1 0/4] Support bpf trampoline for RV64
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20230215135205.1411105-1-pulehui@huaweicloud.com>
 <87mt5ft2bx.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87mt5ft2bx.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: _Ch0CgA3LRt2he1jx4OFDQ--.43193S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryrtFy5AFyDKry8KryUJrb_yoWkCFg_ur
	93tF1xZwnxJanrta1Y9r4a9rZFgr47Xry0y3yxZrWIv34kZFn8Jr4FvF9avryfXa4SvFn8
	GrZxuFyxAa42vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
	07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_
	WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUo0eHDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_172306_942349_CDA07CF0 
X-CRM114-Status: GOOD (  10.84  )
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

CgpPbiAyMDIzLzIvMTUgMjI6NDUsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gSGkgTGVodWksCj4g
Cj4gUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IEJQRiB0
cmFtcG9saW5lIGlzIHRoZSBjcml0aWNhbCBpbmZyYXN0cnVjdHVyZSBvZiB0aGUgYnBmCj4+IHN1
YnN5c3RlbSwgYWN0aW5nIGFzIGEgbWVkaWF0b3IgYmV0d2VlbiBrZXJuZWwgZnVuY3Rpb25zCj4+
IGFuZCBCUEYgcHJvZ3JhbXMuIE51bWVyb3VzIGltcG9ydGFudCBmZWF0dXJlcywgc3VjaCBhcwo+
PiB1c2luZyBlYnBmIHByb2dyYW0gZm9yIHplcm8gb3ZlcmhlYWQga2VybmVsIGludHJvc3BlY3Rp
b24sCj4+IHJlbHkgb24gdGhpcyBrZXkgY29tcG9uZW50LiBXZSBjYW4ndCB3YWl0IHRvIHN1cHBv
cnQgYnBmCj4+IHRyYW1wb2xpbmUgb24gUlY2NC4gU2luY2UgUlY2NCBkb2VzIG5vdCBzdXBwb3J0
IGZ0cmFjZQo+PiBkaXJlY3QgY2FsbCB5ZXQsIHRoZSBjdXJyZW50IFJWNjQgYnBmIHRyYW1wb2xp
bmUgaXMgb25seQo+PiB1c2VkIGluIGJwZiBjb250ZXh0Lgo+IAo+IFRoYW5rcyBhIGxvdCBmb3Ig
Y29udGludWluZyB0aGlzIHdvcmsuIEkgYWdyZWUgd2l0aCB5b3UgdGhhdCBpdCdzCj4gdmFsdWFi
bGUgdG8gaGF2ZSBCUEYgdHJhbXBvbGluZSBzdXBwb3J0LCBldmVuIHdpdGhvdXQgcHJvcGVyIGRp
cmVjdCBjYWxsCj4gc3VwcG9ydCAod2UnbGwgZ2V0IHRoZXJlIHNvb24pLiBUaGUgdHJhbXBvbGlu
ZSBlbmFibGVzIGtmdW5jIGNhbGxzLiBPbgo+IHRoYXQgbm90ZTsgSSBkb24ndCBzZWUgdGhhdCB5
b3UgZW5hYmxlICJicGZfaml0X3N1cHBvcnRzX2tmdW5jX2NhbGwoKSIKPiBhbnl3aGVyZSBpbiB0
aGUgc2VyaWVzLiAgV2l0aCBCUEYgdHJhbXBvbGluZSBzdXBwb3J0LCB0aGUgUklTQy1WIEJQRgo+
IGZpbmFsbHkgY2FuIHN1cHBvcnQga2Z1bmMgY2FsbHMhCj4gCj4gSSdkIGFkZCB0aGUgZm9sbG93
aW5nIHRvIGJwZl9qaXRfY29tcDY0LmM6Cj4gCgpoYXBweSB0byBoZWFyIHRoYXTvvIxsZXQncyBt
YWtlIGl0IG1vcmUgY29tcGxldGVhYmxlLgoKPiBib29sIGJwZl9qaXRfc3VwcG9ydHNfa2Z1bmNf
Y2FsbCh2b2lkKQo+IHsKPiAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiB9Cj4gCj4gOi0pCj4gCj4g
SSdsbCBkbyBhIHJldmlldyBBU0FQLgo+IAo+IAo+IEJqw7ZybgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
