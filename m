Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A56FC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 20:17:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE613217FA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 20:17:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U/zah0gV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="S1f8QarF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE613217FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=84P38CV6x2esOogX9R8/gSFn/flFCht/kW29vWiX3KU=; b=U/zah0gV1raBpPCr6dgJUlYIx
	4SYHKDcH1q1drwo+iqIDd8cdfNpJVRsK1vrlJtqQIR+JOOcVuHG4jXTXCTvV4X0J2ulqa0zX8fLIY
	e5ht4A50x/WM65uOQs6QBu1aFDueziN5qA+VKP3XTg34RR4zpVrXgl8QlzoPj8xWM/xTNjiOi63Na
	sV6HlqFbGc0gR/I4oulfg/i0lqnoxpyxfk6P4dimOJhh7TjhD/YHE6lV/p2dALP3HgwkDvvR2cjXC
	C+T7Pluy1f5OExAvxVJ1dMyu6++V/LxPO5RcUZChOUdgGNoo3xhflQ/qG5nLGf01pg2kRFJpCz8Em
	7e8NqzZOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtI0x-0006Z9-EJ; Mon, 11 Feb 2019 20:17:15 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtI0u-0006X1-QE
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 20:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549916233; x=1581452233;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=2kWi4q7r1wQnSwcLTESUTI5LuqvR81+yjm/9/8M1Mhw=;
 b=S1f8QarFLCTl97uReBkyFIteR9n+SEts6IeYyMfltK+ajLfujov2vDGZ
 A2CLjgPfVa8JxmOZq8xFerJqjaJd4bfvYzyQPS61NEuxbtdaeixSbuOdo
 5XLy+XfCimC/vj91OoNhjQqEuBBfFA/eicTqcjkfgU2AX7KseG0qwzY72
 MInOrTKlIEmsmPbvN1HTnVe+5VZyf35LTUU80kYfyeqhZ0ieTPOmgRWjY
 AGsZ+sDa+DdCrNmYvciYlqWLp7oxPcNi909GLffTUYD873QerEF81y/R7
 Pt0zlJOoB80goxwpEHPLu6i5dMIScH8TFShlQj1BDv13QAmcR7CoXQJkc A==;
X-IronPort-AV: E=Sophos;i="5.58,360,1544457600"; d="scan'208";a="102726808"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2019 04:17:08 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 11 Feb 2019 11:55:45 -0800
Received: from cnf000690.ad.shared (HELO [10.86.62.97]) ([10.86.62.97])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Feb 2019 12:17:09 -0800
Subject: Re: sbi_trap_error: hart4: trap handler failed (error -5)
To: Andreas Schwab <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <mvmftsuv2ea.fsf@suse.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <5cfec923-57ac-e576-d296-a29f5ba00ac1@wdc.com>
Date: Mon, 11 Feb 2019 12:17:08 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <mvmftsuv2ea.fsf@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_121712_889444_1ABF4DEC 
X-CRM114-Status: GOOD (  13.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/11/19 6:16 AM, Andreas Schwab wrote:
> I have been getting this error:
> 
> sbi_trap_error: hart4: trap handler failed (error -5)
> sbi_trap_error: hart4: mcause=0xd mtval=0x155574e000

Looks like you are getting a CAUSE_LOAD_PAGE_FAULT (0xd) on hart4.

> sbi_trap_error: hart4: mepc=0x80003dba mstatus=0x8000000a00027822
> sbi_trap_error: hart4: ra=0x80001eaa sp=0x8000dd60
> sbi_trap_error: hart4: gp=0x2aaaccdd18 tp=0x155573cb20
> sbi_trap_error: hart4: s0=0x8000ddc0 s1=0x5e
> sbi_trap_error: hart4: a0=0x20000 a1=0x8000ddf0
> sbi_trap_error: hart4: a2=0x15555eee96 a3=0x8000000a00006022
> sbi_trap_error: hart4: a4=0x8000dd6b a5=0x155574e001
> sbi_trap_error: hart4: a6=0x0 a7=0x155574e001
> sbi_trap_error: hart4: s2=0xee s3=0x3
> sbi_trap_error: hart4: s4=0x96 s5=0x20
> sbi_trap_error: hart4: s6=0x0 s7=0x15555eee96
> sbi_trap_error: hart4: s8=0x74 s9=0x14774
> sbi_trap_error: hart4: s10=0x58782b5b s11=0x34fe3e52
> sbi_trap_error: hart4: t0=0x4 t1=0x155574dffd
> sbi_trap_error: hart4: t2=0x55 t3=0x85a303
> sbi_trap_error: hart4: t4=0x0 t5=0x0
> sbi_trap_error: hart4: t6=0x15
> 
> What does that mean?
> 

It would help if you also give some more details about the platform and 
boot flow you are testing. Are you testing OpenSBI + U-Boot + Linux or 
OpenSBI + Linux (kernel image as a direct payload to OpenSBI).

Are you getting this error on QEMU or Unleashed ?

FYI: This is a OpenSBI specific issue. You can always create a github
issue for a quick response.

Regards,
Atish
> Andreas.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
