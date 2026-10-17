Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9668BCCF2C1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 11:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oe6/al6NnEGH5peAQvQrGw1ulnw1OqS7Y5WvAGejFDo=; b=cLHY6eQipPgvb2
	aXRrA48u1MSivhuyqHRpL+Y7rD3qnjl4dEAQGQiXtR2go1G+7vboWSsJ+yaiqFI0Oe2mjvccRh1T4
	0k8+V+0Pfx+3D0vn58lCCwULGZ9o3qSISpivmANkIsgygg+SrctlaQFpN+5RQzQUN4RNdKS6hWRJH
	zPovXNXojXso1W4ocZbTQM1bPATc8o7gVmhNH/3/jcjoVmOq2WipHxud76PW4ccXiLTQviDPsENOA
	FfXACvhccXlH+EEvNcmII4G69WdXMYfy4KkHjjHYsynh96fDBorMMHoG/ws8F0+MoBYhZHfbp/Keo
	3uinHeyhD3MG8tKwI4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2C2-00000004hL5-0PTX;
	Sat, 17 Oct 2026 11:03:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2Bw-00000004hGA-36Hs
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 11:03:10 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2e8fe8e343fso2758165ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234988; x=1792839788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=cxtAAR7aW0Fj0K+jovfpkCWlcaaoOVVeHcCFVbP+6AKrRNOmiRkP6oXzK7ikTSd5cn
         0kZdD03UwGFj7xxK3y2IpuJy3TN22ZuYt+CeaERFM4RLJcz+bOwu2UjyuOjosux1kiEq
         DKkmd4ilzEzzAbIny74/pHw3slhsbH+Oz8AC1PF7DLvvnwLlXcRwHLOLtX3wAntV3HJT
         5lQ78NEx+P9YJJY059y0y2EfNwvMnHebuoBE9NAI9IeoyDlBBDKEBlH9REKuumUlVo/B
         fiaXtT9vu7ZTjoaSmHClWh3S6m6sYYHes9GRg90oRV5QHqaSsaiqe9J7ATIBNEXrtkNV
         aCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234988; x=1792839788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=WOazbNjVzvya433oXz8aJJMpGQe0vbyVXzyH5lEtfk2oeBEJIdFvG88l4aIwzI5NfV
         1in08M0GPPtzz2Lr3bJcXR2JQw0dRK+JwFmHIETHsYoZy7cB4AUWHZK+eOBi4s5x9a73
         VH/QJSkXWEsO33ZV7FmukSVslKfSJrPWTaMyeGvqhtUUNy7akSOH82TEriQGUJqDH37B
         RaJmlGjB/R4CmBaq0+m61DewrplO22jprMCe6zM4qT2uewdrMVGuG8AexltndujSq0fx
         tk/CWAKHzeZowE+avo5kOjVWt/jlymRjuw/bU00+J4hSfyuXHVF680ynCFh9tCWCwI/1
         Mesg==
X-Forwarded-Encrypted: i=1; AKwUvBwbFFcoZaIMIfrhcsmj11XkMtEjn7gRT9rjRmziyoaqZHF4kq//qE/iRe2e1+aIXGxjcEz4t/KuCjds7w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIGrIoiI2BSXpuVyYlb7gzPLjtFpyXg0XJWmWDvCyveq4XUB449
	CVUv3QRf69hma7EgLr6YPd/N3/3l5T/aoWfnRKbpni76lIkfkoCQkVuA
X-Gm-Gg: AYBFou35wDK7xK708xDxoC1pICjFjOjV0Gu7n7OqCVRBWOmt2X3eaG3aJkSrEPmGWoM
	QpyC6dzH1puxQGpa53Hk1NoR1HQlY5L+QTwo6zpXoWZke155Q8Xmi7VyWK4xT13PuKpur1ln2ig
	HpT+YQF1sMGZ64VwaDTrcikBid8j3z5NVELC0WBQHvCYDVR36JeD7ZPhcCTw4HgNotrlHRK8juv
	o8Ju3uVqWJHYTWtiqjz0qn6bz6g12gHpnx9NCbzeohpcjHkrePXAElKy9coze+mrABC1li7qMDJ
	tIjvA/tnsbqXQ6Pil5v0TeSH8g3hsOoi5xPEv9PkM90hiG19aMyW+yYJT3V4Ta4qoH9pSYTaquC
	p0pmHsHyrcnZ8gsz06udZkQ3fIC1r2dXADIEDfAGD5tmUqpY01F3Sg39a2t2UmcjXLyjDWbU7EQ
	Fv2ilzM4ART8pFUtBhFUsjd214atFtCPssf4rHR2O4XRhw8/8Li4z3Cxu4BM0qyAFMpXp+UO9u2
	LkSwSOytPEIcgK4iAhZxw==
X-Received: by 2002:a17:902:e949:b0:2e9:7dda:bfce with SMTP id d9443c01a7336-2e9a6d3c1admr19606475ad.74.1792234988014;
        Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:07 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 3/5] KVM: selftests: Use the shared memslot base in memstress
Date: Sat, 17 Oct 2026 18:02:11 +0700
Message-ID: <20261017110213.46199-4-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040308_779720_AFFCA3ED 
X-CRM114-Status: UNSURE (   8.67  )
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

Define MEMSTRESS_MEM_SLOT_INDEX using TEST_MEM_SLOT_BASE so
memstress and its users follow the library's reserved-slot
convention.

The tests affected but require no change are:
	dirty_log_perf_test.c
	demand_paging_test.c
	access_tracking_perf_test.c
	memslot_modification_stress_test.c
	x86/dirty_log_page_splitting_test.c

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/include/memstress.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/memstress.h b/tools/testing/selftests/kvm/include/memstress.h
index 0d1d6230cc05..4da03541e805 100644
--- a/tools/testing/selftests/kvm/include/memstress.h
+++ b/tools/testing/selftests/kvm/include/memstress.h
@@ -17,7 +17,7 @@
 
 #define DEFAULT_PER_VCPU_MEM_SIZE	(1 << 30) /* 1G */
 
-#define MEMSTRESS_MEM_SLOT_INDEX	1
+#define MEMSTRESS_MEM_SLOT_INDEX	TEST_MEM_SLOT_BASE
 
 struct memstress_vcpu_args {
 	gpa_t gpa;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
