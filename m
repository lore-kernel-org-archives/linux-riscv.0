Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907CED58D40
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNFqkjz5h57/Y0QB6yOLGAyae9nkU0L0Spr1Z9iEPWU=; b=YNilOWitk6WpYk
	E/oz3ii+MhGlJZOhEBmK0CN9zY9UW/4p4ypp+ichZcOSpshw/MjGz7NL3444StYYLtJGhrICgqL06
	KOmvXnUiWEGhhq0h3MwBp/wU5ZAzd4d3YlN3vI3FfNjZPZY6s2d2GETjlpu8P2ehhhcsF9+ZknLDv
	qh+q8TKYeGXxeLL7jOC33W3n3VmWjt5LOXxx2psH08ademY5u8RSFRJSmZjGSwIxQzPrUWfeqULFT
	AdhuBmFVRcbnt4hCm79RMZG5wk18un/xCor3QfgLd4VPqlfzOz8/rpYZGRuILETKByM9p0a0raQCy
	YwkuZ7LmcfDfXHQq4BWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYv0-000000085sE-1ICI;
	Mon, 25 Nov 2024 13:14:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYu1-000000085fI-370U;
	Mon, 25 Nov 2024 13:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92F92A416C6;
	Mon, 25 Nov 2024 13:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F59C4CECE;
	Mon, 25 Nov 2024 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732540400;
	bh=zoe9keCgOz8TdgaZeY2U5FChsOFwHzQn4aQ2XQc2oMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HUnFiL7mAae91KuKIjZq38fKCFSJ/xeAJC0MKHSCYoLch7XSINlDDErAkmEKfKrBl
	 7JuTksfjNvU+Dypx8p0EI/G2Fhzu9c8FHGOHjTRsxtkA6VLNB7Gy/Tskmtr9VySjLd
	 1/BwilXjzpT7eWAlgRWDMQVe6RXh1uSt11U6NtohY5ZZvTxLsSbPatv3SQLMVqkMnR
	 1GVIZ9VmtROba4i4EU1fuSctCl91TePgrrkXglv5+hmJlc3o//fcw0LB9Z5o8wnSYB
	 zY4qKyBWauQxBjUch391Y/FMHbdTpfMlXB+FVYUOR6QUhRl2qKkos6e6S6MjIiLwlQ
	 MF/4czrgX+pWA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
 linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
 peterx@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 25/25] Revert "riscv: mm: Add support for ZONE_DEVICE"
In-Reply-To: <f511de7cb9817e2e2fdd274ee842c228d699abea.1732239628.git-series.apopple@nvidia.com>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
 <f511de7cb9817e2e2fdd274ee842c228d699abea.1732239628.git-series.apopple@nvidia.com>
Date: Mon, 25 Nov 2024 14:13:17 +0100
Message-ID: <878qt7zcb6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_051321_844162_216FD168 
X-CRM114-Status: UNSURE (   4.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWxpc3RhaXIgUG9wcGxlIDxhcG9wcGxlQG52aWRpYS5jb20+IHdyaXRlczoKCj4gREVWTUFQIFBU
RXMgYXJlIG5vIGxvbmdlciByZXF1aXJlZCB0byBzdXBwb3J0IFpPTkVfREVWSUNFIHNvIHJlbW92
ZQo+IHRoZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBQb3BwbGUgPGFwb3BwbGVAbnZp
ZGlhLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IENodW55YW4gWmhhbmcgPHpoYW5nLmx5cmFAZ21haWwu
Y29tPgoKT2gsIHdlJ3JlIGdldHRpbmcgdGhlIGJpdCBiYWNrISBUaGFua3MhCgpSZXZpZXdlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
