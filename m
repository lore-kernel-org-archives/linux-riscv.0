Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DEBC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 16:46:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C57F64E08
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 16:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C57F64E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WD4UXCzOM0iupX59XcSZoox+6WbykbjLDPS9xOsf31g=; b=MV383i+mVbqNqUms9eZEBJ+Yh0
	8sqZlnFylAYaF+J9RxhtNU2j3WVfcEiayFqNaAOCoQfwmgW8rR4ncfSknhLwDXUZGCels95KmNWvc
	dyaMLIPGM+rIg+G9ytQ1vQLbTG/L6pEQSgTv37BcMEpnsAjqPMTdb88xRua2rE00L1N/F8wq8gy88
	Bhzsp1FRc9gr+CI91yObcg4/q2TuVNYkz+WKBNB/lPuUP/f5BXujmq58jip2IHepwXpTkw7bR/+gq
	qh8UER0o4MJPNRqT9m4tcq5aFxiBI8r3WSD2Y168u5UmDbPyGF7MpZf0dultCFoRyo7I+Ijw2P9qD
	Fql58shQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC3UC-0004tQ-Qa; Tue, 16 Feb 2021 16:46:04 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC3U7-0004sZ-I3; Tue, 16 Feb 2021 16:46:00 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11GGcjPe025880; Tue, 16 Feb 2021 11:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=Q5aHAR7pPlj/atdytcBPZccatqTpy1qm0hvpI6B2Sf0=;
 b=aSu0QIsUki902qrNU04AQuAffNS2rmmkgsvzPX/SqRGj503dHwb0uANR9/3BdjdcUOTr
 a5u+ik+W33ZCsmtUxgwWVAHgOiZ8625M6a9uJEkw5M0bu2XcLPXd+ZZsxLUXrIenOu/d
 IJMvDOwpYRE2a0EWmrznneVzszNnlWCT+VonA6hJOlSqIE/ENo5L4A6mG3mzNFTH5W3W
 vYfcPIlcyeuiYpY+PitOIUSYlhf7/ijhbppqWPgF2sgzNwq3Tdj1awqDTi3lk7pFWD+x
 7YUipYk80l508mrZJAmUo4t0geEsdokwhvGGU4dlOtVmuxjC7/TzSbCC36zPfRgAJOZ1 WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36rhb68s0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 11:44:29 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11GGd9Qa029758;
 Tue, 16 Feb 2021 11:44:25 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36rhb68rud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 11:44:24 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11GGflQF029695;
 Tue, 16 Feb 2021 16:44:16 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 36p6d8ypak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 16:44:16 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11GGiFGX8716868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 16:44:15 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F8AE78060;
 Tue, 16 Feb 2021 16:44:15 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EE9578063;
 Tue, 16 Feb 2021 16:44:05 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.199.127])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 16 Feb 2021 16:44:05 +0000 (GMT)
Message-ID: <000cfaa0a9a09f07c5e50e573393cda301d650c9.camel@linux.ibm.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
From: James Bottomley <jejb@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
Date: Tue, 16 Feb 2021 08:44:04 -0800
In-Reply-To: <dfd7db5c-a8c7-0676-59f8-70aa6bcaabe7@redhat.com>
References: <20210214091954.GM242749@kernel.org>
 <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
 <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
 <YCo7TqUnBdgJGkwN@dhcp22.suse.cz>
 <be1d821d3f0aec24ad13ca7126b4359822212eb0.camel@linux.ibm.com>
 <YCrJjYmr7A2nO6lA@dhcp22.suse.cz>
 <12c3890b233c8ec8e3967352001a7b72a8e0bfd0.camel@linux.ibm.com>
 <dfd7db5c-a8c7-0676-59f8-70aa6bcaabe7@redhat.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_07:2021-02-16,
 2021-02-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=398 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_114559_674336_1FF9FC85 
X-CRM114-Status: GOOD (  33.40  )
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
Reply-To: jejb@linux.ibm.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 2021-02-16 at 17:34 +0100, David Hildenbrand wrote:
> On 16.02.21 17:25, James Bottomley wrote:
> > On Mon, 2021-02-15 at 20:20 +0100, Michal Hocko wrote:
> > [...]
> > > > >    What kind of flags are we talking about and why would that
> > > > > be a problem with memfd_create interface? Could you be more
> > > > > specific please?
> > > > 
> > > > You mean what were the ioctl flags in the patch series linked
> > > > above? They were SECRETMEM_EXCLUSIVE and SECRETMEM_UNCACHED in
> > > > patch 3/5.
> > > 
> > > OK I see. How many potential modes are we talking about? A few or
> > > potentially many?
> >   
> > Well I initially thought there were two (uncached or not) until you
> > came up with the migratable or non-migratable, which affects the
> > security properties.  But now there's also potential for hardware
> > backing, like mktme,  described by flags as well.  I suppose you
> > could also use RDT to restrict which cache the data goes into: say
> > L1 but not L2 on to lessen the impact of fully uncached (although
> > the big thrust of uncached was to blunt hyperthread side
> > channels).  So there is potential for quite a large expansion even
> > though I'd be willing to bet that a lot of the modes people have
> > thought about turn out not to be very effective in the field.
> 
> Thanks for the insight. I remember that even the "uncached" parts
> was effectively nacked by x86 maintainers (I might be wrong).

It wasn't liked by x86 maintainers, no.  Plus there's no
architecturally standard mechanism for making a page uncached and, as
the arm people pointed out, sometimes no way of ensuring it's never
cached.

>  For the other parts, the question is what we actually want to let
> user space configure.
> 
> Being able to specify "Very secure" "maximum secure" "average
> secure"  all doesn't really make sense to me.

Well, it doesn't to me either unless the user feels a cost/benefit, so
if max cost $100 per invocation and average cost nothing, most people
would chose average unless they had a very good reason not to.  In your
migratable model, if we had separate limits for non-migratable and
migratable, with non-migratable being set low to prevent exhaustion,
max secure becomes a highly scarce resource, whereas average secure is
abundant then having the choice might make sense.

>  The discussion regarding migratability only really popped up because
> this is a user-visible thing and not being able to migrate can be a
> real problem (fragmentation, ZONE_MOVABLE, ...).

I think the biggest use will potentially come from hardware
acceleration.  If it becomes simple to add say encryption to a secret
page with no cost, then no flag needed.  However, if we only have a
limited number of keys so once we run out no more encrypted memory then
it becomes a costly resource and users might want a choice of being
backed by encryption or not.

James



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
