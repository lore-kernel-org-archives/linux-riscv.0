Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3395BF46448
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPamB2+Z6geOiSuOeIKmEPJDb+8sCs51Ehq9I28QkB4=; b=BQpeGX0KaQf9Ds
	X11c2948nrlKXfaO4JzA29d6PbOPykOv/Ykmb06vspuyuCDZbxfWpH6bP3VwJ3Yn+Vj7v3cF/wQ+X
	Jvr8V6v1BF1l1Se8w+0jcemAvLplC2LCQWqQPHvkH67v1SgXXLHTTf7+ggIPtXM6aag804e1tA0HN
	oj2IzfT6bW0QB8SWHG7HejnyF4OdrZXdaIavXTD72F7YWUCOBR+u4mdZQooZr0qoB7ZkSPSv29V8U
	lvgm6S7HoRB7aVsACREJbO0Jx0wjDltBn5QnTS9vYot1BkN+FuJL+5jVhxLWS48h+tu+k/uaw7GPx
	As8MXdYV7odKQMaCqidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2562-00000003kM6-42Ae;
	Mon, 16 Mar 2026 10:22:51 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w255z-00000003kLo-49iT
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 10:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773656548; x=1774261348; i=markus.elfring@web.de;
	bh=EN0Mq9wbPjZNrq2V6RAcJAb8h9BnnJfQPse7PjINeXY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=drPiQUqNcIcDcld955amdf/FN2Gh5hGJVbflszb6oX0abZafT+7FNcwc48wnqGmY
	 /0SwKbmVM2GFRo05pJA2akqejumiOg4Wx1AvbZV81kzVBFqJDalvybLSKZ1cDQgEd
	 byaSqVs8mvIMcFyw6vB8lAXFr6k17PU7r2cr+ETzJ+3UG0nAm0p16Lrp/64zz17CJ
	 6MqDJI8+QfC2DNPY/ZJZrP3DOOO0b2OKUgKLr+2Z4xNd9VgoPT36afq45HNN+r1S5
	 aj9t9WDqvHqY05zvg2noQutIIoka9J0CclEWEczb1Ad2URhA+xiRhGtKbKof5ZGwO
	 BMvIZwoM56cOj1bDrg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7ept-1vyU3t0zoD-00Cgvo; Mon, 16
 Mar 2026 11:22:28 +0100
Message-ID: <71d162ec-8745-4391-a94c-e5b0bacb4fe1@web.de>
Date: Mon, 16 Mar 2026 11:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Osama Abdelkader <osama.abdelkader@gmail.com>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Suren Baghdasaryan <surenb@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260314222815.153203-1-osama.abdelkader@gmail.com>
Subject: Re: [PATCH] riscv: mm: add null check for find_vm_area in set_memory
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260314222815.153203-1-osama.abdelkader@gmail.com>
X-Provags-ID: V03:K1:siHhcmlu0Wf+GnTFJjzv4j7rBPgS/DKt2UYWZAbX9tCwJ6hiwn2
 xkffKKFEXou2WZhS4uMNrAABAwoWy5f++m1ZNi78kBTl9SsEx+hF+17faekfLfkOQRs2BDg
 o2lnbFGMql0ZP4RM7y66g1oGrBATrcm1tad/WxmaqOK2YCEtxOlNaDQgfLZNQffHWZwjvZz
 HG8X6ylyfJCV/bU1z17yw==
UI-OutboundReport: notjunk:1;M01:P0:UERBgb8pbBY=;YwR6APTGBvHB6GHhBjwpiUM4ZSM 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_032248_325563_B0210623 
X-CRM114-Status: UNSURE (   6.00  )
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

PiBmaW5kX3ZtX2FyZWEoKSBjYW4gcmV0dXJuIE5VTEwuIEFkZCBhIG51bGwgY2hlY2sgdG8gYXZv
aWQgcG90ZW50aWFsCj4gbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlLCBtYXRjaGluZyB0aGUgcGF0
dGVybiB1c2VkIGJ5IG90aGVyIGFyY2hlcy4KCjEuIFdlcmUgYW55IHNvdXJjZSBjb2RlIGFuYWx5
c2lzIHRvb2xzIGludm9sdmVkIGhlcmU/CgoyLiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIGFk
ZCBhbnkgdGFncyAobGlrZSDigJxGaXhlc+KAnSBhbmQg4oCcQ2PigJ0pIGFjY29yZGluZ2x5Pwog
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVz
LnJzdD9oPXY3LjAtcmM0I24xNDUKCjMuIFdvdWxkIHlvdSBsaWtlIHRvIHJlZmVyIHRvIHRoZSBm
dW5jdGlvbiDigJxfX3NldF9tZW1vcnnigJ0gaW4gdGhlIHN1bW1hcnkgcGhyYXNlPwoKClJlZ2Fy
ZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
