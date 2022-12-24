Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C704C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRAjcR1dBmmATi7h6/uU+N57VQLutdz7xR7Sit2SApg=; b=sovyEMbjAOg1Fl
	/2qXWKbs+9qqKFSYsvD9WXbyELKPCmRUd0f7d7y1pIqriEcLOFExXmaZGdeBA9Yw4R+THqa+Zgck3
	wTlesk3YG4NuYC3wWeyay84qYfpsZ+HJpgozYo2E3TyzF4sPp9A9X5hmcUz7sFKtWku/6+hmT+1Od
	r4syWZ8OnNcFo8xNuZqs7MKTtH6oGo0BfrLXKbtfwJs34Rv2X+Qk4wUaoXxsu3KRNuYvmgkdpclq9
	Ibg2aZxRsznIY6TQm8eWoB60qJbI1IMnyiQoYwN5YsODvC5ZABXry6AhEJzQlLHbcjKhQ0XN6E221
	wAbVwpgJ+eP9tcpyD2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8z2s-00G1Ym-PL; Sat, 24 Dec 2022 07:34:14 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8xwG-00FVut-FP
	for linux-riscv@lists.infradead.org; Sat, 24 Dec 2022 06:24:04 +0000
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NfDW62qhJz4f3p10
	for <linux-riscv@lists.infradead.org>; Sat, 24 Dec 2022 14:22:58 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgC3XevBmqZjip+oAQ--.41973S2;
	Sat, 24 Dec 2022 14:22:59 +0800 (CST)
Message-ID: <b3fb772a-db85-05ca-a1bf-4781526fae1d@huaweicloud.com>
Date: Sat, 24 Dec 2022 14:22:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH RESEND bpf-next 0/4] Support bpf trampoline for RV64
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Pu Lehui <pulehui@huawei.com>
References: <20221220021319.1655871-1-pulehui@huaweicloud.com>
 <87ili3a8zy.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87ili3a8zy.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: Syh0CgC3XevBmqZjip+oAQ--.41973S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrW3Jr4fCF1kGFyUZw1rCrg_yoWfZrgEkr
	ZxtrySvr45ta1Dtw1Ygw43urZxXr40qFyvyrWUXFZ2k395ZF1kXFn8u39xArWfZ3ySqFnx
	tF98AFyxAasFvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIxYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
	07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_
	WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU13rcDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_222320_739150_0C1F9476 
X-CRM114-Status: UNSURE (   6.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIyLzEyLzIyIDIxOjAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IFB1IExlaHVpIDxw
dWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JpdGVzOgo+IAo+PiBCUEYgdHJhbXBvbGluZSBpcyB0
aGUgY3JpdGljYWwgaW5mcmFzdHJ1Y3R1cmUgb2YgdGhlIGJwZgo+PiBzdWJzeXN0ZW0sIGFjdGlu
ZyBhcyBhIG1lZGlhdG9yIGJldHdlZW4ga2VybmVsIGZ1bmN0aW9ucwo+PiBhbmQgQlBGIHByb2dy
YW1zLiBOdW1lcm91cyBpbXBvcnRhbnQgZmVhdHVyZXMsIHN1Y2ggYXMKPj4gdXNpbmcgZWJwZiBw
cm9ncmFtIGZvciB6ZXJvIG92ZXJoZWFkIGtlcm5lbCBpbnRyb3NwZWN0aW9uLAo+PiByZWx5IG9u
IHRoaXMga2V5IGNvbXBvbmVudC4gV2UgY2FuJ3Qgd2FpdCB0byBzdXBwb3J0IGJwZgo+PiB0cmFt
cG9saW5lIG9uIFJWNjQuIFRoZSBpbXBsZW1lbnRhdGlvbiBvZiBicGYgdHJhbXBvbGluZQo+PiB3
YXMgY2xvc2VseSB0byB4ODYgYW5kIGFybTY0IGZvciBmdXR1cmUgZGV2ZWxvcG1lbnQuCj4gCj4g
VGhhbmsgeW91IGZvciB3b3JraW5nIG9uIHRoaXMhIEJQRiB0cmFtcG9saW5lIGlzIHRoZSAibWlz
c2luZyBwaWVjZSIKPiBmcm9tIGdldHRpbmcgcHJvcGVyIGtmdW5jIHN1cHBvcnQuCj4gCj4gVW5m
b3J0dW5hdGVseSwgSSB3b250IGJlIGFibGUgdG8gZG8gYSBwcm9wZXIgcmV2aWV3IHVudGlsIG5l
eHQgd2Vlay4KPiAKClRha2UgeW91ciB0aW1lLCBpdCBtaWdodCB0YWtlIHNldmVyYWwgcm91bmRz
IG9mIG9wdGltaXphdGlvbi4gWWVwLCByaXNjdiAKYnBmIHdpbGwgbG9vayBtb3JlIGNvbXBsZXRl
IHdoZW4gYnBmIHRyYW1wb2xpbmUgYW5kIGtmdW5jIGFyZSBzdXBwb3J0ZWQuCgpBbnl3YXksIGhh
dmUgYSBuaWNlIGNocmlzdG1hcyBob2xpZGF5cy7wn5iECgpMZWh1aQoKPiAKPiBIYXBweSBob2xp
ZGF5cywKPiBCasO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
