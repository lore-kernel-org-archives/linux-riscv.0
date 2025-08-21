Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0EBCA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Q2/z7y9tWM5WBe26SRSA3qZRkEwCajf9Cf72PDkR0c=; b=hYkSggVnI5Je04
	ZjyMLHtq7YMmW8HQhTxO0IwqIc8b4bP80JnWdzTcJuiT7p3RTwwYNf2JYZ8zSyE4yBWxMbRf9yHTu
	XwmHwIxhPpHLeY+E0/EsGgymwRDh55iJuMe9EN5dMtRDVzClSsKNNrluKdKDlevduOy/1TmJbcIJr
	uwstyhX7R1z70aNVeS/AxK9/hMQjJy6IFJEZcHo9IVyoGKu8cPGrIRJMiWP/iblcL/MxMRxJnlp/1
	jeXyCnqSYofNEAbF6P5PCE9hyeToAtXHhy2VS0EytaCV/UIEkOgeLVEcqXxpiqXthy4jdkTK1Yd+L
	i3PqdEdILPhtfr1Pu1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG0G-000000015Bm-2RAS;
	Fri, 22 Aug 2025 00:51:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaV-00000000O9Q-0OhC
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7sWLap5u4LkaWlbSo2T/W3JLtp2tuveUv2Z9sucaeo0=; b=lcWo7SzEKh5TqdfmNWEGxyV/tV
	krT3hGkePDrQVCMVsyweVu2SzFcre0HkDts1nfHXBVdY8lByrH6H7P/8sxrBGY/FVBFwX9DGi3iVc
	Np7nS8djZ6YKgSuybEN2BvxlIAtGQLGw63jcHiA7gqldiOIaJ+IYidhAcLlkZel1V1TGyPGXSJ1rX
	VXaPnL6N0+sOB5skQU5QbXF8xD+KgndHXkuUhK4n04/NP4cvUif0zhiZ5O7EIScvK/9DVqmy8DMBB
	ajuxXiZxXm/Pgu3YdveLwM/xbcUgUm9Xa5UoGPuZR5AoyzotvXHV2PyJ1WnRNX9MEKahjyxr7vPF4
	8+NZPXbQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaQ-00000000f9C-2J86
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sWLap5u4LkaWlbSo2T/W3JLtp2tuveUv2Z9sucaeo0=;
	b=XW1LPiw4iXvcv7UmFkhPQ58LxONmS6oEW9KtvBUeFvTxeOPU37qUCPYw6q08ksQLrzn+4v
	vAjAkfMTxLRh8UZzPmns5IFJpoB6NJ5M1aySl/jEZ75UhaGigRkC8xwH15AeZT3Qnylpqw
	zk8mQ8Tqh08Vxur+pSQtS38R+cRnZQs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sWLap5u4LkaWlbSo2T/W3JLtp2tuveUv2Z9sucaeo0=;
	b=XW1LPiw4iXvcv7UmFkhPQ58LxONmS6oEW9KtvBUeFvTxeOPU37qUCPYw6q08ksQLrzn+4v
	vAjAkfMTxLRh8UZzPmns5IFJpoB6NJ5M1aySl/jEZ75UhaGigRkC8xwH15AeZT3Qnylpqw
	zk8mQ8Tqh08Vxur+pSQtS38R+cRnZQs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-uZYAKYCoMO6xWleTIk4Q9A-1; Thu, 21 Aug 2025 16:07:14 -0400
X-MC-Unique: uZYAKYCoMO6xWleTIk4Q9A-1
X-Mimecast-MFC-AGG-ID: uZYAKYCoMO6xWleTIk4Q9A_1755806833
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0b46bbso6492575e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806833; x=1756411633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sWLap5u4LkaWlbSo2T/W3JLtp2tuveUv2Z9sucaeo0=;
        b=t33lycun6PEsVxjKCOz71jibIQ0RCKplS5cA2ZCgr5Z1tGqFDFvyFeX/tIteht4zKf
         Baa3FLtk/ribJ/OP3DIEWH1DCVff9Nu0gj/KwUwz+nI6CjQisvO2zfREhQUXquh6w0uV
         Ng+PNmBrLmLLzFAlbO3IrsUvOTFZDtrz57xOEw5R7QA5YxZ5Lx9xnf4subt1t41n/gdU
         XSZlfCzvNcoU1gbJ/j4U9TXOGXv4T77PMbWS/KTcj4XbSSDUQLfHQ7xUkSdXx2nFpQfK
         RlEwiWB+L0vSs6Fzn+trmBL7kEtO8sgruTY+Dp7iD/jAXZ5bHG7UJMPJkuKoRuGoWG3o
         xzdw==
X-Forwarded-Encrypted: i=1; AJvYcCWbHwTeNDxKmRvDkojRinZqtmpnWLUPCH7YE1z3o2C5bQfQlrEuoqg6SVVkA89mkj8qNd3rcCCM7IxAeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEld5igPlvE0ZMQPXOiSjrp2xCxElAtkrX5DN5bFdebxSps2P4
	6TXFp70qG0ViKb7rwVLQHk6TrYL1VT5Era5R7eHDPpRLDDhg1hxEFpn/RDWCkyh3gA2swMopy3z
	6q2XFBOYRePav/o4U2IBAy3J7OBgLe1TVUiuKOEch+WEHlCKaJ66GCg/We8s0rep3/0j2cQ==
X-Gm-Gg: ASbGncsMltrkdoTIhBfGwCztFevRGTU6DUL3RHnEQOIi9E2lQjLMLBMvIlTBFT+HeEX
	NyF4vO/kAgTNpN6LCLQMTq+/i9G79JfVt8ElM5OmVkNuJ4hIRTJ7uwWs7bxFOMkU2saJT5dyXsd
	RM1k5NwiXkV/VBmgVQqmq364kSiWDPeCzQUD9fIeMJVYD0FfFs5gdIAfeAPQrF+OoQaAuAESchB
	EXzepqJN21HyMIh4zpbLYRc2y5qMYAHuw0ic0eiV1b28Snc9ZqnT76ZVtSahWIe1XMrnOMnqTUu
	m2Uth/yRWQgPXMXMg1DM+x67ZWZJ7cZjnMjgGLdpmbS4gklJIkcL9WXlsoaJIg5gBIgN+PnqSsy
	ND4zgbWc5+HwurpUj9r/IaQ==
X-Received: by 2002:a05:600c:1d06:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-45b5179669dmr2598445e9.14.1755806833359;
        Thu, 21 Aug 2025 13:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSutx6qbatKffMJ28UfT2ZDXFlSv+vNq81oYks3KAGI73zxxTWKo8ClwQ/mmPq6W0wDfVQow==
X-Received: by 2002:a05:600c:1d06:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-45b5179669dmr2597955e9.14.1755806832889;
        Thu, 21 Aug 2025 13:07:12 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0771c166bsm12916801f8f.33.2025.08.21.13.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:11 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 02/35] arm64: Kconfig: drop superfluous "select SPARSEMEM_VMEMMAP"
Date: Thu, 21 Aug 2025 22:06:28 +0200
Message-ID: <20250821200701.1329277-3-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZHowcBQqSfIGBNWfgt6OweVg_2x6ixsn-9X3_726E4E_1755806833
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210838_752266_8A91BFDC 
X-CRM114-Status: GOOD (  10.24  )
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

Now handled by the core automatically once SPARSEMEM_VMEMMAP_ENABLE
is selected.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a64..b1d1f2ff2493b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1570,7 +1570,6 @@ source "kernel/Kconfig.hz"
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_VMEMMAP_ENABLE
-	select SPARSEMEM_VMEMMAP
 
 config HW_PERF_EVENTS
 	def_bool y
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
