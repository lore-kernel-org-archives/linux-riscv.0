Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFD6CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r3VyqM2/oR1ZYVweRabfutXlpCpbyMKYa/P6qCglaI=; b=DCOvT8XU1UaQ8k
	A0bhl57quIY4XFJ4qPd2xxL7D2XLylcWjEgih+Ms1tyPLQ/QHgN0bsKLzEqRxqQEI1TB2daY3Axm2
	qgS9E5L1UzMITVoJrl9QdHb3eflfEksf7f6bcBKbUlzzGHKDgopt0N1DyC2tlpBL+Fu1lZVAqitGd
	HXAblF5pACW5T1jR0kdUGvJYHfe5Tf1BbIUyHDW7akKHHLPbZGjf4/l3z/BsaVeI5uMTj+PBl5wYm
	jJhN12KBmADGdx2NwbpaQ6oBHY/+QGu641oP0RezXbEry2uZOiHfUN6wvQCJNlDpxF034P61MGr/r
	FkKhibHDll8J8YoO1/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApUM-0000000Dgt0-2YeX;
	Mon, 20 Oct 2025 12:59:50 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApUK-0000000DgrU-080d
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 12:59:49 +0000
Received: from [192.168.0.107] (unknown [114.241.85.109])
	by APP-01 (Coremail) with SMTP id qwCowAAHYKI6MvZo4TP9EQ--.2971S2;
	Mon, 20 Oct 2025 20:59:38 +0800 (CST)
Message-ID: <4a2312d1-5294-4621-8276-b7a9447b3e1a@iscas.ac.cn>
Date: Mon, 20 Oct 2025 20:59:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] riscv: tests: Make RISCV_KPROBES_KUNIT tristate
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Nam Cao <namcao@linutronix.de>
References: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
X-CM-TRANSID: qwCowAAHYKI6MvZo4TP9EQ--.2971S2
X-Coremail-Antispam: 1UD129KBjvdXoWrWr4DZFyftrWkKFyxKF4kZwb_yoWxXwb_uF
	4kWwn7Gws8CF40krWq9r95Gr93t3yj9ryUWryvgrWUCr9293ZrGw4DJFn2v3Z8Gr4vvFnx
	Wwsxur10kasrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j0fOwUUUUU=
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_055948_438926_D12FF6AF 
X-CRM114-Status: UNSURE (   5.42  )
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
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMjAvMjUgMjA6MjMsIFZpdmlhbiBXYW5nIHdyb3RlOgoKPiBGaXggYW4gYWxsbW9kY29u
ZmlnIHdhcm5pbmcgb24gdjYuMTgtcmMxOgo+Cj4gICAgIFdBUk5JTkc6IDMgYmFkIHJlbG9jYXRp
b25zCj4gICAgIGZmZmZmZmZmODFlMjQxMTggUl9SSVNDVl82NCAgICAgICAga3VuaXRfdW5hcnlf
YXNzZXJ0X2Zvcm1hdAo+ICAgICBmZmZmZmZmZjgxZTI0YTYwIFJfUklTQ1ZfNjQgICAgICAgIGt1
bml0X2JpbmFyeV9hc3NlcnRfZm9ybWF0Cj4gICAgIGZmZmZmZmZmODFlMjY5ZDAgUl9SSVNDVl9K
VU1QX1NMT1QgIF9fa3VuaXRfZG9fZmFpbGVkX2Fzc2VydGlvbgoKRm9yIG1vcmUgY29udGV4dCwg
SSBzYWlkIHRoaXMgd2FzIHRvIGZpeCBhIHdhcm5pbmcsIGJ1dCBJIHRyaWVkIGl0IG91dAphbnl3
YXkganVzdCB0byBzZWUgd2hhdCBoYXBwZW5zLiBBcHBhcmVudGx5LCBub3RoaW5nLiBUaGUga3By
b2JlIHRlc3RzCmp1c3QgZG9uJ3QgcnVuIGlmwqBSSVNDVl9LUFJPQkVTX0tVTklUPXkgYnV0IEtV
TklUPW0uCgpTbyB0aGlzIGNvbmZpZyBjb21iaW5hdGlvbiBiZWluZyBqdXN0IHdyb25nIGlzIHRo
ZSBwcm9ibGVtLCBhbmQgdGhlCndhcm5pbmcgaXMganVzdCBhIGxvdWQgc3ltcHRvbS4KClZpdmlh
biAiZHJhbWZvcmV2ZXIiIFdhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
