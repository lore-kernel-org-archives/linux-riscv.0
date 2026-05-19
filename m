Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC87CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xSNR+4E/Z6WuQT8b7i915Ft6XhLq/puND60DrxUaIU0=; b=A0QLe+GWRBF5CG
	DHt6GM1r8PnmacAz+hY98xY2wYCs1SdsCgk231vlT3edAbSZhuuhhhKEM96RzXJIBfKfhs8WZ04hS
	76fhuXO9HNgcMGlPwpcr3mMOiZMG5InTx+dWGn/hM7BDpSpN4unWrCvDPlwCvsr6fSIaHVV9i9ERc
	KUcm/fD8In721EUcKKW0zdlpYq+VXikzByPzIxCgXih7jqd41OZuiy7LaSNfw79Afc00BnxWjTNJQ
	C6ot8GOVgaKiT5xkIdAS//aRP0+USoINZYjKW7si2Az10OC6aUEWPuYdsMmN/XCMPmyfJPsTMy1bz
	2jZzYqcSP/aImegDLb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMno-000000028oc-396x;
	Tue, 19 May 2026 15:56:16 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMnm-000000028nM-0diG
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 15:56:15 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-65c5361142fso3761001d50.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779206170; x=1779810970; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5pMEAFe3b6igFTLOX4/fkLygT4dOyoxj6w53pTqSD4=;
        b=bE4cVsE2UyioUWQ2gp1/YF8KinVTOju6QGZ15kok352LTw7468hk9f+juNqyo58spt
         hg+soLBVu6Ty6dc1w8JiL0zE/jZ/rwtXuuNLPwxHk6CkfCw92ANeGDhyhrsPs2QAyCDN
         vNLGKgyCC8OHHyjIe0irjMDNZef1HI00gUhSRRzob5Tahc4wkf4HwwBVa5miNMp+fqlL
         jQj5qAMnM4Vo5nG4DXOdW/CsiIaFEb6qjDaWutNOhrrdFeLQpmQz0a96YQ66WTc22z75
         ekluFD7QzSz7XldAg6NJo9RPEDpvIJa91SESVTXBDDH3EHrrB0cXeGHYS4+8N1kFIoR6
         PfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206170; x=1779810970;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5pMEAFe3b6igFTLOX4/fkLygT4dOyoxj6w53pTqSD4=;
        b=r90Jf//LU3v2U/bnUuX8sfLZdM/+lybxQ5+XGWjM7fUXYFvjVwFV4BbCvmQxYXBz44
         m3sM61QzR0DnIEEw90xnTAEt4od9jeSegMM5c4GqmgZSRWhVkrxHJE/R1ssYO0asSOBx
         lXPbEO4v/IUf89/onKgpp4R6Tb6icJoiT8sbs+Fp6gIr/hcypR6m9QFqaq8QUqD1LNvZ
         rmqYC5cXKhjyURkVYAldnps8O+NcNfgRuGOhMMKhzdrVYKldzZeXnMCr91+I0+rYAH/N
         JNEWAJEnI6GNVzJ8ZOPAqmq4qcPpaiwD8ZJMPn7sNxu3nBmK9w3674+zpMoTINwB3jWm
         0ehw==
X-Forwarded-Encrypted: i=1; AFNElJ85elTUQqi8P/86SJ5o+HLmgvmhCni16G2775JS/xJr/WHsDh33lXuQay8cSNLTTbzw4yueDiOgMztPOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgLS2x4fcZarkWyHgtlJfTAatrWZAxQzwTOm7gI9bvnkQSEVOM
	gb2Y9KP7bEJRUnYaV89Nx8C0Bf/jRyktJdeM5jYB0IKcXXunvDzyc82yNPKtt4awAWdWtMML+jh
	C0zcv
X-Gm-Gg: Acq92OGEHi+p9KylwhPZwTy85xFsvYh3CuRaYTjS3VQHWhwro7WedLv8I8ux8xB2tTN
	wB+UNtRKPAGSg8R7svrqKwq9WbD3VVYVZ1xqt76kXXNcSIUEwHHetaBj0DoBhVs2Ahpm09LetqK
	/2k0z2E2ght1jUPAAWuxU8U6BjeoO/8ZablaqBQkvLgPn1LyXVI/4Ko/6zTtX7F+eYqbEaGH2HL
	9MP8MwZNJGxtBeef32UMihdH4b8zcfpkw9PwH5A5MA9Ba8iOjYPHTLs5L4EZsjVJYdxLFH1fDcN
	pemlu5Ltbmj2VGz/zlarHmF/Om6K2N/5ljJDFhKzxDBa9jFkJyjb15qjg1mvCPqTm+aTR5h+rzJ
	umxXRIJcCfUnxhP9F1pi/9jd9eg3zaV4p0Jgvfv1/TWpg8WsIQXkaTfhyqyTMadWX+n8I5yD8km
	/OKYp7//5CRq64ja9YuvZxgj0QlAiIEvo7FEjF2p9v+NyEBcQ6XVxP1GN12zhd8mx25DK412aGt
	UXyO7soNgI=
X-Received: by 2002:a05:690e:191b:b0:650:16fb:e7e0 with SMTP id 956f58d0204a3-65e2261a81cmr19691034d50.12.1779206170601;
        Tue, 19 May 2026 08:56:10 -0700 (PDT)
Received: from [10.200.56.73] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d87707csm8010706d50.3.2026.05.19.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:56:10 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 19 May 2026 10:55:54 -0500
Subject: [PATCH] riscv: cfi: add generated vdso files to make clean
MIME-Version: 1.0
Message-Id: <20260519-vdso_cfi_makefile-v1-1-c129daba59f5@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAAmIDGoC/yXMWwqDQAyF4a1Inh2IggO6lVJEJ5k21hsTFUHcu
 2N9/A6c/wDlIKxQJQcE3kRlGiOyNAH3bcYPG6FoyDG3WGTWbKRT7bzUQ/NjLz0bKkpE60tCJIi
 /OcR9/zdf78e6th275Q7BeV6AQ9IxdQAAAA==
X-Change-ID: 20260516-vdso_cfi_makefile-d59006f9d00d
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: thecharlesjenkins@gmail.com, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_085614_206710_9AE05150 
X-CRM114-Status: GOOD (  10.00  )
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

The vdso files that are copied over from arch/riscv/kernel/vdso do not
get cleaned up when make clean is run. Add a clean-files target to the
makefile so that these files get cleaned up properly.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 arch/riscv/kernel/vdso_cfi/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/vdso_cfi/Makefile b/arch/riscv/kernel/vdso_cfi/Makefile
index 10292498b7657..906023fb5c27c 100644
--- a/arch/riscv/kernel/vdso_cfi/Makefile
+++ b/arch/riscv/kernel/vdso_cfi/Makefile
@@ -20,6 +20,8 @@ $(vdso_S_objects): $(obj)/%.S: $(src)/%.S
 $(vdso_c_objects): $(obj)/%.c: $(src)/%.c
 	$(Q)cp $< $@
 
+clean-files := $(notdir $(vdso_c_sources)) $(notdir $(vdso_S_sources))
+
 # Include the main VDSO Makefile which contains all the build rules and sources
 # The VDSO_CFI_BUILD variable will be passed to it to enable CFI compilation
 include $(src)/Makefile

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260516-vdso_cfi_makefile-d59006f9d00d

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
