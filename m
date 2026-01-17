Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001B7C98322
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 11:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qIoz4RS87+7jtpbh06PjGeG8t2Mhs4L4NBcqw5vS4EM=; b=ojWHDD7vRiqq9U
	LElFXfkFelYWmVsATu1lrRFleAVb+iyVQwCI9TDXX6Av93Pc6pKU++w66b9mSdOfpXBqsH7Yla9aD
	fGaH+YYaoKoe3naDe1Gik7fh50vC+kwpVFYPX7mBRJh/oOTBNrlCU3cnHqMJbvdwhm2b8C14O2IwM
	ehT2sZEoOVrZxoD0KrGwDVX/FNljfLA+zGUGsomip7uCjRyLIjwIlKuEMVSdAnipKQzDVzt6RYwUJ
	17te2f2fPhinQxp/cBvf5q7Wt6q0G6/hzfifDv/L+vZv4tH1mHb0GtK+aei8CMSKZ8P5rxx9iWgKd
	WYkD4biODoLij8rP0cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh4TK-0000000FV2e-467S;
	Sat, 17 Jan 2026 11:28:02 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh4TH-0000000FV1p-2H9e
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 11:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768649272;
	bh=OW43itkqUHtxS37BsbFYe97PdBAljL0UDj9thfEiWHM=;
	h=From:Date:Subject:To:Cc:From;
	b=YZT6kyVdoI/BMZKRnG0EmFZAvjFF0LgVppy9M3CLTpebkLgZ+9iao/j/3Lg2Jo44H
	 q6/X8AWvcTt0rCjGEjsWQCHq3P/+oLB4aKZ/X1H17ZDJquMLh9NAz4GLgADb+INdKE
	 Wqpd8n1jPh56augDIWvovPQ4zSmgKBdN4OQ3UJMI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 17 Jan 2026 12:27:46 +0100
Subject: [PATCH] selftests: riscv: vstate_exec_nolibc: Use the regular
 prctl() function
MIME-Version: 1.0
Message-Id: <20260117-nolibc-mysyscall-riscv-v1-1-0ae1ae3513e9@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gZaxU+9iriwNWqgVmlAFPHuF
 pdvMfOAUGQS6LIHIp0svIcEnWfg1jEshDwlQ6GKWmndYNg9W4fbLbe40XuMLO7E1pRtZSqjZms
 hxUekma9/3A/v+wFg3eA6aAAAAA==
X-Change-ID: 20260117-nolibc-mysyscall-riscv-893859590fbb
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768649272; l=1578;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=OW43itkqUHtxS37BsbFYe97PdBAljL0UDj9thfEiWHM=;
 b=Pnv+sld0dz0N/prWd330V2GUCsIiaydFowwLdGpGZtVYpzv6+6WzjYcHXrHcLGIPzXyjSqrcz
 rIJ9Tt+ZEzOCJZnhnL0sGrIEYbEAK0UwIUcCb0B36btjMzVtGnEwAjW
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_032759_752989_91F33AB4 
X-CRM114-Status: UNSURE (   8.23  )
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

VGhlIG15X3N5c2NhbGwqKCkgbWFjcm9zIGFyZSBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBkZXRh
aWxzIG9mIG5vbGliYy4KCk5vdyB0aGF0IG5vbGliYyBoYXMgYSBub3JtYWwgcHJjdGwoKSBmdW5j
dGlvbiwgdXNlIHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhA
d2Vpc3NzY2h1aC5uZXQ+Ci0tLQpDb21waWxlLXRlc3RlZCBvbmx5LgpGb3IgdGhlIHJpc2N2IHRy
ZWUuCgpJIHdhbnQgdG8gcmVuYW1lIHRob3NlIG1hY3JvcyBhdCBzb21lIHBvaW50LgotLS0KIHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92c3RhdGVfZXhlY19ub2xpYmMuYyB8
IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3Zz
dGF0ZV9leGVjX25vbGliYy5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9y
L3ZzdGF0ZV9leGVjX25vbGliYy5jCmluZGV4IDdiN2Q2ZjIxYWNiNC4uMTJmMWIxYjFjN2FhIDEw
MDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4
ZWNfbm9saWJjLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3Zz
dGF0ZV9leGVjX25vbGliYy5jCkBAIC0xNiwxMCArMTYsMTAgQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKiphcmd2KQogCWlmIChhcmdjID4gMiAmJiBzdHJjbXAoYXJndlsyXSwgIngiKSkKIAkJ
eHRoZWFkdmVjdG9yID0gMTsKIAotCWN0cmwgPSBteV9zeXNjYWxsMShfX05SX3ByY3RsLCBQUl9S
SVNDVl9WX0dFVF9DT05UUk9MKTsKLQlpZiAoY3RybCA8IDApIHsKKwljdHJsID0gcHJjdGwoUFJf
UklTQ1ZfVl9HRVRfQ09OVFJPTCwgMCwgMCwgMCwgMCk7CisJaWYgKGN0cmwgPT0gLTEpIHsKIAkJ
cHV0cygiUFJfUklTQ1ZfVl9HRVRfQ09OVFJPTCBpcyBub3Qgc3VwcG9ydGVkXG4iKTsKLQkJcmV0
dXJuIGN0cmw7CisJCWV4aXQoLTEpOwogCX0KIAogCWlmICh0ZXN0X2luaGVyaXQpIHsKQEAgLTUx
LDcgKzUxLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQl9CiAKIAkJaWYg
KCFwaWQpIHsKLQkJCXJjID0gbXlfc3lzY2FsbDEoX19OUl9wcmN0bCwgUFJfUklTQ1ZfVl9HRVRf
Q09OVFJPTCk7CisJCQlyYyA9IHByY3RsKFBSX1JJU0NWX1ZfR0VUX0NPTlRST0wsIDAsIDAsIDAs
IDApOwogCQkJaWYgKHJjICE9IGN0cmwpIHsKIAkJCQlwdXRzKCJjaGlsZCdzIHZzdGF0ZV9jdHJs
IG5vdCBlcXVhbCB0byBwYXJlbnQnc1xuIik7CiAJCQkJZXhpdCgtMSk7CgotLS0KYmFzZS1jb21t
aXQ6IDhmMGI0Y2NlNDQ4MWZiMjI2NTM2OTdjY2VkOGQwZDA0MDI3Y2IxZTgKY2hhbmdlLWlkOiAy
MDI2MDExNy1ub2xpYmMtbXlzeXNjYWxsLXJpc2N2LTg5Mzg1OTU5MGZiYgoKQmVzdCByZWdhcmRz
LAotLSAKVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
