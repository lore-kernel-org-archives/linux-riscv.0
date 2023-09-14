Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516B3EE0219
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kr7MBUVBurrMaehLMOM3yhPXjhSHbMcyW1IhT8PWiF4=; b=SsV77tEgRHEFA7
	xLcf0ZUISElQ+odY5smQpTOZND2Es4vgmhLx71td1uuBs+vz8L3zrFQ2b6Oj8TFcSY/xQtJnSLdVL
	XGbzQ64Hp9VqLSCTJ62dl5MGBnv8fCjGa9Rs5vQgHaJBca64v59Lxt4ghxq9goL6yjHX8wyc94Spf
	VeqQF3KSmSZcW8fT9M/AX/l8YP5o1qQeKngAKRMpw2uggZp0w726Yhg3T8uEaysA/fiWVSXzoXo6G
	lBmcncFwk7L1LEppTcLSJyuU3NWUaZ747pWel103+h0vb1eWC4L6l/dFsQJ/CDMzW51rBYlZiRkMA
	VLpZHa471w41F3anvLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbe4-0076xd-1W;
	Thu, 14 Sep 2023 01:59:52 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbat-0073eX-0y
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:39 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c0cfc2b995so3900315ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656592; x=1695261392; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Vjv0zC4RrtxbIkJLIAO5e3EhKuQZW28HjcF6ypERxIg=;
        b=f2Q7KwVZcA7ARUZvEkLPxe8q0wQM3AF8wyQ3E1DQlUE1u0z9j3Ls8POieQSSwCpmQ+
         /W0Zi11WsPtct6PwjrKgANcGbN77qE0SU1LS/uTmGEMtPp/0r4WFha5p//Quw/S1E6Ri
         KrOv7Yl/fuNE0VMFh/uGuQ7o/yJ79bv0ajYhqdQy3Be69Jb3CsDjR048JKV+5FTrcuOB
         dfT7pMGvpXKkZeUEdidq0D1yy2Dgu2nhueKyhLxTZh/sdVM0hDzGLVDnH5Kd5VtiZEa9
         HXQyKG5Oq5R7mdfRQ604b2LNIJL60+x7pDxaPEYUgMOw5SnKHvqtWWpYWzT8SYD6gDzG
         pjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656592; x=1695261392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vjv0zC4RrtxbIkJLIAO5e3EhKuQZW28HjcF6ypERxIg=;
        b=PVN2RQbzJLILxF+tcZ/46Fn0xxbbYi/KP41T5fzSEcMaV480k6PJE7MT2gV8aKu2jh
         bjroRs59Clr+0J6ibIa6dMAHKSEi7ZFjNZzMhAcy5zVytbB2n+dC4AdvrdG4PeBKq4fs
         RV7GJkINHcyNtVMM1+C33VRVJyVkcye+j1qhR8hBxYHkVu1h9DNkXqJ15SPMd9bYv4Gc
         lR/OAJENlC2qgaMPL6eaPHx0YF0ShmSuVrEa3uf6kdrQGNXYuTwsOEao1uGGQJTEgCS1
         EwBazb3qVaj5Du5O9RC1tk0PX8WE1IIPrPkU1LDb6zhtojCvU2b/c2QjS7k5jEgkTBXb
         ctLg==
X-Gm-Message-State: AOJu0YyQfTBIsG2RXA0JmD8cwwpUL2Ohi+udvLitAoMHLIeS9gX0IpNR
	9Z3mbNBD8hPNZCoLiQhQQk29ldtO3YA=
X-Google-Smtp-Source: AGHT+IH29SvaM4IJ2/NXJnaPAeFMS+fjtgLQL7Rq48UqpO83PYLOZng2qV6FMiS0c4sL4jzOiYmTHdNxdV0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e551:b0:1c3:a4f2:7c85 with SMTP id
 n17-20020a170902e55100b001c3a4f27c85mr212223plf.6.1694656591946; Wed, 13 Sep
 2023 18:56:31 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:26 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-29-seanjc@google.com>
Subject: [RFC PATCH v12 28/33] KVM: selftests: Add GUEST_SYNC[1-6] macros for
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
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_185635_453227_585A12EB 
X-CRM114-Status: UNSURE (   7.31  )
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
index 112bc1da732a..7cf40aba7add 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -54,6 +54,17 @@ int ucall_nr_pages_required(uint64_t page_size);
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
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
