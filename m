Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE45C48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 23:19:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A517B61040
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 23:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A517B61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZVgOdhUTdkl9//0lbBVkOZmIVGi7WymKuCDBDD3OZ4=; b=qnLNjsEYjmxX7+
	CihzDpAkI2686C2TWI0CdfHbpbzGLOL1au3q3R9Vnm1rq3haFMc4ITACpzOFdRwd2QMohJ26tsnt4
	cIS1F0m0fK8ZLTbLGKVbvEMBAx6qJmwnBSHsuL+p/XhJLlH+ZY1j7tYXWIxKxHFAU4OGnWt8lo16I
	3jZk0ulL32MPdkm1/cYARrCS/5TldgD/BCf862gyaS3b794OJ1NoU6SoH4jOSZvb9O3mBsJG1WlM6
	DlqOm+hRm6TrfPdqcIaRHnRFzi4yL4L/NRtBuME1pRmhs3q9PmQ4pshpLOFcqCrLfm8Tma/kcwj/6
	W+SW2maO8Zse3HXstBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteoS-0086Cc-HF; Wed, 16 Jun 2021 23:19:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteef-0081u0-Dt; Wed, 16 Jun 2021 23:09:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 874D260FF1;
 Wed, 16 Jun 2021 23:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623884944;
 bh=IZsHCzpYhVnOA7preGSau6rA8qgP6HKFxjKgSja1eL0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ya2ZP+w0tecCWkQRgX69bO6HYOyjDnO010jk/O2wAw6Zsuovzv7xhHhgIc6Yk06uA
 ZCYvxCbCkVf5yXwFRNMAJgFp6ixuvqqQCReTczkt8P04D6CZgdculdlGx+OgR5Ln+8
 UNBs7mcjgMaobwjFyc/CwbMPq9cERYDE+ontS7S0=
Date: Wed, 16 Jun 2021 16:09:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: kernel test robot <lkp@intel.com>, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 kbuild-all@lists.01.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: +
 mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
 added to -mm tree
Message-Id: <20210616160904.cf834ee8c9e7a26008aa833e@linux-foundation.org>
In-Reply-To: <87zgvpnbl7.fsf@linux.ibm.com>
References: <20210615233808.hzjGO1gF2%akpm@linux-foundation.org>
 <202106162159.MurvDMy6-lkp@intel.com>
 <87zgvpnbl7.fsf@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_160905_617368_9C67FBE4 
X-CRM114-Status: UNSURE (   7.94  )
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

On Wed, 16 Jun 2021 19:41:32 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> We may want to fixup pgd_page_vaddr correctly later. pgd_page_vaddr() gets
> cast to different pointer types based on architecture. But for now this
> should work? This ensure we keep the pgd_page_vaddr() same as before. 

I'll drop

mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch          

for now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
