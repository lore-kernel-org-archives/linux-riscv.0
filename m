Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4C1C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 08:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/e6Dy5iEcs9RdJMyV4ipX/hvVFnQRV5Mt2CbFxbIjr4=; b=WJ0XfiPC3yZPna
	Gk37Nm/xuoUvua3mflrk+mDYdBoK6SwqbbpD+BMzJmSB96/m7zmrlu7xspbXmuDdKuR7krTTdHkoq
	ysIkuQEdo4Rpg8auOBSHCzY3LCQOGycCXsts1ZW+xqPgVOCtKU6rH577f6NH8+Ikv8OteARc5y1JM
	TI5GXbm/NjfMXdhnl7QE9MaTf50wPmwgc3p4/6T6UW1/ZC8JVQXjzaAR9WpsoW6B45T8AKwRO1HjD
	OB5YR5nNuxEaj0phOc22w0MDYdfLS/boBk+XdIYZcss19OWHVM/oBttFHvvRv7rDANQkozV7Snyo5
	4vyZaoGlTiFzmgQpw3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5Ss-0000000CxuM-2PXp;
	Fri, 28 Mar 2025 08:53:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5Sq-0000000Cxtl-1Ywz
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 08:53:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F20455C4C8A;
	Fri, 28 Mar 2025 08:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC027C4CEE4;
	Fri, 28 Mar 2025 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743151998;
	bh=guCE2WsY9Defy1aDADm8ZYMxyHivzAMoig7lpN2TvHs=;
	h=From:To:Cc:Subject:Date:From;
	b=pk51dovHDmNhzcT3xYaANTDZuyU9eDeLbZNqeF67YixD9tKMIkacoy86cg5Ah3Bam
	 uAYCG1ShZWfz7VKqky48jc9mI8XFuUsSKTYFP9vTDo6hSQ9Lsgs/2LTZXH/cxz7scH
	 InrlmCpKroAdw4LkQ0SF9Xkuia/kCdyd64pfPyWY82QVlcuU0AEuqAkoBISHcDpAES
	 bjZHhvhkZyJbjCRXOcyo6lE/s54EzyQ/cRBSvxnZbHToS3CAXPbDZRYGLgmjo34KUf
	 ZRRs3W5zB+eFSHbE8RcV1VixwUPhk0CDbcjsZkQdgsLKPURhPAN95weVKhwslSD1sR
	 0U5UEdxVhUVBQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH fixes] riscv/purgatory: 4B align purgatory_start
Date: Fri, 28 Mar 2025 09:53:11 +0100
Message-ID: <20250328085313.1193815-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_015320_470740_0750652C 
X-CRM114-Status: UNSURE (   8.42  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKV2hlbiBhIGNyYXNoa2Vy
bmVsIGlzIGxhdW5jaGVkIG9uIFJJU0MtViwgdGhlIGVudHJ5IHRvIHB1cmdhdG9yeSBpcwpkb25l
IGJ5IHRyYXBwaW5nIHZpYSB0aGUgc3R2ZWMgQ1NSLiBGcm9tIHJpc2N2X2tleGVjX25vcmVsb2Nh
dGUoKToKCiAgfCAgLi4uCiAgfCAgLyoKICB8ICAgKiBTd2l0Y2ggdG8gcGh5c2ljYWwgYWRkcmVz
c2luZwogIHwgICAqIFRoaXMgd2lsbCBhbHNvIHRyaWdnZXIgYSBqdW1wIHRvIENTUl9TVFZFQwog
IHwgICAqIHdoaWNoIGluIHRoaXMgY2FzZSBpcyB0aGUgYWRkcmVzcyBvZiB0aGUgbmV3CiAgfCAg
ICoga2VybmVsLgogIHwgICAqLwogIHwgIGNzcncgICAgQ1NSX1NUVkVDLCBhMgogIHwgIGNzcncg
ICAgQ1NSX1NBVFAsIHplcm8KCnN0dmVjIHJlcXVpcmVzIHRoYXQgdGhlIGFkZHJlc3MgaXMgNEIg
YWxpZ25lZCwgd2hpY2ggd2FzIG5vdCB0aGUgY2FzZSwKZS5nLjoKCiAgfCBMb2FkZWQgcHVyZ2F0
b3J5IGF0IDB4ZmZmZmMwMDAKICB8IGtleGVjX2ZpbGU6IGtleGVjX2ZpbGVfbG9hZDogdHlwZTox
LCBzdGFydDoweGZmZmZkMjMyIGhlYWQ6MHg0IGZsYWdzOjB4NgoKVGhlIGFkZHJlc3MgMHhmZmZm
ZDIzMiBub3QgNEIgYWxpZ25lZC4KCkNvcnJlY3QgYnkgYWRkaW5nIHByb3BlciBmdW5jdGlvbiBh
bGlnbm1lbnQuCgpXaXRoIHRoaXMgY2hhbmdlLCBjcmFzaGtlcm5lbHMgbG9hZGVkIHdpdGgga2V4
ZWMtZmlsZSB3aWxsIGJlIGFibGUgdG8KcHJvcGVybHkgZW50ZXIgdGhlIHB1cmdhdG9yeS4KCkZp
eGVzOiA3MzZlMzBhZjU4M2ZiICgiUklTQy1WOiBBZGQgcHVyZ2F0b3J5IikKU2lnbmVkLW9mZi1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvcHVy
Z2F0b3J5L2VudHJ5LlMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L2VudHJ5LlMgYi9hcmNoL3Jpc2N2L3B1cmdh
dG9yeS9lbnRyeS5TCmluZGV4IDBlNmNhNmQ1YWU0Yi4uYzVkYjJmMDcyYzM0IDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9lbnRyeS5TCisrKyBiL2FyY2gvcmlzY3YvcHVyZ2F0b3J5
L2VudHJ5LlMKQEAgLTEyLDYgKzEyLDcgQEAKIAogLnRleHQKIAorLmFsaWduCTIKIFNZTV9DT0RF
X1NUQVJUKHB1cmdhdG9yeV9zdGFydCkKIAogCWxsYQlzcCwgLkxzdGFjawoKYmFzZS1jb21taXQ6
IGFjYjRmMzM3MTNiOWY2Y2FkYjYxNDNmMjExNzE0YzM0MzQ2NTQxMWMKLS0gCjIuNDUuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
