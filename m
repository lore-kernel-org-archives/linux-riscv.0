Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409E6E91260
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 05:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CN5XU+PO7ok0hYDz84l2Y37huaSilf+MVwSRHXm6As=; b=TN8WV5FZQMd1yE
	Q0Lsv/ANRt/zO7iqQNt7JsepMrxlJjlT1HrE+yk5Q2N+JOJXJ/PX3j6vOglYmdsXJpOGTkLhkHgXH
	qBdYNyRnDJXs6ymFuzfDltgfyO79qTIC38SQK62L5ssmSV3q8tNymLI8QINcQWNgQaSRdg0DszZkk
	Z9ywOkD05tknSw8+z89BvjiPt+cAV1LTc0GMI9t5N0D5x/QVHXSOm922JMriaJx0CX33lUtKpB1+u
	0e8aPxyTE/5MtGzY37mOWGb4ftxNB1s99uOyXCiBkTJUtkeNC1GaSCPCIvVTDfoFAs83j9g+VVYdV
	P0UvHGv8F1hIGx6RG8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsOW-00000009THA-03kq;
	Thu, 05 Feb 2026 05:59:12 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsOT-00000009TGm-2V8J
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 05:59:11 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 6155wmpX012551;
	Thu, 5 Feb 2026 13:58:48 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Feb
 2026 13:58:48 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <arnd@arndb.de>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>
CC: <tim609@andestech.com>, <ben717@andestech.com>, <minachou@andestech.com>,
        <az70021@gmail.com>, Randolph <randolph@andestech.com>
Subject: [PATCH] riscv: Fix __kernel_off_t to 64 Bits in RV32
Date: Thu, 5 Feb 2026 13:58:00 +0800
Message-ID: <20260205055800.586458-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 6155wmpX012551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_215909_991681_597D5E8C 
X-CRM114-Status: GOOD (  15.17  )
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

RnJvbTogUmFuZG9scGggPHJhbmRvbHBoQGFuZGVzdGVjaC5jb20+CgpNb2RpZnkgdGhlIF9fa2Vy
bmVsX29mZl90IHR5cGUgZm9yIFJWMzIgdG8gNjQgYml0cyB0byBjb21wbHkgd2l0aAp0aGUgY3Vy
cmVudCBnbGliYyBjYWxsaW5nIGNvbnZlbnRpb24uCgpJbiBSSVNDLVYsIG9mZl90IGlzIDY0IGJp
dHMgaW4gZ2xpYmMsIGFuZCBfX2tlcm5lbF9vZmZfdCBtdXN0IG1hdGNoCnRoaXMgc2l6ZS4gRm9y
IFJWMzIsIHRoZSBrZXJuZWwgdXNlcyB0aGUgbG9uZyB0eXBlLCB3aGljaCBzaG91bGQgYmUKY2hh
bmdlZCB0byBsb25nIGxvbmcgdG8gZW5zdXJlIGNvbnNpc3RlbmN5LgoKVG8gYWRkcmVzcyB0aGUg
WTIwMzggcHJvYmxlbSwgdGhlIGdsaWJjIHVwc3RyZWFtIGZvciBSSVNDLVYgaGFzIGFkb3B0ZWQK
NjQtYml0IHRpbWVfdCBhbmQgb2ZmX3QgZm9yIGJvdGggUlYzMiBhbmQgUlY2NCBbKjFdLgpIb3dl
dmVyLCBubyBjb3JyZXNwb25kaW5nIG1vZGlmaWNhdGlvbiB3YXMgbWFkZSBvbiB0aGUga2VybmVs
IHNpZGUsCmxlYWRpbmcgdG8gdGVzdCBjYXNlIGZhaWx1cmVzIGluIExUUOKAmXMgZm5jdGwgZHVl
IHRvIHNpemUgaW5jb25zaXN0ZW5jaWVzLgpUaGlzIGRpc2NyZXBhbmN5IGNhdXNlcyBlcnJvcnMg
d2hlbiBnbGliYyBwYXNzZXMgdGhlIHN0cnVjdCBmbG9jawpwYXJhbWV0ZXIgdG8gdGhlIGtlcm5l
bCB0aHJvdWdoIGZuY3RsKCkuCgpUaGUgc3RydWN0dXJlIG9mIGZsb2NrIGFyZSBzaG93biBhcyBi
ZWxvdzoKCnN0cnVjdCBmbG9jayBpbiBnbGliYzoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnN0cnVjdCBmbG9jawogIHsKICAgIHNob3J0IGlu
dCBsX3R5cGU7CiAgICBzaG9ydCBpbnQgbF93aGVuY2U7CiAgICBfX29mZl90IGxfc3RhcnQ7CiAg
ICBfX29mZl90IGxfbGVuOwogICAgX19vZmY2NF90IGxfc3RhcnQ7CiAgICBfX29mZjY0X3QgbF9s
ZW47ICAgICAgICAgICAgIDwtLS0tLS0gICJfX29mZjY0X3QiIGluIGdsaWJjIGlzIDY0Yml0CiAg
ICBfX3BpZF90IGxfcGlkOwogIH07Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQoKc3RydWN0IGZsb2NrIGluIGtlcm5lbDoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnN0cnVjdCBmbG9jayB7
CiAgICBzaG9ydCAgIGxfdHlwZTsKICAgIHNob3J0ICAgbF93aGVuY2U7CiAgICBfX2tlcm5lbF9v
ZmZfdCAgbF9zdGFydDsKICAgIF9fa2VybmVsX29mZl90ICBsX2xlbjsgICAgICAgPC0tLS0tICJf
X2tlcm5lbF9vZmZfdCIgaW4ga2VybmVsIGlzIDMyYml0CiAgICBfX2tlcm5lbF9waWRfdCAgbF9w
aWQ7CiAgICBfX0FSQ0hfRkxPQ0tfRVhUUkFfU1lTSUQKICAgIF9fQVJDSF9GTE9DS19QQUQKfTsK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpb
KjFdOiA0ZTk1Zjk1OTY2LjE1Nzg4MjQ1NDcuZ2l0LmFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbS8j
MjM2MDI2NwoKU2lnbmVkLW9mZi1ieTogUmFuZG9scGggPHJhbmRvbHBoQGFuZGVzdGVjaC5jb20+
Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3Bvc2l4X3R5cGVzLmggfCAzOSArKysr
KysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL3Bvc2l4X3R5cGVz
LmggICAgfCAgMyArKwogMiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3Bvc2l4X3R5cGVzLmgKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcG9zaXhfdHlwZXMuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wb3NpeF90eXBlcy5oCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOTFiNDczNDBiYmMzCi0tLSAvZGV2L251bGwKKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3Bvc2l4X3R5cGVzLmgKQEAgLTAsMCArMSwzOSBA
QAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgV0lUSCBMaW51eC1zeXNjYWxs
LW5vdGUgKi8KKyNpZm5kZWYgX0FTTV9SSVNDVl9QT1NJWF9UWVBFU19ICisjZGVmaW5lIF9BU01f
UklTQ1ZfUE9TSVhfVFlQRVNfSAorCisjaW5jbHVkZSA8YXNtL2JpdHNwZXJsb25nLmg+CisKKy8q
CisgKiBJbiB0aGUgZ2VuZXJpYyBmbG93LCB0aGlzIGZpbGUgaXMgYXV0b21hdGljYWxseSBjcmVh
dGVkIGlmIGl0IGRvZXMgbm90CisgKiBhbHJlYWR5IGV4aXN0LCBhcyBpbmRpY2F0ZWQgYnkgdGhl
IGxpbmUuCisgKiAiI2luY2x1ZGUgPGFzbS1nZW5lcmljL3Bvc2l4X3R5cGVzLmg+IgorICoKKyAq
IElmIHRoZSBmaWxlIGFscmVhZHkgZXhpc3RzLCB0aGUgYXV0b21hdGljIGNyZWF0aW9uIHByb2Nl
c3Mgd2lsbCBiZSBza2lwcGVkLgorICogQWRkaW5nIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyB0eXBl
cyB0byB0aGlzIGZpbGUgbWF5IGFsdGVyIHRoZSBnZW5lcmljIGZsb3csCisgKiBwb3RlbnRpYWxs
eSBjYXVzaW5nIHR5cGUgY29uZmxpY3RzIGR1cmluZyB0aGUgYnVpbGQgcGhhc2UuIFRvIGF2b2lk
IHRoaXMsCisgKiBkZWZpbmUgYSB2YXJpYWJsZSB0byBpbnN0cnVjdCB0aGUgZ2VuZXJpYyBjb2Rl
IHRvIHNraXAgdGhlIHJlLXR5cGVkZWYKKyAqIHByb2Nlc3MuCisgKi8KKyNpZiBfX0JJVFNfUEVS
X0xPTkcgPT0gMzIKK3R5cGVkZWYgbG9uZyBsb25nCQlfX2tlcm5lbF9vZmZfdDsKKyNkZWZpbmUg
X2FyY2hfa2VybmVsX29mZl90CV9hcmNoX2tlcm5lbF9vZmZfdAorI2VuZGlmCisKKy8qCisgKiBU
aGUgImxvbmciIHR5cGUgaXMgNCBieXRlcyBpbiBSVjMyIGFuZCA4IGJ5dGVzIGluIFJWNjQuCisg
KgorICogQmVmb3JlIGFkZGluZyBhbiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgdHlwZToKKyAqIElu
IFJWMzI6IF9fa2VybmVsX29mZl90IC0+IF9fa2VybmVsX2xvbmdfdCAtPiBsb25nICg0IGJ5dGUp
CisgKiBJbiBSVjY0OiBfX2tlcm5lbF9vZmZfdCAtPiBfX2tlcm5lbF9sb25nX3QgLT4gbG9uZyAo
OCBieXRlKQorICoKKyAqIEFmdGVyIGFkZGluZyBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgdHlwZToK
KyAqIEluIFJWMzI6IF9fa2VybmVsX29mZl90IC0+IGxvbmcgbG9uZyAoOCBieXRlKQorICogSW4g
UlY2NDogX19rZXJuZWxfb2ZmX3QgLT4gX19rZXJuZWxfbG9uZ190IC0+IGxvbmcgKDggYnl0ZSkK
KyAqCisgKiBUaGlzIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyB0eXBlIGlzIG9ubHkgZm9yIFJWMzIu
CisgKi8KKworI2luY2x1ZGUgPGFzbS1nZW5lcmljL3Bvc2l4X3R5cGVzLmg+CisKKyNlbmRpZiAv
KiBfQVNNX1JJU0NWX1BPU0lYX1RZUEVTX0ggKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9h
c20tZ2VuZXJpYy9wb3NpeF90eXBlcy5oIGIvaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL3Bvc2l4
X3R5cGVzLmgKaW5kZXggMGE5MGFkOTJkYmYzLi5kYzVkZDMyZjZkMzMgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy9wb3NpeF90eXBlcy5oCisrKyBiL2luY2x1ZGUvdWFwaS9h
c20tZ2VuZXJpYy9wb3NpeF90eXBlcy5oCkBAIC04NCw3ICs4NCwxMCBAQCB0eXBlZGVmIHN0cnVj
dCB7CiAvKgogICogYW55dGhpbmcgYmVsb3cgaGVyZSBzaG91bGQgYmUgY29tcGxldGVseSBnZW5l
cmljCiAgKi8KKyNpZm5kZWYgX2FyY2hfa2VybmVsX29mZl90CiB0eXBlZGVmIF9fa2VybmVsX2xv
bmdfdAlfX2tlcm5lbF9vZmZfdDsKKyNlbmRpZgorCiB0eXBlZGVmIGxvbmcgbG9uZwlfX2tlcm5l
bF9sb2ZmX3Q7CiB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgbG9uZwlfX2tlcm5lbF91b2ZmX3Q7CiB0
eXBlZGVmIF9fa2VybmVsX2xvbmdfdAlfX2tlcm5lbF9vbGRfdGltZV90OwotLSAKMi4zNC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
