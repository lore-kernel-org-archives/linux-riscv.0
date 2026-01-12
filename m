Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F104C9EC87
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nqAWByRYrS5p50VjmVdhzRHbljwV8TG2Y2HTJ8QV1I=; b=OFSGqFFOASpUEU
	DS7HlptqApDPxq/wYbG6ToHoyX02auPwyQOlmfUsWiXVRKfhpObPP/nTKQL3n6fwSQp4ztbE7I5UH
	U8nQFzelJuLLIEZLqUwsuzXmXkWvK6aL3CXgRpg7cZWgSJLOcAgui1aQncxNBrXxJBLGt70E6X9Yx
	YcenlNiJEfweh/C+BoKKmVGH8WGVRfJDKFUs1L09+BrkUJ8wddK06f3MpeS3cs6KE0fuPvo/Z6M3N
	5P4KLKYPoiwM4KUMI+/fj508aCZ9nEDaUcX+u1sSqTZEQ3gYeBUgko0OSX5bgcHqknLdm/Lifmkqa
	aE+VKbatxkf86kg4BtUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHRh-00000005M9n-0Bl0;
	Mon, 12 Jan 2026 12:54:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHRe-00000005M8S-1ONp
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 12:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pTWpsZNjWgj8wv5f92UAOMouEbb8hc3HuMURULyk40=;
	b=ViTfrk0HAhnH07oHCc4xzv8lL6cMG/wvIhI5nhw8dLHFVlk8Ucec3MqSSVSI+NZeDUrlHd
	4YnOnbbXbU303QaOWm6Umhyeko+bvO20UiIwcaKjiBYT2ViOVQN1OcdvyVbl+o+xDBLvIM
	ccOxU4L/Cx3T700kHngAlrKjJOFtS5k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-A-UVhCLVOl-t7VAoNKNYKg-1; Mon, 12 Jan 2026 07:54:50 -0500
X-MC-Unique: A-UVhCLVOl-t7VAoNKNYKg-1
X-Mimecast-MFC-AGG-ID: A-UVhCLVOl-t7VAoNKNYKg_1768222489
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8012456296so596391566b.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 04:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222489; x=1768827289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2pTWpsZNjWgj8wv5f92UAOMouEbb8hc3HuMURULyk40=;
        b=pcSHwdFIBtfQ+vs+zVvBeJjkWhGXAD4cRtyrBw6WnO3sr2heedhx87FuqSe6adVWne
         UkMbxltZ2X36Tv0WlZgcJCqy1o5t/X0tO67Qs1p0Fk/QPItwZq+OiKR/htx+cEm1Qaoq
         vIbm8jIA8yA7SqfgyBZe2edktfkX7J3nd8Syz5nXXA4PjnMy1RsIkqTwXTDcUST6WeXe
         wtieOC6Xbl7R8pCRi6Q8WEulICzfnOALlRCghsJi+ekpMAY7fCOzRtxYCSomrDpmkpG+
         nxIyrf0YepyExz1b2KG9a5Tdcx7qS0HyfcY8fFVya+GJFjiaWfA5/BakjHbbHIdQzl8o
         7pOA==
X-Forwarded-Encrypted: i=1; AJvYcCURg3+lbc2iMTuBWw1FtgUsxH4r8xdDT93Op6/pKvLG7d21QV7SBG3eHthl3lfpicxmPXrHqu4YoCvs7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3xabIIxZSoEPt3nr+l7vcOZZIMIhmaIoSP3y2giHkkpu3ijjb
	SaRYO20eRiXZcjp/Z4mrTX8TxyBbIEumk9yIPibwwq3yJKfF0q2IDjsKd4ltxogl4Atds76YoZz
	aCg1HhFQ9ZDxzU0Kinxv6BXLDfnQopbWip9bXE6czsMzJwplb+l63w0VQqwZQlbS5lr94/Q==
X-Gm-Gg: AY/fxX66UV8sgsNG+8A0Vm/sekqLW6Kggib82/DMZLmfr07ghGkonOjK+2HQTasUfwG
	D6m+7zqQVxP4OVEHw59Uej7PhKPRpvm1UlIBe+d4NkgvO6F1wCwwwtMYgheN90WufQbRFqzwjnu
	5gopKIjQzyQuCp2KeuND0fZROSiQVVL4nuRU4x6n5Cjf5TZcgdFNl9jygx/aqXQH32oHmBLToP2
	i4BtLD8bBdYU3pYN3MVND+hvbOp5+4u6avvx61eA0a58XF/3ZlzGKZzrblu7RS30iAFFOWfcXK1
	YEafzUv+3Qytll8ZJG7Sko3qWpvd0VNdMy4ueNAzTj34rwXeMfQAiizCvHQoNUDSYJ2XBFVjeSv
	wuLDCDYSZ/igX/SZoE0GvAyVee2NK91aYvIADvmSJQVxXdmrSHRxlXyCJuC8=
X-Received: by 2002:a17:907:a0e:b0:b80:34e8:5eb with SMTP id a640c23a62f3a-b844542221cmr1612467466b.55.1768222489052;
        Mon, 12 Jan 2026 04:54:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7t8/HlV/5AlKScEccxcE3fk05AaGQ3PxxJdFkixgC3oQPqTZ4vVB050U3KXnraou/3iD9lw==
X-Received: by 2002:a17:907:a0e:b0:b80:34e8:5eb with SMTP id a640c23a62f3a-b844542221cmr1612464966b.55.1768222488577;
        Mon, 12 Jan 2026 04:54:48 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:48 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-s390@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [RFC PATCH 2/5] selftests: net: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
Date: Mon, 12 Jan 2026 13:54:28 +0100
Message-ID: <20260112125432.61218-3-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
References: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g36PKhT56Or9rnWOmpMXG2DY_I5x3Cqy2smRZPjz6nw_1768222489
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_045454_445417_C7A01783 
X-CRM114-Status: GOOD (  12.80  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config options NF_LOG_{ARP,IPV4,IPV6} are deprecated and they only
exist to ensure that older kernel configurations would enable the
replacement config option NF_LOG_SYSLOG. To step towards eventually
removing the definitions of these deprecated config options from the kernel
tree, update the selftests net kernel configuration to set NF_LOG_SYSLOG
and drop the deprecated config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 tools/testing/selftests/net/netfilter/config | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/config b/tools/testing/selftests/net/netfilter/config
index 12ce61fa15a8..f7b1f1299ff0 100644
--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -64,8 +64,7 @@ CONFIG_NF_CT_NETLINK=m
 CONFIG_NF_CT_PROTO_SCTP=y
 CONFIG_NF_FLOW_TABLE=m
 CONFIG_NF_FLOW_TABLE_INET=m
-CONFIG_NF_LOG_IPV4=m
-CONFIG_NF_LOG_IPV6=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_NAT=m
 CONFIG_NF_NAT_MASQUERADE=y
 CONFIG_NF_NAT_REDIRECT=y
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
