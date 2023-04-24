Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552F2C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OmFPYZ1XW60AIPcKYpygbX4v5+nTNTz2bwd7Le/JKCc=; b=LXgc3qeLmuxLql
	TfJvbKYLMyPnRNMMiV61uT6U4/ghrE3vLqS1XXsvW+kVsKpFAZezp7cp6OJDO5XM0UHFC9DHA8qLc
	ob3lX6zT14NPya/WyfuD/slkXfUOTitBpjGxe2BJHBmbQPGLQWQ5wP7UkFdWPKQ0a4PTN5PrQbmuP
	0FfWnNgs+VmYlVGFypjH0n+YtzF5/3d792PUYWYErFpG3mNFpHuKCXgabl5b7gTxiRkO+EO3yIKAo
	qck+njOW7DrUjrq14T6ui1UNictw3v3JWNSdxlU8tZvaCSWvaibrcalJImXgl49Xqp7EcfVBl2d8G
	R4UR2Me4jjARor3D04hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsgc-00Fpv0-2f;
	Mon, 24 Apr 2023 09:40:42 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsga-00FptQ-1I
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 09:40:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94f1a6e66c9so745527966b.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Apr 2023 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682329237; x=1684921237;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LujyabMpn2d5pNDJ/5qq2RowvsHuvRO01dfnOaHAMfg=;
        b=frFI24846pDpSPiJXrXJWh0bSaphVNclGAdPzueexxmWH8+yY7UV/8yXAdIi9gZiHY
         GmIsCBOnXOZXeAdVk6Iu6anv1IOnarQ6139Y7rU0ac+PIDoADUnEhR2q3aYZ86LUfPLn
         QRqUu0Et/+qXSLA6w/X7zwRK6KSKpJgPsvV6iaj4E9PUKBD4BD7obUH9RQPP5HK6EFDu
         XCo7zuU/V1xfxXRjOoY0CkHFCmr/qbYQ4q7g1vSB/h1GaMhj8PVYZx4f3rG1Hi0kAvRd
         XpITk7F/cngYDl17a98ZKGO3oOd4ee1RY57qe2mJ+ipWfD6zSifzDwik8RfEy+3xRmrB
         ThlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682329237; x=1684921237;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LujyabMpn2d5pNDJ/5qq2RowvsHuvRO01dfnOaHAMfg=;
        b=FKizlPuZvqIxYERF8JU9hyCB02yYXErjrIsFDaMP6Iuawki4W4oyUrPUFtuLaGcOAE
         om0qFb6mDvmeRGBHV7mYkIivBCfQLB7kACFY8s5N3PQMJlFaU2oU1D9xhkTLhqnFEHM5
         CFeU6DDUKYaSz2INBu5QX7+sWmhk75QoeFMAmR5wzsUzXlPgzmuNXaIwFEQ2qO80SrAU
         wyiThWOaA/9xsLOWzbbuq35HUC3EXkhICLCTh2n98/4oDsrnS8KJTi5nKFvQaZHaRKic
         kmbtc6nHA+Frb8cJPM2wpA1I+3QxoUkHYQxBc0TXw6TRFPmV4LdsRbBRIsW8kmrGV31y
         w8Zw==
X-Gm-Message-State: AAQBX9fEGv+QR09T7UzilDyoUADEfQBwzVUaUrsjClxFhsvd1stAnsSx
	vifzEaUYy3ZV7zwpy5qEHVsBAt59g/N4cZqqJNQ=
X-Google-Smtp-Source: AKy350ZUTIn8HTpY0mszT227QXjYxn5o4V65d2N3WGOhz/k1yNV382n3FiHO5GiwIz3+ss8Gt1HiTwVUcs0ybOCGnug=
X-Received: by 2002:a17:906:aada:b0:94a:8ead:c7f with SMTP id
 kt26-20020a170906aada00b0094a8ead0c7fmr8984862ejb.23.1682329236945; Mon, 24
 Apr 2023 02:40:36 -0700 (PDT)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 24 Apr 2023 11:40:25 +0200
Message-ID: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
Subject: In-flight collision: ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP renaming
To: Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Linux-MM <linux-mm@kvack.org>, kernel-janitors <kernel-janitors@vger.kernel.org>
Cc: Muchun Song <songmuchun@bytedance.com>, Andrew Jones <ajones@ventanamicro.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_024040_440589_9707CC12 
X-CRM114-Status: UNSURE (   6.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dear Guo Ren, dear Palmer,

on linux-next, I have noticed that you have submitted and added the
commit a3c7d6b642e4 ("riscv: mm: hugetlb: Enable
ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP"), that adds the select
ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP to the RISCV config. As it
seems, Aneesh Kumar K.V has concurrently renamed this config
throughout the tree with commit 215218dddd25 ("mm/hugetlb_vmemmap:
rename ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP"), but your commit was
not visible to that renaming. When both commits are merged in a common
tree---as happens with linux-next, and will soon happen with Linus'
tree, your commit a3c7d6b642e4 will do nothing (select no existing
config anymore).

It is easy to fix, adjust this one line to the renaming and 'select
ARCH_WANT_OPTIMIZE_VMEMMAP'. For now, I am just reporting to let you
know; probably, it is best to get a quick fix-up patch with -rc2, once
all the changes landed in -rc1.


Best regards,

Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
