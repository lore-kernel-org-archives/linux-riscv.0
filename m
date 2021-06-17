Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F79C2B9F4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 03:59:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EAE061026
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 03:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EAE061026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDRGsRvPOESJ3tDvNYVLvL31RXL8wvapouvq70qsKqY=; b=XsBIPuQuSTnKai
	gkKFzz47H5xbp0ffFMCSsBf125qMebZ48VzMei1IpTNTPamOdH9jLcnvXp+GQd+smnQpbS3hsCarD
	TETKEOybkWEwxeP2N45N+38iKe8RmyUb6coagkPlttXXhIEWJyoo3uKrfWo7JV/u2QxqeSe6Qri7X
	dWKEzDLq3tugsT/rALq5PL6UGVyNv1s7cLz9rxSQwEAyJk88MDuJ0vufMxx+1tN534YG2jhENP9Ap
	hvqciqJ9o4BCsIYRSVx7Wb0+wMz5sCt09kK3DWlEF/mhOiwg86zb1WpAjein/X0HCKVsd42siEZSC
	rhXTmmTg3GNKNm6V8MZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltjBN-008h8N-59; Thu, 17 Jun 2021 03:59:09 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltjBJ-008h7k-WC
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 03:59:07 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so965966pjo.3
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 20:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a5D+ny1Y0c3O7KxzHuyI+M5mGXvaRgQ84CvvtncVlG0=;
 b=fRcFPkiIxPDt9py7J1PQBOFWa8GEY8lHPvIBnBm1ce3CL3iHZHu/UZCEhEGJOVVCaA
 VHKOkUgSyIJQ2Ruk0A2HflJ0G72K5plXNdgLkY4e1ZUcxSzfYUKbwM5q0pG5lNePiwOv
 7FXxll2wYUEI85aVEsP19np7Ju9bEl8kDfsr25mfOtrQe07owDGhAhZzToqNsjeA/IPH
 E+9IHrMS1E0RR1+reFfHNJI5ouyJ2XoNtLzW9AM3mUdmwZItucn/6F40ftKaCGJEwq2c
 uQOFRr7oRd61zssn2NtqMyTC3iNCwKJ7UXnmUrPPz521WtPzXyoeZj+nlHxs99HDqXOZ
 4nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a5D+ny1Y0c3O7KxzHuyI+M5mGXvaRgQ84CvvtncVlG0=;
 b=TQ0cxvZzQy2pdaCDVqpVmBQeycFiKtPtCQkaly/G610PNR3221qefqNbe3dCD+Dc8S
 7mYWhi/AkpOIah30ATrRhHJ3B7eeo8ZZu/dHLhH6q5Ks7sdvjoJZOj39Ueyc2Alf7qe6
 gQYOk8ecXRyq3/b2hVDQf5ywk5AX3rC+BA07tQwJ87xrG2EqBioMWyiAtnmE7MxUMX+K
 8dsRvRmGlpbBH/+mdphup32ZWkQldrsQcj/gRxwrDJzHwsSDd39onu1RzjuRrek7R7md
 niAgXV9nCez7b7h3yilbjYxh0Pj5e3yj4tolER5jjQJZhypMLZnF7PYutNWpkkEOB/aJ
 Oh7g==
X-Gm-Message-State: AOAM531FF4a9CaT55028KV88gAOVgRdssjev+rqNthJRQAOo9whb7iNE
 HDyv03yFj8NkyoaOsRGOuJvdtg==
X-Google-Smtp-Source: ABdhPJyK8z8cdDdyBhx0CBSqDGBDOEf/ee2crujfR5xEIC5Ea+opK/+E62HCRvXJLb044uPARRa9xQ==
X-Received: by 2002:a17:902:8d97:b029:113:d891:2ea0 with SMTP id
 v23-20020a1709028d97b0290113d8912ea0mr2678159plo.61.1623902343697; 
 Wed, 16 Jun 2021 20:59:03 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id j10sm3388366pjb.36.2021.06.16.20.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 20:59:03 -0700 (PDT)
Date: Thu, 17 Jun 2021 09:29:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Kees Cook <keescook@chromium.org>,
 Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Bill Mills <bill.mills@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20210617035901.kfzps6kg2emthjf4@vireshk-i7>
References: <20210616114934.n3grzuh6c64wlaj6@vireshk-i7>
 <5cffb354-0d00-5ace-260d-61ac0c4c7491@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cffb354-0d00-5ace-260d-61ac0c4c7491@metux.net>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_205906_111335_437D314E 
X-CRM114-Status: GOOD (  14.66  )
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

On 16-06-21, 17:04, Enrico Weigelt, metux IT consult wrote:
> Half correct: I sent it to the list, but this wasn't tex'ified yet.
> 
> When we had an email conversation about this, it was about submitting
> the existing spec in a formal correct way. Don't get me wrong: I
> apreciate that somebody's doing the beaurocratic work. But still have
> no idea why you changed it completely, so there's quite nothing left
> but the name and that it somehow does gpio via virtio.

> The one I've resent (now texified) a few days ago. It had been submitted
> in ascii form last year. The answer from virtio TC folks whas that there
> are some formal steps to be done and it needs to be patched int their
> tex document.

Okay, we figured out now that you _haven't_ subscribed to virtio lists
and so your stuff never landed in anyone's inbox. But you did send
something and didn't completely went away.

Since you started this all and still want to do it, I will take my
patches back and let you finish with what you started. I will help
review them.

Please start with specification first, and resend them as soon as
possible. So we can start with reviews there.

Also please cc relevant people directly, like GPIO maintainers in
kernel and few more from CC list of this email, as most of these
people aren't subscribed to virtio lists, they will never get your
patches otherwise. Lets get over this once and for all.

> You sound like a politician that tries to push an hidden agenda,
> made by some secret interest group in the back room, against the
> people - like "resistance is futile".

:)

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
