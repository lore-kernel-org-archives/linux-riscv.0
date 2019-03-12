Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3195AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 14:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF12A214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 14:21:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C76gpwJH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bvtMJq8l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF12A214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vorGOgYk90AKgjVuoquAaeWNyh4qgW7xSZavjR7UonY=; b=C76gpwJHvUf11y
	yz/0FZ4Yhhv7f2KDNxPUBcQYOeiECrHQSmLbYioWptzpMWku/6B4gDPnSAtwxpUHxuAoBOyvY0EoJ
	DlBwxMlu/XhPunKyY8o2jBewcDX2tjAwxp3j98B5gcGcYds12lU5sYRLJFivA4A3SvvDaMzMqgF7K
	nQF+02haAQQ7LutAhseHHmTK/b9hT4NdUnaM69IbsI12jZCczVHHX9WbeWn8VqVFXuKZh+o0OcBmK
	sYF8raQJzmoj9dx/vIWl25ImfdFicPoyRK6dWlE+OBog02mmRnlfM/GDjSqVUM7VBqWcfXbA7543s
	dtgplQIIXP67rgk86ogg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3iHE-0008N1-3w; Tue, 12 Mar 2019 14:21:08 +0000
Received: from mail-it1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3iHB-0008MK-A4
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 14:21:06 +0000
Received: by mail-it1-x130.google.com with SMTP id l15so4720966iti.4
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 07:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Tk1HfcQDv956YyKgECbO+lQO8HI/oPOq5ejSNN3UT5I=;
 b=bvtMJq8lNDUE5lbBLRNywcwH+vQ5EodXmBWK0cLybyynrbveWZSaiRP2liaYdRdAGl
 BxsxIHNXdqBPjoEn5uJWhHPMQmfLAtt7bJat/dZHcPejNxaG0aoWBBH9XSRy7FzbCDLw
 4WrZUFjMrw9AqeXU1c0igLR3hqdO2+0xm+UO5sYbp3dNAF0ysHCSp4Pj2WtieEA6RLmq
 6JIvxRnC9HqOWmgHi0zZVlawi3mHjjGRiveiJEmSOKxOcoC2/d53ELOehHKi33XTDEXF
 mvZNFIUIa55ZUDcLiF5/2AZyOukvMzZho6yv8VlhSUuqKju8boWBiA9FptOW6jv3350T
 wFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Tk1HfcQDv956YyKgECbO+lQO8HI/oPOq5ejSNN3UT5I=;
 b=ZlM45kheILwB3xLeYA87JvMC+AsBhJHpjQlX9Sd6XUwBz3O7/R51qRhazX189aOr64
 8+mf15WjAL6yU/3QKXhUvEUrS2DywRN0D5ZgRNy+PBDKHmA9NaWNSjD2ThQtEX6zbPF3
 Jf6XshzkyMT9IptFaqMVqMMSFPrxLiCoxVUCjSFO5Rjfs24rcbRjGHwVv6GJ7k8QMZku
 +Xt4J58diy1HZNVQYwGpQBDAVkwHodDLpk5XXjRxOqocJfPscFVnInY8D/si5rs88FR3
 93Lktc4OC786rzbRIcT8Hc8SE5738tkvoscyjPjbn4I1xzfe9vN67eWHHHfH9GkNCtrf
 cudw==
X-Gm-Message-State: APjAAAVHxBcj68AXF1x+TfbwpWe0uR97IB3l/EdpEF/PGlOpL7b3zyTi
 1dKgj1hcoBZpz4ffbb9KVumRUg==
X-Google-Smtp-Source: APXvYqxBs7qF3dzL/Su/HM5URk88DqxbvKpQM/3K97eDPdM5KCFDEeM09QH4+z/6cT8tT/pAZOS65Q==
X-Received: by 2002:a24:75c7:: with SMTP id y190mr2202668itc.108.1552400464174; 
 Tue, 12 Mar 2019 07:21:04 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 b36sm303369itd.2.2019.03.12.07.21.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 07:21:03 -0700 (PDT)
Date: Tue, 12 Mar 2019 07:21:02 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christopher Lameter <cl@linux.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <010001697026a740-ffe901ce-8e6a-445b-883f-068dd289b0a2-000000@email.amazonses.com>
Message-ID: <alpine.DEB.2.21.9999.1903120717110.26459@viisi.sifive.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <010001697026a740-ffe901ce-8e6a-445b-883f-068dd289b0a2-000000@email.amazonses.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_072105_377478_E35EABDC 
X-CRM114-Status: GOOD (  13.13  )
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

On Tue, 12 Mar 2019, Christopher Lameter wrote:

> On Mon, 11 Mar 2019, Paul Walmsley wrote:
> 
> > There's been a discussion going on in a private thread about this that I
> > unfortunately didn't add you to.  The discussion is still ongoing, but I
> > think Christoph and myself and a few other folks have agreed that the
> > preempt_disable/enable is not needed for the amoadd approach.  This is
> > since the apparent intention of the preemption disable/enable is to ensure
> > the correctness of the counter increment; however there is no risk of
> > incorrectness in an amoadd sequence since the atomic add is locked across
> > all of the cache coherency domain.  Christoph, would you disagree with
> > that characterization?
> 
> No. As I said before all write operations have to happen from the local
> cpu to a per cpu segment.

In light of the thread that's going on with Mark, given the open-coded 
__this_cpu_* operations, it's clear we don't have a choice - we'd need to 
disable preemption for the basic operations.

The counters, though, may not need the preemption disable/reenable.  
Christoph, you expressed earlier that you think the overhead of the 
preempt_disable/enable is quite high.  Do you think it's worth creating a 
separate, restricted implementation for per-cpu counters?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
