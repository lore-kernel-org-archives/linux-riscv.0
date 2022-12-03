Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7CFC4321E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 03:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tIjDG/kaPxNEG7KY6wyusBSUm2EZij04AiBPDheeqyc=; b=D+eCRVgZqdIHja
	nmu6Fvb98vqblksIK9Th/oFOLQrbmmQXEq+4l3AXZzZa3xE5KbDtya0WiCSLa/R/h1nXAbLLkR81v
	2G22h5sO3YKR/inLzvu0DONI7mTP1PgdtSP8iwo15HSR+Zv+CqjetNaAob7p0SqidMtTfUXopQZaq
	fRJLFMVFstRngUDnhF+4gito4Wo39hHvP7BrpNi7OC/Pc2MjVKRyV/0fMrGzBr/i3hH05TXbaqNKy
	yGEPdyeKTO1YNv6dSkUQa/rCdBPW9DF6kmROnAFx/K6O3DHH6IdEWPIl6ofwrUVlOZDii/1tbMUEa
	QALWB1Hh9PrMD+pcTt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Ir3-002ArM-Oq; Sat, 03 Dec 2022 03:06:17 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1IqZ-002AdE-6j
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 03:05:48 +0000
Received: by mail-pf1-x433.google.com with SMTP id l127so5935354pfl.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 19:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=MlD/Jt4lEh7hCsdG4GrZC5S+VkhD7NzUj5refRzoYlM=;
        b=izvAm0VDDUI8l/g0FySHjcna49MAYiOl2i2nsHUCSKpwH56Ir0FhArtL4lxajgpkXU
         q1iMarjU2+4l78dL0ag6d1NvQOqww04i5UnypzOB7uiJNMdv6ZNzb7EMxtmw5MZyE7FS
         bThPfxkT785nXJba2CClXZ8fuV2fw9cigmtlu8HPoTnQiyjsAVLVsY+Z6ZgI5QpnZlNS
         ohghGfzoUn9u90kZ6rVg/9evUP6bC3tPDT6pLi+TdYbrAm2TFz5GcZZc1u/bdGibPp/B
         2n2b2AfXkggu33bWgZZ5liaNgIt/NwMzjqmw4UnUUdoXbVq6av/nJ7otAE/nEGEaYUqj
         79LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlD/Jt4lEh7hCsdG4GrZC5S+VkhD7NzUj5refRzoYlM=;
        b=h3A3dmokdfrhB/CpIgYcegxEwmvtjkQfPmsIZq7+NiFL62xeO6iGiGTVhQl2uZuwao
         DizU24D4bKoqU41EpGZpAon3PLs/JA3CcHS0IQQfCJOejzZLOt904y9FewSarTMyG42A
         FA1jWP3cPGHzpcOwlNhvAKFKnNiKVE5Er2DiDPBrG0/VohhWaUxQMEJE1ZF3vmwAuwzo
         E3+mt1H1mrDNUl/SAENz+WBMc/zQ5hN53lHdPTf7QUQaBIr92GrRhoj99Y0P9AqoDXwR
         YHzfjf4kv1TWMT7sElNAHwbbhnc3qqg2bjOokIE5BFLR6Z/tOyCCDVNMCOZjn+0jnISr
         I6dQ==
X-Gm-Message-State: ANoB5plYpMZM2Z0R9Q7+YtcpHfjNg3KJBKbfd3kLrUKPBT1l5ZaTGs1M
	Spfv3RNB039JWZTXXrTL4A+Xow==
X-Google-Smtp-Source: AA0mqf64+QPycPCkazRrryQxpdG0UWxw0OahAJX32vqLElr+emlYUBPO7ldr1//HTp+r6hNM6u2ung==
X-Received: by 2002:a63:d34e:0:b0:477:650a:705c with SMTP id u14-20020a63d34e000000b00477650a705cmr46384100pgi.588.1670036741697;
        Fri, 02 Dec 2022 19:05:41 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q24-20020aa78438000000b00576984617b1sm287450pfn.60.2022.12.02.19.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:05:41 -0800 (PST)
Subject: [PATCH 0/5] mm: Stop alaising VM_FAULT_HINDEX_MASK in arch code
Date: Fri,  2 Dec 2022 19:03:51 -0800
Message-Id: <20221203030356.3917-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_190547_291047_ED3D763B 
X-CRM114-Status: UNSURE (   9.05  )
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

When reviewing
<https://lore.kernel.org/r/20221029084715.3669204-1-tongtiangen@huawei.com>
I noticed that the arch-specific VM_FAULT flags used by arm and s390
alias with VM_FAULT_HINDEX_MASK.  I'm not sure if it's possible to
manifest this as a bug, but it certainly seems fragile.

The RISC-V patch is on top of the linked patch above, which isn't in any
proper tree yet.  Everything else should apply to 6.1-rc1, but I'm in no
particular rush to get that cleanup in so rush on my end for 6.2.  That
said I figured it would be easier to send along this now, just in case
someone who knows the MM code better thinks it can manifest as a bug.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
