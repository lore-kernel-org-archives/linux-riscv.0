Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16D5C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDiby2ln6K2DDgFg3T2MjGZz+TaxTTl8pfKSrTN1NRw=; b=0y9Q/wYKBj07+f
	aLmUDgjABoGtRRY4TGmj2rIyp977Fw6HKEsWhNVBdl+samZet9zZplI9QfT4aqoO0rjd88Wi/cCqT
	Ve9pxSaBP6IY1Z31hthkd5Hgzni9A1VpQK5lOfmoOIe3+9xCqQl/oD5ivgdyFJReNGsP/gcZ2cwlI
	j6Vt6gf0nFfjlkqHOVZshDtY+HqA/YqarXTxJorr2nd938I/1/wjJkR8YS5KBlVvkN+j3f9HKdRTC
	iYP+rNCEBZV6AsR7TocVUGUw8WVfpw5/SsehqkuuNr/hv3RyMwcao/8Yl7ugw3tKCJ5c0yRj9nFMK
	53a5p+4Kp8KCm8IAx7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qviQn-00Cqkg-2v;
	Wed, 25 Oct 2023 18:16:37 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qviQl-00Cqjx-2X
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698257795; x=1729793795;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l26QKq7EILoWpWB0yHdqaizdI+WWdlawNjV7kFBCamk=;
  b=CQMzYsgLYyz5THwntxo1y6iqvmH5CwX7nNqIDsI/k/YzH3G/NK76kfgE
   zGszegMaKyHJchSDI6p+C33dEFTKf722jFHpsdswwX76qKWVKmhzMR5Hb
   sHLmlI9JNuv1Ye90GxaG5r4btgoB8GHYJScqegQWr/Qm+oTdza1UJ3qHf
   UZGlOfDh8nQ4QXNBhkglqiJbv8qKT2uIFUaX7DQ/shpaI4lDwATOz4E7t
   xR+bvYO6C3qTU62b8an+oi+Gs/nFkNWFuO5vXj2xn1Yp2x6JIEBCTyZRL
   dtf3laQlTCiD11/+uJlj4Y80sOtOiZ2uDWJRRRUR1kwh51Gz92T3+KT+W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="384579861"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="384579861"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 11:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829322954"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="829322954"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.32.107])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 11:16:27 -0700
Message-ID: <bb3ea46e-069d-4a31-a3fe-70098a7e53ce@intel.com>
Date: Wed, 25 Oct 2023 21:16:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] mmc: sdhci: add __sdhci_execute_tuning() to header
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <dfustini@baylibre.com>
References: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
 <20231023-th1520-mmc-v3-2-abc5e7491166@baylibre.com>
 <ZTk0VcFd3FcXIABW@xhacker>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <ZTk0VcFd3FcXIABW@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_111635_895977_D9825E66 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 25/10/23 18:29, Jisheng Zhang wrote:
> On Mon, Oct 23, 2023 at 02:07:03PM -0700, Drew Fustini wrote:
>> Expose __sdhci_execute_tuning() so that it can be called from the
>> mmc host controller drivers.
>>
>> In the sdhci-of-dwcmshc driver, sdhci_dwcmshc_th1520_ops sets
>> platform_execute_tuning to th1520_execute_tuning(). That function has
> 
> Hi Drew,
> 
> Just FYI, my th1520 version patch in my local repo overrides the
> mmc_host_ops.execute_tuning as the following:
> 
> host->mmc_host_ops.execute_tuning = dwcmshc_execute_tuning;
> 
> In dwcmshc_execute_tuning(), I will do some necessary setting then
> call sdhci_execute_tuning();
> 
> So I don't need to export __sdhci_execute_tuning(). The main reason
> is that the __abc symbol is expected to be used internally. However,
> I have no big preference. I would leave the decision be made by
> mmc maintainers @Ulf @Adrian, can you please comment?
> 

It is OK.  We try to consider SDHCI as more of a library, so
sharing any reasonably well-defined function is OK.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
