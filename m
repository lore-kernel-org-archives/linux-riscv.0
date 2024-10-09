Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DD8CF0449
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufnh+S5JMXq4BUxTXHzf+ekUquwzUGDw0fjTMz0pjVc=; b=XPYIJPbZ+drf7l
	+HJnwTUH8+ES7U3pWJMaDT19YsZp/bDgNWlGGUsabugiD3XjLIXaTtWdpUgAphONPOcSEL0ABclqQ
	cdNcHr5azpNLOdnqR32bL9HNIWBuhrNniBuqxBtoNksfmAj1/Fr2gQD3lk4DuN1BdLNEnsya5+QTr
	xItPu3jVbrPfEb2w9WRE0C3sOFJSsKnrUyJ2mkJAqM4zZ18wDKdde3ntFaur5GT88VKC4FMjab5fb
	WfYlFele4PU/B9TcCnuA0/eXRpmZavpcxIWAdDQnM91i5MaOV6zxzngGbinEA16O6i5cauaJKXqnS
	2M6edLby8O0xcfPjCVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syU85-00000008v49-05lT;
	Wed, 09 Oct 2024 10:41:17 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTzD-00000008tTU-3Y05
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 10:32:13 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XNq1n6xQlz4f3jsC
	for <linux-riscv@lists.infradead.org>; Wed,  9 Oct 2024 18:31:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id CB8DC1A092F
	for <linux-riscv@lists.infradead.org>; Wed,  9 Oct 2024 18:31:58 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgB3q2CdWwZnmZ9lDg--.1143S2;
	Wed, 09 Oct 2024 18:31:58 +0800 (CST)
Message-ID: <bc137f2e-4375-4174-8985-c5fe31fbbf98@huaweicloud.com>
Date: Wed, 9 Oct 2024 18:31:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf] riscv, bpf: Fix possible infinite tailcall when
 CONFIG_CFI_CLANG is enabled
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20241008124544.171161-1-pulehui@huaweicloud.com>
 <87jzeh4qvv.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87jzeh4qvv.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: Syh0CgB3q2CdWwZnmZ9lDg--.1143S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw1UWFyUKF45JrW3tF4ruFg_yoWDWFc_uF
	WSyr9ag3y5Ja1Ik3W8ur4UW3srCrWj9ryUX3W5t3sxGa93Jws5uw4vqrs2yrWxZ393XFyq
	yF45tFWIgw429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AK
	xVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jIks
	gUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_033208_396739_A0E23AC1 
X-CRM114-Status: UNSURE (   7.53  )
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

CgpPbiAyMDI0LzEwLzkgMTY6MzMsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IEZyb206IFB1IExlaHVpIDxwdWxl
aHVpQGh1YXdlaS5jb20+Cj4+Cj4+IFdoZW4gQ09ORklHX0NGSV9DTEFORyBpcyBlbmFibGVkLCB0
aGUgbnVtYmVyIG9mIHByb2xvZ3VlIGluc3RydWN0aW9ucwo+PiBza2lwcGVkIGJ5IHRhaWxjYWxs
IG5lZWRzIHRvIGluY2x1ZGUgdGhlIGtjZmkgaW5zdHJ1Y3Rpb24sIG90aGVyd2lzZSB0aGUKPj4g
VENDIHdpbGwgYmUgaW5pdGlhbGl6ZWQgZXZlcnkgdGFpbGNhbGwgaXMgY2FsbGVkLCB3aGljaCBt
YXkgcmVzdWx0IGluCj4+IGluZmluaXRlIHRhaWxjYWxscy4KPj4KPj4gRml4ZXM6IGU2Mzk4NWVj
ZDIyNiAoImJwZiwgcmlzY3Y2NC9jZmk6IFN1cHBvcnQga0NGSSArIEJQRiBvbiByaXNjdjY0IikK
Pj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPiAKPiBUaGFu
a3MhIERpZCB5b3UgdGVzdCB0aGlzIHdpdGggdGhlIHNlbGZ0ZXN0IHN1aXRlPyBEaWQgdGhlIHRh
aWxjYWxsCj4gdGVzdHMgY2F0Y2ggaXQ/CgpPaCwgSSBkaXNjb3ZlcmVkIGl0IHRocm91Z2ggY29k
ZSByZXZpZXcuCgpJIGp1c3QgdHJpZWQgbGx2bSBjb21waWxhdGlvbiBidXQgaXQgc2VlbXMgdGhh
dCBteSBlbnZpcm9ubWVudCBjYW5ub3QgCmNvbXBpbGUgYnBmIHNlbGZ0ZXN0cy4gSSBuZWVkIHRv
IGZpbmQgd2h5LgoKQnV0IGFmdGVyIHJlYWRpbmcgdGhlIHRhaWxjYWxscyB0ZXN0Y2FzZSwgSSBm
b3VuZCB0aGF0IHRoZSB0YWlsY2FsbF8zIApzdWJ0ZXN0IGNhbiBjb3ZlciB0aGlzIHNjZW5hcmlv
IGFzIGl0IHdpbGwgdmVyaWZ5IHRoZSBUQ0MgdmFsdWUuCgo+IAo+IE5vdGUgdG8gc2VsZiBpcyB0
aGF0IEkgc2hvdWxkIHJ1biBrQ0ZJIGVuYWJsZWQgdGVzdHMgZm9yIFJJU0MtVi4KPiAKPiAKPiBB
Y2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
