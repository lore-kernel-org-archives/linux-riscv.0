Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC403C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 06:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H86ycF++qMOqN69OR3/ePACEOa/C3tNA4SW0ltVfMKQ=; b=n55a/nh6Z8NniE
	1tKaI1/mKtUsGDp1DE4NkR4b1sRUY/KMJqnkw94b9LjjBdcMs5B9Bh9R6/vD96xcU+3tWx80uL0xb
	40gs+AfPf0wH8a86zbQJLrEBxHOsCMhg6K60CEEGeDzFile3NTMMCy891ybZNKIgsfVP9Z133LmIG
	DK2qC7vIGpgYYh75lJcMVgK1yWF7qEDEzY8TUNWobTpx4iMshmk7Pd5NdN3+YiVsdu2/KI3ZWvWzq
	GOvq22scyEb/qA9OeiZKogKdej1TEuEEIgug7+2RYD2NfvpPoQEMtUJ270jO1hEw1JguJFxFktrLu
	tJDuQ2FmvPSxGCV6OuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpkS-0000000Fl7X-0cMx;
	Wed, 20 Mar 2024 06:48:28 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpkN-0000000Fl5Y-1jCw
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 06:48:26 +0000
X-QQ-mid: bizesmtp67t1710917269tim8edwz
X-QQ-Originating-IP: N/gtq/qVsCImawz7+krmJbHB6YTzvD9BQyecJFGP9jM=
Received: from localhost ( [112.0.147.175])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 Mar 2024 14:47:47 +0800 (CST)
X-QQ-SSF: 01400000000000704000000A0000000
X-QQ-FEAT: eSZ1CZgv+JD7iHPpKJQ1UIkA+4LYjupyEdilj7fFRGppFaU6b3VN4VVL+xaGs
	zLmELMkKmtVwMndWR/RQjQDX0HtesOzf0zFnfdB7FlYzDJDthaIV4Mjdu4hSNmPqsEcyH2i
	DXw4Y9E+PZKmQ+P8cdRgiOydbZLQsmYF4BZtF1qV3ANa3hYiXzSl854TRPeBgSxIFCa7YaE
	ieveaQc6hh2UVh6cCvKqQcsfvXQzXQA41kXVDE+26Wt0jr4v/Hg/GQWHN/uihjOnKaE64lO
	3Ux21U8lsSNgCsdum9BNXsIoQqq2EcRer2Kh1dm/pZ50qOTzszWJk8YEwZkY2q9Eeklj1Vm
	0Wj7pNKuV1g+XSt0Ps8PVL6VNgplnJDdw6DGe897+znaNsr8KNu39dVjulwtA==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 4717924098038868021
From: Dawei Li <dawei.li@shingroup.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawei Li <dawei.li@shingroup.cn>
Subject: [PATCH 0/2] Minor cleanup of pgtable_l{4,5}_enabled
Date: Wed, 20 Mar 2024 14:47:10 +0800
Message-Id: <20240320064712.442579-1-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_234823_941878_1B9AE676 
X-CRM114-Status: UNSURE (   6.11  )
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

Hi,

This is a trivial series of minor cleanup of pgtable_l{4,5}_enabled.

Change since v1:
- Split into 2 patches, as suggested by Alex.
- Add Reviewed-by from Alex.

v1:
https://lore.kernel.org/all/20240312085005.298657-1-dawei.li@shingroup.cn/

Dawei Li (2):
  riscv: Remove redundant CONFIG_64BIT from pgtable_l{4,5}_enabled
  riscv: Annotate pgtable_l{4,5}_enabled with __ro_after_init

 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
