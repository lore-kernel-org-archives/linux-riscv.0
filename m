Return-Path: <SRS0=5v1j=RQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B54AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 20:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C78242146E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 20:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cPQCqOJ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="byJDGQjr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C78242146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGw9nggWO2Ws5wxeQ2h/0VdPIePA7LGIeoLbTE+G1ho=; b=cPQCqOJ+zdYrzg
	wlpo1iSM8i1aIgG8nVi27nfMU5AjQuIdr5YCZLbrz6lXGABRJm/X+zTNO8gs+Eums5eIGirFGip0k
	uwtST+uQQqQMjuwRrcIQypD8bkUw1mqny9Fve4lnx9j3zKehkAK3cMxguOasL5vnePXjMVHlUFImM
	gerhi/FvZY9/i/MgzGUOOppz36URaXsDX4Doer/eWdtQP6wxajezam2UjQ6VujiAqB9D62CiCf5Q/
	5ApHTFuKXc6+x/hBaauneuzw/Dl6Qy6RSitF5FnLMKV00fxiAJCERTEfJXy3nqYjcd9aIgpWryHLp
	26UNhTKMhIjZIMsdiAXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4AHe-00044S-Hh; Wed, 13 Mar 2019 20:15:26 +0000
Received: from mail-it1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4AHb-00043r-JL
 for linux-riscv@lists.infradead.org; Wed, 13 Mar 2019 20:15:25 +0000
Received: by mail-it1-x135.google.com with SMTP id 188so976746itb.0
 for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2019 13:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=dLS591FmSn4F3VCc3xhoYElnvcLS7F3TC7E+BmTu/4Q=;
 b=byJDGQjrpEO9vtaOc2EI+5lHy3ksYwmJC4WWTZwxYJiChM1lU6KjMCofpffRFIoMSK
 0lX6dtyDtYE3rntRWwh/HfrkVkFpEtgYAoPcG4olxjzYGs6MAcXpbZprDYVMHUIHM/ZM
 u3/Dgl+knlsZlz9OBOGBT3gVuNWlT8ZDmOqaXgf+LbebTtsnpYC0/Q5L7dKqOCuA+mMj
 aC1afPFKyQoQwqdvkXcQLK4bVEz8hJiVPRYfC7JAX5IdfjOV7R44lDNrt7R3xgok0z9R
 Vigt2dGACghyQp+ZBv0iJxoVg+1nLFYufaEU+ksGofW95t1O15hYyyIKWFA+DMAWiy2z
 quNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=dLS591FmSn4F3VCc3xhoYElnvcLS7F3TC7E+BmTu/4Q=;
 b=ku4WfvnsVObQgQ+sESr1uTfdqxQPgVe3QXgWjXf711pUleacf8L9Rlmg7BfmpUx0Pp
 cPgVAu4eo97Ow7/i4jVfVPA9kv3WXzO6kj3IpUHAVBiey/BWEmMKAVKwejYQp4xMhO2z
 uMXsRvzHoirPGmUT55h2yc6OT5GYvouYQ7h8HuoAr8FONNqqyLL8TOIzypneaeCzn/gX
 lwK5pzFi3RzsrgU1z8rwvuc7QBV5PWpjvnirXYr8gwziiE9Jy8aKh43aAapIVihuPxuU
 BwbItEEjHg+fbH8BQu1ln6vLVNzQgB1yUFDPrWIIWHRsWsHEg2MgVzPWa/q3dAlPLXqb
 14gA==
X-Gm-Message-State: APjAAAX5rYCOmPHnFtL8nsfVeGmGEcA7KvsadSlnusiVyJatS0YrI9Y6
 WsG6iYaND6VgO31H3z9OBzS9QQ==
X-Google-Smtp-Source: APXvYqxDELymHPCxiiDPjrPs5pg2B/tFe5Xgtd5N85bywUXhP5mHZZj57TfIRwOffaFa96xmzOMd4A==
X-Received: by 2002:a05:660c:fcd:: with SMTP id
 m13mr3292854itn.77.1552508122148; 
 Wed, 13 Mar 2019 13:15:22 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 g186sm3719456iof.41.2019.03.13.13.15.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 13 Mar 2019 13:15:21 -0700 (PDT)
Date: Wed, 13 Mar 2019 13:15:20 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christopher Lameter <cl@linux.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <0100016973000e88-99188bf8-0831-4fa4-b3ae-7de6547b651e-000000@email.amazonses.com>
Message-ID: <alpine.DEB.2.21.9999.1903130923270.25529@viisi.sifive.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <010001697026a740-ffe901ce-8e6a-445b-883f-068dd289b0a2-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1903120717110.26459@viisi.sifive.com>
 <0100016973000e88-99188bf8-0831-4fa4-b3ae-7de6547b651e-000000@email.amazonses.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_131523_702572_31CB5481 
X-CRM114-Status: GOOD (  19.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul@pwsan.com>, catalin.marinas@arm.com,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph

On Tue, 12 Mar 2019, Christopher Lameter wrote:

> On Tue, 12 Mar 2019, Paul Walmsley wrote:
> 
> > The counters, though, may not need the preemption disable/reenable.
> > Christoph, you expressed earlier that you think the overhead of the
> > preempt_disable/enable is quite high.  Do you think it's worth creating a
> > separate, restricted implementation for per-cpu counters?
> 
> As I have always said: I would like to have per cpu atomic instructions
> added on RISCV V that works like those on Intel. Single instruction and
> relative to a per cpu based addressable counter operations please.

Speaking from a RISC-V point of view, you could propose those kinds of 
instructions as an RISC-V extension.  One good way to start might be to 
start a discussion in the isa-dev Google Group first.  Others might speak 
up who agree with you and may be willing to help with the technical 
details:

https://groups.google.com/a/groups.riscv.org/forum/#!forum/isa-dev

Organizations that are members of the RISC-V Foundation can propose a new 
RISC-V Foundation working group to produce new instructions.  There are a 
few of these extension task groups in progress now.

> I think the attempt to reengineer the core counter mechanisms on Linux is
> not that realistic and would require you to first know the cross platform
> issues that have driven the development of these things in the first
> place. Sorry that I have been just superficially involved in these
> discussions but I have a hard time seeing this going anywere. There are
> already established core implementations and various arches take on this
> issue and those have been around for longer than a decade. It will be hard
> to come up with something better.

You might be right and you are certainly more of an expert in the per-cpu 
code than most of us.  But if the existing implementation was designed 
around x86 instruction set constraints which might not apply to RISC-V (or 
ARM), there might be room for improvement.

> Can we focus on the RISC V instruction support? I also do not think that
> this is a currently pressing issue but it will be when you scale up RISC V
> to many cores (especiall hundreds or thousands of concurrent hardware
> threads like what our interest is likely going to be in coming years and
> likely also when RISC V is going to be used for enterprise / cloud data
> services).

If the software discussion isn't productive, you could always take your 
concern directly to the architecture and microarchitecture mailing lists 
involved with the RISC-V Foundation.  That way there's less need to talk 
it through with those of us who are primarily software focused.  I would 
expect those engineers will probably go through a similar process:

1. they would want to become familiar with the minimal code sequences

2. if they think that an alternate code sequence would perform better, or 
just as well, they would probably expect someone to try it first

3. if they think that a given microarchitectural optimization would 
resolve the issue, without needing to add new instructions, they would 
probably be less interested in adding them

4. they might want to see traces that illustrate that there is an 
underlying problem

This is more or less the approach that we're trying to take here, although 
with more of a software focus.  We know you as a serious contributor and 
maintainer from the Linux community, which the hardware engineers might 
not, so it's easier to justify spending more time initially trying to 
understand the issue.  Also, if it turns out that software optimizations 
are possible, it may help other architectures like ARM.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
