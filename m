Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43544C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 19:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t4E4qxDAd3wFszP4qtetvBtbFg3HJ1/lGDgsA0QpXvE=; b=DqnokQUZXjwmjD
	cfYxMveJ8K6LBfidaZOTKRwkFsu7dxRmYUpIDtYFYER9rInJcroum/mKRS/V7S5bpA21Ru1rsjRBw
	KxYvOaCKvoXATv2WIIJz3Wf8BVRV1gSnJ6jBoj4XvySwk8g4kXyjlgmmwmoOqDE1RuCQjHsnvFwZZ
	dXiqMbnAtjir9tOuwghxPlO5LcX+ld97fLYMonIpiHYZleo89U2TE8UKI5N6e7J+tcreOan9o9yID
	owQlATcX1IdcELIo1NHS7BPvbf5HccoCHis0Fk9VqmJD1MaaFakuhskUxincDcDWV3Ht9wviF+Umu
	uDMqQpOnov1yEz2XZPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvN3O-00AkSE-09;
	Tue, 24 Oct 2023 19:27:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvN3K-00AkRd-27
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 19:27:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EEB161D09;
	Tue, 24 Oct 2023 19:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73354C433C7;
	Tue, 24 Oct 2023 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698175617;
	bh=+anck+iVi4/9AxBaPBVSONihMc3/xRqjTE3i12vRea4=;
	h=From:To:Cc:Subject:Date:From;
	b=pu5np2xifqVw00cZ9Z6nwP8ziNGZoZtGj7PA+aR0d4yzvZy/BMB0PUuBb632APfEa
	 1ZDWDFJBamzVFMHuii8b0pviocPYN4pumq8L7lE1N3btV7b4N5vQs+v0gZYW7rWUNI
	 0DNFbZput21S/Ccoh+53Z5hatA9Xp5zw+ORQRPUve9tdxmQXUvycyAkkgGU1IP9QcW
	 91/e5KgIkF8hDog4o8/Zw/FtyugJzHGQqMFQImtfF8frOLiHo0i3jNUbrfrJaL/DDS
	 UfUtgR1vmE9jypMyNpN77f1zO7GT6nVKK/ziBA+69Lpb/n3kpzlTjJQd3+5wLIa1+A
	 lZgiUIuyaqyQA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] riscv: CONFIG_EFI should not depend on CONFIG_RISCV_ISA_C
Date: Tue, 24 Oct 2023 21:26:48 +0200
Message-Id: <20231024192648.25527-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_122658_781033_FD61042A 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVUVGSS9QRSBtYW5kYXRl
cyB0aGF0IHRoZSBrZXJuZWwgSW1hZ2Ugc3RhcnRzIHdpdGggIk1aIiBBU0NJSQooMHg1QTREKS4g
Q29udmVuaWVudCBlbm91Z2gsICJNWiIgaXMgYSB2YWxpZCBjb21wcmVzc2VkIFJJU0MtVgppbnN0
cnVjdGlvbi4gVGhpcyBtZWFucyB0aGF0IGEgbm9uLVVFRkkgbG9hZGVyIGNhbiBzaW1wbHkganVt
cCB0bwoiY29kZTAiIGluIHRoZSBJbWFnZSBoZWFkZXIgWzFdIGFuZCBzdGFydCBleGVjdXRpbmcu
CgpUaGUgSW1hZ2Ugc3BlY2lmaWNhdGlvbiBbMV0gc2F5cyB0aGUgZm9sbG93aW5nIGFib3V0ICJj
b2RlMCI6CiAgfCAgIFRoaXMgaGVhZGVyIGlzIGFsc28gcmV1c2VkIHRvIHN1cHBvcnQgRUZJIHN0
dWIgZm9yIFJJU0MtVi4gRUZJCiAgfCAgIHNwZWNpZmljYXRpb24gbmVlZHMgUEUvQ09GRiBpbWFn
ZSBoZWFkZXIgaW4gdGhlIGJlZ2lubmluZyBvZiB0aGUKICB8ICAga2VybmVsIGltYWdlIGluIG9y
ZGVyIHRvIGxvYWQgaXQgYXMgYW4gRUZJIGFwcGxpY2F0aW9uLiBJbiBvcmRlcgogIHwgICB0byBz
dXBwb3J0IEVGSSBzdHViLCBjb2RlMCBpcyByZXBsYWNlZCB3aXRoICJNWiIgbWFnaWMgc3RyaW5n
CiAgfCAgIGFuZCByZXMzKGF0IG9mZnNldCAweDNjKSBwb2ludHMgdG8gdGhlIHJlc3Qgb2YgdGhl
IFBFL0NPRkYKICB8ICAgaGVhZGVyLgoKIk1aIiBpcyBub3QgYSB2YWxpZCBpbnN0cnVjdGlvbiBm
b3IgaW1wbGVtZW50YXRpb25zIHdpdGhvdXQgdGhlIEMKZXh0ZW5zaW9uLgoKQSBub24tVUVGSSBs
b2FkZXIsIGxvYWRpbmcgYSBub24tQyBVRUZJIGltYWdlIGhhdmUgdGhlIGZvbGxvd2luZwpvcHRp
b25zOgogIDEuIFRyYXAgYW5kIGVtdWxhdGUgImNvZGUwIgogIDIuIEF2b2lkICJjb2RlMCIgaWYg
aXQgaXMgIk1aIiwgYW5kIGhhdmUgdGhlIGtlcm5lbCBlbnRyeSBhdAogICAgICJjb2RlMSIuCgpS
ZXBsYWNlIHRoZSBjb21wcmVzc2VkIGluc3RydWN0aW9uIHdpdGggYSBoZXggY29kZSB2YXJpYW50
LCB0aGF0IHdvcmtzCmZvciBDT05GSUdfUklTQ1ZfSVNBX0M9biBidWlsZHMuIEZ1cnRoZXIsIHRo
aXMgY2hhbmdlIGFsc28gbWFrZSBzdXJlCnRoYXQgdGhlICJjb2RlMCIgaW5zdHJ1Y3Rpb24gaXMg
MzJiIGFsaWduZWQuCgpbMV0gRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LWltYWdlLWhlYWRlci5y
c3QKClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgfCAxIC0KIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQu
UyB8IDggKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwppbmRleCBkNjA3YWIwZjdjNmQuLjljNWJiYmM5Mzk1MSAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtNzk5LDcgKzc5OSw2IEBA
IGNvbmZpZyBFRkkKIAlzZWxlY3QgRUZJX1JVTlRJTUVfV1JBUFBFUlMKIAlzZWxlY3QgRUZJX1NU
VUIKIAlzZWxlY3QgTElCRkRUCi0Jc2VsZWN0IFJJU0NWX0lTQV9DCiAJc2VsZWN0IFVDUzJfU1RS
SU5HCiAJaGVscAogCSAgVGhpcyBvcHRpb24gcHJvdmlkZXMgc3VwcG9ydCBmb3IgcnVudGltZSBz
ZXJ2aWNlcyBwcm92aWRlZApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIv
YXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCmluZGV4IDM3MTBlYTVkMTYwZi4uMzNkNjliNTY5ODQz
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvaGVhZC5TCkBAIC0yNyw5ICsyNywxMyBAQCBFTlRSWShfc3RhcnQpCiAJICovCiAjaWZk
ZWYgQ09ORklHX0VGSQogCS8qCi0JICogVGhpcyBpbnN0cnVjdGlvbiBkZWNvZGVzIHRvICJNWiIg
QVNDSUkgcmVxdWlyZWQgYnkgVUVGSS4KKwkgKiBUaGUgY29tcHJlc3NlZCAoQyBleHRlbnNpb24p
ICJjLmxpIHM0LC0xMyIgaW5zdHJ1Y3Rpb24KKwkgKiBkZWNvZGVzIHRvIDB4NWE0ZC8iTVoiIChB
U0NJSSksIHdoaWNoIGlzIHJlcXVpcmVkIGJ5IFVFRkkuCisJICoKKwkgKiBJbiBvcmRlciB0byBz
dXBwb3J0IG5vbi1jb21wcmVzc2VkIEVGSSBrZXJuZWxzLCB0aGUKKwkgKiBpbnN0cnVjdGlvbiBp
cyB3cml0dGVuIGluIGhleC4KIAkgKi8KLQljLmxpIHM0LC0xMworCS53b3JkIDB4NWE0ZDVhNGQK
IAlqIF9zdGFydF9rZXJuZWwKICNlbHNlCiAJLyoganVtcCB0byBzdGFydCBrZXJuZWwgKi8KCmJh
c2UtY29tbWl0OiBkODg1MjBhZDczYjc5ZTcxZTNkZGYwOGRlMzM1Yjg1MjBhZTQxYzVjCi0tIAoy
LjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
