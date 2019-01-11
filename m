Return-Path: <SRS0=/Bz6=PT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB3BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 14:00:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD1A720872
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 14:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJ6GtCz3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD1A720872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SFvOm05Wo/c+lKwbG85V3tG7sJmj9W/dDWRmieMMv/Q=; b=iJ6GtCz3/QmSCQlXX6wRyfI2R
	zfHRmm1/zG+qvETMJwdICTNgzqDTyJmKYT3KK7Wr+dErgJLsqdFw9vY/I0m8yX93K+fTcb+vSyTzR
	ByrPcZI/+UfyXx6suvtyv29CvIlUSXrykyvwKElhfh6nvIgeJ1ktA6jT6Ud12UwoQnzQAJgeC4FXf
	dt0t64g4XxaSQRxvruHX5DdHTYkEkIgCHmFs+waVVBqVgpJkF8AMDHLr9C0impvHRoRdP54SqjsQ8
	0/vYfcDBqdBZsTu3Znm1+ibenwsC6s8yaAuLhil3wra56UOdIZzbMwD+nYiDdyJLSc+NKax5m8FYz
	q0m4l37Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghxMM-00047O-Ln; Fri, 11 Jan 2019 14:00:30 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghxMG-00046T-1s
 for linux-riscv@lists.infradead.org; Fri, 11 Jan 2019 14:00:30 +0000
X-Originating-IP: 81.250.144.103
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id AA27FE0003;
 Fri, 11 Jan 2019 14:00:09 +0000 (UTC)
Subject: Re: [PATCH 1/3] riscv: Introduce huge page support for 32/64bit kernel
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Alexandre Ghiti <aghiti@upmem.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <20181210062146.24951-2-aghiti@upmem.com>
 <alpine.DEB.2.21.9999.1901102215390.22105@viisi.sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <8a96dec9-ac00-5b3c-e532-2c8ef0e3a537@ghiti.fr>
Date: Fri, 11 Jan 2019 14:58:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1901102215390.22105@viisi.sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_060024_246672_D3409B3D 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, akpm@linux-foundation.org, catalin.marinas@arm.com,
 palmer@sifive.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, linux-riscv@lists.infradead.org, mingo@kernel.org,
 mike.kravetz@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDEvMTEvMjAxOSAwNzoxOCBBTSwgUGF1bCBXYWxtc2xleSB3cm90ZToKPiBIZWxsbyBBbGV4
YW5kcmUsCj4KPiBPbiBNb24sIDEwIERlYyAyMDE4LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4K
Pj4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIGJvdGggNE1CIGh1Z2UgcGFnZSBzdXBwb3J0IGZvciAz
MmJpdCBrZXJuZWwKPj4gYW5kIDJNQi8xR0IgaHVnZSBwYWdlcyBzdXBwb3J0IGZvciA2NGJpdCBr
ZXJuZWwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWdoaXRpQHVwbWVt
LmNvbT4KPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBmZXcgbWlub3IgY2hlY2twYXRjaCBhbmQg
c3RyaWN0IGNoZWNrcGF0Y2gKPiB3YXJuaW5ncywgd2hlbiB0ZXN0ZWQgYWdhaW5zdCBib3RoIHY0
LjIwIGFuZCB2NS4wLXJjMSBjaGVja3BhdGNoIHZlcnNpb25zLgo+IENvdWxkIHlvdSBmaXggdGhv
c2U/ICBUaGUgb3RoZXIgdHdvIHBhdGNoZXMgaW4gdGhlIHNlcmllcyBsb29rIE9LIGZyb20KPiB0
aGF0IHBvaW50IG9mIHZpZXcuCgpZZXMsIEkgaGFkIG5vdGVkIHRob3NlIHdhcm5pbmdzOgoKLSB0
aGUgU1BEWCB3YXJuaW5nIGlzIHdlaXJkLCBpbiBhbGwgKi5jIGZpbGVzLCB0aGUgc2NyaXB0IHNl
ZW1zIHRvIAphY2NlcHQgb25seQogwqAgIi8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wIiBhbmQgbm90ICIvKiAKU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8iLgog
wqAgQnV0IG9uICouaCBmaWxlcywgdGhpcyB0aGUgY29udHJhcnksIG1heWJlIEkgbWlzc2VkIHNv
bWV0aGluZywgSSBhbSBnb2luZwogwqAgdG8gdGFrZSBhIGxvb2sgYXQgdGhlIHNjcmlwdCBzcGR4
Y2hlY2sucHkuCiDCoCBOb3RlIHRoYXQga2VybmVsL2Z0cmFjZS5jIGFuZCBrZXJuZWwvcGVyZl9l
dmVudC5jIHJhaXNlIHRoZSBzYW1lIApzdHJhbmdlIHdhcm5pbmcuCgotIEknbGwgY2hhbmdlIHRo
ZSAicHJpbnRrKEtFUk5fRVJSIiBpbnRvIGEgcHJfZXJyLgoKLSBJJ2xsIGlnbm9yZSB0aGUgbGFz
dCB3YXJuaW5nIHJlZ2FyZGluZyB0aGUgbmV3IGZpbGUuCgpUaGFua3MgZm9yIHlvdXIgZmVlZGJh
Y2sgUGF1bCwKCkFsZXgKCj4KPgo+IC0gUGF1bAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
