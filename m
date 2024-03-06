Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64C8C54E49
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/tl8lYR5WdacnSp5F8yabhZvZewvRXoKRqA5IYLhdE=; b=cNVelw2Nxi8WZd
	fjSv8YbRmNFBMxVqzcCB4yVrYiYB4RjYdXytm9DHAsPszcb5FD9q+10GQZN1LKFadiWBLdoFdJWfy
	/TSK/deorkJRSxu5zcXRYN0MTVN0dl0mgYOfZo8dFUaJ2zDg18Ega0ySUxO9KRvz/0HcS+inaNoo0
	fH4hXXQbcJFuIr9Cy3DTMaNueL+gayyN+Pqt/4nubSAHdnMLt3/F92704Ek2B+gc8Hw5U1fLxyt8r
	tFhxcUfNNq0Em4/V4ps6cxzxi0Oelv2uLO/OXCf1qVgQJcV7cmWINXsUfTN8KV4nFkMMk7flFMhNr
	rTZidjq98fBY7AM8735A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhn52-0000000H17t-2BYS;
	Wed, 06 Mar 2024 08:56:52 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhn4y-0000000H16b-46mj
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 08:56:50 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-21fd5eb7161so2808498fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 00:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709715408; x=1710320208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CABJMt4hSO244iW5Glz3DNnS14exaADs5c0BJOhPvw=;
        b=VQvzmRkVNc4kJOiwHJXZa3MMePfuE+SArdQ4nasneiwKsoIPYi61BL0qyg++E86xdG
         fT2Nz7+EqFiQm6TXq/up+mxtUGS/7wpF94EvlWl1pMsJ6dlHO3yN5ZoQuC4RplXa3/x/
         nSMhThFkJM3feAqv8LzrC6BIUvlbU4R9iHGe4BO8mjd3rlKgdsiKIRNCTMnf8iSv5cFH
         wTmBje/DKTZp+if2CCcIlPi9sJPg5H9c0+JxVzL2YSBA6V9nJP2LL8+mCDpYMYzv1AqP
         7B7MeO43sV4H91ON/hgliDOxVrO3/Fv16Jld9F9d76yYDDq6L4T1zM7YWPyLv/bVZ+v8
         SM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709715408; x=1710320208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CABJMt4hSO244iW5Glz3DNnS14exaADs5c0BJOhPvw=;
        b=wwQF8ZqXF61TDEnVtwmrBaSu57fEBd3LP9F+uFsDZEyk2DHMb9Faq7W/YJjyShRkRp
         +4kFlwLydkhFBYM2biikdFANyiwRPj8W4JVpEUeAZsTwA99DuR58SOgwHc3pSRsrxROv
         32HGvgJ668oPl8XRH/rCKsYFRdYOfugR83hid3YTb86KucvHj2tP+ZoxcJ6ZFlDmAWIf
         5AX1LELKQuB+n3bYQfxripOZeoYVFNKIHsqM0h/dhMC2rmO/J84JP32jTxiEh6vJBSn4
         +lVQP9eXhXjjCRM0kBIheHtXB2Ez3BwmlhbMqpQ11P1SBGl6y1Ca1S5sZHK/LIQqQcSL
         +A6g==
X-Forwarded-Encrypted: i=1; AJvYcCW5HcRjiX+AlPVUJnmzTVp3TCCSkXm8MwSBE23/Qz7FaFkFlxZDByRiAWoyOt9VunNPAK6at2al8kuNzKua893qcTYnmpGZAVuCKYGHLNlE
X-Gm-Message-State: AOJu0YxkbxxAd2I1w9i7Ug74G2z8V4eg2P7M6ezRvUJsxEQV91oR2eyH
	QeMFk1FQdAkhpTRhvLwUG3H73Cv6ttU3jIY/ce3tn5ZdFJDZOwXHtjyPQZfF6gA=
X-Google-Smtp-Source: AGHT+IE2BdBcL6wdxX3LfFe6ila1xwesEmOhKWIXEUQRU2u85mQlRvRPcTSduuuATxjh6RtMEQbedw==
X-Received: by 2002:a05:6870:819e:b0:21d:e28a:fb14 with SMTP id k30-20020a056870819e00b0021de28afb14mr4580959oae.47.1709715407767;
        Wed, 06 Mar 2024 00:56:47 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id o74-20020a62cd4d000000b006e58663dd0asm10740071pfg.110.2024.03.06.00.56.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 06 Mar 2024 00:56:47 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	cuiyunhui@bytedance.com,
	xuzhipeng.1973@bytedance.com,
	alexghiti@rivosinc.com,
	samitolvanen@google.com,
	bp@alien8.de,
	xiao.w.wang@intel.com,
	jan.kiszka@siemens.com,
	kirill.shutemov@linux.intel.com,
	nathan@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH 3/3] efistub: fix missed the initialization of gp
Date: Wed,  6 Mar 2024 16:56:22 +0800
Message-Id: <20240306085622.87248-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240306085622.87248-1-cuiyunhui@bytedance.com>
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_005649_039190_AEDFE3F2 
X-CRM114-Status: UNSURE (   7.69  )
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

Compared with gcc version 12, gcc version 13 uses the gp
register for compilation optimization, but the efistub module
does not initialize gp.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Co-Developed-by: Zhipeng Xu <xuzhipeng.1973@bytedance.com>
---
 arch/riscv/kernel/efi-header.S | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/efi-header.S b/arch/riscv/kernel/efi-header.S
index 515b2dfbca75..fa17c08c092a 100644
--- a/arch/riscv/kernel/efi-header.S
+++ b/arch/riscv/kernel/efi-header.S
@@ -40,7 +40,7 @@ optional_header:
 	.long	__pecoff_data_virt_end - __pecoff_text_end	// SizeOfInitializedData
 #endif
 	.long	0					// SizeOfUninitializedData
-	.long	__efistub_efi_pe_entry - _start		// AddressOfEntryPoint
+	.long	_efistub_entry - _start		// AddressOfEntryPoint
 	.long	efi_header_end - _start			// BaseOfCode
 #ifdef CONFIG_32BIT
 	.long  __pecoff_text_end - _start		// BaseOfData
@@ -121,4 +121,13 @@ section_table:
 
 	.balign	0x1000
 efi_header_end:
+
+	.global	_efistub_entry
+_efistub_entry:
+	/* Reload the global pointer */
+	load_global_pointer
+
+	call __efistub_efi_pe_entry
+	ret
+
 	.endm
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
