Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B50CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Message-Id:To:In-Reply-To:
	Subject:From:Cc:Mime-Version:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wzd3IfRrZ0gOe0gGrdNmlJfR4wH8BLbtsO9PSS50t4Q=; b=At56BwIzNH584r
	NIg/hiusJVTKAKcBueVUGtgHFGIlAifApXZDyeXe6jt3Q5C58fYh+RClXlI1hFcmrUrOOF+NkdQeK
	jn3v2OTfKcfmkEJr9X1hjkNEXPNPZUbzZJwfINa3h7yMyoUj3MHdIZEbXWTMseyySP8Djg+9OpvZg
	CZnLNJ5EDv9PdbwZsLq15kttXXuizJeS3fCC6d01AybLjXB9EZJ1f3f+Kru1Cz4t4Sd7DNUx7KxdV
	OmJV+VwySMRMwCSIiES7Zr3JYZ17Akd3AiWs40DY4hbkEIf7yjrjizN7SGN7qqh0tWYEJuowDy30g
	mgUVIks6d4Jwd0YRf9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohHM-0000000DSlN-3g5K;
	Wed, 20 Aug 2025 11:46:56 +0000
Received: from sg-1-17.ptr.blmpb.com ([118.26.132.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogoR-0000000DLsl-0spq
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 11:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1755688614;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=mzjRYT0rbzh6fz3WHdLobxA8DIlPVPxQ8fNKl0ROwWg=;
 b=WZs4rKGNAiVBUVAN987iRAzrCQuRlEqBEwwV60b9hNKLl6lyYhmST7WhCjtaHzpGg/xVAv
 iXu/hMI6miT0IRHzBIyp5azjmbVPzm+F6IBPOTYImvTPt8nsa2y4eDxhUZ40VDvvOIb8Mp
 R3jMeG2JVYc0GsCvzJD7PM3vXuWx2kexHPSMXvfPtp2ynMrejbqSTFKo0xLqGbH7jZjMzM
 VEaD5D2Y2Q5n5xVfWw7fgKW+iu3M0t4p8q4J62Aceax8GVxJMtO+Q8lSCoKhHv9WFRff8q
 smqyjli1s2oGEaMX+iXOaBDxyed7j4RAJHfM8KE9dIf/Nw57NkyDzGyLE0Y0qg==
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Wed, 20 Aug 2025 19:16:52 +0800
Date: Wed, 20 Aug 2025 19:16:43 +0800
Mime-Version: 1.0
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
X-Lms-Return-Path: <lba+268a5aea5+fef900+lists.infradead.org+huangxianliang@lanxincomputing.com>
Cc: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, 
	<huangxianliang@lanxincomputing.com>, <iommu@lists.linux.dev>, 
	<joro@8bytes.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, 
	<paul.walmsley@sifive.com>, <robin.murphy@arm.com>, 
	<tjeznach@rivosinc.com>, <will@kernel.org>
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Subject: Re: Re: [v4] iommu/riscv: prevent NULL deref in iova_to_phys
In-Reply-To: <17ba1116-35bc-4a47-ab51-0626006ee35a@web.de>
To: <markus.elfring@web.de>
Message-Id: <20250820111643.19464-1-huangxianliang@lanxincomputing.com>
X-Mailer: git-send-email 2.34.1
References: <17ba1116-35bc-4a47-ab51-0626006ee35a@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_041703_611686_50E08868 
X-CRM114-Status: UNSURE (   5.52  )
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

> Does it trigger undesirable communication difficulties?
No, and I agree that both subject and summary phrase can be improved

And now I do learn from this, thanks.
> Your patch will almost certainly get comments from reviewers on ways in
> which the patch can be improved, in the form of a reply to your email. You must
> respond to those comments; ignoring reviewers is a good way to get ignored in
> return. You can simply reply to their emails to answer their comments. Review
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n310

Regards,
Xianliang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
