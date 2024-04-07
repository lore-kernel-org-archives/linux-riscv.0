Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B477CD128A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jxhwTfPNF9jbXmN/x/v419LJqCIV1uWmVuOwEFZ6cM=; b=41z519iMyOVENV
	cSXrXyJ2im7dro47H23M89EIweR1qaGREDoDWZt99205/qbTWHeg9kOPNTX0DE1vc2w0X87Rs8QX6
	6jNU4rfe/hKU5NljHF5addFPiQZmkIus3/x7lRxemN7QNGGZTaPPaXSPycY3lL1YEptEBEMmf7yLO
	TAChMA3j5xO1bhAOEOWnO9RPqHhdWfoLzEKoa87OwMC/x1cCLztzozokI7paWCtUJNx3RWsFj7CT7
	+1jacOeG74BUJdfcKN/tvNIHHNd0QqDs8GNQm90EOiBiuYChqof+38D+vYE51o8zliMAS9lpIo6D5
	zkeZ/Eht7Y1VG4Ym1f8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVh7-0000000D4SY-12Ex;
	Sun, 07 Apr 2024 16:48:37 +0000
Received: from out203-205-251-72.mail.qq.com ([203.205.251.72])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVh2-0000000D4R2-37aq
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 16:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712508504; bh=iV0N2z2eY/jOdTR2lFnHqVMSsgWwrfjQ4IjHjZ/uFHQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=ygreqtHmtXqquhZBEbDGEDbZWBoM8oSORKbwABQ3nV5H8Gn844hZdt0d+hp55N07m
	 oah3F5NrksfjOxhrdXaKqOpNRekbD00DrLpfwuB0yh54yDD7/nFOmUaP5TE+9u8ACy
	 7uGtrcxtP1lCSkvQaZ8ohNwRqGprPMq9SOtweVeA=
Received: from smtpclient.apple ([2408:8207:18a0:4f00:84be:cfe2:b5e4:afd3])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id C1530645; Mon, 08 Apr 2024 00:48:21 +0800
X-QQ-mid: xmsmtpt1712508501tnhgmfgmi
Message-ID: <tencent_46848EFAB821314F21C68DAD7CD68218DA08@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeie8riCwJ1w0O9q9vxRLbEzR+PgQkBqjQEohXJwAmFtwBn//1yaz8
	 fTjjbvGjri6hI5FtoRyIOPJEyyXdQelMxr78dj6r77IgVm26u4wFMCYCDNRuF/I+4HgWZtnUei2h
	 0TjaENf1Sh9VAmt/p5bVv3sT2Z9O1YiPMQMQGXxsHDRjBNTYH3pB1CkJxAGnQscU81nV3eyhf+Rd
	 KZcMLQjKA11yM7XSSKljTnKZpB+2CTaUirx5455zTpfQsME2LTSp8vW1UcIcbilpQt2Zg0wwluDh
	 emiiz2txFwiilPKNWMmATsMffzlvQK5PitXqdlE0uqu9eBed/3XLNxihsqVMw8cr4hVm0gAsdoi6
	 DQgqPwiETYAzeIJEWdLq//MrsBMYTpQcsPV7WlB+0bHOBmsWZrPjFnvhfoXpogjZeIEE0/LrjirQ
	 XPgxwoETG2oU8n3YhYa24fxcNKg7Vaja26cQNdCBzCTkzLX97bkfl4prXKboXZAx1pJGFNb09pFj
	 Jd3TgG1vHq3Rg8jfFcrtPCyJLed3rZQ7e9NuYnC5siuo+Di1NAFief7KAKtknzov9/W0ZdjHYqkY
	 Yhn9T2b7vYc8TsrM7mDzz//sxmA4e3xwXyFHr2tys/IManOzSOoUZiVcJ+Iz0qJtLrpjqYiqFTr/
	 t59ZQgc+mtJ2l9CPsPGGdayYXaRuPcU9bH8+mwmWyDqb8axJCw3PbD8WeCkbGkUUXqNB20NzWM5Q
	 eUs53kSAKWMOnBk4pyilGJ7hlMqdcibt9trXOk7w0Wu30TdD/Wf/b09CDSmfttIOWwtUe4Kg1AMa
	 AN5vYrotffQS5TrkMCnDgHA8/XnTc1dNq70XGUauD9vh8/TKAqchmIn/948t9iW2N6YD9OKD0+VD
	 394ZpZAvEVuSHrYpMMkcusMLKkBwTgZkUdwxytanom8DqMgTjTBNMWqKKDRL3TMnGRbmJk0dgydF
	 xv23zYKWTKklMDuu8IfT0Awwp4o7bKRfmoyusgZ/WzMo3nWRKedwaxG5uCfsXofif4bsHGmApkDJ
	 z3EemZ1iTFGsZUyWPI
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v8 1/6] dt-bindings: riscv: Add T-HEAD C908 compatible
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <a4eead18-c1c2-4368-9188-32681f62e8b4@kernel.org>
Date: Mon, 8 Apr 2024 00:48:11 +0800
Cc: linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
X-OQ-MSGID: <14D12B28-BE4C-448B-9E19-3A4DFF2BD44A@cyyself.name>
References: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
 <tencent_A5B50F1D87711D625443361A3BF996042B09@qq.com>
 <a4eead18-c1c2-4368-9188-32681f62e8b4@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_094833_394263_77E552BA 
X-CRM114-Status: GOOD (  18.63  )
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


> On Apr 8, 2024, at 00:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> On 07/04/2024 03:29, Yangyu Chen wrote:
>> The thead,c908 is a RISC-V CPU core from T-HEAD Semiconductor which used
>> in Canaan Kendryte K230 SoC.
>> 
>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline), work on fork of kernel
> (don't, instead use mainline) or you ignore some maintainers (really
> don't). Just use b4 and everything should be fine, although remember
> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 

Sorry for the trouble caused. I accidentally removed some CC from the git
send-email command in the v6 version of this series and sent the v7 and v8,
including lkml and linux-dt list. I just want to remove linux-gpio and
linux-clk list and the corresponding maintainer since I separate the patch
in the v7 revision. I will check it more carefully the next time.

Now, I have sent the patch v8 resend version.

Link: https://lore.kernel.org/linux-riscv/tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com/

Thanks,
Yangyu Chen

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
