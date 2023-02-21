Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D1BC636D6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 01:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5/jZ3lKQcVp2ITs7zlIx8mH7gLgn7PnGOZguaphZAA=; b=CVHifHdukiU6ta
	bwQJT+oltwjmdxH0WOuR3qC+OgwRTHqaSNnO+DCRwTE5ltZSSA7AADxlgTWWS5mEaazwSuij0V88s
	vV5e7ZSK1X0qoTyG7KvhmBbcjXoOWzW4HCbFV9FwEIKIlcDUMTRLcsKkBVj15TIXqw5IVNnzKfSyF
	94/m6Uw/lf5J8wYXHTCth/OepVhFdAmEbLfRukRhDYlIY/yIaAqdkBmEhUA+GoWkbqBfxRhOO9BoF
	QBH1lAtkYP6RES4LuIq9357ur1WEOXWdQ3jbj5EINIok9GF64E77kHIIVPAMOCLJvkftppSiqLESf
	Nenpl7NDsdDK28YqSwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUHkS-006E9Q-SJ; Tue, 21 Feb 2023 01:47:16 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUHkO-006E7z-Pk
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 01:47:14 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4PLMbW4CZ4z4f3mK5
	for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 09:47:03 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgDXzBqXIvRjpZ2tDg--.32789S2;
	Tue, 21 Feb 2023 09:47:04 +0800 (CST)
Message-ID: <80e69e73-b873-6717-fe45-a854dbdd5476@huaweicloud.com>
Date: Tue, 21 Feb 2023 09:47:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next v2] riscv, bpf: Add kfunc support for RV64
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Pu Lehui <pulehui@huawei.com>
References: <20230220083203.2988238-1-pulehui@huaweicloud.com>
 <874jrg76dc.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <874jrg76dc.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: _Ch0CgDXzBqXIvRjpZ2tDg--.32789S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrW3Jr45Kw47Zr1DtF1fWFg_yoWktFcEkr
	s7tF92q34rJ3W7J3W2kwsIkrWDGws7XFy0q3yjgr4Skr95Xa9rWasYkr9aqw4xXFyfZrsI
	qrW5X3ZxA347ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI62AI
	1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUrR6zUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_174713_043619_DB5D0547 
X-CRM114-Status: GOOD (  10.18  )
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

CgpPbiAyMDIzLzIvMjAgMjI6MzQsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IEZyb206IFB1IExlaHVpIDxwdWxl
aHVpQGh1YXdlaS5jb20+Cj4+Cj4+IEFzIGFub3RoZXIgaW1wb3J0YW50IG1pc3NpbmcgcGllY2Ug
b2YgUlY2NCBKSVQsIGtmdW5jIGFsbG93IGJwZiBwcm9ncmFtcwo+PiBjYWxsIGtlcm5lbCBmdW5j
dGlvbnMuIEZvciBub3csIFJWNjQgaXMgc3VmZmljaWVudCB0byBlbmFibGUgaXQuCj4gCj4gVGhh
bmtzIExlaHVpIQo+IAo+IE1heWJlIHdlIGNhbiByZXdvcmQvbWFzc2FnZSB0aGUgY29tbWl0IG1l
c3NhZ2UgYSBiaXQ/IFdoYXQgZG8geW91IHRoaW5rCj4gYWJvdXQgc29tZXRoaW5nIGxpa2U6Cj4g
Cj4gIk5vdyB0aGF0IHRoZSBCUEYgdHJhbXBvbGluZSBpcyBzdXBwb3J0ZWQgYnkgUklTQy1WLCBp
dCBpcyBwb3NzaWJsZSB0bwo+IHVzZSBCUEYgcHJvZ3JhbXMgd2l0aCBrZnVuYyBjYWxscy4KPiAK
CmtmdW5jIGFuZCBicGYgdHJhbXBvbGluZSBhcmUgZnVuY3Rpb25hbGx5IGluZGVwZW5kZW50LiBr
ZnVuYyBbMV0sIGxpa2UgCmJwZiBoZWxwZXIgZnVuY3Rpb25zLCBhbGxvd3MgYnBmIHByb2dyYW1z
IHRvIGNhbGwgZXhwb3J0ZWQga2VybmVsIApmdW5jdGlvbnMsIHdoaWxlIGJwZiB0cmFtcG9saW5l
IHByb3ZpZGVzIGEgbW9yZSBlZmZpY2llbnQgd2F5IHRoYW4gCmtwcm9iZSB0byBhY3QgYXMgYSBt
ZWRpYXRvciBiZXR3ZWVuIGtlcm5lbCBmdW5jdGlvbnMgYW5kIGJwZiBwcm9ncmFtcywgCmFuZCBi
ZXR3ZWVuIGJwZiBwcm9ncmFtcy4KCkluIGZhY3QsIGl0IHdhcyBhbHJlYWR5IHN1cHBvcnRlZCBi
ZWZvcmUgdGhlIGJwZiB0cmFtcG9saW5lIAppbXBsZW1lbnRhdGlvbiwgSSBqdXN0IHR1cm5lZCBp
dCBvbi4gQXMgZm9yIFJWMzIga2Z1bmMsIGl0IG5lZWRzIHRvIGRvIApzb21lIHJlZ2lzdGVycyBw
YXJzaW5nLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDIxMDMyNTAxNTEyNC4x
NTQzMzk3LTEta2FmYWlAZmIuY29tLwoKPiBOb3RlIHRoYXQgdGhlIHRyYW1wb2xpbmUgZnVuY3Rp
b25hbGl0eSBpcyBvbmx5IHN1cHBvcnRlZCBieSBSVjY0Lgo+IAo+IEFkZCBicGZfaml0X3N1cHBv
cnRzX2tmdW5jX2NhbGwoKSB0byB0aGUgNjQtYml0IEpJVC4iCj4gCj4gCj4gQmrDtnJuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
