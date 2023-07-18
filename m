Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA020C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRQvZTSjq9TfoYjEUQrQhDSfq6/lsJbsw4VPJ/ZhoDc=; b=IsCIn+glWUTZf2
	fv+tivj+0D+Dk5Cx2NEnAOLJRG8ovyUhnhG/PMoZd4zV6rEAl1nnCziuYtKVQwCu32RDkOFzEZ5Pg
	/XfpAnGFUi3Tw+HVyJyLb6GyP454OYEmlFTVzjlLYQ+WYT4fly/RNqCTDud9ACGz/AtnIs7mcH5ZE
	2bRVULXqgqDbS/DR1DcxQp+jyH0hC8u/v6aSGA18IvUbfLgcXFLI/Hpf4MDWGcrepi4aUggp6vGOl
	s4BtgEGE1e3PxM7yQi145y7GHJgqbabReD/CryvsKeHYb2tjUXtOgPFIKF6K4YrY3jMHEg0LJzNdP
	e10w28w5lF2aHu4TDLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzcH-005EU4-0Z;
	Wed, 19 Jul 2023 05:20:49 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbO-005Dg5-2Z
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AUBNLiIlxTx1F6mRQya+iPZZUvsAoMeHoSeivXTBAJs=; b=Av+7EMVOPYo1+yUP8BCz2fbvRj
	VVATsXgkjPes1bs2DUQY70WOe5VSJLdV350CxhbZFYIWS4wHbtRRXXtoBh1cLVy1vn+9naajzQWdK
	fmnZlIDxrJYzKVD5p10/qs5A30Vi5CM33+2a5eQave8mEQCrySYS12I6Qdi5jIYO56uxhuZKmVh2X
	b1m6uzVyzK5LuP5otEzFuaWH0kjis/GrhMN8jUJ1pbMF9g1mp7p9AAsD127W6rB2lAOhLBN00vCs9
	/E+ITcoQeW+994tEPW1CFT/TB+MKBCRhl2RVJ5UQs01tpUpwwVsDzEk6OhuAcRvFu6XCZSIFYIyS8
	01paUgqQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuST-005Qv8-GJ
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:50:24 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b8a7734734so32266655ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724158; x=1692316158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AUBNLiIlxTx1F6mRQya+iPZZUvsAoMeHoSeivXTBAJs=;
        b=m1E5CQsRhxPohHIaVjXNzAfw9sKja8GxErI8tb88+m9ohtM/2UTUV4KI0EStxpO4aq
         e3MZZP48Hes3EH+ziFJ16ESLBaMphjB9wBUbLKvQFLpYn2bcEMb9Uv2TfKXvMSlsG4ax
         +5bc2E2M24iRgByLib+vhoObgGZN9pfMuLHGBIbrmouSiZYtP7I+o1+DUjs0jJquORQM
         WZA9ZhPgQfZ0ViRdW+5zM3kLeIAxBI958QaGMn+cpDeKcYSO3MEZRWesl52iNilZN/Ay
         f7w1zt9jHHbnKZaxjQB9PYpmQD1oIBOzEUWtcHD4Ui+04jNinOeJzuhQDL4PbgsMw1sC
         a+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724158; x=1692316158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUBNLiIlxTx1F6mRQya+iPZZUvsAoMeHoSeivXTBAJs=;
        b=YL5tcPRWSzVub8l12t35S270BALFoTjUGeL41ynY+mG0Hcej1WdVvXt4uWiKYYJqyw
         N+rnC5Y5XKz/D+l7kHhUqNOSxBTWqW7HEwIMYBWWWgb1ldk82VNuATUymO8s/UC9m6M9
         2jfLX+PtDKxS/K4qg6VpTvDdhtHg+9Zhz1LMNHrfegJXWA2RA3xcgWEw6egYCQislNu+
         9ie8/XwdEQorK+vjbVNi3xZzNVfPuLJLQi2jtsv/StVD3VPoLZfECAWleSqpu+B6AOrH
         K2tqsXx1zDpXUofgC5gqTevGm8zGcDmubNZNVfhH02IXTOc7LlFiT7sAn0NlZbuBmrDS
         r0VA==
X-Gm-Message-State: ABy/qLZWUh/wWi+ukSNrj6aEZZuo6QGLgXwZ9z0XHrkWUl5NKiKzX4GL
	TU1Fw9JUhoJ0bsI1XB1MZcOKNzab8kg=
X-Google-Smtp-Source: APBJJlGZj18kUtv2DZbfIQmZu2TXCF9UTMkYGVm3bO/BF1sxl/m3e0941s7v3QsOSVZsOvdKY/T33+qfBEc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d4c6:b0:1b1:7336:2637 with SMTP id
 o6-20020a170902d4c600b001b173362637mr16836plg.11.1689724157723; Tue, 18 Jul
 2023 16:49:17 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:07 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-25-seanjc@google.com>
Subject: [RFC PATCH v11 24/29] KVM: selftests: Add GUEST_SYNC[1-6] macros for
 synchronizing more data
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005021_566660_1EA57BEA 
X-CRM114-Status: UNSURE (   5.48  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/ucall_common.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index 1a6aaef5ccae..8087c877fd58 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -46,6 +46,18 @@ void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa);
 #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
 				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
 #define GUEST_SYNC(stage)	ucall(UCALL_SYNC, 2, "hello", stage)
+
+#define GUEST_SYNC1(arg0)	ucall(UCALL_SYNC, 1, arg0)
+#define GUEST_SYNC2(arg0, arg1)	ucall(UCALL_SYNC, 2, arg0, arg1)
+#define GUEST_SYNC3(arg0, arg1, arg2) \
+				ucall(UCALL_SYNC, 3, arg0, arg1, arg2)
+#define GUEST_SYNC4(arg0, arg1, arg2, arg3) \
+				ucall(UCALL_SYNC, 4, arg0, arg1, arg2, arg3)
+#define GUEST_SYNC5(arg0, arg1, arg2, arg3, arg4) \
+				ucall(UCALL_SYNC, 5, arg0, arg1, arg2, arg3, arg4)
+#define GUEST_SYNC6(arg0, arg1, arg2, arg3, arg4, arg5) \
+				ucall(UCALL_SYNC, 6, arg0, arg1, arg2, arg3, arg4, arg5)
+
 #define GUEST_DONE()		ucall(UCALL_DONE, 0)
 
 enum guest_assert_builtin_args {
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
