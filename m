Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC5DC433E6
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 23:09:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D50A64E00
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 23:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D50A64E00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eT9EbkQNm5QU69FhtiUgz0ri1fgu6m1Iv5ZSW5lyKxY=; b=nHx3Tgj9/8WzRgUmJVFcafNd4
	8jFzZSJmC68i22OdGberJj5TcGewiEpKpUgji5vooXYoQSC7zLzKFLdSCnkASYoGqKCM1BT6OZZM1
	ATPnDzuureCW9nbUfClRNdGUGlmpaVFXpbGnPs/kVcX0LHz1VWfG+F5c7/syfOoQyLzUOi2AyegHi
	/ZHHFm5tnb00e1Yfi8f9vcxCcmLINT7cC4jCYMdasVevIpXOMXliTt+EB/tFyRI9HNY6gSYrPJT/e
	9TPJ9MThTkupT6b4lnax1s3AEbOc0tHc+daqqyaOl1BGm8XIqdv/548Z/3xXKN5n2L1fUrRv0J1nD
	Hj30M5KDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAL5e-0000Hj-HU; Thu, 11 Feb 2021 23:09:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAL5a-0000FA-N6; Thu, 11 Feb 2021 23:09:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F14AF64DF3;
 Thu, 11 Feb 2021 23:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613084973;
 bh=5lHiqnqqzqNi5/OSSDr9bdxtAGi+3a9C3En/9Cfu+Ss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KdQTRQFGFCn97Jxdu/WPirdvPSClIiQe3eCuboHTtWi+7E6/HzcS9qnWDJfg5uDFN
 ZY5PuEAEMXaKZcGprf7SdyWk9I93Lln3hFbxMp/KrXIzze9mx092L3Jh7i5UxEbimS
 cejoByXzKhnjLnxouWOf/ewU3WweBYFzmyuAwZ+NBMVNgyCt3ntX2Xw6TB28PoSs4H
 mwoZV1kJ8Ervt9UJn0zr12hQYhd+uIYZ9COxTA7mUSvHvGQIa7oorM8qITwmhhkYJK
 xRQGEMhSjFJwWRNKbKOuAa8QLAh9zI5u11sQAct0mWsv9haX/Z+R9q39gWv4lXPETF
 dH+b9ZCWAtkuQ==
Date: Fri, 12 Feb 2021 01:09:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210211230910.GL242749@kernel.org>
References: <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org>
 <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com>
 <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org>
 <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
 <20210211112702.GI242749@kernel.org>
 <05082284-bd85-579f-2b3e-9b1af663eb6f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05082284-bd85-579f-2b3e-9b1af663eb6f@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_180934_902468_18935739 
X-CRM114-Status: GOOD (  18.27  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Peter Zijlstra <peterz@infradead.org>,
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
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 11, 2021 at 01:07:10PM +0100, David Hildenbrand wrote:
> On 11.02.21 12:27, Mike Rapoport wrote:
> > On Thu, Feb 11, 2021 at 10:01:32AM +0100, David Hildenbrand wrote:
> 
> So let's talk about the main user-visible differences to other memfd files
> (especially, other purely virtual files like hugetlbfs). With secretmem:
> 
> - File content can only be read/written via memory mappings.
> - File content cannot be swapped out.
> 
> I think there are still valid ways to modify file content using syscalls:
> e.g., fallocate(PUNCH_HOLE). Things like truncate also seems to work just
> fine.
 
These work perfectly with any file, so maybe we should have added
memfd_create as a flag to open(2) back then and now the secretmem file
descriptors?
 
> > > AFAIKS, we would need MFD_SECRET and disallow
> > > MFD_ALLOW_SEALING and MFD_HUGETLB.
> > 
> > So here we start to multiplex.
> 
> Yes. And as Michal said, maybe we can support combinations in the future.

Isn't there a general agreement that syscall multiplexing is not a good
thing?
memfd_create already has flags validation that does not look very nice.
Adding there only MFD_SECRET will make it a bit less nice, but when we'll
grow new functionality into secretmem that will become horrible.
 
-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
