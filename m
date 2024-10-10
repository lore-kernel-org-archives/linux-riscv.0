Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE515D24447
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsEipXV+8pjn//yweeQfg+LyIyE5S7cyzt78IBnzrUw=; b=2sODuUrRB72Anu
	BIdSfQCA6yTF+Ly4Yow00qvmEFabh10KZBtU8t9NtVMbAb0UAy/cm49XmNuZdZ3QyqhEgmE9ECS9T
	d5gjMy4KMNbg7l7dFmfaE6mxO6H5CLPcZ/gej7TGu+aViR9Z3JwBdfbeJpLCi51d0kiPc9mnuqIwm
	iH9EM7ujpZlCAxoPCOZnVz9155/535hg2hzWv0z6DK2A8BethHKVijyKo17Vi+XhIlRd/uQy7sJsm
	KdDn7GAgVjH5ryjjk1bS34XuqlUFA+H+94LmyT1Q7e19Z91ThGxIFKvwMBwDW8xwNJB12MIMbcBTK
	bINXun86M68sfimUQDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syz7D-0000000EApr-208V;
	Thu, 10 Oct 2024 19:46:27 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxql-0000000Dpyc-2tQ4
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:25 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e2ca4fb175so1247623a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584722; x=1729189522; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RdgAxVyxp31c7WibHLiyIF43paER00mxZOAIHhsdwhk=;
        b=b7p6IY4ClkV+QsXomlwvoGqMh+SB8UDjT7mX9uoM5ZhyMGTHNoOTrGpBZfJp2lwLVX
         0x23jdq8biX8z0ZIidDU79yQDeDe6dBrdMgsah/xF71aJn4U5mr4VKqCbENkqredNlpT
         0tfmwqY+XQFrBOrUvncPhvTCE4/rbEy5HZJ/ggCCaLBScKOKMlUvJ3pQP7qNuXb3HndF
         Zsxc8oRV34Z1rzEDTCj2Q4Ps4jWYqYy79NUHweHrj8V03+aXAOEnxXwmcoZQhpeNOYhO
         B+38kYQySh0koQBeoNmkx1In/nwDJQ3xu5Ei0inEsydspQsXYJq9uOlExrXPKZG/AZXL
         dJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584722; x=1729189522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdgAxVyxp31c7WibHLiyIF43paER00mxZOAIHhsdwhk=;
        b=lAwVHfPHGJmwWI/hmrstIH9s9bMfi2a1Kcrx2ki1Blfn7QLSQYlQUTEc0t/Ih5jUsz
         u+qIDXAO9tFJOyedXEemh+EC5Zv1aFex8qJSikuR/gMoyytFPv6roJG8cJNCsUs7TTEq
         pUHEZxpJFjEaq7yaoShNNULdR0aAmtPb/KmU5mrfQDlAKJAYCK6+H9J9FWQXpIGn3h4x
         V5m0t4xT3F6wx9SuK4n8dikthZj3cqkDb6LJWogD/TUx/o+4ipiDBH6X3zz+3AVJJ+sR
         0ADe9qczGxZeac8QP3xeMZox5eETxIz3C7s3DeLKKEjwtiruSe6OBjXWV3FPceH3MX0M
         FNEA==
X-Forwarded-Encrypted: i=1; AJvYcCWCtKhypxV4jctZcjYlxRnGGJ5ZwA5NQ+0V0LPCmy5hHQcX/Rjd9Du/ERvoWOWD2tomRSZPTQgFNy01yA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yymjyk5pLu7KwUJx8y+LklfWRBjVAMSRlBpQwG1c8zuQX2PoVEv
	jp3lt8XW+scgKD4qNFFcLvtpdT1lBxrdaNuAHAl6tE/A/rgpz69wKq+h9wmz4zClKenmYoiZEF6
	img==
X-Google-Smtp-Source: AGHT+IH031wjBK6zBugJiyQwbgM1S3WkZumhuZG0/47H7WWzE24O4tbIqX0eqBdD0TzKWzHgCchY3qP4ics=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:9a94:b0:2e2:da81:40c1 with SMTP id
 98e67ed59e1d1-2e2f09f2280mr107a91.1.1728584720854; Thu, 10 Oct 2024 11:25:20
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:16 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-15-seanjc@google.com>
Subject: [PATCH v13 14/85] KVM: Return ERR_SIGPENDING from hva_to_pfn() if GUP
 returns -EGAIN
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112523_867271_DD0F460A 
X-CRM114-Status: UNSURE (   9.92  )
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

Treat an -EAGAIN return from GUP the same as -EINTR and immediately report
to the caller that a signal is pending.  GUP only returns -EAGAIN if
the _initial_ mmap_read_lock_killable() fails, which in turn onnly fails
if a signal is pending

Note, rwsem_down_read_slowpath() actually returns -EINTR, so GUP is really
just making life harder than it needs to be.  And the call to
mmap_read_lock_killable() in the retry path returns its -errno verbatim,
i.e. GUP (and thus KVM) is already handling locking failure this way, but
only some of the time.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 17acc75990a5..ebba5d22db2d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2946,7 +2946,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 				 writable, &pfn);
 	if (npages == 1)
 		return pfn;
-	if (npages == -EINTR)
+	if (npages == -EINTR || npages == -EAGAIN)
 		return KVM_PFN_ERR_SIGPENDING;
 
 	mmap_read_lock(current->mm);
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
