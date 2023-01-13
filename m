Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F34C61DB3
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IMV72CdVVb8WLGf/lZ67WHz8LyZLJZHKOiqHcsXz1YU=; b=h3lLg5ioZkZI3X
	2VBtdCScv3V8U4gf+Nxni46FH7iMDwmsq0j40He3644Cu0mYSVHuTZAaXODbFA5rY0W7C+nM491hU
	p9Z+lKql4c6pfPz78KBksn1LUCS4sk58bZpSxBf2piAPNZTaj6/iypuz8DwPYfdopi+qYr/u/JGSd
	2HGIry6a1fFph5H5DUVZAQSsU9sboERukSmoS7170UvG9Liwo9HPOudm6AdvqjIf+MhmEqblfHl04
	szkRAF0f139DuLyBVhvhyRchT0zh8dt5BPoalk1l2pcAtt+IBt6Q0l2LNnQRT1qXuoKZCyLbYyQY7
	AYjtRS/t7EHjpDEpXNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLJw-0032Ef-0C; Fri, 13 Jan 2023 14:46:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLJs-0032DL-O1
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 14:46:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A4C6BB820C9;
	Fri, 13 Jan 2023 14:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0663C433D2;
	Fri, 13 Jan 2023 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673621169;
	bh=ug6esbEt6V0hi8pr1Nu8LN1vIj7A2m5V13oqI8rkOE4=;
	h=From:To:Cc:Subject:Date:From;
	b=cp4nFzFA27R711YxXAVF/0Iyn2pGCOXN0pLFn1pYEMZNX8oxCrFBLR9x/qc8ATlv6
	 ZwPI1ieK5lYhL82RkXtseDm7nCf7DAJbRj3MnNoAN5mxwjm/FHxuQGXqJxWzH/7Nnf
	 zcLyNJVQAU3GdkVioFwXniVHzV/6TyxiH7CaGyBe4EWuJVmBjJtBvhMH40nMGXqmoC
	 vzIzCWUzRxaIh1OASIXqj+1wZwVb1NxtU0Esyz5Og01vKcZrqPhkgDAGBxBOkBcLHX
	 vteorU/ImeUtFfNiLiCqUWskwwrXGkfvPyVyzLh2oRqvhBjBcodPhoKea4hTiAIxIz
	 4hWFQ7FdnTBRg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: Add "Code:", and decodecode support 
Date: Fri, 13 Jan 2023 15:45:50 +0100
Message-Id: <20230113144552.138081-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_064612_945285_2B00175E 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKUklTQy1WIGRvZXMgbm90
IGhhdmUgIkNvZGU6IiBkdW1wcyBpbiB0aGUgT29wcyBvdXRwdXQuIFRoaXMgc2VyaWVzCmFkZHMg
dGhhdCwgdG9nZXRoZXIgd2l0aCBzY3JpcHRzL2RlY29kZWNvZGUgc3VwcG9ydC4KClRoYW5rcywK
QmrDtnJuCgpCasO2cm4gVMO2cGVsICgyKToKICByaXNjdjogQWRkICJDb2RlOiIgdG8gUklTQy1W
IHNwbGF0cwogIHNjcmlwdHMvZGVjb2RlY29kZTogQWRkIHN1cHBvcnQgZm9yIFJJU0MtVgoKIGFy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystCiBzY3JpcHRzL2RlY29kZWNvZGUgICAgICAgIHwgMTIgKysrKysrKysrKystCiAyIGZpbGVz
IGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6
IDY4OTk2OGRiN2I2MTQ1YjJlNGJlYjhiNDcyZDMxMTYyZmZhNWFkN2QKLS0gCjIuMzcuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
