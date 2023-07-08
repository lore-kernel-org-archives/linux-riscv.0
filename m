Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8F7EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 01:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjDIDAn+5VKAL3pY8Vbe8Mtoqhfne/19lpW9+eSlVb4=; b=b65Ot/BSelF5hs
	gtPQH73Ly9LKrVKTHhX+r+QWcqN+zw5zdxf9hGWWHkZH7Nbvrc+NJewXzn40g77l5JgF75SbpPCmD
	pQqAfMDKCvHgz7vvYkSKuoaWwg0RUnsPVcxWAzCjy4QDmWFieTwD2uCq2hM817G0SONGv1K4C0F9m
	HciWvGYj2tl/kUvVJo9dHpe0bx0BDcYlHt/3j3ue6t9T8FPJ3jAl2VpPemc93GWtQ6BFcAJ8DowAw
	WemmSQKi2UBofW0P8yXVyyDIpJtY3Y2jq59K1qrxq/L/iSKrQj36Wafw8T2Nvn1LTaISXRUOGIRGm
	EGVf5OYGs30CWYY+VuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHwUu-006DoO-08;
	Sat, 08 Jul 2023 01:12:28 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHwUr-006DkJ-0q
	for linux-riscv@lists.infradead.org;
	Sat, 08 Jul 2023 01:12:26 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-563439ea4a2so1834048eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 18:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688778742; x=1691370742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbN8vPNRnpC2rsql2yMQGj4/q3r+GbD6Fgm8kHqgv+g=;
        b=YFsN5teo2Xz7zOmpo4/u8q+vpC9gfozaUxki8nVKZv9U3t07rRrfE2F4D/Mpc5IR6Y
         g2mhkupBGRVRoam4tBIlKDHh9QI3CglQEfd+e5rWKmh2SSW1KWTgyeQZWx33sFhEiL/R
         zgEzQmy2w6g0b6bkpsyL0pXxNONEUqIbqM5EyF7yTZ4nd+QmM5x5KgzeZtipCgrkcwup
         nNVAWTBHg56PkxtsUwaVwvwNubSbZIkurOLzlb3ihhEr/nv+HyjB0A54Sr6SdIfOKJ3r
         u1doM0X8jjfji3no8jcXuswWv7vTaFA/xQIWTftyN61BawJxTM4bORzaV5IG40o6TLK3
         Hpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778742; x=1691370742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbN8vPNRnpC2rsql2yMQGj4/q3r+GbD6Fgm8kHqgv+g=;
        b=Fb91FaYCohI4fvz3pY3oz3VDNlke1cHmPI/PItVM12LNsScyZlNF+jERbtSo/L2nwz
         qGae51aDsBZqyaPcK4x+OAQkEf4Wz2fQE0vKkEodCjOXxploMyyDpy9nHH5Fjl5yjE2V
         PnbJmD0i5fL64sM91R7tHxn2N/wPiUquP4s5C1zRsi/W/pETWYR41wXRHGyFGjCmYbtW
         K7JuYSV65zG5RhEOvsnO+3yW3FoSd0d9mg+L76JIRZvrsxVfZAYgAU6pgF6gWEsggGot
         U9JJjGC5ACvH3Wc0yZgSD+2VfCqK/xrnvx8OZnleGCnGx0F/aQZdi4J0YuK4Vpb2kF/z
         06gA==
X-Gm-Message-State: ABy/qLZigd4SrWujQIM68d0OU8Dx7srgHBwx1FeSw3Fe52iEdxArtSPu
	4oOjxsURoA4ycb6l7UdBF5HLsRzgMmU9x3XlV2k=
X-Google-Smtp-Source: APBJJlGdindojK5i23bHPXGUqY/0vPqfcqx7SQxTQvxyGmC/pEljPyl1GkowwHsZX51mLjvN1LEySQ==
X-Received: by 2002:a05:6358:2925:b0:125:a552:4389 with SMTP id y37-20020a056358292500b00125a5524389mr7496248rwb.22.1688778742292;
        Fri, 07 Jul 2023 18:12:22 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x24-20020a170902b41800b001b87d3e845bsm3830654plr.149.2023.07.07.18.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:12:21 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org
Subject: [PATCH v4 4/4] RISC-V: mm: Document mmap changes
Date: Fri,  7 Jul 2023 18:11:35 -0700
Message-ID: <20230708011156.2697409-5-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230708011156.2697409-1-charlie@rivosinc.com>
References: <20230708011156.2697409-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_181225_300983_3F104849 
X-CRM114-Status: GOOD (  11.98  )
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

The behavior of mmap is modified with this patch series, so explain the
changes to the mmap hint address behavior.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/riscv/vm-layout.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5462c84f4723..8141addbf888 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -133,3 +133,25 @@ RISC-V Linux Kernel SV57
    ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+Userspace VAs
+--------------------
+To maintain compatibility with software that relies on the VA space with a
+maximum of 48 bits the kernel will, by default, return virtual addresses to
+userspace from a 48-bit range (sv48). This default behavior is achieved by
+passing 0 into the hint address parameter of mmap. On CPUs with an address space
+smaller than sv48, the CPU maximum supported address space will be the default.
+
+Software can "opt-in" to receiving VAs from other VA space by providing
+a hint address to mmap. A call to mmap is guaranteed to return an address
+that will not override the unset left-aligned bits in the hint address,
+unless there is no space left in the address space. If there is no space
+available in the requested address space, an address in the next smallest
+available address space will be returned.
+
+For example, in order to obtain 48-bit VA space, a hint address greater than
+:code:`1 << 38` must be provided. Note that this is 38 due to sv39 userspace
+ending at :code:`1 << 38` and the addresses beyond this are reserved for the
+kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
+than or equal to :code:`1 << 47` must be provided.
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
