Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000EFC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 01:34:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B1086135F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 01:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B1086135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGkINrl3JghQtG5rvZkmiQxFBeyotw91yXv0NgvgZOQ=; b=ehwr2dln6S261i6xRMExe0KbsE
	6/2/2JAUp3LAcA2VPSKpiSZPSKs7GbcuSXQY8agROg6iZQdP0VuF4TW7zoXhJD6VdAe/HicSoCvD2
	p3elwekY8smCHwsaWh1lO1Aam0gjkyyptXS7gt4IB8QLrAs9yWu0u2jMUeKT+ou1tdrDkPXF4P5bp
	aDKFiT1D2+vPVcwuy0EDE80f1DkFJyxcc9ZZrJvL+8UrNNqZGpwSaqafCwkK06X7GqseW8ND+2zWE
	ShL2Z9OLQXHf7yHvsPJJ5naayxJUgsmtPJrsvVdvh1/Y/sVxxySISAqumGyLvhiykQX7Tbi6MQb6V
	k0gszJgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljB5k-002MsJ-25; Wed, 19 May 2021 01:33:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljB5V-002MqZ-Fr; Wed, 19 May 2021 01:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:Reply-To:From:
 Subject:Message-ID:Sender:Content-ID:Content-Description;
 bh=TSIcUKlJKuIIr978ibfL+W5lJZ618kXPKibv8DMD+8w=; b=LjK1b5LEFctSSuJeIKQP76r5zw
 8HQuC5dkKUqUHK9eLvvVKjTECA982ynaUsY/8n9R+Bay/U41FmAvXwt9uAWmYaZCFPLESWH83Jy49
 qLFSn2kxsmSclNemM6uNXVb9r6YHPOs+VzfWSEOjk0G/Qz1DfxG1cVOMl5SpxL1olMEv3BV9Ad4cP
 qynFHz8q7C6gWv/2f51I+ZVIq2hYPw1YhkUjqLA9RHVajamOB/LDff3qLNWDFGBazr3dhTuyRR+i+
 qTKbbfIclYf8eVBdyOPpuiP4kxc6AqT8PBNY3glsGintsfCVVpUsn3iN2EtAOSGlg7ZfqyTmKzq1a
 BRq5FtqQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljB5S-00F45d-Oi; Wed, 19 May 2021 01:33:28 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14J14LBp095740; Tue, 18 May 2021 21:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=TSIcUKlJKuIIr978ibfL+W5lJZ618kXPKibv8DMD+8w=;
 b=C5kj5m8CJg96NebcO1bm9othMtFMyAinaRQ504k8x6EXkUmEb9ZuvrPGOZqTQNQ0g0Xv
 Mwn2vhUdbL+JkHCIikF/YPjf1uZT134MQZakQfw76N/Z0HZ6QpRptSxKwdG86sVWFTw/
 3RDtLRiN5QDTGArFs0km0FVBKuxuVztvCuLdDVpEicvxcjGJyXAvTVyUMWP8r87Vq6G7
 EyP+NjO2d3VB3bKNejrXwFxI/D1BQIpE0p3WDQ8roRlLOjydlA13sRNVW+eYVbv2FYGj
 hIsjYjGbtCiZgQ8tJt139+MQ42d5SDmhyG7xo0cGdRGo+gzO2f6qTHbo5VMFSnuzR14M Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38mqycs8de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 21:32:43 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14J14MOc095896;
 Tue, 18 May 2021 21:32:42 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38mqycs8d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 21:32:42 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14J1QwAw010620;
 Wed, 19 May 2021 01:32:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 38j5x9j6ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 01:32:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14J1Weni11076004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 01:32:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66A827805E;
 Wed, 19 May 2021 01:32:40 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BA5378066;
 Wed, 19 May 2021 01:32:30 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.80.208.94])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 19 May 2021 01:32:30 +0000 (GMT)
Message-ID: <d99864e677cec4ed83e52c4417c58bbe5fd728b1.camel@linux.ibm.com>
Subject: Re: [PATCH v19 6/8] PM: hibernate: disable when there are active
 secretmem users
From: James Bottomley <jejb@linux.ibm.com>
To: Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Christopher Lameter <cl@linux.com>, Dan Williams
 <dan.j.williams@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Elena Reshetova
 <elena.reshetova@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Hagen Paul
 Pfeifer <hagen@jauu.net>, Ingo Molnar <mingo@redhat.com>, Kees Cook
 <keescook@chromium.org>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>, Matthew Garrett
 <mjg59@srcf.ucam.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport
 <rppt@linux.ibm.com>, Michael Kerrisk <mtk.manpages@gmail.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra
 <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rick
 Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
Date: Tue, 18 May 2021 18:32:29 -0700
In-Reply-To: <20210518102424.GD82842@C02TD0UTHF1T.local>
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-7-rppt@kernel.org>
 <20210518102424.GD82842@C02TD0UTHF1T.local>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LznGIJm2lBQ6APrvvyeFq2Y4fBjyOunI
X-Proofpoint-ORIG-GUID: 7e9L0ZhoY0K9faClVgEt7JR6P8qAFxb2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_11:2021-05-18,
 2021-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxlogscore=792 adultscore=0 phishscore=0 spamscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_183326_931633_DAFEF7B7 
X-CRM114-Status: GOOD (  26.04  )
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

On Tue, 2021-05-18 at 11:24 +0100, Mark Rutland wrote:
> On Thu, May 13, 2021 at 09:47:32PM +0300, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > It is unsafe to allow saving of secretmem areas to the hibernation
> > snapshot as they would be visible after the resume and this
> > essentially will defeat the purpose of secret memory mappings.
> > 
> > Prevent hibernation whenever there are active secret memory users.
> 
> Have we thought about how this is going to work in practice, e.g. on
> mobile systems? It seems to me that there are a variety of common
> applications which might want to use this which people don't expect
> to inhibit hibernate (e.g. authentication agents, web browsers).

If mobile systems require hibernate, then the choice is to disable this
functionality or implement a secure hibernation store.   I also thought
most mobile hibernation was basically equivalent to S3, in which case
there's no actual writing of ram into storage, in which case there's no
security barrier and likely the inhibition needs to be made a bit more
specific to the suspend to disk case?

> Are we happy to say that any userspace application can incidentally
> inhibit hibernate?

Well, yes, for the laptop use case because we don't want suspend to
disk to be able to compromise the secret area.  You can disable this
for mobile if you like, or work out how to implement hibernate securely
if you're really suspending to disk.

James



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
