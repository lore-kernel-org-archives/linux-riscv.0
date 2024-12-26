Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBF8E77191
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Dec 2024 10:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNoWlUcyoba4OeD0myDPDMIJKczca5JZKNKrjI4wKDk=; b=0Cz1Abp7S8/Eva
	6LRP9KnRZTHpvBSQS534H9PsOdsPsXRcfeGrKDniDjrYOTX9Cx3DP0wVRQ7Ax35U+cAMo1NzYGNsJ
	AlLmGvKNjNJLaNM1F23slcWvp0p+RFMgTqkAwmFoMijhQaubC4pD4USVDhkozljVbBQp4SCtx3PRp
	a0KYswebzHZOglgdIQb+F2i2iomvSfa56KGT4Eax0YYFdV2H70PD+BKDOOG9UXMHXLwd8wQg1tHxk
	u49AFD/s3ZKdXddhsZm/fyetp6Glx3HYoJ3ZhNh34Xy9o93tKNgSzwgL9tn/bM9IOzHXvw6mhIoaj
	UPO6NwKmdJr8ms/wqSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQlUW-0000000Fe8r-3HM1;
	Thu, 26 Dec 2024 10:53:20 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQlUU-0000000Fe7I-22SD
	for linux-riscv@lists.infradead.org;
	Thu, 26 Dec 2024 10:53:19 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id DCC1E200298;
	Thu, 26 Dec 2024 05:53:17 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 26 Dec 2024 05:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1735210397; x=1735217597; bh=ePabROfKQd
	3trOxWB+908jisGE3fNauyk5nCt4vyino=; b=rD9gXZzzeY/BFFLeDTK+M8eWDC
	sxyaDkib164PwEXBBPfk+NtQyvRx4odo2EuajbKzWJXW3MmrJZSeStflC/oFLoMp
	PH3smBzWjE7zfMCFB6A2TY8JB3rrSFw4UeoBOKj01wFHaAsnrWtKB1Nk5rT/Naf3
	YfKzsxMDMTJCpnUkIIvyjaPyDL4zqhLJm2Ed3IPrkjZD58wF5dUQsqP25GHHgsMK
	HOmvA8wB+mOlIcyLmuwbBKB+cx4Nla3NHOBAhCsPfJX2IE+44E1RT60Lk/WZjSYB
	S7KwzVDBGORRfcjEp/Xz2B3SXnQdYSjqQn5SFrnh6SLoOD+wCvUlmi0qo/hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735210397; x=
	1735217597; bh=ePabROfKQd3trOxWB+908jisGE3fNauyk5nCt4vyino=; b=Z
	o3dw23ye754fPrOuH5/urcUT506FtweUOPMa3qv+1Rq+mIHv5NFasjks9rrlPn0Y
	Q6KmTlFFJ8M0GFgXKx6F6BEVYsx78KVooEnWWfv7GcQQGFMRSljMrSMP96ulLS6m
	8qwpikvxZfF7HB856qmOiU2fTA9uruaNYC8YjhoTB2m4zmdiMfATj0EFTQbAQy1F
	uMKeZOoAVWN7hTztqkPPA8nHfAOTNI6VvAVPyyGPESx46B32d96++v3mubNX0S6z
	uVBKRjopgOuSil2TEXyBHxElogWq5Inu1Vau/IEjm9MDZpGM+KanOhMJ/DD5eh9h
	pOcwD34s19V5u+NwC9u6A==
X-ME-Sender: <xms:nTVtZ1O9-VcLnSwEg-cgn7uFh1xPR04UMwB3Zg3aePKUo1oRAltVuw>
    <xme:nTVtZ39K6J8O3o2x-PU09lDNVTn762165c4vM9uImJG4kbVIFv-s4Vm4EOMyhgJmW
    BcVXrs0Ai75OesvXH4>
X-ME-Received: <xmr:nTVtZ0QqSo_PgBHgfs1Kus6GvjssdHHi292Kn-djxiwtYTOOmFaiuHGWpE2Hwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddukedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdej
    necuhfhrohhmpeevvghlvghsthgvucfnihhuuceouhifuhestghovghlrggtrghnthhhuh
    hsrdhnrghmvgeqnecuggftrfgrthhtvghrnhepueeigfduffelffegiefffeeffeeileev
    jefghefhjeffueetvdffieduvedtleegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehufihu
    segtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepfhgvlhhigihonhhmrghrshesrghrtghhlhhinhhugidrohhrghdprhgtph
    htthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthho
    pegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepuhifuhestg
    hovghlrggtrghnthhhuhhsrdhnrghmvgdprhgtphhtthhopehguhhorhgvnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhgvseifiehriidrnhgvthdprhgtphhtthhopegsjh
    horhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhn
    ihigrdguvg
X-ME-Proxy: <xmx:nTVtZxuDINhKgKQzsVR6rkGQPESV-S7M0oS9BgdaUuPk8kMQGRL7LQ>
    <xmx:nTVtZ9fYyb41Mr0RrcupBbkBqOJ9axhVU73cp1HusPsBMikNgodLeg>
    <xmx:nTVtZ90Z3W083lMd7hH_XUolRs0-_hCuft8RT4ql5423Llco-clo8A>
    <xmx:nTVtZ58iulxe4MvGGjktasp5icxNiPrBNPC_5F9DXZNNxLlkvdr4fA>
    <xmx:nTVtZ2t-hxDshqrCVbgSrUGpGGR1IDkDpBXqM9mqTgR_z0OPU7lg54IT>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Dec 2024 05:53:16 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Thu, 26 Dec 2024 18:52:51 +0800
Subject: [PATCH v4 1/2] riscv/ptrace: add new regset to access original a0
 register
MIME-Version: 1.0
Message-Id: <20241226-riscv-new-regset-v4-1-4496a29d0436@coelacanthus.name>
References: <20241226-riscv-new-regset-v4-0-4496a29d0436@coelacanthus.name>
In-Reply-To: <20241226-riscv-new-regset-v4-0-4496a29d0436@coelacanthus.name>
To: Oleg Nesterov <oleg@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>, 
 Andrea Bolognani <abologna@redhat.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, 
 Guo Ren <guoren@kernel.org>, Yao Zi <ziyao@disroot.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 Celeste Liu <uwu@coelacanthus.name>, stable@vger.kernel.org, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3197; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=ltD8Q1yJuFcwflR+5zmJHqfB8aeFKvQGlw/4hXFU+gg=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9FzTSayCcadjtL1TfZwFL4VaWoskah41DHl4IebMZ
 7FL5VfXM3aUsjCIcTHIiimy5JWw/OS8dLZ7b8f2Lpg5rEwgQxi4OAVgIg0pDP99Fx6OOnhNRGqf
 2n/7hM8WTOH/rmf/4M5+eEHWKeOfVcAvhv8+R+w5D20PWXlNYpeEz8QVso8sr2+7ZvHljK3kl+5
 +7idsAH7FSLQ=
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_025318_602894_B5DDA04C 
X-CRM114-Status: GOOD (  12.03  )
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

VGhlIG9yaWdfYTAgaXMgbWlzc2luZyBpbiBzdHJ1Y3QgdXNlcl9yZWdzX3N0cnVjdCBvZiByaXNj
diwgYW5kIHRoZXJlIGlzCm5vIHdheSB0byBhZGQgaXQgd2l0aG91dCBicmVha2luZyBVQVBJLiAo
U2VlIExpbmsgdGFnIGJlbG93KQoKTGlrZSBOVF9BUk1fU1lTVEVNX0NBTEwgZG8sIHdlIGFkZCBh
IG5ldyByZWdzZXQgbmFtZSBOVF9SSVNDVl9PUklHX0EwIHRvCmFjY2VzcyBvcmlnaW5hbCBhMCBy
ZWdpc3RlciBmcm9tIHVzZXJzcGFjZSB2aWEgcHRyYWNlIEFQSS4KCkZpeGVzOiBlMmMwY2RmYmE3
ZjYgKCJSSVNDLVY6IFVzZXItZmFjaW5nIEFQSSIpCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC81OTUwNTQ2NC1jODRhLTQwM2QtOTcyZi1kNGIyMDU1ZWVhYWNAZ21haWwuY29tLwpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBDZWxlc3RlIExpdSA8dXd1QGNvZWxhY2Fu
dGh1cy5uYW1lPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIHwgMzIgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9lbGYuaCAgIHwgIDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvcHRyYWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwppbmRleCBl
YTY3ZTlmYjdhNTgzNjgzYjkyMmZlMmMwMTdlYTYxZjNiYzg0OGRiLi5lZjlhYjc0Yzg1NzVhNWM0
NDAxNTU5NzNiMWM2MjVjMDZhODY3Yzk3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
dHJhY2UuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwpAQCAtMzEsNiArMzEsNyBA
QCBlbnVtIHJpc2N2X3JlZ3NldCB7CiAjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9TVVBNCiAJUkVH
U0VUX1RBR0dFRF9BRERSX0NUUkwsCiAjZW5kaWYKKwlSRUdTRVRfT1JJR19BMCwKIH07CiAKIHN0
YXRpYyBpbnQgcmlzY3ZfZ3ByX2dldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdldCwKQEAgLTE4
NCw2ICsxODUsMjkgQEAgc3RhdGljIGludCB0YWdnZWRfYWRkcl9jdHJsX3NldChzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKnRhcmdldCwKIH0KICNlbmRpZgogCitzdGF0aWMgaW50IHJpc2N2X29yaWdfYTBf
Z2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAorCQkJICAgICBjb25zdCBzdHJ1Y3QgdXNl
cl9yZWdzZXQgKnJlZ3NldCwKKwkJCSAgICAgc3RydWN0IG1lbWJ1ZiB0bykKK3sKKwlyZXR1cm4g
bWVtYnVmX3N0b3JlKCZ0bywgdGFza19wdF9yZWdzKHRhcmdldCktPm9yaWdfYTApOworfQorCitz
dGF0aWMgaW50IHJpc2N2X29yaWdfYTBfc2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAor
CQkJICAgICBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXQgKnJlZ3NldCwKKwkJCSAgICAgdW5zaWdu
ZWQgaW50IHBvcywgdW5zaWduZWQgaW50IGNvdW50LAorCQkJICAgICBjb25zdCB2b2lkICprYnVm
LCBjb25zdCB2b2lkIF9fdXNlciAqdWJ1ZikKK3sKKwl1bnNpZ25lZCBsb25nIG9yaWdfYTAgPSB0
YXNrX3B0X3JlZ3ModGFyZ2V0KS0+b3JpZ19hMDsKKwlpbnQgcmV0OworCisJcmV0ID0gdXNlcl9y
ZWdzZXRfY29weWluKCZwb3MsICZjb3VudCwgJmtidWYsICZ1YnVmLCAmb3JpZ19hMCwgMCwgLTEp
OworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwl0YXNrX3B0X3JlZ3ModGFyZ2V0KS0+b3Jp
Z19hMCA9IG9yaWdfYTA7CisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNl
cl9yZWdzZXQgcmlzY3ZfdXNlcl9yZWdzZXRbXSA9IHsKIAlbUkVHU0VUX1hdID0gewogCQkuY29y
ZV9ub3RlX3R5cGUgPSBOVF9QUlNUQVRVUywKQEAgLTIyNCw2ICsyNDgsMTQgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCB1c2VyX3JlZ3NldCByaXNjdl91c2VyX3JlZ3NldFtdID0gewogCQkuc2V0ID0g
dGFnZ2VkX2FkZHJfY3RybF9zZXQsCiAJfSwKICNlbmRpZgorCVtSRUdTRVRfT1JJR19BMF0gPSB7
CisJCS5jb3JlX25vdGVfdHlwZSA9IE5UX1JJU0NWX09SSUdfQTAsCisJCS5uID0gMSwKKwkJLnNp
emUgPSBzaXplb2YoZWxmX2dyZWdfdCksCisJCS5hbGlnbiA9IHNpemVvZihlbGZfZ3JlZ190KSwK
KwkJLnJlZ3NldF9nZXQgPSByaXNjdl9vcmlnX2EwX2dldCwKKwkJLnNldCA9IHJpc2N2X29yaWdf
YTBfc2V0LAorCX0sCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHVzZXJfcmVnc2V0X3ZpZXcg
cmlzY3ZfdXNlcl9uYXRpdmVfdmlldyA9IHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51
eC9lbGYuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9lbGYuaAppbmRleCBiNDQwNjlkMjljZWNjMGY5
ZGU5MGVlNjZiZmZmZDIxMzdmNDI3NWE4Li4zOTAwNjAyMjk2MDE2MzFkYTJmYjI3MDMwZDlmYTIx
NDJlNjc2YzE0IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvZWxmLmgKKysrIGIvaW5j
bHVkZS91YXBpL2xpbnV4L2VsZi5oCkBAIC00NTIsNiArNDUyLDcgQEAgdHlwZWRlZiBzdHJ1Y3Qg
ZWxmNjRfc2hkciB7CiAjZGVmaW5lIE5UX1JJU0NWX0NTUgkweDkwMAkJLyogUklTQy1WIENvbnRy
b2wgYW5kIFN0YXR1cyBSZWdpc3RlcnMgKi8KICNkZWZpbmUgTlRfUklTQ1ZfVkVDVE9SCTB4OTAx
CQkvKiBSSVNDLVYgdmVjdG9yIHJlZ2lzdGVycyAqLwogI2RlZmluZSBOVF9SSVNDVl9UQUdHRURf
QUREUl9DVFJMIDB4OTAyCS8qIFJJU0MtViB0YWdnZWQgYWRkcmVzcyBjb250cm9sIChwcmN0bCgp
KSAqLworI2RlZmluZSBOVF9SSVNDVl9PUklHX0EwCSAgMHg5MDMJLyogUklTQy1WIG9yaWdpbmFs
IGEwIHJlZ2lzdGVyICovCiAjZGVmaW5lIE5UX0xPT05HQVJDSF9DUFVDRkcJMHhhMDAJLyogTG9v
bmdBcmNoIENQVSBjb25maWcgcmVnaXN0ZXJzICovCiAjZGVmaW5lIE5UX0xPT05HQVJDSF9DU1IJ
MHhhMDEJLyogTG9vbmdBcmNoIGNvbnRyb2wgYW5kIHN0YXR1cyByZWdpc3RlcnMgKi8KICNkZWZp
bmUgTlRfTE9PTkdBUkNIX0xTWAkweGEwMgkvKiBMb29uZ0FyY2ggTG9vbmdzb24gU0lNRCBFeHRl
bnNpb24gcmVnaXN0ZXJzICovCgotLSAKMi40Ny4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
