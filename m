Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738A8E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ89yLtPTyFmrGTr7OIic4ofZ4boiL/NOuAO2qLE0Ig=; b=S58NHPntqHgaXP
	xEo8t1qJJtFene8cA6o0+m6sIKvs4vpQtssDXzUQp5i8jtj+amXu7kTMAbYgQ5t5+MJnuW64YKroE
	jvbSBYhv/7hE0D/fYuvCINw7xWxYBq56+8P2pdcDfrQYgLBYHcnCOSYW4bmDySqXUhFVw1LIQAHxi
	1tH22JqPjesvOvFIUkJYSBPS/GLrhwaT6yrt8vdxyKBimNXlDG/CJ1Jh2kpYEfXQBxUOo+i+zOVhD
	3WkDVzh6z74DO4qOVXMLsfBu0erUaaoga4UZWe0sw/wGyjgxVqjOxSeFSIKWAO2L6CUxfYM3rky6L
	s1QKlFPvQm3AC74sE/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbNF-00000007gKy-1ASj;
	Tue, 14 Jan 2025 07:30:05 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbLh-00000007fmh-19uw
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 07:28:31 +0000
X-QQ-mid: bizesmtp82t1736839655t8w05rpm
X-QQ-Originating-IP: eGqhrEoWF6jWlA3opE70k2K13n+rCF53FvpGeyK1wHw=
Received: from [192.168.125.117] ( [113.72.147.174])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Jan 2025 15:27:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2570354929066496579
Message-ID: <5F5ACE98B916A290+edc923d2-0ee8-4e41-8e69-f6603ef014fa@linux.starfivetech.com>
Date: Tue, 14 Jan 2025 15:27:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] riscv: dts: starfive: jh7110-common: qspi flash
 setting read-delay 2 cycles max 100MHz
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250102194530.418127-1-e@freeshell.de>
 <20250102194530.418127-3-e@freeshell.de>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250102194530.418127-3-e@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: Nw9C1WBu09hPfjoibA9DYZG7811bQgKDg3An/sJdzTrYtmQP40fp8KCc
	SzR2sab/vA49s20HY8ASB23fROgkDrLhZ1FGyTAgOAP9nxX4DUpljLK/5OAc9YuS7pILAag
	KhrF4N9dibiHGSsPH6FY78084p/i6dlHV8Nx3z/4HMM4bwWu4sRBGaquzkDX6RA+AgE8gv3
	u6iT5wuG09lCyMkpbRP6kPH8U6+jmtMmKxUlOtmV6+J61CHVV619/LZErFxnKnc7VyIvZfs
	AHhfn2ckoyaja6HHjvJBdc3Cj8K4RPRPl2x/xb2w/1g675xBqQJ5SXwVZqv1utaj+nQiS+m
	Vm87HpY04EcQc9RwTcOX++w8oNjHNdH8S/IKJYNrMQ1oohTA5j8LfHCjb8Y4MLY3uyTqMGS
	nqNQ2V8T6yhnrr/1Fzdkl7lOszGIqKrz02QCVMfIPjC8B8rTqtA0j9dWzFpo0e62uR2fJgg
	vWizxcz8jUo5PxBX2bkN+/OqXhCofV81TRzB3BBicqezHDHvPN71VpOR/pugq/KgW1uAV1P
	Y5oLCxtDOFYkC8L8+I7UDPR9DmRpDsaO5MhRh1TWKsudlUWlq68qd8YkySjGGkQzdAO77ZF
	ElJx+EEFP3Je4X5wW2o3LMdEZ4Axr1cOScxu0qv0HkJhX5HPJfqK4xcufrtpfi4pANqE2y5
	cMcptJBhzWJBHCGV+bBDUxn7FNLYYL/uFizGXqyDuq13h6HQkUCc8gguN1Z6W1eNsek4taH
	C8fHLw/zYKc/1WXhBjfuQ2WEyI4mxwU3rAeXEuf4YLT63rbsIm+fLKTRRVuqbJ2FEdsYOlL
	a9jvJSmyKz/FrkNIQctFdxMn7caKxi5VgX4Dz5UF9PqW+zLXGi89AoXJxoCrcfizoNdmHkl
	jbf5VUWnHS3cZLDPqf86oiuSrQGZ3t8b+O6eacgj8Jo+YEPPyiX63CJ/2XQcHzzF4nj9099
	OCeCxugkklPILJsAhSb+u3gQQ
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_232829_691076_881F9EF1 
X-CRM114-Status: GOOD (  10.31  )
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
> Sync qspi flash setting to read-delay=2 and spi-max-frequency 100MHz for
> better compatibility with operating system and downstream boot loader SPL
> secondary program loader.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 55c6743100a7..651f9a602226 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -317,8 +317,8 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> -		cdns,read-delay = <5>;
> -		spi-max-frequency = <12000000>;
> +		cdns,read-delay = <2>;
> +		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
>  		cdns,tsd2d-ns = <1>;
>  		cdns,tchsh-ns = <1>;

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
