Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7FFC433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 17:06:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B4160FD7
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 17:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B4160FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sYvFVrr4MdUNDI/8QQvY30W5As9MfsopGlLqhc6J4w=; b=oNj97AHBNaEEj2AO/AySMJ3Hux
	swSDG4wasJxO8mWzwm06xNfWtxy+iDRaaaRsjDx7XkL+0u4FlMffBzdpJLbouuwnHe2FukXOVtiKX
	yOL2AJpIJLR7zXRyVBRt4dS4Y5Ndhg9FxpppQz7vTD3ph1X5wGbit2q52Sbic2khUzUuxxUjGQFzY
	GsOQ7QeadA9T58CMvx2ZOAKF81OLgz/YgWnuhoRyqOnjGrR2FJhf7LqfCR/fqKMeedEATUoaY0P5k
	59LZoHLxZY00upiiSFRFFIYVsrKBzB4dUh/8MqbjW3Ey8W+q8F4zZnGIaTu1wWqr/HUF6JzqIUVfd
	Z8NGC9oA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lehSF-004twl-EC; Thu, 06 May 2021 17:06:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lehS2-004tvL-Or; Thu, 06 May 2021 17:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:Reply-To:From:
 Subject:Message-ID:Sender:Content-ID:Content-Description;
 bh=pGWlz4VwvIVnhlCISXuTLo7g6RVkGHUJxaqvyitGnUs=; b=qgaN+tTZhmykjc7UoctOvRVc7O
 rSaurONIHzjiMfw5Bqjn4hmUZ21E9ANYjoKEA74bl9KguFFwfZ0rlom3so1IPfhJXoQ6affpkn0HB
 39YuQATvJEC311wlhx5fYh4AEIeF56sTOMhL8xvXxXBudPW+O7prWQQkQLg0EY0EQkspiW04aRXbE
 ZvM6hIfBjK4tAm0nG0vTZLUa/F6VulIaiOze5sSwY8R4Pm4usmrTtoyenxmzeORMcO3ygjl62d+Rz
 43E3/1Rx+vLeCfls1iJBQErZApjH6h3ZDalcYmDXLnswZFBSvlMfVOz02z4GWN8FeMXQEZrMgvaJ1
 W+nNkEDg==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lehRz-006F1W-Vd; Thu, 06 May 2021 17:06:13 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 146H3VX3004413; Thu, 6 May 2021 13:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=pGWlz4VwvIVnhlCISXuTLo7g6RVkGHUJxaqvyitGnUs=;
 b=L4JbCYQKpia4zXEErVwRDpp3Tt9eZ6nBFNsGgLbhcYZqFeu+uQs6PI8f85SflHt2lxSl
 tX8Rup9C43dsj33fdN60oXaBui0xhN4RsXwji4kfe79AOroNNVZTtYPxE9p17xBnMFKu
 o99/UowDYgNxHWs/tGYwcpqHbGZTadtN14pIhNj3FzFENZiYDPY14pJNi7oLUrDPap+J
 JUDYF1ULAoOLbtodlf17rc6MUKVLyEUCzGfxFZ3EddNcEJJGKjYzucEDZcFbzYyOS5Rp
 8Ob2ngvz+gq5+S0m46xbA6u3TP39dagXhgMeljI8P8gjjA5znTskdztw8IjMCJorcC4N dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38cmbsrbrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 13:05:46 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 146H5RCk018275;
 Thu, 6 May 2021 13:05:46 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38cmbsrbqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 13:05:46 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 146GwcO7001722;
 Thu, 6 May 2021 17:05:44 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 38bee8rj2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 17:05:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 146H5h4m21692716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 17:05:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3093178063;
 Thu,  6 May 2021 17:05:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2275978066;
 Thu,  6 May 2021 17:05:30 +0000 (GMT)
Received: from jarvis (unknown [9.80.192.238])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 May 2021 17:05:29 +0000 (GMT)
Message-ID: <8eb933f921c9dfe4c9b1b304e8f8fa4fbc249d84.camel@linux.ibm.com>
Subject: Re: [PATCH v18 0/9] mm: introduce memfd_secret system call to
 create "secret" memory areas
From: James Bottomley <jejb@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christopher
 Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Elena Reshetova
 <elena.reshetova@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar
 <mingo@redhat.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Matthew
 Wilcox <willy@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Mark
 Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>, Mike
 Rapoport <rppt@linux.ibm.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>, Shakeel Butt
 <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>, Will Deacon
 <will@kernel.org>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Date: Thu, 06 May 2021 10:05:27 -0700
In-Reply-To: <996dbc29-e79c-9c31-1e47-cbf20db2937d@redhat.com>
References: <20210303162209.8609-1-rppt@kernel.org>
 <20210505120806.abfd4ee657ccabf2f221a0eb@linux-foundation.org>
 <de27bfae0f4fdcbb0bb4ad17ec5aeffcd774c44b.camel@linux.ibm.com>
 <996dbc29-e79c-9c31-1e47-cbf20db2937d@redhat.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0d6KK0iqrRhJxGIQqX0knMWgBsxJjth9
X-Proofpoint-GUID: lpT8nr0vq331XradvviecCL776aCH-PF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_10:2021-05-06,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_100612_032827_C018E45C 
X-CRM114-Status: GOOD (  55.37  )
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
Reply-To: jejb@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 2021-05-06 at 18:45 +0200, David Hildenbrand wrote:
> On 06.05.21 17:26, James Bottomley wrote:
> > On Wed, 2021-05-05 at 12:08 -0700, Andrew Morton wrote:
> > > On Wed,  3 Mar 2021 18:22:00 +0200 Mike Rapoport <rppt@kernel.org
> > > >
> > > wrote:
> > > 
> > > > This is an implementation of "secret" mappings backed by a file
> > > > descriptor.
> > > > 
> > > > The file descriptor backing secret memory mappings is created
> > > > using a dedicated memfd_secret system call The desired
> > > > protection mode for the memory is configured using flags
> > > > parameter of the system call. The mmap() of the file descriptor
> > > > created with memfd_secret() will create a "secret" memory
> > > > mapping. The pages in that mapping will be marked as not
> > > > present in the direct map and will be present only in the page
> > > > table of the owning mm.
> > > > 
> > > > Although normally Linux userspace mappings are protected from
> > > > other users, such secret mappings are useful for environments
> > > > where a hostile tenant is trying to trick the kernel into
> > > > giving them access to other tenants mappings.
> > > 
> > > I continue to struggle with this and I don't recall seeing much
> > > enthusiasm from others.  Perhaps we're all missing the value
> > > point and some additional selling is needed.
> > > 
> > > Am I correct in understanding that the overall direction here is
> > > to protect keys (and perhaps other things) from kernel
> > > bugs?  That if the kernel was bug-free then there would be no
> > > need for this feature?  If so, that's a bit sad.  But realistic I
> > > guess.
> > 
> > Secret memory really serves several purposes. The "increase the
> > level of difficulty of secret exfiltration" you describe.  And, as
> > you say, if the kernel were bug free this wouldn't be necessary.
> > 
> > But also:
> > 
> >     1. Memory safety for use space code.  Once the secret memory is
> >        allocated, the user can't accidentally pass it into the
> > kernel to be
> >        transmitted somewhere.
> 
> That's an interesting point I didn't realize so far.
> 
> >     2. It also serves as a basis for context protection of virtual
> >        machines, but other groups are working on this aspect, and
> > it is
> >        broadly similar to the secret exfiltration from the kernel
> > problem.
> > 
> 
> I was wondering if this also helps against CPU microcode issues like 
> spectre and friends.

It can for VMs, but not really for the user space secret memory use
cases ... the in-kernel mitigations already present are much more
effective.

> 
> > > Is this intended to protect keys/etc after the attacker has
> > > gained the ability to run arbitrary kernel-mode code?  If so,
> > > that seems optimistic, doesn't it?
> > 
> > Not exactly: there are many types of kernel attack, but mostly the
> > attacker either manages to effect a privilege escalation to root or
> > gets the ability to run a ROP gadget.  The object of this code is
> > to be completely secure against root trying to extract the secret
> > (some what similar to the lockdown idea), thus defeating privilege
> > escalation and to provide "sufficient" protection against ROP
> > gadget.
> 
> What stops "root" from mapping /dev/mem and reading that memory?

/dev/mem uses the direct map for the copy at least for read/write, so
it gets a fault in the same way root trying to use ptrace does.  I
think we've protected mmap, but Mike would know that better than I.

> IOW, would we want to enforce "CONFIG_STRICT_DEVMEM" with
> CONFIG_SECRETMEM?

Unless there's a corner case I haven't thought of, I don't think it
adds much.  However, doing a full lockdown on a public system where
users want to use secret memory is best practice I think (except I
think you want it to be the full secure boot lockdown to close all the
root holes).

> Also, there is a way to still read that memory when root by
> 
> 1. Having kdump active (which would often be the case, but maybe not
> to dump user pages )
> 2. Triggering a kernel crash (easy via proc as root)
> 3. Waiting for the reboot after kump() created the dump and then
> reading the content from disk.

Anything that can leave physical memory intact but boot to a kernel
where the missing direct map entry is restored could theoretically
extract the secret.  However, it's not exactly going to be a stealthy
extraction ...

> Or, as an attacker, load a custom kexec() kernel and read memory
> from the new environment. Of course, the latter two are advanced
> mechanisms, but they are possible when root. We might be able to
> mitigate, for example, by zeroing out secretmem pages before booting
> into the kexec kernel, if we care :)

I think we could handle it by marking the region, yes, and a zero on
shutdown might be useful ... it would prevent all warm reboot type
attacks.

James


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
