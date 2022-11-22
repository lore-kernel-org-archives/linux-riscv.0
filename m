Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D04C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlN73VLHgJxouKNbofVnPoy7Pz4FYFdaRGeH3ElP4Z8=; b=CRIAY4RAaeMWP7
	CMBrIHbOKIZIYxnowTalIV7kuEhqaVd+h/HbtgBttKGdX/aSLWjXmDM35svmMbDJOBvkSk8vPdr+C
	5AXFQmaJWJYng00pbG7lyfRYx8iRDONrWUQtZWC8uhfe4zsqOrkqGXhzznrmQ0N/mQjnrd/xakks6
	9uUfW6YIrFCiWc9zHy6kCnDavo3DjLsc72q8Fa+sGt7uhcjV27mVlMjDacxQNkRH67xhJN0/krcck
	E6w3uHyIINd2A7vKiWhbc5655YdLafdJ7ZLRHNXrWy2d67DiG0L4SWCQcah98pAxmQJ3WagaAPS7D
	PSQKe7WNc/bbeRFHqC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP6P-006dyT-AJ; Tue, 22 Nov 2022 08:58:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP6J-006duK-AF
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669107475; x=1700643475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+SSTtDJKH/DT1imwO1wWLGEs22th08LxjRQLt0jLVxY=;
  b=ERlhdN8vVKRivIzb09ijkGc+K5wk+GEpu9vOU5vlw0NpgjI94Q0sI2CF
   FsYvMCyJbsKKoiZp1voJO0zyO0qJML9GACFrUJkaJbBRyl7YB23M9D2y4
   iQ/neefFROXzJJ7xJ2u+OBFkR4FbhYvn2k2VK0h0lmFkkoGuGv+L2TcN9
   V1YRm5MZcdO8durV4Pt/MX0Gj/FWk6n3OrJvl8395PlHsH2bMSb98feww
   05Kl3DJD1YD7mKPY3vobxDHQ83T/bQ4bSObpO7FRBYvBxwkG/zZbu6zxI
   BXrK5d26t2pKCV3Fkhzakw0N3MJA7+cWmKsl+IA0zWS+u/mwiA0M8JSeY
   A==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="124555764"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 01:57:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 01:57:49 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 01:57:48 -0700
Date: Tue, 22 Nov 2022 08:57:30 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <guoren@kernel.org>, <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mark.rutland@arm.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv/ftrace: fix ftrace_modify_call bug
Message-ID: <Y3yO+ii+NEVPTYFo@wendy>
References: <20221122075440.1165172-1-suagrfillet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122075440.1165172-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_005755_433619_C93C471D 
X-CRM114-Status: GOOD (  18.34  )
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

On Tue, Nov 22, 2022 at 03:54:40PM +0800, Song Shuai wrote:
> With this commit (riscv: ftrace: Reduce the detour code size to half)

AFAICT the above patch has not been applied & this patch here should be
folded into the offending patch?
I've marked this one as "Not Applicable" in patchwork as a result, but
let me know if that is an incorrect assumption.

Thanks,
Conor.

> patched, ftrace bug occurred When hosting kprobe and function tracer
> at the same function.
> 
> Obviously, the variable caller in ftrace_modify_call was assigned by
> rec->ip with 4 offset failing the code replacing at function entry.
> And the caller should be assigned by rec->ip directly to indicate
> the function entry.
> 
> The following is the ftrace bug log.
> 
> ```
> [  419.632855] 00000000f8776803: expected (ffe00297 1a4282e7) but got (1a8282e7 f0227179)
> [  419.633390] ------------[ ftrace bug ]------------
> [  419.633553] ftrace failed to modify
> [  419.633569] [<ffffffff802091cc>] kernel_read+0x0/0x52
> [  419.633863]  actual:   97:02:e0:ff:e7:82:82:1a
> [  419.634087] Updating ftrace call site to call a different ftrace function
> [  419.634279] ftrace record flags: e0000002
> [  419.634487]  (2) R
> [  419.634487]  expected tramp: ffffffff800093cc
> [  419.634935] ------------[ cut here ]------------
> ```
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  arch/riscv/kernel/ftrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 8c77f236fc71..61b24d767e2e 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -132,7 +132,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>  		       unsigned long addr)
>  {
>  	unsigned int call[2];
> -	unsigned long caller = rec->ip + 4;
> +	unsigned long caller = rec->ip;
>  	int ret;
>  
>  	make_call_t0(caller, old_addr, call);
> -- 
> 2.20.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
