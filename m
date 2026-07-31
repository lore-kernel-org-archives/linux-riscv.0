Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709B2C55174
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 20:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lx8tZKd9F0sO1UTDTVuXgifgZeGWWWWbLdiAfIO4Ps=; b=C1be4ZqN0hJMMa
	GnP6aSSbQWPeOrwDJo7CTh576Aj6SQSsJK+YoKK01OJR3sKUc1RT3hu2ePje4bQ3dZy7U+nzxW/AR
	jXd/Q+W5DLzsswSuBlIyZrBxyP8YZhNu9zELcyl3W/sWuhzBoBrl6g1Oyy3OKKmTo+srbFb8yd7+/
	98TAXnVaAUQBN6d95PxQxJzjxAf0IFMZgDaqYZ4I1ZfYx4PC3m+mPmA8mAg8PXA5UECDqTdozWSRX
	fyRW+lmk0qflJNWMLO2gOIxEZck/f5lbbX2qKC9OkK6cqCSTf4jEh7W9EKtA+f1U8oydFqvm6nbKy
	E3nGO6LXmSAD8Qh4hWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpuIp-0000000Da2w-1gfH;
	Fri, 31 Jul 2026 20:57:59 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgTG-0000000Bs0v-20Rj;
	Fri, 31 Jul 2026 06:11:52 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hBG151hcmz56S5Z;
	Fri, 31 Jul 2026 14:11:37 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 66V6BTq5055955;
	Fri, 31 Jul 2026 14:11:29 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid12;
	Fri, 31 Jul 2026 14:11:30 +0800 (CST)
X-Zmail-TransId: 2b056a6c3c92204-5b4d3
X-Mailer: Zmail v1.0
Message-ID: <20260731141130967G9r8eUgi_oMRjksjgXyRf@zte.com.cn>
In-Reply-To: <CAAhSdy0_dCHC+ZVG7HZdtUxZWWX_KG3YfN=ngVdpy-7_pquUFA@mail.gmail.com>
References: 20260701120954.129873-1-wang.yechao255@zte.com.cn,20260701120954.129873-2-wang.yechao255@zte.com.cn,CAAhSdy0_dCHC+ZVG7HZdtUxZWWX_KG3YfN=ngVdpy-7_pquUFA@mail.gmail.com
Date: Fri, 31 Jul 2026 14:11:30 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <atish.patra@linux.dev>, <alex@ghiti.fr>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NCAxLzVdIFJJU0MtVjogS1ZNOiBBZGQgdGhlIHNwbGl0IHBhZ2UgY2FjaGUgZm9yIGlvY3RsIGNvbnRleHQ=?=
X-MAIL: mse-fl2.zte.com.cn 66V6BTq5055955
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 31 Jul 2026 14:11:37 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A6C3C99.000/4hBG151hcmz56S5Z
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_231151_050043_DB7940A9 
X-CRM114-Status: UNSURE (   6.51  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 31 Jul 2026 13:57:57 -0700
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

> > @@ -54,6 +54,12 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
> >         kvm_destroy_vcpus(kvm);
> >
> >         kvm_riscv_aia_destroy_vm(kvm);
> > +
> > +       /*
> > +        * Free the split page cache after all vCPUs and devices are destroyed.
> > +        * At this point, there are no concurrent accesses to the cache.
> > +        */
> > +       kvm_mmu_free_memory_cache(&kvm->arch.pgd_split_page_cache);
>
> Better to do this in kvm_riscv_mmu_free_pgd()
> 
> Regards,
> Anup

Thanks for the review. I'll move it back to kvm_riscv_mmu_free_pgd() in v5 version.

Regards,
Yechao

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
