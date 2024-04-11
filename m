Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F56ECD1299
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3U+miJgCc+++QAnR2zxA9Zy7kvxQ1GhlSzAbjJYlQM=; b=Jzg3C6ZNrWIvOS
	PqrClZ0iSlLT1NjQdhhv6FBM7bg2K66csPjl+9jsQGm4DI29iTbG1Ck9IpW6OfbDUKIhSAOcDSRab
	qwV0ji0v/07ipGbg6kQMj8+YuOTm0U3+0/UQpD6KXyUK9Ij4KKjBR7Rn5vF+jF5lFxtBnXInI0O/3
	6cfGmsGk7BSYShGZ7WVnW74rxXrfBvgZyPV9zb8DwrM2lCUi4RMnSvzwP35O3OzEMgoyuIpOsL+2c
	SlweLwp6LWCtTXGIY1m+25tRJw1C0hI9J08K8f0MYIbC7JLjTaIfRQJRxntKaZ0UGYXIU3XyuDIhg
	dngPBqmMVNVccFp415xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoow-0000000ApSb-078i;
	Thu, 11 Apr 2024 07:26:06 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoor-0000000ApPh-1yMm;
	Thu, 11 Apr 2024 07:26:03 +0000
Received: from liangshenlin$eswincomputing.com ( [10.12.96.90] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 11 Apr 2024 15:24:09 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.90]
Date: Thu, 11 Apr 2024 15:24:09 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Shenlin Liang" <liangshenlin@eswincomputing.com>
To: "Eric Cheng" <eric.cheng.linux@gmail.com>
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, 
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/2] RISCV: KVM: add tracepoints for entry and exit
 events
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220420(169d3f8c)
 Copyright (c) 2002-2024 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <40a8d9d3-20a8-44e8-96d2-0dcd8627cfc8@gmail.com>
References: <20240328031220.1287-1-liangshenlin@eswincomputing.com>
 <20240328031220.1287-2-liangshenlin@eswincomputing.com>
 <40a8d9d3-20a8-44e8-96d2-0dcd8627cfc8@gmail.com>
MIME-Version: 1.0
Message-ID: <607ba9f5.2876.18ecc0ae30d.Coremail.liangshenlin@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgAHGrwZkBdmlBMGAA--.3617W
X-CM-SenderInfo: xold0whvkh0z1lq6v25zlqu0xpsx3x1qjou0bp/1tbiAQEEDGYWXM
	cg8QAAsy
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_002601_793444_4A75AADD 
X-CRM114-Status: UNSURE (   4.58  )
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

On 2024-04-10 15:12, Eric Cheng <eric.cheng.linux@gmail.com> wrote:

> 
> On 3/28/2024 11:12 AM, Shenlin Liang wrote:
> > Like other architectures, RISCV KVM also needs to add these event
> > tracepoints to count the number of times kvm guest entry/exit.
> > 
> > Signed-off-by: Shenlin Liang <liangshenlin@eswincomputing.com>
> > ---
> >   arch/riscv/kvm/trace_riscv.h | 60 ++++++++++++++++++++++++++++++++++++
> 
> Conventionally, it should be named to trace.h, especially if only one. Refer to 
> other arch's.

Thank you for the review. I will send the v2 version.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
