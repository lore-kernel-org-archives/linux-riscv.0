Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0502CC47087
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:50:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA8B6127C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA8B6127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo7QLhVV2fS4qVd4jyaDM40cr6unk04UYZcL9kKyrzg=; b=O+yhC0cAv7PQXbl3L7UQ7OHYHf
	MAFQbBbXPJxH53EE0rZKprpRnaSLBhbCe6Ilypl7Et31uhnMW7uItYK7C9KYEZICz7KUT6rmuENc3
	GNvQe4op7aDbmCgeXn5hEYs7+1e3GXi8hjzQN+0OegUopkyADRfRbwFsGWByWq6wCtqknV3joYo5h
	nHdqPklrb0ICZoHHAEIzehtcs/1O9knss74n9+ULI7wsv2j+MaYxPjl0YPCYxS5WPWtgt+H9grA7p
	m4w4nNpAU4/63IioNV0smcimxZeDwAUwaQxWWEbP1/EAP/kjRNaaC7GbPC4cHe0TLlMjhPMdCmqn+
	NLbH/6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYCH-00DaL7-C5; Fri, 28 May 2021 08:50:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYCD-00DaJS-WE
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 08:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622191820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxfRkJBqDM+ehtRzyYsxakbKozrQTr9r18WHQNGUnHI=;
 b=g0g2LnwzQZpqA/z3zMvjIf3nvvQ3mU/2ASTLnt4J2WMuhDB3q1aI+ajFzaj6l2T90JRwG6
 Ai9cGe/Pf7BsX1eFDjrXFv/S8FF8kAT3NZKv5AkxxmRYPR0HajLEiahpN/pSed34dHmATf
 dCVNBoLE4zdFLHWXJ0tsdJaEpK3cico=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-PrZ1M68LP4aFZRwc9rBWBA-1; Fri, 28 May 2021 04:50:16 -0400
X-MC-Unique: PrZ1M68LP4aFZRwc9rBWBA-1
Received: by mail-ed1-f71.google.com with SMTP id
 c21-20020a0564021015b029038c3f08ce5aso1783851edu.18
 for <linux-riscv@lists.infradead.org>; Fri, 28 May 2021 01:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BxfRkJBqDM+ehtRzyYsxakbKozrQTr9r18WHQNGUnHI=;
 b=cWUn/66W3M8V9C/isSg0tLSMcwOqFAg2+VbCI2EYuZkgbgfQucXkmlvakB2f7VHHTk
 LQ69Kgi7pk5eKQ50/2qaMIildmh4ethIpPHoJ86nUnYE9wSEdkx9wShyoSJA8VCZHm7c
 XTHby4I7akmf2dQ5giQXY5pweKS33SshzMMNmZRd+O6An58Jgp/6n/nrQ54RnTM1rdH2
 DC44FvcqaqsZuJ99YhXOOtxpn2v2M2og3kxD7zlKwjMjEJs+YMM+/QcVnD+icSllOzZN
 TTsno15wnmWNONU3+cwdOak7kyrXh+1mLrgz9YNw2+dCCXdDjL8mWvnmhyhnDEVL7CKn
 CEDg==
X-Gm-Message-State: AOAM532WKTgk1NT8QHfKlcEpUyIWymYjLWrgOnDvg1tXFAyxF89w6YLD
 SHsnYcnQwxFaZ+msexygjUxruITRJoMs5vokWds+lKW1pWWIqQoYkBNkGzNTAcPuNjN6fIb3wUV
 tsvZudwQDmXWjkkCr/lm8DedSX25Z
X-Received: by 2002:a17:906:6a93:: with SMTP id
 p19mr8071862ejr.319.1622191814621; 
 Fri, 28 May 2021 01:50:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkNqHbKGdWkDbteEVKP5Rd6bMLXGpKmQQ0cZ3/U71RXisXkQunWox4o/qq3dM20ra8LgFl7A==
X-Received: by 2002:a17:906:6a93:: with SMTP id
 p19mr8071847ejr.319.1622191814457; 
 Fri, 28 May 2021 01:50:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id y14sm66310ejq.102.2021.05.28.01.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 01:50:14 -0700 (PDT)
To: Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: arch/riscv/staging
Message-ID: <5e2d3de6-31a6-98e9-6f82-dc81a64da631@redhat.com>
Date: Fri, 28 May 2021 10:50:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_015022_154262_B27F5448 
X-CRM114-Status: GOOD (  16.03  )
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

On 28/05/21 03:06, Paul Walmsley wrote:
> Earlier this year, there was a post where someone asked on the RISC-V
> International lists whether the ISA architects were ready to freeze the H
> extension:
> 
>      https://lists.riscv.org/g/tech-privileged/topic/80346318#465

That someone was Anup. :)

> Many of the same points were made that you and Damien and Paolo have
> brought up on the Linux kernel mailing lists.  Two engineers working on
> the RISC-V ISA responded, representing two different companies.  They
> wrote in the thread above that it's "far from certain" that no changes
> will need to be need to be made, and that "it's a good (and necessary
> compromise)" to "[wait] a little longer to see [the AIA specification] at
> least stabilize".  So it sounds like there's still a diversity of opinions
> here.

Quoting from that thread: "So, in my own opinion, we're getting close. 
Not a few weeks, but not quarters either".  At this point it's been a 
quarter and no freezing is in sight.  The author was even pushing for 
stabilizing H together with pointer-masking, even though pointer masking 
is basically being developed with the assumption that H goes in before 
(it already includes CSRs like vsmte, vspmmask and vspmbase).

At this pace, I would be (gladly) surprised if the H extension is frozen 
within the next 6 months.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
