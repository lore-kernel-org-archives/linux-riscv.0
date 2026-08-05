Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A57C55838
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 02:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1Z6rjK7Z7V+8mxnma9cUYWexWhHd3pYwDd9KFGk8FM=; b=Zt+eA5alZVhnh24+vFsrOuK9or
	S/ULq5+OyTmKBZnSpaBGj0WgwD0TPIsyk2JG14ILdEV5ozJcxZqdK2Ps9z1ZD3Y7/WHdc/iLo1LyH
	RwXQMaqCfb2PxR6Qje1vRuQ/2JlAYRPdE5JxvFCRSMEHJOCr0F7Y6+j3feaRvm1zb6d1M+a7KS+rm
	/1Iz1TV/w/xScwnEqtV0jfmQjJilmyjl/lWWRKe2NBwpXFvqwhZx0Mttxn0tq1gmwKxCYM+L0BxD8
	yDt9WK6dKwtJSVWTLlqBOhbJ9B2/TnxHzHRT+R7HHMNP2lXu3rDWfi4cw93jh8dvv6azkPWE6ciO8
	0EKwE6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRf0-000000039AJ-1LYe;
	Wed, 05 Aug 2026 02:47:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRey-000000039AD-37D3
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 02:47:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8432B600AA;
	Wed,  5 Aug 2026 02:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800EB1F000E9;
	Wed,  5 Aug 2026 02:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785898031;
	bh=EuQ7UkVWTzna9OyzZ2ItQq8zDFnsDKDcsmb9afVZaB4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=HWUowoZQFzrsIHAH0KZZfdJetuB3H5S3IdPe4wGbSObpEkSTySeqMLPXmLN7ESTJw
	 ygoMtuoAwrNtHH9czbbMYAFHPqvKW6kz4C+FQZVtGqNhS0uK2j3FrVqlDzzmjc3PVA
	 BJX6jJa4SsrSvSxWdXZBqBq1F2CTNI5wlAUebtlWB9hXndYtiEb37ay2eccWaD1JRu
	 BBJxaas1Pkb0ZY+NL3sTpNVr7Q8UCHWL76k/UxokaLiFzqyOStxvZrrR4wAaiQrvM+
	 YvQv3RH0Sjq2R92jUgTgftFOykKVriS41eBe5MZOj8fabwJ/Kr4oXp5TJ/CY0Sh7S3
	 n8QHnF6+Fr/BA==
Date: Tue, 4 Aug 2026 20:47:04 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Drew Fustini <fustini@kernel.org>
cc: Adrien Ricciardi <aricciardi@baylibre.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
    Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
    Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
    Chen Pei <cp0613@linux.alibaba.com>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
    Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
    guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
    =?ISO-8859-2?Q?Kornel_Dul=EAba?= <mindal@semihalf.com>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
    Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
    Peter Newman <peternewman@google.com>, 
    =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@ventanamicro.com>, 
    Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
    Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
    yunhui cui <cuiyunhui@bytedance.com>, 
    Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/8] riscv: Detect the Ssqosid extension
In-Reply-To: <20260729-dfustini-atl-sc-cbqri-dt-v6-2-7c22b05d461b@kernel.org>
Message-ID: <c38f0bfa-54fc-d141-c166-7355901d8ad1@kernel.org>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org> <20260729-dfustini-atl-sc-cbqri-dt-v6-2-7c22b05d461b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-908076126-1785898031=:1429015"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-908076126-1785898031=:1429015
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 29 Jul 2026, Drew Fustini wrote:

> Ssqosid is the RISC-V Quality-of-Service (QoS) Identifiers specification
> which defines the Supervisor Resource Management Configuration (srmcfg)
> register.
> 
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> Co-developed-by: Kornel Dulęba <mindal@semihalf.com>
> Signed-off-by: Kornel Dulęba <mindal@semihalf.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>

Thanks, queued for v7.3.


- Paul
--8323329-908076126-1785898031=:1429015
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-908076126-1785898031=:1429015--

