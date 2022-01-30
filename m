Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707B4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nHKwHtcXYvvdpPK2YLFH1jkt9Cl/DYepuSXo8Zr5dKM=; b=aQuL8NjRLnGxGKUmkNVGsMAWa3
	3WEg/LFF60ZTEg5pD2p3iIyVo9XVMWQqOV20ZC6XM1NRzCd6E8VIl5tZRGubgvUKXpib0IEkzh729
	pmvFLGyLz25DQtcjw5hdz8ugPvQjnQxvUhZR4f7eJtMjwiu1yNjr+AzqfZ71KDTVc3G2vOBqItf2Y
	1xuGtkrMJE5roqHrTUyvSAwT6CC8iVQyL0XsrlGVs8D/32eHwUn7CNcjxSWsLVfz+c7AateMMjTRY
	QazOJbu8CBtKYqc1Mz5lWcLmJFcvB5U6bgCwLSl79PTuV3q9JE8LtpaaaboE5koZXRjUldNw54q17
	rZwepQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBhT-006nye-Ab; Sun, 30 Jan 2022 15:01:07 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBdv-006mFY-Vg
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 14:57:29 +0000
Received: by mail-il1-x12e.google.com with SMTP id z7so9543067ilb.6
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 06:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=oOYUjlc7s0+4hg1a1akvuBImyksPkuzdo0yOayFwVZI=;
 b=axYJWuMCOL/S3845RRTifpv8EYKjYd7RpA2svN0ltXbHX726YHf2Hg4CEhm3pMo0Wq
 HDzO3CD4BJqvofjUpP3c2U1kE1CN4QKUAIxaWItYobqgW9Rxnc6ppHMxQ56g1ynjU1No
 CFD6bETLdHb6KGqWOqzdg55Ygy25zEqcjoGVkNQyFHJmJm/g9el70LayHk1uUa/7dtgu
 itjkLblbBwDvifj62FKlWq+GHleE68Mc+S8CmoMq0AUNlehQOXT1WUgw24VsnwjuAGFS
 91h4XZcCiwUddU/PBc7W2ebah9EI5GKatXkpbrJoOmRJ3KI7+/EAbq0VUdxHH95+AmyM
 pc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=oOYUjlc7s0+4hg1a1akvuBImyksPkuzdo0yOayFwVZI=;
 b=ed1GnB7Mt8DGqpexLpG6CoMYx0mEtW8knVMMzJep3c43LHQfMygsbp0JJbdt4aPEOC
 7hrngt3TBnMsjY3ZYjk1jgEqZSYpl9X96QFjQN+zHv9LnekkW2y+CyjHwurtQXxd0IOC
 wtrYS6PVLwsiqGNAia55kIi9L7LVLTuf47Sim5VzdThZrD/+wUIceOIcCYo9UIxhWRCj
 gnkedebofTcPSnxw2zsE8y2ynSKXryQawzrfstxZswjukHWovP7tPifBuock86mOk04G
 eFWNzIXS8140goCTOP84XiftSp+cDRrNyi54LX9CUdMZqBI+VVLnzhaVE1A5IKp9szUy
 tajQ==
X-Gm-Message-State: AOAM532KpH7Ci9CMJA8VrFri4OgjrSF3FhHcLu6AG3zWVNzUWYTkowLL
 GuJ0KWIaJzv++OGnXzBIGzqe+xVCRSALZ8KeAvqH3PXMEL4=
X-Google-Smtp-Source: ABdhPJx8/scIasYoY05qRT2LSkMBCi4ZPEbpFE0SR6g9SQK0aN9HuRJ2E6NeYzF5YR0HnDrje+xzJrMdqpr1g/h9V58=
X-Received: by 2002:a05:6e02:1c09:: with SMTP id
 l9mr8012262ilh.283.1643554646792; 
 Sun, 30 Jan 2022 06:57:26 -0800 (PST)
MIME-Version: 1.0
References: <CAPF60xXKU5OM+eDTcxxmWp7mVMVWhsF+ZaqSmLPsWJea=UH-Cw@mail.gmail.com>
In-Reply-To: <CAPF60xXKU5OM+eDTcxxmWp7mVMVWhsF+ZaqSmLPsWJea=UH-Cw@mail.gmail.com>
From: Jagan Sivakumar <jagansua92@gmail.com>
Date: Sun, 30 Jan 2022 20:27:14 +0530
Message-ID: <CAPF60xWYcZqQ5xzqCBZpSRE17rYc5B+Wy=dsF0t6d5YCo8Kj=w@mail.gmail.com>
Subject: Re: RISC-V FPGA Board - increase memory in DTS file
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065728_078178_605EACAA 
X-CRM114-Status: GOOD (  13.70  )
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

Hi Team

Is there any restriction riscv-pk that it will support maximum 256MB RAM.
When i increased RAM more than 256MB its not working

Regards
Jagan S


On Tue, Jan 25, 2022 at 2:21 PM Jagan Sivakumar <jagansua92@gmail.com> wrote:
>
> HI Team
>
> I'm working on updating the FPGA board memory available within the
> RISC-V Linux operating system from 120 MB to a higher value.
> The board currently has a DDR4 2GB memory chip inside it.
>
> The DTS file's current settings for memory are shown below and it is
> working fine.
>
> memory@80000000 {
> device_type = "memory";
> reg = <0x00000000 0x80000000 0x00000000 0x10000000>;
> }
>
> When I update the memory settings to double it as shown below, the
> Linux isn't booting. The DTS file configuration is printed on screen
> and it hangs after that step. Attached log for reference
>
> memory@80000000 {
> device_type = "memory";
> reg = <0x00000000 0x80000000 0x00000000 0x20000000>;
> }
>
> Note: When i decreases the memory the values are reflecting in RAM
> size and its working
>
> --
> Regards
> Jagan Sivakumar



-- 
Regards
Jagan Sivakumar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
