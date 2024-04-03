Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D948DCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84gGR2ScgPXl734SULQu5lumUYCkBEpq5qpOUD9Hfjk=; b=cLVBynvJiFSWen
	lVXZSREL0vWr+lboaG00tK91ZwkRC2Ebf2LfVHViYtUHs+lEiwOSHV5tmG/uK56woxge9D4ALBoWz
	pHUtiMkZX++yMdV/jfUjFcl7XFJP1J6oQGDeC8MQ5c1uOByLM5YSN5A+UtZoaPcgxLeJhErz/kUU7
	pja5Jg1U0WznaueknhRBFw5mQ8P/Af6D1t0OkA80FJdy8rqXYpUpnMlU/XiKsWR0KQl/EmR1X9G9u
	/BWtR6c38oneP6CiJT79Da5Rb+kMBsEuv5tDcu0UVycM7eBuzhk97nR9iIp2URPEcfZ9PnqyTLB8K
	xgIVPJLtJpgGkcIzvMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFq-00000000aYh-2J8c;
	Wed, 03 Apr 2024 23:42:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFa-00000000aGo-0zJW
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:42:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e244c7cbf8so3460065ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187757; x=1712792557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc6tDQVZMFWZI8yrez6t0wejTQ8xJVxgJAnHf9JsPCA=;
        b=OWNOoWScJox7U3e+sFQ7SR9DsBrsaLp3Z66zEUBiHIiG23gL0TtF+n5hisgHJ9SOSR
         sys2RV+MFHmaX0wHA9YMPLlQ+FzF43b2SvldDc/pSzzoyR1Dh2v9f+Zozi7UJ0UhapDz
         ZniOq1ySuTQkxtQdTMR7AJpFwGxa+wFxSHXmj+0Bz38VmzYQE8J1VEFWvnWHTG8c6eAx
         NCD5IiYnEpWsCwABJlGK6BAFwevtWaeTmB0nI8hM3KXUTBC8BkLe4NShai6SQQvr1oIS
         FxaIQOWGP1u8aKoc0cZp9AMs9iDF34l1g7Rm0Es4hIDWUZGfUJzMIpVpnCFuZloRCEZJ
         /OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187757; x=1712792557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qc6tDQVZMFWZI8yrez6t0wejTQ8xJVxgJAnHf9JsPCA=;
        b=j36j2UZvvK9frvtOnUr1bDrppHufoMX3nKm3h+HufVIRhZ1b2QFj5S8glTnYNS5jmG
         zZnhdNkYxQdj3UMj548G0opMQuX0HMOyZegexzjX4ZyN/EU7dBaZNeUEYQHIRA7L1wpy
         QcOaMdRY/n9kqhg1eyGjIGliuvN2I7nCrCCjllHnzRN9DgJzyK+SiQdCToHvl5XDwIXj
         jV/opOezuxxuFDjThd1E1ic1sIt2XGlQz6mEvzg388C4sKF5OCTSAEBeepV4gOI5+Hre
         /tt9btdHXvnO51zFAJs7PXGyjPWFnuPB9W06kUqSnuHhzZTIq7i+F69jGrxSCPJcIAwV
         ZsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUqf3YoHge/ikKYWSst0RZtCgKYETwBulTzK0gkWkgYdPHpp2vDLJ8QRqm32ciDxX/bRIa+eaVOMb2V88bhRwBNAn1cNCMJfbtzq6kyElJ
X-Gm-Message-State: AOJu0YxpjiiYjuWGj7likdJmV+hHrNR0DbfdLu83Zb9rYoo7938IWKbB
	By69RLsmdBQEWodCn7fq5/uKUySCEzz/nB865su+rtXNModkEK7Fwzbk0/DyEnY=
X-Google-Smtp-Source: AGHT+IEuhCBj/2TDLKKsCyPyIBeMUKZ3rkD1bUlrx/H25eFGajkGFoQcn3/TeMJd7JPKfofV2mRlIQ==
X-Received: by 2002:a17:902:d506:b0:1e0:cdbf:24c2 with SMTP id b6-20020a170902d50600b001e0cdbf24c2mr951254plg.29.1712187756641;
        Wed, 03 Apr 2024 16:42:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:36 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 22/29] riscv sigcontext: adding cfi state field in sigcontext
Date: Wed,  3 Apr 2024 16:35:10 -0700
Message-ID: <20240403234054.2020347-23-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164239_035668_BA3A9674 
X-CRM114-Status: GOOD (  10.34  )
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

Shadow stack needs to be saved and restored on signal delivery and signal
return.

sigcontext embedded in ucontext is extendible. Adding cfi state in there
which can be used to save cfi state before signal delivery and restore
cfi state on sigreturn

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/sigcontext.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index cd4f175dc837..5ccdd94a0855 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -21,6 +21,10 @@ struct __sc_riscv_v_state {
 	struct __riscv_v_ext_state v_state;
 } __attribute__((aligned(16)));
 
+struct __sc_riscv_cfi_state {
+	unsigned long ss_ptr;	/* shadow stack pointer */
+	unsigned long rsvd;		/* keeping another word reserved in case we need it */
+};
 /*
  * Signal context structure
  *
@@ -29,6 +33,7 @@ struct __sc_riscv_v_state {
  */
 struct sigcontext {
 	struct user_regs_struct sc_regs;
+	struct __sc_riscv_cfi_state sc_cfi_state;
 	union {
 		union __riscv_fp_state sc_fpregs;
 		struct __riscv_extra_ext_header sc_extdesc;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
