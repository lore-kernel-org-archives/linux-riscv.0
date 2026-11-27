Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B3C606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X0QtNxwW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOu2r9SE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Xr5NgYreGKDrhsQ6TUHJJAqjNCM3TkDnkfH7I+7557A=; b=X0QtNxwW3I+SmkEvdoNRJDc0Ad
	3SXBJJyztokditqJnsFVcNdMNPhFfi+h/az0LOxthp7GNiKghg6DZhv+BhxqkJbUuvjSXZORwPIQm
	VGeXYfxnyi9kEsApLJBEISPPjvUdTOLRF+E/8rIO5pJxwqBDdrFDHvvLq3/DocDle2NiyrpOnkZaF
	uN4yZSm5R/4BysXmpFQt+drbFv08Oj8XzMoa6xwX49dWFUZMu9DU1QDooJaD/1qIJOixYEZrLjmyM
	YuuUQdtQKU2C5ruZD+7HeEpxqkloFwG0EcjEz3AVeG7IdY0fxwg64TwIzcH+m63uqQerEwKfwP/4q
	k/8FnOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpFt-0000000F0r2-1opk;
	Fri, 27 Nov 2026 06:16:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpFq-0000000F0qU-2ykd
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:16:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2f02ee04378so60355905ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 22:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760177; x=1796364977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuWplakanAytLhzmNLShOdT3+3TOarOEOpiBZuZmu44=;
        b=fOu2r9SER7BYBuQnCZtB8gY86ndFxn7VhBTIuOPTRlM0j9d8+xzWMc+C5a+cq53upT
         GphAWNXToQp/nVTxGt01B+kuSB4My7BoYwrwIm3QuDVpLNW+MOHOIuxxX+zVjV6eJ7ZO
         SaazO3/ZVrug/b/w8Uy+xqzaOKG4O+btaFMeTN6vBaw1/qF1Z5Y8eoTvpeCxgtfoeS/k
         tbJjEu4bxnKiHOHx49D9qT5wrkGoiRTzNFFMASsHh/cJZ++SZfX6JTU4hou7b4egtWNj
         1VVI7L+0R2jHciLBORCe0bRbit2Iwc0QRWHIuBC1FBLmcspYp/6qfysrhJZ3Oq+PYNvh
         JtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760177; x=1796364977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuWplakanAytLhzmNLShOdT3+3TOarOEOpiBZuZmu44=;
        b=S/19SnfQLGLWSl5thEm7zPX4Q+ihrvQ95eczU7KvIDktdpgMjMvN3O85rPKnWeEod9
         iK0nX9b0jp4CLao6bCC0D63Bc52MHT00V4VpDuVNJUG0O7mu86gbgpbhz5Ly8GEjVTxR
         lg5dOBSL+L7UV0Dr2mo23kMzDgM2BTTm7CzsLu9QtkWzRjlyJcQ2+PMPdNZgnGA/KB/F
         VSd46Te80ptUywdEd0uFfrow/EJ0p22+FmXfyhrhJsrPsKsIfJsGkULPq8wsjNGQDV8W
         1UdIO/tLDnWT5PbuEiSM+Ju/0jIhF9XXgqo9LodyaPtLTNyE6t0jG1XCRUuo/LTvfjz7
         cD7g==
X-Forwarded-Encrypted: i=1; AL+hErG73Zjaopa2LWqnE5iUoLWX7NGA+P4m/MmPS2L0hmUCsIaSe8p4Dlbi+ly0Qsjl15xUCOi9wtynlYzqBw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/L618ibYEyM/HPRVzxBNwnVPxwatuEv//59K+/dYGVBlrrNCQl
	ep8lJcKeblUwYbM8ir3pcj9bRtBxJUa7iOXX5SQQGQ7S5J2fpP+Qikg3
X-Gm-Gg: AZFdTZc2Le9ye8ILhj/GEGk0t7l8V54Nq3PLEiiKhovwCPIcJZbLZM3oOpM6fIIVWnJ
	3cVNI175FRykBsZJNXjhSgXSlEejmGBzISQx4WCMc8nUmMXUMZ7qv8zKIyTqyt8TL7eUQjQhDRX
	Rk/FSfF/h46Oxq5/Mozf50EJW6SxF3h9F4c37b/icklESZUoe/44ugCbXoTvj5bFfHHp0F2In0Z
	0SKyJwLWIuOzcBGCKITN+G+DW2c9+K0JqWNjaTeO/PhlO2oUo7tFVH1MoCnxfpPqoNtwII4/KNO
	0IRkY0UYMuFmtBPYibZ+jpDzVnUHWVFjU6XZh9/ui0vdERfXyEFIWHFOqwteq2e+I+YMedBOr/H
	yNEX5ToISDseU1GXuQpG32tk9FSFNbcq/zuO2+r3+QPITyxLfwrxufcdgMCBWgh+25dLKclK4IQ
	LF7daeG5ZezTwnQo83QAMi0bD8+/0/35kDrQlsdzsE9aW2jnxdAicSnKGDgqjQhsy5wJPqezKvw
	yDC0uMNxjAh5uYCwg3JbqlQxe5Nd1Jx0i1NotHF/CNXpYFK46U2hDOtm/8avfllzZ86odkHLZD0
	Ei/XDrhHQNnhkJh+pEODtZDo11EX13r6CSnxau06BdY4mPufb/c67KZiuniKvN/KpfjXMSzxt3O
	E8KVAwu+bzs/FvrGLAU7ADn357YfSTPap5iWhW1PzR5R/0py+YZ7erZYXpsb19/337HUu9cv1lY
	DOQuxirMnC
X-Received: by 2002:a17:902:ec8a:b0:2f0:446d:30cb with SMTP id d9443c01a7336-2f0446d312emr253910605ad.15.1795760177447;
        Thu, 26 Nov 2026 22:16:17 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:16 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/6] riscv: dts: tenstorrent: Add Atlantis platform
Date: Fri, 27 Nov 2026 16:44:20 +1030
Message-ID: <20261127061432.17306-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_221618_756227_134EF9CE 
X-CRM114-Status: GOOD (  12.30  )
X-Spam-Score: -1.7 (-)
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

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The series adds a bare bones device tree with the CPU, interrupt
controllers and a UART.

Patches 1 to 5 add compatibles or extensions to existing bindings.

This version drops the aclint mtimer binding patch, which will be posted
as a standalone series along with converting the relevant boards. The
Atlantis device tree omits that node for now.

The series has been boot tested on QEMU and internal development
platforms.

v3:
https://lore.kernel.org/linux-riscv/20261109051050.105623-1-joel@jms.id.au/

Changes since v3:
 - Drop mtimer binding document, will be posted independently
 - Remove mtimer node from dtsi until binding is finalised
 - Reorder properties to pass strict style checking
 - Use the correct value for the timebase property
 - Add cpus label to cpus node

Changes since v2:
 - Fixes to prcm_rcpu and aplic dt nodes
 - Drop uart1 clock override. UART now depends on a working PRCM driver
 - Drop bootargs console=ttyS0 in favour of stdout-path
 - Justify aclint mtimer bindings

Changes since v1:
 - Rework mtimer bindings, fix reg property, update compatible and use
   priv spec as reference
 - Drop Drew's sob from bindings patches I wrote
 - Add Drew's co-developed-by to dts patch
 - Correct aplic num-sources


Drew Fustini (1):
  dt-bindings: riscv: add Smrnmi extension description

Joel Stanley (5):
  dt-bindings: aplic: Add Tenstorrent Atlantis compatible
  dt-bindings: imsics: Add Tenstorrent Atlantis compatible
  dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
  dt-bindings: riscv: Add Tenstorrent Atlantis platform
  riscv: dts: tenstorrent: Add Atlantis platform

 .../interrupt-controller/riscv,aplic.yaml     |   1 +
 .../interrupt-controller/riscv,imsics.yaml    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   5 +
 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 .../bindings/riscv/tenstorrent.yaml           |   4 +
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  29 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 467 ++++++++++++++++++
 8 files changed, 514 insertions(+)
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
