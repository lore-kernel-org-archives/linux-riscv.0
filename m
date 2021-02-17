Return-Path: <SRS0=wXp/=HT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D10C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Feb 2021 16:20:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC9D460C3E
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Feb 2021 16:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC9D460C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asxFqYJqtOTOQDFRq0zHjRsg7ormTgzjIRuT+gMguJw=; b=2Ezw89+ghc7IKiDBZ0ONp2ZRDU
	Vwzm1JsecqSsELIg1od2jnGj7D4mQ1RTdyDo8Tk2GHMqXOhWCsRbMCzkwr961UB67u27TsJwzxSzN
	sylTZk8O20ORWM0ygUWDv2xNB/jzWkqObdf3uiK5oC9FEfGkfR5SZQaGlKkIRdWlEms4uwHpPhwby
	CLLiDIz6GGTYn9Ggbix1hc0XEcot0CZ/VbO9jw7SVkdxVtzSZKGUyVPH1nSBzYjx0oANA2NSWdKOd
	DggVELk6wX8PxEJU4Ce1OhudWMpr94N/VrnCmO0Y9kwP//b1cUCZdxiDV4563FQTyh86I0Jh2dtlC
	/IyPnJig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCPYo-0004VP-Oc; Wed, 17 Feb 2021 16:20:18 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCPYk-0004UT-0T; Wed, 17 Feb 2021 16:20:14 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11HG4Wsg043012; Wed, 17 Feb 2021 11:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=Ks6WtbUp554Hx99i4JOUNKQ1uY1qWSRYOgnpaGD1k9g=;
 b=OZR9mAJP+weCO5wC0AbzdiyHu7DYQzuc+dwiihhMbc0STeS4aGRo/LKkbKsJ1VIorPQi
 B2hPyx+0Pq88F+iAuexTIMeKFcIg3y9ej5DYGsKSryWCElnkjGzOvF9LtUXrwRsvUiOA
 /GgB4E9NS3yYQyZD1s/aLEl1EebDHJrt+ZdYWGmUdtCrBL1X5CnM5UVtSk/aypNetw9P
 OutaIXUG4y8raLuypVI4vJgSQ2BUlDf0TH070wCspRNZ3WjsuPmn6FP12nZrHltzzq8j
 UO92XVyQu80qeJSPz2bPa/ya91/Awg6dxydKcITUa3/bk1TEIBqkaOtkF8hUvLz8Z/dM Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36s5q2j553-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 11:19:38 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11HG4uk5044788;
 Wed, 17 Feb 2021 11:19:37 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36s5q2j54a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 11:19:37 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11HG3f69032451;
 Wed, 17 Feb 2021 16:19:35 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 36p6d9fc26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 16:19:35 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11HGJYeC25690478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Feb 2021 16:19:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0E4A7806A;
 Wed, 17 Feb 2021 16:19:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F5837805E;
 Wed, 17 Feb 2021 16:19:27 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.199.127])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Feb 2021 16:19:27 +0000 (GMT)
Message-ID: <b58debfe598331791ecc238a6bf8d2cf1762203a.camel@linux.ibm.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
From: James Bottomley <jejb@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
Date: Wed, 17 Feb 2021 08:19:26 -0800
In-Reply-To: <5a8567a9-6940-c23f-0927-e4b5c5db0d5e@redhat.com>
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
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_13:2021-02-16,
 2021-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=5
 suspectscore=0
 priorityscore=1501 mlxscore=5 phishscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=127 spamscore=5
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102170122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_112014_192495_DDCCFB51 
X-CRM114-Status: GOOD (  28.55  )
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

On Tue, 2021-02-16 at 18:16 +0100, David Hildenbrand wrote:
[...]
> > >   The discussion regarding migratability only really popped up
> > > because this is a user-visible thing and not being able to
> > > migrate can be a real problem (fragmentation, ZONE_MOVABLE, ...).
> > 
> > I think the biggest use will potentially come from hardware
> > acceleration.  If it becomes simple to add say encryption to a
> > secret page with no cost, then no flag needed.  However, if we only
> > have a limited number of keys so once we run out no more encrypted
> > memory then it becomes a costly resource and users might want a
> > choice of being backed by encryption or not.
> 
> Right. But wouldn't HW support with configurable keys etc. need more 
> syscall parameters (meaning, even memefd_secret() as it is would not
> be sufficient?). I suspect the simplistic flag approach might not
> be sufficient. I might be wrong because I have no clue about MKTME
> and friends.

The theory I was operating under is key management is automatic and
hidden, but key scarcity can't be, so if you flag requesting hardware
backing then you either get success (the kernel found a key) or failure
(the kernel is out of keys).  If we actually want to specify the key
then we need an extra argument and we *must* have a new system call.

> Anyhow, I still think extending memfd_create() might just be good
> enough - at least for now.

I really think this is the wrong approach for a user space ABI.  If we
think we'll ever need to move to a separate syscall, we should begin
with one.  The pain of trying to shift userspace from memfd_create to a
new syscall would be enormous.  It's not impossible (see clone3) but
it's a pain we should avoid if we know it's coming.

>  Things like HW support might have requirements we don't even know
> yet and that we cannot even model in memfd_secret() right now.

This is the annoying problem with our Linux unbreakable ABI policy: we
get to plan when the ABI is introduced for stuff we don't yet even know
about.

James



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
