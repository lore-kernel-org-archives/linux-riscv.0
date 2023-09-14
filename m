Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FFCEE0203
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcfS1sDC/z2rq4PufwZejG6En2jmDefIBXZ28GK+Was=; b=C6hw1UMtrMfadP
	gybzlmMw6/iPPWWC2Uu/U45sFQIQGLKh+X+AoWi7xM1epjc/CMqWwC2o4uN4PDrBubQUltE/Y/Cfn
	LEKHf9qaYgP4ah+PkKS+HCyMsX1mDmV8CjSn1ewN9ESTH7mu2H8QXgStzZ4rPYgOKZ0rDdGCtqNrF
	m6boWpKatJtP1t/7f06MFStY85NXBOV2WCfG70po0kNuMs8gt8BBANctFlnGpq96AnpylN4MmKHdR
	VomB/PoJc9gHM5mcc97Lb4Twm/PVLumq7QKC2aOtthsyzdDgu7Eg1Z8Dgl2oLfXFeT1szfmVzfMrC
	gYOkeXRiY+PAXDIBWM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbc9-0074uP-2s;
	Thu, 14 Sep 2023 01:57:53 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaO-00736x-36
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:09 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c31359832dso3884695ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656563; x=1695261363; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pjDK4myqRW/1aonXWMm2h3oZGIvtROhN9F/LidQar5g=;
        b=IQrX8IY1QTwqCI/e98lnFS22W33W9sWsqHWxD1Uj2fogp4X5shc8gw3PuYnyNm8uLf
         k/FuAm+up6BfNihjOlQpXyJV9GLwsVjrhMyvv7ujK3WkH28My/Np7L+DMCRvEGqGP9EG
         cJ0KI+79efRlW+W+VDTUleyXBjT6MEJ0temgCemSMgEfAHT7GpeQgrBqg5D3wJ6SeDIl
         V92rwPOGZKd7pPHQEQouEEC+Ip/DPfA0JpKBK97R3vb3CUQZJK5KN5F5UsjsgzD9mftX
         j86SJp22Tusqpw0cnPY0S1AwNSHA6pC9ifkASGxue18wQnFsVgNfBEZY4z765p9NxDvx
         6Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656563; x=1695261363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjDK4myqRW/1aonXWMm2h3oZGIvtROhN9F/LidQar5g=;
        b=jiL/k8CslgF1oD1yjpAIH4lX4x0e67ZKI0feokE4fqANv8MMjQQBtuPoMs5fxKS75D
         7JpzeJJCiNgsnSrvhecxWWPLdOcGwlTwe8yj3nvhoe6KQUyP6Vih9MTE+Hx97/xhH3ph
         8ZWmsfBSVKfC8CeyKyGJQDK+NGnQog/ef6CwYbWo798GjRATJOoEAMKys/maww2Xmhrz
         NnnSOrBwV/B7jeQdLRBU7yZgKa+UuShaYP1f3QaWLEs/GAX+qkWFWkhSOhp3cZEpNDyT
         GxLeOkdSJs6MLyLgENnAwjmH2JXls0DsFzJgo2s35G10Gc4LPe0Cn/kcmbCGpSuXxaNr
         gh+A==
X-Gm-Message-State: AOJu0YymBX3laKrhBcpksw/liCtBHqG1TTbNrGr61iy3HlTXwLInKvch
	hWOTBFgwoN/S6fmCeh6FJvTNQg6Edg4=
X-Google-Smtp-Source: AGHT+IGkqKKLF+YNvEneEdPalVclX+vMSg6CmJX8h6r/u0gfxt18eBEohuQohG5dATROkCqosWZykFZT8R8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:fa8b:b0:1ae:6895:cb96 with SMTP id
 lc11-20020a170902fa8b00b001ae6895cb96mr149990plb.5.1694656562630; Wed, 13 Sep
 2023 18:56:02 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:11 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-14-seanjc@google.com>
Subject: [RFC PATCH v12 13/33] security: Export security_inode_init_security_anon()
 for use by KVM
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
X-CRM114-CacheID: sfid-20230913_185605_032640_34025E2A 
X-CRM114-Status: UNSURE (   7.18  )
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

TODO: Throw this away, assuming KVM drops its dedicated file system.

Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 security/security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/security.c b/security/security.c
index 23b129d482a7..0024156f867a 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1693,6 +1693,7 @@ int security_inode_init_security_anon(struct inode *inode,
 	return call_int_hook(inode_init_security_anon, 0, inode, name,
 			     context_inode);
 }
+EXPORT_SYMBOL_GPL(security_inode_init_security_anon);
 
 #ifdef CONFIG_SECURITY_PATH
 /**
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
