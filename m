Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D44DC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 19:58:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2534223C8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 19:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/gIp0SW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2534223C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=packi.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jBPASoMD70YAoVeIFquFYkslSXIFlJll7/SMV8vekv0=; b=N/gIp0SWM15MxS
	Iv/mCotnRtRyEiMJx+EElSyeOMuzfP67Hlqocgvj1GFuDqUXJNx/xP9B+qYEzqWukBDNj/0sVklf1
	wPaPZwJ9HZnsHD2fbyKg+LT33eKcFr/jIjVGrg8QA0d8UQN9xVlZd/H6eK/5mLjUbyVXvdOLedFig
	hf81Wk/e7jLuA4GeiuG7naYSQ+fh3oW30CjpmoJu6ZJ37h4Ce7pzXb9udL1mN2T1cOaGU0E3xqz6L
	zuNAcRm/OH1c6pK5KTm0ocnw2iSAFq5q6J8a9WFoYdLXnmfVrNiEnmSRkIcopiNpg95ZyyHcBhV2E
	xU6ItHZuexjUaRDAlMxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMepX-0002dt-UR; Tue, 13 Nov 2018 19:58:35 +0000
Received: from mail.binarylogic.ch ([2a01:4f8:222:24c1::ff02])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMepU-0002bf-5e
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 19:58:34 +0000
Received: from fortknox.localdomain (unknown [192.168.122.1])
 by mail.binarylogic.ch (Postfix) with ESMTP id 49195DF386;
 Tue, 13 Nov 2018 20:58:18 +0100 (CET)
From: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>
To: linux-riscv@lists.infradead.org
Subject: [RFC/RFT 0/2] RISC-V: kprobes/kretprobe support
Date: Tue, 13 Nov 2018 20:58:02 +0100
Message-Id: <20181113195804.22825-1-me@packi.ch>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181113_115832_365921_C3CA40C3 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113195802.H18eKLkopFS0xoFYFe4mwWRxrp7OrZX0Uho5ZktPUrU@z>

SGksCgp0aGlzIGlzIGZpcnN0IHZlcnNpb24gb2Yga3Byb2Jlcy9rcmV0cHJvYmUgc3VwcG9ydCBm
b3IgUklTQy1WLiBNb3N0IG9mCnRoZSBjb2RlIGlzIGJhc2VkIG9uIGFybTY0IGJ1dCBvYnZpb3Vz
bHkgd2l0aG91dCB0aGUgc2luZ2xlLXN0ZXAKZnVuY3Rpb25hbGl0eS4KCkl0IHdpbGwgaW5zZXJ0
IGEgQy5FQlJFQUsgaW5zdHJ1Y3Rpb24gdGhhdCBpcyBsYXRlciBiZWluZyBjYXB0dXJlZC4gVGhl
Cm9ubHkgaW5zdHJ1Y3Rpb24gc3VwcG9ydGVkIGF0IHRoZSBtb21lbnQgaXMgQy5BRERJU1AxNiBh
cyB0aGlzIHNldHMtdXAKdGhlIHN0YWNrIGZyYW1lcyBmb3IgYWxsIHRoZSBmdW5jdGlvbnMgSSd2
ZSB0ZXN0ZWQuCgpJJ3ZlIHRlc3RlZCB0aGlzIG9uIFFFTVUgd2l0aCBtdWx0aXBsZSBDUFVzIGJ1
dCBkb24ndCBoYXZlIGFueSByZWFsCmhhcmR3YXJlIGF2YWlsYWJsZSBmb3IgdGVzdGluZywgYW5k
IGZyb20gZXhwZXJpZW5jZSB0aGF0J3Mgd2hlbiB0aGluZ3MKc3RhcnQgYnJlYWtpbmcuCgpUaGUg
cGxhbiBpcyB0byBleHBhbmQgY29tcHJlc3NlZCBpbnN0cnVjdGlvbnMgdG8gZnVsbCBvbmVzIGFu
ZCBzaW11bGF0ZQp0aG9zZSB0byByZWR1Y2UgdGhlIGRlY29kaW5nIG92ZXJoZWFkIHBlciBpbnRl
cmNlcHRlZCBjYWxsLgoKUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBvYmplY3Rp
b25zIHRvIHBhdGggSSd2ZSBjaG9zZW4gYW5kCndoaWNoIGluc3RydWN0aW9ucyB5b3UgYWJzb2x1
dGVseSBuZWVkIGZvciBhIGZpcnN0IHZlcnNpb24uCgpUbyBlbmFibGUgdGhpcyB5b3UgbmVlZCB0
aGUgZm9sbG93aW5nIGRlZmluZXM6CgpDT05GSUdfRlVOQ1RJT05fVFJBQ0VSPXkKQ09ORklHX0tQ
Uk9CRVM9eQpDT05GSUdfTU9EVUxFUz15CgpUaGUgQ09ORklHX0ZVTkNUSU9OX1RSQUNFUiBpcyBu
b3Qgc3RyaWN0bHkgbmVlZGVkIGJ1dCBtYWtlcyB0ZXN0aW5nCmVhc2llciB1c2luZyBkZWJ1Z2Zz
LgoKQWZ0ZXIgdGhhdCwgYW55IGV4YW1wbGUgZG9jdW1lbnRlZCBpbiAKRG9jdW1lbnRhdGlvbi90
cmFjZS9rcHJvYmV0cmFjZS5yc3Qgc2hvdWxkIHdvcmsuCgpQYXRyaWNrIFN0w6RobGluICgyKToK
ICBSSVNDLVY6IEltcGxlbWVudCBwdHJhY2UgcmVncyBhbmQgc3RhY2sgQVBJCiAgUklTQy1WOiBr
cHJvYmVzL2tyZXRwcm9iZSBzdXBwb3J0CgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA2ICstCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2twcm9iZXMu
aCAgICAgICAgICAgICAgfCAgMzAgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvYmVzLmgg
ICAgICAgICAgICAgICB8ICAyNiArKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wdHJhY2UuaCAg
ICAgICAgICAgICAgIHwgIDM0ICsrCiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL01ha2VmaWxlICAg
ICAgICAgICAgIHwgICAzICsKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9kZWNvZGUtaW5zbi5j
ICAgICAgICB8ICAzOCArKwogYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2RlY29kZS1pbnNuLmgg
ICAgICAgIHwgIDIzICsKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgICAgICAg
ICAgICB8IDQwMSArKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9r
cHJvYmVzX3RyYW1wb2xpbmUuUyB8ICA5MSArKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMv
c2ltdWxhdGUtaW5zbi5jICAgICAgfCAgMzMgKysKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9z
aW11bGF0ZS1pbnNuLmggICAgICB8ICAgOCArCiBhcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyAg
ICAgICAgICAgICAgICAgICAgfCAgOTkgKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMg
ICAgICAgICAgICAgICAgICAgICB8ICAxMyArLQogYXJjaC9yaXNjdi9tbS9mYXVsdC5jICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDI4ICstCiAxNSBmaWxlcyBjaGFuZ2VkLCA4MjggaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Byb2Jlcy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwv
cHJvYmVzL01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvcHJv
YmVzL2RlY29kZS1pbnNuLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9w
cm9iZXMvZGVjb2RlLWluc24uaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVs
L3Byb2Jlcy9rcHJvYmVzLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9w
cm9iZXMva3Byb2Jlc190cmFtcG9saW5lLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2
L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9y
aXNjdi9rZXJuZWwvcHJvYmVzL3NpbXVsYXRlLWluc24uaAoKLS0gCjIuMTcuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
