Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02100C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 03:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKm+r5B1pVCXQh8QGjoNc73pEWOVvXsSbDZLHUtzE4g=; b=PgoqHKUuDwdziR
	48rCRVKNTolD0LLuJjb6H9EVUwwrBSfcBhvp97oUKjek3wasy/eamZGT33I5t7P46mzQsjwM7gKY+
	oxVKgjsjwH45T/Sr6M6bY9b5DWQCZQnDYkYkkKH/NC51CS/J5246EMJOkrCGC0vsXO5IoQqAEZRFd
	lEhvIUZfXLJ8kPeLt6E7nJAMQs3gn4Y0fYqj2il125U4+wV9qvtjAhi2lbTgQcp0/9MjHFINFtfN1
	mP6aDhjn24VtOBH/Mi3lhJmgWCKxa1NLLfm1WJGAaPsy9LGn2BFHhmebu8oUOU2bGnDtNTNo+gDLh
	er6FREMz9M/PC8Wek+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfqb-00AbIo-9C; Wed, 22 Feb 2023 03:31:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfqZ-00AbGc-54
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 03:31:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4A3C6123A;
	Wed, 22 Feb 2023 03:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80929C433D2;
	Wed, 22 Feb 2023 03:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677036670;
	bh=NU2D9m2f+OBXEEFPkBj55AyydgpUBKeOwXAIsCjdO1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sdHZ/xn3PjRbbdAOXrh+rV2ZDUn4Bdki5FuC3j7BK/P+6tl9/rJ3XlLaC54xlCmFl
	 nx1t89Q+ic/YVNEUyL3BwMIO2FOpwJ7XEc2mJdUUO9tknv7Bii8zb6ksU+QckXzhO3
	 aKCDBMnWWqoZ507u7f0Ahc45pa0hH+aNpZQ3Df3ZDUsOC1hQyRWda2rat/gp5c7M9E
	 Zcd95+w0+adlQmOZFb6Qty0hCsmh6Mai1ZkvyF8+e91EzfuRLV/AzNmdwB0iCpST2c
	 YaRoBKEM+pWnoQF4Wa4eeI7JwowAFLS+LFggynDEjwrgQlgLmBfOoYYEIB8aY8RcWV
	 2se6fwh7Evigg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	ben@decadent.org.uk,
	bjorn@kernel.org,
	palmer@dabbelt.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH -next V17 3/7] riscv: entry: Add noinstr to prevent instrumentation inserted
Date: Tue, 21 Feb 2023 22:30:17 -0500
Message-Id: <20230222033021.983168-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230222033021.983168-1-guoren@kernel.org>
References: <20230222033021.983168-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_193111_294203_780D9DFF 
X-CRM114-Status: GOOD (  12.65  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKV2l0aG91dCBub2luc3Ry
IHRoZSBjb21waWxlciBpcyBmcmVlIHRvIGluc2VydCBpbnN0cnVtZW50YXRpb24gKHRoaW5rCmFs
bCB0aGUgaypTQU4sIEtDb3YsIEdDb3YsIGZ0cmFjZSBldGMuLikgd2hpY2ggY2FuIGNhbGwgY29k
ZSB3ZSdyZSBub3QKeWV0IHJlYWR5IHRvIHJ1biB0aGlzIGVhcmx5IGluIHRoZSBlbnRyeSBwYXRo
LCBmb3IgaW5zdGFuY2UgaXQgY291bGQKcmVseSBvbiBSQ1Ugd2hpY2ggaXNuJ3Qgb24geWV0LCBv
ciBleHBlY3QgbG9ja2RlcCBzdGF0ZS4gKGJ5IHBldGVyeikKCkxpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2L1l4Y1E2Tm9QZjNBSDBFWGVAaGlyZXoucHJvZ3JhbW1pbmcu
a2lja3MtYXNzLm5ldC8KUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+
ClRlc3RlZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgpTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzLmMKaW5kZXggZjZmZGE5NGU4ZTU5Li4wMjcyN2E0ZmU4YmUgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
YwpAQCAtMTE5LDkgKzExOSw5IEBAIHN0YXRpYyB2b2lkIGRvX3RyYXBfZXJyb3Ioc3RydWN0IHB0
X3JlZ3MgKnJlZ3MsIGludCBzaWdubywgaW50IGNvZGUsCiB9CiAKICNpZiBkZWZpbmVkKENPTkZJ
R19YSVBfS0VSTkVMKSAmJiBkZWZpbmVkKENPTkZJR19SSVNDVl9BTFRFUk5BVElWRSkKLSNkZWZp
bmUgX190cmFwX3NlY3Rpb24JCV9fc2VjdGlvbigiLnhpcC50cmFwcyIpCisjZGVmaW5lIF9fdHJh
cF9zZWN0aW9uIF9fbm9pbnN0cl9zZWN0aW9uKCIueGlwLnRyYXBzIikKICNlbHNlCi0jZGVmaW5l
IF9fdHJhcF9zZWN0aW9uCisjZGVmaW5lIF9fdHJhcF9zZWN0aW9uIG5vaW5zdHIKICNlbmRpZgog
I2RlZmluZSBET19FUlJPUl9JTkZPKG5hbWUsIHNpZ25vLCBjb2RlLCBzdHIpCQkJCVwKIGFzbWxp
bmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgbmFtZShzdHJ1Y3QgcHRfcmVncyAq
cmVncykJXAotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
