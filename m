Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE82C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2fV2+t8ViF03r9QvkXn2ueUA+yUtfQbYm0+3obgVk8=; b=JguPEFYn5DX/tc
	kvJvzRwAb9IiqZNNgAJ0T/XQnSnUBcElANlgH15kMKT8UVyPgmLY+zl9f825wMRBMy/hcw3/liOUG
	cMeRLVDX7x46C+VbLIyYhv+0SsHeOSgmLRrx9yeTMwTtec3O7S3fURsZV7MAJLE5109UQctnx8UiP
	a2Oafu1FxVBmkRdpKXa7Gfnx3yWIvFRMQgqrTPUTOCD3BYU/er5dZFPnGwDIlB1hm7KOvbMtGk7kM
	Lb7IhA2SI0/58d4+3q6i7E5HH5L1jM1nLuGfnvIdNdpwg/olvuayrTLDDOPEtQ/VbGwXXxU6L0t01
	Zttxq4kx21Y1TFrbby2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLGj-003Par-33;
	Thu, 21 Dec 2023 15:47:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLGg-003PXu-0P
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 15:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1786619BF;
	Thu, 21 Dec 2023 15:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAB8C433CC;
	Thu, 21 Dec 2023 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703173645;
	bh=AsvVmmiuGWBFu5stNq3XoYXyaKfmZAWOgztQ+Ek0sqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uhWq7HNl8+B0YhiTGUMxZjDlYDFYfy7vtI+h7lvAxn2hltTLuvJqzyS9lA/OSTMQ0
	 j/bRnzscfA31jLF0OIf5dpyilmyauPu/t8bsZprZPn/fTJSo8BvWwOh+dZXoX5KH7U
	 3Q2TrfEKJzGctJ3WbHBq/y/ehYU4EvRzS0xyLxbDLJO8CwhMQZhtsL7VBEVK1b6HjW
	 QRFIwyuTmIHOEffqdhjB93JeIiBsMZFxYWtGK0x4+Sxi/pfczeoY2E6FJdQUNlfPN9
	 7X6ptv0pxxlOjUC0t5dE/n9RDR+UOaYXjMozP+dC1l2Tb1OToPPtbQaU9CGN/MjHpd
	 6446AbwEvSzUw==
From: guoren@kernel.org
To: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	guoren@kernel.org,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	leobras@redhat.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
Date: Thu, 21 Dec 2023 10:47:01 -0500
Message-Id: <20231221154702.2267684-5-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221154702.2267684-1-guoren@kernel.org>
References: <20231221154702.2267684-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_074726_250709_80D6D8C9 
X-CRM114-Status: UNSURE (   7.14  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVW5pZnkgdGhlIFRBU0tf
U0laRSBkZWZpbml0aW9uIHdpdGggVkFfQklUUyBmb3IgYmV0dGVyIHJlYWRhYmlsaXR5LgpBZGQg
Q09NUEFUIG1vZGUgdXNlciBhZGRyZXNzIHNwYWNlIGluZm8gaW4gdGhlIGNvbW1lbnQuCgpTaWdu
ZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKaW5kZXggZTQxNTU4MjI3
NmVjLi5kMTY1ZGRhZTNiNDIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCkBAIC04NjYsNiAr
ODY2LDcgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfc3dwX2NsZWFyX2V4Y2x1c2l2ZShwdGVf
dCBwdGUpCiAgKiBOb3RlIHRoYXQgUEdESVJfU0laRSBtdXN0IGV2ZW5seSBkaXZpZGUgVEFTS19T
SVpFLgogICogVGFzayBzaXplIGlzOgogICogLSAgICAgICAgMHg5ZmMwMDAwMAkofjIuNUdCKSBm
b3IgUlYzMi4KKyAqIC0gICAgICAgIDB4ODAwMDAwMDAJKCAgIDJHQikgZm9yIFJWNjQgY29tcGF0
IG1vZGUKICAqIC0gICAgICAweDQwMDAwMDAwMDAJKCAyNTZHQikgZm9yIFJWNjQgdXNpbmcgU1Yz
OSBtbXUKICAqIC0gICAgMHg4MDAwMDAwMDAwMDAJKCAxMjhUQikgZm9yIFJWNjQgdXNpbmcgU1Y0
OCBtbXUKICAqIC0gMHgxMDAwMDAwMDAwMDAwMDAJKCAgNjRQQikgZm9yIFJWNjQgdXNpbmcgU1Y1
NyBtbXUKQEAgLTg3NywxMSArODc4LDExIEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3N3cF9j
bGVhcl9leGNsdXNpdmUocHRlX3QgcHRlKQogICogU2ltaWxhcmx5IGZvciBTVjU3LCBiaXRzIDYz
4oCTNTcgbXVzdCBiZSBlcXVhbCB0byBiaXQgNTYuCiAgKi8KICNpZmRlZiBDT05GSUdfNjRCSVQK
LSNkZWZpbmUgVEFTS19TSVpFXzY0CShQR0RJUl9TSVpFICogUFRSU19QRVJfUEdEIC8gMikKKyNk
ZWZpbmUgVEFTS19TSVpFXzY0CShVTCgxKSA8PCAoVkFfQklUUyAtIDEpKQogCiAjaWZkZWYgQ09O
RklHX0NPTVBBVAotI2RlZmluZSBUQVNLX1NJWkVfMzIJKF9BQygweDgwMDAwMDAwLCBVTCkpCi0j
ZGVmaW5lIFRBU0tfU0laRQkodGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQpID8gXAorI2RlZmlu
ZSBUQVNLX1NJWkVfMzIJKFVMKDEpIDw8IChWQV9CSVRTX1NWMzIgLSAxKSkKKyNkZWZpbmUgVEFT
S19TSVpFCShpc19jb21wYXRfdGFzaygpID8gXAogCQkJIFRBU0tfU0laRV8zMiA6IFRBU0tfU0la
RV82NCkKICNlbHNlCiAjZGVmaW5lIFRBU0tfU0laRQlUQVNLX1NJWkVfNjQKLS0gCjIuNDAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
