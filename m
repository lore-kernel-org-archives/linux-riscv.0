Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC90C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crE4TNLU4wk7ANxtqh2jnT4oRlubbi6N0cRlV7A8r8w=; b=S4Jd79sP8bBKnQ
	bKMf2gKxGmp2K8HT7aUM2HgJ/X6tPKNLBDUckAhar7Ykyg12Itgomx069t52wvlif+KeJxomO508r
	iFL96ICzIT6RcidaAHkY1rCAAXrF2sE7vkQ2ka5asqgIeck0kPLxhntbYZsJPfRwIW0FPOw/zSgDA
	IdgKwtd+GnBxj9fA3YNfU+KJh2vA9dm2K5nOCnvRB2t6iVlmsFV2M5tacGjCT8T+eKb3W78+P/yVD
	j0LcqVkgsUS88p8Mn1TCFuKv0RHkOm/p6xkft8HlKydK4JW25LdskPNhtTyXuRJMlJLApZKi4JgNY
	ZztSUr1pRlDPL97N68WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4sJ-0000000Ex63-3psA;
	Tue, 07 Jul 2026 12:26:07 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4sH-0000000Ex4s-36uo
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 12:26:07 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-37df72c9984so3993050a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783427162; x=1784031962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed6PrIAg0FPe+WGfGcpcFPgwTg/czpiwdi1SgU6ZCUw=;
        b=MRc86E5DkQNyiUzNiB0Z+L9LaiBswyAqERGjspvAZtIVareal0Ubv5WECCHLrwX6qq
         nbxKf6U+xsPO5SUb6IpSLsb3Ao3Na373gNryIfSF/2xEtZcJIoTANsg03rDOVEvqV5Ot
         NBr9mx8l7cx8Vm7fh2ArUelldZuEfWoaj5D6L542DpzNFuRKzm+C2S+x8GQimIlCwkL7
         4VVkh/dpTgtZSW7udzMaxnDbTgDCLAuENUYEMAwbGjNWMxSM0GebRMFG2JulPpuHLbCC
         HiU9exIfxZHTLHaN+TcaGVZcL1LoDtnwCb6wsG2K35m314Fn7DQURfeVgdcInXS9E+re
         Xn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427162; x=1784031962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed6PrIAg0FPe+WGfGcpcFPgwTg/czpiwdi1SgU6ZCUw=;
        b=aBEJXRYWiypvtQOG8kRhkQmb2JuC6TsP4A3AO6kxnQ9JI1lVy465+RKT0sNTUxJkAQ
         Qrn7LMb1qM8m4rPJGgo+8HXUL5vod65wheDiM3rRo7i6Mhhx/2/GQVQJ4oDL31KnD9ru
         Sfil50XJnWe7wlmO0ACBiKYMYE+9oxk8QCK2xqO/2B/Ghm2sZysHO5z8+LDdtnu9UEzI
         XanULX1W/gsKDFnI442YDLOVSZLArzGCCfJHDs8anv1+ScEvV6gERkfkDBCeQSsrrZdy
         q7JqEAjgiGvxMtV5wpQIHlxtsukOztdPvd4smLMUXFbUBsVUfgEqunyX5UntGCZya6xx
         Z31w==
X-Forwarded-Encrypted: i=1; AHgh+RqRsWWSVeh3/MAz1HZFk9TKzaXQaIgtGoMYzRCI7T0rA/SpNZdTh5p8+VJp/hU+ObHyUY5L4Fg0+FJ1Bg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6rzg+GUZHQR7vgFfOTJ8ZTFjsZj1AVeDwKf88+036r+j/34Dl
	Td61rkqW0Wg033bCz0JpJ+T+9GddjgMgvSQh9cdI4MoTQLNwG9DUkNbq3TtK1CiAShVEDZmrjla
	ndKGEqdmE7Q==
X-Gm-Gg: AfdE7ckXInDPtBUl3iIdpa/1JOBiEA+4EsiT0t4Wip8xi8afr8lBrrKV54IEe0cl/aw
	PxO1EbVsX7ua4SIVwytGevN6f4vSz2hU/qItu8HTv16Z8eTsQA+9BYR4JFi7IfH2PBh7Cq6A5Of
	Ofz7b6Ra6z5b1kWFUfXTJO684tNdKZzKLsBQ202B1cGrUyydxZviV1xiglDaWATKJo98vMIB2yD
	bGNkjG5HBtJQaPT9hEHQXlegJT66O7jj+Dh+xBX6Ywn4e6iBwtEgXlyoOoz+ev6XeA/iSEZdOlz
	TT3URxqvDSb0ZRg24MyN5vO/PReIzT3dJ/02OQCpfHKH2sZ5j7IH+jcXJjNHQRUrb00pJUaYO+8
	mZLrCYTeBU/x68j72pZdFiyBJosnbrdsiTqyodbjtg3FbwVNJRbLPjSmauLAHaKue/5YFmScdS6
	OP/nWbntpFwRZnrnzqHOQGxVq0Gm5SLzHHyGAfQvlYxQ==
X-Received: by 2002:a17:90b:5845:b0:387:e0cb:7f7 with SMTP id 98e67ed59e1d1-387e0cb091bmr2435479a91.43.1783427162360;
        Tue, 07 Jul 2026 05:26:02 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d2585f34sm1028119a91.17.2026.07.07.05.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:26:02 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Inject instruction access fault on unmapped guest fetch
Date: Tue,  7 Jul 2026 20:25:48 +0800
Message-Id: <20260707122548.281685-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_052605_785172_0D87B5F0 
X-CRM114-Status: GOOD (  11.53  )
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

When an instruction guest-page-fault targets a GPA that is not backed by
any memslot, KVM has no MMIO emulation path for the fetch. Load and
store guest-page faults can be routed through MMIO emulation, but an
instruction fetch has no data payload or access size for userspace to
complete in the same way.

Treat this case as an architectural access fault in the guest. On bare
metal, fetching from an inaccessible physical address raises an
instruction access fault for the supervisor to handle through its trap
vector. Reflect EXC_INST_ACCESS back to the guest so the guest observes
the same class of exception rather than leaving the fetch as a
host-handled condition.

stval contains the virtual address of the portion of the instruction that
caused the fault, while sepc points to the beginning of the instruction.

Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/kvm/vcpu_exit.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..6c8530b9f29e 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -38,6 +38,25 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			return kvm_riscv_vcpu_mmio_store(vcpu, run,
 							 fault_addr,
 							 trap->htinst);
+		case EXC_INST_GUEST_PAGE_FAULT: {
+			/*
+			 * No memslot backs this GPA and an instruction fetch
+			 * cannot be emulated as MMIO. On bare metal a fetch
+			 * from an unbacked physical address raises an
+			 * instruction access fault, so reflect that back to
+			 * the guest.
+			 */
+			struct kvm_cpu_trap inst_trap = {
+				.sepc	= trap->sepc,
+				.scause	= EXC_INST_ACCESS,
+				.stval	= trap->stval,
+				.htval	= 0,
+				.htinst	= 0,
+			};
+
+			kvm_riscv_vcpu_trap_redirect(vcpu, &inst_trap);
+			return 1;
+		}
 		default:
 			return -EOPNOTSUPP;
 		};
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
