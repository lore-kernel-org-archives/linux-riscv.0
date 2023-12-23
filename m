Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B1DC46CD4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 03:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drpXYawBRz1faLUVRe+NAFfJj24gTab6UChB7JSeNbc=; b=3jToZSWD4kzbH5
	QVWSTdjRVaAFtS8cszDYuN+IxufyMLtZhdsW/OlzfwKnbTyBHyAJhru14AHZSoWTxOON0yeGUQtCz
	dkNObzXXTubyu1BO1Ccj3cuAP8h7HJfN+Ffyx0zdILgtgoQrh3lXeFCB3hdAhABB1YOZazhcW3xKX
	yzHyrTaMthzpLM+1d5vpmdzjbGekFlR2QEzeMRhCdr8TT0N/KVcnyjXQ44v7RuM5PHoKqDadQXmA3
	kGezzypZDrqeRvioLC5ZJbpNW872kKbtEZmWYEws8kf2r4mGkiLc2y/gU9PNyS2lSpH8wT1Q316Hn
	G8wPKFkQ9tT+TcqDAXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsMv-007FlP-0M;
	Sat, 23 Dec 2023 03:08:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsMs-007Fk6-1c
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 03:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703300881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R0MsJ0VeRgA3aYXF/QQZp6FvDWhmY2cf2KWfFSXSqrY=;
	b=QGdw/+LfV1P27aFHw5zzAn1Jm289FymEO+ex7pzDdiL5YNVebTqwqVlfsJ+TXyAZqueKbw
	hcwDt0W5H2XRh0RoLXvXs/fYZMAv8421rLPCx6T4NmfDH1EdKV6Ppot6OI81mmr3m9TbXk
	uQjrGYNUlbdT5IU2mYMIpu7+XASIbh0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-w6q9iQymNYSr_3rFbw8Kew-1; Fri, 22 Dec 2023 22:07:57 -0500
X-MC-Unique: w6q9iQymNYSr_3rFbw8Kew-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6ce337ff87fso2408257b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 19:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703300876; x=1703905676;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0MsJ0VeRgA3aYXF/QQZp6FvDWhmY2cf2KWfFSXSqrY=;
        b=SNbjLznmhBZXJudVsB36PBOjsP+CkDcPf7JZqaI8NGKXDHj/BD5+6qf1Qx8kiJbdSC
         Et/S+4zlSyVN17wD0OpbaUyxaQ/ooT31vAl4PiZpZdGT77Zr22I/3AdkdslAfSpDK4pn
         rIg2W1tUZQbLbVkutMxR/HNTKwoxpWqOkQYQkJAyRCyGzUFrRzGCOUqiUTR2Zo1T8j+a
         1T3RCEPEWsEXcUlCa6Rq/Sqgq1LH68qmu4hjrqAe83Lp3UliejFb8KOR10djTOJdk7XX
         NbsmliXFg3zpXCc9mCTdoebM+RZYOSGOPXCHrEGntcan9jpeVjLHGiIGSCnSLVOGzbk7
         /OrA==
X-Gm-Message-State: AOJu0Yy4GSSzxRpPaZBztAsGxEswBsUaDo9sK/9PkbFQMvKRjAvMfgJV
	Z8GvhZdbUDA6wNR/X65AWFHc6TdXUZGUZZrU4rENPJWSSW8fgN6oDDL0SdNch/kvvVMdfscc9JO
	Jr5dPe87XxMS/Yq6Zb08qQbrXE+/Xy93a1Iim
X-Received: by 2002:a05:6a20:8e02:b0:194:c0a8:3b5a with SMTP id y2-20020a056a208e0200b00194c0a83b5amr4175654pzj.3.1703300876225;
        Fri, 22 Dec 2023 19:07:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/RAZxdYpWJlUuB5a1DnfRyiqwnMns1rRZevN4BQV3hHyDx9qh/QuarlgRxngT/HMknV8bvg==
X-Received: by 2002:a05:6a20:8e02:b0:194:c0a8:3b5a with SMTP id y2-20020a056a208e0200b00194c0a83b5amr4175638pzj.3.1703300875611;
        Fri, 22 Dec 2023 19:07:55 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ed:60ec:45a7:dfa:5e5:9eed])
        by smtp.gmail.com with ESMTPSA id v5-20020a632f05000000b005c259cef481sm3992876pgv.59.2023.12.22.19.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 19:07:55 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v5 0/5] Rework & improve riscv cmpxchg.h and atomic.h
Date: Sat, 23 Dec 2023 00:07:47 -0300
Message-ID: <ZYZPA-Ugfowk1VXq@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZP2DVap64lJZj9g4@gmail.com>
References: <20230810040349.92279-2-leobras@redhat.com> <ZP2DVap64lJZj9g4@gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_190802_609020_7F24CE9A 
X-CRM114-Status: GOOD (  34.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Sep 10, 2023 at 04:50:29AM -0400, Guo Ren wrote:
> On Thu, Aug 10, 2023 at 01:03:42AM -0300, Leonardo Bras wrote:
> > While studying riscv's cmpxchg.h file, I got really interested in
> > understanding how RISCV asm implemented the different versions of
> > {cmp,}xchg.
> > 
> > When I understood the pattern, it made sense for me to remove the
> > duplications and create macros to make it easier to understand what exactly
> > changes between the versions: Instruction sufixes & barriers.
> > 
> > Also, did the same kind of work on atomic.c.
> > 
> > After that, I noted both cmpxchg and xchg only accept variables of 
> > size 4 and 8, compared to x86 and arm64 which do 1,2,4,8.
> > 
> > Now that deduplication is done, it is quite direct to implement them
> > for variable sizes 1 and 2, so I did it. Then Guo Ren already presented
> > me some possible users :)
> > 
> > I did compare the generated asm on a test.c that contained usage for every
> > changed function, and could not detect any change on patches 1 + 2 + 3 
> > compared with upstream.
> > 
> > Pathes 4 & 5 were compiled-tested, merged with guoren/qspinlock_v11 and
> > booted just fine with qemu -machine virt -append "qspinlock". 
> > 
> > (tree: https://gitlab.com/LeoBras/linux/-/commits/guo_qspinlock_v11)
> Tested-by: Guo Ren <guoren@kernel.org>
> 

Hello Guo Ren, thanks for testing!

I will resend this series, and I would like to understand how should I put 
your Tested-by over this patchset:

Is it ok if I add it on each patch of this series?

Thanks!
Leo


> Sorry for late reply, because we are stress testing CNA qspinlock on
> sg2042 128 cores hardware platform. This series has passed our test for
> several weeks. For more detail, ref:
> https://lore.kernel.org/linux-riscv/20230910082911.3378782-1-guoren@kernel.org/
> 
> > 
> > Thanks!
> > Leo
> > 
> > Changes since squashed cmpxchg RFCv4:
> > - Added (__typeof__(*(p))) before returning from {cmp,}xchg, as done
> >   in current upstream, (possibly) fixing the bug from kernel test robot
> > https://lore.kernel.org/all/20230809021311.1390578-2-leobras@redhat.com/
> > 
> > Changes since squashed cmpxchg RFCv3:
> > - Fixed bug on cmpxchg macro for var size 1 & 2: now working
> > - Macros for var size 1 & 2's lr.w and sc.w now are guaranteed to receive
> >   input of a 32-bit aligned address
> > - Renamed internal macros from _mask to _masked for patches 4 & 5
> > - __rc variable on macros for var size 1 & 2 changed from register to ulong 
> > https://lore.kernel.org/all/20230804084900.1135660-2-leobras@redhat.com/
> > 
> > Changes since squashed cmpxchg RFCv2:
> > - Removed rc parameter from the new macro: it can be internal to the macro
> > - 2 new patches: cmpxchg size 1 and 2, xchg size 1 and 2
> > https://lore.kernel.org/all/20230803051401.710236-2-leobras@redhat.com/
> > 
> > Changes since squashed cmpxchg RFCv1:
> > - Unified with atomic.c patchset
> > - Rebased on top of torvalds/master (thanks Andrea Parri!)
> > - Removed helper macros that were not being used elsewhere in the kernel.
> > https://lore.kernel.org/all/20230419062505.257231-1-leobras@redhat.com/
> > https://lore.kernel.org/all/20230406082018.70367-1-leobras@redhat.com/
> > 
> > Changes since (cmpxchg) RFCv3:
> > - Squashed the 6 original patches in 2: one for cmpxchg and one for xchg
> > https://lore.kernel.org/all/20230404163741.2762165-1-leobras@redhat.com/
> > 
> > Changes since (cmpxchg) RFCv2:
> > - Fixed  macros that depend on having a local variable with a magic name
> > - Previous cast to (long) is now only applied on 4-bytes cmpxchg
> > https://lore.kernel.org/all/20230321074249.2221674-1-leobras@redhat.com/
> > 
> > Changes since (cmpxchg) RFCv1:
> > - Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error
> > https://lore.kernel.org/all/20230318080059.1109286-1-leobras@redhat.com/
> > 
> > Leonardo Bras (5):
> >   riscv/cmpxchg: Deduplicate xchg() asm functions
> >   riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
> >   riscv/atomic.h : Deduplicate arch_atomic.*
> >   riscv/cmpxchg: Implement cmpxchg for variables of size 1 and 2
> >   riscv/cmpxchg: Implement xchg for variables of size 1 and 2
> > 
> >  arch/riscv/include/asm/atomic.h  | 164 ++++++-------
> >  arch/riscv/include/asm/cmpxchg.h | 404 ++++++++++---------------------
> >  2 files changed, 200 insertions(+), 368 deletions(-)
> > 
> > 
> > base-commit: cacc6e22932f373a91d7be55a9b992dc77f4c59b
> > -- 
> > 2.41.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
