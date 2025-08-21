Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE05CA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUwt0fMUJWNJvJ99cVjLB2kOuwygt6fjM0PT/JZTZRQ=; b=jwjPA0T7n9hlnf
	OiM+wqTiCJHQiLCxVY3r0i0x5U41VgUvM4wG7MbHHvzkNTrW4XuaPaWDsqk8CWVWdpJHk/KtY9oZ0
	3FU8Q6YzSLfC9wbvsVOxW3JQDKlC8gkbGcvXPnnNywH4r+XUkbs2uW/go8wzu4bgm2Pf9A4Ppd0vg
	Bgm04H1S1smd5WfIscmHDXEZPV/yZsgyN3dJl5Ow1HAsGq0/Xl69UfEuLIQWw+KZG01MxTfb3OCo8
	yoJ3ZGyA49cxGQNBn69swEzMNVKLfa0Y02eaX9a/AI5zWbo18C7uBU+lJVtQP2EUQojCG305Qev4W
	Daiz0wbVtaxsvuZHKFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG1e-000000015vu-1GcY;
	Fri, 22 Aug 2025 00:53:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBah-00000000OGF-1wG8
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iU84NUWejaBSUFBs/T0/O04YrYLlq1RcxZMywEFGjU0=; b=nY37DmDaGfJqTyGMUYmCEdw/zY
	RJigr8FDmOXUI7LiwiO051PjX6xtiTqm2RiR7kSVZyjBwmeJ0WCjnBgsJ6clLmH3Gk64WlHBrZwJ6
	Daq5GZjtflEaRuktz8LTtYPngqHoHBu0bQ+M9FFaw914ZkqQb23yF2calt8/xERlbCy5DVuFbONGB
	U9jP8snOS94bZ4Jw0SMyYJavX5EqQVIF3YF5V41ZdAv4HK5nGa7AAW2z+FzY8kdVSDCUQd8BL/KpN
	19yKFKS5cXNmOkWAzzFPx1lsEBRqRKgJauvIalwgFPWskqqhJXDoXCOVKWxoRFn+7+t5OqVKOR8vw
	pD408DoA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBac-00000000fJj-3bv6
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iU84NUWejaBSUFBs/T0/O04YrYLlq1RcxZMywEFGjU0=;
	b=hHO9Rx83LMmvTcjITCZmTC0eLsFk8mhiO3QQhheAiucXH8OAJUVxbHZTpK+zCKSvFpxoLa
	lR/OPHjpcKygztSBr0xKv7CdgTzij+TJltuMVo5uFcFleSWYoDTej+k+OBa7XEEHqml/Gs
	Ziv0nQ+27q7RiZtIXBbk7ieTKuvAsbE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iU84NUWejaBSUFBs/T0/O04YrYLlq1RcxZMywEFGjU0=;
	b=fSv5xAKpZtvFdGJqLHpozX26HggLmSpDHQowaSA1gfmPLAbKP3Slt5TfwUXXTUtzzvMygd
	bUwrXvj0+inQDEQWcXzvxI8yAw1GpesOrAGuPv2A4WQJ9R2lzaKfpHmI9bVkiMQYCqmbKT
	n6rRhCrzYzvGmEM3Q0M0yk+ozFhCHuk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-EsIopG1rN7ey3MCz64xETw-1; Thu, 21 Aug 2025 16:07:20 -0400
X-MC-Unique: EsIopG1rN7ey3MCz64xETw-1
X-Mimecast-MFC-AGG-ID: EsIopG1rN7ey3MCz64xETw_1755806839
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b05b15eso10515255e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806839; x=1756411639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iU84NUWejaBSUFBs/T0/O04YrYLlq1RcxZMywEFGjU0=;
        b=L+Q8l7JvDLCS8bbaZEbaELgaO6oB0mgpAjOvCpbLscM2mVv+PVTH0IJpO/uzogVBus
         UZHR/wCxdsKmjd9iaEdoapOZSQGnWY6jv5le++vkKt623Ev9QOEAaDDFssZ2X5kPkTZG
         vRtRkWNMfKlaq3mONx6Gi8kpdqNzPZNqbMa2Lx3DmrIHwaIJgTDujJ3fq45SQtmyzVc4
         wYAsqmw8tyY3KDQEL+rhIXVFSZpOZaRU/yrf21B2rxhJrt9N4/OkGpCc4aqMMwhaNIWn
         p6wyiB2dyNs4Jjfdo0hM9QEUB/fRYFJWeB/29X80VlskqnLwBOdc+870I1SB3FzMmQk9
         A7vA==
X-Forwarded-Encrypted: i=1; AJvYcCXj5ERZMcXyQGWEBRb2/0NMi/mtz1jZIlGsOSVPNjzBcN9onvlUZaEItdq8PlLId/gvOrSAvmj8loVv9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp2uKXOnvioURpHXn/UQo9rBaGczy5tHmI7BzGKSglqkKUJF0f
	GPnK8R6F6I/neOmjpfsM/XtQNg2o8/m3A5hT7w4FzOIwjrwwTOY3HD4agiejF/JUwwNoGGkWcjJ
	eW6pq0mnjPzpPMmpza/KanN49e7cFoMtFvbY9vCZAdstxsZ/o3Kmg4sgKbz/A5NxcXrSb0Q==
X-Gm-Gg: ASbGnctiPhOn4/JL3YUoXzZpCHyCBgcEE13bLdbBSw3Ff7OuuZ9ZIXDg3yL3Hk+1R4t
	s3QDfhvAlEtl4SloD0QDf9HBhjVH4TOf3HqkQABtcifY4KT9IAvNItHbhwLapqbylLSKfIc8Hik
	Oi4cA/QTWjzt+IOC+Q8UdDK4I+VGh4+oP9TXd5eKINT280zP2GvjpIGCio3737sYgK+H81RiMc2
	Wqd1uVuBi8+Ix5TfJdCz8DyVyJ0whZ0eft05XWi6bjha+AFSCueb2QD432j3cxnEDZVwFLkpEZD
	lsuyeovmG9GR9GbwSNnd63G5LX6Up9i5XuXkrNvCy9zvR2NAMC+EnUEx6OA6uuOlr7u8t8moJ+c
	bbzD0RhigNpwqehn9/GnljA==
X-Received: by 2002:a05:600c:1f95:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45b51799428mr2845325e9.7.1755806838940;
        Thu, 21 Aug 2025 13:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMhnqxttMNkrL8PAxIX9Mfq64uKkvY2MjzJ39LtAH2Yg7PxwVl8kOZ6CXLaaMF5rYTxrWwyA==
X-Received: by 2002:a05:600c:1f95:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45b51799428mr2845125e9.7.1755806838506;
        Thu, 21 Aug 2025 13:07:18 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50dea2b9sm8988005e9.15.2025.08.21.13.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:18 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: [PATCH RFC 04/35] x86/Kconfig: drop superfluous "select SPARSEMEM_VMEMMAP"
Date: Thu, 21 Aug 2025 22:06:30 +0200
Message-ID: <20250821200701.1329277-5-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bEv8SdPnkR28ZAdehPfghzd_IXzaHraUAkTVV58puio_1755806839
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210852_355477_B796AF87 
X-CRM114-Status: GOOD (  11.06  )
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

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58d890fe2100e..e431d1c06fecd 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1552,7 +1552,6 @@ config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_STATIC if X86_32
 	select SPARSEMEM_VMEMMAP_ENABLE if X86_64
-	select SPARSEMEM_VMEMMAP if X86_64
 
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool X86_64 || (NUMA && X86_32)
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
