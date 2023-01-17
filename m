Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA2C677F1
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bl7XBy9faiTx8picr6fHySY5rX9+vq6K6CJJ1IB86yE=; b=aW+fOrKD8NSUMB
	e3AKu1qaNArSQ/6Zi/5G8OsvaxHrKo/Si0YD3p93lCHdyjVs3oA66Yz/s58Dk2ubC1OgVo1V0+nV4
	IH9PJCHYHK7ZHgZtbhMwn7W23i6XwUK2hPlev6QcnRvaMgmWpCEFi/D/nrpA7ifugsFZUl2bPMkMT
	d317ux/vOnxcC9RKi1ZkSXKG5nWZbW/kLKQd9RTZLyrPIOGphy2XK1juAZiXm6ZgS2j2OF9oOU3iP
	8XBwklmxsAUlN54LbxcHtI2cZErkF57aJgB25cZkg3mPYRpqpcjODsYgSGsS0qxYuAeka4bSoT4is
	AdjwNZflhIS92Sk4dK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlHF-00ECXq-Rj; Tue, 17 Jan 2023 12:41:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlHD-00ECWh-AL
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 12:41:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so9980119wms.5
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 04:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7AhrPmO0tZxeNAd1vaRS969sVdiC00uOEzizVMrUkWU=;
        b=hvqFQIERga9Hr00f2RIiTpGF7WMbFt4nLjSBKPTcQ5cwOiRXxw4Xj5MtvhxzL90MDa
         3OJH3dbSNxf2hmoBlSt58UKOnbPpBZ1vq0Vgs3E4Kt2+QXjnn9W59mF+Z9naMuR1epXN
         Ch0CRZr6cbbOAod8IofQfVya780C9l+1V+UxXZ/bB1IRVx22kHUxijth5F+bIq66gd2I
         +lirrmAekOWoF4zYCE6o/Ue2k57nzLeshuM812vteGuEVM9+o2OMsnUUgx6F6/GTJ0SS
         P0EMZh3/mt9QnnQF37BhlnROmIp0eFgwjYKp1pvJH+rj0wmFiMMhFMXHR67v48Wg1aYX
         3hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AhrPmO0tZxeNAd1vaRS969sVdiC00uOEzizVMrUkWU=;
        b=Jm7vK9/PGOEAvkaVGA0HopHOiZMVDOE5kAKBMBF6ynKD3dSHyoYFGcS8bvy2zgbYKs
         Kblx/ZgiJ4ndkaBA0HfUaueHKRXBRqx07CpHUJEeZYAscKBzX6CFXyOQbcHgaIMEdZpd
         gTtaK6adnMA+2LXfLApM9tDIvbRa3ouUfASv1S3FF0mxUlzwVbNBDqG+zKto0M0Jq2K9
         qYpQP3zdSFBKeWx6WRm5sMzuxq9Y00ryYQ3ABNkzbc50xlDp7uzceUnY40r/hZ6D+NUL
         IKBa0xUK5PtDEtk3av2Hw5jRognixdEjNhP8+02V+lcWac1yB7wAmKELVgMwCfqnYWyO
         +0Og==
X-Gm-Message-State: AFqh2kpfcvQiZVj0GiipFFfnFPaOr9hQzkeaXOc8RZ8budrGl3cJTljY
	00U5sd5HDSlw1nBJ5b2bDSqRskf5q1JEbZab
X-Google-Smtp-Source: AMrXdXvOXFzkJDJVEDcUrfI3qSv+t4TVgKSpUEnuvaInAlEy1PyYg1AdfsIIG/8URS6PjrPhTjImuQ==
X-Received: by 2002:a05:600c:1c02:b0:3d9:f85c:97ff with SMTP id j2-20020a05600c1c0200b003d9f85c97ffmr2877747wms.16.1673959275535;
        Tue, 17 Jan 2023 04:41:15 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q15-20020adfab0f000000b002bde7999cd6sm10661780wrc.61.2023.01.17.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 04:41:15 -0800 (PST)
Date: Tue, 17 Jan 2023 13:41:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 2/4] RISC-V: add alternative-field for bits to not match
 against
Message-ID: <20230117124114.bz72hfecknq6oymt@orel>
References: <20230113212351.3534769-1-heiko@sntech.de>
 <20230113212351.3534769-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113212351.3534769-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_044119_372920_AB6ADE12 
X-CRM114-Status: GOOD (  12.09  )
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

On Fri, Jan 13, 2023 at 10:23:49PM +0100, Heiko Stuebner wrote:
...
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 8c83bd9d0e22..a65bebdadb68 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -377,7 +377,8 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  			continue;
>  		}
>  
> -		if ((cpu_req_feature & alt->errata_id) == alt->errata_id) {
> +		if ((cpu_req_feature & alt->errata_id) == alt->errata_id &&
> +		    (~cpu_req_feature & alt->errata_not)) {

Should be (~cpu_req_feature & alt->errata_not) == alt->errata_not to allow
errata_not to also be a combination, right?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
