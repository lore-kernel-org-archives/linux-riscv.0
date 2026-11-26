Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF061606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X+wClG06;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S2hH+FUi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nTzsznre2SaBHrE9OTz4qiLbgAoKEFORlX1gY0XoNTw=; b=X+wClG06k4KVbsWKS+k5KD9ZRa
	OZ55ccM0kwrtmxwttfuj+MF1VIbmmVf0AtV8j0LFl4CHsdWf8fPSWCGXZ+o38LM9eakFaHf38no/9
	jAZ/k0Xaum9DrLLsx8tXAwPwPNcNn2rmZhsIdM5Flfmw8pKBCNZ5jb+Ix3tjDPail+etOVuNYybWt
	q1ICtvCNnuftXwNP5rrwRPWhHcp0Q1O8oMAavMrx+wEWKoztjOSb/6Ia1uxSN9JAfZK1rRS9pPpMf
	nDqKYgV2BflJD/tVFJn1SU4dGeNp4DiFabBux/KT5db/7SNOy4l8SobWmdStTUHjgC5OVzXZlrLt0
	o7hp1NgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXud-0000000D33s-1geb;
	Thu, 26 Nov 2026 11:45:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXuY-0000000D32H-4B5m;
	Thu, 26 Nov 2026 11:45:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D76643F1B;
	Thu, 26 Nov 2026 11:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8741F000C4;
	Thu, 26 Nov 2026 11:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693510;
	bh=5BVeDoXywdonN8l0fahN7PgNc5xFYXRHYBZPC3PlIr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S2hH+FUi1whGz3Tc5erJ4wvaQIsa7/tWSP/c6X9vu53OBUKo1B0WiNAclJt6yAFgm
	 pGz1Ex70shjn/h1DHItCYjmiSeUn89UCHCA4G1w1wWeCAdswE3zJrMKPMwFzKMZlDd
	 nC0SY1V0v4hU5bqu5wSTOQsO02ln/4LBS8/pU19gTTq8a94zu1u2oRzquyVVWvfoyJ
	 A9Q9F5dRlSSngm44CD8uAUW6WllAHTLL/ZABWNrv2paiBktHMVqFSwsqVP75fnKoBF
	 d/7+x6dvllgHhWRvd2tJbeHoIPzncqy0ud8b0/7wXvqdGK8WsxcZSCgR/1wb4XGsOs
	 rx6swYcSlIfow==
From: Mike Rapoport <rppt@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Paul Walmsley <pjw@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Rich Felker <dalias@libc.org>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	x86@kernel.org,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Cong Wang <cwang@multikernel.io>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	WANG Xuerui <kernel@xen0n.name>,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 0/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
Date: Thu, 26 Nov 2026 13:44:53 +0200
Message-ID: <179569348034.4110350.10768570671103859123.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Thu, 19 Nov 2026 08:16:56 +0200, Mike Rapoport (Microsoft) wrote:
> The intention is to take it via kexec tree.

Applied to kexec-7.5 branch of liveupdate/linux.git tree, thanks!

[1/2] MAINTAINERS: add kernel/Kconfig.kexec to KEXEC
      commit: 09ade745fcd10af7fa62c73a918cae6814c5b0d8
[2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
      commit: e583fcbe5b58597fdd81bcf150115fb801d6507f

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: kexec-7.5

--
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
