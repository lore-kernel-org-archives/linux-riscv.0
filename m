Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAB9CED26E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 06:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujrTTntcRZwIY6heiWVAMVWl8eU9a/7DZD2K/S4Ke6k=; b=Oh/hqf/dL/cskk
	b/WOxVgWVjB8AHuh4LV41csjzJP53Lz3Tb/rYWe0bRlRrYTt7H66u1RnuHR/kseHiEcJtIyzp3meG
	HQ9Ks1WJ27xdOKPLMxz3EKO7VZR5AGtJ4ZxH4TL+noYyIM81VgvEwFZm1cMnbhKM2BYnwKCrdiLc1
	Q0tUVE3WuO/gVtQHopBP45fbCw3h+QswKLH4BVB0L4NVVJE1anVigAAPJGGJGdSp+BAZkzRfui9xb
	QQdcEwRpBT+lkx5A3xHrPJqQT84CyrsrdYcsG688FNsKVqfyalRkAP7DxQdNXyXsh72gaxUSxHUPH
	X2EjvezTRNN58tJ44/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3gk-00000004eZL-2A1U;
	Tue, 08 Oct 2024 06:27:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3ec-00000004eIk-2IN0
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 06:25:08 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e038f3835so1518805b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728368705; x=1728973505; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KcO0kclRnti3T2Fe8Q/2qn3o4aRc8CbVApVxuVxO7eE=;
        b=hk5vsNWIsum65vmoMisFsp+xIC7XLZvUY7XSLsq6xxEhRu9R4fSlGsxPiVIVWgoRWL
         pKldCTLPBwuXf6iWX9+WGguRvs8PJ+TkXQB3Q5fsAnD7eBlkRZr59UfN42E9VLPZxcDR
         to0iWU1BiLalRe0SaQhteMkPeFLrYLzeHkRmKLu0wtl7ypNkhMoLGD4gbVT/7o1t6CfM
         rlffTO2MjTmYMc292/EFXhGSldDJRiEmG/GD3O0w23gB9ujO6L0L4XUcILlmdfgSqnQ0
         LxCa3xQHoyKHJCcJT9R6Bd/ilTroBgsVQqhrzWIva59EA601/Cr7mimf7uRuZiT6eqZe
         b0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728368705; x=1728973505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcO0kclRnti3T2Fe8Q/2qn3o4aRc8CbVApVxuVxO7eE=;
        b=Kb78eyy2Ezg+iGmgpm/61ljWnw5eTaoGXLolC/2jNQYqrd0/QO/TY7K6aeuTyg+w8H
         axVTJdo8roEbjJjI6+L2rr8H7DWkEZrKyRj873eJ6qdrtUu5pEYWzZAB9gOyRuyrYLFC
         acC6qDQBTAlo41z5nbhNCgvupEYlyg1rI6jq0ji6X1Pg3HzmhNEaRqBZ/8ywLUFN6NCt
         s6e7DBsdIIv2t5UKOu/GgK/9S5Q8wHz/mZgmPOfyWU33aPDuNQbL0cWSOPoT+HSd25PK
         Xr1F2i/Wssgvl+BJ20mC2TLi+8x8JjWM76j4TNWhRnw4EpNevk/4+aLzsTkzTOB0vkRf
         gJDg==
X-Forwarded-Encrypted: i=1; AJvYcCU2OCXznEzEM6gJBkEBWF4Il8q5GNPFFJjHjKZ3gl49MgcPAOx5EIhj4Q3bQrceHtPKLySpBqOkUjuPwA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7h1hSDBmrD3cJg15Wi73DSL2Qt4SUW6S8Y5yvdq6Es4vR/RzK
	KP4ZUvLo2+SlH+eiayUF84xsvDpQI2pZBgNSNem8GVTZO11S6Gpo
X-Google-Smtp-Source: AGHT+IFd5xP48KgBsGIGdoRms/LeQ5/eyjLYz0VcwFnYcHyE9Ih7SovMGkiTJt7oGRMISjZ/fOOfzg==
X-Received: by 2002:a05:6a20:438c:b0:1d6:2378:58ea with SMTP id adf61e73a8af0-1d6df73047emr22040511637.0.1728368705335;
        Mon, 07 Oct 2024 23:25:05 -0700 (PDT)
Received: from inochi.infowork ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13971c85sm49367145ad.239.2024.10.07.23.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 23:25:05 -0700 (PDT)
Date: Tue, 8 Oct 2024 14:24:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, 
	unicorn_wang@outlook.com, conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com, 
	krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 0/1] Add power key for pioneer box
Message-ID: <kmmnhqatth6uhr54jcuiuy5shhzdq25msyp6muiih5gchfytky@dd37ut4uv5xy>
References: <cover.1728350655.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1728350655.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_232506_716836_6C62F1B8 
X-CRM114-Status: GOOD (  12.62  )
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

On Tue, Oct 08, 2024 at 09:43:32AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add power key for pioneer box.
> 
> Thanks,
> Chen
> 
> ---
> 
> Changes in v1:
>   The patch is based on v6.12-rc1.
> 
> ---
> 
> Chen Wang (1):
>   riscv: sophgo: dts: add power key for pioneer box
> 
>  .../boot/dts/sophgo/sg2042-milkv-pioneer.dts      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> 
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> -- 
> 2.34.1
> 

If the cover has no meaningful information, you can send the patch
directly and put the changelog in the patch under the first "---".

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
