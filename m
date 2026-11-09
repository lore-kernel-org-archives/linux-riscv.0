Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2EF606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rt7bxJhO;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=aKhQOtKs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OJhYeYkwZlSsqKV9WSDLG+u8cVTaEtQ8fu+aEn29C4w=; b=Rt7bxJhOK/uj9TrIB3/w6go0We
	7NrGJodwhjYXWX5Mi7CLdviWyQ0duzeTOWR1rLw2fUa3+5W8ADpCpfxbsICN1D95OFTH+YPoCshYs
	2hO26g6g+fDHddQN7v0h0S4QC6T4cKlyAE86fQu5/qgvZ1h+/y5ckZLaTIoXlkikrHYbOkrKMS6Hk
	xn89eL0hC697HL4n9HEc+ONMkmZidO5Q8dwgtPfJtATFVnKQXQJ/zTbsROmIbJpLbifez7iu72bCQ
	twTmV37rVKA0PAGScI5sqpVqeCAjb6We6JD7CVDGDz5mhFs5q0gx4Vr5+0EiF5ioWqWiGc79xni9F
	W1wZj71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOUT-00000000gHf-4AgA;
	Mon, 09 Nov 2026 12:28:49 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOUQ-00000000gFb-2aft
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794227317; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=gw0xdUZEbI/mUX255OC4Rx6ONDLvpQrpRIEZaUAW0PQ=;
	b=aKhQOtKspn3TylTrt375f37l1UNDyaQ/Ilauq8Yo69EdC1Hgx+oz4SMkspoks4thIF4FI0KTMf2tzSFzUWmdJAH08Kwa3gXDZGUJ0pLXG3w2fIAd4HDsgRtYt9wG5XwFXsfCyKyjR+c8ktdWIqngo52vGoGaYW4fqNa4D//Uc2c=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R281e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XEP8cZt_1794227303;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XEP8cZt_1794227303 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:28:36 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] riscv: Enable kexec handover and live update
Date: Mon,  9 Nov 2026 20:28:20 +0800
Message-ID: <20261109122823.992-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106071459.2003-1-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_042847_034337_AEAA1F24 
X-CRM114-Status: UNSURE (   5.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paul, could you review this series when you get a chance?

RISC-V needs no architecture-specific code for kexec handover: the
generic paths already work on riscv64, and what this series adds are the
enables. Patch 1 moves early_ioremap_setup() before parse_dtb(), the
order arm64 and x86 already use, because DT-based handover is the first
caller to map memory that early. Patch 2 adds
ARCH_SUPPORTS_KEXEC_HANDOVER. Patches 3 and 4 teach the KHO and live
update vmtest runners about riscv64.

The two prerequisites the series depends on are basically resolved: Greg
Thelen's fix to is_kho_boot() [1] is applied in the liveupdate fixes
tree, and Mike Rapoport's bootmem sizing series [2] is reviewed.

[1] https://lore.kernel.org/all/20261023054518.3258350-1-gthelen@google.com/
[2] https://lore.kernel.org/kexec/20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org/

Best regards,
Chen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
