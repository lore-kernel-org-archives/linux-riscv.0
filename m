Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0CCC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 04:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1jZccYojS/im+GkAxwv3jXTZ3GKjf0LChxwXirptDI=; b=Aw3ZSK77SPGLkK
	Qb+DldSq+FJyrt2sRg76JbhubpwBhJQxMrEXIYD324lLjaOXWa4T3COfMzuF6vCntj1FAIi6TfQOT
	hUYsPZgQFISKe7Yc5PN0ypBVnSfeHuw1yRwpGMBl6hGjh/hu5SZELr67FbUUpMIvgjQTvYULs3EyY
	nDnosp1BHVa7MKUCLD3shfnGIFRx3Naf61luDIguNRch2XTQSVwrMy3vUiJUq/jpXEN5+u9qGIb8+
	qhek+flloQtFFv2wsGNKctlERr2In3SjDqTpazaDZuAeyuOfTnfoKEswcbeT2zgSCW8OHhdExZtkB
	J4upkjSvAAgXkYykWE8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OPV-00DDTF-1E;
	Mon, 13 Nov 2023 04:18:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2OPS-00DDRw-2s
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 04:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699849130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h62ZSBXNIpXAn1RjkyzytMnuk1I7FWNselF1cBuUf4A=;
	b=E6VdqMgdRANrqbjHBYzvUs7Oyf1u7n1rcwy7G9IyLRyHJqRpgPn1e3rbimUbDn84069Bjw
	wiCdDq84D0WhT9iGieA8MULU2V63gZYwtIxY6IBLSz0+QJJEMA31ZXQD8hdGhlV6D6pJx2
	AmRxJMK3wtJXHuOib5y54jqFiFHwoJ0=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-i_hRYFJlNF6i8RRjg93rgw-1; Sun, 12 Nov 2023 23:18:46 -0500
X-MC-Unique: i_hRYFJlNF6i8RRjg93rgw-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5b8d4a559ddso5040556a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 20:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699849125; x=1700453925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h62ZSBXNIpXAn1RjkyzytMnuk1I7FWNselF1cBuUf4A=;
        b=ca2ctDRfgddCQay0788tP4MfPIH6NAvHwDC1VkGkG1PHpL7aoWJCkvbmQP9yj1TPBw
         WNPVFZAqp0+o7/BcghuQr3Y7Qm9JkxJVNgSSOuQkNPz2sbC7+MdBa2186fuKsyQVcl+K
         2wvdAHVN7IPTIuJSuL+YBO7uvaZyctBl7CAYCsZ6hIjO4kNnwbc6G0fyXWSfVNTHq0zB
         VPL1tPxjkfbJTrTEBLBl3Eiub/Rko4NOwCun0DTMKLDf97vIMJ4Y0EL42q8TKRmpp3dI
         tNfU/gGKEBkBrBca+armSVCDQ3bLTBhaeCG+oDyCpu6xgmKty33B3luJgakORgB7gLEf
         ajFQ==
X-Gm-Message-State: AOJu0YxgEU4PRtVGgMVK95sr8HAsj51/9Fgq0Qqh7+WaXl7S6XSppgw8
	bWZEGf0Guoyp/p8onbGkr64qMFWbSm6iBKlSLIMfX2xm8Il6FfyTcGT1XbBqiNMryBuk9wia+6M
	/wvmb8Pslgi2Dzv0DHW5N9oyocaeD
X-Received: by 2002:a05:6a20:42a4:b0:186:4def:ccc9 with SMTP id o36-20020a056a2042a400b001864defccc9mr3622167pzj.10.1699849125608;
        Sun, 12 Nov 2023 20:18:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFobxPewEpgXbDDZKt4dnfeBouA3YHhqrzoLtSI/jkAmOjDXYCHvtcrl7wlb5s/tPAkxp4efQ==
X-Received: by 2002:a05:6a20:42a4:b0:186:4def:ccc9 with SMTP id o36-20020a056a2042a400b001864defccc9mr3622141pzj.10.1699849125345;
        Sun, 12 Nov 2023 20:18:45 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id n24-20020a170902969800b001cc50146b43sm3198590plp.202.2023.11.12.20.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:18:45 -0800 (PST)
Message-ID: <b6f833a5-49be-4bd9-b31e-143e2fbec2ca@redhat.com>
Date: Mon, 13 Nov 2023 14:18:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 17/22] x86/topology: convert to use
 arch_cpu_is_hotpluggable()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JM5-00CTyD-Ri@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JM5-00CTyD-Ri@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_201850_996598_7212D758 
X-CRM114-Status: UNSURE (   8.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/7/23 20:30, Russell King (Oracle) wrote:
> Convert x86 to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   arch/x86/kernel/topology.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
