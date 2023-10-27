Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439FDC25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 20:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2TvdcjthF8s0HPpNPWH75kGeHGC9HFAo9393LL9pbE=; b=kn2guWlM87hokw
	ffidiKoXaD1Uxhc+Xlol2O8Gjacvqgo15+91lNWo/sCFso/8KSMkEN1Z4W/eA5gKJIAeHK+m14PeI
	58JrwrA96+0EZOkP0zwrPnbIF+O2ycrYM/FTqamONjO19cjXHUa/0pWtLnDVVEneHQDGywga2DA0m
	6EzgBtwfnneRJyj4KJ9rpc4eLEIXWk03I/et1atSS01CzYU4VcKYZSNpWcOLKOJU5/SwhZh916mjg
	bYKR5UqHE4Khof4dR1UDyxMULzuy7mtV1eeeLMYFPlJQymhD/wJ1bVEyo+bf7KIb8SUQcufzzAOVK
	sPI9+3Qa8Xy44koJPOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwTiO-00HBcl-0A;
	Fri, 27 Oct 2023 20:45:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUY-00GxjN-2O
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zYKW06Y9tS7nzBZmp5ooZeVm0pRKPQ996s+RZNHFHDA=; b=BPXwATci2sRaM+DH3SUlu26Gi9
	NE9Jq3vtX14ReMZy2En+qazr8HAUOZ/rK6EflUKrAYne6XCDq4/5h0EDyn75FdQbHstLlc7xglqLj
	q5kUfp3F3MfQ37v9D+4ixSeXukJPQpC7DfW8o5SzSZfAJ9urdsTS7S23kHdwMH5EMDjHS7QreB1Aj
	CeePy/ThIj2CUqtVm1BJEnUG1XkhAOkt9V1XIJOTOgvgHbuky370zXIwHXVlYf5VKeDo2SvH6pfpW
	OhASTWibuctahN3rlcKdhtcZUJEX48Ldfc5stwboxPXAC/4NOfrPuixI0mMHMDqw1/kyLGDYacFPl
	bwSfLz8A==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qwRUV-004tEY-7V
	for linux-riscv@lists.infradead.org; Fri, 27 Oct 2023 18:23:29 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7b9e83b70so22729527b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698431005; x=1699035805; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zYKW06Y9tS7nzBZmp5ooZeVm0pRKPQ996s+RZNHFHDA=;
        b=LD3gghbBol0yA7Ghq1IOuibTYQXk8In1OJ34aM186NI4be/byFJvFdoTRdjP+oFHyO
         R6vgLdL80XHt3xxeOI3LPC434X88MP58JVCelzBaxgKTxrEjFOnr8dAY5+SBZU0IBcBO
         Sb6J48ysjnR893nG5BGxAVNQDjMQWA9s46QtZqx/3loYyeadpy6dzHmUN0NPnIWcwSeX
         GvKgMpcW65JsWSWddJb7DXxinADOnhT2tyJ8o6rWb08DB3vcqd/LPuPP1es7+GC1A1Cn
         tLkjh+IEXUcUNRri+RgnVbPi506B7T1shM/8vGDBRN4z+cuD4/lhVOU3Bjx+7bT7lsvv
         8NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698431005; x=1699035805;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYKW06Y9tS7nzBZmp5ooZeVm0pRKPQ996s+RZNHFHDA=;
        b=jT8aY0/WjCHXbsiJZgJY9QJKdvwoUGlghKlgqnx8NXKD6bMPCbhcpR+Zjp+7g32Y+Q
         lYf8mdW2DqjhCvjx3MkfpNyQdh3ba8BklVyt5aN17oEcRZoARqKAdkzd5IYNYZt8FpMM
         hTQxPLN051jBiwGcu8lEplnb6mmzj6y9AaH8cMvI3JMcbZVun56sjuNp/eYMqeJpJsRw
         PwmOYyT3xOk7dafVtNY46p7xmCYTrp0qLd2ERq9Es/lHEyvaiq32faayMATWc/OlxDOK
         4m7wSwGv/yP6GTJ9TvtxSrIiBEhkl0AaGPgxx8ZwBPAIYLP+0DEqoPbqHtu5BTXc8CSE
         29Xw==
X-Gm-Message-State: AOJu0Yy+AhZMYAdgw9sZWt3E4bdz8Qf7tgt1D1Lwz0N3dXY9Fa1Nwri+
	mDlWykqPCB+vY/I4i5Cy7F8rsKKc780=
X-Google-Smtp-Source: AGHT+IErWdjWWNGtxZOL2jGOuLZz5+Zkhfhc0XQVVHxJSZZLCXWd4MbZY0rGLoG0iR2uIHcgyGOCoD0Mx1Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:ca0f:0:b0:59b:e663:23b0 with SMTP id
 m15-20020a0dca0f000000b0059be66323b0mr102891ywd.4.1698431004987; Fri, 27 Oct
 2023 11:23:24 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:12 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-31-seanjc@google.com>
Subject: [PATCH v13 30/35] KVM: selftests: Add GUEST_SYNC[1-6] macros for
 synchronizing more data
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192327_274209_076E651E 
X-CRM114-Status: UNSURE (   5.91  )
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

Add GUEST_SYNC[1-6]() so that tests can pass the maximum amount of
information supported via ucall(), without needing to resort to shared
memory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/ucall_common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index ce33d306c2cb..0fb472a5a058 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -52,6 +52,17 @@ int ucall_nr_pages_required(uint64_t page_size);
 #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
 				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
 #define GUEST_SYNC(stage)	ucall(UCALL_SYNC, 2, "hello", stage)
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
 #define GUEST_PRINTF(_fmt, _args...) ucall_fmt(UCALL_PRINTF, _fmt, ##_args)
 #define GUEST_DONE()		ucall(UCALL_DONE, 0)
 
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
