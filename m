Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61DEC79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 09:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmtmdEhTKYuXNbPge4q1u/ybnryKZLhMyguhioNuAQ8=; b=a4AdKerh5nPaee
	fl0KpWXjfhG05aQmZME6/woJCu3shOE7wxJdEkvDhixTOGkGVQIIR9jt48ybx/pkyu9x97pguAEyA
	+vgeCd6XUNq5Jl6VacGPQzhHxoApRHIdc9i1DZEoB+pVwwcZ0W0UFhQjySn903AXoTc/c8XGPyH9o
	oiNzPwXnmGJXLGnvTSSQupTk9PCmC77ge8cEDJUYGmvREsYGYIfd0uVCOkYFxpJZIhr6ntpjxbyEC
	w+cMrxsPNI4nADOVd0jdJW1H0iMNqxRrxFsF/X6rpeL5eatY0tW53mdC1XVZVjqER7l9vL3fCcAPb
	NO1PhLPYNbLFB4iUbE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aum-0000000DqN0-0tKe;
	Thu, 10 Sep 2026 09:17:52 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aui-0000000DqLS-0uyW
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 09:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789031813;
	bh=ih/0eGwjP3pa1Zvf36/JO8P/s6JLnhXll9CcTEzBzoI=;
	h=Message-ID:Date:MIME-Version:To:Subject:From;
	b=QvOPFH/eoXFBg5wpEP5xkuYBA1QfVsRLAkP0bIyUCaaAFS/ha69lNEQ5dmAly+on6
	 13EwR+x0E/EpYyNgEcPZke3djZL9g48bun4CL9V14i62HWxRzbFL0IOyNbv3ATyCM7
	 knkpUXpXp6s7Dlx4WNzzZPskKTKKQBV/0muUooGE=
X-QQ-mid: esmtpsz17t1789031811t85cc57cb
X-QQ-Originating-IP: 5xsPgH5p3GdZzHV9+PFDaz/dFOGWwdmzJSnDK63Zh+M=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 17:16:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17548016533415801729
Message-ID: <0710BFDE1F0C1A44+904c9e59-a255-4207-8f39-d465c6d7c273@linux.spacemit.com>
Date: Thu, 10 Sep 2026 17:16:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mayuresh.chitale@oss.qualcomm.com
Cc: adrian.hunter@intel.com, alex@ghiti.fr,
 alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
 anup.patel@oss.qualcomm.com, anup@brainfault.org, atish.patra@linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 irogers@google.com, jolsa@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 mark.rutland@arm.com, mchitale@gmail.com, mingo@redhat.com,
 namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
 pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
References: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com>
Subject: Re: [PATCH v5 05/14] gtrace: Add functions to start/stop tracing on a
 component path
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mnff/9wu0oJY8XGA/yP30laCDU+y2XYIkN8uTElcFBrxCVcBFGnmZSgI
	U1BaeqBnMwbAId0E3HZMVbgSv2ZFb+iBDmTOOHV08L40KqH+LrmW59+wpT3+wEJamjOIWFA
	8LHVqcmEgrrw8Mk54EzHphsrHpwRCfrN0xC1AnAROe0saeFG0z+HeKoyZaenuAQj1+S7iWb
	ZQNPvhaLN5K8DKzv9Pztrp9c2RXq0Tpkl7VbiS0cVCCsC5CLCWkU7XqGT7ky1LbOA6Go7su
	8L3hXl9t1Ch3Jh28BKC93wqikrjP4yDuomfTTazzOhGAqUHtOZcMa6RD9SKSAJwzXNlbWES
	xn9rUKBctLgzWE6UQWg355hv6vnr5BBCK8EsjZBvDsY+LLubADM2GslvxOQ9pGJ1U3XfbMY
	UlzEuM0t8BPoYzD56LqpKizUQEUaV8scM6ylItCX+AZVLXdZIrzXrkxKJUgdkZUf6uM8f9T
	+edC60ael0C9RTHa/LP68wYorK9caAfdGwdXio0Xxt/MK3ak/8E9bWqdg7q1zYKGcGa+grO
	NcFwYznzT0is6DtElydjW4n5i4GzjctTOyPcT25vri4FVfg0rv+RjKyFAU1lD0Z2PEIoZ6y
	nE9CemrZftyIS7SwH63lfXA3ALfnQb0PholI9iQFqE2rtKnXbAnj2jW/4gBiN0j1znnJvfJ
	O8VMA8HnY24wxtobuckhXMeEMifW4HpSbnLWNTBuVkt+KUSHzOehPvLYE5mwS5tFONGMjjR
	b3jbd5lViwImhrGiCYqMaXjJTdpdVCmO0BrlgUfzycL5PLNCaCP9q/GSoiI7Y8GnbbvD2Xh
	hKMd1shIfw8TME9hIwUHSGbNrq37Mqhqt3lpXq8NTvTvfKp76DDjgoPK7zUn2pvnXl6yNAS
	ascNiJd5vplUZwiKZk+UWhCSL9AyUBNg9UgiyU9Dh/gDGJpj444QLfd2tSvrBC8qef8XYC3
	Fq5+v4nb6xd60F8S+5ocf9A4IaRn+ZAppqfhiY019gD4r22HK0BkvCrsIOEhBYcj4N0w=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_021749_109067_FBA49C71 
X-CRM114-Status: UNSURE (   3.60  )
X-CRM114-Notice: Please train this message.
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

Hi,

It seems that the scenario where multiple paths currently using the same component

has not been taken into account here.

Regards,

Zane



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
