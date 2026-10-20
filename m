Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1FB606A319
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 01:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AdoahC4j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q1uBqusY+58ivV9bUTJXtScUR7jPFpwHJunw/2Gcz2M=; b=AdoahC4jMW/ypT
	bQNxfoV7Sv+MGPFQVBGZG1GaBj5Zb9Za0AAClDRTsd3ZdaIR4jfGrZ2qsyQ1H3edrZecADNosDKnX
	+uUmLD4uYYMpe6XWLsy+kAAIXdzSpPCaD50ugFhCzD1GDezgamXDWdsCRPDnNXCy7A1BGWqzcyuZw
	+xX/VuVZILWpjR49DHidEH5InizLd+pBwsnFGy8I6IKmZIp3A+X8vCoQWeA8buzL0xUgKJmfNF7iF
	RV2uD1FBY+eCcilL09pD3Ow0qyFhjuPaH2+nquudeDJQBPMqRzc1y8XeO4bra7az4XYdl+ylOK4Yv
	faKzFbVHd99wUU+tJ1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJKgV-0000000AsKG-24Ra;
	Wed, 21 Oct 2026 01:00:03 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJKgS-0000000AsJ0-0HRg;
	Wed, 21 Oct 2026 01:00:01 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4j8WCY38Kjz5BNS0;
	Wed, 21 Oct 2026 08:59:53 +0800 (CST)
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 69L0xqLO033882;
	Wed, 21 Oct 2026 08:59:52 +0800 (+08)
	(envelope-from ye.zhihao1@zte.com.cn)
Message-Id: <202610210059.69L0xqLO033882@mse-fl1.zte.com.cn>
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl2.zte.com.cn with SMTP id 69KBdBD4088046;
	Tue, 20 Oct 2026 19:39:11 +0800 (+08)
	(envelope-from ye.zhihao1@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid12;
	Tue, 20 Oct 2026 19:39:13 +0800 (CST)
X-Zmail-TransId: 2b036ad752e1cc2-4bbb4
X-Mailer: Zmail v1.0
Date: Tue, 20 Oct 2026 19:39:13 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <ye.zhihao1@zte.com.cn>
To: <atishp@rivosinc.com>
Cc: <eric.lin@sifive.com>, <will@kernel.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <mark.rutland@arm.com>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <sergey.matyukevich@syntacore.com>, <kvm-riscv@lists.infradead.org>,
        <guoren@kernel.org>, <ajones@ventanamicro.com>, <anup@brainfault.org>
Subject: =?UTF-8?B?UmU6ICBbUEFUQ0ggdjIgMDgvMTFdIFJJU0MtVjogS1ZNOiBEaXNhYmxlIGFsbCBocG1jb3VudGVyIGFjY2VzcyBmb3IgVlMvVlUgbW9kZQ==?=
X-MAIL: mse-fl1.zte.com.cn 69L0xqLO033882
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: ye.zhihao1@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 21 Oct 2026 08:59:53 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD80E89.001/4j8WCY38Kjz5BNS0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_180000_294121_60EEA752 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Questions on KVM PMU Counter Numbering, Hcounteren Setting, and Migration/Conflict Handling

Dear Atish Patra,

I noticed your relevant patches and comments regarding the KVM module in your virtualization work. During my virtualization validation, I have the following questions:

I found that the hardware counter numbers actually used on the host are inconsistent with the virtualized numbers returned after KVM emulation. Is this because you want to ensure that the VM can work properly in migration scenarios and avoid the conflict scenario where the host and guest count simultaneously on the same CPU and share the same hardware counter? Also, why are all virtualized events disguised as sampling events? Is it because SBI PMU does not support the passing of this flag, so KVM cannot distinguish between stat and record events?

In addition, I noticed that in your main.c, Hcounteren is set to 0x02. Is this also because there is no correlation between the logical hardware counters and the virtual counters? Have you considered enabling Hcounteren to reduce the overhead caused by CSR traps? In KVM, is it mandatory to modify the logical hardware counter numbers and the virtual counter numbers so that they match and are consistent, and would it be necessary to reconsider how to solve the migration and conflict issues encountered in the previous scenarios?

Best regards,
ZHIHAO YE

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
