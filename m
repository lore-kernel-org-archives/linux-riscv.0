Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACE3E8FDCC
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZC1EYRIy78eShKGSK7Kw8tCKbuMqId6tw9PvfTKaqDI=; b=BIYLVkdJU9X7sR
	p9SCKMcRc6AF5hNT+pAamCim0A3CLhxcH5zWrkmpb32OjcBqQU6zTqF1Ziz/2eXSehuD0JR0skSJ0
	lPOmfA30psDTs7hzkncDeKRx1CDBqSZTu9qV2/J5YDRDotb2NU4XaFja7GiNOvAMQFIDnpfnpauvp
	Hyap9/ketS53JasU2VUVbbhcD81rwO3B+r9PiLnZjLP/IKxDLqDEmLihYJZsGQn1WSgLkAtTDCWvO
	KcwZC20Qrggs+sXO0fADRk8DHMVfsCbRMopc7b5sfAuhu1OY2C+MHKOMX0+DS0I+8PRvGLrUHvf+M
	mcFSiHgh32OG2mTZ64bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTrH-00000001zM1-2bCm;
	Sat, 27 Dec 2025 12:57:23 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTrE-00000001zLi-0f7P
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 12:57:22 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vZTr9-000AU4-0r;
	Sat, 27 Dec 2025 13:57:15 +0100
Received: from Mac.speedport.ip (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Sat, 27 Dec
 2025 13:57:14 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: Deepak Gupta <debug@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, <pjw@kernel.org>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>,
	<daniel.weber@cispa.de>, <michael.schwarz@cispa.de>,
	<marton.bognar@kuleuven.be>, <jo.vanbulck@kuleuven.be>
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess speculation
Date: Sat, 27 Dec 2025 13:57:03 +0100
Message-ID: <20251227125703.80908-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
References: <aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-GWD-08.um.gwdg.de (10.108.142.61) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_045720_197413_62928F47 
X-CRM114-Status: UNSURE (   4.88  )
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

Thanks for the review. You're right - we should only clear the sign bit
(b38/b47/b56 depending on mode), not b63. Clearing upper bits would
interfere with pointer masking.

Here's a fix that computes the sign bit position arithmetically to avoid
branches, this ensures the mitigation cannot be bypassed under speculation.
This is basically the VA_BITS macro but computed in a branch-free way.

In arch/riscv/include/asm/uaccess.h:

  #define UACCESS_SIGN_BIT \
      (VA_BITS_SV39 - 1 + 9*((unsigned long)pgtable_l4_enabled) + \
       9*((unsigned long)pgtable_l5_enabled))

  #define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
  static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
  {
      return (void __user *)((unsigned long)ptr & ~BIT_ULL(UACCESS_SIGN_BIT));
  }

This evaluates to bit 38 for Sv39, bit 47 for Sv48, and bit 56 for Sv57.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
