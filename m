Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF07FC4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Dec 2023 06:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SK0IGDeO5xcFKC4cOVq8EM57hRr/w2enLTUhUa3Y7Ck=; b=zHx1i2eO+CXspK
	YcF+ELOHd+OjehqygOuoF9YSIaPAXyoiv1OdfL+V3Qx3WJyWuBU4WiKbDF4cQxB2bJsFG9r3nxopn
	R2o5cG1dPi/keRvjHzSeR6q26scCPKtdiDWAMy3XSqX7zT6naExDPvRAgOMdyC8kx8O/I7jpCAENp
	f7WndhBkbo37pyGHRC/DZcarCUxdKbMwXS1qsoars9AIuPM226cHdX9Besa6U5P56o3FTzbV0TilC
	uEoaMC02YstZa4LLq3WB1KszO6KVJpBXyN5iJ6uRTEmkQCfeKxG2l7et/ljtOKaUtfrGJq/s0Z8qx
	ieKcRx21zyUBFUXLvmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBqjH-00HB3m-1G;
	Sat, 09 Dec 2023 06:22:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBqjD-00HB34-0m
	for linux-riscv@lists.infradead.org;
	Sat, 09 Dec 2023 06:22:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so13658405e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 22:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702102935; x=1702707735; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUfLyjWdTxwgSWGMLeNKXLU9SpqRs5Ux+VZkSWWMlxc=;
        b=KBJ4NXnEA4B/Jno5KTn2BihJw1FkeHr3JlnbWONDhefOBpSLrhMbZ+Ndy9J0femlYa
         3qSZ7REZYTImSWYHN1p05rhxvu4p3dYZbO1ImggHriakTKgih2QqT4FCTCfJbIPfv21x
         3mfevZNXgsAJbmcNZOWiFLaEYktSSCP8D1FCO11lHJzu/DoTPbCBovJBL3aPwqeaD+nJ
         X8WR27rILlZfFB8VSdtfsnC07HdIxnCiZrydlGq8+dG06UeCfTIk6BK/GdrLJf6/wSJs
         PGDYiRZiykJHnafXgqFNoNRcAMNbST67oioeMNSNjAHTQ9Xij4bOjbyjWrF5IlULKyC1
         BH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702102935; x=1702707735;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUfLyjWdTxwgSWGMLeNKXLU9SpqRs5Ux+VZkSWWMlxc=;
        b=qqd6feUo1QKsRL2oM3hd+jYdbau6Kt7cPYSqeA+Fj0gX1Ybscg3RCyhFVOF8LWY6K1
         y1r4CHQUYfWxkKAe/IscONzFSuZMPS5LnPKIfuQ+Rg2wj7bYpvfpUfLJYGCV5drCqIrc
         kD4Mp29+xWi0b+NtJIcxm/fvCzQDS8keRHrjjK8+z7XEtryxuAmHoFH9ThcplpkaAHjk
         X6cQPtVw6MwWDHjP9kbcyudfH6++IC8iLR08UR4Mn62jzwHy9CbPy34CCbS3NJ3cqdsC
         K8cdnbttzp0aZI+YJfCgB2d5o+5NAkdz6ZEBvGKRG5U79HwRETUeH/Q8c4pYmY1HCnXq
         gEyg==
X-Gm-Message-State: AOJu0YyOtxVIYI2boAUvvOmhxAc3+PvTCJBElbBJyo8esOfKL+MQSBOY
	sA/IVQY3sQ5rfHv5O/NjEpsOvg==
X-Google-Smtp-Source: AGHT+IFFrBy7iaKn0lxful6M0lWyJC8FTunVIKaO+dmv+Xj2upv4u13p3SvmzsaKkvkRJSjMMShrZA==
X-Received: by 2002:a05:600c:2154:b0:40c:3314:5be6 with SMTP id v20-20020a05600c215400b0040c33145be6mr655398wml.106.1702102934172;
        Fri, 08 Dec 2023 22:22:14 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm7394329wms.35.2023.12.08.22.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 22:22:13 -0800 (PST)
Date: Sat, 9 Dec 2023 09:22:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chen Wang <unicornxw@gmail.com>,
	aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v6 3/4] clk: sophgo: Add SG2042 clock generator driver
Message-ID: <1a6e3fad-cbe2-461d-940c-601ab5197213@suswa.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1aa4f76f360ebd7b790a4786641f1b0188dbba8.1701997033.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_222219_315635_2C522B84 
X-CRM114-Status: UNSURE (   8.54  )
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

Hi Chen,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-soc-sophgo-Add-Sophgo-system-control-module/20231208-091702
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/d1aa4f76f360ebd7b790a4786641f1b0188dbba8.1701997033.git.unicorn_wang%40outlook.com
patch subject: [PATCH v6 3/4] clk: sophgo: Add SG2042 clock generator driver
config: xtensa-randconfig-r071-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081933.MUdHNASt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312081933.MUdHNASt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312081933.MUdHNASt-lkp@intel.com/

smatch warnings:
drivers/clk/sophgo/clk-sophgo-sg2042.c:1282 sg2042_clk_init_clk_data() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1282 drivers/clk/sophgo/clk-sophgo-sg2042.c

7c68ebea1041f9 Chen Wang 2023-12-08  1258  static int __init sg2042_clk_init_clk_data(
7c68ebea1041f9 Chen Wang 2023-12-08  1259  	struct device_node *node,
7c68ebea1041f9 Chen Wang 2023-12-08  1260  	int num_clks,
7c68ebea1041f9 Chen Wang 2023-12-08  1261  	struct sg2042_clk_data **pp_clk_data)
7c68ebea1041f9 Chen Wang 2023-12-08  1262  {
7c68ebea1041f9 Chen Wang 2023-12-08  1263  	int ret = 0;
7c68ebea1041f9 Chen Wang 2023-12-08  1264  	struct sg2042_clk_data *clk_data = NULL;
7c68ebea1041f9 Chen Wang 2023-12-08  1265  	struct device_node *np_syscon;
7c68ebea1041f9 Chen Wang 2023-12-08  1266  
7c68ebea1041f9 Chen Wang 2023-12-08  1267  	np_syscon = of_parse_phandle(node, "sophgo,system-ctrl", 0);
7c68ebea1041f9 Chen Wang 2023-12-08  1268  	if (!np_syscon) {
7c68ebea1041f9 Chen Wang 2023-12-08  1269  		pr_err("failed to get system-ctrl node\n");
7c68ebea1041f9 Chen Wang 2023-12-08  1270  		ret = -EINVAL;
7c68ebea1041f9 Chen Wang 2023-12-08  1271  		goto error_out;
7c68ebea1041f9 Chen Wang 2023-12-08  1272  	}
7c68ebea1041f9 Chen Wang 2023-12-08  1273  
7c68ebea1041f9 Chen Wang 2023-12-08  1274  	clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
7c68ebea1041f9 Chen Wang 2023-12-08  1275  	if (!clk_data) {
7c68ebea1041f9 Chen Wang 2023-12-08  1276  		ret = -ENOMEM;
7c68ebea1041f9 Chen Wang 2023-12-08  1277  		goto error_out;
7c68ebea1041f9 Chen Wang 2023-12-08  1278  	}
7c68ebea1041f9 Chen Wang 2023-12-08  1279  
7c68ebea1041f9 Chen Wang 2023-12-08  1280  	clk_data->regmap_syscon = device_node_to_regmap(np_syscon);
7c68ebea1041f9 Chen Wang 2023-12-08  1281  	if (IS_ERR_OR_NULL(clk_data->regmap_syscon)) {
7c68ebea1041f9 Chen Wang 2023-12-08 @1282  		pr_err("cannot get regmap_syscon %ld\n", PTR_ERR(clk_data->regmap_syscon));

I don't think device_node_to_regmap() can return NULL, but if it could
then it shouldn't be handled like this:

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/


7c68ebea1041f9 Chen Wang 2023-12-08  1283  		ret = -ENODEV;
7c68ebea1041f9 Chen Wang 2023-12-08  1284  		goto cleanup;
7c68ebea1041f9 Chen Wang 2023-12-08  1285  	}
7c68ebea1041f9 Chen Wang 2023-12-08  1286  	clk_data->iobase_syscon = of_iomap(np_syscon, 0);
7c68ebea1041f9 Chen Wang 2023-12-08  1287  	clk_data->iobase = of_iomap(node, 0);
7c68ebea1041f9 Chen Wang 2023-12-08  1288  	clk_data->onecell_data.num = num_clks;
7c68ebea1041f9 Chen Wang 2023-12-08  1289  
7c68ebea1041f9 Chen Wang 2023-12-08  1290  	*pp_clk_data = clk_data;
7c68ebea1041f9 Chen Wang 2023-12-08  1291  	return ret;
7c68ebea1041f9 Chen Wang 2023-12-08  1292  
7c68ebea1041f9 Chen Wang 2023-12-08  1293  cleanup:
7c68ebea1041f9 Chen Wang 2023-12-08  1294  	kfree(clk_data);
7c68ebea1041f9 Chen Wang 2023-12-08  1295  
7c68ebea1041f9 Chen Wang 2023-12-08  1296  error_out:
7c68ebea1041f9 Chen Wang 2023-12-08  1297  	return ret;
7c68ebea1041f9 Chen Wang 2023-12-08  1298  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
