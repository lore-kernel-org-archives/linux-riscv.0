Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CBBCA0FE4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUjTn2bruB94Z5LAjeGiSM/Rd9HjJWIGuhjdGDOm5P0=; b=eZ4BlKPezqe3GJ
	f06HZmipFctpzCzpo3uPBv7F/Vw3jvyHXJV9r3n3crRfKUT4xrtrRTQ8H22Al63a77MDZH47hZYfB
	sk7M//8IxX3ksvwKSr4rRGSmn+rD6xz7ffda+CChfdG25YjjBn+7KAFO/ZPUZ8IuxL+see+pV7pmO
	+3/YDtPQ5ivq5/KYLygSmeRhw7pAp4UhcR5CnUk5tnJBhrqVFOuaIeyjmp38dl2OPIVfmtKjrF7RE
	g78lSgX7Rh7ex1O2biGImIU6CcMo+hFEA/qDSPzu568ILzRgPBoaLQXXV5oSz+wGNHBg4taPbVjBP
	/gIRn5mGnzecxPvthSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFuj-000000014CV-1r7p;
	Fri, 22 Aug 2025 00:45:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaA-00000000Ny3-0vCQ
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qEz5al18caSg7WeU7/xaDhHrA43/vq8xaUIrOF+uMyw=; b=CDrHfNCtUdFTAdERLOIPny0L0m
	QuVztaBO0IYWb5jcfPxaGO63BifYULTkcuAzy0OCoxzVo0cFQB+K7HgWNRJFhdQj3zsDk1Rp9nQQ/
	gE9YU1SoW5qSdlk8Tva/coNh6GGV82apBXG0k6S79ysd1WcXsO5x3pS1F4+2oRJFDpgAd4LliWLRw
	oeQro0+E5hbJBOg80dwYQkq4S5f3ggDln75qNxBfZg4HSQFrUlPlH4OcTZkChEemMSdazh3sUgBg0
	Re/u4virBkGW6oCZZ399rFNZodcMUZ7hzugJKSNqfE9Gmfe8cLnUOqYTGqlo2DISwBq05su9N5Vsi
	mULfLeLw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa6-00000000f0Q-1dYx
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEz5al18caSg7WeU7/xaDhHrA43/vq8xaUIrOF+uMyw=;
	b=RpPHIlIzTn2wy4DImGCL6lMrvKPiPAG8KmWV9t7khMbi/4nUYWvaLrEGXrPwNwJ+42n/uC
	OErGeNh7AqwBjFtTuJHcMlvC/WwdcxMjwcrabUj3JwiQPwlUalSi2xA3/3xdEl5JlXksFy
	YllAkT3ItE+u3VH4kKDNhliOVy9zE1Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEz5al18caSg7WeU7/xaDhHrA43/vq8xaUIrOF+uMyw=;
	b=RpPHIlIzTn2wy4DImGCL6lMrvKPiPAG8KmWV9t7khMbi/4nUYWvaLrEGXrPwNwJ+42n/uC
	OErGeNh7AqwBjFtTuJHcMlvC/WwdcxMjwcrabUj3JwiQPwlUalSi2xA3/3xdEl5JlXksFy
	YllAkT3ItE+u3VH4kKDNhliOVy9zE1Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-7rGeUQrFNe6R8TCatSKVBw-1; Thu, 21 Aug 2025 16:08:16 -0400
X-MC-Unique: 7rGeUQrFNe6R8TCatSKVBw-1
X-Mimecast-MFC-AGG-ID: 7rGeUQrFNe6R8TCatSKVBw_1755806895
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0b14daso7259755e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806894; x=1756411694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEz5al18caSg7WeU7/xaDhHrA43/vq8xaUIrOF+uMyw=;
        b=Sdaqvp+lbHreR2ybdXSfFghYNpEYiLe1Eu15CwdtZkGtDx8d8lanfnxPuSvEcZNZdO
         OMlbR5VrRzfGk/FeFz8xM4sruIgP7cfdmT+NGmDKEmIBXRux0OOb7YfP9UPLFcg+AwzM
         tijUte6NTk6SnoMpjFwMPnUNjWSruERD1ZnZf9asTQPF8WRV1tInmrfzEurLkUxJKDnb
         ht2oPw1zbyCD5wLqJsUnl/f8u+MP0k3tDw+zj7lXybYWq3kjJ8nZ5XAKstXwrFlb7z6S
         qNN+96vAudnfCfDsvN/zSlqqJmP1eRZIVu7Oh8aEhDZ4BItV1o6/iPOnWVJx3D/rFrZV
         UDGA==
X-Forwarded-Encrypted: i=1; AJvYcCWXvw2xkdI2Fj3v09Vko+MPJb1RktYLyarwnxFObfyBXVO5euFxW8XVjj6ZVh4CYcOVaD1wdEeSD9cfLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuYYCfqZCV89l3BGRVS4TqQBWuW63u6ubXuwm92stzuIZY4tSU
	ejyADtF2FWHggpxkRdr0L7viItHBLUw60pSQBBY6ZrDjNe6UtAgcEK4ot3S8r5tI/m9WigJ+Ipk
	2jhTPwDMFrhyWv1nh/L0iS1QZRU+KCK95H70p01pP9yobvKiC3C93v8GeVKAqx6DyAC2tEg==
X-Gm-Gg: ASbGncswe+22DTpBBEnU/3mIK5elgm/9S3/k9kSCJ3dR1sp8kuaIfAQ1ye/v2ESClCo
	zta3aPOaDQPnV31Lat2RKjEP2QQdlWJPii8fdY27bLB2gDnaP9qXR5Gq9KYdPMSyYKEkcPPg+jN
	dD4VwaN7Xa1IjwzLK00kQAapCmTgfvL05c9KF1mHCrgRReLWlceNgsdTF0EdMb2MJdfeCf7yu87
	ycJT3IpOcoUp9o+Cv1UiX1hmDfetfnPZD8wcbJDf+5CSojhlvj1c1EsDeadPeWqpM+B/HqVoZz+
	8u59+8Iez8Y9fR+VpgfYsRN3+iNrOOP8sIp0owSNAmt5J/9XMgYQyCi3StcxDIltXd6TDUj4iUE
	q24ktbqSJhD8oWhQcfRxuRw==
X-Received: by 2002:a05:6000:18ad:b0:3b7:9c79:32bb with SMTP id ffacd0b85a97d-3c5dcdf9bd9mr215837f8f.44.1755806894490;
        Thu, 21 Aug 2025 13:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYrE9N2OTZOZSEOVxEUY9xhX4UsF8UOhI+5wOqBRpd/3VSIxUjVMLdiea20BiXkc+w3FSZ8A==
X-Received: by 2002:a05:6000:18ad:b0:3b7:9c79:32bb with SMTP id ffacd0b85a97d-3c5dcdf9bd9mr215789f8f.44.1755806894010;
        Thu, 21 Aug 2025 13:08:14 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074e38d65sm12982954f8f.27.2025.08.21.13.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:13 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
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
Subject: [PATCH RFC 24/35] ata: libata-eh: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:50 +0200
Message-ID: <20250821200701.1329277-25-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J_bfbNNnvpDDNNC9TtC1EC1WojlIKUupM6pApSH0nn0_1755806895
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210818_705943_1ED7F2FB 
X-CRM114-Status: GOOD (  13.25  )
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

It's no longer required to use nth_page() when iterating pages within a
single SG entry, so let's drop the nth_page() usage.

Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/ata/libata-sff.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index 7fc407255eb46..9f5d0f9f6d686 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -614,7 +614,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 	offset = qc->cursg->offset + qc->cursg_ofs;
 
 	/* get the current page and offset */
-	page = nth_page(page, (offset >> PAGE_SHIFT));
+	page += offset / PAGE_SHIFT;
 	offset %= PAGE_SIZE;
 
 	/* don't overrun current sg */
@@ -631,7 +631,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
 		unsigned int split_len = PAGE_SIZE - offset;
 
 		ata_pio_xfer(qc, page, offset, split_len);
-		ata_pio_xfer(qc, nth_page(page, 1), 0, count - split_len);
+		ata_pio_xfer(qc, page + 1, 0, count - split_len);
 	} else {
 		ata_pio_xfer(qc, page, offset, count);
 	}
@@ -751,7 +751,7 @@ static int __atapi_pio_bytes(struct ata_queued_cmd *qc, unsigned int bytes)
 	offset = sg->offset + qc->cursg_ofs;
 
 	/* get the current page and offset */
-	page = nth_page(page, (offset >> PAGE_SHIFT));
+	page += offset / PAGE_SIZE;
 	offset %= PAGE_SIZE;
 
 	/* don't overrun current sg */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
