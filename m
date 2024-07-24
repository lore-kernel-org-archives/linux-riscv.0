Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBB9C3DA61
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 21:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyXRSRFKVYKdJX4YB2JmptXCNEHzZJPZGSWQDbu77GE=; b=Ztl0LiWZbu9CkD
	Tnn98wd+myvCKSIKisupwSFedENAudRu9+sbTxCAhlfTBDK2FGery6r1IjS5GbyOKt0nTSJ62KXTN
	JT3sdOLmSEtiwABT7nqODQLKzN7QiJ9Eff246DWj4UeundDixjzDyr7hiSuzO08EnSbnxy3eMGaOP
	nB1ti2aRzpXYbXfLdNe9MZ6rzezs99ZFwU5FYGUFFtXkKuj5rdqSw/6OFktDcD8y4LPpTaS12HQ+D
	qFKx4m5O/b41g5A2cMZD5CWbvocTfoVuw1dUm+cL8xolIVObff/2JPImJCFhtf+LI0IW3yOhucyOD
	C7rMZreL+Va5SSqPtJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWjEy-0000000GXYp-34Eo;
	Wed, 24 Jul 2024 21:09:40 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWjEw-0000000GXYK-1SJ7
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 21:09:39 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7a115c427f1so189599a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 14:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1721855377; x=1722460177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JW5RrNNJxqjwuGLo9kHT95SO/33HKB3UwhgKtE5uUyM=;
        b=D5mAN6DO8AFFEUQCPH+koEphJIKoLw/ZzIoKPKMQKOwepfRA0pSIW1HGiGtBE9Dsoh
         RQ+bTEq5gqRxSNu8pInjEtJymhZwuMPGzVF8TvZlf8K1SNNNlRsh4lxEpK4mvAbk7E6g
         NfVLlJKsOleWWsDSMBnaxKgMDpazGm4SIQmNAdI86bOq2Vb74s6kNNJPTu1WHtG80pgY
         zvyqoj8mqYOXQp1mI7O5B0hw9GEewRwj3nb0zQGTCJWmexm9bm0d/LeZWTxioWea5gKC
         QKKospttrOFB5mU86Q6fCWPXdOA2Tc7D3FrwCHJyh1s3VsdVsxhbeI25qsPjagSoxYb4
         59Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721855377; x=1722460177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JW5RrNNJxqjwuGLo9kHT95SO/33HKB3UwhgKtE5uUyM=;
        b=RGK69gk0xdU8egGRMVuwUyhwKIXE12bc+gHhMPMXn4llftmUS9V5eYftxvll+dXoGi
         johOvfF19myM9BbdQdwBo/Eo6lNwj30WJ4AqlJDSkmER9XjYOhb0nuoA88ybsDV/03Dh
         +ttYIEb4ANZSvxvxULsXMMzbPczGjtWEvfGREHXH7ogU6I67vc1eguGFCskXtGW3WxrP
         JSbnEpBCxzESjjR0wUPpj/EJUPIZJ3BsnpT17bSnHTIwkGclRKOnZ1OvswhKJhA3PSp2
         dIp8gohEj8do0xI2MgFNtOGk4SAVq2e+9KUQzmGQ3fWJPgVNXeCZ1Pt1DKdKf1W+ZuUd
         WsEg==
X-Forwarded-Encrypted: i=1; AJvYcCUw6p2H5u/9KPE+WC38ny+E/mu7GSWjcTC7/S4uWAR4yJGaW7hA4A/gOoCRI3zqkMEzohWQGfcUoh5ZLE/Y+g6J5dneRRMC7Korzer9UVj3
X-Gm-Message-State: AOJu0YzQn/qaApR2TfMAHPWMDO3PWbXu/ycnQWfkBzRw+Vsv+aFxHuhm
	aCWLiJ/akuJ8HBF++ZEf6M+anKu83Ms6qFs+VkgD6kGcrKcf2CMg2DihvYod3cE=
X-Google-Smtp-Source: AGHT+IGELhs314KqDpmVaOF4YhHiDvPSIICIdBh1kBNNnVk36MClFKGOKcaWxOApghMkCWpIwy05HA==
X-Received: by 2002:a05:6a21:3396:b0:1c3:b267:4261 with SMTP id adf61e73a8af0-1c472830996mr1583265637.12.1721855376943;
        Wed, 24 Jul 2024 14:09:36 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:8821:4dd1:578:cc09])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb738bb33sm2164778a91.4.2024.07.24.14.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 14:09:36 -0700 (PDT)
Date: Wed, 24 Jul 2024 14:09:34 -0700
From: Drew Fustini <drew@pdp7.com>
To: Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v5 0/8] mmc: sdhci-of-dwcmshc: Add Sophgo SG2042 support
Message-ID: <ZqFtjpxXv7pRpZHV@x1>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1721377374.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_140938_573942_585CA04B 
X-CRM114-Status: GOOD (  19.58  )
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

On Fri, Jul 19, 2024 at 04:44:38PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This patchset is composed of two parts:
> - one is the improvement of the sdhci-of-dwcmshc framework,
> - the other is the support for sg2042 based on the improvement of the
>   framework.
> The reason for merging the two parts into one patchset is mainly to
> facilitate review, especially to facilitate viewing why we need to
> improve the framework and what benefits it will bring to us.
> 
> When I tried to add a new soc(SG2042) to sdhci-of-dwcmshc, I found
> that the existing driver code could be optimized to facilitate expansion
> for the new soc. Patch 1 ~ Patch 5 is for this.
> 
> Patch 6 ~ 7 are adding support for the mmc controller for Sophgo SG2042.
> Adding corresponding new compatible strings, and implement
> custom callbacks for SG2042 based on new framework.
> 
> Patch 8 is the change for DTS.
> 
> By the way, although I believe this patch only optimizes the framework
> of the code and does not change the specific logic, simple verification
> is certainly better. Since I don't have rk35xx/th1520 related hardware,
> it would be greatly appreciated if someone could help verify it.
> Note, the DTS change has dependency on clock changes for SG2042, which
> has not been merged in master/upstream, so if you want to test this
> new sdhci-of-dwcmshc driver for other hardware except SG2042, don't
> pick patch 8.

I have tested this on the LicheePi 4a and found no issues.

Tested-by: Drew Fustini <drew@pdp7.com> # TH1520

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
