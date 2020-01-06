Return-Path: <SRS0=oEUG=23=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1141CC33C99
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2020 02:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C8E218AC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2020 02:45:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qd9iNYii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C8E218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=th9/JklYMV6M0G3zvAls0rJtlkPCWqPxV76i7fe3DE8=; b=qd9iNYiirUNNkvQKwfV1Fr38N
	Lglc5Ucq00zvPbVInIMS4MchNQM+3w9HF/SW4hAzzSffouycBC3cK1Rl2bSPUGd3IaubelRQQGoZx
	WJDUhclrB6OXvEJK7k/mx5n5bEQn7nkuHQvhT8AIGUSdL6OzmOOgUhqqgMRM6cCA9zMLiCEpuIPWy
	+ndM1Z80sTuI4te11luLq3A8R1eFZT3yzzoF2WYYQMX7GVRkO/d0c0L/oawbSEtVXuVAEGq/zcBBd
	CFKl2sCS3nUGrMXgMKRo0E3yV5a8G/xgw8EVUYc7QjPZBL4AHFWQo+3JFGt7cXIVGh6WZrtXpV0DS
	YRy+lOXMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioIOy-0000KE-FQ; Mon, 06 Jan 2020 02:45:56 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioIOu-0000JV-IZ
 for linux-riscv@lists.infradead.org; Mon, 06 Jan 2020 02:45:54 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0062gfv8061600;
 Mon, 6 Jan 2020 10:42:41 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Mon, 6 Jan 2020
 10:45:15 +0800
Date: Mon, 6 Jan 2020 10:45:16 +0800
From: Alan Kao <alankao@andestech.com>
To: <guoren@kernel.org>
Subject: Re: [PATCH 2/2] riscv: Add vector ISA support
Message-ID: <20200106024515.GA1021@andestech.com>
References: <20200105025215.2522-1-guoren@kernel.org>
 <20200105025215.2522-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200105025215.2522-2-guoren@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0062gfv8061600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_184552_867631_3C24C557 
X-CRM114-Status: UNSURE (   5.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Guo Ren <ren_guo@c-sky.com>, arnd@arndb.de, atish.patra@wdc.com,
 Anup.Patel@wdc.com, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 vincent.chen@sifive.com, palmer@dabbelt.com, zong.li@sifive.com,
 paul.walmsley@sifive.com, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, bmeng.cn@gmail.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guo,

On Sun, Jan 05, 2020 at 10:52:15AM +0800, guoren@kernel.org wrote:
> From: Guo Ren <ren_guo@c-sky.com>
> 
> The implementation follow the RISC-V "V" Vector Extension draft v0.8 with
> 128bit-vlen and it's based on linux-5.5-rc4.
> 

According to https://lkml.org/lkml/2019/11/22/2169, in which Paul has stated
that "we plan to only accept patches for new modules or extensions that have
been frozen or ratified by the RISC-V Foundation."

Is v0.8 ratified enough for now?


