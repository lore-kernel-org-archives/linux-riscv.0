Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FAB606A334
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 05:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RgenFzYp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iT8KzmdK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UXFpvRaypHS4ToE5/WgIMEP95OULgJTdY3OY5knYV7A=; b=RgenFzYpjeghXNEeugFu05mGp7
	XG3wPbn3b/g+S03z5tQOXRrrfJ45NacR3QnWt06sz0KH37youeqjrZ4nBTo+CiPM1UWd6JhDU2v6d
	JWd4SFOFBKaG0wzhJeyjc5N26xqOZkZIGaZqI3wQ7MzWQ202YVNM8tvJQS9jgxs7WV9RlbmbLJwSq
	3bh4zRnw9aC/Mcl2Z8m46dKkboi678KTGdkZqOEJQ+Tc3uC7TZKKVgnVKk91duEKOFsn3upXJeBIn
	Dxr+6N5IKWLl/DmPtj50cX2FP/HeD90MEqvl/xus6z0nCjzP2fMXGYUkRcoBKq3S+1rE8L4wacsGB
	OIMkibIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHev-0000000HNXG-060d;
	Mon, 09 Nov 2026 05:11:09 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHes-0000000HNWt-3Z3K
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 05:11:08 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so373480a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 21:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201065; x=1794805865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D449LhD7l/M4eoG2H1IqG5sJ2LKkyD1oeJVEusqP6Ps=;
        b=iT8KzmdKXIcWLZJyVJbokvkCdc4SOkI/SCoxBTUp+0lvgXGWS81vGbNTDtuU7k/4F6
         bzXmhVt6ffOh/YvbX+M00xsgH+f9EdQF4W+2ia4xQRWDIgN+l5jd8fvkKd3NJcgmJLFV
         fO13qSwBBdcXwOcVH3A+jVEzEy4utz/9iREubxBLyryNkqIJLUyiP4Tus6yYPwPqpvmV
         H9RLjC+X2T0SqXPumV9P00wcVgUSOjkGR/wSzS2XWk6cxdgDTSra4PuSOO+paX0XljxM
         8/JMhN5EF7G4lb4CrLha7qjXFBYcfuh6+Q9HR/+mo0hlD4FA7WTlzzp6KqaCN0a0f6jm
         JiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201065; x=1794805865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D449LhD7l/M4eoG2H1IqG5sJ2LKkyD1oeJVEusqP6Ps=;
        b=oH7PzkGWJ19d21mfvi+jMh1wORag82WHIghE01o11ils2yFIoRmQZ/iqkeMOQ++JZQ
         0Kmvsl93b7s9/Z64A996I89wIjOkzxj2bJrHSVM/HSXOlSf3tGVBSsgE/KAN5JIqTmbE
         A+IpaRUiE0suAd7e45nf1488zYV1rwhVCAuNGKHKzG3IXFAEHu3G1b2KzydpZyAOYZ6K
         vBo0Yoi2JthspTP26kDlvHklwD0hSSa7dq/uk8WUJq5bGA2DpGc3donforVCmycfvaid
         iTTkW4VlQnqXniFcXUXDPybVPJfDlhgO70HhSFwn2aj+D092dIrcDUR7UmOYTKaVeGmD
         IeLQ==
X-Forwarded-Encrypted: i=1; AL+hErEiZWel1yAvgu4IsKCQAv/1xfbR0PHkjkOqZU+E7aJHY9Gq6iBV6fR8iLDSTGsw+iIZEpP0dVmgRwcE1A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8KgIGeZ+IXAVXKlwzFOP6GbcJYgsEIWCZaP35QnG5EyCby1yIr
	KIVrA+FGTxvjoI72ZGJ4/x4OBnkfG6Fy51hlk9eiV0xzcClWTpNWPfOk
X-Gm-Gg: AYBFou2dzEJrvNIENivbauzqVhY2gQc86x/JVZfbbl2332wSSEtbaILPM1M6JG9tUAV
	Ldsx3q5psCYUotBGnRbDZNO/Bseo4zIDlblEiICJN0VGGhGObpbJZxjp65Hng1OO1CAPOTjzMlL
	h6zGGgi8CTTA2QO9v6XotlazWN+0TtzQySlMRg/1vc9DaYhmOvFFYsYx7L5GW8133z/p0pEcfGz
	APIOHiiywa1JaLGCEyOFN6nDFE2hClHiynMGMAgWrlh9pnHZIZw5UNd6NTBSqiSi+a0hEWN0djV
	7K9HdtZKYR1V/m0vLZHc0HMM7sW0euRZHhjT6gNNUlnCu8157vfo5BtkyY+S+KO3bdHaHzWRoHw
	7UWeMZj2ww175e+aoIcp90qodrPAF2bvnKWfC0s012R0x/Wx2Cfxr3d4EJJJvJWRdekvkt42uFt
	a6e8yF69Nu1S7h70AFUs3x60qACyw3cF3d6/o2x8V59lFgmmc2Qw2U2VGa8CkvmrGbTq4UKmIrK
	oenj5Vns5QQgm+lAh206NDJtpCjsODZvMHI1R4nPYxNb1Vxl5nignMl7x8qUzRyijv6fswus82R
	J5621Xt7lYSqlNgk94kb3ZHYa4NSQLhLEmrzD829AVG/u5Hp4NyYkEjEkTAGHUsp/LDn+LhoEbD
	3VdKjCpNXd2xNjkE+nArJpZ9CHqyekU4283YYktGW2r8NMnAbpONSMKJllA==
X-Received: by 2002:a17:90b:4a52:b0:3b0:9691:a240 with SMTP id 98e67ed59e1d1-3b12d43ef09mr3289122a91.47.1794201065020;
        Sun, 08 Nov 2026 21:11:05 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:04 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/7] riscv: dts: tenstorrent: Add Atlantis platform
Date: Mon,  9 Nov 2026 15:40:40 +1030
Message-ID: <20261109051050.105623-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_211106_982502_02D09B85 
X-CRM114-Status: GOOD (  12.90  )
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

Patches 1, 2, 3, 5, and 6 add compatibles or extensions to existing
bindings.

Patch 4 adds a binding for the aclint timer device, with a new rationale
for including it following discussion with Conor at Plumbers.

The series has been boot tested on QEMU and internal development
platforms.

v2:
https://lore.kernel.org/linux-riscv/20260604143957.668047-1-joel@jms.id.au/

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

Joel Stanley (6):
  dt-bindings: aplic: Add Tenstorrent Atlantis compatible
  dt-bindings: imsics: Add Tenstorrent Atlantis compatible
  dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
  dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
  dt-bindings: riscv: Add Tenstorrent Atlantis platform
  riscv: dts: tenstorrent: Add Atlantis platform

 MAINTAINERS                                   |   1 +
 .../interrupt-controller/riscv,aplic.yaml     |   1 +
 .../interrupt-controller/riscv,imsics.yaml    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   5 +
 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 .../bindings/riscv/tenstorrent.yaml           |   4 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   |  56 +++
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  29 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 473 ++++++++++++++++++
 10 files changed, 577 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
