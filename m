Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80D3FA3740
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ky1xGPLB/q++DLOxb1auqDPR52PEGBCFju4P6L5OInc=; b=K4sgFsWRaHzLtL
	6/cBfqe276E6Lxn2FqFb8cxQQ4l35zEtz8zgx1a4LboDYPZ2HoqfwjZC9lk6laBQL9vEV43Yx0HMG
	e55iRrMcEXMpnF9iNkydk728mNP1+L7mGAdBirAM0Ox2nvsIl9yYEgqKVDQ030oR8YJc+GjsQaPy5
	HML3Zh8pv1/Uz7irPbW8wkRf5SDim50UGHO3vo7rQ75yy/1aisA9M1SzhTcyEGEHuQL/WengPXCqr
	k8v+Y3Vofenn8ienA4KrINVKNvtB/86QUo99tLd21lnlSqx4ri9pCc2gj1+R3d1LwTq85AvyUaxHW
	9O1nPcLUzIqIlA8yWZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtWK-000KuZ-9g; Mon, 24 Oct 2022 09:13:20 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtWE-000KpQ-BR
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 09:13:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id y69so9743860ede.5
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 02:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvDDTwSmj9lH0C5h1Tz5CWy1mF5Fm8oV3aqodopP9Yo=;
        b=BPiaL86cCqq623/4FXnKhglq86oIwIa9BCkdF5UGvlsBfh3APKJGwN5+u6wzq3rNcW
         GSonDf2sFnmjohYIv/nHR9NhP0QkJZBjYCjBDApKH+KqXITSPzVcCeNFBOpXPF0U9WnF
         dQpdnWqokTJxIWFXaEFjkWKlQABkPDaXM9DKJ/QnN6GI3XLeTnuldJEDc21riibQ/uii
         +17FoO0uDrvtcbA937VWLUCRbsUkDDkrKfFZINHAgWqB4WvTKht1La96laOLZU+Qsudj
         DZxarM3cqr8kDE6Es1thkxEBk5OAlafpQRlUP+ZDaLihAdoxTl2kN+MsUrUFfutyIoH1
         M62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvDDTwSmj9lH0C5h1Tz5CWy1mF5Fm8oV3aqodopP9Yo=;
        b=Q7maufk5ACfmsAUVrEA4a9DUP/i20gLBxwAJivft5nKoRy//Oy5MMZHUmTC7m2kLP3
         660Scm/b+B6ESCIQt3Y3WV6dQqawVpHzLKpOmoRjUt1CgpEH0GR8KUEwdGdRGy0vAZ9W
         JOTljbpwSTHWlDTXy24PT4A4OZ1VLQe6nmS01z6mAGr0VR9+e/WG7VsR8FN/cKy3Mu7W
         4QQV6GFY70LB9j0U7f49nDN4pOUmqFOte8Hke138MpjgPGF6ihNTMFgqJRlkSz1g4Ro9
         rif2tyMbMUU5tWIVBo159CH8STnj3jYzO+oteoR9nMJJmmbzY6Y9usIdRbmRFw8caqIr
         i68g==
X-Gm-Message-State: ACrzQf1xvwzNTqSzHOtqWkUnNtpvQvqpcfYttrEz9UHil7faBGrejIiI
	6sWAQTsZM2wxFcpBBYRElOsjWcRTtOqZ2A==
X-Google-Smtp-Source: AMsMyM7IIQZX9dkUPOd4VipjZbc0117syw6eP6rnYFtD4q56X/5Ev5oToGMjjNfQ7Cnc6xn+Tx7ykw==
X-Received: by 2002:a17:906:6791:b0:78d:4051:fcf0 with SMTP id q17-20020a170906679100b0078d4051fcf0mr26393399ejp.591.1666602790630;
        Mon, 24 Oct 2022 02:13:10 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id fq35-20020a1709069da300b007a0b28c324dsm3166878ejc.126.2022.10.24.02.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 02:13:10 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/3] RISC-V: Ensure Zicbom has a valid block size
Date: Mon, 24 Oct 2022 11:13:06 +0200
Message-Id: <20221024091309.406906-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_021314_414104_04A80C90 
X-CRM114-Status: GOOD (  11.09  )
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

When a DT puts zicbom in the isa string, but does not provide a block
size, ALT_CMO_OP() will attempt to do cache operations on address
zero since the start address will be ANDed with zero. We can't simply
BUG() in riscv_init_cbom_blocksize() when we fail to find a block
size because the failure will happen before logging works, leaving
users to scratch their heads as to why the boot hung. Instead, ensure
Zicbom is disabled and output an error which will hopefully alert
people that the DT needs to be fixed. While at it, add a check that
the block size is a power-of-2 too.

The first patch of the series is a cleanup of code that crossed the
path of this work. The second patch prepares for isa ext. checking
and the third finally does what this cover letter says.

Thanks,
drew

v2:
  - Unconditionally complain when we detect a problem with DT's
    cbom-block-size
  - A couple r-b's from Conor

Andrew Jones (3):
  RISC-V: Improve use of isa2hwcap[]
  RISC-V: Introduce riscv_isa_extension_check
  RISC-V: Ensure Zicbom has a valid block size

 arch/riscv/kernel/cpufeature.c | 43 ++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 10 deletions(-)

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
