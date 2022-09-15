Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB9AECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=geAiFZ2Qp+xT5XicuMCZ6SjeISbSakj4W/qbE1LJDng=; b=HDnL7x43aBFxR1
	7hGEjshJLp8wFGT0SC9dDirF8t9IEz09h+DdXWnXRwNMkMEYRRvBcSbCbpbYufK7kdKDuclsEGKoO
	bhMXaNA1a5ZNisCXZysgjjBMPV9XGNpfnKXk1xrb2WI35kmqAVjdYT9xsYsrTh6/mU+6VmE8QxlT5
	0ylVjoSf5tV9otuImj5+J8deIsTeBf+DhMUOH98GFRwTeQP8uW+bVzAJ1Lut1Re9fbBEi75Sh0lKN
	hSdVNR3drcT13wE/yi8EH8zRKcJPbL4LhOOMprVHqHYbu7hiaX09qlmaLs1QH7KZ1zvGZerDB7Rz2
	y1xuCYdtMCJannfkoFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYufq-00Fyte-Hi; Thu, 15 Sep 2022 19:37:22 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYufm-00Fyr7-SK
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 19:37:20 +0000
Received: by mail-qt1-x831.google.com with SMTP id cj27so2271427qtb.7
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 12:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zpt9GCRbl8GSu+mNKxtCSxN/ut26bIT0MJANl4282eY=;
        b=3dVH8/YoiU0dPRG8tjjiauIameUd3EPLECdbMuaVAgYEeXgQqnkOWsfagAVQj4AyhE
         rYDwsvzV8Anf9tgVloy2RgFUI8qZHyJxKyKeESW9yc9Ud+AzAuvo4N8MnGjaops3ajsK
         lkR9nQ1iz+2cWO6g49vHE0hJjzduH94Gni1CbaKzWXGPhGn+PyeLPw5KecGYJZGqvfmR
         HlnUCYFrrY7x0NIpiHg6H4mXck0En0bXbhNMDnkT/2pSkphAQ8ChMha+nK2l92MIW0E/
         agPr54IRRiHhKHgWkiB6uJ0fGrgrFuYVWngrJTCctsLAkCNXUsh4t+4Xm0QY6i+cO3/e
         WcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zpt9GCRbl8GSu+mNKxtCSxN/ut26bIT0MJANl4282eY=;
        b=QmPbzmkdGWrXOlwW+xwkbUR2YFNddb7M04lZo1KlcGqxOWDY0TUPmgHKHCRvPTcpoq
         TTNN8pNL79BWXIWD83stv3IJ706kzMPpczpvDMTi8jME/21Npg8tjrEd2i8HKBh6RlUt
         jgpDDvMjFy01fdVn29zmBu91qA5Y34TkMvZJ0GnoEYL6ohCNVrlyun7DNjYiVMP3NNz8
         0vVYrwxxX4OST2oKdMbYLoSX8JNp81OQgx2DQWhrqIUtfse0XS59ZGE+ro00+XbipB+v
         IFprJPQmPZge153WVL8+Lp4jUW2ArgwleIpRG6rypm8KQO6/Eg5BT5DvsfdPiANwxl17
         pdfQ==
X-Gm-Message-State: ACrzQf0m0U0FZQszIKGS9EI196ziNvbZNYIx/XboKD/PuPJ2wpz0WPki
	AoXgZz1IKVcQH3FjOVU6H+wyHQ==
X-Google-Smtp-Source: AMsMyM4c71Uqf0BRj1ggV8j8fTpOR+nYbBIzPF9iB2m0Ng7RmJeprdOZ115YIqybBqbxLXqHItL9uQ==
X-Received: by 2002:a05:622a:296:b0:35c:c846:d714 with SMTP id z22-20020a05622a029600b0035cc846d714mr1430238qtw.58.1663270636969;
        Thu, 15 Sep 2022 12:37:16 -0700 (PDT)
Received: from abrestic-xps.ba.rivosinc.com (pool-71-105-112-35.nycmny.fios.verizon.net. [71.105.112.35])
        by smtp.gmail.com with ESMTPSA id r1-20020ae9d601000000b006b872b606b1sm4596459qkk.128.2022.09.15.12.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 12:37:16 -0700 (PDT)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>,
	Conor.Dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@rivosinc.com>,
	stable@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 2/2] riscv: Allow PROT_WRITE-only mmap()
Date: Thu, 15 Sep 2022 15:37:02 -0400
Message-Id: <20220915193702.2201018-3-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915193702.2201018-1-abrestic@rivosinc.com>
References: <20220915193702.2201018-1-abrestic@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_123718_939108_7C9099FF 
X-CRM114-Status: GOOD (  11.11  )
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

Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
invalid") made mmap() return EINVAL if PROT_WRITE was set wihtout
PROT_READ with the justification that a write-only PTE is considered a
reserved PTE permission bit pattern in the privileged spec. This check
is unnecessary since we let VM_WRITE imply VM_READ on RISC-V, and it is
inconsistent with other architectures that don't support write-only PTEs,
creating a potential software portability issue. Just remove the check
altogether and let PROT_WRITE imply PROT_READ as is the case on other
architectures.

Note that this also allows PROT_WRITE|PROT_EXEC mappings which were
disallowed prior to the aforementioned commit; PROT_READ is implied in
such mappings as well.

Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")
Cc: <stable@vger.kernel.org> # v4.19+
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
v1 -> v2: Update access_error() to account for write-implies-read
v2 -> v3: Separate into two commits
---
 arch/riscv/kernel/sys_riscv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 571556bb9261..5d3f2fbeb33c 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -18,9 +18,6 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
-	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
-		return -EINVAL;
-
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
 			       offset >> (PAGE_SHIFT - page_shift_offset));
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
