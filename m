Return-Path: <SRS0=xvkM=QF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DF1C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 22:41:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 881C52147A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 22:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mo9GhYbw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Xq2LXP95"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 881C52147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OXEI29nHniJeobM9QHshjoyKYSNtw/bHsWWFnUGro8s=; b=mo9GhYbwJRnt+26XEUW9jprce
	4+MNp93vWxIvBIS/8zxba6HqMN+ITC0W8uAsl8vu1nY4hbfCqOBK6my44MHUDZpXx8nhPRuALY2ae
	c7dCuna35xEMwH0yodYUAZGF8lvlGiSkrTP8sZWYTfJnPsu/sQIEpiYQ3rYWtdodyNBsQWko3Mtbq
	mNONGRoxqj9w+DSb6X91/dXylipYZsfcwhwHCD0GrCwPomNv0WZfbuVcDBNM9bLkmZKPnL9zf6XC8
	U1EID1M8H+Z7cljnV1tCOt9gcA5kim9/AgsnOJIW20g5CesY/8ox6cg/NQFCaRK5rI7oPjRvgD9CO
	nvvTNmP+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goc4f-0002Y1-RI; Tue, 29 Jan 2019 22:41:45 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goc4c-0002XZ-2f
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 22:41:43 +0000
Received: by mail-pg1-x541.google.com with SMTP id d72so9397012pga.9
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jan 2019 14:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qh5G9yQZkBa8Svfk3tGfWZqDyxvynq71iU/6DQx3jCc=;
 b=Xq2LXP95akf/d2SGVpk3idF2TJ6mKZPAPIHfKEB335lwJl7f9dkPDGYi9bjKnyIgOx
 +1soP4PyEM1LB0BubPtBkbDIqxmHIN9uZEwMuUqPhuFzhguno+481bXy0b7L28bWHM6v
 y4FGqorVIS0DpNkDfXmUohxK5V/JARXHKPnD1cGn7fSofj6fIlB7leA14pB6AnSdQYcw
 0izF2sPABFHaPuw+MzD2K46pNeVbIxBKN0mYZEdS1swmawMu/BtY/Te9xtEJD/TGjiUt
 zpn0wLINS/+bdoE7ZXasfi6xgrmiTCvdg5FdisloNPDx2EFj5l0DNO4A9a/N0oapsQhn
 G0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qh5G9yQZkBa8Svfk3tGfWZqDyxvynq71iU/6DQx3jCc=;
 b=P5RqBGXAjNesl2O8b6tipze2M6SgPhjQb1+iXog1E8UQwmfMisktFdV9gDAZ7eFma0
 e5fEjN7T1EPBS6Gr/XF36Dft8iM9v7UemstQW6FHQuLi0Y4umVPwuo88kD+1hw6rg2rV
 VyMfG50llcHAViGK2zgXFOObAZYdeFCM6eq99w4b83nAeiPMOFTq/3PXtEefwhXesPvl
 zbw/pNifnn+1h7WAX9EqPJxqvsqL2l+gz0NeEyHbnJ7NijNUedGSwKCTqyV37vyWyZTS
 8mzEmLYPEJ9n3Nn3kUsQrCRtAnA7oZV9R7eLbfIMkCOm+OXG/xGTDxMwU3TTH79x1S12
 3tqw==
X-Gm-Message-State: AJcUukf3yKJIpwje24NUMUdyDVVawKG8QiMR0PljZ2F8lGJBNJ5hQelI
 DAZgAMmV9D+aF/fzAg9sNvo9hg==
X-Google-Smtp-Source: ALg8bN6lsBuNk3+YGY22fRW6xC+/aKUtH/3klh7YOtt7aVblZ0i6DsJnHLCv78cMLqQ7Ty17kdnZxg==
X-Received: by 2002:a63:f658:: with SMTP id u24mr25557982pgj.267.1548801701241; 
 Tue, 29 Jan 2019 14:41:41 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v14sm42986528pgf.3.2019.01.29.14.41.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jan 2019 14:41:40 -0800 (PST)
Date: Tue, 29 Jan 2019 14:41:40 -0800 (PST)
X-Google-Original-Date: Tue, 29 Jan 2019 14:40:02 PST (-0800)
Subject: Re: [sw-dev] SBI extension proposal v2
In-Reply-To: <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: benh@kernel.crashing.org
Message-ID: <mhng-f2c32ce6-9768-4d89-a32d-04f2692ac50e@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_144142_150678_9FB12600 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: mark.rutland@arm.com, Christoph Hellwig <hch@infradead.org>,
 Damien.LeMoal@wdc.com, olof.johansson@gmail.com, alankao@andestech.com,
 abner.chang@hpe.com, rminnich@gmail.com, anup@brainfault.org, agraf@suse.de,
 zong@andestech.com, atish.patra@wdc.com, sw-dev@groups.riscv.org,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 Alistair Francis <Alistair.Francis@wdc.com>, lkcl@lkcl.net,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 01 Dec 2018 22:18:54 PST (-0800), benh@kernel.crashing.org wrote:
> On Sat, 2018-11-10 at 19:58 -0800, Atish Patra wrote:
>>
>> I think the larger picture might have lost somewhere because of the
>> verbosity of the proposal. The idea of adding vendor extension support
>> in SBI is to allow them provide a standard mechanism to facilitate this.
>> In absence of that, vendor might adopt different approaches to support
>> their feature leading a lot of chaos. Vendors can not go and add
>> anything in the Linux kernel(just a example, SBI is still OS agnostic)
>> as well.
>
> The concept of vendor extensions to a userspace ISA is so fundamentally
> broken to begin with, this FW proposal verges on utter insanity to be
> honest.
>
> Calling FW for things so deeply ingrained in the kernel such as context
> swithes, isn't going to fly. The performance will be ridiculously bad,
> among other things.
>
> If Risc-V wants to avoid fragmentation, it should simply keep a firmer
> reign in what is allowed in an implementation and keep a lid on such
> horrid ideas as vendor specific userspace ISA extensions.

Right now nobody with a Linux-capable RISC-V core has vendor-specific stateful 
extensions.  The plan is to avoid implementing any of this and convince people 
to avoid building them, but since the ISA allows for these we do need an out.  
I'd prefer this to forcing people to fork the kernel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
