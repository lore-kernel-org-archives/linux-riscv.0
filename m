Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03246C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 05:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA2452082E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 05:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SGfNy+xT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA2452082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LotFfVkDSyHNj7pv6aWG3VNSWo027Q0idW6IJRxKTc=; b=SGfNy+xTK/g7it
	71kRSAGeXIliP0KefIfMcs0t1ffunBjX4/0z/5toi5Bt34+Ixtd8sbO0I8r4fS05aWDfnsznAwymN
	7CiVKh1qkffX3LZzxCCXkW8T3lpgR1T36zlC/k9356hrS5D2zdUHiPmqSQj+3k6gIIZcgas6ADKif
	27TJu/aZHW6N0HN1N+lAi0tp/goK4KV63RzX8731hCduMtO+Of1s3puN4jyVMId5oo4JesxDtmDvz
	JGi6zd62M+di5l/ZMTzrynbgrMl2wX3FDcxwIS2en1f5Yvm9CGawiv4PHtb8BKDuNElVwMtdx7ww8
	gj8WVk6ERcY+/qWWnHCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEp6T-0008KQ-NL; Fri, 12 Apr 2019 05:51:57 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEp6Q-0008K6-8h
 for linux-riscv@lists.infradead.org; Fri, 12 Apr 2019 05:51:56 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id EC65668AFE; Fri, 12 Apr 2019 07:51:39 +0200 (CEST)
Date: Fri, 12 Apr 2019 07:51:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 3/9] riscv: remove CONFIG_RISCV_ISA_A
Message-ID: <20190412055139.GB32149@lst.de>
References: <mvm5zrkg2bg.fsf@suse.de>
 <mhng-c4fcebd9-8339-4e3a-bbec-309c0dc84cc9@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-c4fcebd9-8339-4e3a-bbec-309c0dc84cc9@palmer-si-x1c4>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_225154_460125_C1FD57D3 
X-CRM114-Status: UNSURE (   7.55  )
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
Cc: schwab@suse.de, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 06:23:23PM -0700, Palmer Dabbelt wrote:
> On Thu, 11 Apr 2019 05:21:23 PDT (-0700), schwab@suse.de wrote:
>> On Apr 11 2019, Christoph Hellwig <hch@lst.de> wrote:
>>
>>> This option is always enabled, and not supporting the A extensions would
>>> create a complete ABI trainwreck, so there is point in even slightly
>>
>> +no
>
> Sorry, but I can't parse your answer.  Do you agree with or disagree with 
> the proposed patch?

They way I understood it it is that he wants me to insert a no into the
sentence above where it is missing to make sense:

".., so there is _no_ point in even slightly.."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
