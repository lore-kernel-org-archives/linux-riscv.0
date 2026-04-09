Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE77E98FD2
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZJFkbYc3eBODQxersohgdmvgfxvJ7J0rG7z9EcsLUI=; b=gBPKQ+e7925FIz
	kUBe6CNJqecnr8xoAVUX01XUd8gbf6CdS8l5AVRPlk9IVV2BKhCpWMgIC6ZdHlZOUy28pXkPXePR9
	xXDK6Xcqb6sIQdKqffberShha5MTHeXPfMXYbOvkxWB4fFW53uFKEle2ZHDrXDrFE/YcAqUh8EliG
	wVpYF+q4k5OUomcz4YST3BIt8yT/aZX39yeTFkpmI/Z4/MMf1dEgOHbaHz86btJY8fA4MUB11+EPr
	wTYOBXg+tFkoPZbpUe6kDsTxU9MtOo5d4C4gON4sZhZTWl6pd1blKPZ+vG/wW0VF9ghe94xJAbXUK
	9P4L55m8RnQDtGfaVEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAm0j-0000000A5CT-01cZ;
	Thu, 09 Apr 2026 09:49:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAm0h-0000000A5C6-2N0Q
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Apr 2026 09:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ArqqKVyWIMN9eczDpfd6+1wQ00bc1tFZsdDTLBAVmAY=; b=G/uNqQ7XHzs1WVXynB6+cMbgDi
	i5IQLnj7tua/Awy1beshM7CXYu0wHfVg9H4EZIBkRZS5io15PPHhHB2IAO71oyvWUIIzvd4LcyD04
	u4ctg7QiEqTbhiS/h5UcYAdjLEYsTOn1DKL1vHwSpJVFO+/76LKiH7ZYLYT9Ocwy6T5KzR+SyAdJE
	lcXqU0R4j90DrD5z1uUc/X2gojZpiFLFNr6qAzaz50MTH76DoJyceZKR2suqVjbjmlQPgRIoEPvVy
	4bFFwSwoi90izRPbH6g2vCZZ1MLaQt35PWL2QtX1Gs4vp3W9q3NxzBgPmgcOV0gR1W+qNM9PDQstk
	TVlk+sFA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAm0e-0000000BS2N-1Uae
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 09:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775728149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArqqKVyWIMN9eczDpfd6+1wQ00bc1tFZsdDTLBAVmAY=;
	b=AO9UfKW5O+CwWX8+rQLKzDF+WKVOo7gmpjC1xCpl6upa51RRoGgDAgpeexwKGuitgG/KDZ
	diFgcKnswkRS9Yq7UI9/qKHNrf4iPI8k5Lh2uFdio8NCbZNT78nREycLFJMaxDCy4XIv3J
	ZetC5/ANUTdrcfya1SlQqw151L+W0JE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775728150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArqqKVyWIMN9eczDpfd6+1wQ00bc1tFZsdDTLBAVmAY=;
	b=fH+3ifkIg5xggRnWmg0zrz08KZbzQIAJgWpHpL5B5XVm0T/SHbrsI+zvZYKcaifxURkABf
	13vzlU2oB+I8lPC3Kja5YBaKcLko+l+d99RL8KdUZuEGxz1eaeeGsYKeMUtxckzK9YByEo
	Nh2inQ4vc/ibSmYvmIAH/ZULnPrpV5s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-nKOs2kagMxmW02h-ffOE4Q-1; Thu,
 09 Apr 2026 05:47:44 -0400
X-MC-Unique: nKOs2kagMxmW02h-ffOE4Q-1
X-Mimecast-MFC-AGG-ID: nKOs2kagMxmW02h-ffOE4Q_1775728063
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE5721956055;
	Thu,  9 Apr 2026 09:47:42 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.155])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 07B4B30001BE;
	Thu,  9 Apr 2026 09:47:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 5/8] kselftest/riscv: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Thu,  9 Apr 2026 11:47:05 +0200
Message-ID: <20260409094708.1687376-6-thuth@redhat.com>
In-Reply-To: <20260409094708.1687376-1-thuth@redhat.com>
References: <20260409094708.1687376-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 4Tn82RV9liG4CBtuxBCc0Xuf9UtEDrDUgKfFajIInHo_1775728063
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_104912_654083_4694B0B5 
X-CRM114-Status: GOOD (  11.54  )
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

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Cc: Paul Walmsley <pjw@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tools/testing/selftests/riscv/cfi/cfi_rv_test.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
index 1c8043f2b778b..184df6903d01c 100644
--- a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
+++ b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
@@ -56,7 +56,7 @@
 
 #define CSR_SSP 0x011
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define __ASM_STR(x)    x
 #else
 #define __ASM_STR(x)    #x
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
