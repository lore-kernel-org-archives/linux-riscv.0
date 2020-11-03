Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CE9C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:57:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BC6422264
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F0o6RfOL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5lRRB1N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BC6422264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9LlOj42GAx5AwU7Y6jYwYYZXVIrspsEM4XsQeEiSmcs=; b=F0o6RfOLUQOMg74JmOMdkA1cq
	g7gJ4iSoJ3CShximunFO3axCfOBXgSaUA5gPbr165iU1AWWGhmpHXb99JXUyx8/usL2ZkqogZygrK
	fPe+Iibn3upBpvh1cgCJK0UxuBTqtIlXayjQvfmvmgbmZKFQlb/x0QJ53yvjZHzXQlWnwyiVTC1qy
	Z3aDJXatxSGIWFapbVigc3yWvQuXICoGiDTM/FbuBprYBEdKWlYwdOt3jexJSCHB1TX5KEVhD7hei
	B8L2avC0d0NrAlwrUqpKtq8LosdjcgvptGETrdKIvuSFoedId3f2dCc7aQHs+la8l40ALcDD/ekjh
	VYBXa5wDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZyg5-0002fC-Te; Tue, 03 Nov 2020 15:56:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZyfz-0002d5-QO; Tue, 03 Nov 2020 15:56:52 +0000
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B47820870;
 Tue,  3 Nov 2020 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604419010;
 bh=PdZbTZgg1JmpGp2bwjsENk8fgDYDWqJbhtmXs83/fs4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U5lRRB1N1MmXeOH2myvsU+QScNFs2bqbrupv/pQ4irlpmZwooHX8QWAG7Auq1KyAR
 BKUUy9aydAOF9vLJs/4y281FnWsGIjtK6pWCGXyL7y2ETSAe5RqnViQPWzk/w9t3W5
 2kvBIUagkYLvCz/jLs5zwUcf94hBrrkoIybAauvg=
Date: Tue, 3 Nov 2020 17:56:36 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v3 2/4] PM: hibernate: make direct map manipulations more
 explicit
Message-ID: <20201103155636.GJ4879@kernel.org>
References: <20201101170815.9795-1-rppt@kernel.org>
 <20201101170815.9795-3-rppt@kernel.org>
 <20201103110816.t6a3ebtgcm7mfogy@box>
 <20201103121350.GI4879@kernel.org>
 <20201103143916.otz2o4h2dlmewn3h@box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103143916.otz2o4h2dlmewn3h@box>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_105652_010424_6D3ACCC1 
X-CRM114-Status: GOOD (  15.13  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 05:39:16PM +0300, Kirill A. Shutemov wrote:
> On Tue, Nov 03, 2020 at 02:13:50PM +0200, Mike Rapoport wrote:
> > > > +
> > > > +		if (WARN_ON(ret))
> > > 
> > > _ONCE?
> > 
> > I've changed it to pr_warn() after David said people enable panic on
> > warn in production kernels.
> 
> pr_warn_once()? :P

Sure :)

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
