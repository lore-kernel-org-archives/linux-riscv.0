Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC963C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 07:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Us+rqmtkJAkvDda9KZtppGQ9yI6Z0NtuDE9LYSriluI=; b=1toTsJrHyHC9so
	0AaCiVt4fSXrNnlBuLOxCSXOmLQ1NQU5Gz0IcCxiYbVvTmoxKAGFwss+zxLD/0/kmjdiF+UusjREV
	iyKP+tmEhIgzPlQV+q4LtyElp45cJ1LbYIveumQmcmMkBPGR9467GruroXAqxdzAdk8ssfQ9FDype
	dbKTIKXXxMtXt/hRxfO5VbdZHvM/BWFjwMgygN5ej2wFm7EV5dCXb13otdQzl/aJb/dfTEqzTEVal
	ejc0/0lKcobqw6iDSydxZpjTjAAleLKOAlnW0Iep/uCoGHJDsDrVQygI0TTZ8lUt9QpjOh0Ho+jFo
	RKH3mvbRmanB/wI4Nw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrv1i-0000000EVl9-40vU;
	Wed, 03 Apr 2024 07:27:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrv1f-0000000EViS-3j6h
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 07:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1B5EFCE1F6F;
	Wed,  3 Apr 2024 07:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506BAC4166C;
	Wed,  3 Apr 2024 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712129233;
	bh=+VzjS3lYs6MmEFgAWLAK/tBPyrT/NYGIq1NsetZK0N4=;
	h=From:To:Cc:Subject:Date:From;
	b=vNfnwlCRbrrs+6oRiuY5HnZ1jnEcpXLfT282PXD+b5CWl/fw1eWCrbdibGIarc/N6
	 I9ZYikj4gLFF7GdgIpYozxHKpugugvRROjc6lX9liupSFYD+6sUcteJRJPRylPOBld
	 j897gZXMVtm8PL5BptbZZV9YHO8zziyhfjmqv+IUGzps6Oetq3dRalD3QexSmRLGik
	 tzKzUF3FlI3pWmLUapkwV4G084eIboYExqbOCraW0uPIdl9tWsrVU+BADUop4HUS/j
	 4+4QDriYAo9nkL9zEOtS05U9eYGngEQ6j1fzQQ0bN41R2R/j6j0jTS81luAO2Gwfu/
	 NLhh2CxQTBL2Q==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Vincent Chen <vincent.chen@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Greentime Hu <greentime.hu@sifive.com>,
	Haorong Lu <ancientmodern4@gmail.com>,
	Jerry Shih <jerry.shih@sifive.com>,
	Nick Knight <nick.knight@sifive.com>,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vineetg@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH] riscv: Fix vector state restore in rt_sigreturn()
Date: Wed,  3 Apr 2024 09:26:38 +0200
Message-Id: <20240403072638.567446-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_002716_409184_E0A98B08 
X-CRM114-Status: GOOD (  16.77  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFJJU0MtViBWZWN0
b3Igc3BlY2lmaWNhdGlvbiBzdGF0ZXMgaW4gIkFwcGVuZGl4IEQ6IENhbGxpbmcKQ29udmVudGlv
biBmb3IgVmVjdG9yIFN0YXRlIiBbMV0gdGhhdCAiRXhlY3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1
c2VzCmFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lzdGVycyAodjAtdjMxLCB2bCwgdnR5cGUp
IGFuZCB2c3RhcnQgdG8KYmVjb21lIHVuc3BlY2lmaWVkLiIuIEluIHRoZSBSSVNDLVYga2VybmVs
IHRoaXMgaXMgY2FsbGVkICJkaXNjYXJkaW5nCnRoZSB2c3RhdGUiLgoKUmV0dXJuaW5nIGZyb20g
YSBzaWduYWwgaGFuZGxlciB2aWEgdGhlIHJ0X3NpZ3JldHVybigpIHN5c2NhbGwsIHZlY3Rvcgpk
aXNjYXJkIGlzIGFsc28gcGVyZm9ybWVkLiBIb3dldmVyLCB0aGlzIGlzIG5vdCBhbiBpc3N1ZSBz
aW5jZSB0aGUKdmVjdG9yIHN0YXRlIHNob3VsZCBiZSByZXN0b3JlZCBmcm9tIHRoZSBzaWdjb250
ZXh0LCBhbmQgdGhlcmVmb3JlIG5vdApjYXJlIGFib3V0IHRoZSB2ZWN0b3IgZGlzY2FyZC4KClRo
ZSAibGl2ZSBzdGF0ZSIgaXMgdGhlIGFjdHVhbCB2ZWN0b3IgcmVnaXN0ZXIgaW4gdGhlIHJ1bm5p
bmcgY29udGV4dCwKYW5kIHRoZSAidnN0YXRlIiBpcyB0aGUgdmVjdG9yIHN0YXRlIG9mIHRoZSB0
YXNrLiBBIGRpcnR5IGxpdmUgc3RhdGUsCm1lYW5zIHRoYXQgdGhlIHZzdGF0ZSBhbmQgbGl2ZSBz
dGF0ZSBhcmUgbm90IGluIHN5bmNoLgoKV2hlbiB2ZWN0b3JpemVkIHVzZXJfZnJvbV9jb3B5KCkg
d2FzIGludHJvZHVjZWQsIGFuIGJ1ZyBzbmVha2VkIGluIGF0CnRoZSByZXN0b3JhdGlvbiBjb2Rl
LCByZWxhdGVkIHRvIHRoZSBkaXNjYXJkIG9mIHRoZSBsaXZlIHN0YXRlLgoKQW4gZXhhbXBsZSB3
aGVuIHRoaXMgZ28gd3Jvbmc6CgogIDEuIEEgdXNlcmxhbmQgYXBwbGljYXRpb24gaXMgZXhlY3V0
aW5nIHZlY3RvciBjb2RlCiAgMi4gVGhlIGFwcGxpY2F0aW9uIHJlY2VpdmVzIGEgc2lnbmFsLCBh
bmQgdGhlIHNpZ25hbCBoYW5kbGVyIGlzCiAgICAgZW50ZXJlZC4KICAzLiBUaGUgYXBwbGljYXRp
b24gcmV0dXJucyBmcm9tIHRoZSBzaWduYWwgaGFuZGxlciwgdXNpbmcgdGhlCiAgICAgcnRfc2ln
cmV0dXJuKCkgc3lzY2FsbC4KICA0LiBUaGUgbGl2ZSB2ZWN0b3Igc3RhdGUgaXMgZGlzY2FyZGVk
IHVwb24gZW50ZXJpbmcgdGhlCiAgICAgcnRfc2lncmV0dXJuKCksIGFuZCB0aGUgbGl2ZSBzdGF0
ZSBpcyBtYXJrZWQgYXMgImRpcnR5IiwgaW5kaWNhdGluZwogICAgIHRoYXQgdGhlIGxpdmUgc3Rh
dGUgbmVlZCB0byBiZSBzeW5jaHJvbml6ZWQgd2l0aCB0aGUgY3VycmVudAogICAgIHZzdGF0ZS4K
ICA1LiBydF9zaWdyZXR1cm4oKSByZXN0b3JlcyB0aGUgdnN0YXRlLCBleGNlcHQgdGhlIFZlY3Rv
ciByZWdpc3RlcnMsCiAgICAgZnJvbSB0aGUgc2lnY29udGV4dAogIDYuIHJ0X3NpZ3JldHVybigp
IHJlc3RvcmVzIHRoZSBWZWN0b3IgcmVnaXN0ZXJzLCBmcm9tIHRoZSBzaWdjb250ZXh0LAogICAg
IGFuZCBub3cgdGhlIHZlY3Rvcml6ZWQgdXNlcl9mcm9tX2NvcHkoKSBpcyB1c2VkLiBUaGUgZGly
dHkgbGl2ZQogICAgIHN0YXRlIGZyb20gdGhlIGRpc2NhcmQgaXMgc2F2ZWQgdG8gdGhlIHZzdGF0
ZSwgbWFraW5nIHRoZSB2c3RhdGUKICAgICBjb3JydXB0LgogIDcuIHJ0X3NpZ3JldHVybigpIHJl
dHVybnMgdG8gdGhlIGFwcGxpY2F0aW9uLCB3aGljaCBjcmFzaGVzIGR1ZSB0bwogICAgIGNvcnJ1
cHRlZCB2c3RhdGUuCgpOb3RlIHRoYXQgdGhlIHZlY3Rvcml6ZWQgdXNlcl9mcm9tX2NvcHkoKSBp
cyBpbnZva2VkIGRlcGVuZGluZyBvbiB0aGUKdmFsdWUgb2YgQ09ORklHX1JJU0NWX0lTQV9WX1VD
T1BZX1RIUkVTSE9MRC4gRGVmYXVsdCBpcyA3NjgsIHdoaWNoCm1lYW5zIHRoYXQgdmxlbiBoYXMg
dG8gYmUgbGFyZ2VyIHRoYW4gMTI4YiBmb3IgdGhpcyBidWcgdG8gdHJpZ2dlci4KClRoZSBmaXgg
aXMgc2ltcGx5IHRvIG1hcmsgdGhlIGxpdmUgc3RhdGUgYXMgbm9uLWRpcnR5L2NsZWFuIHByaW9y
CnBlcmZvcm1pbmcgdGhlIHZzdGF0ZSByZXN0b3JlLgoKTGluazogaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvcmVsZWFzZXMvZG93bmxvYWQvcmlzY3YtaXNhLXJlbGVh
c2UtOGFiZGI0MS0yMDI0LTAzLTI2L3VucHJpdi1pc2EtYXNjaWlkb2MucGRmICMgWzFdClJlcG9y
dGVkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgpSZXBvcnRlZC1i
eTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAa2VybmVsLm9yZz4KRml4ZXM6IGMyYTY1OGQ0MTkyNCAo
InJpc2N2OiBsaWI6IHZlY3Rvcml6ZSBjb3B5X3RvX3VzZXIvY29weV9mcm9tX3VzZXIiKQpTaWdu
ZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9y
aXNjdi9rZXJuZWwvc2lnbmFsLmMgfCAxNSArKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvc2lnbmFsLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYwppbmRleCA1MDFl
NjZkZWJmNjkuLjVhMmVkZDdmMDI3ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2ln
bmFsLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMKQEAgLTExOSw2ICsxMTksMTMg
QEAgc3RhdGljIGxvbmcgX19yZXN0b3JlX3Zfc3RhdGUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHZv
aWQgX191c2VyICpzY192ZWMpCiAJc3RydWN0IF9fc2NfcmlzY3Zfdl9zdGF0ZSBfX3VzZXIgKnN0
YXRlID0gc2NfdmVjOwogCXZvaWQgX191c2VyICpkYXRhcDsKIAorCS8qCisJICogTWFyayB0aGUg
dnN0YXRlIGFzIGNsZWFuIHByaW9yIHBlcmZvcm1pbmcgdGhlIGFjdHVhbCBjb3B5LAorCSAqIHRv
IGF2b2lkIGdldHRpbmcgdGhlIHZzdGF0ZSBpbmNvcnJlY3RseSBjbG9iYmVyZWQgYnkgdGhlCisJ
ICogIGRpc2NhcmRlZCB2ZWN0b3Igc3RhdGUuCisJICovCisJcmlzY3Zfdl92c3RhdGVfc2V0X3Jl
c3RvcmUoY3VycmVudCwgcmVncyk7CisKIAkvKiBDb3B5IGV2ZXJ5dGhpbmcgb2YgX19zY19yaXNj
dl92X3N0YXRlIGV4Y2VwdCBkYXRhcC4gKi8KIAllcnIgPSBfX2NvcHlfZnJvbV91c2VyKCZjdXJy
ZW50LT50aHJlYWQudnN0YXRlLCAmc3RhdGUtPnZfc3RhdGUsCiAJCQkgICAgICAgb2Zmc2V0b2Yo
c3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUsIGRhdGFwKSk7CkBAIC0xMzMsMTMgKzE0MCw3IEBA
IHN0YXRpYyBsb25nIF9fcmVzdG9yZV92X3N0YXRlKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB2b2lk
IF9fdXNlciAqc2NfdmVjKQogCSAqIENvcHkgdGhlIHdob2xlIHZlY3RvciBjb250ZW50IGZyb20g
dXNlciBzcGFjZSBkYXRhcC4gVXNlCiAJICogY29weV9mcm9tX3VzZXIgdG8gcHJldmVudCBpbmZv
cm1hdGlvbiBsZWFrLgogCSAqLwotCWVyciA9IGNvcHlfZnJvbV91c2VyKGN1cnJlbnQtPnRocmVh
ZC52c3RhdGUuZGF0YXAsIGRhdGFwLCByaXNjdl92X3ZzaXplKTsKLQlpZiAodW5saWtlbHkoZXJy
KSkKLQkJcmV0dXJuIGVycjsKLQotCXJpc2N2X3ZfdnN0YXRlX3NldF9yZXN0b3JlKGN1cnJlbnQs
IHJlZ3MpOwotCi0JcmV0dXJuIGVycjsKKwlyZXR1cm4gY29weV9mcm9tX3VzZXIoY3VycmVudC0+
dGhyZWFkLnZzdGF0ZS5kYXRhcCwgZGF0YXAsIHJpc2N2X3ZfdnNpemUpOwogfQogI2Vsc2UKICNk
ZWZpbmUgc2F2ZV92X3N0YXRlKHRhc2ssIHJlZ3MpICgwKQoKYmFzZS1jb21taXQ6IDcxMTVmZjRh
OGJmZWQzYjkyOTRiYWQyZTExMTc0NGU2YWJlYWRmMWEKLS0gCjIuNDAuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
