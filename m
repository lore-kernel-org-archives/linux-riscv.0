Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A9EFED3EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1bdKvNrXzYxYDWVDGfhxAz9dTz0OocG3BmQ9GkRMEKc=; b=wj/Hh+m2tW9V1kqYUKVU9liUbx
	pjujqsii85qY0FyBdYQLuGZU2CdDAbTSTWr+UDaKqWpC57xcSLHT36okptY9iP+vR6s24jkt9lcZf
	H9gvseqqdgm7Rx4g7wN8vgVYCEsPhsD/K6o3P+cbBCSkNQI1WHm7AHiOeDDGfNqOPQKKE1zeql6Gt
	vOtbl4Qey8f5maZ8MCIJxP97aUke3D+7DkGbc28KczG3T8SVLJO2T9ZXV0b48NY7hCs4eZ0NNjL5C
	YWQoEAlT9rDmHh48R7hIldRrlTrDw7AC7f0ZDMCqOcFXBqW5tox6shnOGX9duJ6llGz7iRGBQXRy8
	KqdDwVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJYs-0000000DSYs-1R1T;
	Fri, 24 Apr 2026 16:39:26 +0000
Received: from smtp-8fab.mail.infomaniak.ch ([2001:1600:7:10::8fab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJYp-0000000DSXh-2wwb
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 16:39:25 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g2JZX5xb4z1bw;
	Fri, 24 Apr 2026 18:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etik.com;
	s=20210927; t=1777048756;
	bh=yvzmFDBjdRSJ4i05VUWtxqi10FgMXbkB7t064cJuELQ=;
	h=Date:From:Subject:To:Cc:From;
	b=s+UitPr7p1EBqCuAWxS2QKsY49XXRHsxsQCyBvuB1t8pCgs1qUvdYqyXgndKVQJDn
	 6i9e7/KlfqqAGEAn63LWgMdaRBFrtLubbRVIFnSYYe+V3p17xvazXbg9/aCXNWDpc/
	 8igXC8/RGqS02Q1VLNqR3A1QsELMikGiSgVJdQy8=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4g2JZW25mWzpgP;
	Fri, 24 Apr 2026 18:39:15 +0200 (CEST)
Message-ID: <75820aee-f842-4f40-983b-f360ae6e6d29@etik.com>
Date: Fri, 24 Apr 2026 18:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Baptiste Le Duc <baptiste.leduc@etik.com>
Subject: [RFC] xen/riscv: per-CPU devid setup for Xen event channel IRQ on
 IMSIC
To: linux-riscv@lists.infradead.org
Cc: anup@brainfault.org, tglx@linutronix.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, oleksii.kurochko@gmail.com
Content-Language: en-US
Feedback-ID: :c139b6e740aa314:ham:8bba193fd89ba14
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_093924_156722_3B4E06B6 
X-CRM114-Status: UNSURE (   4.45  )
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

SGksCgpXaGlsZSBhZGRpbmcgWGVuL1JJU0MtViBzdXBwb3J0LCB0aGUgZ3Vlc3QgZXZlbnQgY2hh
bm5lbCBpbnRlcnJ1cHQgaXMKYWxsb2NhdGVkIHZpYSBpcnFfb2ZfcGFyc2VfYW5kX21hcCgpIGFn
YWluc3QgdGhlIElNU0lDIGRvbWFpbiBhbmQsIGlmCndlIHJlZmVyIHRvIHRoZSBBUk0gaW1wbGVt
ZW50YXRpb24sIGl0IG11c3QKYmUgZW5hYmxlZC9kaXNhYmxlZCBwZXIgdkNQVSB0aHJvdWdoIGVu
YWJsZV9wZXJjcHVfaXJxKCkgLwpkaXNhYmxlX3BlcmNwdV9pcnEoKSBpbiB0aGUgQ1BVIGhvdHBs
dWcgY2FsbGJhY2tzLgoKV2l0aCBJTVNJQyB1c2luZyBoYW5kbGVfZWRnZV9pcnEgKHRoZSB1cHN0
cmVhbSBkZWZhdWx0KSwKZW5hYmxlX3BlcmNwdV9pcnEoKSBuZXZlciBjbGVhcnMgSVJRRF9JUlFf
RElTQUJMRUQuIFRoYXQgZmxhZyBpcyBzZXQgYXQKaXJxX2Rlc2MgYWxsb2NhdGlvbiB0aW1lIChp
cnFkZXNjLmMpIGFuZCBpcyBvbmx5IGNsZWFyZWQgYnkKaXJxX3N0YXJ0dXAoKSwgd2hpY2ggaXMg
Y2FsbGVkIGZyb20gX19zZXR1cF9pcnEoKSBvbmx5IHdoZW4KaXJxX3NldHRpbmdzX2Nhbl9hdXRv
ZW5hYmxlKCkgcmV0dXJucyB0cnVlLgoKaXJxX3NldF9wZXJjcHVfZGV2aWQoKSBzZXRzIElSUV9O
T0FVVE9FTiAodmlhIGlycV9zZXRfcGVyY3B1X2RldmlkX2ZsYWdzKSwKc28gaXJxX3N0YXJ0dXAo
KSBpcyBpbnRlbnRpb25hbGx5IHNraXBwZWQgZm9yIHBlcmNwdS1kZXZpZCBJUlFzLgplbmFibGVf
cGVyY3B1X2lycSgpIGNhbGxzIGlycV9wZXJjcHVfZW5hYmxlKCkgd2hpY2ggZG9lcyBpcnFfZW5h
YmxlL3VubWFzawpvbiB0aGUgY2hpcCBidXQgbmV2ZXIgdG91Y2hlcyBJUlFEX0lSUV9ESVNBQkxF
RC4KClJlc3VsdDogaGFuZGxlX2VkZ2VfaXJxKCkgaGl0cyBpcnFfY2FuX2hhbmRsZV9hY3Rpb25z
KCkg4oaSIGNoZWNrcwppcnFkX2lycV9kaXNhYmxlZCgpIOKGkiByZXR1cm5zIGZhbHNlIOKGkiBJ
UlEgc2lsZW50bHkgZHJvcHBlZC4KClRoaXMgd2FzIGNvbmZpcm1lZCBieSBsb2dzOgoKIMKgIFhF
Tl9UUkFDRSBpcnE9MTIgcGVyY3B1X2VuYWJsZSBjcHU9MCBJUlFEX0RJU0FCTEVEPTEKIMKgIFhF
Tl9UUkFDRSBpcnE9MTIgaGFuZGxlX2VkZ2UgRFJPUCBJUlFEX0RJU0FCTEVEPTEgYWN0aW9uPS4u
LgoKV2hhdCB3ZSB0cmllZAotLS0tLS0tLS0tLS0tCi0gcmVxdWVzdF9pcnEoKSBjb3JyZWN0bHkg
d29ya3Mgd2l0aCB1cHN0cmVhbSBJTVNJQyB3aGljaCB1c2VzIApoYW5kbGVfZWRnZV9pcnEgd2l0
aCBubwppcnFfc2V0X3BlcmNwdV9kZXZpZCgpIGJ1dCBpdCBtZWFucyB3ZSBvbmx5IGNhbiBoYXZl
IG9uZSB2Q1BVIHdoaWNoIHdpbGwgCmFsd2F5cyBoYW5kbGUgdGhlIGlycSwKYW5kIHdlIGRvbid0
IHdhbnQgdGhhdC4KCi0gQWRkaW5nIGlycV9zZXRfcGVyY3B1X2RldmlkKCkgKyBzd2l0Y2hpbmcg
dG8gaGFuZGxlX3BlcmNwdV9kZXZpZF9pcnEgaW4KaW1zaWNfaXJxX2RvbWFpbl9hbGxvYygpIGZp
eGVzIHRoZSBYZW4gY2FzZSBidXQgYnJlYWtzIGFsbCBvdGhlciBJTVNJQwp1c2VycyAoUENJIE1T
SSwgcGxhdGZvcm0gZGV2aWNlcykgdGhhdCBjYWxsIHJlcXVlc3RfaXJxKCksIHNpbmNlCnJlcXVl
c3RfdGhyZWFkZWRfaXJxKCkgcmVqZWN0cyBJUlFzIG1hcmtlZCBfSVJRX1BFUl9DUFVfREVWSUQ6
CgogwqAgV0FSTklORzogQ1BVOiAwIFBJRDogMSBhdCBrZXJuZWwvaXJxL21hbmFnZS5jOjIxMDEK
IMKgIHJlcXVlc3RfdGhyZWFkZWRfaXJxKzB4ODAvMHgxMmMKClRoZXJlZm9yZSwgZG8geW91IGhh
dmUgYW55IHJlY29tbWVuZGF0aW9ucyBvbiBob3cgc2hvdWxkIEkgaGFuZGxlIHRoaXMgCmNhc2Ug
PwoKVGhhbmtzLApCYXB0aXN0ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
