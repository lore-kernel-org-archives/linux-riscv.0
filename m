Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F82C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7te2stxoTtpu+2Mi651MBoEX+qKYfm21yICtrk/DtM=; b=L2rnjZ5PNnsb/1
	aUr1IFP4b5RADLAgrHfftHcvFhPabgES4/KD0w0MRk1/NtwMbQnmm+l4UD7eZC4d0gTaqwK+hPPWO
	iKDSope+i6yOIIYAl+2OqKU4bbcdBCTYkK91muYlKmEpY0irTOkGjXjmdd5iecfOXULc9+SpcVwU4
	Kj3sPqA886dRzHgUSVb1VHZLFOZPaOWXYcVJHucqNQJQqG8o9txNvHi8PDIyD22LB/GgadahEnv1t
	lus9Y3tCZT/9DRGlfy09kat0SMlQsLX6PE1R1LoOitiwkCRXoUk3HPTMtT823qpzh37PDV6hQJvlc
	gprHkDzLxL/oHiDfPx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj35-00000001GCx-1nI1;
	Thu, 09 Jul 2026 07:19:55 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj31-00000001GBk-1JgX
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 07:19:52 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8485b358552so333245b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581591; x=1784186391; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fh+g4dLzQQKwQZpg1gRBt3Lt5aU+mEzgnaydKEISQDs=;
        b=Qz7XQ0qf2rQxBWHi6YAo3a+R10fmrunUsUi1rEEr+ZTtjUE9MCPr/nawyFEyfsDs2S
         bA328yJ/vAifhTunLv5fFxUVQHtejjaIKqZuL+euZOOKHITa8w+/kRsH/2iteVg8V+hI
         ewOv4ZqZjyW2E2f9aCcRJs+Sl4m/YdTXJP1C8Nn4lrEQFuI8/VuzBKl8MzyrBNPG0dkW
         jIBXtXRNBSrbnKKaGr0C1zXX4RRFiVOKDp4qVTHd3FUqCWIetrvowjqkbXWizMHspn3Q
         GszdYzjDv9wUE5H4HS1ONjPA+AspXaphtVQeeww+uIDS/YOHAX38+xtLd3lqzZhvrioc
         zULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581591; x=1784186391;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fh+g4dLzQQKwQZpg1gRBt3Lt5aU+mEzgnaydKEISQDs=;
        b=Y49kjJES+uJM2zukDcmi0bBwsbc2+2icLJXZ/3l3KL3eMuFSghJunO/mgpy1e3DUxc
         mTcDJGvlXEn19ZPa7vnGVrEIi8TN5DNhQJEvohdtUFuDLusuDdzDOEkLziH8XI5Sk4IS
         zQZPBe41QznbrVTOy9oxOJeqhBZ/IbNYUY1mCUWKteXGbYIzcpCLGwS1MWOCbvVuPeRG
         efnYkgDU4JBsnwKMG4vzhYFJBDAHcxge2WhbbmeI8BoCYRsSus7BByyss26aPwbHx2VG
         LWyBSzgX7YuylOp4kaaw6bhmct7H2GPUiSocfVOYIF7tG0nM8yJi3ba5zLA7c2wQvk4P
         N8JQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqf34MX3dTHxRItEnZJiNk0qn1lvQlvhc2uebgVzyFxtsUSl/Zb7rtuKJRIFonV/4ZzsqAl1K15O20WbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7dTcgzArwAVgH9Ko15hqDcPcHPp+D3rxi2vogS3ufb4BIWNyi
	7sW1wlhnHBOLH29JMHbo7bSCCrBr6PdrQwoSG5wBrNixUCqRdH/yXceI
X-Gm-Gg: AfdE7ckr3XSREY9pyEWK+ToCTgjqJOtpBx5lw0VxuS6OYJQhsy3UBjZWHSSOdRZVWle
	Yw0tC5/PuoO+f3i9Qmuv3Q3sANawhpKeikpT30JBUHAlz2vqKvDc23JDMaS0AJtkDk1X7aC102N
	1oaFqzS74LG8CewBeTWDnkHD4zx5Wrjq0gvtNsyjq7DWPeQzTAP8QJazCK0mSWVrBtIIRSJtqzj
	jrE3iXTkfkPRRqQ8hVrHfWi7s8UNH5xGspiAOKai0VlIlyrhw1uc5J1gmFRTgwKkWSpffmhpXmC
	7zbBEPwARWCTg76nIc/qOA0QgnsApC8qO7LsXABeO2pptYiG6f8VOQUhqnBnJcSFzi6e72MDffe
	razP86LfsUziFRPVq54dXhQBfZ2cE6L5YpqIX414ufKq+ZeO6sz52fqjEA5PE9KNCtu5huL9FRZ
	SBWZ0hT0+ZHnGXYGxJ+3ufQvtmi2E3OU1Tr+OHPYvr
X-Received: by 2002:a05:6a00:94fe:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84842ec1ecfmr6087770b3a.14.1783581590600;
        Thu, 09 Jul 2026 00:19:50 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847d4134fsm1852159b3a.0.2026.07.09.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:19:50 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 2/2] riscv: kprobes: add test case for c.jal
 instruction simulation
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Nam Cao <namcao@linutronix.de>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260701081033.49871-3-xiaofengmian@163.com>
References: <20260701081033.49871-1-xiaofengmian@163.com>
 <20260701081033.49871-3-xiaofengmian@163.com>
Date: Thu, 09 Jul 2026 00:19:40 -0700
Message-Id: <178358158037.977550.15156764855653642514.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783581587; l=2528;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=9iEABUojWCqenaA3VEwZVQWp0ZdkcD4IOX3aD814YNE=;
 b=1Q7tuSPd0ZJJISvIsCHzHQb/GahslCXeKpRIlj6Hkw+7+pk5On3W3+6WnOmnMT9sjdGuUdrZO
 bhPiik7LytNBNgLMGnQA+9X292ZqX/G7rFGDI3W7DImrWLSpqvHwV1f
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_001951_360150_4F9D6FBA 
X-CRM114-Status: GOOD (  12.99  )
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

# Add your code comments below. There is no need to trim or delete
# any existing content -- just insert your comments under the relevant
# lines of code. Lines starting with "> " are quoted diff context and
# lines starting with "| " are comments from other reviewers.
# The final email will be reformatted automatically to include only
# the sections that have your comments.
#
> Add a test case validating that kprobes correctly simulates the
> c.jal instruction on RV32.
> 
> The test uses two probe points: a forward c.jal and a backward
> c.jal, and verifies that the containing function returns the
> expected magic value KPROBE_TEST_MAGIC after kprobe interception.
> 
> Co-developed-by: Xiaofeng Yuan <xiaofengmian@163.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>


>
> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
> index f16deee9e091..15e50934bbd7 100644
> --- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
> @@ -179,6 +179,23 @@ test_kprobes_c_bnez_addr3:
>  	ret
>  SYM_FUNC_END(test_kprobes_c_bnez)
>  
> +#ifdef CONFIG_32BIT
> +SYM_FUNC_START(test_kprobes_c_jal)
> +	li a0, 0
> +	mv a1, ra
> +test_kprobes_c_jal_addr1:
> +	c.jal 2f
> +	ret
> +1:	li a0, KPROBE_TEST_MAGIC_UPPER
> +	ret
> +test_kprobes_c_jal_addr2:
> +2:	c.jal 1b
> +	li a2, KPROBE_TEST_MAGIC_LOWER
> +	add a0, a0, a2
> +	jr a1
> +SYM_FUNC_END(test_kprobes_c_jal)
> +#endif
> +
>  #endif /* CONFIG_RISCV_ISA_C */
>  
>  .section .rodata
> @@ -209,6 +226,10 @@ SYM_DATA_START(test_kprobes_addresses)
>  	RISCV_PTR test_kprobes_c_bnez_addr1
>  	RISCV_PTR test_kprobes_c_bnez_addr2
>  	RISCV_PTR test_kprobes_c_bnez_addr3
> +#ifdef CONFIG_32BIT
> +	RISCV_PTR test_kprobes_c_jal_addr1
> +	RISCV_PTR test_kprobes_c_jal_addr2
> +#endif
>  #endif /* CONFIG_RISCV_ISA_C */
>  	RISCV_PTR 0
>  SYM_DATA_END(test_kprobes_addresses)
> @@ -226,6 +247,9 @@ SYM_DATA_START(test_kprobes_functions)
>  	RISCV_PTR test_kprobes_c_jalr
>  	RISCV_PTR test_kprobes_c_beqz
>  	RISCV_PTR test_kprobes_c_bnez
> +#ifdef CONFIG_32BIT
> +	RISCV_PTR test_kprobes_c_jal
> +#endif
>  #endif /* CONFIG_RISCV_ISA_C */
>  	RISCV_PTR 0
>  SYM_DATA_END(test_kprobes_functions)

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
