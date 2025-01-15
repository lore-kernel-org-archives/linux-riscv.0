Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38127C02185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3Jg2ovBupT+AAq+B5pIhqBQ4huPbgD1dFJomP0YtKo=; b=InQLg59TeYU4Vp
	VosT5gZ3sUCkg3xdIVHOq3LWf/xZYR5gmkHY9FykXy0rpJdH4WvUrgzZk8hx8NSdds7wDHH+vt/9f
	yKMeYZNYF6rwm7h4fD+eEeqoFUUoXZon6imJ+c8OvyYNdKEhtT9bz00A0igkhzp7XmIdlt2+hYb+X
	zGhJpFxPkRRtRfIf1csMVVijGNKIqtON+cmN7YiXgp7pmWqmZUNvE1llaRdBapdbWPIgdhk1pQE9j
	+i/7p54O3vlGmq+wxi6K8bHUWmAVQOAa/Xx/aAl2rTp4Nyaojw24Qfj+g9Uw3xh0Y2iftsXHoch7n
	SuLVU+FVuajHAeGZNobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Po-0000000Be3I-3Z0P;
	Wed, 15 Jan 2025 11:18:28 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Ll-0000000BdAt-2NYJ
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 11:14:19 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailflow.phl.internal (Postfix) with ESMTP id EB8BD200F84;
	Wed, 15 Jan 2025 06:14:16 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 15 Jan 2025 06:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736939656; x=1736946856; bh=WfiGYnphGq
	vudtD6RXFjAbGTohKPfJnsfNrRsHzlEL4=; b=bMtaM99wg2t0sGsWBBr9DRK+d4
	6ElpWK4uVOU6I3S3fC5DrwS6XS5Bop4pBipUtYzdgo4tTPDBqilV9gQjblb7pgKW
	ZThERb5+upl9p5jRj57trl5UY5G6X2fdNebgjKdTBbk3bj83Kam9brdokLXr8JZ8
	sm/eCiITI9F33g6DwKwtci7MDQ3jW5GpP8Vq0mtdZYzxCQqwass2ShGCvnRPmesg
	XbYrGe0uVK1I6L/cI3kppZskPKPTdMOvWypAUCdu3h7I+FB5NF/w884oue9CZ61/
	7q8cgJu5xGBsC4KeuTZaxkZCi6zyvvQ20ysPThLy0CZU5UqFks8YOFrG2z0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736939656; x=
	1736946856; bh=WfiGYnphGqvudtD6RXFjAbGTohKPfJnsfNrRsHzlEL4=; b=v
	wKAEsDy3E1Ykbo7zHQnkulDZ0dw9Uq6wZLJvdF2P1jPNEiKelP0sTZHWecUpSK4E
	bZStqGKG+BWi+Jjfx5jbblUqXArW/EGqqg14euV5qQYyzba7tFTFLGOSeQb/hO2w
	BhJ/RVMEp3kiuEfKLJNM3uARulwsZNbAZ7MMiV+QizNSIKk76aOoNQ5bxToWdwJe
	5o41MBSDvENrjJidvtEzU66HcKY8fRr5if0H+hCPb+OwmayemsQU48Q5BuaJM2wR
	ju6vialqhZEfzvRe44PPV3Y3senx75wSOtZz2WJsQh2SJV8sZWdQfOAjzh4hBWXP
	mi+rHqlywRwL0ECEM7ydg==
X-ME-Sender: <xms:h5iHZ-TzRbIO_gAYgOY3VjI37faIMleEBMRyQg1mH2UYXw-ZC9c3gA>
    <xme:h5iHZzzMDZdpqhi8-3UCyQuNzYuPkbMOijBVB3w_ZwZu29Ln9Xfp8fCtSOYoFkUKF
    H4bf0YYuIMehl57Zcs>
X-ME-Received: <xmr:h5iHZ701Dv2nER0iSRwOguAnlOIELdt3JTr-saL7J-ngotIr8JoimO5satG9xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehlecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsuc
    dlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfh
    rhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthhhushdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpeeuiefgudffleffgeeiffeffeefieelveejgfeh
    hfejffeutedvffeiudevtdelgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuhifuhestgho
    vghlrggtrghnthhhuhhsrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlughvsehsthhrrggtvgdrihhopdhrtghpthhtoh
    eptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepsghjohhrnhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhgvseifiehriidrnhgvthdprhgtphhtthhopegvsghivgguvghrmhes
    gihmihhsshhiohhnrdgtohhmpdhrtghpthhtohepiihhohhuqhhurghnsehishgtrghsrd
    grtgdrtghnpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhk
    vghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:h5iHZ6AbdDiaMlJd_NyE9h9pPGqoL_kyecAzvQerQGY8KB27T5dJWw>
    <xmx:h5iHZ3hHBc73k9glAiSDdcm7NroFQbFOENCPeXjCT3KAFD6rdM9vWA>
    <xmx:h5iHZ2ra--n3r_7B1hIiNVqhpm8du3UvDp9sGXuXtEWx9g1VAGLBFQ>
    <xmx:h5iHZ6jMzJ4kt3dFosbgxo_BlqEZmh2UvEOCMFVypzI6wsJkyZR-MQ>
    <xmx:iJiHZ2S6O8oxGyN1Xc2vmjzK2g89oGa8otkdEQJzfWP--6K5l_UKeFWV>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 06:14:14 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 19:13:27 +0800
Subject: [PATCH v6 1/3] riscv/ptrace: add new regset to access original a0
 register
MIME-Version: 1.0
Message-Id: <20250115-riscv-new-regset-v6-1-59bfddd33525@coelacanthus.name>
References: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
In-Reply-To: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
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
 h=from:subject:message-id; bh=Bd0I0lIMKMC4KxEOjUIKWSGVerkNEic9IL2ALFZ+R48=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9PYZ5VutbCad5Tn5ndOR38uJYV7Dv+6vnvq+FfPTO
 Y/NcE6L4e4oZWEQ42KQFVNkySth+cl56Wz33o7tXTBzWJlAhjBwcQrAROaGMTI8d991KlKo4aFX
 I19XSsrdpJofD4xDWCJfvDU3FFGb/7qL4X8Ux5rc0wu8ddemZqSnL2Bb/XjS3wA172m/l4Umzts
 xwZIDAL8wRz0=
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_031417_743003_8F6DF995 
X-CRM114-Status: GOOD (  12.38  )
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
bnNpb24gcmVnaXN0ZXJzICovCgotLSAKMi40OC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
