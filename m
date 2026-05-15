Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704EFCD37AC
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 01:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plWdEf9OhIhP441sT01F/6trgMTn18VOGlnNuqK3YFM=; b=VBwmaKBD9j4RvL
	z7Kiai4bgeGE3CJyoVhVbrVP+ubsv+VjAvGagMU7dqPJOMJAIPa02X5WzTFNHmreGSTxCblbxkR5o
	qOagQY9XSfzRSw3Wq029p0YyR+mz3BGN2TNmjuLewPCqGR3OIMIfkgIjUwM5Ox4YNeeqAg+3bF0vy
	Kv8vDAjX/epog4IsOBfySSiiyGXfXwNxWx0XRdQHeQOx762JCWHiUjo40xOn+cIhC+kYAZkM6CIF3
	BHGUFqvlh6pH2pLpvLPTpI3++6EMyGoB47tPr793OzJyb56dba9Ncvj28l1SfeXVHitZcKp/FuiWQ
	AbPfsFnFM/GQZ/j398aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhTi-000000072N4-2cdR;
	Fri, 15 May 2026 01:36:38 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhTe-000000072M7-49op
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 01:36:37 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAHlwqReAZqPDpMEA--.42958S2;
	Fri, 15 May 2026 09:36:17 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: dev.mbstr@gmail.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	xujiakai2025@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: Re: [PATCH] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe
Date: Fri, 15 May 2026 01:36:17 +0000
Message-Id: <20260515013617.2587283-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DIIGT2B04NER.LLGB7WGGPC2N@gmail.com>
References: <DIIGT2B04NER.LLGB7WGGPC2N@gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAHlwqReAZqPDpMEA--.42958S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWUAr4xCF1UKFW8GFykXwb_yoW8JF43pF
	s5K3W3tFsrKa40gFy7Zrs7Zry5tr1kKa9rJrW7Ja4UAan8J3WFkF9rKas8AwnrCryDta4I
	qayUJwsxCFsIka7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCREHCWoFiGX9TwABsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_183635_410619_41AE2CE7 
X-CRM114-Status: GOOD (  12.73  )
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

SGksIE1hdHQhCgpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IGFuZCB2YWx1YWJsZSBzdWdnZXN0
aW9ucyEKCj4gPiAtc3RhdGljIGlubGluZSBpbnQgZnBfaXNfdmFsaWQodW5zaWduZWQgbG9uZyBm
cCwgdW5zaWduZWQgbG9uZyBzcCkKPiA+ICtzdGF0aWMgaW5saW5lIGludCBmcF9pc192YWxpZCh1
bnNpZ25lZCBsb25nIGZwLCB1bnNpZ25lZCBsb25nIHNwLAo+ID4gKwkJCSAgICAgIHN0cnVjdCB0
YXNrX3N0cnVjdCAqdGFzaykKPiA+ICB7Cj4gPiAgCXVuc2lnbmVkIGxvbmcgbG93LCBoaWdoOwo+
ID4gIAo+ID4gKwlpZiAoIXRhc2spCj4gPiArCQl0YXNrID0gY3VycmVudDsKPiA+ICsKPiAKPiBJ
IHdvdWxkIHN1Z2dlc3QgdG8gbW92ZSB0aGlzIGBpZmAgaW50byB3YWxrX3N0YWNrZnJhbWUoKSBm
dW5jdGlvbiBpbiBvcmRlciB0byBkbwo+IHRoaXMgb25seSBvbmNlIGJlZm9yZSB3YWxraW5nIGxv
b3AuCgpNb3ZpbmcgdGhlIGBpZiAoIXRhc2spYCBjaGVjayBpbnRvIGB3YWxrX3N0YWNrZnJhbWUo
KWAgaXMgYSByZWFzb25hYmxlIAptaWNyby1vcHRpbWl6YXRpb24uIEknbGwgYWRvcHQgdGhpcyBp
biB2Mi4KCj4gCj4gPiAgCWxvdyA9IHNwICsgc2l6ZW9mKHN0cnVjdCBzdGFja2ZyYW1lKTsKPiA+
IC0JaGlnaCA9IEFMSUdOKHNwLCBUSFJFQURfU0laRSk7Cj4gPiArCWhpZ2ggPSAodW5zaWduZWQg
bG9uZyl0YXNrX3N0YWNrX3BhZ2UodGFzaykgKyBUSFJFQURfU0laRTsKPiAKPiBBbHNvIGFmdGVy
IGdyZXBwaW5nIGB0YXNrX3N0YWNrX3BhZ2VgIEkndmUgbm90aWNlZCB0aGF0IHB0X3JlZ3Mgc3Ry
dWN0dXJlIGlzCj4gbG9jYXRlZCBhdCB0aGUgZW5kIG9mIHN0YWNrLiBNYXliZSBpdCBpcyBhIGdv
b2QgaWRlYSB0byBhZGp1c3QgYm9yZGVyIGV2ZW4KPiAibG93ZXIiIHRvIGNoZWNrIHRoYXQgc3Ag
ZG9lcyBub3QgcG9pbnRzIGluc2lkZSBwdF9yZWdzPyAoc2VlIHRhc2tfcHRfcmVncwo+IG1hY3Jv
KQoKVXNpbmcgYHRhc2tfcHRfcmVncyh0YXNrKWAgYXMgdGhlIHVwcGVyIGJvdW5kIHByb3ZpZGVz
IGEgdGlnaHRlciBhbmQgbW9yZSAKcHJlY2lzZSBib3VuZGFyeS4gSSdsbCB1cGRhdGUgdGhlIGhp
Z2ggYm91bmQgYWNjb3JkaW5nbHkgaW4gdjIuCgpJ4oCZbSBwbGFubmluZyB0byBzdWJtaXQgdGhl
IHYyIHBhdGNoIGluIHR3byBkYXlzLiBJ4oCZZCBsaWtlIHRvIHdhaXQgYW5kIHNlZSAKd2hldGhl
ciBvdGhlcnMgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgZm9yIHRoaXMgcGF0Y2guCgpUaGFua3MgYWdh
aW4gZm9yIHlvdXIgdGltZSBhbmQgc3VnZ2VzdGlvbnMhCgpCZXN0IHJlZ2FyZHMsCkppYWthaSBY
dQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
