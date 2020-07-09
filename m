Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3B3C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 22:07:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA6B5206A1
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 22:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YaGLUoDJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="s0JZ5pO/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA6B5206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=psWajta4bz2NqWrjh2Nh54b7ybdRzXlRBS+gPSwBHW0=; b=YaGLUoDJ02VqCqIs7Pr9Vyspm
	LGcH3jVL0hDDxyINDNZwRWI4JIRuyOISRChwYHVCyQ2PFg8kwqNGBWuVaJzl9+3LR+ztLN7UNvaxO
	/38qWEP+/xHEvmyiNrusmbm9HjEa3Lq1HqtOHU+QzekoWqLB9dVSnw848ecCrsSqEqBTdDTJv4/f3
	683+lzlzNqgV7h2/yJ6egwvTw7841iE+/iHGb0tP/0a37KinjXIgs6Wm8WuMKNPe4dIkO1r711xX3
	5nLNqkzrXZwvIz447LLbPrylMblUCbC4ngW+fXrJjwMw5wgeCxcfi11fin1AOqasd3On/KTMB3xKN
	fWg0dyXlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtegr-0006cu-SG; Thu, 09 Jul 2020 22:06:49 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtegp-0006ba-Je
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 22:06:48 +0000
Received: by mail-pj1-x1044.google.com with SMTP id cv18so3757346pjb.1
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8CK0I8zJbGlH0rJDFXmQvv5rpjqRFDp888sWR1bVovw=;
 b=s0JZ5pO/GZ7fXyqQDzDmx8kuDguwspLqorvrH+OdYjBFl/uCF0Be7BpE7WGfgBRcen
 4Htj9cQoZMRn4Z3ToPS9QIEmkfghneRkevOktoFcG7CLk7KCwN8ZyJsceZArCZZB7TBu
 IGhyyBu38L+7+mARgarW6v6rqsVnMQKlVY45ClkQpAPr/4D5jgxo9kTmKcVSn9RTkkYL
 eMsOxA2kaMLQ5LTNrvMTzqstPrtXoLW2AAoozhtuV31v0esflicl6y61CUlNWmJc1oxj
 Zt/saYZAe1nU4NqGrqLWw5l2dmiBQix+rIP2lxS/8JIODBlTgY7VEUtpa0VT92815QnE
 1+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8CK0I8zJbGlH0rJDFXmQvv5rpjqRFDp888sWR1bVovw=;
 b=p/z74z0Q8Ex+kFWNlhyApfc5IYC+kOjahlXhu7OXmll9NqnhAmROQPzUtgB53Pvc3D
 GiWTuqVkXFXARPijpHdbGV5NGw3/eviZ8TksPwgQ1WSw3iPGjkmx6vNJy9r7N8cQIX1F
 /I1EiK51WfNW2BCSlE1LHQdVVlqF1nipRmUNZbmY7u7Hko78CzM+jvvU33l76euqfdmH
 n+2LG1IUZPAVFXPxXbzXpNPH/0LVuhLFHiIIk7SF6SomEESDPOVe3R03D/qdex5R77It
 BgQmZa5W/o7eZKFNI3+qHIc0TLFifuyRt5OnYErwXys4mBNrcPIa1VR+ESYUpwX7O2X4
 S+6A==
X-Gm-Message-State: AOAM530xY/mqoHzRL69wwQDxBZZmmSiekk5PMXDSRf8yZmM0pZQekWZc
 JVQpmpCjpcWIs70kKffZ7Hysaw==
X-Google-Smtp-Source: ABdhPJyR7Siu7Y/A4iQg3bBo7ftXxCV5V8bWZODguKGhUXjoYZ4xnZ1Kn21deuob8QYmEuB9LYfIOw==
X-Received: by 2002:a17:90a:2367:: with SMTP id
 f94mr2400859pje.20.1594332403444; 
 Thu, 09 Jul 2020 15:06:43 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q20sm3875614pfn.111.2020.07.09.15.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 15:06:42 -0700 (PDT)
Date: Thu, 09 Jul 2020 15:06:42 -0700 (PDT)
X-Google-Original-Date: Thu, 09 Jul 2020 14:48:00 PDT (-0700)
Subject: Re: [PATCH V2 0/3] riscv: Enable LOCKDEP
In-Reply-To: <1593266228-61125-1-git-send-email-guoren@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-af022fcc-7dce-4d1b-9204-d31241538412@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_180647_666772_A92A3A48 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: tycho@tycho.ws, aou@eecs.berkeley.edu, nickhu@andestech.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 guoren@linux.alibaba.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 27 Jun 2020 06:57:05 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Lockdep is needed by proving the spinlocks and rwlocks. To support it,
> we need to add TRACE_IRQFLAGS codes in kernel/entry.S. These patches
> follow Documentation/irqflags-tracing.txt.
>
> Fixup 2 bugs that block the lockdep implementation.
>
> ---
> Changes in v2
>  - Remove sX regs recovery codes which are unnecessary, because
>    callee will handle them. Thx Greentime :)
>
>  - Move "restore a0 - a7" to handle_syscall, but if _TIF_SYSCALL_WORK
>    is set, "restore a1 - a7" is still duplicated. I prefer a C wrapper
>    for syscall.
>
> Guo Ren (2):
>   riscv: Fixup static_obj() fail
>   riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT
>
> Zong Li (1):
>   riscv: Fixup lockdep_assert_held with wrong param cpu_running
>
>  arch/riscv/Kconfig              |  3 +++
>  arch/riscv/kernel/entry.S       | 33 ++++++++++++++++++++++++++++++++-
>  arch/riscv/kernel/smpboot.c     |  1 -
>  arch/riscv/kernel/vmlinux.lds.S |  2 +-
>  4 files changed, 36 insertions(+), 3 deletions(-)

These are on for-next.  As far as I can tell lockdep is working, but I'm just
doing some simple boot tests.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
