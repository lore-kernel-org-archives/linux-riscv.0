Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61F1CA0FE2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnL5gGcH+DUd1SqMkLnpjiY+pK5OSOxJqzSeCN7BqQU=; b=YBigB0DsmREQFO
	03ycRkj3s6LI+fTfAB/BlUlNT6ksIiA23L3hFDi/lHtjlTPWK4knTumEWuodzIMWuu1whBuG3FfYQ
	3c4whGcxCdVs4u1jijWfw0UwYjXXueicPiHD3E6KecSdF4p80yZgQMj9dkn70IGJxrU31/NPFJ6yX
	XQC8lgmEbci0DQVP9UhUinKyIWuiFtA48w+ODpr3aBmyMbRMaK2p3lJG6NDZQyhRgiKxZkXqlVG1S
	OFFZepnRWHfI0xTY05gISC1aCO2hc+TSOaToYsWEuMIIJBHnGGP0t8/fEQEvfQ3wCgg8xne8nPKh9
	gpwCgaOox5hgCYGbK7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcb-000000011cV-3xg4;
	Fri, 22 Aug 2025 00:27:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZj-00000000Nih-0Kr0
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCvnB/7xI7T/4p4mwWx/D4+W6s//h9G2+oSyfbDOFZs=;
	b=gw13t9nDpGG3U2GGHMcx/2sRRR9KRkg1799gYSbpZQy4XI+pCFyIp7adDzu0khQO8BlEpD
	lsze6by2yDpulNWR+PJFam3a3xB1nScMtY6y+/YUHGdU/1aG7lVsqZTdUdI9gZXt0cQ3+e
	lab+ur2ji94m2LOBF2zm59gUmk9HE54=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-fH1wo1a7NwyYYvk-OceBlg-1; Thu, 21 Aug 2025 16:07:52 -0400
X-MC-Unique: fH1wo1a7NwyYYvk-OceBlg-1
X-Mimecast-MFC-AGG-ID: fH1wo1a7NwyYYvk-OceBlg_1755806872
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b05b15eso10519425e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806871; x=1756411671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCvnB/7xI7T/4p4mwWx/D4+W6s//h9G2+oSyfbDOFZs=;
        b=p2LdBblAcQEswlzrIUPH1wMn6R2tBGlL13Mw7iFr+nMtlEgCbi131toVv/8jkqqx96
         Okun/jj1Y+JHO4sWgfMYH0AxFNXiKg9pHtNH+wpyyAaAJf1NVS1BHxPFfSF0bvp6KIEP
         PRlIJNk4iFHceu9tHa3t5HddB4pwdente5G8lhTOj55FmTzrMmtBprCowjXRUGQGTHIk
         ESzPX1PKjKeswwo4uKu1VSqOoassR77rg+T0ffiLQQrSdeQXvqaa6yN7rfagiMGALYTB
         WJwhWag8oIDn0z/uGQynRiFgDrko7hc6BGOg85Rn/9dzkeFgSoWd42sA4ODsst/WDe9C
         SoaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMlPknStnz/yWgl0JNaT6BNossBlnP4usGNACTJZd7RbsPsKVSdUiKP3cA0dxkutzEf/3+NCq/19xZpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQXcqsZX0p8VhcDzJ8fxrjF4epYdkYjpf2cIzCG3qU2deBds31
	Iuh0/meKXLObrxTk9IjYR0NAmTBDNF5MNQVT1TDWf+dHgD8KJ8tYIj1je5fVfASvHZ0QVMA21uv
	6+Rn3dnB/MtlsO8SXFPseOhiXca4nvM0ozuNZikdmxu/dPvhnhRFDRL3QhFzhmo8H5sLouw==
X-Gm-Gg: ASbGncsfMnXYGUwKSm0POOj9DuQ8952NQUB2UDxmZcHQwE6MqD7SYZWz7y294QnWp11
	s6Xj1n3hLnYwl+VP8yCrHH08IoNKZepP3DQAV16/DVl5M2TUY9eeJCgtgBn28VjydEp406Yz2cX
	pxsHDil4mXf8hmyFedZS9mMZayFlAznJx4qBzpVPWL580D9XH3n9yv7PEj1VbeyXnhu1NgGKQ+6
	spvInXmTUph8jZ18DejuwvJVnOvVG7L4+DI4S1Oo/SspDfiYnWSwZgnVtvJXT4pRvgP1C6K6J7e
	tcVGiRh2WGtyZKx066stbCLE2at1QUfTQ8K5yHyvYvBkr4PUXKH1Yw9xqTThMuXvOfgwJBQn99v
	+maA5aWXfqwFPiPtMgbaQgA==
X-Received: by 2002:a05:600c:1d07:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-45b5179e897mr2278765e9.10.1755806871564;
        Thu, 21 Aug 2025 13:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQe1GSIQC6LfutgynQLrqB1o4Jo0GTrBjlhxRWjM7nqTD8l8oEo1HOcPxtIuVQVn3tsHm8QA==
X-Received: by 2002:a05:600c:1d07:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-45b5179e897mr2278575e9.10.1755806871147;
        Thu, 21 Aug 2025 13:07:51 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4e1d77e0sm22159155e9.0.2025.08.21.13.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:50 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
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
Subject: [PATCH RFC 16/35] mm/pagewalk: drop nth_page() usage within folio in folio_walk_start()
Date: Thu, 21 Aug 2025 22:06:42 +0200
Message-ID: <20250821200701.1329277-17-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bFosnWYX2l1Wf8DaDkJkp1kL1OBVMOoAUUVzXf_i4ws_1755806872
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130755_197757_8E5E0C12 
X-CRM114-Status: GOOD (  12.85  )
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

It's no longer required to use nth_page() within a folio, so let's just
drop the nth_page() in folio_walk_start().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/pagewalk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index c6753d370ff4e..9e4225e5fcf5c 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -1004,7 +1004,7 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 found:
 	if (expose_page)
 		/* Note: Offset from the mapped page, not the folio start. */
-		fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
+		fw->page = page + ((addr & (entry_size - 1)) >> PAGE_SHIFT);
 	else
 		fw->page = NULL;
 	fw->ptl = ptl;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
