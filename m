Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138A7CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 06:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMvHcLV5Y9HmUa+sYKu7nqojv3fwXM73g0K5/mzqJTI=; b=KwL+PJFZDUFaKB
	TPA/jqXNGHA/ce6TlONHPTI3USGuqXd0DE8wWF5yHi0gJrShFbpNOxN7HmHXif+nVD+wF4vJ10+qF
	xG8LBzqkxr0+EjTMFNUtZUQj1INYsc6v6HurdW+x3y7K4iMO8IoqnQVQOf911t3tBy9pBDHDcEvsZ
	WvYBz0N9rk2f6xwEnfknup9Wir1PJEq/Ntru745tFJPPUGV4T6AlwzIeUvm7Yi2Di3UZ6Umpz0fVR
	QqulDSE5soGr6+k6QOfVJnn+jzNsrx5eKhKyro0vO33oMisKpthp2xwr4AQGJZo55lywF4FbiXr3l
	SjEJlbXd4Sc65u3wXxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kC1-00000005Hbp-1cnQ;
	Thu, 09 Oct 2025 06:32:01 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kBy-00000005HZb-0VlF
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 06:31:59 +0000
Received: from [192.168.0.108] (unknown [114.241.81.247])
	by APP-01 (Coremail) with SMTP id qwCowACnAaTKVudoKMsxDQ--.10853S2;
	Thu, 09 Oct 2025 14:31:39 +0800 (CST)
Message-ID: <4de90ac7-f05d-4c16-a5c5-8101f5d2fe91@iscas.ac.cn>
Date: Thu, 9 Oct 2025 14:31:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Prevent early kernel panic in instrumented
 apply_early_boot_alternatives
To: Paul Walmsley <pjw@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 duchangbin <changbin.du@huawei.com>, Alexandre Ghiti <alex@ghiti.fr>,
 andybnac@gmail.com
References: <20250624113042.2123140-1-changbin.du@huawei.com>
 <a89f5970-5ea9-4d92-8952-6c26a22ac153@ghiti.fr>
 <d41d9c7a103f4600a4fc5beea77e0f4e@huawei.com>
 <2396743a-480e-2ab3-f7fe-569d8f2adfcf@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <2396743a-480e-2ab3-f7fe-569d8f2adfcf@kernel.org>
X-CM-TRANSID: qwCowACnAaTKVudoKMsxDQ--.10853S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYo7k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj
	6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
	1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY
	0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j189NUUUUU=
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_233158_539724_CD563E40 
X-CRM114-Status: UNSURE (   5.15  )
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

Ck9uIDEwLzkvMjUgMTA6MDEsIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4gSGkgQWxleCwgZHVjaGFu
Z2JpbiwgQW5keSwKPgo+IE9uIFdlZCwgMjUgSnVuIDIwMjUsIGR1Y2hhbmdiaW4gd3JvdGU6Cj4K
PiBbLi4uXQo+Cj4gV29ya2luZyBvbiBjbGVhbmluZyBvdXQgUGF0Y2h3b3JrLiAgV2FzIHRoZXJl
IGFueSBmdXJ0aGVyIGNvbmNsdXNpb24gCj4gcmVhY2hlZCBvbiB0aGlzIHBhdGNoLCBvciBtb3Jl
IGJyb2FkbHksIHN0YXRpYyBmdHJhY2UgPwoKU3RhdGljIGZ0cmFjZSBmb3IgcmlzY3YgaXMgbm8g
bG9uZ2VyIHN1cHBvcnRlZCBpbiA2LjE3LiBjb25maWcgUklTQ1YgaXMgbm93OgoKwqAgwqAgc2Vs
ZWN0IERZTkFNSUNfRlRSQUNFIGlmIEZVTkNUSU9OX1RSQUNFUgoKU2luY2UgY29tbWl0IDU4NzRj
YTRjNjI4MCAoInJpc2N2OiBTdG9wIHN1cHBvcnRpbmcgc3RhdGljIGZ0cmFjZSIpLiBUaGlzCnBh
dGNoIHNob3VsZCBiZSBvYnNvbGV0ZS4KClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
