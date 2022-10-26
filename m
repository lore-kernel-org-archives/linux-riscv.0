Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BEAC38A2D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Vhdd3vxRZGu631MiBVpOL5VCjWUf1kEadYWNFxZ5uI=; b=zLHx8T6CSaoGvv
	p8442RMhlCcMZL5HmUadJu0Hkt7NfqVzfOnt1Abow8jdFfDvGc33I9rDXMrNFj+ZUIN207E7LOi/5
	JNWegmI6x3Id1j0ou7DynuSX9+CA8IkV6anz6WwiHhACTd8CibDoV1cOSlOCQX2+roSNZlzt2KCHY
	tHOeSFVqlgQZtrjN+1yCqJEp76jbs3ZnvL/GiF4S0gTbiUpFV59yUpfZO5iPXKHJD8M9R0nDzTmzL
	VAlt9hbwa8k/C76mUT3vO9TXsITp9ywCxc5mgvijD47ywjpzDe8PkWO5Hsn4vbbFj/n2E2oOOVORd
	+vxBrL6QaTsCBfX7xJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ondrG-008wjB-62; Wed, 26 Oct 2022 10:42:02 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ondrC-008wc5-Kx
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 10:42:00 +0000
X-QQ-mid: bizesmtp72t1666780837tnocriqo
Received: from localhost.localdomain ( [101.6.93.82])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Oct 2022 18:40:20 +0800 (CST)
X-QQ-SSF: 0140000000000060B000000A0000000
X-QQ-FEAT: /dh/S7faoAIKBd2C5GJ0Of9RdLfgrEtMrQ6BkXeX3UpsjiE9o+0zZjJErafrq
	EQHZDShdY6rYXbwDzIeMAxgarEhYQpkR7gHDTnH34j3AgEd8k5kMMwm+OZ0rFveFbDGLrar
	9CiYRl5rQlpEAXIYCvf7Q2cgC1rjBBzjh3TwgQqjcJgQt5IR5AysKG6xT0MHA6XiUMw9crD
	liPjbpXBcn1uxknkvCRM6RI9mVoMT5B3A7SRFtxx2JIFSh684r0u+FZ/rWDSz+viC5AzsAw
	XSUWgxypCX2kPhnzBRPDEpnMWOsq97lb1EQeuskD+ppNGk/0yoclTO5ujzqWJ0ydQEo18FI
	HUwDcKxqzcdOkuzjVuz40a60qD6hNn/HjaGHGVN70Qr8KvZXMnwaWpQD0cgVWEBWeGBpGRH
X-QQ-GoodBg: 1
From: Wen Yao <haiwenyao@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dennis@kernel.org,
	tj@kernel.org,
	cl@linux.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Wen Yao <haiwenyao@uniontech.com>
Subject: [PATCH 0/2] riscv: Rewrite percpu operations and support cmpxchg-local feature
Date: Wed, 26 Oct 2022 18:40:13 +0800
Message-Id: <20221026104015.565468-1-haiwenyao@uniontech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_034159_095970_137D25EA 
X-CRM114-Status: UNSURE (   5.17  )
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

The series try to use riscv amo instructions to optimise some percpu
operations and select HAVE_CMPXCHG_LOCAL to support cmpxchg-local feature.

Wen Yao (2):
  riscv: percpu:Add riscv percpu operations
  riscv:kconfig:select HAVE_CMPXCHG_LOCAL

 arch/riscv/Kconfig              |   1 +
 arch/riscv/include/asm/percpu.h | 101 ++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
