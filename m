Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A61BE7718E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Dec 2024 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNoWlUcyoba4OeD0myDPDMIJKczca5JZKNKrjI4wKDk=; b=dXeWk+Aa7dx6uV
	SVi6hY0yrJo9lmFlBNkpqr1iIhD6ijjhGV66tHA8DtTG7QsI0qD7bks2WdvbR0rQMLE5lOON+1RRT
	y8uhJqufRH99opJSpruq1+01bJx5zdm5zCP/K9zU+uHUrQpJQaL09gi9xlyGNK/qf5AxAXmGb6iCH
	DgYuBm73/yCf8OOUM8B3q4nLs9lcNvMvGowElHZ+Uufbb51uDOyjATgTt5e31qDil0k8fWkO38ZmN
	wL6YBvIC4AfwkQPdHJouraRuaXHwS+t5xdA7BMLZjce+5aMP/slpRBRWq66uokfaFwWqNrLfIvelA
	y3nmA7wXpbsEqELaRS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQlN7-0000000Fd2p-1mdc;
	Thu, 26 Dec 2024 10:45:41 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQlN3-0000000Fd15-1WVG
	for linux-riscv@lists.infradead.org;
	Thu, 26 Dec 2024 10:45:39 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id BCC252005BC;
	Thu, 26 Dec 2024 05:45:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 26 Dec 2024 05:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1735209936; x=1735217136; bh=ePabROfKQd
	3trOxWB+908jisGE3fNauyk5nCt4vyino=; b=WJCKp/yHbthI8T+qhG/lyB8sVl
	YkBdNRi92T7EjmfAbW05WfVUqDu6jMu/pV3O3UDDFi3bwVIIA5zyZO5UtSzIlteK
	OjuZ8aMVHFdrFILJ+CDVV3Q6uZzvcZOBDQfjedKCJwlS5ckYzekFayuJxhWPCIAF
	SjkG5pgUr63vrT0O18uKxwyeWkCVFU57zuA49U3lZ4FBrOdE9O11FoEUjTcCISmK
	lNnxGP7k4CrA/l+5PlRQdktO30wi2umtCXxTp9NQAZa4bR8PIXO9a4L4pgao7Q2q
	NOvn9Z5T+S5p5QFxpuXUmKX8Bk+nCrK0/R5c1Rd463frn54ZqIb3i5AcFN9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735209936; x=
	1735217136; bh=ePabROfKQd3trOxWB+908jisGE3fNauyk5nCt4vyino=; b=e
	CDGpgifKLN6SqZU5GgHiZkzD9f3gSYBbWmMcaEC1BB+hlYeLabPw3gNh52pejqb/
	8WbiSTOTHWdFIdTFXZhW1QegDkIbCpMocpWKco/JtlFIDfM1ypfn+v3h3j7+40yB
	+ox5zGQJGuP+1B2I3NtCfXxRiMpUrXg6q/nsP5RkvQxyxqe/be9ZBE0wFxnZeMJt
	zi5vSene5LV0etexLECP0WxSuNVIVrr02y5FcVPgKGUZvTlFaGJ8vyC0tlv3lb5b
	ZpZmLpAN3fQgW7eKhzDGqI5rUe3X0X1m1scff8dL7jy8PjT1KcIZ0J0qbqlwGQdi
	TFjzDhawAn5/zFoLqm4HA==
X-ME-Sender: <xms:0DNtZ7yjDB8DznbBtoFTjW6Bb4GuhQqy9VQyZt1C4mvgh1X-crXmag>
    <xme:0DNtZzS7wtRmhBMT4oQMjyUMdasKo6TAbNq0rESD9KQUi67E3rO-I11yL1R8ApglZ
    LGsBF5Vpb8sOXZnIzo>
X-ME-Received: <xmr:0DNtZ1XFai5VaJaHRFKcPNZcQUpE9bXwjY8Etwqm3uq0OyW4PRe3WAMnxqXh2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddukedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdej
    necuhfhrohhmpeevvghlvghsthgvucfnihhuuceouhifuhestghovghlrggtrghnthhhuh
    hsrdhnrghmvgeqnecuggftrfgrthhtvghrnhepueeigfduffelffegiefffeeffeeileev
    jefghefhjeffueetvdffieduvedtleegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehufihu
    segtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepfhgvlhhigihonhhmrghrshesrghrtghhlhhi
    nhhugidrohhrghdprhgtphhtthhopegrsgholhhoghhnrgesrhgvughhrghtrdgtohhmpd
    hrtghpthhtohepuhifuhestghovghlrggtrghnthhhuhhsrdhnrghmvgdprhgtphhtthho
    pehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghjohhnvghssehvvghnthgr
    nhgrmhhitghrohdrtghomhdprhgtphhtthhopehshhhurghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:0DNtZ1jP_5WESZQUMYYJ1rx4VOQFa0Fy03qrhuNw0MLfuabP1iDI-g>
    <xmx:0DNtZ9AcmGNCUMGv49fzMBTTIrUMqjhPQXTGa79CEiSVal7AImxb2Q>
    <xmx:0DNtZ-LATYIf9GVQcyDXPCNFrbhKSmIyFjo1c7x70Br1b3ghJpwyqA>
    <xmx:0DNtZ8C9W5Ws8XwxaQsPQwx7f6e2rI03qPHq2qc1-Fkx4Dk5u5jd7w>
    <xmx:0DNtZ_z1z8S4wgpTaFULsyYbiqmC9FXAL0vH_TgvGiyHscXxZkbROiQz>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Dec 2024 05:45:35 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Thu, 26 Dec 2024 18:45:09 +0800
Subject: [PATCH v3 1/2] riscv/ptrace: add new regset to access original a0
 register
MIME-Version: 1.0
Message-Id: <20241226-riscv-new-regset-v3-1-f5b96465826b@coelacanthus.name>
References: <20241226-riscv-new-regset-v3-0-f5b96465826b@coelacanthus.name>
In-Reply-To: <20241226-riscv-new-regset-v3-0-f5b96465826b@coelacanthus.name>
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
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9FzjfcFzW5JSdpl75XUxC/ltnaLIqDsn6mp9ALeE/
 /UNjTpGnztKWRjEuBhkxRRZ8kpYfnJeOtu9t2N7F8wcViaQIQxcnAIwkbY4hr+CYlO/Xjrb7vv1
 +Z2EKf+Uc45vtstX3O5heYTPZ/69PkYfhv+pU2QfOJ+VmqvmXlw/Sez2geWKDfKuot+ldE1LVY8
 xbeEGAGoyRRQ=
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_024537_573217_BB2104B3 
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
