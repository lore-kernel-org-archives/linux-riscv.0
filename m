Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6849CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvjmevGKovP+Vdbn5swKS7900TPrJkQK/5LhFT59nuk=; b=BkjIIP9vQXzw0D
	OGysgKon7Ar3YYc7le3/ecJp2BA3zaUoGYhkKJDiV9/jMy0aRoVCjnnllp1jrCpZYOeshbiIa5W6D
	eAiaz16P460gnF6eekfqGfYevrARI+08j6cgx4cAeFtGSSIpY/fz2AEdDG2dWZ7gydGY3kLPXPyJL
	n02eJB66+YMzikFgnmkT+XL+PceIJ5/Nem7K/1kiCcowC4/YsatNY4gzQjEO7SI5f7IajobTyHaIk
	/qqq5Z57+uRlNiunEbiXKNgd7hFBMo3kCXeBqtwy94k7xIVPaUixVcFXvCPCfSuvRsHx88D5XSprD
	thf1iKiofi0EkSJe9VmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrwm5-0000000FAKH-24Mt;
	Wed, 03 Apr 2024 09:19:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvct-0000000Eiml-072q
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 08:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2HMUEh/ouJpwrjadx4E8ELJ1oGZIEAqlVNHNOiveHPA=; b=nGBDO9hTg6Lx6QgE2Q4r2AFIfT
	3EG4JRJLSBedDVCyTlWl7zOJFFzJMfN31CqKBQuTJufubDkmhKeXjPliOCBHm9myR5ZtzbAyng8QI
	GWVgtW4wt/7wrq3qkYh8tB0LsWOY9iz2mwdeq6sYzzLdRjkIbrqOzZUbRPqv+KX3AyEvmwRSkoV05
	p4seF39oZ+4eHC75XgWRgVwY7zopnLxzlT41kuSbokyyh87hO47w0DAudLvfoRr/Bg+EERQHXWgRc
	JXrtVEug9zINzanABrtVxAeetnc1vWZ7NgZf1NXjQcxrsQyGmYGvByQlumboeqp3rGG5XZ5mg1f3Q
	GETReWWA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvci-000000055dH-0fb2
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:41 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e0411c0a52so51648225ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131529; x=1712736329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HMUEh/ouJpwrjadx4E8ELJ1oGZIEAqlVNHNOiveHPA=;
        b=AGja0JDHb+PNzXZODDRPqG5FIm2XrBOYXLGctDm3UGzTAgXY7uJH7qd9YpLlLZtNUK
         q3X0gUaHoVt1mCR4p9LVPqa1wystQDN9j9I6Y8lNMwr59QsLTFQd6Yhq82oPF0TRE+gZ
         rcFzwg6/8dCJsRbyaPwxsh4qlfzA+7gWg5/1wJ61N0OmFFHvslA2F2/8Yn8w6iP3FrqA
         l2vfX5LM6SYKP6V7btS7IbuFRzfFlSuOpNffoUnpPPb3AHOrPNm+MOwKJkIYxlBh7PqE
         WwLNH+tD1Wuwe1ni+TdQ+tr8Hh6yTRrL9PHqX/PtXMNwA+qmozrE1e3Zw1cbmKykg7fn
         PZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131529; x=1712736329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HMUEh/ouJpwrjadx4E8ELJ1oGZIEAqlVNHNOiveHPA=;
        b=gM8KItk5vwrhX/uy3JN9bimMXxW5KhNMat70hy6XqdiC1J+03UrZgM3bIj4Or8HLXd
         5KvDxCXFOOU8rWQRuQgkFCFvxyffbZUFTZj27TQZ+puDAt0IBN+8RjVUfhXiOzq+QdYS
         1Y94uRVQiNiO9mhzbQqifLaNANmITHQxFu6UfEj+47AYBuFWiwXxw4od3lBTSTIjJmoj
         7Ny0LduHHiFJTnyEFL3811PHJTDtCut7b5Wv+fhXLNVPCFwFfArBesbz6Afb+fAz1w3c
         vjlp9EoOWFY6nzYqmIWOi+Ousaxb4Xoj9vXD9BYntuERaXg8iusoNI495/CxbmntMAOO
         i1fA==
X-Forwarded-Encrypted: i=1; AJvYcCX814UNPh1hp6sTjO9YOV9OqylegFF35ygu1iLGCr/QF+zhnBrUTZpeiEgr5VcL4JkQAwX7GcjoBoXoVVpcvu8leQH8wzpu56FjGpBjEvSL
X-Gm-Message-State: AOJu0YzFBqZde9jy1h6WRkdluw2de0MPH48M/PBx8FRbCVzVUH5Zs2k6
	V1h6gWHfF6n5GRyL6lFJMFfiwEE15AJqjP2RUG5GeJ8EG5k5CWPgdIDKSeAi9I8=
X-Google-Smtp-Source: AGHT+IF30gBaFjuZamH6gB+fLa8VQAOCDXL32p+FdETcNWyCBYGk0g9s0A7zOmyK2RvO8zqC4rEDCA==
X-Received: by 2002:a17:902:aa04:b0:1e2:23b8:98dd with SMTP id be4-20020a170902aa0400b001e223b898ddmr14090965plb.69.1712131529484;
        Wed, 03 Apr 2024 01:05:29 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:28 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 08/22] RISC-V: KVM: Fix the initial sample period value
Date: Wed,  3 Apr 2024 01:04:37 -0700
Message-Id: <20240403080452.1007601-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_090532_239461_82C841F9 
X-CRM114-Status: GOOD (  11.10  )
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

The initial sample period value when counter value is not assigned
should be set to maximum value supported by the counter width.
Otherwise, it may result in spurious interrupts.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 86391a5061dd..cee1b9ca4ec4 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -39,7 +39,7 @@ static u64 kvm_pmu_get_sample_period(struct kvm_pmc *pmc)
 	u64 sample_period;
 
 	if (!pmc->counter_val)
-		sample_period = counter_val_mask + 1;
+		sample_period = counter_val_mask;
 	else
 		sample_period = (-pmc->counter_val) & counter_val_mask;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
