Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8477CCD6E52
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 03:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsfdEQj+gcIT0M5RRmMghovFoDRxnjVK0xMRn9OVBnA=; b=FClT+wT+cIs4gl
	C3e5uuyRUBF4imAU3HT4yG3QW2h2nUTjmtLLC8QaJvR4FYr+uGl1C0X4xazygVzRFQ8ZNo+4arcsm
	/jdURbiKO4KFg2DeytFjVKeqn6D462RKkEJwRBu1DUqd7EozI/LdqKdIiP1x4juNpEl76dh8BcjwJ
	dLmz5GkwztsskPA8vrbKF46IYhadO8wiQmuE1zbFxRyHJqcgB4CmPE4wcl01k3x9+vSoS77MSPoj8
	iVl6rXAxFaSV53PtmZ+ryhegRYJZAPszI/GJYUuHk7Uos9+QpLn7oRC0k97jmSzYpnSFVQev3rzZ2
	J53Pi8KEuf1yhwSlkrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTAV5-00000008QMC-00UD;
	Sat, 30 May 2026 03:36:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTAV1-00000008QLg-2wWU
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 03:36:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-83ef1d17904so14143901b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 May 2026 20:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780112192; x=1780716992; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg6hFjtrKUMa1DBnnEivBGGmIXQJ76e2s2hg2mbN5WE=;
        b=MAkp71Kk4LB6+O+UdNrfkgR28rNIyV//Wo+ovStlrDfKIjS9kRe2boxrurrB9DwmaA
         BuCbrFNVyAwkb0SBmHaq9r0L9f/yIz/Uj4k9D7cO8aPKLsaEDbXuCu8hF6ZMV9a6TsEe
         7U5Ot2LQkdt10B3w4FzPIz8zLTNsTMBpdUd0dgcA21HIw4g6lJyN77Cs9uDVB6cJbfdi
         3h3eRn08LoKhwlR4Hxo0q/8zykXAjhpdHvtML2wwdrTLU9Tp0UxxbWsTMJrNTvmQCWSt
         h4RDuOVrTJDXCA2WRWPEE2jBNt5pcNXFAziyKCksdArYvle6U6U+ksIruqyR57C/4SBg
         Wg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780112192; x=1780716992;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lg6hFjtrKUMa1DBnnEivBGGmIXQJ76e2s2hg2mbN5WE=;
        b=AhKqIe+yVYBn6tQF7+XC7WXwizaRbExv4+9UVxmVn9LHcJH/cWRb2wHZnSSC9Vqn74
         06PscDWY8zJShjlHIjDhBd9A9qYOmfLfnjYg50ZbU+FRIbd8vEPWpJlfZsK/pM1XSpOG
         DcSS09BRPMKH+jzUq8fKB1ngTFXxswSkjbZgnBf5GWSNTUTf5K55VwTH+4xAaMUBGYL7
         RL8gOQJ2w+MGIBVgM8PZpvNTnQIuc8+HEAiJRwpk90yGSB6PYMjzhOdG2lKbnlmbOTG2
         U312KptEUh8KuJ9NxCyrodi/xlcEOZ40fPCex3Qvd4UUj3i8CxQqvFh8e4LRknjEqVun
         3PiA==
X-Gm-Message-State: AOJu0YwiYDIz1vmOUTxPCydl6GC+tGMksOzCc3rb/13+U3eXCNZYqjX0
	803tRPfqwgRVeWFfPENFHjTU4BvLJ9eHXXVxp15ocTcmO7YWQXasW0zJQ17vBL+ZLEY=
X-Gm-Gg: Acq92OExtDuoW+A5gd89s2ZgI0Lhnp41JWEgp8SHJSaQ5OiQukecaDY0kTOY6vYYJ/5
	HvfLMAYZfg+E4PkhrU0zM93F8cotT29PKlugEgItKq4tCXYe9mM6amFvQGeiMISzoIRFxf6K0CL
	iyf1PmYME2PXYL0R0DEzgdugPJ11ME3+8QDbRThTEjXhw6tc2JE4A9C9H5eYgQJV6MsciAE1fg3
	/ZURhXX/mwFLL+qMAtRpL8Ms7YKQ3MoGCrbR95mMsZoZPCqygQ9d+9DahSsYNXNTu2BQ0G6QHWS
	KfSKKWN6E4H1k639FPDGDqSe/B0YA+qCAjGJY+Z/7nZCzkwZBz+fkrmfDJ0PHrln8sEZawgmDAi
	94quZUTb3E2bhRMJCZ2tisFScMKGiyinLqZ2QL1oulQbJdVAZIxhoZLc9R6S9GkZp4Ze/QtanJC
	ZIu+aU3e9+Nbot0RnmXv/Re8JHk0JFeLXf+QU2A63UKFvkLmifRxb7U2PcA+XdgwE=
X-Received: by 2002:a05:6a00:4291:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-842255c4881mr2207337b3a.38.1780112191946;
        Fri, 29 May 2026 20:36:31 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422a579123sm789724b3a.46.2026.05.29.20.36.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 May 2026 20:36:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v1] riscv: cpufeature: Add Zic64b ISA extension support
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <302dfaf7-4a38-408f-997e-68ed27de2341@iscas.ac.cn>
Date: Sat, 30 May 2026 11:36:11 +0800
Cc: linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Deepak Gupta <debug@rivosinc.com>,
 Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Hui Wang <hui.wang@canonical.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Xu Lu <luxu.kernel@bytedance.com>,
 Guodong Xu <guodong@riscstar.com>
Message-Id: <752F28EA-9255-4DBE-8007-F57947305D71@bytedance.com>
References: <20260528141630.2741710-1-qingwei.hu@bytedance.com>
 <302dfaf7-4a38-408f-997e-68ed27de2341@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_203635_754796_BEB96317 
X-CRM114-Status: GOOD (  18.48  )
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

Hi Vivian,

Thanks for the feedback.

> On May 29, 2026, at 11:14, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
> 
> On 5/28/26 22:16, Qingwei Hu wrote:
>> Zic64b describes a platform with 64-byte cache block sizes. It is a
>> mandatory part of RVA23U64, but a system may provide 64-byte CMO block
>> sizes without satisfying all profile requirements.
>> 
>> The ISA string parser currently ignores Zic64b because the extension is
>> not present in the cpufeature table. Add an ISA extension ID and table
>> entry for Zic64b so it can be reported in /proc/cpuinfo when firmware
>> advertises it.
> 
> I'd like to understand: What is the motivation to doing this, given that
> the very same information is already available as riscv,cbo*-block-size
> and hwprobe?

The motivation here is not to replace riscv,cbo*-block-size or hwprobe.
Those are still the right interfaces for software that needs the actual
CBO block size.

This is more about preserving the ISA extension name reported by
firmware. Some platforms report zic64b in the ISA string, but Linux
currently drops it because there is no cpufeature entry, so cpuinfo no
longer matches what firmware advertised. That makes profile/ISA-string
comparison tools a bit awkward.

So the patch only makes zic64b visible as a named ISA extension when
firmware reports it, while still validating it against any CBO block
sizes that firmware provides.

> If an extension is what we want to go with, then
> Documentation/devicetree/bindings/riscv/extensions.yaml also needs
> updating to match.

And yes, if we keep this direction, I agree extensions.yaml should be
updated in v2.

Thanks,
Qingwei Hu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
