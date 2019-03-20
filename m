Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6B8C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 02:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29892217F4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 02:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j0JV6ORJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="W8TdeH1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29892217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=maxOsC+EUGxeg0uDQGBUkdeYlsRpdD2Rd7djR4BUn/o=; b=j0JV6ORJ2n8zcls12/YxbEV7g
	HZRgp3hBSAVLVzQO7Z9LXD/idoiTYOzKMMKE0kDadMhtXLJd5z21wv6/IDDiMoGkMGKn8eLhZ22zm
	ze9GCMoJbYCYfbwz+deKFzUIZPQdcfUqC9C8a8GbAwW9qQXYAJ/IsxXBfyHxH7FbYUVWrLkP3FBLB
	QA0oN4BwMsS1w1HIbN1RpkmwHifpCUlhvU+iNPSno+zk25UWyQim6P46zdhnA4IM/RtsiYQJH1Mzb
	6kBaBi6Kt0hgbpHeu0/rNk0AREaJApVlvnQDn/HARoSfI9nEYVmm198y01JVln4/Cj5GjTn3xzwLT
	lboisYX6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6RMv-0004sp-KB; Wed, 20 Mar 2019 02:54:17 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6RMr-0004sE-SL
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 02:54:15 +0000
Received: by mail-pf1-x443.google.com with SMTP id 8so801534pfr.4
 for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2019 19:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZLDJSIDvB3voIXsx3uaIAW5/phZOL5lOm5TrZxnVa50=;
 b=W8TdeH1rNuB5b7L4HYe6T4ot2Z7cNQML4UOSN4kNWhJwDsCv8m/yKb4n94cYQln62B
 ABuU0zaHOU0uBbrW2tWrwQhwahzzKwSGfIz+resLx4c8H2VoowZgQ6Om1TGZHrsZsvYr
 J2BdNs3lu0j69OjSomINVqWM0VxgHMssnRYiF9Ig9BJJlxhJvq+N7KIs7x/g9MSorbP5
 S8SlTmRShCKeHuCw82BrIvc/JunPq2Fun+/bGb77dXkcjTkWfApLpUc4YLtQrH2vtcvS
 JQQ6mql+uJ8ns7bbt8DdaeCNrBdUoManuYa/EjxQ4aXHx9w+kw0q3IXfMvCZsRxC7PV4
 AgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZLDJSIDvB3voIXsx3uaIAW5/phZOL5lOm5TrZxnVa50=;
 b=qCv3biV5fF7a6UKZhjkfMhUO0ACVlppzKyngstYOK7nvvDqYXU4KuEsJfA79nCJbbm
 DyzjLT9xxJIw867zdW6/Tofr/nd5RMXOy4Trs88T3b9emmdPEkydak+rzLOepiHlG6Ul
 Ih0OWgsW1QORCbg6na5jh+ANjqFNX7sZQ3LKeeNK6sN7vDi516KSxh5DlyChMfV4drws
 1swLDEpe92MrkfFSiUEPaXBAJjF+iCzK0+CliZ70EKcKavCOguVNaI99FEO9Y1qo6ZXT
 HV7Mza52Fhc4sgiw6ImOfqqopjIeIVCxP5ZVb8NUjgNzXG0G14+p1bTrmtBSRFFgR80x
 779Q==
X-Gm-Message-State: APjAAAUkNLyRdBkPV20AKGaALZNB5ksJORsYhRRWb7ediRMt6MXJIA2V
 ZkWYsu3vMiiM5F2VIiS0XGDtUQ==
X-Google-Smtp-Source: APXvYqytu3Q0SPwwuneKuggYzZxtsGo2d/pAI1t5XD4kd9KWfw/AyQMgpfAiVAsyvRRFFs7MCd5K8g==
X-Received: by 2002:a17:902:d715:: with SMTP id
 w21mr5197734ply.14.1553050451456; 
 Tue, 19 Mar 2019 19:54:11 -0700 (PDT)
Received: from localhost
 (2001-b011-7001-1ed7-23f1-a55b-5e6a-d75e.dynamic-ip6.hinet.net.
 [2001:b011:7001:1ed7:23f1:a55b:5e6a:d75e])
 by smtp.gmail.com with ESMTPSA id l5sm561016pfi.97.2019.03.19.19.54.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 19:54:10 -0700 (PDT)
Date: Tue, 19 Mar 2019 19:54:10 -0700 (PDT)
X-Google-Original-Date: Tue, 19 Mar 2019 19:41:18 PDT (-0700)
Subject: Re: [PATCH v4 1/2] sh: mm: make use of new memblocks_present() helper
In-Reply-To: <c9f13314-204b-10a5-e9eb-2c4d8fca6c90@deltatee.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com
Message-ID: <mhng-bc5a03c7-1387-43e2-bd72-fb03e344e196@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_195413_945782_0B14AC06 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Cc: robh@kernel.org, dalias@libc.org, ysato@users.sourceforge.jp,
 linux-kernel@vger.kernel.org, sbates@raithlin.com,
 Christoph Hellwig <hch@infradead.org>, dan.j.williams@intel.com,
 Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 19 Mar 2019 10:56:52 PDT (-0700), logang@deltatee.com wrote:
> Hey Palmer,
>
> On 2019-01-23 12:56 p.m., Palmer Dabbelt wrote:
>>> @Palmer: if you can just look at taking the second patch, I'll resubmit
>>> the first one to the appropriate list.
>>
>> Works for me.  I'll queue the second patch into my staging branch, targeted for
>> the next merge window.
>
> It doesn't look like my sparesmem patch made it into v5.1-rc1. Did it
> fall through the cracks?

It must have, sorry.  Is this what you're referring to?

    https://patchwork.kernel.org/patch/10754911/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
