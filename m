Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707B1E77188
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Dec 2024 10:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BzrfqgYUSucxfbfNV1aRq48fRwUlB3nqYSE2+1fG4wE=; b=cDaTbP2S0ifjU0
	RiHwS5xBlI8nQW6cTMz+hdL0eCUv+1yHWEv4rJHCI6cTVvo7MdxGXWoss6B6CEyhWD6j/syIt3iEP
	J8myJVYcqg5q9fI/E6te7lbBuNKF4DiO/OAcEfdfI1Nm4rKtFOVuMuusDkPdhkXwCBsUkToEq7a3F
	6FOmWHQNwfqENHhP/O3mBfJAnWEK1C6a6ftAE85hjdVkWIxwxvAKmtBqBYux+efNv7sCJumFbicBH
	c8yoD4FNVMr39Tm2HU/NYSmdQ9qasxUrmvbyvRqjFbhKQTe1Q87uI7jk7LH2M4E07Sy2jBsAGX7vI
	v3pI1Y46SEUdf5oKhG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQlN6-0000000Fd24-2rvi;
	Thu, 26 Dec 2024 10:45:40 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQlN2-0000000Fd0x-43hG
	for linux-riscv@lists.infradead.org;
	Thu, 26 Dec 2024 10:45:38 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id 39C04200594;
	Thu, 26 Dec 2024 05:45:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 26 Dec 2024 05:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1735209933; x=1735217133; bh=10TP4Whk8LjQRQqlRFAekDUwjJ0f832U
	9TFD0lFXHEk=; b=O3ZDpFGMvnYG+CSrVLq4+/SJxqWpAP5iREqF5C41CM5b82WO
	4AVlLosR+gGO2SeTLfQwJ7TJ7+4o/ZTCZysA1n6D9cNZfIT95sqfXLRIS/LqrfKY
	gS8a8NgIFPSRCauKIjNJRZlJSPNhkPgHr21aVEqS35Mew1HoB2gcWzVhXJvC/IZu
	XlwL7r7VvKLGlXn3wEFj2Q90cHs5n78WpRX4laOJyx5u40F8DB+GrfGy9LqB31fA
	my8O8Ml0iZ+OF2NSpcAlPyMNmDWwDSiVTAwQqseCACyBxye4BEldfWu35Ph1UPlq
	8cwaxxoyo14LYxeY6oiJ+F4R+iPWyFGW+0pNNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1735209933; x=1735217133; bh=10TP4Whk8LjQRQqlRFAekDUwjJ0f
	832U9TFD0lFXHEk=; b=jcG0k9fxFoOWd+xvWeMDPKCguE/EnwNNzOpXDSHmTjfF
	AcKcqyNAkvZ6R4tXG9xrXCjKIPhcJSb28LaQq3trlD1IUsVcqFzPA1veSOV9qUhR
	wN5Gv1jxDJOfNTL973kceBLXBCniNhGbsurKhf4tSPQmpw564oZVgkg3xCSGVi2i
	ltlmzovUq1I6kSPt5XTPZ8RrEmpT4VfOxZbBfYtBk+3Xd7w+d4bSm+TQDo4rG+SX
	O28swrpkb8L+YUtq3gjot5vOHcVlDTjm0GO4GQUHLUexR63uPDBROuHzXMQmmDK1
	zUt7TkUQnqzeU+WXfQrAl5SBmId0B4+1pYHCIoBp+A==
X-ME-Sender: <xms:yTNtZ3mjF_OvGNjEuCG_k8O1nJ76PtOq8v5KJ9FTqF7DU-A-2uDXdw>
    <xme:yTNtZ61scadkc0R32ghI5iZe3a-XbXElc4I2xkoKErKsSrrKyx3QB50Zf6wAJHBYn
    Sih7dZKtpLZSGtOhwM>
X-ME-Received: <xmr:yTNtZ9oLy18uHGJK58QZWzIqVr5FjVuuEacOUt-vV8iGiK9lPRrkoBgIUktJQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddukedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecu
    hfhrohhmpeevvghlvghsthgvucfnihhuuceouhifuhestghovghlrggtrghnthhhuhhsrd
    hnrghmvgeqnecuggftrfgrthhtvghrnhepudevleffvdekkeekvdeguefguddtkeetuedu
    hfelfffhhfffiefhteejhfelheeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehufihusegt
    ohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepfhgvlhhigihonhhmrghrshesrghrtghhlhhinhhu
    gidrohhrghdprhgtphhtthhopegrsgholhhoghhnrgesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepuhifuhestghovghlrggtrghnthhhuhhsrdhnrghmvgdprhgtphhtthhopehl
    ihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpth
    htoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvg
    gvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghjohhnvghssehvvghnthgrnhgr
    mhhitghrohdrtghomhdprhgtphhtthhopehshhhurghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:yTNtZ_lT9XOzaiOY1-H0XLPrbDfrRTrUkXJxnxWVNF2Hr8tQ6-qS5g>
    <xmx:yTNtZ107tlxFjw0ryw8NfIN8_ichUfXCHLUidLCEl-nJu8Oyekl1cA>
    <xmx:yTNtZ-twjxPNurk_Hqt0V1oCBezgEh6V--PrEHCXDetleDi_fB33KA>
    <xmx:yTNtZ5XHx4iNDCk1fBbZMmx3DQBpRmCdCSbaNiNbQfsxeItya2w3_Q>
    <xmx:zTNtZwHj9mbG-s3d5Jpqgs_p9tYPHEzNssxR2pn2MDe9o-dnpNedBcjk>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Dec 2024 05:45:28 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Subject: [PATCH v3 0/2] riscv/ptrace: add new regset to access original a0
 register
Date: Thu, 26 Dec 2024 18:45:08 +0800
Message-Id: <20241226-riscv-new-regset-v3-0-f5b96465826b@coelacanthus.name>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALQzbWcC/33NTQ6CMBCG4auQrh3THxF05T2Mi+l0hCZaTItVQ
 7i7wMoFcfl+yTwziMTRcxLHYhCRs0++C1OYTSGoxdAweDe10FLvlJYKok+UIfALIjeJe3ClPth
 DqdFJJ6azR+Srfy/k+TJ161Pfxc/yIat5/YNlBQqoNlTWaIkqe6KOb0gY+vaZtgHvLGY061/Ir
 EAaJDhTOaxJksX9GjSO4xdRkmtPAQEAAA==
X-Change-ID: 20241201-riscv-new-regset-d529b952ad0d
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=FzHhv0FirWGjeDhpD5E/shY97Ohq8zvrZ4aJo4GEwtE=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9Fzj3awLwkR2y52fI7JCOC9gWnv59Y0Wjl26P1oap
 s3wFXt0sbmjlIVBjItBVkyRJa+E5SfnpbPdezu2d8HMYWUCGcLAxSkAE6l2Y2TYu1viN1fptIB6
 kTPPd768eFQzcYN6i9Gad+f/3O1Y+fFnJsP/uAU20S8UWyKWLFuos/T5KetdjyN+mGQmmG07/oX
 rBqM0MwDH70wJ
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_024537_573740_78E3B41A 
X-CRM114-Status: UNSURE (   7.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The orig_a0 is missing in struct user_regs_struct of riscv, and there is
no way to add it without breaking UAPI. (See Link tag below)

Like NT_ARM_SYSTEM_CALL do, we add a new regset name NT_RISCV_ORIG_A0 to
access original a0 register from userspace via ptrace API.

Link: https://lore.kernel.org/all/59505464-c84a-403d-972f-d4b2055eeaac@gmail.com/

Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
Changes in v3:
- Use return 0 directly for readability.
- Fix test for modify a0.
- Add Fixes: tag
- Remove useless Cc: stable.
- Selftest will check both a0 and orig_a0, but depends on the
  correctness of PTRACE_GET_SYSCALL_INFO.
- Link to v2: https://lore.kernel.org/r/20241203-riscv-new-regset-v2-0-d37da8c0cba6@coelacanthus.name

Changes in v2:
- Fix integer width.
- Add selftest.
- Link to v1: https://lore.kernel.org/r/20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name

---
Celeste Liu (2):
      riscv/ptrace: add new regset to access original a0 register
      riscv: selftests: Add a ptrace test to verify syscall parameter modification

 arch/riscv/kernel/ptrace.c                   |  32 ++++++
 include/uapi/linux/elf.h                     |   1 +
 tools/testing/selftests/riscv/abi/.gitignore |   1 +
 tools/testing/selftests/riscv/abi/Makefile   |   5 +-
 tools/testing/selftests/riscv/abi/ptrace.c   | 151 +++++++++++++++++++++++++++
 5 files changed, 189 insertions(+), 1 deletion(-)
---
base-commit: 0e287d31b62bb53ad81d5e59778384a40f8b6f56
change-id: 20241201-riscv-new-regset-d529b952ad0d

Best regards,
-- 
Celeste Liu <uwu@coelacanthus.name>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
