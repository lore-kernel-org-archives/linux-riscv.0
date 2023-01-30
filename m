Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C34C61D97
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4sGwj3Udfr22grwFPLWufYWO5i28iU7OWaAjspeq+s=; b=ndz1V0KWnYnBp9mdydv3iwvFRr
	yDxuNaT0g03oZAsF4ic/4a9LbFQ/i5XXp2CKf5KtiHyJArvn1O16vgoLnSJbwJOX/ggkwY65AjDBl
	kIzrw+pT89Ea6m9pdy1ftGX7jDdHo2ks4OXczZO6VjNgQ0+XDYDg6o88U15DmWeTkM3trL2DVJ48C
	12TQtj1rJH0VNr+ybxRxsGjUZw+ZC6VFFZ+tYRYTEgG1BrYkafsUloFGeWS6Vg1DDi2r6V5beGBIr
	bl/8p3Lbd8XPRJ0MWLm/ABF3UEqKxkCAL+amfFzGzJSiqnvuPQwHLbV3kUwrf9jhICJzeQla0IiGX
	UHuxhDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYwV-0051YL-9p; Mon, 30 Jan 2023 18:31:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYvS-00519O-Tn
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:30:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d3so12533642plr.10
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RECufJ9lnR8/90iBgdSAfvNRC0rKydDSjqLbEyF4Siw=;
        b=YTq04PkWFinqur7GYiQITRF1/yroCTf9l/SfBLDpI2FSYnM+8u9TD+WGr9ifOkrgXU
         fEeimwe08QYKKWAF63srw8AbGL0aOnPd7lxn+m+QKk2tZpFHV50t7uyc8z0GvAyeRtii
         BDFbtQfYojx+dHnZldO4VCcBLaFI3aJMV2pfGSOFaNWwJzhjLddKvJDoImX65nlvhHEv
         o7wGDCVMDgvR6CQj758FwnBSJf+dcU3NGwzjanmsjLwQ+PQR2KzTzSRIqFuxwj/KIJw9
         8gVwyFxjyCznOqxV2+RMIS+qcIGCMZq1LzpKRjCGgOHPDYu3fM2AY66fQC9kvBDfnZ7K
         q9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RECufJ9lnR8/90iBgdSAfvNRC0rKydDSjqLbEyF4Siw=;
        b=fyGeXG8jzPHdbRHBGRy085tEWvBXKRMY/GIQUGGB6A01mgqYqtifOiR1695Wvn57iK
         EnMxTfmxh27ZPm8uimC732Zt5TptXaLUkEm0qB64e4JpagOPGKOr6HYHoHW50O1gGEhj
         i1ZYlGLUZuwLjNGB8NVCJYPh55T72fN+O3pA11rn3qmR9xFxOcil6mSryBAyvRG2hl39
         XlkdWGXum1XkptXH3AKrB2Cbv1xCv03aNddA6wFkSzhu1u17kTd2AcNqj4DwRrHlsAu4
         XuaifR3Rth4ng164H7x5Af+/UWYUo5950Brxw9X+5Fy7MlHv5Rs8VEYO+IIYZcBmt0f7
         t9WA==
X-Gm-Message-State: AO0yUKVwf0isYjbnDar6nmwkg/2BmLIJKZ1XjVz5x1V2hGHiv/WExtq3
	lYBFhYIRUjVtSZ683YNjPTEmSMz/eDxrLvTJ
X-Google-Smtp-Source: AK7set/oYSCzTQnA3KjiWVLVQ2QcLs6hyBy6eDtgic0AYPxhrNDzpr71ftMhjDgXskjSJA5WDLTJvg==
X-Received: by 2002:a17:903:32d2:b0:196:3ecd:c39a with SMTP id i18-20020a17090332d200b001963ecdc39amr20432663plr.43.1675103439966;
        Mon, 30 Jan 2023 10:30:39 -0800 (PST)
Received: from ?IPV6:2601:681:8600:13d0::f0a? ([2601:681:8600:13d0::f0a])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902c94600b0019625428cefsm8124864pla.281.2023.01.30.10.30.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 10:30:39 -0800 (PST)
Message-ID: <e9990765-9df9-70f5-cc85-32773b35710c@ventanamicro.com>
Date: Mon, 30 Jan 2023 11:30:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 0/6] RISC-V: Apply Zicboz to clear_page
Content-Language: en-US
To: linux-riscv@lists.infradead.org
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
From: Jeff Law <jlaw@ventanamicro.com>
In-Reply-To: <20230130120128.1349464-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_103043_003165_3E53D7F5 
X-CRM114-Status: GOOD (  15.52  )
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



On 1/30/23 05:01, Andrew Jones wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page
> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is just over a quarter of the old count
> (see patch4's commit message for more details).
> 
> For those of you who reviewed v1[2], you may be looking for the memset()
> patches. As pointed out in v1, and a couple follow-up emails, it's not
> clear that patching memset() is a win yet. When I get a chance to test
> on real hardware with a comprehensive benchmark collection then I can
> post the memset() patches separately (assuming the benchmarks show it's
> worthwhile).
So a note.  On the userspace side we are using cboz for clearing memory 
in memset.  While the data is intermixed with other changes, there's a 
very significant drop in stores and a host of related low level 
performance counters and a notable uptick in gcc #5 performance from 
spec2017 which is particularly sensitive to memory clearing.  We haven't 
seen any performance regressions attributable to using cboz across 
spec2017's integer suite.

I believe our current threshold setting is to use cboz for chunks >= 128 
bytes.

Jeff

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
