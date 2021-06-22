Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300C7C4743C
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 01:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEB206124B
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 01:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEB206124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TditLrqxVQpxbDPegZ4CSFwHgtOjQYDacftwjDYJ6SE=; b=aY+IaQWtdd8elgE3q3/iuO5cq7
	jLyWnRor6a+FyT+3MKYC2UfSoBUKhoIci4xyWQtoUhQYMM4ymfFAR8U0qTWI6u2NgLo5f1WRErodv
	IzMje0100brFyaB6nl5OhRAPfmhtP4Q+jfCC7pyS8qpV1oKUHhM6bjEftHOwmNPGqAugQUx5wiFiS
	lOFXJR47ViwVPAFiQEUVS+hd//OW1FUB51D5nLLDe4dgjXxnAuPDQPdCUn5lwe4xeTMnpe47RmuqN
	3nuswiIAAvQ7h2Q0kBWA0dWCxkcYEWWp2cUFtQ4bUAEYEeHF5l6OkTZqTlRsHEZGPuGUpbAf642bS
	h6Q9lG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvUtU-005IW9-A3; Tue, 22 Jun 2021 01:08:00 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvUtP-005IUL-J5
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 01:07:58 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15M17riu036032
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 04:07:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1624324068; x=1626916068;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q+eQRJ20he4Y2U54oc/fPHuAWqGk0e4b8CGa0ma1wzs=;
 b=XSqG8GUt1WyotyIfHlNwbGteMjQzpf8PXDQ2RFocwrKD3CtIlhCrWm8GANr33+sZ
 yjVxt3o7QDYNwx+qwfophoWurLsqJRgHzSmZpR1XfBicwqE2fIkxkATp5znfnF7K
 Oo/l9JLUr5wS2L7TaUEJglcSYQlidlZh/BMLJQ01r6hYT8RgHbqVbmsHin1oGRvF
 rrSkd/KKqEUyM0tZhVz+3xeOQBw4l8Q4kZJHutBv3FIUbHJrmLTR++S1iQhk58mj
 2QT+5dd5IqXSn1d5R9Kp7JbS6VrKisJscyKq6LZRtoAVMc6+BYw5H0RqpYaZyA7r
 JSayz6ILynmyQ1ykwEDO1A==;
X-AuditID: 8b5b014d-96ef2700000067b6-6d-60d137e4120b
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 0E.60.26550.4E731D06; Tue, 22 Jun 2021 04:07:48 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 22 Jun 2021 04:07:47 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Akira
 Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 3/3] riscv: optimized memset
Organization: FORTH
In-Reply-To: <20210617152754.17960-4-mcroce@linux.microsoft.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-4-mcroce@linux.microsoft.com>
Message-ID: <17cd289430f08f2b75b7f04242c646f6@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsXSHT1dWfeJ+cUEg1+bFC22vbvKYrH19yx2
 i0UrvrNYTO2Jt9ixdDOTxb0Vy9gtXuxtZLF4smYmo0XHrq8sFpd3zWGz2Pa5hc3i4q/5jBYv
 L/cwW7TN4nfg8+ifPYXN493vZYweb16+ZPE43PGF3aOj7x+Lx85Zd9k9Nq3qZPP4tf0ok8fm
 JfUel5qvs3t83iTn0X6gmymAJ4rLJiU1J7MstUjfLoErY8P7xewFn3gqWo+lNTC+4exi5OSQ
 EDCReLd8N3sXIxeHkMBRRom/vy4wQiRMJWbv7QSzeQUEJU7OfMICYjMLWEhMvbKfEcKWl2je
 OpsZxGYRUJXY8fUIO4jNJqApMf/SQbB6EQFdiYsfDoMtYBaYziLxq3c3G0hCWMBYYsHylUwg
 Nr+AsMSnuxdZQWxOAQeJo8fXgdlCAqUSq08cYYU4wkXizIqpzBDHqUh8+P0AaCgHhyiQvXmu
 0gRGwVlITp2F5NRZSE5dwMi8ilEgscxYLzO5WC8tv6gkQy+9aBMjOO4YfXcw3t78Vu8QIxMH
 4yFGCQ5mJRHemykXEoR4UxIrq1KL8uOLSnNSiw8xSnOwKInz8upNiBcSSE8sSc1OTS1ILYLJ
 MnFwSjUwNTmumb1hzpHkX257uzV+znTdMInr1NPYsL2aOUzVVcL9XQqySf3u5mW+Ciu/Vm8t
 uHhZvmBN906xfnfXqj8yN4Tib97tW/mN857FcZblbCKWc+wY/vr8nmQixiUss+gL1/X5Se93
 uHYd+ydy8u/Bo1qmb11CQiZPfVGc38+0vPQzj4TU1zi7V0rnapdZer85l7an3zbMb4Xbh+Ml
 Og1ic9bJ3Ei+tP6t68cKjmfONhvcjX6t6ftvsf2r7sErS5UNvBJO69lvNa+ZPX1Rq6/MR6da
 rt+TODsWTgwN6rhoM+n//5UBxTd/pJetttjlVilyIs1kxYHd/9Tt1JIuhGzlUta+bx//N4Pl
 duVON7sTSizFGYmGWsxFxYkAJG208yoDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_180756_073138_79D586D5 
X-CRM114-Status: GOOD (  12.56  )
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

zqPPhM65z4IgMjAyMS0wNi0xNyAxODoyNywgTWF0dGVvIENyb2NlIM6tzrPPgc6xz4jOtToKPiAr
Cj4gK3ZvaWQgKl9fbWVtc2V0KHZvaWQgKnMsIGludCBjLCBzaXplX3QgY291bnQpCj4gK3sKPiAr
CXVuaW9uIHR5cGVzIGRlc3QgPSB7IC51OCA9IHMgfTsKPiArCj4gKwlpZiAoY291bnQgPj0gTUlO
X1RIUkVTSE9MRCkgewo+ICsJCWNvbnN0IGludCBieXRlc19sb25nID0gQklUU19QRVJfTE9ORyAv
IDg7CgpZb3UgY291bGQgbWFrZSAnY29uc3QgaW50IGJ5dGVzX2xvbmcgPSBCSVRTX1BFUl9MT05H
IC8gODsnIGFuZCAnY29uc3QgCmludCBtYXNrID0gYnl0ZXNfbG9uZyAtIDE7JyBmcm9tIHlvdXIg
bWVtY3B5IHBhdGNoIHZpc2libGUgdG8gbWVtc2V0IGFzIAp3ZWxsIChzdGF0aWMgY29uc3QuLi4p
IGFuZCB1c2UgdGhlbSBoZXJlIChtYXNrIHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0byAKYmUgbmFt
ZWQgYXMgd29yZF9tYXNrKS4KCj4gKwkJdW5zaWduZWQgbG9uZyBjdSA9ICh1bnNpZ25lZCBsb25n
KWM7Cj4gKwo+ICsJCS8qIENvbXBvc2UgYW4gdWxvbmcgd2l0aCAnYycgcmVwZWF0ZWQgNC84IHRp
bWVzICovCj4gKwkJY3UgfD0gY3UgPDwgODsKPiArCQljdSB8PSBjdSA8PCAxNjsKPiArI2lmIEJJ
VFNfUEVSX0xPTkcgPT0gNjQKPiArCQljdSB8PSBjdSA8PCAzMjsKPiArI2VuZGlmCj4gKwoKWW91
IGRvbid0IGhhdmUgdG8gY3JlYXRlIGN1IGhlcmUsIHlvdSdsbCBmaWxsIGRlc3QgYnVmZmVyIHdp
dGggJ2MnIAphbnl3YXkgc28gYWZ0ZXIgZmlsbGluZyB1cCBlbm91Z2ggJ2MncyB0byBiZSBhYmxl
IHRvIGdyYWIgYW4gYWxpZ25lZCAKd29yZCBmdWxsIG9mIHRoZW0gZnJvbSBkZXN0LCB5b3UgY2Fu
IGp1c3QgZ3JhYiB0aGF0IHdvcmQgYW5kIGtlZXAgCmZpbGxpbmcgdXAgZGVzdCB3aXRoIGl0LgoK
PiArI2lmbmRlZiBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+ICsJCS8q
IEZpbGwgdGhlIGJ1ZmZlciBvbmUgYnl0ZSBhdCB0aW1lIHVudGlsIHRoZSBkZXN0aW5hdGlvbgo+
ICsJCSAqIGlzIGFsaWduZWQgb24gYSAzMi82NCBiaXQgYm91bmRhcnkuCj4gKwkJICovCj4gKwkJ
Zm9yICg7IGNvdW50ICYmIGRlc3QudXB0ciAlIGJ5dGVzX2xvbmc7IGNvdW50LS0pCgpZb3UgY291
bGQgcmV1c2UgJiBtYXNrIGhlcmUgaW5zdGVhZCBvZiAlIGJ5dGVzX2xvbmcuCgo+ICsJCQkqZGVz
dC51OCsrID0gYzsKPiArI2VuZGlmCgpJIG5vdGljZWQgeW91IGFsc28gdXNlZCBDT05GSUdfSEFW
RV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyBvbiB5b3VyIAptZW1jcHkgcGF0Y2gsIGlzIGl0
IHdvcnRoIGl0IGhlcmUgPyBUbyBiZWdpbiB3aXRoIHJpc2N2IGRvZXNuJ3Qgc2V0IGl0IAphbmQg
ZXZlbiBpZiBpdCBkaWQgd2UgYXJlIHRhbGtpbmcgYWJvdXQgYSBsb29wIHRoYXQgd2lsbCBydW4g
anVzdCBhIGZldyAKdGltZXMgdG8gcmVhY2ggdGhlIGFsaWdubWVudCBib3VuZGFyeSAod29yc3Qg
Y2FzZSBzY2VuYXJpbyBpdCdsbCBydW4gNyAKdGltZXMpLCBJIGRvbid0IHRoaW5rIHdlIGdhaW4g
bXVjaCBoZXJlLCBldmVuIGZvciBhcmNocyB0aGF0IGhhdmUgCmVmZmljaWVudCB1bmFsaWduZWQg
YWNjZXNzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
