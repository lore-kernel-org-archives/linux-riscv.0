Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B05C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 07:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+AE+RJEPpQzm07cHY9F5B8Mm3hVQ1mFnX7AdJU7tSw=; b=GZvL1tUb06zkdq
	QVZSCaDR8UaCRg0HaMEjkzReCLSxKjf3HlPR2LSiDH/nIHNkux4gzYNW1t2jdJjgvTDJ7pIL63Ehx
	IOENPYkHNKOqIaXDlrb0reOiFMphm6mzSS3ZwBlgjTLjD7rVjOyiU8S9cLKnPXFgns8h7xmtg/in4
	ocdD+UX4kMYBLyYClvGUgO53kmeHEK0jM8Dv0FThDX3sGfFjbE0xYbrgqqtplc6jcNoDW30YygGGs
	beBkBhHenBlWthHrlBoAoHHthnROIwkOmrVtuCvMUmbLJV2KmmLklbTN7ERM1wE4GHy4DzLw0S9dA
	k+gxqZipwtDSDUEfrqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBf6-0000000BySh-3VSt;
	Tue, 05 Aug 2025 07:00:40 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBX5-0000000Bwtj-1lIM
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 06:52:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bx3y64XMRzKHMWT
	for <linux-riscv@lists.infradead.org>; Tue,  5 Aug 2025 14:52:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id AABCF1A16C8
	for <linux-riscv@lists.infradead.org>; Tue,  5 Aug 2025 14:52:13 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgB3N7kdqpFoblJfCg--.48321S2;
	Tue, 05 Aug 2025 14:52:13 +0800 (CST)
Message-ID: <00538107-08e3-4ba3-a11a-19fa9fd0a496@huaweicloud.com>
Date: Tue, 5 Aug 2025 14:52:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 00/10] Add support arena atomics for RV64
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Pu Lehui <pulehui@huawei.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <87v7n21deu.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87v7n21deu.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: Syh0CgB3N7kdqpFoblJfCg--.48321S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1UZw43tw13uFWUJF1xAFb_yoW8Ary7pa
	1rC3ZIkrWrGryxCasFqrW2vFyfKrs5C343Xw1DJ3yayF1jqrW2kFn7Ka48uF98AFZ3Xr1U
	C3Wjkry3Aw1rZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	bAw3UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_235223_883313_3649AA15 
X-CRM114-Status: UNSURE (   8.29  )
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

CgpPbiAyMDI1LzgvNSAxNDozOCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPiAKPj4gRnJvbTogUHUgTGVodWkgPHB1bGVo
dWlAaHVhd2VpLmNvbT4KPj4KPj4gcGF0Y2ggMS0zIHJlZmFjdG9yIHJlZHVuZGFudCBsb2FkIGFu
ZCBzdG9yZSBvcGVyYXRpb25zLgo+PiBwYXRjaCA0LTcgYWRkIFphY2FzIGluc3RydWN0aW9ucyBm
b3IgY21weGNoZy4KPj4gcGF0Y2ggOCBvcHRpbWl6ZXMgZXhjZXB0aW9uIHRhYmxlIGhhbmRsaW5n
Lgo+PiBwYXRjaCA5LTEwIGFkZCBzdXBwb3J0IGFyZW5hIGF0b21pY3MgZm9yIFJWNjQuCj4+Cj4+
IFRlc3RzIGB0ZXN0X3Byb2dzIC10IGF0b21pYyxhcmVuYWAgaGF2ZSBwYXNzZWQgYXMgc2hvd24g
YmVsbG93LAo+PiBhcyB3ZWxsIGFzIGB0ZXN0X3ZlcmlmaWVyYCBhbmQgYHRlc3RfYnBmLmtvYCBo
YXZlIHBhc3NlZC4KPiAKPiBbLi4uXQo+IAo+PiBQdSBMZWh1aSAoMTApOgo+PiAgICByaXNjdiwg
YnBmOiBFeHRyYWN0IGVtaXRfc3R4KCkgaGVscGVyCj4+ICAgIHJpc2N2LCBicGY6IEV4dHJhY3Qg
ZW1pdF9zdCgpIGhlbHBlcgo+PiAgICByaXNjdiwgYnBmOiBFeHRyYWN0IGVtaXRfbGR4KCkgaGVs
cGVyCj4+ICAgIHJpc2N2OiBTZXBhcmF0ZSB0b29sY2hhaW4gc3VwcG9ydCBkZXBlbmRlbmN5IGZy
b20gUklTQ1ZfSVNBX1pBQ0FTCj4+ICAgIHJpc2N2LCBicGY6IEFkZCBydl9leHRfZW5hYmxlZCBt
YWNybyBmb3IgcnVudGltZSBkZXRlY3Rpb24gZXh0ZW50c2lvbgo+PiAgICByaXNjdiwgYnBmOiBB
ZGQgWmFjYXMgaW5zdHJ1Y3Rpb25zCj4+ICAgIHJpc2N2LCBicGY6IE9wdGltaXplIGNtcHhjaGcg
aW5zbiB3aXRoIFphY2FzIHN1cHBvcnQKPj4gICAgcmlzY3YsIGJwZjogQWRkIGV4X2luc25fb2Zm
IGFuZCBleF9qbXBfb2ZmIGZvciBleGNlcHRpb24gdGFibGUKPj4gICAgICBoYW5kbGluZwo+PiAg
ICByaXNjdiwgYnBmOiBBZGQgc3VwcG9ydCBhcmVuYSBhdG9taWNzIGZvciBSVjY0Cj4+ICAgIHNl
bGZ0ZXN0cy9icGY6IEVuYWJsZSBhcmVuYSBhdG9taWNzIHRlc3RzIGZvciBSVjY0Cj4+Cj4+ICAg
YXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0KPj4g
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCAgICAgICAgICAgICAgfCAgIDYgKy0K
Pj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgICAgICAgICAgfCAgIDEg
Kwo+PiAgIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCAgICAgICAgICAgICAgICAgICAgICB8ICA3
MCArKy0KPj4gICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jICAgICAgICAgICAgICAg
fCA1MTYgKysrKystLS0tLS0tLS0tLS0tCj4+ICAgLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvYXJl
bmFfYXRvbWljcy5jICAgICAgIHwgICA5ICstCj4+ICAgNiBmaWxlcyBjaGFuZ2VkLCAyMTQgaW5z
ZXJ0aW9ucygrKSwgMzg5IGRlbGV0aW9ucygtKQo+IAo+IFdoYXQgYSBuaWNlIHNlcmllcyEgVGhl
IGJlc3Qga2luZCBvZiBjaGFuZ2VzZXQgLS0gbmV3IGZlYXR1cmUsIGxlc3MKPiBjb2RlISBUaGFu
ayB5b3UsIExlaHVpISBBZ2FpbiwgYXBvbG9naWVzIGZvciB0aGUgaG9ycmlibGUgU0xBLiBUaGUK
PiB3ZWF0aGVyIGluIFN3ZWRlbiB3YXMgc2ltcGx5IFRvbyBHb29kIHRoaXMgc3VtbWVyIQoKU291
bmRzIGxpa2UgYSBncmVhdCB2YWNhdGlvbiEKCj4gCj4gVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+ICMgUUVNVSBvbmx5Cj4gQWNrZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
