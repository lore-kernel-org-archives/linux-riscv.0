Return-Path: <SRS0=NLGL=RY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE45DC10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 08:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFD7B218B0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 08:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N6zTxgli";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WXDwEgqT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFD7B218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=HM7T46pvGhLp2AjlmBzL6oK2L0VUNG5wZ0+OLwX71zc=; b=N6zTxgliJuv9yeIZnKprr76Fm
	rHMznqBJSmLxBbrrTZXqsVvsoGJk6L+x6fklWgEy31oMoT/rsr9SbaRYoeI+Zuh5BiSk7ycbr1+3j
	VOOMLPWMZ0NYvM4Hb/7r+E2beLGccfStCt18S9yvTBMed72tziRIzXpvLNZDrQT9bkwmWhO3yVDQw
	r9ev0aV/2vpaj6BIfcxytwUy8fJpU+cR+pK9SmrDT3x1WBJ5uSGAjSa84Hk7hJrOrlQ3OD6CrHY1p
	dIqpZELkL9CRRyV8foQpSmDG1ip6Usi0CHL3DPDyB6YM+C06lkcGJlUv4NMO73LTzbWV2irr/ezPO
	tH6x+ZvgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6tCQ-00088A-Op; Thu, 21 Mar 2019 08:37:18 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6tCN-00087R-33
 for linux-riscv@lists.infradead.org; Thu, 21 Mar 2019 08:37:16 +0000
Received: by mail-pg1-x541.google.com with SMTP id v12so3756124pgq.1
 for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2019 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5YkU6H7pmtZlHKyyjpbxiy/FU2TIk4TMbEmP2AFCvZI=;
 b=WXDwEgqT1/AukBJYjY33gGrZU3CrvV2gJr+UKYbABaFcNfWDLwZyoLvB5hfZFO0C/3
 irenOEQp3fMs6w7bjpJkQffKWXdp3d5KcAipQBWvZ7as8ZyDP4uiSIgVL1uUUfOfoMVo
 DbnqTolXxjX2UpsiluTEn6E4QfcW3+0y5GQR9RU7WhP7Z6VSOtehnBcqrNcD6kFRkfTX
 8gzoeFZ1Gzy59SXMdDAIM6V6q26NJOuHHmTOs1RHNWroRtNrFPqE7jYAQ6K7VXHk81Og
 8o3FY+9wZcPHzwo48KlDHqCMLxBJtIiQYtq9wV6+P9vwrJ1G1sEEcFh5Hf0ZGT6jETyI
 NBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5YkU6H7pmtZlHKyyjpbxiy/FU2TIk4TMbEmP2AFCvZI=;
 b=qo2amoLTi7g9zRxDQpiRq027FwRkvVzRaSzDt2V4a4hulcsHTKR7Q/vSIWcaSyfH8O
 zJcxWAg05bwl9Ltvj4GY7GKFy8oi62DtpBRA20Rwx0ehclN5C/5sonDI4DxPEvGLy/6N
 3sAuFkEwJTAhyMHxppjefADrTBRXYbRROixhcmnNvHnsnae8gfPAOGU+twHn97T7uQ2y
 gkS1VsGtKcdEm5kNCs0i90P5Eg/+1KTdB+YdnvJ6qVnncRFGXpR405rK9Rn1h3Ue6Lj8
 42DTSAWai1/u8k2f+n+F2x74O5s10Nu4sPlawW/2eMddN8ww5LahIH+VzQczuXQmo6Qo
 aihQ==
X-Gm-Message-State: APjAAAXoQk2T0D9jDpIKPUg+7LrLuAy+UUoxhBvp1BQHt/OzLYOlo7FA
 v1KhAhYDZXH/bP5Dc6vsSIt8kQ==
X-Google-Smtp-Source: APXvYqwF+3EP5nW5RH56OwiEmGNwsz815VOto4U9Exy3fO9Ch6KdIf7kcuOUa12OtOrckAmP4DlElg==
X-Received: by 2002:a63:1b1e:: with SMTP id b30mr2283560pgb.180.1553157434004; 
 Thu, 21 Mar 2019 01:37:14 -0700 (PDT)
Received: from localhost
 (2001-b011-7001-1ed7-23f1-a55b-5e6a-d75e.dynamic-ip6.hinet.net.
 [2001:b011:7001:1ed7:23f1:a55b:5e6a:d75e])
 by smtp.gmail.com with ESMTPSA id t3sm4856804pgv.39.2019.03.21.01.37.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Mar 2019 01:37:12 -0700 (PDT)
Date: Thu, 21 Mar 2019 01:37:12 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Mar 2019 23:46:12 PDT (-0700)
Subject: Re: [PATCH v4 1/2] sh: mm: make use of new memblocks_present() helper
In-Reply-To: <9ac29b0d-4c25-3f5c-3812-44b42332447d@deltatee.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com
Message-ID: <mhng-79bcf945-38aa-4ca5-82d2-eaa5b1286175@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_013715_163964_488B1527 
X-CRM114-Status: GOOD (  10.79  )
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
 Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, dan.j.williams@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 20 Mar 2019 10:43:09 PDT (-0700), logang@deltatee.com wrote:
>
>
> On 2019-03-19 8:54 p.m., Palmer Dabbelt wrote:
>> On Tue, 19 Mar 2019 10:56:52 PDT (-0700), logang@deltatee.com wrote:
>>> Hey Palmer,
>>>
>>> On 2019-01-23 12:56 p.m., Palmer Dabbelt wrote:
>>>>> @Palmer: if you can just look at taking the second patch, I'll resubmit
>>>>> the first one to the appropriate list.
>>>>
>>>> Works for me.  I'll queue the second patch into my staging branch, targeted for
>>>> the next merge window.
>>>
>>> It doesn't look like my sparesmem patch made it into v5.1-rc1. Did it
>>> fall through the cracks?
>>
>> It must have, sorry.  Is this what you're referring to?
>>
>>     https://patchwork.kernel.org/patch/10754911/
>
> Yes, though it conflicts with v5.1-rc1 due to some code reorganization.
>
> I've updated it and we will submit it later this week as part of a
> larger patch set which helps enable p2p on RISC-V.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
