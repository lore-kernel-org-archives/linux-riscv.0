Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C83C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 20:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vETfa2ALjz0ihhl8+/G6zdHhlNfjdlMXQWajUZt2tiA=; b=H3jdfbn9WjbwgO
	iPu9BpdhLSq5K+5TLfcVga0XP/LjOz8Jj1rn4ecIuzZxHnq9BE3uCcTyfOSvRbh22yLx7ivczgFDk
	ysZv8vrb4f/oqdl8uxEoz3zMG0qjvwv9HBfdDJN6xskpueC1xsBRCWiTTZKpost5Ee5Z78KfL+Cuu
	WmMNqtfDdeb3q0U1HnwzwWY+UK/ze80lKBA4Yd4WZR9T6YjfA/R3TaqIFVNP6TT46+0mGyhrplypp
	+JkHL82jpQqjGnFDrwCsKHuIDxlSt8TEuvdxdH2I9G6mvu1Fb3TFt3K7h8Nx6H2hXlRafBLQMDW5m
	B3HW8g7r2sBlwgLS1dFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rONsZ-003vM2-32;
	Fri, 12 Jan 2024 20:11:47 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rONsW-003vKz-1R
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 20:11:45 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7bed9f3ca97so141603139f.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 12:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1705090303; x=1705695103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+m+8+sn/yrRpMNmoKuVGJnl0KXgHIO06YV19abnxPJI=;
        b=BxHUxsKSYb7FVL90fSfFZzXlqczFL8/OcEqc6tOKTHr37ARY1I42utY9QSlDeHAY8M
         HUiy226retuNBmzTWhRd8HGbjg0bfm8R6SucG4ASNese5DDvkyHsi4DWR2fzPF8rtlIp
         nJtf0BpiRWOrx4mv/wUk9d3q+24UhQvP+wJFEPhfeNNgzHUJjZGLHJUz4VDa2I+HFKSr
         y7uPai7IqkmsDPE7vPqP3/PJq1TGhhIx21X5GOLfbaBoj81/yLyfj1+Ll1xNOc9SkGRp
         nCE+0FK38RKoRzF0KR0IaK/ZdBvczCJY0SRcnIcdAdbNFIjdyf/hGvgCbqmjja2OnmQ9
         PenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705090303; x=1705695103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+m+8+sn/yrRpMNmoKuVGJnl0KXgHIO06YV19abnxPJI=;
        b=Dd70NzbQ+PwJ3MQ4C0eCVG0FLk+jm3IfzvEsEseCzT9ZbF4exE9tjmUpLDqfiQmtNH
         XsdrXkGXkLReo3u6cS2c4Gaw+0blIsotpwb+jJLcfMxbYfElLUBDUBwB0QsbZZiYgYaf
         ktH66tHed1YF0UHlmfwpqC/kbgi64x4F8Hlx0zUd1/2CGXaOqwKB7qLwDoHNiBXtCNP2
         +E8quYyaI9baDSv0msVinda43p+cY2yT8HNgQhY1W5p0mzx+dT9DPhdnq9Rogg8Blf/A
         HzPaxiHQJJZtMlaT5l1XmUIP5Ho49GM/IF3IFHC67WdCZ35ZFxxjKIwgueWucze2GM54
         1fYA==
X-Gm-Message-State: AOJu0YwdNYWEPibndJA8lMbWuSnS08Pc91a6+omfacaP1OItwRIggYKO
	KujdnAwGDiXK4QKtLu2lt26ebl0FC5mSryU8ii+KPrvnOsbTlg==
X-Google-Smtp-Source: AGHT+IHqoFIA5SsY0S6pP9E/YEdP51Pl+qXJMok2jHmvOWgujRF0EPJI7JOUqJM1HPAneMcc2A0bVw==
X-Received: by 2002:a05:6602:89b:b0:7ba:b9fd:a234 with SMTP id f27-20020a056602089b00b007bab9fda234mr1993100ioz.37.1705090303206;
        Fri, 12 Jan 2024 12:11:43 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id bt9-20020a056638430900b0046e25a7bb9esm1063767jab.176.2024.01.12.12.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 12:11:43 -0800 (PST)
Message-ID: <2ff803d9-748c-e168-3775-b05fb11868bb@landley.net>
Date: Fri, 12 Jan 2024 14:18:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Automated-testing] Call for nommu LTP maintainer [was: Re:
 [PATCH 00/36] Remove UCLINUX from LTP]
Content-Language: en-US
To: Niklas Cassel <Niklas.Cassel@wdc.com>, Greg Ungerer <gerg@linux-m68k.org>
Cc: Petr Vorel <pvorel@suse.cz>, Tim Bird <tim.bird@sony.com>,
 Cyril Hrubis <chrubis@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, Li Wang <liwang@redhat.com>,
 Andrea Cervesato <andrea.cervesato@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
 <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik> <ZZvJXTshFUYSaMVH@yuki>
 <SA3PR13MB6372498CC6372F8B16237244FD6A2@SA3PR13MB6372.namprd13.prod.outlook.com>
 <20240110141455.GC1698252@pevik>
 <40996ea1-3417-1c2f-ddd2-e6ed45cb6f4b@landley.net>
 <ZZ8JbCPd3rq4u7iG@x1-carbon>
 <7e348eb3-bd34-4c66-9ed6-b5108da80486@linux-m68k.org>
 <ZZ+zB29hRhpjiOrh@x1-carbon>
From: Rob Landley <rob@landley.net>
In-Reply-To: <ZZ+zB29hRhpjiOrh@x1-carbon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_121144_505977_86E6172A 
X-CRM114-Status: UNSURE (   8.88  )
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

On 1/11/24 03:21, Niklas Cassel wrote:
>> > s/Linaro/Lineo/
>> 
>> Lineo was not founded by Jeff Dionne, see https://en.wikipedia.org/wiki/Lineo
>> for its genisys. Maybe you are thinking of RT-Control.
> 
> Yes, Jeff cofounded Rt-Control which later merged with Lineo.
> 
> My main point is that Linaro is a completely different company,
> which did not "die in the dot-com crash", like stated above.

Sorry, I typo uclibc/uclinux all the time too. (In extreme cases I swap
busybox/toybox, which is personally embarassing...)

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
