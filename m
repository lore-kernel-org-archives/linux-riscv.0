Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E449C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 04:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kw7/VzyFQ10DRAwJ/a9PZEydJjSvSPEYLnNV39SgG2U=; b=z+o/9U6Dw6b+bI
	GZ1tffnQV2uxIBDS9WZxVjy8WnKVhE8SfeVf6TbWgWSYcrf+ZgyriNBXd5f3H9SrfxlO00pp/+9lp
	ExwIrQ4Z8z9OADYnBKG3CuLdbLXW4CtMsqgPag2UXkm/jaVM6oJSi4p2+eLbS9hQ0AtVpCk6lK8MI
	xEMVdngK2eTdnU2x78ib3rg1xazo2GaWB7s3yu47ZOE+7zA0nqkHc0TagfNhYPR4VYxnpmcCmbJVf
	bAqsUbjyvvQ+4E3xdBHtkKeYXe5rTB1A32sozFCc0uXoAvvcrpD+J3vlK51Mo512XqLXVGc4vhmEg
	RM5eCbLaMz6TxEyGQhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIYM-00CFmz-1v;
	Wed, 15 Mar 2023 04:15:54 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcHSD-00C6gv-0t
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:05:32 +0000
Received: by mail-pj1-x102d.google.com with SMTP id nn12so17349888pjb.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 20:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678849525;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=6StZGYfoZTn12V1gc6oBX/6Y2DvQg0Jy/UiSWe5dt5k=;
        b=3V0Bb6iTGxYmKPdsmVVjb5YDGt0UOAUN+A63mxQz3ZYfjTdMu6saa1R9Gh/rv2eu3b
         IqZWD+VN2oPSDYDCUvatQ4pau1AA/Sd/BYem1kyIblQ/5fKzJ8LxZrvAcO76NkyEBg2A
         5eHppBwHYa29Ssst5SUa4NtXUgz7L8tVp7rEyvOYiKl/M/GVTjbcxYl3tZ3PQnBtljyw
         /AMdtGyiBpRg3TQgYbXAgKkKQg/Mur2bMI/JRQ4dCGxKp8XAUqhAE6RXdjIyeznreE/Z
         k6dw7jlQGLWe+FMvQrwiPB/7+1y/tkZpFmWQwn4XUut9T5VSQQbLMwvqLJVGFOsxSzi1
         APDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849525;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6StZGYfoZTn12V1gc6oBX/6Y2DvQg0Jy/UiSWe5dt5k=;
        b=hoXBBQsNgiAuxfJJEWwfEyU/CjlPn+xvut41vHlYk60yjJI5YgY9ZsDwtAx/+PlQv/
         kb5CtVK3aXIjsb9hXNg0QpFPqsaS2ggp/uZMIXAgbhamHKTm2o1NpWz2BWx5xsYyfQKU
         RfBGTv0jhTDHlRWWn2KWo/s18PSHbhELYcB7IQBdc4NpondBnBV6ys6RK7h95sFIqrnu
         cnJUZPOMdz27Vv7OAMTKdnASvoBGzM+Y7A6tGX5WbewlHoDDYiYnenjn+J8jHbsSjKM5
         1u4dChHXZAPRB4TKcdQ4D7WoGwRwg7VmZiki/LuaLzrxzDv4r/DnKvZ/Z70mpM2BqPDR
         2QDA==
X-Gm-Message-State: AO0yUKX1Ps0bfDYDhZiXXMHLBZNq5f2WZtArBkrMhXAG/ccVWLFw5lbq
	LzkV40kw4xgETLrD6n/sYxsJt7L/ddIl41rQ+Tw=
X-Google-Smtp-Source: AK7set/ZRFjpxyImRiC63oPA7QR8aY+ZSsRYZkScRh+gExeQbc7hhNGg61z3G7A+k1lQU+zBzKMA7w==
X-Received: by 2002:a17:903:112:b0:19f:30be:e9fb with SMTP id y18-20020a170903011200b0019f30bee9fbmr877545plc.19.1678849525353;
        Tue, 14 Mar 2023 20:05:25 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id kz8-20020a170902f9c800b0019f3cc463absm2469104plb.0.2023.03.14.20.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:05:24 -0700 (PDT)
Subject: [PATCH v2 0/6] mm: Stop alaising VM_FAULT_HINDEX_MASK in arch code
Date: Tue, 14 Mar 2023 20:03:53 -0700
Message-Id: <20230315030359.14162-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_200529_563503_772CE7B3 
X-CRM114-Status: GOOD (  10.54  )
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

When reviewing
<https://lore.kernel.org/r/20221029084715.3669204-1-tongtiangen@huawei.com>
I noticed that the arch-specific VM_FAULT flags used by arm and s390
alias with VM_FAULT_HINDEX_MASK.  I'm not sure if it's possible to
manifest this as a bug, but it certainly seems fragile.

I'm including that original patch this time in the hope that makes it
easier for folks to review.  There were some boring conflicts so I
figured I'd rebase rather than pinging again.

Changes since v1 <20221203030356.3917-1-palmer@rivosinc.com>:

* Add the original patch, and reorder the RISC-V stuff first.
* Rebased on v6.3-rc2
* Moved the comment about VM_FAULT_ARCH_* to the patch that adds those,
  rather than the patch that adds 0s.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
