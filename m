Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C65C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 19:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXm/iNrRZ27KXsL5fAvE1xwDsGmM4lXezB20gJzqAFA=; b=N2NoEgerjWuma+
	IYolMB2/oLIVyuX2XcxU5f93ItkjwFigcpIaEGBMCASqkDqr+qckUH2ubDbZTqHHTym2cUNmxDzpU
	TjsIXatWgGnghVShGUcSVxCaBHuJrI3skaM4cIHJaN5vUKPklowiVIaHMXw9A1p4xzVRLVeodfBXl
	Bsk8lc/rJqBWjYmkTPN7J3FTchFd0uer40bVdN6JI29/9W/CzHW1+AbAIO3U2utxDy/fYdKoFSTSl
	/iIxY75dCHXQs8xe3YuajTHXBwIS4eEDuuyue1uutylcb4z1ccxmCza++pKudIUwJHWbkWRSXmpIZ
	J9LNj67YG7jd8x+/+DaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAaii-00000009j5k-07bQ;
	Fri, 24 May 2024 19:36:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAaiP-00000009iqX-3cpP
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 19:36:50 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716579390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iyBt2ECzfVmFCZHLo5ZC95DN7e5Ms+svFwknAIN23AQ=;
	b=3WD9/WcC2NxMMIC4HZU1cBqAMMWsNLq1yOqBP888RkF3HxgY/j3QNoZM7ziMvg4bJ5JIbo
	/iZNFONV+nHh/8Hc55z9oOv+bqtJCDDkazvqULpQlN//8yXwV17ZUfNAGK0Q8ooklA3HTI
	YBQ9GL8sQN76jJThK+hzui0WmnmTwLIQscgpeYofbZYRl6zVHjkey78ekK/0NNu5R0JpBl
	jIhG/xpopaoQU0iu0G0sO5sVwO07HRqW4A8GA3dEkZIPRDgqUNRrki31o/9OHV8jbOJXsf
	I63DGyHGAiq7EV2PKwQU6u4M5SxNpAQ5UsqTAwVP32/VTGN+O5E1Dhnd55Tp/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716579390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iyBt2ECzfVmFCZHLo5ZC95DN7e5Ms+svFwknAIN23AQ=;
	b=qU+VxrMOzqTSj/kFZ90TGVWqWp4Dia3K5914XJoI7iPg7S5xAo6c7RH8CM2kx9BKYgCkwn
	9H0wFxPovVYtPqCg==
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux@roeck-us.net, Conor Dooley <conor@kernel.org>,
 naresh.kamboju@linaro.org, linux-kernel@vger.kernel.org,
 lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
 linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
 anders.roxell@linaro.org, dan.carpenter@linaro.org, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments
 to function 'riscv_ipi_set_virq_range'
In-Reply-To: <mhng-44d7a1c7-c15a-4077-ac94-23985f686474@palmer-ri-x1c9>
References: <mhng-44d7a1c7-c15a-4077-ac94-23985f686474@palmer-ri-x1c9>
Date: Fri, 24 May 2024 21:36:29 +0200
Message-ID: <87y17zc88y.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_123634_190075_C45051AC 
X-CRM114-Status: UNSURE (   9.80  )
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

On Fri, May 24 2024 at 10:35, Palmer Dabbelt wrote:
> On Fri, 24 May 2024 10:18:42 PDT (-0700), tglx@linutronix.de wrote:
>> On Fri, May 24 2024 at 08:10, Guenter Roeck wrote:
>>> On Wed, May 15, 2024 at 10:05:59AM -0700, Palmer Dabbelt wrote:
>>>> as a conflict resolution, which IIUC should happen when Linus merges my next
>>>> PR.  So I'll try and remember to call that out.
>>>>
>>>
>>> Unfortunately it looks like the conflict resolution did not happen,
>>> and mainline builds are now affected.
>>
>> Fix is queued and goes to Linus tomorrow.
>
> Sorry I misesd this.  The PR I sent Linus this morning contains my fix 
> from earlier this week: 
> https://lore.kernel.org/linux-riscv/171647463438.13050.6219786365640043025.git-patchwork-notify@kernel.org/T/#t 

Happens. I don't rebase my try. I just mention it to Linus when I
send the pull request. It's the same change so the result is a NOOP and
not another conflict :)

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
