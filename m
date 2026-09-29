Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AA5CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dg2dL0kXqL/dsmtfOC+utKh4qxfv266OW4rcoBAm8Co=; b=cTGkBMPkNT+T7r
	IHxVhrUHjL6YgqSnIEliXhWv7KHUqEtSZB8UrlGo7qPYBdW167n/INMyJ58RUn4i+tkGeNPdrYPlH
	l9TA04A91F22nuZwzja+WmHvM/zqfBbyoefR78b5vLxobee/NxbZ/OjD85hWs3Lcp8pJp+MVZBWAP
	y/+fEnnChacawlixxsiZrwXM5Z+yEXOj3wqIIqPjqMgbVHLxf2vMiEU2nHzOP8u+ABAu6PwCS2H7T
	qlb+dwx6lTPmv+szdlqYY/UB7hT1GVJzbH+Jfy8ERaDcgaR/Xhor9f6MbfrMff7eb0jgfik2BlF7g
	LBpzC8M7pE50LqHnBlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUSr-000000031Kt-337t;
	Tue, 29 Sep 2026 09:49:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUSp-000000031K5-1dYY;
	Tue, 29 Sep 2026 09:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VwC4Pl3ixdsKxogKtIndvZ7a3yWTyDGNv04lRon5xhk=; b=FMQ9Jsm6A6WEe8gE3fmtcBk9Ra
	oRhPKSDE38wXvLvSxyegSzJIb20HGGfKDeCV+CJWSjkFBv0guhJJCIz7eAsxCW/TMU+hs0lONPySa
	2eaHGraP3wxlpPW1Oh7qN5+KRfVB1bVX+qKZZzzy2UddqH15gpn0k5A+UWW89/sJd0E4W9VZOq5sg
	Vo0GMPMG9gWj2UGPNRC+dj5C5pOFb7aTYXqTn2den/qUC7tjEObA2JGBSCnNK8ijnAVbSv2IUmt/b
	hgaWy8EJSIhn2xRewbdBi/gWhAxEYipnMhUucUnlx/hsr1499StgzKGWzTRbUoldJm6L/6oc8hiUE
	RgsSeEUA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBUSm-00000002RHq-1100;
	Tue, 29 Sep 2026 09:49:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E63A1516;
	Tue, 29 Sep 2026 02:49:22 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C0AB3F85F;
	Tue, 29 Sep 2026 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790675365; bh=B9AAocrpolX4MxYBlzxMX1TENfUxNfjQH6oUrO3W3l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qC2KTCuZf1CyxLBk3z1uaYKc2/4FlbYgOLxClpx43M4zdwowQSacqxR/KYheG79UL
	 oeo9BoxlKy4bqg9qJZXTF7z4xAFsYcgGhgkBTPS9RZ96bh+yoFlF80aIjoNApnjkf+
	 mUd/yI9YIBnotXjhq1Vj2M7shHyZd5qNTtG5lNfw=
Date: Tue, 29 Sep 2026 10:49:23 +0100
From: Leo Yan <leo.yan@arm.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, john.g.garry@oracle.com, will@kernel.org,
	mike.leach@arm.com, pjw@kernel.org, palmer@dabbelt.com,
	guoren@kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] perf tsc: Declare TSC support from the build
 system
Message-ID: <20260929094923.GH14479@e132581.arm.com>
References: <20260929034133.2153-1-cp0613@linux.alibaba.com>
 <20260929034133.2153-3-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929034133.2153-3-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_104928_661979_16C911D9 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 29, 2026 at 11:41:33AM +0800, Chen Pei wrote:

> x86 and arm64 keep the same behaviour, riscv starts running the subtest
> where the previous patch defines rdtsc().
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

For arm64:

Tested-by: Leo Yan <leo.yan@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
