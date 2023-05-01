Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86103C7EE26
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 19:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeoiCRKXdLKelBb6f0ui8W0MkQjJTXDcYPfe532+1Mw=; b=H1M1XJtTicVq3z
	gJiakE39ziYoKbnZD//tjrgKEohh29/VVbjB8AjrtZdXrN6LwdsYyeaaDPPoid09KNVl2399eye4X
	CLnJ4D/Iz2r1wqrs3nuEzFvnme2NYTTEWOYG5B+PPqENTFAMLzUxY1ZgtcBLSp2JYp1Aq4Wk2XVdX
	U4o2sXEL64PG6JY5D5ZBMIKRL4g8PcDwTRnDLCanIhIuGJfGOWrsTBlM10QapaDcuUQRS0cEIZH3B
	n4atx+uuCE+Io1vqbTxslyS9bXBs2qYLoNOiJxflegwpqBJnQ3+wXiMVhHZrx79j0jL0W0lAF4aaf
	vHAGYmDy8fcaDcss5EXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZCR-00Gh33-2t;
	Mon, 01 May 2023 19:28:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZCO-00Gh0p-2K;
	Mon, 01 May 2023 19:28:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso2020254b3a.0;
        Mon, 01 May 2023 12:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969316; x=1685561316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i6mX6BOTgb2TGO86QCloW3rCrq78sBOKu0dxXwRHVs=;
        b=pYnEspIgQ/94L4B7QgE7HxUaLyMe6HQnu5gVv7XKe7wrHmtTwaLadWDte57s2SBwdQ
         8bePLJ5Ai3/AmYhH4RiAfK8IjGb+8BxlohLn4+W6ycJ9Pg3WMvHLkkZOviW7YYTD/mmK
         GtZnk734H4mZvUq9Iut38ZejJnfrw2oYgWeCZ6PRbVlgoGyBpRA67FKhICj+7yH7j8HF
         a3LIP2IDGGOTftrbrsZRq8EQiQ5R1WymqweCw9yu0t92fclq88jf6kqwtf3FextynpJY
         IncHO/7Qw6ErlKR7f7HeTzuXXgCmLczBJBgXHLIbesev1rm2mkGmxXqiRqgTqpx3oce1
         ZBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969316; x=1685561316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i6mX6BOTgb2TGO86QCloW3rCrq78sBOKu0dxXwRHVs=;
        b=kAiEqZqTmN2j4vmfXrp8RBaSnXDyK8zZfRzDfNcK/Re/vsceSVmfzVB9jSVfkuo0la
         8MlVIDbbkjH7CINJQt8AGq6aMdmU9JXGKVAYlWQyhGbm4fbnB1C7jIeGyATjPciJ9SXb
         cCVOrIDhF4CYo5Ar/eCr4bIpNBa4AT83TmE5jQwHmbIU3+X/AXBfskStXPntFIBl4smg
         u8BWtf1e/kYHapHNx5lj2Zz3GxAGrESlMroy4ePuIn1N7lD0DeoPoXibJKrEyQ4lO4Sw
         1gAc8Ju6XIaIBECs5E6j9rAibBXHErXDeCchTe6ABfmjrsa1gbUgDrfHmvx3nzCReghs
         DsvA==
X-Gm-Message-State: AC+VfDzKxlbiV86NeDY/T56abNNyj5fFSw50Y8zsrGm4cvwcVL2oCLuE
	PZQIKzYZ+n1krw79un8sOsk=
X-Google-Smtp-Source: ACHHUZ4H6i4St7ld1wD0WuHlGapRQhff/8tSAzzBd7XutE+/MiRiNA1zmkp/wHjGquMcgELZnMsxdQ==
X-Received: by 2002:a17:903:1c3:b0:1a9:80a0:47dc with SMTP id e3-20020a17090301c300b001a980a047dcmr15039374plh.3.1682969315645;
        Mon, 01 May 2023 12:28:35 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:35 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
Date: Mon,  1 May 2023 12:27:56 -0700
Message-Id: <20230501192829.17086-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_122836_764202_B26E5909 
X-CRM114-Status: GOOD (  10.64  )
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

No folio equivalents for page type operations have been defined, so
define them for later folio conversions.

Also changes the Page##uname macros to take in const struct page* since
we only read the memory here.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/page-flags.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 1c68d67b832f..607b495d1b57 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -902,6 +902,8 @@ static inline bool is_page_hwpoison(struct page *page)
 
 #define PageType(page, flag)						\
 	((page->page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
+#define folio_test_type(folio, flag)					\
+	((folio->page.page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
 
 static inline int page_type_has_type(unsigned int page_type)
 {
@@ -914,20 +916,34 @@ static inline int page_has_type(struct page *page)
 }
 
 #define PAGE_TYPE_OPS(uname, lname)					\
-static __always_inline int Page##uname(struct page *page)		\
+static __always_inline int Page##uname(const struct page *page)		\
 {									\
 	return PageType(page, PG_##lname);				\
 }									\
+static __always_inline int folio_test_##lname(const struct folio *folio)\
+{									\
+	return folio_test_type(folio, PG_##lname);			\
+}									\
 static __always_inline void __SetPage##uname(struct page *page)		\
 {									\
 	VM_BUG_ON_PAGE(!PageType(page, 0), page);			\
 	page->page_type &= ~PG_##lname;					\
 }									\
+static __always_inline void __folio_set_##lname(struct folio *folio)	\
+{									\
+	VM_BUG_ON_FOLIO(!folio_test_type(folio, 0), folio);		\
+	folio->page.page_type &= ~PG_##lname;				\
+}									\
 static __always_inline void __ClearPage##uname(struct page *page)	\
 {									\
 	VM_BUG_ON_PAGE(!Page##uname(page), page);			\
 	page->page_type |= PG_##lname;					\
-}
+}									\
+static __always_inline void __folio_clear_##lname(struct folio *folio)	\
+{									\
+	VM_BUG_ON_FOLIO(!folio_test_##lname(folio), folio);		\
+	folio->page.page_type |= PG_##lname;				\
+}									\
 
 /*
  * PageBuddy() indicates that the page is free and in the buddy system
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
