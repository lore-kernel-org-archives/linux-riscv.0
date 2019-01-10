Return-Path: <SRS0=4zRh=PS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A6FC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 07:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FEF3214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 07:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oV5wyvzv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oY11WInt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FEF3214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S08iQUiqPLvlyU1FIkCQE6D5CdvfuxgmAuHK3i6C/PU=; b=oV5wyvzvra4KTaaG4hhf1kCRW
	S4h76sFScFtCelraWW3esAtIDkACx2AzFYINjaWqI1yL1/AeWqrd6w0aMtAyy277sBqdLJoNRl7ZQ
	7EiQGSRmI+f2Fwmkr6wPZLW3K+Vuaek0/72HAaSig58y47bTItuTZ7f4Eu5di5ulgApzfIXygIPLl
	bOYXN8PgIDLzvzeONHFtipJ3zj07TcjXxkuDSGhDLvxfz3xa2zzM2JbWlPnkKDE9FkxHQmWhXcfQg
	KIh4gj+AbWG+NjJ8qwUZ8iAPHz4msvakHTN1obwMn/9vUMq8rI+1BzTopxAzfgYkhNXumf4AB84r/
	PgWTFVvHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghUrC-0004YO-7u; Thu, 10 Jan 2019 07:34:26 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghUrB-0004YF-40
 for linux-riscv@bombadil.infradead.org; Thu, 10 Jan 2019 07:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wepm26S/CGeluViEenKiRnEnVp7HPHPn4jwmOcbQIb4=; b=oY11WInt3BN2IOzif1w5XbcELe
 6GKv6+8u3M1eS3imFYD2xUzrPfVdFqjha9y2pdQtpUqAbRaJKFaHSRUCEB5YX2juladQDcWt6bfnU
 jYcyHFoHO1PAxNeYu7XnTHAEG/EIyUaD54EFgTjhsE8TFJMh1IL39AwSIO70oGIWxrckAOktCm1yF
 ZkaPowhcBwmci5wmR0CWntj0ck0Nz3vEDxnKuZuz5YXWxJaXgVmfNZFXkn/A7GmjYNu8gsNFpTh6p
 Ok313s67OF7q9c5iSdx7orObyvRAS8YLrTnYJQTYedkl01P45NxDCHcjXEfBBWiisWvE1lzp5jVwz
 uiyXAkJg==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghUr7-0007ki-Ja
 for linux-riscv@lists.infradead.org; Thu, 10 Jan 2019 07:34:22 +0000
X-Originating-IP: 94.242.246.46
Received: from [10.200.0.202] (unknown [94.242.246.46])
 (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E620CE0004;
 Thu, 10 Jan 2019 07:33:38 +0000 (UTC)
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
To: Palmer Dabbelt <palmer@sifive.com>, mike.kravetz@oracle.com
References: <mhng-fc16a975-cefa-45b3-b3d0-2d763cdd9614@palmer-si-x1c4>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <e553f2a6-a487-e205-2e10-edad4618c3ec@ghiti.fr>
Date: Thu, 10 Jan 2019 07:33:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <mhng-fc16a975-cefa-45b3-b3d0-2d763cdd9614@palmer-si-x1c4>
Content-Language: en-PH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_023421_821075_1999F20B 
X-CRM114-Status: GOOD (  20.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mingo@kernel.org, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 ndesaulniers@google.com, aghiti@upmem.com, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, akpm@linux-foundation.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On 1/9/19 10:15 PM, Palmer Dabbelt wrote:
> On Wed, 09 Jan 2019 11:23:22 PST (-0800), mike.kravetz@oracle.com wrote:
>> On 12/9/18 10:21 PM, Alexandre Ghiti wrote:
>>> This series introduces hugetlbfs support for both riscv 32/64. Riscv32
>>> is architecturally limited to huge pages of size 4MB whereas riscv64 =

>>> has
>>> 2MB/1G huge pages support. Transparent huge page support is not
>>> implemented here, I will submit another series later.
>>
>> Thanks for doing this.
>>
>> Since patches only touch riscv specific code, I did not look too closely
>> and do not feel qualified to offer an opinion as to whether they are =

>> correct
>> for the architecture.o
>
> Sorry about that.=A0 These appear to have missed by inbox somehow. I =

> think they did manage to get caught by patchwork
>
> =A0=A0 https://patchwork.kernel.org/cover/10720635/
>
> I'll take a look...
>

No problem Palmer :)

Thanks,


>> With that said, the patches do look reasonable with a few comments =

>> below.
>>
>>> CMA or (MEMORY_ISOLATION && COMPACTION) must be enabled so that boot
>>> reserved gigantic pages can be freed: indeed, one can reduce the number
>>> of huge pages by calling free_gigantic_pages which in turn calls
>>> free_contig_range, defined only with those configs defined.
>>> However I don't see any strong dependency between free_contig_range
>>> and those configs, maybe we could allow hugetlbfs users to free boot
>>> reserved hugepages without those configs activated, I will propose
>>> something if Mike Kravetz agrees.
>>
>> Yes, that should be modified.=A0 I think it would be a simple matter of =

>> moving
>> free_contig_range out of that ifdef block.=A0 If you would like, I can =

>> submit
>> a patch for that.
>>
>> Somewhat related, I do not think your patches enable dynamic =

>> allocation of
>> gigantic pages.=A0 Not sure if that was an oversight or conscious =

>> decision.
>> I am not sure this is a highly used feature, but if you can do it on =

>> riscv
>> then why not?
>>
>> Another 'missing feature' in your patches is PMD sharing.=A0 This =

>> feature if
>> only of value for BIG shared hugetlbfs mappings.=A0 DB folks like it.=A0=
 As
>> mentioned above, I do not know much about riscv so I do not know if this
>> might be of use to potential users.
>>
>>> - libhugetlbfs testsuite on riscv64/1G:
>>> =A0 - brk_near_huge triggers an assert in malloc.c, does not on x86.
>>> =A0 - mmap-gettest, mmap-cow: testsuite passes the number of default fr=
ee
>>> =A0=A0=A0 pages as parameters and then fails for 1G which is not the de=
fault.
>>> =A0=A0=A0 Otherwise succeeds when given the right number of pages.
>>> =A0 - map_high_truncate_2 fails on x86 too: 0x60000000 is not 1G aligned
>>> =A0=A0=A0 and fails at line 694 of fs/hugetlbfs/inode.c.
>>> =A0 - heapshrink on 1G fails on x86 too, not investigated.
>>> =A0 - counters.sh on 1G fails on x86 too: alloc_surplus_huge_page retur=
ns
>>> =A0=A0=A0 NULL in case of gigantic pages.
>>> =A0 - icache-hygiene succeeds after patch #3 of this series which lowers
>>> =A0=A0=A0 the base address of mmap.
>>> =A0 - fallocate_stress.sh on 1G never ends, on x86 too, not investigate=
d.
>>
>> In general, libhugetlbfs tests seem to have issues with anything besides
>> default huge page size.=A0 You encountered that and noted that tests bre=
ak
>> for 1G pages on x86 as well.=A0 Cleaning all that up has been on my =

>> todo list
>> for years, but there always seems to be something of higher priority. :(
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
