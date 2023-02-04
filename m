Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C652EC636CD
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Feb 2023 07:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QumSqzFIJINz/tRhlakHBvkLvxSMc3ko2HLSoq1Fsns=; b=VyJNINTDMSPiOr
	A1/FXl+E9QhNFG9AwDnF6bEiGBtQ8zBV8ppYdrU5u+1AzfBHySOvQZilBZUz21OZtLLgo2je92VzW
	l+O4eSGYkdhxmAEEtyf2YMoUlwWxkXNefXMIdRUy1vTbr25wMH5w1Wg95NEPBJspeAvF/XHmugOm5
	JbSIdeHFJYIJoYbz0FT+si2qzsaYcIlqt+guGfPSFEO6M58vMKnVx0/lY/bqc6/446HDLpjKcRQcl
	lLCK95+E02s3l6pWlubQwLP6hOFTAwStmICJPmJzSuidwLUIrbKC0LZNsMJxfsrnDAUoXBlkDXQoK
	0gyNZlfGHEjJQFdLo55w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOCaE-004bOT-R2; Sat, 04 Feb 2023 07:03:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOCaB-004bLz-Ri
	for linux-riscv@lists.infradead.org; Sat, 04 Feb 2023 07:03:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4F494B82D0A;
	Sat,  4 Feb 2023 07:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E97C4339B;
	Sat,  4 Feb 2023 07:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675494209;
	bh=TdYTdj6H5Qbtgmh1te0rA9iZLTDxbWp//XNrh7RF5Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F8vbs+VUtzvlJ2vvbxB76f+LNomu7o+U0Pha7BjVBdJ6DT+ubQ0tS0sUzveuWRFTC
	 4XXSZLa57CozUxPd8BX8/ajPbJsntR2huXGXb9ibui0p8bkW+1ADVb8XVMDQG8Wza/
	 TyQxzKsQb/39/HWTfHnWCRl0wd0Q2GhnOFWgX94Da+MLXrAkrHx7I9vGv6lxZA11On
	 dn4MZlPJQlbjweTdlSQwcU16Ujpkq22vf2u4wXudLlGawqRos8adB4dWqY76VXkmHf
	 3TdV9CHU79xyxadG4mCAkVdwfwPDmjW5NhDGlLT5OG9FDhgEIj4IgTwtnIgZCl4wFG
	 m5wFXwRq3fX8w==
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
	miguel.ojeda.sandonis@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH -next V16 3/7] riscv: entry: Add noinstr to prevent instrumentation inserted
Date: Sat,  4 Feb 2023 02:02:09 -0500
Message-Id: <20230204070213.753369-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230204070213.753369-1-guoren@kernel.org>
References: <20230204070213.753369-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_230332_066691_982F87BC 
X-CRM114-Status: GOOD (  12.22  )
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
bmVsL3RyYXBzLmMKaW5kZXggNTQ5YmRlNWM5NzBhLi45NmVjNzZjNTRmZjIgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
YwpAQCAtOTUsOSArOTUsOSBAQCBzdGF0aWMgdm9pZCBkb190cmFwX2Vycm9yKHN0cnVjdCBwdF9y
ZWdzICpyZWdzLCBpbnQgc2lnbm8sIGludCBjb2RlLAogfQogCiAjaWYgZGVmaW5lZChDT05GSUdf
WElQX0tFUk5FTCkgJiYgZGVmaW5lZChDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUpCi0jZGVmaW5l
IF9fdHJhcF9zZWN0aW9uCQlfX3NlY3Rpb24oIi54aXAudHJhcHMiKQorI2RlZmluZSBfX3RyYXBf
c2VjdGlvbiBfX25vaW5zdHJfc2VjdGlvbigiLnhpcC50cmFwcyIpCiAjZWxzZQotI2RlZmluZSBf
X3RyYXBfc2VjdGlvbgorI2RlZmluZSBfX3RyYXBfc2VjdGlvbiBub2luc3RyCiAjZW5kaWYKICNk
ZWZpbmUgRE9fRVJST1JfSU5GTyhuYW1lLCBzaWdubywgY29kZSwgc3RyKQkJCQlcCiBhc21saW5r
YWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIG5hbWUoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCVwKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
