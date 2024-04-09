Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2606ECD128A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:Cc:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O59LSh8oj/+dgOGMdR+dpBrSQQCFNN76q9OTpHN+Ehk=; b=RytUPdQkf0GzUnSKRw8pQcOmFl
	OvPTi63Yfmk0j4PzzkFGRX2nPgXqn0UxLQFi+YrMN9tBSijawBrA0+FifSbUPyYkFGC8h30M4FUDV
	9mCajLGkAPnn4/Q3HMP44r4yTUkcbihNWB9CGhYMyAGI1z2smN5+HWjtXsr3a0ZalbbDZYvUamj9H
	pHZaT1MPzbAKSV1PQa5qSRTaQ/ewAfGXZvzG3/HfZ8vNabk/oaUbVlaZet+pEoNO3cjNAWxOPPAEa
	W7z1oa3JaK1GU0nOg1ROD2bnFOJMZwyjk3OxvDRh3KniNh+/J6W9AuNQJ9S2Izu5mKnMYvyrfiU2f
	sKF0Q0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruE7Z-00000002tGN-2E5X;
	Tue, 09 Apr 2024 16:14:53 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru54L-00000000bow-3zRh
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:35:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10BA560011;
	Tue,  9 Apr 2024 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712644485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4ChUJoKsTIUTsjschtA5hnvvRgolV+/9imLOULnyrZE=;
	b=MyE0rfoGw/tc2fjfnrpjx/Hf6WThHiaR/oyc6YqNWYqS9JYpFCVaHKILUMKg5ekXcds8nq
	1fR6EiM/OuPbtI1RPABBAcYyk6iOwmSARPEeG2KTHUNuyquUCrdmCmOCM6sCXokxnNU81P
	bSDv6Iyc7wq1tkmItA1C9TW8+0LlE67nlzqmlwtCsGMIZMrmRRa4vvNVJrMtOAAByHBtuT
	qFURWNB5i8uEz7vdkjHfmiFpGHOTUMKXF3P7VK8UB/WI+ED37GhE65TvwjRjwIyriHJYco
	UAeMFTHQksJfiEJFkzZdtH+nzgS7sfjnXji7l0rj+/ZTuRC25fjdK8dmZOIMog==
Message-ID: <d24dac0c-fec8-49db-a4b7-a31a84cee454@bootlin.com>
Date: Tue, 9 Apr 2024 08:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com
Content-Language: en-US
To: linux-riscv <linux-riscv@lists.infradead.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: subscribe
Organization: Bootlin
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_233458_267066_C321B245 
X-CRM114-Status: UNSURE (   1.08  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 09 Apr 2024 09:14:52 -0700
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

subscribe

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
