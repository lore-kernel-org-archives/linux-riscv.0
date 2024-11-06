Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF0DD59F53
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSDGHJPFgECk1KyAgDpSgEEFBA//nTm4I6vaDJpe/fY=; b=mwytCCRap61s7y
	daJOW1Yx/V+q0ZZLxecUFspUB5vHTGxwPJjNzWhHYPTRqJyQsvnYcooNFAkzngCYA5goBwoXXFx+n
	LLM/UAI99NMEqLFoBWrB+jqSURoUtHBfBXfKIgX1/roeVJfFi6lwh0489+uxfGp5QloxDUPL/IKpB
	/YTtMaz6ePo5zXFQrzqi9+th29Lm3A0lhlzfZ5m8ezpUAxG52fIev3IPdCzg4inZddhmXVdriF9cV
	AqU0dbzB/abv9nZNaMRBnrRHcejm2EgGJEftCCI9mPvmZBV+DA6CDBXTrx7l2UCTv0mLXLJiR0dqO
	V/BqoZL7zw6zoOLmJ95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jSe-00000004861-38X4;
	Wed, 06 Nov 2024 17:04:52 +0000
Received: from smtp-fw-80006.amazon.com ([99.78.197.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jSU-0000000480N-0AxA;
	Wed, 06 Nov 2024 17:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730912682; x=1762448682;
  h=message-id:date:mime-version:to:cc:references:subject:
   from:in-reply-to:content-transfer-encoding;
  bh=45lm7teIJIgBDhR6WrM3tTb7cS3pi+iWOg5nbyI7j9s=;
  b=e4qPUEvGSlQtJBs7vmBIYc93e42clI6pLjlzqaiZjTuarakCWtQ9G5gp
   OFOK1AoTNDAIWEuhbBHsXi1Kg21o7tHRL61IWRP7xVFQMapMEJYFB4lu/
   A9xf8Ykzuv+RFSOQLQ1YxdDnDyIwibqP/ikjd66izx3k5CkMcGSm6W6of
   A=;
X-IronPort-AV: E=Sophos;i="6.11,263,1725321600"; 
   d="scan'208";a="2538545"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:04:38 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.38.20:42869]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.42:2525] with esmtp (Farcaster)
 id 18efcd76-237c-46fb-afb1-2dbc7d25b1d1; Wed, 6 Nov 2024 17:04:37 +0000 (UTC)
X-Farcaster-Flow-ID: 18efcd76-237c-46fb-afb1-2dbc7d25b1d1
Received: from EX19D003UWC002.ant.amazon.com (10.13.138.169) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 6 Nov 2024 17:04:37 +0000
Received: from [192.168.12.4] (10.187.171.30) by EX19D003UWC002.ant.amazon.com
 (10.13.138.169) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35; Wed, 6 Nov 2024
 17:04:34 +0000
Message-ID: <7ad5d114-3d19-4c33-bb3c-7f8940ad114e@amazon.com>
Date: Wed, 6 Nov 2024 10:04:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <elena.reshetova@intel.com>
References: <DM8PR11MB57509ED04CB0730680735AC9E7512@DM8PR11MB5750.namprd11.prod.outlook.com>
Subject: RE: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Content-Language: en-US
From: "Manwaring, Derek" <derekmn@amazon.com>
In-Reply-To: <DM8PR11MB57509ED04CB0730680735AC9E7512@DM8PR11MB5750.namprd11.prod.outlook.com>
X-Originating-IP: [10.187.171.30]
X-ClientProxiedBy: EX19D032UWB002.ant.amazon.com (10.13.139.190) To
 EX19D003UWC002.ant.amazon.com (10.13.138.169)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_090442_177797_774F6133 
X-CRM114-Status: UNSURE (   5.12  )
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
Cc: jthoughton@google.com, canellac@amazon.at, luto@kernel.org, kvm@vger.kernel.org, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, kalyazin@amazon.com, svens@linux.ibm.com, dave.hansen@intel.com, pbonzini@redhat.com, linux-kselftest@vger.kernel.org, hpa@zytor.com, kernel@xen0n.name, shuah@kernel.org, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, mlipp@amazon.at, corbet@lwn.net, will@kernel.org, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, mingo@redhat.com, tabba@google.com, mathieu.desnoyers@efficios.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, roypat@amazon.co.uk, linux-trace-kernel@vger.kernel.org, jgowans@amazon.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org, ackerleytng@google.com, xmarcalx@amazon.com, bp@alien8.de, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, seanjc@google.com, derekmn@amazon.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, graf@amazon.com, vannapurve@google.com, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024-11-04 at 08:33+0000, Elena Reshetova wrote:
> This statement *is* for integrity section. We have a separate TDX guidance
> on side-channels (including speculative) [3] and some speculative attacks
> that affect confidentiality (for example spectre v1) are listed as not covered
> by TDX but remaining SW responsibility (as they are now).

Thanks for the additional info, Elena. Given that clarification, I
definitely see direct map removal and TDX as complementary.

Derek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
