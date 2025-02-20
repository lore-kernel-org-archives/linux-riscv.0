Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D138C021B2
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4Bp1ohem22sxE1iGhfRM8TKOb48wJ/OgnhH1aPGVbU=; b=d3bzQKr3ydUS0J
	Aer6qo1CABEjFIjOairvY3v+TRNZANxg0qRX5IvLdmSjAbfsUs3pYzuprYVvVb8nZmcaQ8VmTdTMn
	KyvG6Go+Ny2WeIiHTIEVTDSNodrrC5ud5IbDlW+Flr7JddralUFievj8FiE5zT2xl6+GXBmMLO9V3
	jhTCI1iC/j66LlH3ietM6b/+R2X9QjWpyiMUuaoivGxluD6qjLFxqCL6C/PbIWbTX7PDmXgLqe9xT
	cezJyoCUOwXwXCmvCokKroYD5yWQ45i25WgrZ3TbvdYoh0RIzUXg2M0L7n9/JnLrs9LqhU936FiMT
	yNIaGAUBGihrR6dZ+Qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8Js-00000001WkW-3bpQ;
	Thu, 20 Feb 2025 15:18:32 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8Jp-00000001Wik-41ct
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 15:18:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1740064707; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G/+dFvnYow67mmuUuLmRTYnzf6UeEIMw8b5heJkP4yhg3VI6Wu8itHtlVT0f5k3+zvz6rqK0Io35WWf5tI4GFPryqGxtXO7jtKuxtCSWutpwCW21mKkVRg1hcUIsTd37Rxb0eKMltcrrpTFLj/MbtNUHVjlmk7NOC7vIBA0bQWk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740064707; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Rp+rVrfDMPBn3/xNGZmxdi46SYzFWH1AX8BoNcE1XA0=; 
	b=Yy+LJKb/1msFvFhDj8GqLA68hmVvFY/WsePiNwCl5IJagiF2Dc96D1vj6AZh0zEOK5zSQGE3CLMNFOo3IjRJ3B06dQpmOofIhqy2F8AjAuNloQin/mFhhpmte4KKxJ/feh1szHXAabI813qmYg7SkN5axm5eL3+7TGitdAPKiSw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740064707;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=Rp+rVrfDMPBn3/xNGZmxdi46SYzFWH1AX8BoNcE1XA0=;
	b=Tm3Ih817EF7OdQgMv4PkGMP1Csn/XNibSQDOb+A15sNgloOSubjDB42opo25nxhM
	niz7P2bUgYooZmsGEN6ULxEkXw7mheRM2bqwzzmLyMyMSOtj8dW6aWnTkagaDZZo+hG
	cErNTk0Tixqbmjqo5yedIwORuTC8M5ecdaR/buw4=
Received: by mx.zohomail.com with SMTPS id 1740064703309170.8682384978547;
	Thu, 20 Feb 2025 07:18:23 -0800 (PST)
Message-ID: <c76655ad-e1e4-46f1-aecd-e57716b80ee7@zohomail.com>
Date: Thu, 20 Feb 2025 23:18:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: canaan: Add clock driver for Canaan K230
From: Xukai Wang <kingxukai@zohomail.com>
To: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com>
 <20250217-b4-k230-clk-v4-2-5a95a3458691@zohomail.com>
 <3fb73691f50e599c361dddaff08d3af5.sboyd@kernel.org>
 <364a8fbd-d78e-421d-a37b-cb7a29077802@zohomail.com>
Content-Language: en-US
In-Reply-To: <364a8fbd-d78e-421d-a37b-cb7a29077802@zohomail.com>
Feedback-ID: rr08011227b37c3d6cd7e77c464d706fea00008745026a1b51981f499518d14f3b24d3e15b70bb1178a690aa:zu080112272a2a88529145200e7fbbfe31000028805d1bb7a5f5248ffafce1771786117a59a676dbc0a667bb:rf0801122b9b232d296b2f5180ec561dd000007b4222c2519ad0007ac17d0ec5cfeaeb0f78e4f36397161f115294f8ae:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_071830_083733_99090334 
X-CRM114-Status: UNSURE (   7.81  )
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


On 2025/2/20 23:07, Xukai Wang wrote:
> On 2025/2/19 05:48, Stephen Boyd wrote:
>>> +static void k230_clk_disable(struct clk_hw *hw)
>>> +{
>>> +       struct k230_clk *clk = to_k230_clk(hw);
>>> +       struct k230_sysclk *ksc = clk->ksc;
>>> +       struct k230_clk_cfg *cfg = &k230_clk_cfgs[clk->id];
>>> +       u32 reg;
>>> +
>>> +       if (!cfg->have_gate) {
>>> +               dev_err(&ksc->pdev->dev, "This clock doesn't have gate\n");
>> Why are the clk_ops assigned to this clk then?
> If this clock doesn't have a gate, then the clk_ops will not be assigned to it. In this case, I'm simply checking it again. You can verify this in the k230_register_clk function to ensure it's handled correctly.
Apologies for my script doesn't wrap this paragraph.
> If you think this check is redundant, I can drop it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
