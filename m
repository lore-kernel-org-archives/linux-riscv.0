Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5498C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 14:06:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BA0B20825
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 14:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rKwfBbUV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BA0B20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b3oqHu3g/GT5hgdd7PmdL5FNz6mJbROiCuzJCm4/Jp0=; b=rKwfBbUVbuqAc77V/hjwpn9ZD
	tM01ss1fPmyJPIvYGsy/z8HbXAtluOV8as/T5ZHyZoDPc1Cm03Z5ZwkBq1UGxnvR17eNti4BVUKmI
	fYnTvQgT5LG++FW7bciksl8u+X3YCV4kaOSdnmoIE8TKiOQN7xbg7NTkjfGDwJk3qD31NhorK/Djr
	7653fXi+L6cBBAK6oJASQaoBET0Cns62vak4mnhMqa/RMAGJY7eJj4dMgtx8ql6PuPAM6rUPXk1oR
	td2pX+Mrn6ytiFAs++NlVH5B+6+UGo6MDTFd8fCngCpel2Qsp/dMtYho7xFv+W4a3r/MfADC5yQ8Z
	PwYZWbDIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw4Wt-0000aT-SH; Thu, 16 Jul 2020 14:06:31 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw4Vw-0000JU-Mz
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 14:05:38 +0000
Received: from av3.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 06GE51VM014188; Thu, 16 Jul 2020 14:05:03 GMT
X-AuditID: 8b5b014d-257ff700000045c5-2d-5f105e8d5e56
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 A1.FD.17861.D8E501F5; Thu, 16 Jul 2020 17:05:01 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 16 Jul 2020 17:04:59 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re:
 BPATCH=20v2=200/3=5D=20RISC-V=3A=20Add=20kexec/kdump=20support=E2=80=8B?=
Organization: FORTH
In-Reply-To: <mhng-fc462e0b-31c6-4588-8801-41458430fffa@palmerdabbelt-glaptop1>
References: <mhng-fc462e0b-31c6-4588-8801-41458430fffa@palmerdabbelt-glaptop1>
Message-ID: <8958a0b0623fbcbb3d1f84f96371226a@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.9
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsXSHT1dWbc3TiDeYPtyXYuWD+9YLRat+M5i
 seXwI2aLbZ9b2Cya351jt3h5uYfZom0Wv0XTi+vMFh/uzmZz4PSY+vsMi0fXjxmsHm9evmTx
 eLjpEpPH5iX1Hpear7N7tB/oZgpgj+KySUnNySxLLdK3S+DK2Hn2EnNBJ3PF1tPrmBsYtzJ1
 MXJySAiYSGybPIWli5GLQ0jgKKPE+5tHGSESphKz93aC2bwCghInZz5hAbGZBSwkpl7Zzwhh
 y0s0b53N3MXIwcEioCpx5bASSJhNQFNi/qWDYOUiAuoSB17fYQaZzyzQziRxbspJsHphgQiJ
 Jb0BIDX8AsISn+5eZAWxOQX8Je5c7AYbLyTgJ7Fgx0kmiBNcJPqu97NAnKYi8eH3A3YQW1RA
 WeLm4efsExgFZyG5dBaSS2chuXQBI/MqRoHEMmO9zORivbT8opIMvfSiTYzguGD03cF4e/Nb
 vUOMTByMhxglOJiVRHh5uHjjhXhTEiurUovy44tKc1KLDzFKc7AoifPmcS+PFRJITyxJzU5N
 LUgtgskycXBKNTCxmr1dklaV+l7vvUdaMccL2XNFR5myUo8q9Fw6vWVlh7N3s1Lt7vDZ96d9
 epny1vZDZfDsbeKV4Xc/dv5USNTMyLz583Hx/x33di7pMnpTvjWROUutmiHwfnTEHjmxR6vn
 9i87k7Bpz2WrjFcRaxS+8FyT2Ld/eciSuPDcV5aOXGxBFYZeT7rmJSf/2xi5Q+r4i9kG/3Kf
 rueO8Fo7qdqBr07vNEeL+b7X01WfrJOyt7CQCGrXMzgekHGz/Mhip/XF97h6dn6d+3mRU9Qk
 tvNXrheunrnDbZ3Iw0l27Q9OGOQnTXj6sSsq58mrZztnFK9bFnjiHs/lZRtu7/6tLPb1jS/n
 3e3bmye7bkqKfK3WosRSnJFoqMVcVJwIADDCwmr6AgAA
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 16 Jul 2020 14:05:03 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 16 Jul 2020 14:05:03 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_100533_107986_FEB7EFC3 
X-CRM114-Status: UNSURE (   6.62  )
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
Cc: david.abdurachmanov@sifive.com, anup@brainfault.org,
 Atish Patra <Atish.Patra@wdc.com>, yibin_liu@c-sky.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMC0wNy0xMSAwNjo1OSwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IFRoZXJlJ3Mgc29tZSBmYWlybHkgc3RyYWlnaHQtZm9yd2FyZCB0byBmaXggaXNzdWVzIGhlcmUs
IExNSyBpZiB5b3UgCj4gd2FudCB0byBmaXgKPiB0aGVtIG9yIGlmIHlvdSB3YW50IG1lIHRvIHRh
a2UgaXQgb3Zlci4KPiAKPiBUaGFua3MhCgpUaGFua3MgYSBsb3QgZm9yIHRoZSBmZWVkYmFjayAh
IEknbGwgc2VuZCBhIHBhdGNoIHRvIGZpeCB0aGUgaXNzdWVzIHdpdGggCmtleGVjIChhbHNvIHRo
ZSBvbmUgY2F1Z2h0IGJ5IHRoZSBidWlsZCBib3QpLCBhbm90aGVyIHBhdGNoIGZvciB0aGUgCmlv
cmVzb3VyY2VzIGFuZCByZS1zZW5kIGtkdW1wL2NyYXNoa2VybmVsLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
