Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B18C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0YLx3VU1pwUFBO9hwED/mjOpbOiKGCK5P8LNNwgqCk=; b=cPD0CWEBTVuvJm
	5mkNL0ip17J2/lDb4AgaQDDYp+R0jvKIIEqqjJ5bW0F6I2FoOSz/MhtrLgrgZR6czR487W2Lgk4Id
	3cGvVaHcSodIj69OcZnD3m0NHcYood21l+tP+LG7CC3MBaxPBmRYQw5U8TExQQHtmah41Czx7f0kK
	pZkMdT47BGfQ+G8nG3ph0uso8KOaGcgJXBwWgEclti1qO3fm5LOCp8HkxOti1IkBI/8vsqSDF2goA
	12EL2JYMU/EUQlbIXY1tUI2KSW1dcBQ4PU6siysPnhvxFi+i3W40T/6U0s8oqJdt2qMdDdihW2Mcm
	nRXJlfLfGnwY3TnJIDHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhW5C-0000000E6fO-3HH8;
	Tue, 05 Mar 2024 14:47:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhW5A-0000000E6f4-0nTY
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 14:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EE4A6156A;
	Tue,  5 Mar 2024 14:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11990C43394;
	Tue,  5 Mar 2024 14:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709650071;
	bh=hY0SkX2+Ee1KMf7D9DXccosG2cFlLicJnwjKDfLkTTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOQKa80J9eJMmAq1Ga1F2gAW2IndGSrbNBTCRwILYXlo2yUf1TYtMfTtBHhq6Odvl
	 omXdmg4xlxSqA+sCzjU+Swn27Vv3TtP9+1rlLZuD8igI5glHRxQ2v+1lLllGWVEKhu
	 N0QoYpH/92fYrgM64pC6EJYaOU2Tj6GbzkOXZ3WHkHkaPa9TD4l3FkxnJbUtu6cB+a
	 7dnVP4io/rQRa8IUGPx4E6N9Mbbz+a3tke9B9m57goEfMVVsNQ3hCmhtp8pKjvK1gd
	 W7/z1+ZwbnrZsJSV0wkVtkJv78rYc4yA145f/aWIXlixlNTt8kq7OSHgLmr/ZI6vSE
	 lXje0CQ+70yfg==
Date: Tue, 5 Mar 2024 08:47:49 -0600
From: Rob Herring <robh@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Guo Ren <guoren@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/7] dt-bindings: timer: Add Canaan K230 CLINT
Message-ID: <170965006812.3329951.14876458857891644182.robh@kernel.org>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_CC6884F036B6F3D50A6269733BEAE226C40A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_CC6884F036B6F3D50A6269733BEAE226C40A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_064752_301664_9286E906 
X-CRM114-Status: UNSURE (   7.58  )
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


On Tue, 05 Mar 2024 05:05:57 +0800, Yangyu Chen wrote:
> Add compatible string for Canaan K230 CLINT.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
