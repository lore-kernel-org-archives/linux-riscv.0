Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B136DC25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDvWNM6tly3aUo8yJVVGb3NsHBNT7Vo/M7psoMI128g=; b=ha+3FGh2zEl/UB
	nLWl+SK00v0upUTrBichvI8YvxoE2nlmdbXZixrWgYKJY6x5YWatFK1uJ+yOImeicq6wKWGx01P4B
	LntU9yqjpYPj6NmcNy/E8HWlWxieIu43xJIbPfXTgcUtigzWSWTE6FxdKJtY1veChg7FfzkehGmr7
	dyYZobF+NKVMQCUyIg7t0jt3xb3UfwHDO0+79qkPDkeFsQSpc3InxNfljzPhgUkSwNlzmJOJSEIvS
	4PIIfmJ+IQrHqO2SaibDgl4Lz6YCY/0gWDrRWN0hvF5gxmwgSLBKnoh6SwuuF+52c+yPyVFIFOA4u
	nZxBH8MKDrdB6BWtwnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSYM-00H5ny-21;
	Fri, 27 Oct 2023 19:31:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUD-00GxOz-2x
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pX02ozc7lSRzYa356XIJ+CMNCgv5fZ3NEfG1CClMU1M=; b=I/9Z2mAHKTE47STLrpKUmM096R
	uPnto3P/n0GkMaGe4MNieMhe2efRaV8h0WtVDdWVN6fvqIupft6abeRI3ctm6s4vjlNTh15sTNf7S
	d6s1r1gTlKs1Ae4VaDTFsDe6ke4mZk1uXwEh3KHmeMZ0ruZIfG1+QdYyFdrMMgp05nYj58nBIhqA8
	kuNGpd8V87w0qj2FACGV5w157NwpLZEKUm/ZljQEje6yxGO4kd7VbfyeQfmSIfjKUthVIcAz7iM4J
	kL7meidCnbJIvo3frlUHgOetdlusMS3DqxIO2hrG9FF1XLbLsMsE3evMGOqNP1AY6pql0OVtdK6dB
	Uq/NHbbw==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRU9-000ub6-2V
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:23:08 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5b62a669d61so2045608a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430975; x=1699035775; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pX02ozc7lSRzYa356XIJ+CMNCgv5fZ3NEfG1CClMU1M=;
        b=LzR9YpKaE+2d3zb2Z3+VHuOimzdlBmEBX+oJ64WvtqEXX2T59U46NPaq+t3rE4z/6C
         qvW7QA9Yt+fkuj5XbW9EQMOSLgEhh/avBm9eDjQvg4TIvg5O1JoUP/jbsFscey06kfQh
         WRXjCyp654seIXjAWaLUn4YzvpKIxBNDeVEp6XurIKB/rOzUZ1tmHQURRq57mMoMoVlD
         guU/liOmRi/JvnhjlTcqu+nqvs/82HmoC0/pJJ/rWCG/uf+wlrKxZPQMvBVrDqpgROzC
         GKJfZUjdAVygjSd1iQoOadn7Wx04SiYyk1jjVgpRO8QIy5gI+9Tzkfr2d7wsa4Ngyepb
         86xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430975; x=1699035775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX02ozc7lSRzYa356XIJ+CMNCgv5fZ3NEfG1CClMU1M=;
        b=PAjSJ4uHolsoKCjBYo1t59RQnsehuAY+BmR4PqQbVAkvWuyEipc2eRcl6CZHk6KQ0w
         l7D9f0mLxjHDAa+nqz08AVuqukz2f4fpVOmGCPxtbFysoSUJOmYedi9Stc54FfARWn+k
         cO/bh+0rHM8OtBGMsDLj3/iqoKhuSwqwgFWfPL2XObwyVxXe/ibJ1Xwx6/3ldc1QSktL
         DBZZ9tCMfA43MjDA5DM+jvNxHMkr/cuZkt2sfafaLHvH3RgEvnepTyCZDM5vsTa1XAGD
         KgEG3/5HdY+U6eujOL+2cQ5gM4wkrKUBytvrmXZ+k+8U7dPnpP5sHsyYq1JP11Mrg/Zz
         6LTw==
X-Gm-Message-State: AOJu0YxwrXIGNP4rqcwJ4W16Q8mUMbVv7331BFHAWQwrPqkt91Wls+Va
	PjxAA9stD8zW++KQUS8bJhNGGg8G2D4=
X-Google-Smtp-Source: AGHT+IEZ2DkPV4b8zDYsItSE8S6PNMt34EGJVQ4YpOaZs5hBhRUHv0wBQpomiC7JG41zMwbv7hAHGw5rsZI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f7d6:b0:1cc:23d2:bb94 with SMTP id
 h22-20020a170902f7d600b001cc23d2bb94mr38516plw.1.1698430975510; Fri, 27 Oct
 2023 11:22:55 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:57 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-16-seanjc@google.com>
Subject: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use by KVM
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
X-CRM114-CacheID: sfid-20231027_192305_953384_8AAA857D 
X-CRM114-Status: UNSURE (   9.36  )
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

Export anon_inode_getfile_secure() so that it can be used by KVM to create
and manage file-based guest memory without need a fullblow filesystem.
The "standard" anon_inode_getfd() doesn't work for KVM's use case as KVM
needs a unique inode for each file, e.g. to be able to independently
manage the size and lifecycle of a given file.

Note, KVM doesn't need a "secure" version, just unique inodes, i.e. ignore
the name.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 fs/anon_inodes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index 24192a7667ed..4190336180ee 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -176,6 +176,7 @@ struct file *anon_inode_getfile_secure(const char *name,
 	return __anon_inode_getfile(name, fops, priv, flags,
 				    context_inode, true);
 }
+EXPORT_SYMBOL_GPL(anon_inode_getfile_secure);
 
 static int __anon_inode_getfd(const char *name,
 			      const struct file_operations *fops,
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
