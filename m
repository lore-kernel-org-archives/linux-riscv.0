Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5B606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 22:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gdzqrfZr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=McuQ4u6N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=2kc2Bnfj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QdM3Mwzh7pPhLgCVGuEC+QGRKaagwPloy0yOoAuSjFQ=; b=gdzqrfZrFBlBTgL5WIk1GxxXTm
	QHmp+7K1S/YcuQu3OKCTVPBvQ5xNui3E3445P6quq6Atfvwy8B7PfaK0mY2mx2NTsvo0RQ5aYO9EH
	Uny1lheKgjgXqdgAqTrnvdlXGtVRFz+7+4V/xwIX+ReTvG7ZIaaaxE+u3bZyuoGtJalDpAz7X+vr2
	cdQo8TFJLzGLocV+zWzMOWVo54570ZvMo/tOu11DwQBDX4EbUEe9Cd7RgXgsrpJi6WB8u8cfIB68M
	IdtrytkcHCJpWXGMY/T8D9qTqF2cc5pQYIjecebTksxVzjVnDlucw74DBq2VBZWG8ztERwIQpZ0Tx
	nZtvruRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToV0-0000000ARI9-0NCN;
	Wed, 18 Nov 2026 22:51:30 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToUw-0000000ARHk-07Aj
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 22:51:28 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id DF9FE1D000DE
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 17:51:24 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 18 Nov 2026 17:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1795042282; x=1795128682; bh=yo
	cfxdmltBMVaJIKGLzVjwYKlh96aJRfUwiGTmIerSk=; b=McuQ4u6NuNFb3OJFnx
	fBqlU2IdFdBtbBmmGgt+lDKjdRpktW+wRLQT0Rw/BgstwXn7wkqoaLuJhIddycYg
	/ZBzTo3rlh1rUlPkpqnBXJLXTgUA1sd5tiwptYmqsy8V87Ez8FViB6sf+ZXTz+zO
	ggziXSCJIouc2FiCfTf8LwaxQNix8bUILGRiZRn8+p58ShQSiFp8iQEw2sstNiT1
	i2TJDNLqYqO6KFzu2osDTYgQTPkkG+fKgEmU+Lke3cDdLlPeF+bGk7/dTXUwerPb
	nrZQ+3cP/RyYv4MhNMNbDT13B/gTuYCS8P9Hue7G6F8f1sa4DFMBI9gqzRQ3P/td
	D15g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1795042282; x=1795128682; bh=yocfxdmltBMVaJIKGLzVjwYKlh96
	aJRfUwiGTmIerSk=; b=2kc2BnfjD/ameYcqY+Z0uRs/LgKesGIhVFfWiyxfRYx5
	wIilZVNwCG3iT+Gjile4FrwqVA79smqKiMcNCH1T0YjIQySZ7API8823I+rwOH/Z
	43cK+XtKGc2JDwgoho4Y3hst/hetPjoR6mVtmX5tfyr7dHZ9mKcSqIIOrpAna2CB
	zr0BZrBnvMdIPFrDq7T36r6z6xjhYe8s2ExAxFgbrXqmlul09Zb+CY1Mb+b2C61D
	AUntbBIwfzfkP7KXlvUhA2Nk8c9g4YVI4EU/zQx8H16An+qYVGpB4dTsYeQCaKDL
	7UfE8IE8E40x2Ej4B3N07yxQd+vZ4AknBMwyOzmlLA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795042282; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:QlYtek2HpL9CJ+JKW5aclF9VsIEMExslvCIDpSPG0T+u+mf
	yktT3tEC5eBQrKx/3mCbXZfQvzUejqi+M+jo4EBnek7DMLDlbv/riihN7oWPS0co
	ljNwWzJ5AUfFa4TR/lJ8E9X3Ed4GGAJ2i2qAcCVgD5Zk8FzUQ/XoJcLXHTDcaTWJ
	poPb9Auwqz3ahvXR4nbBCuavSepVQGEXAAPGmlTEWOtXIt+4iJF0SRhQSTVm3M9Y
	Bn/AKD6nEYtQtSrw+88A7z4+iguoMlRnx+Msh2s2B4DPNPUqbzP3jf2FDklfY1LM
	KOjKjU9M4iOFM1LEQ+KKQhpgqaqz3oiNr+W42TQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:siRbW8xq4eTq01S9K7rwAmPitEZfp3du6esi6LFqbVQ=:DbMVJhyW4CFkskQAHCLc82yLpYiiKZ4nq2JsMR6q5mA=;
X-ME-Sender: <xms:6Sv-avFKRdsY56bCHNU_eb6fhdDP1zjkFqhqTJ24LntvTEOT88CWog>
    <xme:6Sv-at91yse0k_GD8b7QA93WYrt17gogpvSZs1tyZVMPUBi9lvSR9d_fXHjbwvCcJ
    MIKPgYgwGYhFdy5sOjCSrvLn-hzXl65Q7L-6QRcPcdsU1ATKjKfPDNo>
X-ME-Received: <xmr:6Sv-alNvcGkHbEqCT43v0nNvU8aA30iNjUxVhhUbxCK1cgQozIl0HFUzEdn8l07Yf0NaKuYEbyRZ84duME4>
X-ME-Proxy-Cause: dmFkZTGXPcSrtoExca7hP5m3Br2SmAjrZtg3cVX9gsgDlDTf+5zq8a5PkeehtQf9jkcGo7
    1nqIg1AOU5nNW9XiNtze1UEcprRAvVCi/WjDG/2gIYyDrAOCG2L9coyoD8IT1na0EISod6
    k4c2pTwpo2yKryLJlGWhRMvFgBbHrHhx36sPyJuXPXKKPAg1R/clsE3uh5qtf0urVdZ7gX
    E2QCCS9l8+Id1PFIaPpLwHkhiJjy+xTHNbewsncJagJhIXyCiRo0tQhjyR6M4ZntlzJhwm
    jrpqvdPVvKbBi6vCeWkwMvFnWAjyOR0mgTqijLwmvsrsvdvKHPfHechWkK/koONbeTVSdc
    iZ1E9O5sWynTg3G9gScGlz94rYNCUC1C9Q83jsxUBRk7Qh2LxEbwpxhoPZGKa3GsddHdHc
    AlwQEIkWPgNA+t8cAnxEU2E5cSlPKL6VhpantHI+BTzvIwymqgobB2ooL2sf0E2zPXCgNE
    rqBeLWEwAxzIBLSgDeni4IdVLFRuAMAWQkH5SwfDMv8E/nCqcyQ7KZ2/gYFvqPGGrx5cGN
    MW8guu+Ai58XsxI2iRNn6LyJmX1h43E/Y5Xwh07Lgf/3jhc/qgASzInTdWliJDiELdPMKd
    H7aWIe+5dl5TKJs6cm11g6R/Qcw1T8FtA81xKqHp7TwmGmWjAmyN6N+UyJRw
X-ME-Proxy: <xmx:6Sv-ajifeUmoS1SntL5JWQG0cJX0DPUxzY6vr838q2COJlnHsSVw1Q>
    <xmx:6Sv-akS3b7PEXX3Pro20QqH-oao6tGbJ955IUgYjYjeagTzyx5GxEg>
    <xmx:6Sv-amoTObKf2EG0XoQSPjwzRfvPF9RAXBvMR3iXC04dbf6hVTjTfA>
    <xmx:6Sv-avaQolN70kDSjfN4otMu0kXpxnKilpOWluOPEGWXSWeWriNjHA>
    <xmx:6iv-aiAxX3Jhqpxd4zaIC8rtYlMZfmhyJLap6kJnOeE3BBuDHgLNxdEH>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 17:51:16 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: fustini@kernel.org,
	guoren@kernel.org,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	wefu@redhat.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	chenhan0017.work@gmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-riscv@lists.infradead.org,
	lossin@kernel.org,
	m.wilczynski@samsung.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v4 0/2] rust: add u64 division helpers and fix the pwm_th1520 32-bit build
Date: Thu, 19 Nov 2026 07:48:24 +0900
Message-ID: <20261118224826.2491684-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_145126_147826_0C571A89 
X-CRM114-Status: GOOD (  13.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This series fixes the 32-bit build of the TH1520 PWM driver with
COMPILE_TEST.

Patch 1 adds a math module to the kernel crate with Rust versions of
div64_u64() and DIV64_U64_ROUND_UP(). Patch 2 uses them in the driver.

The driver only needs u64 by u64 division. It does not need a 128-bit
intermediate value like mul_u64_u64_div_u64().

Miguel, Uwe acked patch 2 and is fine with this series going through
the Rust tree.

chenhan's patch [1] also adds rust/kernel/math.rs, with signed
division helpers. Both use the same module header, so whichever
is applied later needs only a small rebase.

Tested with the doctests on x86_64 and 32-bit ARM QEMU.

[1] https://lore.kernel.org/rust-for-linux/20261031103206.24051-4-chenhan0017.work@gmail.com/

v4:
- Add #[track_caller] to both helpers (Alice)
- Check for a zero divisor only on 32-bit, and use the panic of `/` on
  64-bit (Alice)
- Add Uwe's Acked-by to patch 2
- Rebase on v7.4-rc3
v3: https://lore.kernel.org/rust-for-linux/20261030020209.3833766-1-tomo@flapping.org/
- Use div helpers instead of limiting COMPILE_TEST to 64BIT (Uwe)
- Add a math module with div64_u64() and div64_u64_round_up()
- Drop Cc: stable and the Reviewed-by tags, since the change is different
v2: https://lore.kernel.org/rust-for-linux/20260930101257.1649945-1-tomo@flapping.org/
- Fix a typo in the commit message
- Add Cc: stable, Reported-by and Closes tags
- Add Reviewed-by tags from Andreas and Gary
- Rebase on v7.3-rc5
v1: https://lore.kernel.org/all/20260929095612.1072417-1-tomo@flapping.org/

FUJITA Tomonori (2):
  rust: math: add div64_u64() and div64_u64_round_up()
  pwm: th1520: Fix 32-bit build with COMPILE_TEST

 drivers/pwm/pwm_th1520.rs |  8 +++--
 rust/kernel/lib.rs        |  1 +
 rust/kernel/math.rs       | 73 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/math.rs


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
