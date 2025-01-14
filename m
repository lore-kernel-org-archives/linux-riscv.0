Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A5EC02193
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=574p7RHKt4gE65U/L0kKw5WS4dGt5ZEdS/iox0Fd3dc=; b=kM9xLAOhkYMDZo
	CdX33+qpsub8QOGvL9zaHml+n9aRq0pODEHuAJ0YfGxxBE52RM1x1zXLL4mqc0S5lChEeUUFPA75k
	9WVY8PMBSbQlVcGDq6TOhVGOuIdN5vsYzjJk7GNntMcFjvmgNQWN3atfnkUdsUPLxSWZRKCqTjuo+
	N1dDozyvwdK7KM/1MkpkwYvVCQjEz0euQUIw/Hy4fBj2RH6CeD461++23Y+qLynvp5oEBVWZVVDGH
	EtqKZujkUsavEYz7BmLevbiEzajcmPuRNrmFYc18drvETWnQVYXfbo6ZB+m5O5nHrie+QLIAuDNZK
	pwS1cWTrsdzN/LuXm9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcIZ-00000007p92-1hGM;
	Tue, 14 Jan 2025 08:29:19 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcIV-00000007p6H-2HnM
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 08:29:17 +0000
X-QQ-mid: bizesmtp91t1736843306tynlkxka
X-QQ-Originating-IP: XFGGCXiBFBARdGKOy5veaGmh3Cnn/ltEdeer3zqsjS0=
Received: from [192.168.125.117] ( [113.72.147.174])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Jan 2025 16:28:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16871771307324602257
Message-ID: <FA848EA9F01517AB+db5dae96-9f6b-4800-851c-d1e764703cf8@linux.starfivetech.com>
Date: Tue, 14 Jan 2025 16:28:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] riscv: dts: starfive: jh7110-common: add eeprom
 node to i2c5
Content-Language: en-US
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250102194530.418127-1-e@freeshell.de>
 <20250102194530.418127-5-e@freeshell.de>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250102194530.418127-5-e@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: OE3tIrIEWSq4Pivs8JFmfcsF3un/I6SCv1GPzB6TFdn7Z8TSHcQ0imDV
	LTuTNh/rBgPBPlgznOOYpmK4WqYxYU3+2DhtZRk+dN9FT8xrfG6Qne4/oTlf0BrtURZFmYT
	CQBH6gzkiXf/8Q1p1mw4+LZ5YVsIXsPqnnDrGwspJSCKpb4HNjVZrY8/em4VQZJ+3Lnmw0O
	VsHzT+GgjXy+3zwAy7Y/OoIyBebwFdAiJFFs4FKCdkdeNxwUCT9X/GglERCStVN0I65IVfX
	FA0S74XGvSkfKfj830opsmiHFFjisn+ZUQRQrWyYkkB9cYtBpra7zShhq+JNM4u+ku4AtVE
	XSFdOP4uSFKD6Ky4TREgSKlvFJ2fzg//x+QfdD5fyglzAeENHbeKwng2o579bOf9cNU2Qjb
	8FfwEf7OV0QHV/MF6NEJogDWbxNdSofYD9cLI7f+klpmKCiFpFht4v2q+hrMN6kVLaAHU+H
	HXtdPq50Fgkt6XqFwU0A+J5feLh/6CrT6ruMffEBbXqwxT6hqe56DcCNDEbCgskaC1aYbNL
	lrr8+sPxXK5oVIkuI+vg+WrG7v+0T2hshEmxSU3r/ZUHy8lQNjyiOlMDuE50eaxVayKAH28
	I4wCsI6AtiJ73u+1tRR8ZFmPmRMxWAYe2j+QxR14navTU2+TmZ668auKmJM208unU2g4Xa4
	AdgX2a5KtZ5JVpiq7U3EXq+HRMLt13viMOXJsANZlUigloECUSRvsO9XVgfJLpvarqrDHTW
	PWatG+ICpkMz8E4RAMLj9gdlQ8Ooh2BkM5dC0R4HbCiDEv0VHO2fXcpWc1JPRP7XgB+LcPf
	VP/OIUCgqvPli/h11sbMuhxpTGNoxoACYqDz9gwHfvqtdyyTYNcsE/Ud4CW4bpebsR4V/Xr
	oxOEvTsYVXxlybl41RvM4Yi05f+wkIBznMojM8n2kgqZz80iPGoviHGHCKB7uPx6juWPNa1
	NDl9K4FXtGrmo/VM1qjIrBMnHDpN6Mo4fjkotm0q2dEBdKq+M0An0sgnk
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_002915_849142_F9879D15 
X-CRM114-Status: GOOD (  12.31  )
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

On 1/3/2025 3:45 AM, E Shattow wrote:
> StarFive VisionFive2 and similar JH7110 boards have an eeprom compatible
> with Atmel 24c04. Add the node so this may be used with the at24 driver.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index bf2f0c34ad4e..ad5cb85ebc59 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -245,6 +245,12 @@ emmc_vdd: aldo4 {
>  			};
>  		};
>  	};
> +
> +	eeprom: eeprom@50 {

The label "eeprom:" can be dropped if no one use it.

> +		compatible = "atmel,24c04";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
>  };
>  
>  &i2c6 {

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
