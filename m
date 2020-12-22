Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C50C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 19:51:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7940122583
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 19:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7940122583
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bJtGFoh5rMsDdpZL0To5CamLgiAzp7jtI5/KgqQbwHw=; b=gMTuzi0QEAf0rcAvVcY14cl1t
	OtSsTBaCHeSHB/C/kQbBZhcz8IvUDP7333HbW+lf/aPpIm59gppnZDehF8Y/WVRDYm58sjLIFPD9O
	YrG5Ki5PF7zqWRR9ZAiWvwBpGp5dHC2d8TvVi/30o1UC+qaIeUeFvhMQbIQO0tcpEFBkcs0svUjgu
	s3V7VCutk67vzxZkvgA7WGBQYv2RvI+1Yw9X1AJmhnIC0oBhm3FWyo26x2bMr8Hve1/s1v+Kgbbt3
	zMgjPuUlanONlUvfmWd4Q18rB8NL7xVBPQ63VDdLsBfJBjZ3DsZsTRzOhuBARMTd57SLJm9F0oQBF
	9N4Z4tfxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krngq-0002th-MX; Tue, 22 Dec 2020 19:51:24 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krngo-0002sY-IL
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 19:51:23 +0000
Received: from [192.168.1.155] ([95.118.68.26]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MG9Xu-1kqjsd39oK-00GbOJ; Tue, 22 Dec 2020 20:51:15 +0100
Subject: Re: [PATCH v3] drivers: clk: make gpio-gated clock support optional
To: Stephen Boyd <sboyd@kernel.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201202123446.21902-1-info@metux.net>
 <160842266128.1580929.15786525540819499647@swboyd.mtv.corp.google.com>
 <160844222880.1580929.12780984836660049815@swboyd.mtv.corp.google.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <d98dff5f-5880-9ecf-b102-79ec64a11537@metux.net>
Date: Tue, 22 Dec 2020 20:51:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <160844222880.1580929.12780984836660049815@swboyd.mtv.corp.google.com>
Content-Language: tl
X-Provags-ID: V03:K1:g6HZ6qzFtmVXhWZbGpRPlXB6w4VSxc6zp0//8UzR9CPGvlhGagq
 YF7m3h3xt+rRpKRQZH3ME0SJBafNNhyN+MN8UDt/z2e5orDqWL8uxlmvQ25sJM45IfG06ua
 9rO7pzkR+cMwxF98WuOe6jVdFs1dWL0AXbEVr3Z31aByWwmjpceWT0MN+AhWemXCu/0qLXp
 OrZPU3w2vStxQ7WKS/DsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SI6s/J81h8I=:DuVCewtS/SQfXUaPMapQZd
 oL1GhVuV71HDvs8uKKX3W+9IJC+oribbWSkVLne14ANICco2xQIZ97pDG6DK1h8yBQwV4fFWM
 uQvJn0/N66F52q8ebOiAL7gzc9zJ4XF7YGA8qFFaWOYrtwJe5YBd8SYeGPHJUWPvH/QAzR17c
 iq0DZBY7jvoQq9HGt2Mamm41VoT8+io/o1/1KMDe9jlegiQZOAahjqT6zzLxSWnNYxF2FBnYo
 IBV4Vnmljc7Fj2cZ1imCyJyQToPvyPbACm1hLVJKmCN66OqPeuhXwidLyxuEAtgvBpXlCNQcF
 rTEpvi35+5x4Ad1TwYxcRV/BZ53Z8kPjHr8ambA2xbV4XJuM2EKDxgJtmWU6LI9SC2ueV7vr/
 I/Z39sVlRiQS7u9lADvcNjCA1Y2rvaW931gGzY/V7jwpJWLdHvmvX6NujBFy6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_145122_838077_EAF49A93 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAuMTIuMjAgMDY6MzAsIFN0ZXBoZW4gQm95ZCB3cm90ZToKCj4gSXQgbG9va3MgbGlrZSBp
dCBuZWVkcyB0byBiZSBhIGJvb2wgS2NvbmZpZyB0byBtYXRjaCBob3cgaXQgdXNlZCB0byBiZS4K
PiBBIG1vZHVsZSB3b3VsZCBiZSBpbnRlcmVzdGluZywgYnV0IHdvdWxkIHJlcXVpcmUgbW9yZSBj
aGFuZ2VzCj4gcHJlc3VtYWJseSwgbGlrZSBnZXR0aW5nIHJpZCBvZiBidWlsdGluX3BsYXRmb3Jt
X2RyaXZlcigpIGFuZCByZXBsYWNpbmcKPiBpdCB3aXRoIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIo
KS4KCk9rYXksIEknbGwgcmV3b3JrIGl0IGFuZCBwb3N0IGEgdjQuCgp0aHguCi0tbXR4CgoKLS0g
Ci0tLQpIaW53ZWlzOiB1bnZlcnNjaGzDvHNzZWx0ZSBFLU1haWxzIGvDtm5uZW4gbGVpY2h0IGFi
Z2Vow7ZydCB1bmQgbWFuaXB1bGllcnQKd2VyZGVuICEgRsO8ciBlaW5lIHZlcnRyYXVsaWNoZSBL
b21tdW5pa2F0aW9uIHNlbmRlbiBTaWUgYml0dGUgaWhyZW4KR1BHL1BHUC1TY2hsw7xzc2VsIHp1
LgotLS0KRW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNvbnN1bHQKRnJlZSBzb2Z0d2FyZSBhbmQg
TGludXggZW1iZWRkZWQgZW5naW5lZXJpbmcKaW5mb0BtZXR1eC5uZXQgLS0gKzQ5LTE1MS0yNzU2
NTI4NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
