Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53B7CA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrf8+bqpANcA3Mz2tjeZnhCePztyDGtLsb8iSUeEugY=; b=LeylpW3xxPh1v0
	zks8obE/GbT3H7hw14Z3AGdEI6UasyyhkWikFMDhf9MUjaZXaofvgP+QB9BgG9v046O3UDpjRSZxb
	xEWtXRJv4GVvBhkaFtSdvmGfTZMvITixuEJTJd3juwZysFuYbIvuySxDl4q0Qq6A5i0hWHG59rNKT
	IhyuC/CnLhZ4zmhL0ZSqQLNrul8UE7wNqfjhdDJ22JZV1eYImQ87ZV/UWRotKM0Cf97QvK7so/7v4
	iusWwBsOaplrrxILSGGTr+j/YWpTAuWSovN0RfhlmnJGa8jFDHN0FcDpaRwsJXlO4D1zwdXYbQcaa
	NWMrC4wsQBQX+Ano14iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFxK-000000014cl-2SKY;
	Fri, 22 Aug 2025 00:48:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaB-00000000NzA-3IQ5
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5m4ogAvLOK+AKMqlHwhkjmyVbS/4gGgmBykcdwEFmjg=;
	b=LHny8+s/aqrO1XuusLPvO0oPWwHxejkeoKYF/gecm3kFVmafsi7zLRGgM26uHfxVr2bg3I
	q0l1UhvVTzY144gb4nH9G32jisnUlDYh1WzmBuMcbS+B47CAJzxNVvhao0K8Re27VDJu6g
	1LsGaeX39mFMlAAnlxUI1sk8/fA6wcE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-TIWyFYAZN6GP39GdRf-FQg-1; Thu, 21 Aug 2025 16:08:21 -0400
X-MC-Unique: TIWyFYAZN6GP39GdRf-FQg-1
X-Mimecast-MFC-AGG-ID: TIWyFYAZN6GP39GdRf-FQg_1755806900
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b05b15eso10523155e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806900; x=1756411700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5m4ogAvLOK+AKMqlHwhkjmyVbS/4gGgmBykcdwEFmjg=;
        b=KqCAIZeXTn0e+7CsARnWCaxrW0pgLOoRkBT9BuXwgdgRZPfwS/yNDwpMdeZwoxjpmI
         KzqBYen58jjTW3kr2WtMNZAn7c2sh7DSb5dR3YiVUOyxTsHeBf3QNBQo4iwywFEy44u6
         YOe2VU2UYpN5Cs2Ltns70UeK/YpkrlQlYXrl5t5VnBPTiFwCs/hFucy1did4CVZn0hzv
         7kyfFUS4vxYLC/3AN1sDPHGp+BXRFXQaQx40Zls7AN4RVRh+hVNyd9tjlpXvInMz7dhe
         o9pFuuCY8zHIDhMDPLm2OwyVYTfez/qqJ2lHVvbypsoZAK1ZGbDF8AesQHoz26K9GcwE
         ig9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHXTWx7Dvq6a4w1PQ448/nFgO/h3Uy4bjd5Oc38t687OhducF0kgvA2kkWbHyjhvjWwXavAN9JypyhQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz+Ca1tqX3yxeXl47T4AE17eTLj21T0N/k10Kn8ZXjVM640S5Q
	goQj30Fbn7slcq4rZ/a35Ft2JeHziu8Bez8NRNlif7WwE+3hk9bTn9Qc9aUZJaDLgirhYR2kf89
	DYAzk1yRsED+I+jFKZzyRKgOQqPqHR5rv//QtbxJbvkmyVRP1dIX0cFCDYwpX92/gOgHp5g==
X-Gm-Gg: ASbGncs5g0D9rZOSI13BYQ68bcGyXLtxaCcnmus+H8ILMy+AQUrmZv26BxnTvq/61w9
	aRcDTW1fe4S3o20jd2wl2RXXh9GgWjkR/OODI3ovHX3ueqAgqGVECdJI/wXMJgG0LNihI5wqJ6e
	nCpi0FfGpuZCC9HqV4seOSNuJNl2TXfaq7cdzVCf3V4n1hBTaz28Sz6yMnFfWO1PHH1jOJ50AYw
	qdd7dECIlM1kyPrajZbbDMdmam2SJX8FlVBmszdwT8DDUzGNBSWHFY/kWDph070wmgWNgHU2sL+
	BKz71aBD9k5M5VvQTUor33YeQU5FVkfirdHJL1zVQ3kNJOQ9XiZl6zcTnyq5Jcy9IjBsesGY+Kq
	tggv7SOpmoZH0bH8/+JlJJw==
X-Received: by 2002:a05:600d:15a:10b0:458:bc3f:6a77 with SMTP id 5b1f17b1804b1-45b51f2fe8dmr510295e9.2.1755806900285;
        Thu, 21 Aug 2025 13:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpV2b3uhR/IYbmrTMgtg0gx1wkF4+JdBDenNBBSMhYf9nynPUCNMa8PTADPxo4/liFiw6TqA==
X-Received: by 2002:a05:600d:15a:10b0:458:bc3f:6a77 with SMTP id 5b1f17b1804b1-45b51f2fe8dmr509915e9.2.1755806899756;
        Thu, 21 Aug 2025 13:08:19 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07487986fsm13999227f8f.1.2025.08.21.13.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:19 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
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
Subject: [PATCH RFC 26/35] mspro_block: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:52 +0200
Message-ID: <20250821200701.1329277-27-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AfBsaVxBTZno4lXqaLy28wnaxamKLRhVw-R9a4dCfrc_1755806900
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130823_898477_CC37AC4F 
X-CRM114-Status: GOOD (  12.28  )
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

Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Cc: Alex Dubov <oakad@yahoo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/memstick/core/mspro_block.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index c9853d887d282..985cfca3f6944 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -560,8 +560,7 @@ static int h_mspro_block_transfer_data(struct memstick_dev *card,
 		t_offset += msb->current_page * msb->page_size;
 
 		sg_set_page(&t_sg,
-			    nth_page(sg_page(&(msb->req_sg[msb->current_seg])),
-				     t_offset >> PAGE_SHIFT),
+			    sg_page(&(msb->req_sg[msb->current_seg])) + t_offset / PAGE_SIZE,
 			    msb->page_size, offset_in_page(t_offset));
 
 		memstick_init_req_sg(*mrq, msb->data_dir == READ
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
