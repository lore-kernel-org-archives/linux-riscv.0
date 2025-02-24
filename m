Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91F9C021A6
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 11:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TtKFZMA7iAP6NRiUUjumJ2qA0vAbABEXQznkvMf1X54=; b=H28jHOpo9HzqCx
	UU2rdGAxrpxmkx60MBFZYgMQdMogMQ4bz62msguhD1RvfHc+hSpxcyDtdJ4yII/zN/hRg0nZQwrFp
	Ev8Lpj8oHHVAsML7j04d+xFCbZVTtB2WjjKSSFVw/4QXWa9Z6NRSH1qzGzPRogLqecYwdzuIeegEF
	fh4/etBhXTSI2+WvOtfolvndKD6FLVndk/3ilW4fHTQTBhiFD7YsVmvXQ9WMqeZg3HXeZiXbgT83i
	/pF3dJYjlJuF1VToF9WfzEtEsaGpZ2q5YNq1RHE0QVuiP2S1Drp99PqHkpnrWIAJOCXLlSEemf0on
	iqyMhFuwJ+7x2bsqpiKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWje-0000000DQZk-2a2o;
	Mon, 24 Feb 2025 11:34:54 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWWB-0000000DKdK-000d
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 11:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740396055;
	bh=PEZ+XmHReJkvOO8ckw/Sp6e/Ys54sWdkMmIRDD4VEB0=;
	h=From:To:Cc:Subject:Date:From;
	b=enHf0tfAHWymo5wtzHP9lT0kTKne9eaEveqFQg9viuU+wCQ8SziFN2JNJhmVneul8
	 FGBw9M2ivI2HVxkGGdEjIyaGQnNNAWtIiqIFZ/waj4m5LSMo4Y77cwsuDCeS1jPWWr
	 J09MQ0ACFxs5EAXS2XHkAtj6nGgiv4v3dyMIEai4=
Received: from stargazer.. (unknown [IPv6:240e:358:1110:6100:dc73:854d:832e:7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id EFCB21A40EF;
	Mon, 24 Feb 2025 06:20:49 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fangrui Song <i@maskray.me>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH 0/3] Drop explicit --hash-style= setting for new
Date: Mon, 24 Feb 2025 19:20:39 +0800
Message-ID: <20250224112042.60282-1-xry111@xry111.site>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_032059_067038_ED9000CE 
X-CRM114-Status: UNSURE (   6.25  )
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

For riscv, csky, and LoongArch, GNU hash had already become the de-facto
standard when they borned, so there's no Glibc/Musl releases for them
without GNU hash support, and the traditional SysV hash is just wasting
space for them.

Remove those settings and follow the distro toolchain default, which is
likely --hash-style=gnu.  In the past it could break vDSO self tests,
but now the issue has been addressed by commit
e0746bde6f82 ("selftests/vDSO: support DT_GNU_HASH").

Xi Ruoyao (3):
  riscv: vDSO: Remove --hash-style=both
  csky: vDSO: Remove --hash-style=both
  LoongArch: vDSO: Remove --hash-style=sysv

 arch/csky/kernel/vdso/Makefile  | 2 +-
 arch/loongarch/vdso/Makefile    | 2 +-
 arch/riscv/kernel/vdso/Makefile | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
