Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B014AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 23:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 495A561073
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 23:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 495A561073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=B0HJ4Uf+HSEClHugaphzH2Td9PvxyvtJ4fhkDdJUjME=; b=qxbynKzl6Q8owPb5sF5wknVCGF
	+J/vvcszUG6CwEhp+/G0khmgUh2w9IdtbNBDSkvFW4pY8c7iMpJyTzbZQpjKAe0VRjLPaahb9Xp0K
	7s1gYSHa9ckQ0G+orOnUNn4ywGz3VLI+2FQcymwyx+iTXKIZAcDgkuDPubUN5+OIgqiQT+02E7Tjk
	dGlE4XDfJwobDBsShyhgIx3YUgB4Wsu9qSbBCWYGCR4eono+efvzkoCVTG6GqenkwFmddQnrd4YS/
	uFAx9Y+q/3BhiIo79lKIKwS5pFuXl0S/m439bb0nkwPfSDUFDnlW15/Cq9I5INCY0K4iiynlMy2U1
	71eYprdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlfil-00BtoA-BX; Fri, 12 Nov 2021 23:12:35 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlfii-00BtnZ-FD
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 23:12:33 +0000
Received: by mail-pj1-x1031.google.com with SMTP id v23so7928771pjr.5
 for <linux-riscv@lists.infradead.org>; Fri, 12 Nov 2021 15:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YN0gzQIJL08vzHcPeLEA4tfqqEc6asHK/4BMIe2BKNc=;
 b=FEajFmA/aBOXJRoP3vDCAhWw3jkkoXif6pQ1WdVLqEgBvEisui6TTXl/sow3VHj8Tv
 yOlkZSuL//dwcJlt0uyn3Xmq1V7HVJ7KuMhvPAwhAt8hDuMLkDueFUNxSvoNr60wWn1Z
 DjDO/b7Flwha8P8ycD6mibOYVhDuQz+7VrOjo99sqsDhIHwDgkUyHRGp/885vBef+vjv
 0Ps3ZcOAdUOReCbTJ7Qynx9I+MzADrmYbTrGDBxoo66m40tZJvmOZyMHSkjYEtb5sYKy
 UxRRiV5HU6z1rOSnSRl6yWPWs/5BwzxqchPtq/++YHONvJBRDy0v/WBxnk5bSs1BB7P1
 fOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YN0gzQIJL08vzHcPeLEA4tfqqEc6asHK/4BMIe2BKNc=;
 b=PIo9ok1Lsy/2b1BLXBUmCd6Sy/GQbwpaL+8SSPifvSgBwXK58h4UZgs046doK5f4B5
 l8U3Npa6m5IGeD521yGextEGTdTt/U5RYCelhElR0EGAIJQtGGzsLqo7EkFFRf6z6luR
 +O7Dzo7yiYb40XTXQC9lTkwuCCFNHnq4YXCwIwbaMsPlN2sfsH7WVm5T8E15XYcOJ9an
 rI5WRLNAxzZC/Dz9NkaZJeLjWqR9iwvL4VQhz/6LAjSHZy0iG7TNqP7QxWjKAlD+bYRk
 RQgJwU+p0GFcuEHLUT0vMb85Oqi0hcO7eEbAoxQisZD9k40e3+GbErfkWLaXdQjZLk75
 AUpQ==
X-Gm-Message-State: AOAM533BcnrQCFzQeIlbm66D7uKnlNwNT0jH3ddJ6K0BLIOwx1eFdkBm
 84hsX3xxyWazgc8c6nJ8Q/NuIWKx/qxJ8Q==
X-Google-Smtp-Source: ABdhPJxWiwrcloi7si8eaFR6sCnPnQxXQFhUG+k2OUwKTF+/eZqlwvfk+H/9ArZZhXnJPac+y8JdTw==
X-Received: by 2002:a17:902:b28b:b0:142:4abc:ac20 with SMTP id
 u11-20020a170902b28b00b001424abcac20mr12236925plr.88.1636758750688; 
 Fri, 12 Nov 2021 15:12:30 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x125sm7422624pfd.105.2021.11.12.15.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 15:12:30 -0800 (PST)
Date: Fri, 12 Nov 2021 15:12:30 -0800 (PST)
X-Google-Original-Date: Fri, 12 Nov 2021 15:12:29 PST (-0800)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.16 Merge Window, Part 1
In-Reply-To: <87mtm9rp35.fsf@igel.home>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-6cc11053-b031-4ee5-875f-fa18095839db@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_151232_599932_7B70702C 
X-CRM114-Status: GOOD (  16.93  )
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

On Fri, 12 Nov 2021 14:22:54 PST (-0800), schwab@linux-m68k.org wrote:
> On Nov 12 2021, Palmer Dabbelt wrote:
>
>> I wasn't planning on sending anything else for the merge window.
>
> Not even the KBUILD_EXTMOD build fix?

Sorry, I hadn't seen that one.  I found some bugs in my test suite when 
getting it to run on the new machines so I've got some new failures I'm 
working through, which is sort of blocking up everything right now.  
Everything in this PR was tested the old way so I'm confident in it, but 
I usually do a merge with Linus' tree and test that before sending a PR.  
In hindsight it might have been better to skip that this time around, 
given all the headaches getting things up and running, but it's too late 
for that now.

I'd like to get back on a more solid footing before trying to pick up 
more stuff -- I guess that's a pretty trivial fix, but anything in the 
build system can run into wrinkles (also looks like it was broken in 
5.15, so it'll have to get backported).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
