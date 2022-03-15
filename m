Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83060C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FA7zSrWEf26s/RT4I8l/Df6J/zfRiX2mKGhBfkoMueU=; b=MITWXoVvOPdIY6
	yOdq3bEvQcGhwlscOmKd6d0wIbk64OTkQw2qGUggUiAeNwWxYtJ0bx1tCkVmblAfiA9CwPzcfLDkl
	cUyrzaT5kI4a5qTE9g0qSCYyYTF4GQ2yDXAYN8Z/pEUYsKP5w21h8lI9EX3j6hqONSr/ykJQ3Rcdu
	3nZMIZgToFAdMFrUy0o5gQtKMDlV2J5hxWiOVHW4DAGJEeamjobndEVCuFk2I8LDQGy+cC/UFfz3v
	AH3coyF0bQZoSUsLwnIzd/o0vizBIdPdKfiEevBVYg4w092G24NC79oY8XFol1665UcQI8VoOD1Ax
	2ldByBFHe1wXODOE3n+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUApd-00A32C-4c; Tue, 15 Mar 2022 17:19:37 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUApQ-00A2yq-PF; Tue, 15 Mar 2022 17:19:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B8D01474;
 Tue, 15 Mar 2022 10:19:21 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E2273F73D;
 Tue, 15 Mar 2022 10:19:17 -0700 (PDT)
Message-ID: <68df2f49-9b74-7ea2-0178-be55824b3c89@arm.com>
Date: Tue, 15 Mar 2022 18:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] sched: dynamic config sd_flags if described in DT
Content-Language: en-US
To: Qing Wang <wangqing@vivo.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira
 <bristot@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <1647331137-69890-1-git-send-email-wangqing@vivo.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <1647331137-69890-1-git-send-email-wangqing@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_101924_898794_86F1E268 
X-CRM114-Status: GOOD (  12.35  )
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

On 15/03/2022 08:58, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>

(1) Can you share more information about your CPU topology?

I guess it is a single DSU (DynamIQ Shared Unit) ARMv9 system with 8
CPUs? So L3 spans over [CPU0..CPU7].

You also mentioned complexes. Am I right in assuming that [CPU0..CPU3]
are Cortex-A510 cores where each 2 CPUs share a complex?

What kind of uarch are the CPUs in [CPU4..CPU7]? Are they Cortex-A510's
as well? I'm not sure after reading your email:

https://lkml.kernel.org/r/SL2PR06MB30828CF9FF2879AFC9DC53D2BD0C9@SL2PR06MB3082.apcprd06.prod.outlook.com

You might run into the issue that individual CPUs of your system see a
different SD hierarchy in case that [CPU4..CPU7] aren't Cortex-A510's,
i.e. CPUs not sharing complexes.

(2) Related to your MC Sched Domain (SD) layer:

If you have a single DSU ARMv9 system, then in Linux kernel mainline you
shouldn't have sub-clustering of [CPU0..CPU3] and [CPU4...CPU7].

I.e. the cpu-map entry in your dts file should only list cores, not
clusters.

I know that in Android the cluster entries are used to sub-group
different uarch CPUs in an asymmetric CPU capacity system (a.k.a. Arm
DynamIQ and Phantom domains) but this is eclipsing the true L3 (LLC)
information and is not "supported" (in the sense of "used") in mainline.

But I have a hard time to see what [CPU0..CPU3] or [CPU4..CPU7] are
shareing in your system.

(3) Why do you want this different SD hierarchy?

I assume in mainline your system will have a single SD which is MC (w/o
the Phantom domain approach from Android).

You mentioned cpus_share_cache(). Or is it the extra SD level which
changes the behaviour of CFS load-balancing? I'm just wondering since
EAS wouldn't be affected here. I'm sure I can understand this better
once we know more about your CPU topology.

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
