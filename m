Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B23CCA5FDD
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8bGxHEiVbdrqZUegJ+tgBc2JNdNNWs5DdiXFK8n7K8=; b=ja+OsaX1e5ELrd
	FKeNiIk8Euz5T2ypj6yFDiBjOdNDdMTrZOsOCYYYO4I0YzfTyDXmAOI8DXiLlV1gzK3zw6Da8bwsM
	VuEwhI6QOL8nzaWieHegiXi11gXJgf/Ofi0alxP58LcujTsBnyOJ13HZnzKgXY/kQE1/pcz+fxwZU
	ILK7ijE9RbNfeUFIuwtUb2fxAOCGnrUZhnggNtpE80WNqS3KBP4xWF9AzSiE0nLh11yXxA9cBcMIf
	MAmZ8krbwtDmBVlw8eomYSY3moOMTBuzz7KyIluMN8GjleIClufyeaFF8iNlwlzJtNdOyWTDwQ1o6
	wpk134oCO/J5hO+8+5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2WR-0000000DkHF-2jiD;
	Sat, 03 Oct 2026 16:23:39 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2WO-0000000DkGm-2e6M
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 16:23:38 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-154e9d2d979so32126c88.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2026 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791044613; x=1791649413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxWbkNMJ0gxrVSfCconXVhPE8tqLr4BtV3xGSiKP/9w=;
        b=PzxtcXPz0xlXhD14C/GEjYgAJi+ioKdVUN7RnBaDrTFhSCIS5b02A1m1Scnoyc4BFN
         oI8zMEgbm68zwgncR+kUzI0O4UI45CbDsXUCyf+tGw20Nx36nRnEvW7N6ZyXSueZzeXb
         cGhvNza50fUA6z1LxXFMZ1c71cuR6lgpFt528cxQFV49fSBgE42zlJlQAYmd/E79XeUN
         R3WqcWFD3wjANRrrCK6wH5Zw42Wwu/HPuTPfk+YsQEuyQ+EJ6T+xgmby33XWHlSJjB9T
         l70JnQfSzzIPZLUzUEd/hJN9Zi/uCOL3HIdIwOSerud0r5mA6d9DeKcUQ0AvJNt1z5X0
         KD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044613; x=1791649413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxWbkNMJ0gxrVSfCconXVhPE8tqLr4BtV3xGSiKP/9w=;
        b=ztlNnEnI6TE6OBuepbMyqpd5vaG58DI7albD8oB0bVVDw1hn3FpDWv6oVydOkjbpxQ
         IbqLyy2xvGomtQnjX5JFiIsIowrLH2kZgYIKBfsN6hLhnINqdysU71YzNe0qniTScp+K
         eoLRmWFowt5u35NgV96yMwh9aXfhSyewVJ+HrlkFX1D9lAljsigVRtdc3B8mGycKNze8
         K324UdaXlRYrSQIrVrUZelxShK2pJhsKsnIs0NLHBnMYxCpAZsE9WDqliNjR3eJJ2iQs
         oBINui6vFcUbh7B64ZKhLKAsVqBeIEPx6GI/6hAV0Oq73ebY2/MC1bHEaIhOcQ/l+l0t
         q9iw==
X-Forwarded-Encrypted: i=1; AKwUvBy4+CtUxHo0wiZLpkPuAkQmrc1Iz3DwNBUKJnV/yWajSDX23sNW++Z2XKhMNyIr4cBSAOANPZs6Or/tzQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mg/+x5SPS1LkUADItFHQlsqhlVC5y6s6AGDaoMypQTpp/tB8W/
	AZoI4MsFbJZYrA+MvybnccJdKqdjFhebyoDkVFcxJXKlrOAOZ2Sg2LMXq20uRNtrIO8=
X-Gm-Gg: AYBFou1oFnqEiDEtVq4LzdHAqOh3hhSlkyn95fPyM2UfWKGE6ziE29iH+WgEiSpYGVd
	qGImhSamHmoFQ2ntFawj3HaQbRZwcIUbG4ci9oNes33/LUMj3iQH3ZoYTlXDx46yzx3hIddraUL
	LRFi7YMPcs6nIuhZ+giqAkQPhBnjf1zsAabILxjma8KmlVhqyInXZfCqyD1MhlErpZBlgmImOm5
	Ozh+zkqW5mDmshFFW1HlmF0p0RVxMBHoqsKP/YLfF5pwDlaNkLAMiyGYKdfISbFnxNWUr1Vg8xZ
	Blumqo9ZX2QWjKNeL8ZFFqV1wOy3P+64z7aQdTrw7DMoiKTT9PN1ScHu4tOlXDaFbZbLbI6dKMx
	p36hKt59E4d05aOP8psaaqDTHJyFnJkbzMLrtsWj399930UJg9J37VvZWfZb8ZBcC/BdYxBL4Qe
	EWhvW4UDHYjsvXR3QZqlom5BZ096ABAr9mEG9DJu75AfUPia1cgUeTxbX/v45D0OvUzxw1iN3il
	uCOaNLGXJ8gPwA7NZV5kt6xFFXBZeHRfjjZtZs0D7WoakdNmxf/2O25VpJVPw==
X-Received: by 2002:a05:7022:4386:b0:152:97a1:dd36 with SMTP id a92af1059eb24-15297a1ddc9mr3493127c88.10.1791044612830;
        Sat, 03 Oct 2026 09:23:32 -0700 (PDT)
Received: from hiagonb ([2804:7f0:9541:40e1:2108:ffa6:f94b:baff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3511d87cfa7sm3498737eec.26.2026.10.03.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:23:32 -0700 (PDT)
Date: Sat, 3 Oct 2026 13:23:23 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Joshua Milas <josh.milas@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy
 node name
Message-ID: <asErZOk1RtzqC7Ao@hiagonb>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
 <20261003084627.353899-3-chenyou910331@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084627.353899-3-chenyou910331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_092336_820982_799594FA 
X-CRM114-Status: GOOD (  19.24  )
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

Hi Chen-Yu,

On Sat, Oct 03, 2026 at 04:46:26PM +0800, Chen-Yu Yeh wrote:
> The internal EPHY node is named "phy@0" while its reg property is <1>.
> The unit-address should match the first entry of the reg property, but
> this is not checked by dtc for MDIO buses. The kernel confirms the PHY
> is indeed at address 1:
> 
>   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> 
> Rename the node to ethernet-phy@1, which also follows the common naming
> convention for ethernet PHY nodes.
> 
> Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")

My only comment here is that I belive you should remove the newline
between "Fixes" and the "Reviewed-by".

> 
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index ec3bf305274a..cf672cc6b935 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
>  				#size-cells = <0>;
>  				reg = <0>;
>  
> -				internal_ephy: phy@0 {
> +				internal_ephy: phy@1 {
>  					compatible = "ethernet-phy-ieee802.3-c22";
>  					reg = <1>;
>  				};
> -- 
> 2.43.0
> 

Best regards,
-- 
Hiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
