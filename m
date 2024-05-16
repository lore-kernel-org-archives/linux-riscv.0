Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260BDC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 16:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEfaCZkxcF4733a0KFOUJ2iJLCo3kOehttGQfW35TMQ=; b=AZHBQvHroti4oq
	+8nWaXhnQrMkHGXSxBGtxAkzfY7caRZ0FGRr1F/EwlDU5Lh43+6244TBYFYTwbclsNQjpHG9dUBfa
	gyixRTedZCctZIcFiI53JWfqh7ojs4nEU11Ywo1ZQ7yIApIaj+pQfN/okxZFzMc/d74Klg2YbNs49
	8pH6X9M+Bje+XbD4zo7xkjIzvOuUVdl2Gq4kj9jv4UR+67/oad0BSrzVvjIkHbbfdfaCueL2E9l0P
	jHtuPujreQyBhJjWIUw4bpd3id1alWylQCk2JNJjIMh3ilzzgMbauP/ejiyMKdKlpiSf+8YjkPGsC
	tWIyKfjnnpCsC2VTg0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7drk-00000005U5K-3OtJ;
	Thu, 16 May 2024 16:22:00 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7drh-00000005U2K-3FbC
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 16:21:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2a484f772e2so308368a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715876506; x=1716481306; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ladxmLIkYURG/7sblZ1iTNsC5RmlL9cxQCxBwW8J0dI=;
        b=Cc4CEr1chEhsJwcsX38hphp+jlhTULH7hcUPgVazrz6o6jK0ku/y42HVsQTmK+aK47
         FMJtiMBf/jEGIpoKsUeZKereWJhjtPf6nI8yEJe3qW9UHxVAIqW9NW/4oBab3g7oSF+V
         R+ZorcxUklD9yC7zeRkxw56uYg5LvxSqQVRPb+4MS7krDzy35/ykM3r4QwN1DztOFgo/
         ixbnDYBQkFwskPWLf6n5LKxrJ2Mn0O2QlPLtG72XQ87Qfza1IgsnXAKoxb3eYwEaGdsY
         IoGxgXtszySCR2XmGlzWFP1DxAgupIL+tQbdz5uj01EsM3ZHW5/MDtCTaDcagyFukNEr
         +psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715876506; x=1716481306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ladxmLIkYURG/7sblZ1iTNsC5RmlL9cxQCxBwW8J0dI=;
        b=f6j2Teb4VyfLBOXVsBOBT9GpbGNfewzjc1azmPQ9lOjtbx2n1Dplm49pUAp1Yify5T
         Ly6rYuveGGJFiiwc7g3kjhpj4OZHLvqxwQwcUfBvMs19wA5ParNBeHP6nLgobOPvZCwX
         DAsZEFRdi/L5D5HcmxPXehpvbSmg+mK+rc+5tETpVQXHQndCBOjlhNIjW7RRu1TdO8Tu
         19RRcD6Lc0sxSO7QROTXJjZEkA5dW2FP4lh/o/2DbyGhshpPpp7t2V5Ge6qG+JfqjwkW
         Lp2EWx6ZS/rGpd8nf1CT7m3HuW6GKmM1O/+hw0qN5a+I1OJVlf8nqEzD4eJA31mHKoIP
         5Tmg==
X-Forwarded-Encrypted: i=1; AJvYcCU6y4J1D7YpvWTsn6y7HzS0CHlTDgxr7nk48lDPT1iOVlcEOF47tBlnGM0V5132WQWF0mcNDhtbjfKupXCTVkb4EmKu/FfTUy1Foi/3810V
X-Gm-Message-State: AOJu0YwIdG2LrInG9JpN0O44QDuzv5VvNLTC8CQNCOJQzhA8j8KD8l/C
	SnubvNEmrB8KcmJYfsXJ2ZfWNFAidj4BN1e9e+lzwyRv/AWCk7tq
X-Google-Smtp-Source: AGHT+IE2RYf/IjCzqA6lvwO63eep/pWkyyUhLJPD8PBjTkjNJiBeJ3r1GQbOnigCM2bH4+drbBXVnQ==
X-Received: by 2002:a17:90a:d3d8:b0:2ad:c098:ebca with SMTP id 98e67ed59e1d1-2b6cc44f929mr17346299a91.20.1715876506064;
        Thu, 16 May 2024 09:21:46 -0700 (PDT)
Received: from localhost (dhcp-141-239-159-203.hawaiiantel.net. [141.239.159.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a52esm15900592a91.2.2024.05.16.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:21:45 -0700 (PDT)
Date: Thu, 16 May 2024 06:21:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Edward Liaw <edliaw@google.com>, shuah@kernel.org,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@android.com, linux-security-module@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 08/66] selftests/cgroup: Drop define _GNU_SOURCE
Message-ID: <ZkYymMDd690uufZy@slm.duckdns.org>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-9-edliaw@google.com>
 <ZkJHvrwZEqg6RJK5@slm.duckdns.org>
 <bec3f30e-fc9a-45e2-b6ea-d739b2a2d019@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bec3f30e-fc9a-45e2-b6ea-d739b2a2d019@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_092157_834790_536142F5 
X-CRM114-Status: GOOD (  12.12  )
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

On Thu, May 16, 2024 at 09:50:06AM -0600, Shuah Khan wrote:
> On 5/13/24 11:02, Tejun Heo wrote:
> > On Fri, May 10, 2024 at 12:06:25AM +0000, Edward Liaw wrote:
> > > _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
> > > redefinition warnings.
> > > 
> > > Signed-off-by: Edward Liaw <edliaw@google.com>
> > 
> > Applied to cgroup/for-6.10.
> > 
> > Thanks.
> > 
> 
> Hi Tejun,
> 
> Please don't include this in your PR to Linus. This patch series needs
> to go together as it is causing several build warns and some errors.

I'm afraid it's too late. The PR is too late. Do you want me to send an
amended PR with the commit reverted? If it's just temporary issues in
selftests, maybe we can just wait it out?

Thanks.

-- 
tejun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
