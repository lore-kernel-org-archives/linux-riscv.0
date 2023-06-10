Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD48C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79oZWsHP+qh0DQGMisGSjvd/HTAm19UQWd04rudIxCg=; b=0bOXPxVSAAOxRo
	HnFu4t7tbb9VMiK4UVt0w1i/H4/RwHx1CVNNyeULHC7Eos6dANwdroor+Ixy68KN9K40Yec752Ln/
	FAjqB+qnzMDZCuhDDf3T6BiHgZOsV2KhrtF3K6fxhkw6UQlBcAGMR+3Y4OwPuQadwPT1bCFfqkF6O
	wJj6PN2Ntv5ObRRmtZyc3w6W2fHnMSlZ/55Ui/eiuzVUAkv8mUqAX8Ygp6EtUjjnpzSLUTTUUTehW
	b2Si+A2zyMhkKP7s0/9JyN7Is9s6+IFD9kenY5c5toZ1J9Ts0rx6ch+yQ5MWC5F9ehOMxy7KKPTKQ
	DmGHWSBohjYHLr7H5J5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q883Q-00HGM6-0h;
	Sat, 10 Jun 2023 23:31:32 +0000
Received: from out203-205-251-53.mail.qq.com ([203.205.251.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q883M-00HGKq-36
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 23:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1686439885;
	bh=tXNXBoX/8GWPAzhXpR088r8mBroUaYWOvlVGNgeHP54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SSHHPiuD4dlNC5Q+N85ZFLIsXxWvEEgMSMsQqJ478AibeU97ve3gp9z93L9HAV0oT
	 qoCPoeVc4ysVP4wVlILst9SXZjSLt8NNaUcn4hobol4254uhrubQKRizY9vABLbsSo
	 zNAFfjT707em8BCkz+6UCinPMPaJB0JiIhZCcCZw=
Received: from localhost ([101.224.149.128])
	by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
	id 7C416E97; Sun, 11 Jun 2023 07:31:04 +0800
X-QQ-mid: xmsmtpt1686439864tva22xybf
Message-ID: <tencent_72C3F44CD3565F83575F5632D9574C331208@qq.com>
X-QQ-XMAILINFO: N55MlACpQQDvPmFA5/PFp+NUprXsnOa3gaeg+T0xnTJErPckCigM5gNWVKebJn
	 Z0dB47tzM2nUg/kItl8WxsIjNkYDSHK4N8yC6Om9OrzKTGRQrCaNS4XbBM10EZHbkfuVQbXeDRCs
	 YQz1kdqebSWsVPgNi0w5DDHschLNwO2nBiCwbEZxiLN9A5s0lNsjSIFifyyt70hVadNYpsn/6GzF
	 EBENGowGgu1IAIcrvQp8+CpszIfeV3aIXWMYEkr8BvTrPzfiluExXEm1dYjMkQI63Huun2A+MSHs
	 y2GfDN23pwkOBrfWD05k1C9SLI9o3m4lz2qbIjkjVoaUySKePNOivS2FfIsQK81QnxfdId07OZCj
	 9PvQNtKeNpjzIMlhWaSqFcdjXPCfP+gY+RQpcVVNUHOqyd17qxrtE9Wwy48orR+JMYx9lmMkPL0D
	 faFQb8aCbk/YCrPRdC8RPJCzeK0k3JWOAoCfTQ7e+O+7ctlFHnNhGqQ4DTuWsd0jfM6NJb6WvwmG
	 he8VW0FMNSKboloBNI04CAPmohAESTgUO1jPuWPqJ1CVUAXq1k2qgM3lcyBvAEEx5P72oJqtchkd
	 iDUXjna4Xe/AHxiO7gY9KRe1D12RmxIFg3ESKsHRMnWpAlmqhdjoefjkG4wE05E4XHsXXxHAmVzV
	 0jdlcnZzwmG9F3wiPc/zXBkj++7SUz9C5gjD2nCtR8iMewQ/7syLuKtVWENmRGFQ0LgjelgjxGq1
	 XowJ6G09mS+DT6Q91z42+mEggtL2/+KqLDpsQCyptehxFDoi4uZCIsa+30N9e8pJgIxrFQv0dwN7
	 HmRPy2l3HnPmRo94+Fd/AC/1xt7y4lOrYIkG0vPd8+d1hA42nWzelpcFp+DGf/+oyH/bt+isyhUo
	 QrWfJsS3hUByijKI2z4DStf/Id5+Jrb+oTrsfM9jHbJyQjRNW3piqtGAKnjgc58w40T0wJZYOvqQ
	 EW15Wqlu7+VMYoBZQmbgItqozuu4ht
Date: Sun, 11 Jun 2023 07:31:03 +0800
From: Woody Zhang <woodylab@foxmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: move memblock_allow_resize() after lm is ready
X-OQ-MSGID: <ZIUHtxzmBi8h3JM+@dev>
References: <tencent_D656D683705F41324657ED3393C3384C7408@qq.com>
 <20230610-ultimate-moisture-630c7672358b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230610-ultimate-moisture-630c7672358b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_163129_308011_59DFF118 
X-CRM114-Status: UNSURE (   8.15  )
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

On Sat, Jun 10, 2023 at 04:44:19PM +0100, Conor Dooley wrote:
>On Sat, Jun 10, 2023 at 07:43:20AM +0800, Woody Zhang wrote:
>$subject: "riscv: move memblock_allow_resize() after lm is ready"
>
>s/lm/linear map/ if you resubmit, please.

Thanks, will send a v2.

>
>> The initial memblock metadata is accessed from kernel image mapping. The
>> regions arrays need to "reallocated" from memblock and accessed through
>> linear mapping to cover more memblock regions. So the resizing should
>> not be allowed until linear mapping is ready. Note that there are
>> memblock allocations when building linear mapping.
>> 
>> Signed-off-by: Woody Zhang <woodylab@foxmail.com>
>
>What commit does this fix?

Fixes: 671f9a3e2e24 ("RISC-V: Setup initial page tables in two stages")

Will add this tag in v2.

Woody


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
