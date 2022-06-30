Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A3CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 20:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5W3++o9VSRWNAvMfvfKK60P/o9Iyfvj3CGVP1O4EbU=; b=Rt1M0crPsdZezr
	Lhk+8YpqR2eQpWOyNA3e+uHD3RGbqP4Iv9Z68dIG4utps8TZplS+FvX6TklnSJXj4PUl7POIku14Q
	wZ7GTErRIOyLAjvhy6hsKhDBn/mU4swuQPwuB3aBUr9U2nCeiXlM1NnAcNtAbJSt14RBLKB/8Dj70
	A7XvHzx4KdpC0QR/m1R/HdtA95WlHL6sZJUl+cwxmTEoRXrLXlhzLabf2ISW8mDJQcoDZb2A6KlhO
	Kb+qB8Ef48BU30c0ZrK0asZgh2p1ozQWxpfPWmf0u7EC6ln9EYvUyRki3JvXB+p3pdGw62MoTYWpy
	0jLT6TTsR8Est6tKfMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o70gv-001Osg-1i; Thu, 30 Jun 2022 20:23:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o70gj-001OqJ-SO; Thu, 30 Jun 2022 20:22:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C20242B;
	Thu, 30 Jun 2022 13:22:55 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1147A3F5A1;
	Thu, 30 Jun 2022 13:22:52 -0700 (PDT)
Date: Thu, 30 Jun 2022 21:21:41 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	atishp@atishpatra.org, atishp@rivosinc.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	wangqing@vivo.com, robh+dt@kernel.org, rafael@kernel.org,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, gshan@redhat.com,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Message-ID: <20220630202141.37p5qhppkiz6wrcb@bogus>
References: <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
 <20220629195454.vbsjvcadmukiunt7@bogus>
 <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
 <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
 <20220630103958.tcear5oz3orsqwg6@bogus>
 <9d9e80b8-17e2-b1d9-14fa-f1d8d7dfbd9a@microchip.com>
 <20220630173513.dyrrmjbpxzi3e6fe@bogus>
 <3840dbf7-ca18-b7ab-4d7a-92c9305476fa@microchip.com>
 <20220630200717.zlc6z6zcqbsw7euk@bogus>
 <ddb8238a-003e-fe5a-2a11-cb34c324fb33@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddb8238a-003e-fe5a-2a11-cb34c324fb33@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_132257_996683_4485F262 
X-CRM114-Status: GOOD (  11.06  )
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

On Thu, Jun 30, 2022 at 08:13:55PM +0000, Conor.Dooley@microchip.com wrote:
> 
> I didn't have the time to go digging into things, but the following
> macro looked odd:
> #define per_cpu_cacheinfo_idx(cpu, idx)		\
> 				(per_cpu_cacheinfo(cpu) + (idx))
> Maybe it is just badly named, but is this getting the per_cpu_cacheinfo
> and then incrementing intentionally, or is it meant to get the
> per_cpu_cacheinfo of cpu + idx?

OK, basically per_cpu_cacheinfo(cpu) get the information for a cpu
while per_cpu_cacheinfo_idx(cpu, idx) will fetch the information for a
given cpu and given index within the cpu. So we are incrementing the
pointer by the index. These work just fine on arm64 platform.

Not sure if compiler is optimising something as I still can't understand
how we can end up with valid llc but fw_token as NULL.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
