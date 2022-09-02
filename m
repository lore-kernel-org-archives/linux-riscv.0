Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04BEC38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtdA9WjSspBqkDj7/ukqgoMP9yZVuKrH5QJFHjnPVNA=; b=QgYz7irV63odv+
	GQJAKQdBlI9msY1TlTfgFJJTVKl3qdKhKYNlQQtmQwCLU70gRY5ZIPcXNLY0XQepBh+lBB5XmTPlz
	+MUBfX/Q9EFYxVKQGvUUTQ8XbWnYUl9381VD8lertNI/kVQE2xRTI+3spTCJHEOo+5YOPt2ouxBZU
	ycO8aho9XdAh7CUhoSo1GaX4xDkigjDBzdDNgDuAsYT0lwbcz1vRbDv7tE2a3r7nNQ1JQ/uMqabfZ
	0fF25P9670BHcY4iMG/Lnx0rVa6mxp8LJ049Pl1gi2PxEDpuNm4ZgN9Ol9hwcwYPZGV+Vqhy333yX
	UGmAAwpxRbMhZMLLnUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6Zf-0051VJ-V9; Fri, 02 Sep 2022 13:19:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6Zd-0051TO-NC; Fri, 02 Sep 2022 13:19:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A123CB82AA0;
	Fri,  2 Sep 2022 13:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF7EC433D6;
	Fri,  2 Sep 2022 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662124742;
	bh=jWqEiknW8RwuhPMRa9jUaXySZbEvtLL9Yky5wfGrb2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgrtUwKx+JuYZ38FAteb2DXrh+F0UcLIBdeuhxvNzY5928n8PaIpn3q77LQr4qCHL
	 ufuqPYJNK9IxEECrIo0oKB6t1lyEmwqfhyB4eDr5bn+es+0oJke7lZFF1ZXH3DxMyY
	 eR7T4NUy7Lv9wastzberTfJtkNnCLDlUd29Z/inInUQL3oml7lkiiBaipHfRjBqYoB
	 YFHOafnNmeDDW9Ef91fmX+d6UrPVV/IHWmE1zYbSzyjALYyGa97QhOaK5g02MlA7y5
	 nd14HhDgvbWcRNQAhT0iHCoQj5xW5IeqcEyqAR27avB13lk8S5QgWQ21yVWlvnIQMV
	 HDrED6OjVQgew==
Date: Fri, 2 Sep 2022 21:09:45 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	anup@brainfault.org, atishp@atishpatra.org, bigeasy@linutronix.de,
	tglx@linutronix.de, rostedt@goodmis.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Message-ID: <YxIAmT2X9TU1CZhC@xhacker>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_061905_919762_69FBBA6F 
X-CRM114-Status: GOOD (  18.43  )
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

On Thu, Sep 01, 2022 at 04:41:52PM +0000, Conor.Dooley@microchip.com wrote:
> On 31/08/2022 18:59, Jisheng Zhang wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > This series is to add PREEMPT_RT support to riscv:
> > patch1 adds the missing number of signal exits in vCPU stat
> > patch2 switches to the generic guest entry infrastructure
> > patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
> > RT
> > patch4 adds lazy preempt support
> > patch5 allows to enable PREEMPT_RT
> > 
> 
> What version of the preempt_rt patch did you test this with?

v6.0-rc1 + v6.0-rc1-rt patch

> 
> Maybe I am missing something, but I gave this a whirl with
> v6.0-rc3 + v6.0-rc3-rt5 & was meant by a bunch of complaints.
> I am not familiar with the preempt_rt patch, so I am not sure what
> level of BUG()s or WARNING()s are to be expected, but I saw a fair
> few...

Could you please provide corresponding log? Usually, this means there's
a bug in related drivers, so it's better to fix them now rather than
wait for RT patches mainlined.

PS: which HW are you using?

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
