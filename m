Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF07C4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 08:27:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDAA821D24
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 08:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hk9NMMQK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OlX7ec/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDAA821D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=upt9dq01kRPEdmd7lMDzEWb4cMiitoMSzMi+6xu4KcI=; b=Hk9NMMQKPb+KjCums859qsFJw
	xwliLynp9eshY8T3NR+KX/SShA6G/nzDSobWsSj16VDSm2ZBmeXlEoF1Sl5dPJvFutO50FZwKCTax
	HbyOMAQvUTNeMO6NzcHKWz2Arct0fT+kXdF8r3eq51JLToSQUZqsffNMi5xySapffTPKhNYhaDpb+
	hKRBlaTYu1u12HEpl96YjD5EjEvI9UFcFSpYXM1SdIohgXiIc788v7cPNhmCkgow+IVHV1bILd0t+
	dOpYlBZHscq1a6cwLle+dyXGmq9N9fvJv88nMJWlBgoFr7g/3flGJB8/Vr453l0yjipxBGEImqOJH
	V1HYIr6qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXKJc-0001cI-TO; Tue, 27 Oct 2020 08:26:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXKJa-0001b7-Ft
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 08:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603787205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SgGH32DtkrCtTnKEBBNXoBqjBSTDBuSJiubuSpA7gY=;
 b=OlX7ec/71spC9nS/tD8+Ft4ioUZH10wkzjIcoyEnbiqxAd0AB0/Icw9GXY9tjvgrmtylnk
 4UWPNKeGw5LgYm4odr3/CgfzZm69EEU3Qu3BaVp1RKNyZH9VDfruqmd2vQCXKp8+BUe+hE
 4DwozDLc1Nd2BGvQhPq9SFGBZSY+RUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-6RoR-GSeOCmfUqCmMk5Dsg-1; Tue, 27 Oct 2020 04:26:42 -0400
X-MC-Unique: 6RoR-GSeOCmfUqCmMk5Dsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A7C5705E;
 Tue, 27 Oct 2020 08:26:38 +0000 (UTC)
Received: from [10.36.113.185] (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 492196EF45;
 Tue, 27 Oct 2020 08:26:31 +0000 (UTC)
Subject: Re: [PATCH v7 1/7] mm: add definition of PMD_PAGE_ORDER
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20201026083752.13267-1-rppt@kernel.org>
 <20201026083752.13267-2-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <9728bfdf-9f40-68dd-3862-5befc770268b@redhat.com>
Date: Tue, 27 Oct 2020 09:26:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026083752.13267-2-rppt@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_042646_626496_054E0701 
X-CRM114-Status: GOOD (  17.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 26.10.20 09:37, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The definition of PMD_PAGE_ORDER denoting the number of base pages in the
> second-level leaf page is already used by DAX and maybe handy in other
> cases as well.
> 
> Several architectures already have definition of PMD_ORDER as the size of
> second level page table, so to avoid conflict with these definitions use
> PMD_PAGE_ORDER name and update DAX respectively.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
