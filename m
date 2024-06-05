Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F28C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4J5ZM7PZJPIcjp1iFWyAowlW8i/Vs/y1rdOKzbQLqg=; b=pGbBqM3R7juVWP
	9w7d3xAk7Oh/b6NfaL0uBboUuDUgRy5oZ+OWCh1Cxv6M6ja6t0oMJBqVzZekruWbupndjqZ1EP/m8
	zXKMm5xhXcDykD1VhGrIORF4tFTXlCJLSOy8PA/hB6ZDPsLlU6nEbbBOLvrd/gw/3+T2YPBOBRcDc
	SVVfJNO2gtJE1AoMJvfqOlc4AEXjgWXW0VEaEpvqOXDPLKN/DqX4KcDOzjvCOw+XUtfZMmYdmoY69
	T6LkLt8/x58ZNjuRg0VQ2tFzdEdIS0Fmp7mzXJl/hDPAnIZYgB8CQYVmrEda0dWqaDDU+3ueyVsTB
	c/QFZrqf0E9f72kdMkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1d-00000005k8P-1SlY;
	Wed, 05 Jun 2024 11:41:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1a-00000005k5l-2LkI
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 11:41:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E9ED0CE1779;
	Wed,  5 Jun 2024 11:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA0FC32786;
	Wed,  5 Jun 2024 11:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587708;
	bh=tu3HoOPPrk12D/HHChqAMB+6RlcJ+H95I8FoF9tFiiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=actIwcGKL7lMw7iHm/kYeLU0Im0MKA4ATYjc0eCD0iqFPQA3+RyZqVf1nydSeSUj0
	 gF9ZhAi8Cz89TfrWUuVf9dhYSzuUycsqYPT4dufEA7HfktKoCVWT5gVywjFH44bLxq
	 FNTCqSW9+FkXOpJ/wxpC8P41lR4dMjOqX+wX6c6+uyD4sHqI51jkPKWdIKeosTC0K2
	 WSBy6vQk9sC3vPE9M08ir3qL9i3FzdGxn8iAQdWQ8EjWNitOO9u8IfVkxzec9k0tt9
	 kNzLKT3wBJLZ8wQiEitzX09XtnmJ30P5wj/gY3ges2Va9UAhUDJXEgw+464CKsyQPH
	 ZFrpv32CPOuLg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 07/11] riscv: mm: Take memory hotplug read-lock during kernel page table dump
Date: Wed,  5 Jun 2024 13:40:50 +0200
Message-ID: <20240605114100.315918-8-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
References: <20240605114100.315918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044150_815036_04491C71 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKRHVyaW5nIG1lbW9yeSBo
b3QgcmVtb3ZlLCB0aGUgcHRkdW1wIGZ1bmN0aW9uYWxpdHkgY2FuIGVuZCB1cCB0b3VjaGluZwpz
dGFsZSBkYXRhLiBBdm9pZCBhbnkgcG90ZW50aWFsIGNyYXNoZXMgKG9yIHdvcnNlKSwgYnkgaG9s
ZGluZyB0aGUKbWVtb3J5IGhvdHBsdWcgcmVhZC1sb2NrIHdoaWxlIHRyYXZlcnNpbmcgdGhlIHBh
Z2UgdGFibGUuCgpUaGlzIGNoYW5nZSBpcyBhbmFsb2dvdXMgdG8gYXJtNjQncyBjb21taXQgYmYy
YjU5ZjYwZWUxICgiYXJtNjQvbW06CkhvbGQgbWVtb3J5IGhvdHBsdWcgbG9jayB3aGlsZSB3YWxr
aW5nIGZvciBrZXJuZWwgcGFnZSB0YWJsZSBkdW1wIikuCgpSZXZpZXdlZC1ieTogRGF2aWQgSGls
ZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBPc2NhciBTYWx2YWRvciA8
b3NhbHZhZG9yQHN1c2UuZGU+ClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJp
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L21tL3B0ZHVtcC5jIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3B0ZHVt
cC5jIGIvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYwppbmRleCAxMjg5Y2M2ZDM3MDAuLjlkNWY2NTdh
MjUxYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYworKysgYi9hcmNoL3Jpc2N2
L21tL3B0ZHVtcC5jCkBAIC02LDYgKzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2VmaS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2luaXQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+CisjaW5jbHVk
ZSA8bGludXgvbWVtb3J5X2hvdHBsdWcuaD4KICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgog
I2luY2x1ZGUgPGxpbnV4L3B0ZHVtcC5oPgogCkBAIC0zNzAsNyArMzcxLDkgQEAgYm9vbCBwdGR1
bXBfY2hlY2tfd3godm9pZCkKIAogc3RhdGljIGludCBwdGR1bXBfc2hvdyhzdHJ1Y3Qgc2VxX2Zp
bGUgKm0sIHZvaWQgKnYpCiB7CisJZ2V0X29ubGluZV9tZW1zKCk7CiAJcHRkdW1wX3dhbGsobSwg
bS0+cHJpdmF0ZSk7CisJcHV0X29ubGluZV9tZW1zKCk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIu
NDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
