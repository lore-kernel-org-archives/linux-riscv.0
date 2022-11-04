Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0725DC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 12:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0U8FyclZNDfgbJva0kU0DkZdyLRtBCFTjCBdYOs9cU=; b=gxwIJRafviiYI+
	Gm1N1C0j+C0IMDmMZ5pF62dwYdidqEmhYuoDulh6W+UGJUiDxZGX6tZzA2rgHKF4K/BJUUF3vIy0G
	denK4eX/oAKgkkxTzF+yxeUyza556E5s7xOleuwkvWGOST8T2/54KQEok0kwCRAPMNuI9Gn98YxzT
	V3bnfvDzWHpDOmPMhKn+dkOjNJ4Lc1JR+cvhcmMolC05IhXceftvG1Bs/fV9DVIdWbuI+h3MFj6UI
	1jmiE2vrJvNo5c0dGu9t+MGPGQYa8Sw7iQnNXR1rryaRsan6DPsK95UuMDzT91gcEF/ky9w3njRAB
	61jQgqy4Cjbaaj+DikOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqvPR-003PiH-S9; Fri, 04 Nov 2022 12:02:53 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqvPP-003Phb-9z
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 12:02:52 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oqvPH-0005aZ-60; Fri, 04 Nov 2022 13:02:43 +0100
Message-ID: <464d46df-cad0-720a-9193-6e569d9c1d91@leemhuis.info>
Date: Fri, 4 Nov 2022 13:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Regression: Fwd: Re: [PATCH] riscv: mmap with PROT_WRITE but no
 PROT_READ is invalid #forregzbot
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, stable@vger.kernel.org
References: <d6c9e249-08bd-4439-7dcc-371b32e7b851@canonical.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <d6c9e249-08bd-4439-7dcc-371b32e7b851@canonical.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667563371;8dee9d4b;
X-HE-SMSGID: 1oqvPH-0005aZ-60
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_050251_536702_391E049D 
X-CRM114-Status: UNSURE (   5.20  )
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

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 11.10.22 18:52, Dimitri John Ledkov wrote:
> #regzbot ^introduced 2139619bcad7ac44cc8f6f749089120594056613

#regzbot fixed-by: 9e2e6042a7ec

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
