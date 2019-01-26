Return-Path: <SRS0=snlg=QC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577F5C282C7
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 26 Jan 2019 09:24:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 200DD218FF
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 26 Jan 2019 09:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JvR6mzF2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c5fkK043"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 200DD218FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5MLEFj67kaCEgpkU/YJzgFt89J5s+1rYoB2D2vW7Esc=; b=JvR6mzF216Is8UPeKb1etF03+
	I2fvdMX3+gYQoGrxJnkzmCJderHT/sAZbnhzoky/paJ9uGCUIIv2WN5JGUwfUxS/N5a+HBkR+wkwO
	EzaABTNzz7DjkNvqMue63Cs8FBGDEPxAgvxfbhF30hwBh8mLCBAaUGkqZl8VTR6A4nCdpUqhsA5Dp
	gAAWymXwK47cino9g84xCjTZlGYTOnsgVog0z/M0qDz5z6sjXMwZ8T1sLADvzzODd0M04O4u7eKxi
	vlmnZzz3fjopWII8xWxnYBs/Fi6UJy7tWr4/ZZ8qs0ORs30TzZeceZd1HUJkKhXxIIDhagRa7z+a5
	3cA87UG8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnKCB-0007Ts-Jv; Sat, 26 Jan 2019 09:24:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnKCB-0007Tl-1D
 for linux-riscv@bombadil.infradead.org; Sat, 26 Jan 2019 09:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+77Je2vMTvbJWlsE3OdSNHO2fVIv6xLeO9AVGfPl2rQ=; b=c5fkK0432WcBBMg8XWQg/4WXJN
 x6wXVXzo9Oqt7Yx39WcSSIZye7dQ7x1IbH36OxmEZM8cI7ZE3lKX1wa5mowE2z+vXyYZHXARYwOBp
 ahBm0KBODTAdduMHwEJExT8KXCK2jaFU17flUL+sUWSDRwEAxySFOUB766s5uKKlqGV/b7NLse/6Y
 va+KUltPREG2iWrfzwehwpB1E9yqDFdFyKF8nUVr7yLxkBr/43Qy9X5RgKEmXzK8mphfPrk2P83YU
 U2sR/Ygh9MAmTPw6of1oCQAP2e69XaYlROjLr/IScA3QunHWkfLhiaplpwdRHNmQ11A7pobCMfEfu
 P2Ju4FJQ==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnKC7-0000H8-RW
 for linux-riscv@lists.infradead.org; Sat, 26 Jan 2019 09:24:09 +0000
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2E87610000A;
 Sat, 26 Jan 2019 09:23:22 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 3/3] riscv: Adjust mmap base address at a third of task
 size
References: <c45285f7-9b05-9f04-a5a0-5d5dc075bb1b@ghiti.fr>
 <mhng-390e0f09-77a1-4943-99a6-6faba4632383@palmer-si-x1c4>
Message-ID: <24d86d8d-e1c4-6221-3f5c-84fdaa56e5b4@ghiti.fr>
Date: Sat, 26 Jan 2019 04:23:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <mhng-390e0f09-77a1-4943-99a6-6faba4632383@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190126_092407_989558_9113CD93 
X-CRM114-Status: GOOD (  20.78  )
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
Cc: mingo@kernel.org, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 ndesaulniers@google.com, aghiti@upmem.com,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 mike.kravetz@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8yNS8xOSAyOjAyIFBNLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBUdWUsIDE1IEph
biAyMDE5IDA4OjAyOjA2IFBTVCAoLTA4MDApLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4g
T24gTW9uLCBEZWMgMTAsIDIwMTggYXQgMDY6MjE6NDZBTSArMDAwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+Pj4gVGhpcyByYXRpbyBpcyB0aGUgbW9zdCB1c2VkIGFtb25nIGFsbCBvdGhlciBh
cmNoaXRlY3R1cmVzIGFuZCBtYWtlCj4+PiBpY2FjaGVfaHlnaWVuZSBsaWJodWdldGxiZnMgdGVz
dCBwYXNzOiB0aGlzIHRlc3QgbW1hcCBsb3RzIG9mCj4+PiBodWdlcGFnZXMgd2hvc2UgYWRkcmVz
c2VzLCB3aXRob3V0IHRoaXMgcGF0Y2gsIHJlYWNoIHRoZSBlbmQgb2YKPj4+IHRoZSBwcm9jZXNz
IHVzZXIgYWRkcmVzcyBzcGFjZS4KPj4KPj4gVGhpcyBkb2VzIGluZGVlZCBsb29rIGNvbW1vbiwg
c28gdGhpcyBsb29rcyBzZW5zaWJsZSB0byBtZSBhbmQgbWlnaHQKPj4gYmUgd29ydGggcGlja2lu
ZyB1cCBBU0FQIGV2ZW4gd2l0aG91dCB0aGUgaHVnZXRsYiBzdXBwb3J0Ogo+Pgo+PiBSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4KPiBNYWtlcyBzZW5zZSB0byBt
ZS7CoCBJJ2xsIHRha2UgaXQgaW4gdG8gdGhlIG5leHQgUFIuCj4KPj4gSSB3b25kZXIgaWYgd2Ug
c2hvdWxkIHByb3ZpZGUgdGhpcyB2YWx1ZSBhcyBhIGRlZnVhbHQKPj4gVEFTS19VTk1BUFBFRF9C
QVNFIGlmIHRoZSBhcmNoaXRlY3R1cmUgZG9lc24ndCBwcm92aWRlIG9uZS4KPgo+IExvb2tzIGxp
a2UgYXJtNjQgZGl2aWRlcyBieSA0IGluc3RlYWQgb2YgMy7CoCBJdCBhcHBlYXJzIHRvIGhhdmUg
YmVlbiAKPiB0aGF0IHdheSBzaW5jZSB0aGUgc3RhcnQ6Cj4KPiDCoMKgIGNvbW1pdCA0ZjA0ZDhm
MDA1NDUxMTBhMGU1MjVhZTJmYjYyYWIzOGNiNDE3MjM2Cj4gwqDCoCBBdXRob3I6IENhdGFsaW4g
TWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4gwqDCoCBEYXRlOsKgwqAgTW9uIE1h
ciA1IDExOjQ5OjI3IDIwMTIgKzAwMDAKPiDCoMKgIMKgwqDCoMKgwqDCoCBhcm02NDogTU1VIGRl
ZmluaXRpb25zCj4gwqDCoMKgwqDCoMKgIC4uLgo+Cj4gc28gbWF5YmUgdGhhdCdzIHRoZSByaWdo
dCBhbnN3ZXI/CgpNYXliZSwgSSBjYW4ndCBmaW5kIGV4cGxhbmF0aW9ucyByZWdhcmRpbmcgdGhp
cyBhcmJpdHJhcnkgdmFsdWUuCgo+Cj4gT24gVHVlLCAxNSBKYW4gMjAxOSAxMDo1NDoyNyBQU1Qg
KC0wODAwKSwgYWxleEBnaGl0aS5mciB3cm90ZToKPj4gT24gMS8xNS8xOSA0OjAyIFBNLCBDaHJp
c3RvcGggSGVsbHdpZyB3cm90ZToKPj4+IE9uIE1vbiwgRGVjIDEwLCAyMDE4IGF0IDA2OjIxOjQ2
QU0gKzAwMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+PiBUaGlzIHJhdGlvIGlzIHRoZSBt
b3N0IHVzZWQgYW1vbmcgYWxsIG90aGVyIGFyY2hpdGVjdHVyZXMgYW5kIG1ha2UKPj4+PiBpY2Fj
aGVfaHlnaWVuZSBsaWJodWdldGxiZnMgdGVzdCBwYXNzOiB0aGlzIHRlc3QgbW1hcCBsb3RzIG9m
Cj4+Pj4gaHVnZXBhZ2VzIHdob3NlIGFkZHJlc3Nlcywgd2l0aG91dCB0aGlzIHBhdGNoLCByZWFj
aCB0aGUgZW5kIG9mCj4+Pj4gdGhlIHByb2Nlc3MgdXNlciBhZGRyZXNzIHNwYWNlLgo+Pj4gVGhp
cyBkb2VzIGluZGVlZCBsb29rIGNvbW1vbiwgc28gdGhpcyBsb29rcyBzZW5zaWJsZSB0byBtZSBh
bmQgbWlnaHQKPj4+IGJlIHdvcnRoIHBpY2tpbmcgdXAgQVNBUCBldmVuIHdpdGhvdXQgdGhlIGh1
Z2V0bGIgc3VwcG9ydDoKPj4+Cj4+PiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+Cj4+Pgo+Pj4gSSB3b25kZXIgaWYgd2Ugc2hvdWxkIHByb3ZpZGUgdGhpcyB2YWx1
ZSBhcyBhIGRlZnVhbHQKPj4+IFRBU0tfVU5NQVBQRURfQkFTRSBpZiB0aGUgYXJjaGl0ZWN0dXJl
IGRvZXNuJ3QgcHJvdmlkZSBvbmUuCj4+Cj4+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuCj4+IEkg
dGhpbmsgeW91J3JlIHJpZ2h0IHJlZ2FyZGluZyBoYXZpbmcgYSBkZWZhdWx0IHZlcnNpb24gb2YK
Pj4gVEFTS19VTk1BUFBFRF9CQVNFLAo+PiBJIHdpbGwgcHJvcG9zZSBzb21ldGhpbmcuCj4KPiBT
b3VuZHMgZ29vZCB0byBtZS7CoCBJIGRvbid0IHNlZSBhbnl0aGluZywgc28gSSdtIHN0aWxsIGdv
aW5nIHRvIHRha2UgCj4gdGhlIHBhdGNoIC0tIHdlIGNhbiBhbHdheXMgZHJvcCB0aGUgcmVkdW5k
YW50IGRlZmluaXRpb24gbGF0ZXIuCgpJIGRpZCBub3QgcHJvcG9zZSBhbnl0aGluZyB5ZXQsIEkg
d2lsbCB0YWtlIHRoZSB0aW1lIHRvIGZpbmQgc29tZXRoaW5nIAptb3JlIGNvbnNpc3RlbnQuCgpU
aGFua3MgUGFsbWVyLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
