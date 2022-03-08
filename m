Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF21C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N+/xlTonl3FnIQmgOlw+SZ5ANORSYYhdPLcDa0j/C3Y=; b=hdLHZ7+KRT9Onb
	W0f/lv2bru+dmILaTSVreVKQNfu29sCuoCKKz4h6Sp/gMk0qlVNqgqXiG12gY0a1bnSKyoM4+4XWK
	dSQAfTkPzW8199gMdj1bDSlmYG75+b+JckhXMJ/YTyyxsZe0WNL6ZvhYhIKv2gTNVASOokVnmuBWP
	bZ5mwlXtTx7QhmE1FeITXayKDPxY5Y6XxJ/H2cpsTPQo/HLk3QSh5FYV6smuoz7t79LBiZ83fhjy+
	uiHOdpK9EoYjnlBXsG3o2Iuio1xw3FHg6x2fyDs9Z3ezg9Ei93exiHVBAgii+3msQUpOUbCnYSC6E
	98grrNp/gTluA8jhL05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVUf-003KBZ-3T; Tue, 08 Mar 2022 08:46:57 +0000
Received: from m228-4.mailgun.net ([159.135.228.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVUb-003KAp-Lm
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 08:46:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1646729213; h=Content-Transfer-Encoding: MIME-Version:
 Content-Type: Date: To: To: From: From: Subject: Subject: Message-ID:
 Sender: Sender; bh=lHguYWFLNP+Vpdt2MriZKrF2GwLExhyzCEHi/ngh5vk=;
 b=QDWGfFPsWfENfRMrlGomqe9ZoTsxq94sM/gYKAfrr4Kgo4vLWcGD45S4P/Qtvi3NwAhBlLL/
 m6Qr7IAjOz0wgY7k1BXEWuK/QjVLUZt+kBJ3gpsz5EgMwzxaN00Oq6O2WaDI3H3ANFTc+UcV
 ZOP1oOwPEJ+xiM8I+jcZx8wFB7U=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 622717fbea5f8dddb5dfdfc6 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 08 Mar 2022 08:46:51 GMT
Received: from qpc.home.michaelkloos.com
 (cpe-173-88-115-50.columbus.res.rr.com [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id AED6D40176
 for <linux-riscv@lists.infradead.org>; Tue,  8 Mar 2022 08:46:50 +0000 (UTC)
Message-ID: <4407a08d90278522b95b7b0e8aba54f372d0ad15.camel@michaelkloos.com>
Subject: Question about CONFIG_EFI and CONFIG_RISCV_ISA_C
From: "Michael T. Kloos" <michael@michaelkloos.com>
To: linux-riscv@lists.infradead.org
Date: Tue, 08 Mar 2022 03:46:50 -0500
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_004653_795033_62BFCB1E 
X-CRM114-Status: UNSURE (   2.33  )
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

Does anyone know why CONFIG_EFI selects CONFIG_RISCV_ISA_C ?

	Michael



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
