Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BFBC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 06:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hQNXHQkME8JkxUPVYzDj+ClvCfU64oIIC9bZ2NIb49U=; b=2YtstTYvh4stX6
	g4+vplpvN5FhbwkGkumxK6GaeiNyTUZFYEg2GK+ZyFxIuUY62extfUY7wOTvosQo+/TEUMAkUH5Ln
	rHQVjxazaFijpw+r89+hbzDs4dLCnBLK3r2z4AoXUqt0s0i1rzgQyJoBU5pGUyjp7/J4WxPPQcjUc
	F2SCCDQ72cn91jhO1bPqtCyWB9BmIiahdGAMdB+1tj/q9qXpaKVthumm+r90votNC/WyGzO+s6Z8m
	ItUybXMD6B3sNHQb31gY+lMfF2rHx8RmQ65l0VlIut7mhkC6UEZz60aHaLrKmTuFiEi/BrQckAigp
	xvrz4sG6h9czwYxvek1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjE39-00EIqG-0c;
	Mon, 03 Apr 2023 06:52:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjE36-00EIpA-23
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 06:52:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 245986133F;
	Mon,  3 Apr 2023 06:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4493EC433EF;
	Mon,  3 Apr 2023 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680504734;
	bh=a/R10jH30vYnh+1wVVgBZesVEWx9VEabSFxoWE4WGaQ=;
	h=From:To:Cc:Subject:Date:From;
	b=PZjCGGdy918fsCIV2X7ji6gb3Dy7kLUZvge78w6piYQ0DQT26vfQkZHg1ffZkorWO
	 Ep6okNEzf7o5LlKEoBg1ercBGYLyUlE4CNG9/sJ/RlIkr7ADq0Yeov3preu9D67xGd
	 A/Fkj3TPKWa+uU/fkqkeeIODnngpg6TYD0M94porHImd6B20kTGQeIwW9yPuATQd27
	 pg+kp41sRKtr+SaqbATMRdx4khZSNtThQnE0EwW89wGCNUmnquYEW/HQnjl9W2wCLf
	 O9HhPb7WXLGbnP62cMrVTQui4zNO6YrU+zxA5HVieNzHsMNOzS7f71gUYvMGFKbrcs
	 0vPeN8NRU/FWw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Conor Dooley <conor@kernel.org>,
	Yipeng Zou <zouyipeng@huawei.com>,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH] riscv: entry: Save a0 prior syscall_enter_from_user_mode()
Date: Mon,  3 Apr 2023 08:52:07 +0200
Message-Id: <20230403065207.1070974-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_235216_734801_E5B560AD 
X-CRM114-Status: GOOD (  12.13  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFJJU0MtViBjYWxs
aW5nIGNvbnZlbnRpb24gcGFzc2VzIHRoZSBmaXJzdCBhcmd1bWVudCwgYW5kIHRoZQpyZXR1cm4g
dmFsdWUgaW4gdGhlIGEwIHJlZ2lzdGVyLiBGb3IgdGhpcyByZWFzb24sIHRoZSBhMCByZWdpc3Rl
cgpuZWVkcyBzb21lIGV4dHJhIGNhcmU7IFdoZW4gaGFuZGxpbmcgc3lzY2FsbHMsIHRoZSBhMCBy
ZWdpc3RlciBpcwpzYXZlZCBpbnRvIHJlZ3MtPm9yaWdfYTAsIHNvIGEwIGNhbiBiZSBwcm9wZXJs
eSByZXN0b3JlZCBmb3IsCmUuZy4gaW50ZXJydXB0ZWQgc3lzY2FsbHMuCgpUaGlzIGZ1bmN0aW9u
YWxpdHkgd2FzIGJyb2tlbiB3aXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIGdlbmVyaWMKZW50
cnkgcGF0Y2hlcy4gSGVyZSwgYTAgd2FzIHNhdmVkIGludG8gb3JpZ19hMCBhZnRlciBjYWxsaW5n
CnN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSwgd2hpY2ggY2FuIGNoYW5nZSByZWdzLT5h
MCBmb3Igc29tZQpwYXRocywgaW5jb3JyZWN0bHkgcmVzdG9yaW5nIGEwLgoKVGhpcyBpcyByZXNv
bHZlZCwgYnkgc2F2aW5nIGEwIHByaW9yIGRvaW5nIHRoZQpzeXNjYWxsX2VudGVyX2Zyb21fdXNl
cl9tb2RlKCkgY2FsbC4KCkZpeGVzOiBmMGJkZGY1MDU4NmQgKCJyaXNjdjogZW50cnk6IENvbnZl
cnQgdG8gZ2VuZXJpYyBlbnRyeSIpClJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28u
c3R1ZWJuZXJAdnJ1bGwuZXU+ClRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVi
bmVyQHZydWxsLmV1PgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2lu
Yy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwppbmRleCAx
ZjRlMzdiZTdlYjMuLjhjMjU4Yjc4YzkyNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCkBAIC0yNzAsMTEgKzI3MCwx
MSBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNh
bGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7CiAJCXVs
b25nIHN5c2NhbGwgPSByZWdzLT5hNzsKIAotCQlzeXNjYWxsID0gc3lzY2FsbF9lbnRlcl9mcm9t
X3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsKLQogCQlyZWdzLT5lcGMgKz0gNDsKIAkJcmVncy0+
b3JpZ19hMCA9IHJlZ3MtPmEwOwogCisJCXN5c2NhbGwgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNl
cl9tb2RlKHJlZ3MsIHN5c2NhbGwpOworCiAJCWlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCiAJ
CQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7CiAJCWVsc2UKCmJhc2UtY29tbWl0OiBk
MzRhNmI3MTVhMjNjY2Q5YzlkMGJjN2E0NzViZWE1OWRjM2UyOGIyCi0tIAoyLjM3LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
