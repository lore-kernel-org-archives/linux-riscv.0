Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86743C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF5A610E5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FF5A610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=w1ZSQ1S++P7aZFoo87s5D6ygnBEXysJ/7Rui29thbW8=; b=N90xpshV2fBjxPTkt9C0Z1s0sL
	/H/t8YNcZJ7otcnJ5y8lo8LBLq0sf/9DaGlUUKar9HBZj3fF8i0M4MJBYyx19uLz6jg4cyMXzsGir
	2WjySocyJSlJMs8rQV29wQTuVdOj2pC2yZ0lk1SRVjdbMay1KWiNtR0CM0kRSal3PiNRJATTPxlaz
	2cIk0/NxB/iCoshLJLY/XNzmwIEgujjtUaSgcWqbYu86wge27a7SDLaBaHyMEDpzfBofbNryXSwhI
	F4o9U0VSFCcYGi4Xz95pFu3/YTUsjz38QePK9YIt3t5HnuFC6oDEsMlD7CoPgV5APz6ff8zuHHwTV
	lagt18YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA02-00F1we-17; Wed, 06 Oct 2021 16:42:34 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY9zz-00F1vd-HK
 for linux-riscv@lists.infradead.org; Wed, 06 Oct 2021 16:42:32 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so2786443pjb.3
 for <linux-riscv@lists.infradead.org>; Wed, 06 Oct 2021 09:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6XDh7yWZOSqxph58yZ7yxsuGpqrzehlka27pGjt8ehg=;
 b=OOHOSQWNf8wMGc+y8ytJyhXUzAJbHJK07BJHvFfEwQDc/OplncP12q7x7fjy4t9KOj
 maK6QT92Aw44FZ7MOmwaC9yaQi51dClCBmhLfuPGNP1JZR1QtvfoksPmdIecZRpAht60
 DW9iY7ZFQKncjvLIOv8DMm44/c+H5hK0DEvK2KQbIKahl3i4p2lDLiWb9vGWV1QIjtwv
 jdWxY4ajWqguztQqo2hNQHcypPsXyJhAfKDC1F18pq2UYXGPutCxzjcw3XxPspsSgpje
 PScDXxvTz1CPBhYhGMaxVWavKtZY5+zTDO265lE+H7ZbRe7tMiMFF2KTOJnSLqb9azZe
 VrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6XDh7yWZOSqxph58yZ7yxsuGpqrzehlka27pGjt8ehg=;
 b=H1gWdF87DrFJL1v6iDpStphPR9QtEefIyr/PT3sJKu+cVrtTg97DmpoQGpY2mrscEv
 iWvnbBGP9DXmQRyEhdJeiCPw/eznSLnxEOmnncHgb6QKG8YxacXDRCVIGFlVH0p7IxI6
 2ao/S7c55QF8ERql2L1x4LOKeKo0y5382foCF6qwYoVbZ2BOqOY6CfbJljTmJJwm8dpo
 SGXacuF1S1rWzT2u5p43EIuekOB9PBy8LCbaPQ9sMMGqQ00f89de1OhecgFfMhab0d7q
 WkDi6CRjjqpd5G8tNIgEBPGpaYmHbN6p/gYxJD5MbvbWU6WWMrPIwG4tfMCmmnDJ6fZN
 Azhg==
X-Gm-Message-State: AOAM531rPIZLh55p9v3yJMH0WSOdGw1TaQTTGmFlPFsx7ZabFgU2E/vt
 RCN8kXi5k6buIUW9kLAIC3DunQ==
X-Google-Smtp-Source: ABdhPJxmKjFnl8ryjupIwAwIO54j4F/2ixuTRTwSQLU519pIpe21f0fEGVSwKkQjEzNjY54Sdqs3dw==
X-Received: by 2002:a17:90a:6c97:: with SMTP id
 y23mr12010887pjj.117.1633538548992; 
 Wed, 06 Oct 2021 09:42:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id nn14sm1870292pjb.27.2021.10.06.09.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:42:28 -0700 (PDT)
Date: Wed, 06 Oct 2021 09:42:28 -0700 (PDT)
X-Google-Original-Date: Wed, 06 Oct 2021 09:42:06 PDT (-0700)
Subject: Re: [GIT PULL] KVM/riscv for 5.16
In-Reply-To: <82568eff-1eff-5e63-4264-ef0c25f79fc3@redhat.com>
CC: anup@brainfault.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: pbonzini@redhat.com
Message-ID: <mhng-03b25a51-3491-4bb7-9e17-1b32fc97b7ff@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094231_597097_E3BCDF4F 
X-CRM114-Status: UNSURE (   7.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 05 Oct 2021 01:25:41 PDT (-0700), pbonzini@redhat.com wrote:
> On 05/10/21 09:55, Anup Patel wrote:
>>    git://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.16-1
>
> Pulled, thanks!

Thanks!

IIUC how this generally works is that you pull these KVM-specific patch 
sets and I don't, which means they'll get tested on my end as they loop 
back through linux-next.  I'm fine with however this usually works, just 
trying to make sure we're on the same page as this is my first time 
being this close to another tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
