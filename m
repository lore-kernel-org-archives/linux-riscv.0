Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0972CA101E
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 02:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiaZPTBEnKtuB8W9/mPr1MDEm7BbBStmgRo24ZJUYFg=; b=BxTS4Tmnfe7HJS
	+FYMsq80TGMMGBiazWS2HmQ+6rRLmKJ/9thLFLCyO1mbCiD6GqtM99QLCwjEyli8cIFm/ZFxpCqhk
	vPk3gglOjC1A3zeum3XWPXsT7msr3QFzKtuw7itVwxcPr2HifmtN4MpR9/Yvn0TIM2y3DS7FxlnJc
	VzYKGRygZwQq9KhqcJ13LHW63Rgq8NblO68KeGE+S4DyX46yJhG7ZMFKxKNDDI38aM0C9U/g4sQ5K
	9mrE8YzaQSOaVIeKGeyqKpNdYpvl0Zp1ICNRbpE5up3RNJVXPin1LcxSK+xIZaLCigsaKwzfg3P9q
	XNL/GLaZ9/QzK9euhWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skEBp-00000008O4l-3kDW;
	Sat, 31 Aug 2024 02:50:13 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skEBl-00000008O3t-1JVQ
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 02:50:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Wwfcl6HGPz4f3jM9
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 10:49:43 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 9E3F61A06D7
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 10:49:58 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgA3XoTThNJmEubKDA--.2628S2;
	Sat, 31 Aug 2024 10:49:56 +0800 (CST)
Message-ID: <1f27c5c1-a696-435b-a90f-2e92db646597@huaweicloud.com>
Date: Sat, 31 Aug 2024 10:49:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/perf: riscv: Align errno for unsupported perf
 type in pmu_sbi_event_map
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>
References: <20240829094922.865638-1-pulehui@huaweicloud.com>
 <85e93d99-8067-418f-86de-bf394734a93a@rivosinc.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <85e93d99-8067-418f-86de-bf394734a93a@rivosinc.com>
X-CM-TRANSID: gCh0CgA3XoTThNJmEubKDA--.2628S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4kGF4ruw1xJF18uFyDKFg_yoW8WF17pF
	Z5Ca15Ca4Ygr4IqasrJ3WUua4rXw4jqa98K3s0y3WDZr43Cr90gr13XryY9w1kXrW8Jr12
	kr4YqrW3ZFyUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07UK2NtUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_195009_878663_D6599965 
X-CRM114-Status: GOOD (  14.73  )
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

CgpPbiAyMDI0LzgvMzEgMToyNCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gT24gOC8yOS8yNCAyOjQ5
IEFNLCBQdSBMZWh1aSB3cm90ZToKPj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNv
bT4KPj4KPj4gUklTQy1WIHBlcmYgZHJpdmVyIGRvZXMgbm90IHlldCBzdXBwb3J0IFBFUkZfVFlQ
RV9CUkVBS1BPSU5ULiBJdCB3b3VsZAo+PiBiZSBtb3JlIGFwcHJvcHJpYXRlIHRvIHJldHVybiAt
RU9QTk9UU1VQUCBvciAtRU5PRU5UIGZvciB0aGlzIHR5cGUgaW4KPj4gcG11X3NiaV9ldmVudF9t
YXAuIENvbnNpZGVyaW5nIHRoYXQgb3RoZXIgaW1wbGVtZW50YXRpb25zIHJldHVybiAtRU5PRU5U
Cj4+IGZvciB1bnN1cHBvcnRlZCBwZXJmIHR5cGVzLCBsZXQncyBzeW5jaHJvbml6ZSB0aGlzIGJl
aGF2aW9yLiBEdWUgdG8gdGhpcwo+PiByZWFzb24sIGEgcmlzY3YgYnBmIHRlc3RjYXNlcyBwZXJm
X3NraXAgZmFpbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
LmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgfCAyICstCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMKPj4gaW5kZXggMzFhMTdhNTZlYjNiLi5jZGNiMzI4ZjA5YjYgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPj4gKysrIGIvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYwo+PiBAQCAtNTQzLDcgKzU0Myw3IEBAIHN0YXRpYyBpbnQgcG11
X3NiaV9ldmVudF9tYXAoc3RydWN0IHBlcmZfZXZlbnQgCj4+ICpldmVudCwgdTY0ICplY29uZmln
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+
IMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU5WQUw7Cj4+
ICvCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PRU5UOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJl
YWs7Cj4+IMKgwqDCoMKgwqAgfQo+IAo+IFRoYW5rcyBmb3IgdGhlIGZpeC4gVGhlcmUgYXJlIGZl
dyBtb3JlIHBsYWNlcyB3aGVyZSB0aGUgZXJyb3IgY29kZXMgY2FuIAo+IGJlIGFsaWduZWQuCj4g
Cj4gMS4gV2UgcmV0dXJuIEVPUE5PVFNVUFAgZm9yIGxlZ2FjeSBkcml2ZXIuCj4gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTEtcmM1L3NvdXJjZS9kcml2ZXJzL3BlcmYvcmlz
Y3ZfcG11X2xlZ2FjeS5jI0wzMQo+IAo+IDIuIFdlIHNob3VsZCByZXR1cm4gRU5PRU5UIGZvciBp
bnZhbGlkIGV2ZW50IG1hcHBpbmcgYXMgd2VsbC4KPiAKPiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ni4xMS1yYzUvc291cmNlL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMj
TDMxMgoKVGhhbmtzIEF0aXNoLCBJIHdpbGwgY2hlY2sgZm9yIHRoYXQgYW5kIGF0dGFjaCB0aGF0
IGZvciB0aGUgbmV4dCB2ZXJzaW9uLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
