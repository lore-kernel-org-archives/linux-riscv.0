Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AE606A31B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C/9w5Uv8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CDf17+LI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IcujbxiH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WaerC6yDqt6cg8+lP6sKgQkEVkgHmGyQSH0NeSggwY=; b=C/9w5Uv8tkNo4R
	bsVPO7i6r/MYkh9grxzev5bM3Z1yqlEpDRR2n0UwlliqE034HXMX0kdlO4eiUHTubVlNKiSCQx9dJ
	sXWLdwXao6/Shlzwtt0BgpAdA1GlfzEYE0ntEwPC23sVc46WaYvs44YCMQhttppIzKcOjFDWXEpLl
	JguPx+RkfFxo+4m0CatgfrG46oNmiDlGjfhlQsRMHWzpLOHYV5dfO8Ih/uZwzswgnm9n7y9B/6R67
	JS4NO3PVPB3zz18xhXFeWSBmbOd3mIJkiw1rupLsbgKKJtx3hQlyjkf1xpNXh/6cp39mVCv61E/Gk
	Sr7prDdfIO/QSBoK5g+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRkX-0000000BNXV-2Z3b;
	Wed, 21 Oct 2026 08:32:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRkW-0000000BNWY-1ToN
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Oct 2026 08:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=; b=CDf17+LIpOwE7TpC9ORethpYA9
	dKAhlh1R5KPB5EEV4kdKm3h9wyeef4f2016kQ1ayw4d8TH0Zq2lpAAFWN0Iw1rPFLYzlg+T72++Xb
	cvQRqlX+gIR86FCjH/9kl+HQ24jKIXTGm/3MusicIKu8uf4d/nGOtzpnje8DTt47gZwkvrsLPwakY
	7C906F/3MiJzdkRq3g2FFvws82H4kE4iEQ38YGp1LeET4LqwiRzS9F5hIriNL6us9sG5JdpCML8DW
	9awub2JF8VbyJYlJrG27OlcaBEJLFNuZenyd7kYzGWL0e/IOgQmjZ6vZtY1zZN7LaZG/eiOeEiJWB
	r2eq7SNQ==;
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJRkT-00000005bKS-1Y5r
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 08:32:39 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so54621a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 01:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571555; x=1793176355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=IcujbxiH1vkx+wPluDrqbzUsEpNQCEbYAfWDSUN/bWh6HlF01y5Zba9t+PP9HKKiXQ
         AAl6bl+cujYLsX6EINaDpZ/aLGU2pZ3uigZwCsLs++Q6M/xGrVqTFKSf9yklwYshR2Yn
         oDSW7M8ypwkuS+1Ggc8Peig89jB1Htz1xZeWQ5jZwrV1iglX0KSct3f2UxC0WVTPbjxN
         s+d4l9jRXktFn8QOvw9LsLznQ5NZ99uswfVh8ySBGUHn+Ms7OOwFeT7dfpEnukfBPXFj
         mIyHgqxEwiB4hs/u3fZoi70ybSDNcxV+4DiKD435Ur4QKbG/U00TNHj3tqg6+CZIS24S
         A3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571555; x=1793176355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=jD5Td+IQn1VxQ3xdD8tAiJuSbJQkQeaa8+ugSMir0D19hxRxfnHDmZwZm5FCfWASQL
         Vi5C7cxG1JQigqGqthzVoSbNdWg+fH1/Ly4jmqEgoku+Uf54IBiJdV7pdVSF+CejBsUX
         /aDR89U3t6YSEj6ZSye4unLv3Zfx+9Oddd63CK7Oiaq95owOPUBZu+e0cMFjLt/egaCh
         kmzNWqi1gB+802ZNZ+3M/SU2Cm4p5Td0sfobIzRZO6wucPw9LPHXuTPVn5h7tF+9Nv+C
         Af72OMQEkGB6gqggDMh82yITDl9PNo6EqUWS4Vy42G95TB3v5zXBZZ31uPzxLPJ4Y2kG
         r7zw==
X-Forwarded-Encrypted: i=1; AKwUvBzCl48IA9zO/ZonuCD9+jefx2bixO4yOWOyIwwtRsgPQQ/jszujiZisj0XpC93rO3byEQZSsDKfnV5G+A==@lists.infradead.org
X-Gm-Message-State: AFq9FYIN11un9Ub+entCok4IBFE/RJaeWklEnGyEPZ906xx/IVRr4gXC
	n/r5g5FBAlcWxj0EhSzJbZOOGI8X54m/Hj6BlIU4ExFsv3vG39wh6/NE
X-Gm-Gg: AYBFou3VuaxQ5IVoCJ2+U+pNLSFaO//8bNTIHGYLbAoV8UYNDbjYVhcKgeo48/tZfBR
	aapsj/h5h9IS2L+tn1GpDhNrHaWCXdC8qOoWTNIZZMwETPoRf16yBGtkwtcHcaWOIqeBHHkTFz2
	M31PV6MnEUFIIp+sSDYQkMtU1acn/MaxEN2eP2g1/aiHE5tYUH+oFOudfr5SXxLG+R866EhjiL8
	8E7zY8EtupcWT7oYETvBZ4VT7ObIhq1/1TJeqlqfD4HsKCd+s6npbvb1zlTmR+XOymjXc5nZTzQ
	Jy6PHlM7x5mT0HxinzJ2TGqs1dXTQAfdeqbL8yuqJHn5dzJOWwaOXD25RGtswDmyYLZjCA3zq2f
	ER8XNcQbtXL4XnhT7ky9/y08zBUV/EK/HG63Nz75+6Bxe3RMLSc56ZJwIOP/s6VbhgqdFR6NmK3
	aje/DTA2eHgFWWYkQU7f6eunvo06wTKfm26wGRL1hqoDdr487cZSDPT8OYjpuI3/FOfovn/rb3r
	MFnltC+qTEUC5DtD8OTPYX5rThdjCfs5/s8LegDxvT8CMICPBi1+k9hjK8sq6H+khhK
X-Received: by 2002:a05:6a00:1786:b0:89f:3f60:cd81 with SMTP id d2e1a72fcca58-8a089d539cdmr1130152b3a.51.1792571555108;
        Wed, 21 Oct 2026 01:32:35 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:33 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Wed, 21 Oct 2026 16:30:11 +0800
Message-ID: <20261021083011.2170525-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_093237_526570_34C16BF1 
X-CRM114-Status: GOOD (  10.63  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e161c8b65e00..0e2ddc933b22 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,10 +283,10 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 unsigned int __weak arch_get_system_nr_ranges(void)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
