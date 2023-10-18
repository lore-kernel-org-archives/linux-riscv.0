Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B59CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtA1mSfS4I3ZEEKeNcbv8HzeHGlICy18LIZTqLWAt0M=; b=yz7nlk4Bb/kuwa
	daLpxzbVd0q/Pku+kSB81UsD9oojfdHdBfXbo1WM0ePXGMEIwGCgeebPHrtSX4/T+ktgIws0EtnkY
	6gaZnHrKU5SkQLhTNTKMyjPuo1x4zR9AWJUaZC2ghzVVO/8ifJPt5UVeCp7ut7Ov5f81UxyvaVbRE
	nt1Sef4kIw/jz2RnR84ZR+fMfIER5g8XXV10Ejhu2Qj+EAfbKZIw12zHVPz93wOAZo2zdFXD2ep2f
	cJet0kPhqOaXSbN6CQpoOoaQYxvfbDeyARS3fp/Wdn7kHkwo9tReF5mSo5cxjiI5R4WZt28RRgGB2
	32AbdkwBHVMtGbfwuc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4hq-00EXuz-00;
	Wed, 18 Oct 2023 11:27:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4hm-00EXtL-2s;
	Wed, 18 Oct 2023 11:27:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB33D2F4;
	Wed, 18 Oct 2023 04:27:51 -0700 (PDT)
Received: from [10.57.81.189] (unknown [10.57.81.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D9053F762;
	Wed, 18 Oct 2023 04:27:06 -0700 (PDT)
Message-ID: <688adbc9-6dbc-4c98-971e-630525ff003b@arm.com>
Date: Wed, 18 Oct 2023 12:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] consolidate and cleanup CPU capacity
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com, bsegall@google.com,
 dietmar.eggemann@arm.com, peterz@infradead.org, mingo@redhat.com,
 rafael@kernel.org, sudeep.holla@arm.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, pierre.gondois@arm.com,
 ionela.voinescu@arm.com, viresh.kumar@linaro.org, bristot@redhat.com,
 will@kernel.org, catalin.marinas@arm.com, linux@armlinux.org.uk,
 ajones@ventanamicro.com, lftan@kernel.org, gregkh@linuxfoundation.org,
 juri.lelli@redhat.com, rostedt@goodmis.org, mgorman@suse.de,
 vschneid@redhat.com
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20231009103621.374412-1-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_042714_976025_7D852B01 
X-CRM114-Status: GOOD (  11.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/9/23 11:36, Vincent Guittot wrote:
> This is the 1st part of consolidating how the max compute capacity is
> used in the scheduler and how we calculate the frequency for a level of
> utilization.
> 
> Fix some unconsistancy when computing frequency for an utilization. There
> can be a mismatch between energy model and schedutil.
> 
> Next step will be to make a difference between the original
> max compute capacity of a CPU and what is currently available when
> there is a capping applying forever (i.e. seconds or more).
> 
> 

I have tested the patches apart from the last CPPC because the platform
didn't have that. The EAS is working OK, so feel free to add:

Tested-by: Lukasz Luba <lukasz.luba@arm.com>

apart from the patch 6/6 - with the cppc changes

Regards,
Lukasz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
