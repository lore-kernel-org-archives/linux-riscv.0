Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D5ACA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmwMo0yI4NkFyFK2mOKj7V6Q3msi6VOIJSQaISLbY8s=; b=a11eRp8Ipp18d1
	2V4e8wLqFCUmJO1HEaI1fXNNV0BWG/NDEAotwuW8kd9hbbJRVf0NPvOJKvKM48C5KlEQ7X07q2mGg
	DROty/hRNWG9PoVkiiWQmCvwcJZT5Tn5RxMM8AMnSwCeM5sT2fFhF4WkDCvlKVECUMPvGGTPLEw20
	Hd932mq0nNynZyaya/qF6JXEeouBJMT6JY3G1hjq1y6FkOvbAaHvRx8dzK+eQIMh8c/EZftf/I7iw
	wO6UD0+R8RjubaWDuTbGpXnFNQal8FyH16qaI1AZVNuAXG3fPjcpjP3lpCERStbHi2mZPEyjZpTtm
	xRzveQIsfQ0N5XgZ5f5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcZ-000000011Zu-2Uju;
	Fri, 22 Aug 2025 00:27:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZF-00000000NQL-0leQ
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOl+Pd7m6DQCTUATshUDhXjEbKNtUx8aQQ0CVjE/d9w=;
	b=hJBsxZ1oqBHQxt0Le0Bhv7aC7ES8ofEkvpknAG5yrjJEIhY4uLizGHxEsNvlwS/a/lpi4e
	dpbOi4fZQ+sO28whrk7tP1rrB3Wm37isRp8Y70vstDMm1qT9Ppbh8UJlCV9SduN/+Kawto
	VN4pEzTAFrN791a7Ni4EtjRIjlzN0mU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-HQQwdgVdNISraZyvILKx_Q-1; Thu, 21 Aug 2025 16:07:23 -0400
X-MC-Unique: HQQwdgVdNISraZyvILKx_Q-1
X-Mimecast-MFC-AGG-ID: HQQwdgVdNISraZyvILKx_Q_1755806842
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0b6466so9581295e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806842; x=1756411642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOl+Pd7m6DQCTUATshUDhXjEbKNtUx8aQQ0CVjE/d9w=;
        b=eXl/uKV7yudj2BdRLHU0MP+uv9k702ZVsbLRV7Ir0BBZxb8MsHeLi8ybIocfIJWytk
         2oEKvnFjRrCS6+ogBodK7VvgNU4JT0dB/YzGTD9tqivBH1nC0cjqSP4MWKrjCHC53/yy
         au6qHaXpJmn42CRsW+xZCmpRwIdU74U4OLbKhbBa4qCDMx0wz1K97Ustj6sCxgxyCZ+t
         4PoUmvkb0TTtZbxClqPMMz83L2JiLkqtyX+6yj0/uJiv/Ipu/9pg+BGpDrgFibmham3e
         3/HUzlLPpbknCTMBCxsWDcxzvxhjjlgDg2vS7Z/lqNjLECuM5IA0oMEnZsf0gs3a7rQZ
         Mr+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDL0a3j7EBop50m59rLBYPXymFBvVyV/NkDcgzWrS4TM6uKx5Piu2vmg/XHdiaYTXSyot80szVdnQXdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx4ojS95GRj/vq3c3essODx6CjXTH5qs0uXpTNl8Tb6evBqHHO
	6a9x85jwritltVWfKupVzw533w5Q5K4N+RoEicT78ciTYGo7E/7TaFuJb+4WPwtO6sK7eFE4CMk
	NZ8UT7mWs0aDDF4r0YUIG46x8rkxJNCIz48RHjw0ykgLBkM9Ub8gw3R72q4Khz/uY/b//SQ==
X-Gm-Gg: ASbGncstLMUHaEgNDs0a/CfNaogjGsDcbdUwiwgryQzukOyT88kdmWKPMPDMVAZ9KJj
	XyShbssqBdAPw814oWDzZCRJxLQNZdJmiMzhto7lSg2KJzXzeGq9uucVNpqeC9jYKyeXx3MpY47
	IOjz5kSFqhPKI6TYzMyIbosZ5RIR8OB3SB8gZb1g+fOJRBBaZHuA794cj5BiKk2Gb36fCPgQHr+
	lZD1MZhYbceCaQs5pNChvtEgIM8u8QXEtfH2SojmV0HrnmQx0m/GJFyuSr9saON7Rom6GSGJddI
	WSm+BQCvcdJDP3QS3x1pCwHxSyq3Y8zYsz2MrG8i/5u7pHAc8PFXpjKfD4HV6yXlPQKDHAipp4/
	WwTTUx3OeIITZ26YWsOE9zw==
X-Received: by 2002:a05:600c:1993:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-45b517ad4a9mr2412525e9.14.1755806841689;
        Thu, 21 Aug 2025 13:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtBnzBdejX2oNj8vG9iZBZKJew+pPrkGWxHzVnhFEnb5RkXIsj+cBFTtJrIXnzr/4lYhSU+w==
X-Received: by 2002:a05:600c:1993:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-45b517ad4a9mr2412295e9.14.1755806841198;
        Thu, 21 Aug 2025 13:07:21 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50dc00a8sm10960275e9.1.2025.08.21.13.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:20 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Shuah Khan <shuah@kernel.org>,
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
Subject: [PATCH RFC 05/35] wireguard: selftests: remove CONFIG_SPARSEMEM_VMEMMAP=y from qemu kernel config
Date: Thu, 21 Aug 2025 22:06:31 +0200
Message-ID: <20250821200701.1329277-6-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e9hgnvak8YlpKJUfQYOf50evq9NUJqLXeSGG4R39AQY_1755806842
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130725_291783_755D8050 
X-CRM114-Status: GOOD (  10.48  )
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

It's no longer user-selectable (and the default was already "y"), so
let's just drop it.

Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/wireguard/qemu/kernel.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index 0a5381717e9f4..1149289f4b30f 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -48,7 +48,6 @@ CONFIG_JUMP_LABEL=y
 CONFIG_FUTEX=y
 CONFIG_SHMEM=y
 CONFIG_SLUB=y
-CONFIG_SPARSEMEM_VMEMMAP=y
 CONFIG_SMP=y
 CONFIG_SCHED_SMT=y
 CONFIG_SCHED_MC=y
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
