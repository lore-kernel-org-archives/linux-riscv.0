Return-Path: <SRS0=ovIN=HY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7180C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 09:39:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 860EF64E44
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 09:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 860EF64E44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QIeMZxHvF6Wukx6Oi+FEALQLmh0J0e+74SRXBIQw8XA=; b=TlVNUV24tdWz7S/SJvlaUq+2c
	1AIVvAYZKdUe+gg8phagr2TeAZyXudLdRDO1HxkZd8RPx8LMjSwXdJPjN8+q2JjDfnfx2ENHD8sNP
	JHWNTHj/ihIkDNWmJHXRDFinXxW47VNsCseSDQ1tK1QhVlignnHH8BiRZA30/vcU484aPe1j4lbrl
	GCNGSzEhdii5iiroV2FsLITDRiKmDLnbOGax/75+8SyHC2LjRMQcT9VeC26BeTK9NMpxCyhtesgBe
	7LsPaIDqF4L5JCOo/PuZzgjiRoY0GYO81physJir+v7AeYooELIvBrxCAfnS03Sb9eGELTSqJuJgM
	I3BJq/Ypg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE7gO-0001k8-MQ; Mon, 22 Feb 2021 09:39:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE7gI-0001hQ-T7
 for linux-riscv@lists.infradead.org; Mon, 22 Feb 2021 09:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613986746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFxc+0us/i36TuhQU4VjFE7oonKp2pd6VcvaTnTkT80=;
 b=NcY7trNoTvvWTG8xIfRbed/PeUCWvMP3Sfrwm7MBila42VYi0pvtbDYNujlR9amHOZBE28
 anDccbeCtfEECO1yUIzOj0V+OOwFImMSM6t+ElED0OOK4fV+STgh6jV92AVvJnEUS5KLfT
 dkIRKsib5h6JdFZHOCzp9n3O+ff5aFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-uAjoBBddN9WmOEycYhZwYw-1; Mon, 22 Feb 2021 04:39:00 -0500
X-MC-Unique: uAjoBBddN9WmOEycYhZwYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D047D18A2F09;
 Mon, 22 Feb 2021 09:38:20 +0000 (UTC)
Received: from [10.36.115.16] (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BABB110589DD;
 Mon, 22 Feb 2021 09:38:11 +0000 (UTC)
To: jejb@linux.ibm.com, Michal Hocko <mhocko@suse.com>
References: <20210214091954.GM242749@kernel.org>
 <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
 <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
 <YCo7TqUnBdgJGkwN@dhcp22.suse.cz>
 <be1d821d3f0aec24ad13ca7126b4359822212eb0.camel@linux.ibm.com>
 <YCrJjYmr7A2nO6lA@dhcp22.suse.cz>
 <12c3890b233c8ec8e3967352001a7b72a8e0bfd0.camel@linux.ibm.com>
 <dfd7db5c-a8c7-0676-59f8-70aa6bcaabe7@redhat.com>
 <000cfaa0a9a09f07c5e50e573393cda301d650c9.camel@linux.ibm.com>
 <5a8567a9-6940-c23f-0927-e4b5c5db0d5e@redhat.com>
 <b58debfe598331791ecc238a6bf8d2cf1762203a.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <304e4c9d-81aa-20ac-cfbe-245ed0de9a86@redhat.com>
Date: Mon, 22 Feb 2021 10:38:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b58debfe598331791ecc238a6bf8d2cf1762203a.camel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_043906_994185_76E5CF6D 
X-CRM114-Status: GOOD (  25.02  )
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
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 17.02.21 17:19, James Bottomley wrote:
> On Tue, 2021-02-16 at 18:16 +0100, David Hildenbrand wrote:
> [...]
>>>>    The discussion regarding migratability only really popped up
>>>> because this is a user-visible thing and not being able to
>>>> migrate can be a real problem (fragmentation, ZONE_MOVABLE, ...).
>>>
>>> I think the biggest use will potentially come from hardware
>>> acceleration.  If it becomes simple to add say encryption to a
>>> secret page with no cost, then no flag needed.  However, if we only
>>> have a limited number of keys so once we run out no more encrypted
>>> memory then it becomes a costly resource and users might want a
>>> choice of being backed by encryption or not.
>>
>> Right. But wouldn't HW support with configurable keys etc. need more
>> syscall parameters (meaning, even memefd_secret() as it is would not
>> be sufficient?). I suspect the simplistic flag approach might not
>> be sufficient. I might be wrong because I have no clue about MKTME
>> and friends.
> 
> The theory I was operating under is key management is automatic and
> hidden, but key scarcity can't be, so if you flag requesting hardware
> backing then you either get success (the kernel found a key) or failure
> (the kernel is out of keys).  If we actually want to specify the key
> then we need an extra argument and we *must* have a new system call.
> 
>> Anyhow, I still think extending memfd_create() might just be good
>> enough - at least for now.
> 
> I really think this is the wrong approach for a user space ABI.  If we
> think we'll ever need to move to a separate syscall, we should begin
> with one.  The pain of trying to shift userspace from memfd_create to a
> new syscall would be enormous.  It's not impossible (see clone3) but
> it's a pain we should avoid if we know it's coming.

Sorry for the late reply, there is just too much going on :)

*If* we ever realize we need to pass more parameters we can easily have 
a new syscall for that purpose. *Then*, we know how that syscall will 
look like. Right now, it's just pure speculation.

Until then, going with memfd_create() works just fine IMHO.

The worst think that could happen is that we might not be able to create 
all fancy sectremem flavors in the future via memfd_create() but only 
via different, highly specialized syscall. I don't see a real problem 
with that.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
