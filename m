Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CF5CD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8cqBiJr1vWR1zY9FNDCZGS5/keh4mkoxxo8z8Rzzgs=; b=af3dn9yyN2RyoC
	+ZhbWM0D/ZAte+G+X98FSAUA48ADeXg72rj81BXNFkOFh3vKEkZ0tLeX8wh1xPa8vDnsYwqYOo83P
	rFDe4baSuHqHXHZ8JQrTwO9WTB8SqDEh9P1SCVjvQxTIafxbfGyREfbimBfMRGPPOn5F7+AECh93A
	lLigIPxHvmmxAUhOfAvenF6kON8T3TEDs61eFcmwHEyQbDawVUT8caVo2W2Bqu73unEwq4ztweLuc
	K0wvDxQcGu1MohuZh6W3gjPBhTlF0l2k3VsWTaHSFPVa84dxnWGocnRhdbJTaEoS8rQVIibOmgJh7
	NldryhV6x5e+DBGqKgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGYH-00000005znD-0XFj;
	Fri, 08 May 2026 08:27:17 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGYF-00000005zl1-1Jfp
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 08:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778228829; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=a73lSRvoBg8oqtRew8SX40A5vzZ5CLJdEpWjAqKsG2Q=;
	b=akaueN1SiRQCOErWtcNeCoLAfAiXU/y920tdwDKyRYZXVfV7jcTAXDhV3F0gl4vvmrZz1+2lLFD2MjR5CdOlZtRf4REslmI4biSuqgumZansiLMcNrUrKnr2zeRvTzpv+9S5UnOzi7e3ICDUHp/xPBiTEfVZoa6awU+qNpiXz/Q=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0X2WjvBI_1778228818;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X2WjvBI_1778228818 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 08 May 2026 16:27:04 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: cp0613@linux.alibaba.com
Cc: acme@kernel.org,
	alex@ghiti.fr,
	dapeng1.mi@linux.intel.com,
	guoren@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org
Subject: Re: [PATCH v2] perf riscv: Add SDT argument parsing for RISC-V
Date: Fri,  8 May 2026 16:26:58 +0800
Message-ID: <20260508082658.3982-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416124945.121699-1-cp0613@linux.alibaba.com>
References: <20260416124945.121699-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_012715_572101_400B4F86 
X-CRM114-Status: UNSURE (   2.87  )
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

Gentle ping.

Please let me know if there's anything I can do to help move this forward.

Thank you very much for your time and guidance.

Thanks,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
