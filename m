Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A10C5DF8C
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 02:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpGK3Kzhnkfj2wZ7aK1s8EJq1LwTbO1TmD5oJ3W7rIU=; b=R937qc91SgZPoi
	0mhTxSnEm95TsVkhewPgQPG3of/jGJhi+bZ6p9vCE/fEArKqxo4dxVVnmI7apM9uc/KNE397QOrOt
	uYp3nFcyYSK8ZPMEhdBlgO3gPtMFNkFvHpnWKieQcbYD4kGgs9xjuNRwZ+aWpt1epM5Y1SX7rDNfF
	+EMbJTa6uq/5GAHtZPTJAbFLl8tpBl92TOIUTKp0XkyB7y2B9Hi56oBh8gPcAI+3L4j1IDHJsQD5d
	QJ3Y2afeqwA6nCmJiLltnxmCDdS2/9MdLlxwZMnLka7fRnhAt3cZ1pG5KSm6Emw7cLEFGC0V2RDb8
	sCbJZVAAnjV9+EzmgV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxbGP-0000000EF5c-3HmI;
	Sat, 22 Aug 2026 02:15:17 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxbGO-0000000EF5H-1UBr
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 02:15:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ceab75934dso22620595ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 19:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787364915; x=1787969715; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9puE3+zCLEaWdw8EId49ZyEBO5d5Da/X77xZvHMcX4=;
        b=aIzUqfFF+RJdzO5S5ZTI+qZX43sNucOmoPkeUKuK3+eBXgY/YymPMnFEDmuYNCBYGp
         DSUcoCb5oCqITfptw+KDH1qgpCY0vgcWZ0Ow+n7wnrAhsboZd3qTwS9dQmCJtlqIYMbu
         ZnlcLRu5K9te6/Lq6Cx4XlCvdqVMmQSpmSNLqXgefGJHDqC5okyoag1jtq73aJg8B23r
         mLbBKFvz8Q/OKlzTCxlklKKFuhBghEeLyFFjmjC+HJdxFbNVYmgdMlKhvXnu7EDczyQt
         gTjt/1ksz90JTY9k2O9bN/AiHM8g0m1gNIduMliYFdtr5pnSaPMVUDad3UOsTglAPC22
         FRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787364915; x=1787969715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9puE3+zCLEaWdw8EId49ZyEBO5d5Da/X77xZvHMcX4=;
        b=kGfLhJ47U955EVo07EDYwdcHWaDOkQu/2G7ikDErQf55dFdkASUHE5juC38SDxAlup
         S34TsEq7eiN7hEfYMwgq/VQdKh0rRyMByvq1Xm5VPFOx9+5sQyaA7mcZH/X2qby76Ts3
         WIBgC/AZ3PLZCyjJbLkZZz7UWYz07AHVVb9YvbktIhzXkfz1oPHXvr2LjQUcCIdA9kUm
         cf7dxOSEnIEXENd+wrNcyK0pG+Txtki0sRT98QJeKeDAe058kIn5r8KJ6fRMCuqXQMPj
         gZt2CgmzkveCXNVoCRhGUQNHRDssftdWNkjTSemTSOKAChbO5fPrHgArCdNc5yqltx2n
         +MFg==
X-Forwarded-Encrypted: i=1; AHgh+RqRJ7DGTQ3nAb1fjgRzoy0tWMabCscBV9jR67LbouqT7WIIaD/Pn0WChyCGTgIuJ8knyIV/1Z+d65rpiw==@lists.infradead.org
X-Gm-Message-State: AFuF++kL1Q7CVHfBUhRdqK+7KvPB/bJdzu7JAxyHr+Js3hZ0jnTP65Ru
	pwtAwOY0AjDAVOLFkEFEmZP0bvxmQh0z8D5oQNrknqOZR1NECB9NKnOk
X-Gm-Gg: AR+sD11iqzU58ex536zkpMT4w1KYvqU8WBhT/Zq+eA9HvyxDFh3EWaJovOZxMwm0sw4
	NAg3e85LxMqiRd1nTEZWcr4z/zX4iAriU+i9xs0Dma+U6bpGiL0ajo6hnDZvz7dhTZUx4Dl44Bd
	YXM44/JonnpYUZ+l141/SwlQamU+3IdHw92xBa1oJpVOZkpcLdzKfjlY74pyk+DVz0peL8QB16D
	E/Hu7pxLlEV8r+iKBkIbmJTdSiqU4t3qU9t/R0qMTdyN8ww+phkKaxNATyybKHgX52PSooeAcYp
	Gyb8lmDH41Pk8kof/reS8jc4CO1RRAQbzVP5ms3EtnWztNA7YVkVnkKHqDtcMATrqFy4eKBMNT3
	fa7gra13zGqip8P3zQrNeUF9HLQT6KS3A2btYNb8hpPHFpoUEz5Efy4JRD5pUhT0AuggPuQjLVK
	QD5eSwhVpzxSHPARNj+eyzE4ok/uJSi6h2XRVHrOS1oh5gzQNpntjnQMh1Xyg=
X-Received: by 2002:a17:90b:4b89:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-395deeae6e3mr4932581a91.6.1787364915420;
        Fri, 21 Aug 2026 19:15:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d8b1csm1062983a91.11.2026.08.21.19.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:15:15 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:15:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, chen.wang@linux.dev, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node
 name
Message-ID: <aokF9v3orE3nBz4D@inochi.infowork>
References: <20260803163427.74445-1-chenyou910331@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260803163427.74445-1-chenyou910331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_191516_401708_750F62D5 
X-CRM114-Status: GOOD (  18.85  )
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

On Tue, Aug 04, 2026 at 12:34:24AM +0800, Chen-Yu Yeh wrote:
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
> 
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

Please send this with the same thread of PATCH 1. Otherwise, LGTM

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
