Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C430DCA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgydOeoYolyzA16xz8Vlo0VHZJQ8LjPvgYHb0dq34N8=; b=U5sQkmEfqN4sg7
	sfa26kUYMDNsNojxnIl/atwF+9Y/0Oa4T8JBiV31mdENfr4dDA2Yz+0dZs65SVrMsSURVgW2YpNGc
	jTUuF0zFUZ1bcmh3akf5CDodnTP4aXI62RwvhSjw/VaU3qfgCrdh/a0zprwbUZi+Yhzslj4sLc1eI
	dRme1H+4MuqBwE1gaqcqKfij8vg33C3MS/VcquuhQcPvkAoryZZZqZX8j6IvOx8uPRTFEd17+B08R
	rRy3sRNos7ZetYyEzo1cx3b7LMx6dkVwWdje6HwHE7kGzYWXYhjlCHn6NZLEk0WI7U33nDLPMeI4q
	5YD/B2giY1OKlLP29qIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ6j-00000008Vb5-1B9N;
	Mon, 25 Aug 2025 15:27:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqY96-00000008FOX-1eYi;
	Mon, 25 Aug 2025 14:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9C2244B14;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81222C116C6;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=qKnJwvVOQdbIM7AwmZDu1aieujqnr4MVL8xJV+3xcWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPWPBLMJbqPu4Ihz/jn1p85BL57qjQm0GeXE5FNWeLlN++/7RKlMCJ8dHmh3NN98j
	 a2MJOEJMImQWuqo4ojpxl7wQxUW+kMSttdKngdXjPS2kCUyc+BZ+1e8oOgQ0Ti2/6m
	 reEgKi6EjffV33DLzQyIgr8V9g2nlmSVYUG7EaM/MyY7M2lKY2Zv/dN2S7hOdASMCl
	 /HccRg3BXD9cdYB8R3XGPA4vYe8uLuojG1CaSJ1AIvlscFmLwGNseHrwr/ONQGONLO
	 cnGyoQE6fc06n1ued9gtzzjBPgY/6MjOfjPP43UQ+V4sPfnprtr50fs3xdqa5Qy6Yd
	 aMsiVDBIbNsJA==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 2/5] x86/traps: Clarify KCFI instruction layout
Date: Mon, 25 Aug 2025 07:25:49 -0700
Message-Id: <20250825142603.1907143-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
References: <20250825141316.work.967-kees@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072604_452551_FFB8D0F1 
X-CRM114-Status: GOOD (  11.42  )
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

SnVzdCBhIG5pdC1waWNreSBjaGFuZ2UgdG8gdGhlIEtDRkkgaW5kaXJlY3QgY2FsbCBjaGVjayBp
bnN0cnVjdGlvbgpkb2N1bWVudGF0aW9uLiBUaGUgYWRkbCBvZmZzZXQgaXNuJ3QgYWx3YXlzIC00
IChpdCBkZXBlbmRzIG9uIHBhdGNoYWJsZQpmdW5jdGlvbiBlbnRyeSBjb25maWd1cmF0aW9uKS4K
ClNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPgotLS0KIGFyY2gveDg2
L2tlcm5lbC9jZmkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jZmkuYyBiL2FyY2gveDg2
L2tlcm5lbC9jZmkuYwppbmRleCA3NzA4NmNmNTY1ZWMuLjYzOGViNWM5MzNlMCAxMDA2NDQKLS0t
IGEvYXJjaC94ODYva2VybmVsL2NmaS5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9jZmkuYwpAQCAt
MjcsNyArMjcsNyBAQCBzdGF0aWMgYm9vbCBkZWNvZGVfY2ZpX2luc24oc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MsIHVuc2lnbmVkIGxvbmcgKnRhcmdldCwKIAkgKiBmb3IgaW5kaXJlY3QgY2FsbCBjaGVj
a3M6CiAJICoKIAkgKiDCoCBtb3ZsICAgIC08aWQ+LCAlcjEwZCAgICAgICA7IDYgYnl0ZXMKLQkg
KiAgIGFkZGwgICAgLTQoJXJlZyksICVyMTBkICAgIDsgNCBieXRlcworCSAqICAgYWRkbCAgICAt
PHBvcz4oJXJlZyksICVyMTBkOyA0IGJ5dGVzCiAJICogICBqZSAgICAgIC5MdG1wMSAgICAgICAg
ICAgICA7IDIgYnl0ZXMKIAkgKiAgIHVkMiAgICAgICAgICAgICAgICAgICAgICAgIDsgPC0gcmVn
cy0+aXAKIAkgKiAgIC5MdG1wMToKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
