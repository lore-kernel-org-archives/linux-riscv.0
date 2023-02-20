Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F972C6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0WMuzviQsZtY3AHxtkO9v7/RTaphaS4+fzLNqOTXI4=; b=c57tYnn/pKDmr5
	9oW/fOA5JFsmhnDuluUo7H968kvQayAIt0FEW7wygDGwoCS1rBgMTQ3kPb5EoNNvhWzpAUKIp4WBK
	icB3pDM/7LrSE0nAKMbYZak4GY4iuF3LM750FGoQQC/DrWjRlPje0ZEAkFDXEBbJ5QrVWwhwBcIYG
	snGomaBjkkGpqfpWJsIE27KS08bycEU2L0YQzcosNN4LyVMVR6EzPh4T58/NY52PZGjAVxmP0iiUQ
	49nctdfYVrnCGabsmCsP93M+x+ZTPTnWVRZdY+Ucaqh3W7n8k6UwQZFTtVdWHdXCKfkr0wPZbJ7HG
	Cg5LDOtP473dzHEtsx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUB8j-005G8e-2e; Mon, 20 Feb 2023 18:43:53 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUB8f-005G6j-Vi; Mon, 20 Feb 2023 18:43:51 +0000
Received: from [167.98.27.226] (helo=[10.35.4.184])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pUB8X-0067cf-QG; Mon, 20 Feb 2023 18:43:41 +0000
Message-ID: <ff11ad0f-7ea0-1dd3-32ce-5a28c8816397@codethink.co.uk>
Date: Mon, 20 Feb 2023 18:43:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
Content-Language: en-GB
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
 'Palmer Dabbelt ' <palmer@dabbelt.com>,
 'Paul Walmsley ' <paul.walmsley@sifive.com>,
 'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
 'Atish Patra ' <atishp@rivosinc.com>, 'Heiko Stuebner ' <heiko@sntech.de>,
 'Jisheng Zhang ' <jszhang@kernel.org>, 'Rob Herring ' <robh@kernel.org>,
 'Albert Ou ' <aou@eecs.berkeley.edu>,
 'Conor Dooley ' <conor.dooley@microchip.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
 <4a25cf89-bcf0-e78c-a8ab-7ba0c4f8e2bf@codethink.co.uk>
 <b348f0cc-4868-2924-9935-00ec18b36da9@codethink.co.uk>
 <20230217122943.24caosketyvfcc4f@orel>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230217122943.24caosketyvfcc4f@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_104350_046113_242113F7 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 17/02/2023 12:29, Andrew Jones wrote:
> On Fri, Feb 17, 2023 at 10:50:07AM +0000, Ben Dooks wrote:
>> On 17/02/2023 10:18, Ben Dooks wrote:
>>> On 09/02/2023 15:26, Andrew Jones wrote:
>

[snip]

> Hi Ben,
> 
> I'll be sending a new version where I don't touch vendor-id anymore, but
> rather break errata_id into two parts: id and application-data.

Do you have an idea when v5 will be out, if it is this week I will
hold-off our internal tree rebase to change to v5.

Thanks!

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
