Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057E0CA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjR4GTc4QjYIWoLxcccfd61qsDUzJoe5tY7E7X5tlAw=; b=ioRM/8QZZThbKL
	8k6OY0iRaEY+XbOE2kUgfTbaPxdtNpAwHhHFpOP1tlkOV7b4C6gGk4FEFWuYxWAGWtO1oO1G7Wtfi
	E1hVtjQoy4IXNHpLTGtfwmQ3NbkaamO7WWyueZ5z7I5g21azsgL/YSC95/ASbZZDqEmF/f0GnhH5t
	coMu8qA8anU4qXWPAy+2vpgbsqkF+FslCRhvdyvabztJnHXgi8pQ7fxOX63bSWl1XVdcvcp9a77xv
	yPh5bxJlCa2umnCs6b/grnM3VCfV6s2QJ7daBma2wLWtR1kb/Z4JMZwneX6x9VYq0aGzEzjSJbL17
	94YYVPEzRS+Tt7Sgtqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFzu-000000014z3-3woC;
	Fri, 22 Aug 2025 00:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaI-00000000O2R-1zqz
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yR/3u5W37RASrGsn/s3pQVQ78UUgH4ByCavV3b4UG3M=; b=P6NT+s2zeEmjkJj0OPMsl2kvF7
	EyuGWvZ+oaMcqiHRy11KSJW0Vr7i+Vr5qm8T0b1p7Mp9b2pb3UhdheM9TR5LOh9qzR0AEuz3oU/uN
	QPPlbY5GUAVHw+1AGZ+NvpBAa8YqN1MlpqTK3aGCT8UhrTqKCB8Ou0HhjUd4t84IKRmUoWCRc9DDm
	MUoFFgjacTQNgdB+zk/+LVD87vqjynnp2abIdShNn2QerJkWJu4E54rVgsncRUlotEs5E3XWJ7XzJ
	kZuyyhinXqp2bW7wsPhF09bCvFdhF8VBgQh2jnFA90uhGHvbXs44En2l9WcVvcIZVJAzlGJt7rvpF
	J1kke9iQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaF-00000000f4D-1jdh
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yR/3u5W37RASrGsn/s3pQVQ78UUgH4ByCavV3b4UG3M=;
	b=DpJ2gAzWYwi7Z9Viv2yUpZ7N1lD0RdYGI/sPgYXnlupS2AH6sXLySPpgMos2zuETN9W14L
	e0gW2avxc0iiw7xV8wOmW0OMUEJNoron21zFbawAq/1u6csGxhGbsjknuPmfMn3XsRsaCS
	2B3Tt+Fth9wJqNKKRa3Tchr1gEJuXtw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yR/3u5W37RASrGsn/s3pQVQ78UUgH4ByCavV3b4UG3M=;
	b=DpJ2gAzWYwi7Z9Viv2yUpZ7N1lD0RdYGI/sPgYXnlupS2AH6sXLySPpgMos2zuETN9W14L
	e0gW2avxc0iiw7xV8wOmW0OMUEJNoron21zFbawAq/1u6csGxhGbsjknuPmfMn3XsRsaCS
	2B3Tt+Fth9wJqNKKRa3Tchr1gEJuXtw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-bxGMsMU-MyqM1uDC3_vbBw-1; Thu, 21 Aug 2025 16:08:25 -0400
X-MC-Unique: bxGMsMU-MyqM1uDC3_vbBw-1
X-Mimecast-MFC-AGG-ID: bxGMsMU-MyqM1uDC3_vbBw_1755806904
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b9bfe2c601so767120f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806904; x=1756411704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yR/3u5W37RASrGsn/s3pQVQ78UUgH4ByCavV3b4UG3M=;
        b=vCjBLvwpdqleuZlWb614NQG/sznbFd6mN2d6QgC+0n6HqDflYVPnEOcV8r+XirvcRx
         zmsaSuWW0svG6n/B6SXSTiPo5ibHExnusiIfoSLpk9BihNGcRGxl+ycbFplD5N/TzmDY
         Jk9LUCDdS+nODWvMOfSa1dzwYTCMakirvnUv+DfQPOQRFZiHY0OEAwOFnvac730PZVID
         AnHquA7ryW6IIr7ZJqFnpWB24qgYf8PipnHJ3HB2LLpKOnhODAYw6WCS7lIW791p6XaL
         /AtJsX3/IxAbVIb+ac8OZyBvQVDcLzxXRGI7M4Ws4AcMSxrdrx3l/XJKTcojkmi84jad
         LZpA==
X-Forwarded-Encrypted: i=1; AJvYcCVviRKaDRwGu/oHpzVnqqY1kZeLO4FvpQ/zR1AKmSLZZIRt0Jt+4nYfUUkbPxyOfvfNKvb/qT1I2AYwhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuGmXgYpHbs7+w2n75lT4HZf4IXK66zOjxtr/XCFe2yDRd9AXf
	DzQCHn+lQgRRAQUrWnrwYWO24/SQcochnSpAq6WNIXnf7faLkb/GR9vYCQf8uAE3TlBQZxFrKNH
	/sqLkXLMu0XbXdBDxSEt/YNreBBsw7oGnsn7Rs8GThqitFmZ8ejUU9QFDISBzbmUbrctjXw==
X-Gm-Gg: ASbGncsGelcy1znPt8iD+P6sFQI8UtBcvPC1EIHmwmC8rY0VJuPaZGNiUn5TIOwTG43
	rUTFmLPKeLx+q5WgN5pfG/daxdUykZ3s/yb41E5TIKMtqid8cfeHtFVsgu4ZUeGCtjKIUn/yAEE
	vRygAGY1vfhziW3/RIwhwHi04ixhhXp8Jikm8+TIbT5pFlAKnkDY9ZIyhlC+mb6ZEHLa+jre3kd
	odhIdwAHUa5MgqCPHCvHDmcWNHnOc+rurDgeFwPsK0CtQuGJyL29zP5zuhXv9Fk83Z5QchW8n6r
	zLj6Z6ud2y7K05ZWW9f1BPHV8Ov79L/dcJZ/sqEuaAM3Q0qIFp0iR8b3gqAIyMC9mHJVKj4lbPB
	lIuOxKmknIZz4JCAFdr6fsA==
X-Received: by 2002:a05:6000:310e:b0:3c3:5406:12b0 with SMTP id ffacd0b85a97d-3c5d53b40abmr247300f8f.30.1755806903652;
        Thu, 21 Aug 2025 13:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+53ePp4gOBoZK5+aLlST4uu6G3xHtHBUa0vmdrbtPfJ4bf44S3Zn2IpCr0m84pAneAOD81g==
X-Received: by 2002:a05:6000:310e:b0:3c3:5406:12b0 with SMTP id ffacd0b85a97d-3c5d53b40abmr247245f8f.30.1755806903113;
        Thu, 21 Aug 2025 13:08:23 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0771c1708sm13032145f8f.38.2025.08.21.13.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:22 -0700 (PDT)
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
Subject: [PATCH RFC 27/35] memstick: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:53 +0200
Message-ID: <20250821200701.1329277-28-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MnKvSzPSRGLQELBlasN9O7VJBsdWKRJslRoLFm77jDA_1755806904
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210827_669750_175264D8 
X-CRM114-Status: GOOD (  14.04  )
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
 drivers/memstick/host/jmb38x_ms.c | 3 +--
 drivers/memstick/host/tifm_ms.c   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
index cddddb3a5a27f..c5e71d39ffd51 100644
--- a/drivers/memstick/host/jmb38x_ms.c
+++ b/drivers/memstick/host/jmb38x_ms.c
@@ -317,8 +317,7 @@ static int jmb38x_ms_transfer_data(struct jmb38x_ms_host *host)
 		unsigned int p_off;
 
 		if (host->req->long_data) {
-			pg = nth_page(sg_page(&host->req->sg),
-				      off >> PAGE_SHIFT);
+			pg = sg_page(&host->req->sg) + off / PAGE_SIZE;
 			p_off = offset_in_page(off);
 			p_cnt = PAGE_SIZE - p_off;
 			p_cnt = min(p_cnt, length);
diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
index db7f3a088fb09..0d64184ca10a9 100644
--- a/drivers/memstick/host/tifm_ms.c
+++ b/drivers/memstick/host/tifm_ms.c
@@ -201,8 +201,7 @@ static unsigned int tifm_ms_transfer_data(struct tifm_ms *host)
 		unsigned int p_off;
 
 		if (host->req->long_data) {
-			pg = nth_page(sg_page(&host->req->sg),
-				      off >> PAGE_SHIFT);
+			pg = sg_page(&host->req->sg) + off / PAGE_SIZE;
 			p_off = offset_in_page(off);
 			p_cnt = PAGE_SIZE - p_off;
 			p_cnt = min(p_cnt, length);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
