Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B7EC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 17:15:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F111B60F39
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 17:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F111B60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DtWIK9D7oKsZowku5EtQ9ORdFAlNv011bkKIm9ECS8=; b=K8xxGxc++tP4ZS
	pER7ieaKOSDCUZfuBZ9nDyHXOwk0fQ1+r8VKR/7QZyna7+XlCMuT8FC6HXn8fav65eNNtG/gaLuLJ
	+nW0vcHrYB5UYLCTrMeS+AgYeoZ19sUlGZbiVQgHMvZPXDmi1qPo+/YHtox7tReVQg4gZ2fL7Wp6Z
	+ciVtevDvQsDychO/lvn9JGpEriYU5ArkWctgF9w4YK9AmpQioouUmxk6lI5UetOCs1cFLqpX8CfK
	nhNTBdVEEu5AYI/wQ/+yn/RPsXcR8/ZbvCJr6/aODpX9SVMbJP+KdRCKC1e/4j7bZXpZxWUj6oHkZ
	ILJHHuWt2v1HRSrF1z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZFwa-005uv1-2r; Sat, 09 Oct 2021 17:15:32 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZFwX-005uuI-AS
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 17:15:30 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 86378100004;
 Sat,  9 Oct 2021 17:15:23 +0000 (UTC)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v7 2/3] powerpc: Move script to check relocations at compile
 time in scripts/
Date: Sat,  9 Oct 2021 19:12:58 +0200
Message-Id: <20211009171259.2515351-3-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009171259.2515351-1-alexandre.ghiti@canonical.com>
References: <20211009171259.2515351-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_101529_525971_AA0005BF 
X-CRM114-Status: GOOD (  13.58  )
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

RnJvbTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgoKUmVsb2NhdGluZyBrZXJuZWwg
YXQgcnVudGltZSBpcyBkb25lIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2Vzcywgc28KaXQg
aXMgbm90IGNvbnZlbmllbnQgdG8gY2hlY2sgZm9yIHJlbG9jYXRpb25zIHRoZXJlIGFuZCByZWFj
dCBpbiBjYXNlIGEKcmVsb2NhdGlvbiB3YXMgbm90IGV4cGVjdGVkLgoKUG93ZXJwYyBhcmNoaXRl
Y3R1cmUgaGFzIGEgc2NyaXB0IHRoYXQgYWxsb3dzIHRvIGNoZWNrIGF0IGNvbXBpbGUgdGltZQpm
b3Igc3VjaCB1bmV4cGVjdGVkIHJlbG9jYXRpb25zOiBleHRyYWN0IHRoZSBjb21tb24gbG9naWMg
dG8gc2NyaXB0cy8Kc28gdGhhdCBvdGhlciBhcmNoaXRlY3R1cmVzIGNhbiB0YWtlIGFkdmFudGFn
ZSBvZiBpdC4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4K
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CkFja2VkLWJ5OiBN
aWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+IChwb3dlcnBjKQotLS0KIGFyY2gv
cG93ZXJwYy90b29scy9yZWxvY3NfY2hlY2suc2ggfCAxOCArKy0tLS0tLS0tLS0tLS0tLS0KIHNj
cmlwdHMvcmVsb2NzX2NoZWNrLnNoICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDc1NSBzY3JpcHRzL3JlbG9jc19jaGVjay5zaAoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy90b29scy9yZWxvY3NfY2hlY2suc2ggYi9hcmNoL3Bvd2VycGMvdG9vbHMvcmVs
b2NzX2NoZWNrLnNoCmluZGV4IDAxNGUwMGU3NGQyYi4uZTM2Nzg5NTk0MWFlIDEwMDc1NQotLS0g
YS9hcmNoL3Bvd2VycGMvdG9vbHMvcmVsb2NzX2NoZWNrLnNoCisrKyBiL2FyY2gvcG93ZXJwYy90
b29scy9yZWxvY3NfY2hlY2suc2gKQEAgLTE1LDIxICsxNSw4IEBAIGlmIFsgJCMgLWx0IDMgXTsg
dGhlbgogCWV4aXQgMQogZmkKIAotIyBIYXZlIEtidWlsZCBzdXBwbHkgdGhlIHBhdGggdG8gb2Jq
ZHVtcCBhbmQgbm0gc28gd2UgaGFuZGxlIGNyb3NzIGNvbXBpbGF0aW9uLgotb2JqZHVtcD0iJDEi
Ci1ubT0iJDIiCi12bWxpbnV4PSIkMyIKLQotIyBSZW1vdmUgZnJvbSB0aGUgYmFkIHJlbG9jYXRp
b25zIHRob3NlIHRoYXQgbWF0Y2ggYW4gdW5kZWZpbmVkIHdlYWsgc3ltYm9sCi0jIHdoaWNoIHdp
bGwgcmVzdWx0IGluIGFuIGFic29sdXRlIHJlbG9jYXRpb24gdG8gMC4KLSMgV2VhayB1bnJlc29s
dmVkIHN5bWJvbHMgYXJlIG9mIHRoYXQgZm9ybSBpbiBubSBvdXRwdXQ6Ci0jICIgICAgICAgICAg
ICAgICAgICB3IF9iaW5hcnlfX2J0Zl92bWxpbnV4X2Jpbl9lbmQiCi11bmRlZl93ZWFrX3N5bWJv
bHM9JCgkbm0gIiR2bWxpbnV4IiB8IGF3ayAnJDEgfiAvdy8geyBwcmludCAkMiB9JykKLQogYmFk
X3JlbG9jcz0kKAotJG9iamR1bXAgLVIgIiR2bWxpbnV4IiB8Ci0JIyBPbmx5IGxvb2sgYXQgcmVs
b2NhdGlvbiBsaW5lcy4KLQlncmVwIC1FICdcPFJfJyB8Ciske3NyY3RyZWV9L3NjcmlwdHMvcmVs
b2NzX2NoZWNrLnNoICIkQCIgfAogCSMgVGhlc2UgcmVsb2NhdGlvbnMgYXJlIG9rYXkKIAkjIE9u
IFBQQzY0OgogCSMJUl9QUEM2NF9SRUxBVElWRSwgUl9QUEM2NF9OT05FCkBAIC00Myw4ICszMCw3
IEBAIFJfUFBDX0FERFIxNl9MTwogUl9QUENfQUREUjE2X0hJCiBSX1BQQ19BRERSMTZfSEEKIFJf
UFBDX1JFTEFUSVZFCi1SX1BQQ19OT05FJyB8Ci0JKFsgIiR1bmRlZl93ZWFrX3N5bWJvbHMiIF0g
JiYgZ3JlcCAtRiAtdyAtdiAiJHVuZGVmX3dlYWtfc3ltYm9scyIgfHwgY2F0KQorUl9QUENfTk9O
RScKICkKIAogaWYgWyAteiAiJGJhZF9yZWxvY3MiIF07IHRoZW4KZGlmZiAtLWdpdCBhL3Njcmlw
dHMvcmVsb2NzX2NoZWNrLnNoIGIvc2NyaXB0cy9yZWxvY3NfY2hlY2suc2gKbmV3IGZpbGUgbW9k
ZSAxMDA3NTUKaW5kZXggMDAwMDAwMDAwMDAwLi4xMzdjNjYwNDk5ZjMKLS0tIC9kZXYvbnVsbAor
KysgYi9zY3JpcHRzL3JlbG9jc19jaGVjay5zaApAQCAtMCwwICsxLDIwIEBACisjIS9iaW4vc2gK
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKworIyBHZXQgYSBs
aXN0IG9mIGFsbCB0aGUgcmVsb2NhdGlvbnMsIHJlbW92ZSBmcm9tIGl0IHRoZSByZWxvY2F0aW9u
cworIyB0aGF0IGFyZSBrbm93biB0byBiZSBsZWdpdGltYXRlIGFuZCByZXR1cm4gdGhpcyBsaXN0
IHRvIGFyY2ggc3BlY2lmaWMKKyMgc2NyaXB0IHRoYXQgd2lsbCBsb29rIGZvciBzdXNwaWNpb3Vz
IHJlbG9jYXRpb25zLgorCitvYmpkdW1wPSIkMSIKK25tPSIkMiIKK3ZtbGludXg9IiQzIgorCisj
IFJlbW92ZSBmcm9tIHRoZSBwb3NzaWJsZSBiYWQgcmVsb2NhdGlvbnMgdGhvc2UgdGhhdCBtYXRj
aCBhbiB1bmRlZmluZWQKKyPCoHdlYWsgc3ltYm9sIHdoaWNoIHdpbGwgcmVzdWx0IGluIGFuIGFi
c29sdXRlIHJlbG9jYXRpb24gdG8gMC4KKyMgV2VhayB1bnJlc29sdmVkIHN5bWJvbHMgYXJlIG9m
IHRoYXQgZm9ybSBpbiBubSBvdXRwdXQ6CisjICIgICAgICAgICAgICAgICAgICB3IF9iaW5hcnlf
X2J0Zl92bWxpbnV4X2Jpbl9lbmQiCit1bmRlZl93ZWFrX3N5bWJvbHM9JCgkbm0gIiR2bWxpbnV4
IiB8IGF3ayAnJDEgfiAvdy8geyBwcmludCAkMiB9JykKKworJG9iamR1bXAgLVIgIiR2bWxpbnV4
IiB8CisJZ3JlcCAtRSAnXDxSXycgfAorCShbICIkdW5kZWZfd2Vha19zeW1ib2xzIiBdICYmIGdy
ZXAgLUYgLXcgLXYgIiR1bmRlZl93ZWFrX3N5bWJvbHMiIHx8IGNhdCkKLS0gCjIuMzAuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
