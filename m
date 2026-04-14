Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA83CF9D0D2
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHjDP/rNR/3V03PdXmdw/f1Qf6SJ6inyQcel2Auvlo8=; b=SrIvdb1OMfS+TL
	NNAhEyvp/R7vR5aavPfZby86qkFyybSNdo3IP7PK/+2z7YjHo1qtSjUDiSriUbCJad/bvRroC227p
	bgwSaxQTj5AJtPcrKrQ3WX1Pq0QhArhNYT1YiF3vhMKqC911uEJ6/Bid+E4Qz9C9NBmLMF4vg99Jh
	p3ZmSBtT9K65gWbVcJOYmnjjfvhSDFRw07V9iMOFh/SFcHQbt4eu9WkNqSXNQ13ekAG5pe+zbXp3M
	wb+2u+DAWnX42DcYSdnkGxkqncbRuvw5lnQyY/rulyo6iVwAuiQANbNISbkKkSnRSa56v+IQRjMli
	CnS9OYCihWLLv2tP+XhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCelX-0000000HSEO-0bhE;
	Tue, 14 Apr 2026 14:29:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCelU-0000000HSCt-32fA
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 14:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00F714457D;
	Tue, 14 Apr 2026 14:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBD4C19425;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176959;
	bh=CQbeQ8MaYMOm5iHoZvEQ/hMjNQ3Gji9XdVM+EDT+8Dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OV8wuFXIDoAUX1rTDJ5kBHIhztHvdbBaaKuuVMRaLzaXaCH+VosQa6g9r+ggREXMA
	 n1d4eR+hlMXQyTyv93wDtk9S28wyfxb0X8+po4ZAP9PVk2OWN9eH0V9Am79RZBsxbi
	 nf6/h0lmTKyfraRTNBOjCWpaBvxJvfAq0Q3dOcmjq/Y00FM/yg6tRGd/uKAmYqglCU
	 BGYdvbycu3fZ9LlMl+AvQnEjftJdY1hC8QkNz51K+6vxfc3FilGgTintdNawNiS13m
	 Ruxa4cV2jTLztVfd37E9FJGk5uvE9kov0bdoII+Ucf2zB9tI1i4Y+jVcOVlOQFsA+e
	 yPsejlIvgMQKw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCelR-00000007oP3-47RN;
	Tue, 14 Apr 2026 16:29:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH RFC 3/4] MAINTAINERS: add maintainer-tip.rst to X86
Date: Tue, 14 Apr 2026 16:29:06 +0200
Message-ID: <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_072920_782896_C0711918 
X-CRM114-Status: UNSURE (   9.80  )
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

While the maintainer's profile for tip is there, it is not
at X86 maintainer's entry.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 620219e48f98..a85fcae5f56e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28560,6 +28560,7 @@ M:	Ingo Molnar <mingo@redhat.com>
 M:	Borislav Petkov <bp@alien8.de>
 M:	Dave Hansen <dave.hansen@linux.intel.com>
 M:	x86@kernel.org
+P:	Documentation/process/maintainer-tip.rst
 R:	"H. Peter Anvin" <hpa@zytor.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
