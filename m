Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F762C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 22:10:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B510610D2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 22:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B510610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3romGZmj+j9ydNoMvt2adFZMU6vU8pOFVRhQFo09Gig=; b=RPk/MtjcG20KVf8nUQnyo1qa1R
	6xuNnJ+3l/tzt0K95KS68YNAnwNzUHfMUUDvN37V5zSzMl1eNU3rLJkuRspk8SR6hbMQ6ZQUheWA4
	t1XROFcbsx60YBhIzuWW1YiAkM2l2Wy7WEYuyp56Te1B8l70uWFH74OWMWKW1YQX9mWYqUK9hWPk+
	kCeyka3L5CHL5oik4+tFtM4mafvEDUAWi/qK6TnKuNnK0nxS3cst1d3vqvET7hQvyzFhBtJ5X2ykl
	aszvCe4k9VXBngRKJE6R3wwPGVbBHZKSChA67u+vlnmObb3bsblQ9D67oTLyf/ZAroMQnQbZ+t6WX
	/nX3wS0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgDbM-009DxL-Vc; Thu, 28 Oct 2021 22:10:25 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgDbK-009Dwd-Jw; Thu, 28 Oct 2021 22:10:23 +0000
Received: by mail-lj1-x230.google.com with SMTP id q16so13237984ljg.3;
 Thu, 28 Oct 2021 15:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oJ/0ZuzBVjUo38Wh85+gleqyoNxUo2tupcS3OG//HMk=;
 b=oyp+4ZpoBN8sNbj4o8xY6UXK7DWV+2AXCzvhz53IZDVW7yBXuU0WcYtlG9nrr26Gko
 pspAZNzk5nSawwOoCboqqIBx1NtwU9YP7ClGYgBOs5f5QS+oYjdLS6Chq+lHwnAJsaRE
 aw808EWXPhfWuOImaYWLgQPkx/4+EXGI76qDso1CJ2aKNZ2aChJYUzNXxoU4wlUL2Pxg
 oy7RsSyXKkJJvyMzgbQsMkVQ26q7g1vnPJco9ifX2k6oVsTB9g0J3QdHglNbFRrrT6c8
 P9uyPf++7eB6LV3eSwFOc5BxbfYBVDwZrUUANM1FlvuP72N8IokbXokq1o8sSzQ34LI5
 dsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oJ/0ZuzBVjUo38Wh85+gleqyoNxUo2tupcS3OG//HMk=;
 b=pk6Y89BMJdUg0uYv8J60mbPctrlmBdd9ULu7tC+vx2/3MlNQyxQbNF7SjDoyZnMHf/
 eV5nODsEO6KUet7wd/EQaj3HzHKxlOcEtLkVenAplrA2YNnWC7CvXZDE+nVkeYejMe1r
 XDAc5/0bItZkGUE+R5K4i8X8R19BXY6odav25x3zO5IpKdpLl770CJK/CnOR+skOIakG
 +x/12yAKdYx0lv4zxj3A/S2H+BaL1S3zrE+i4zoHxhJ/30Xrc9/MAp3LtBnmBqHQg+b5
 mjPcnK3psyYichIfq0yhAD9Q9K2U/yVsRxE4zDKFSQ/tjJ6tCfrU4pU3PIHXGJX/kdAN
 NJmw==
X-Gm-Message-State: AOAM5326Wtdje5wyuFTmwNAZAXy3ij4AFZrkJ3uuRohMBMR6JkagSBt0
 nVgL4rPkgjEGm/ojIj5KNpqDt3QMRCk=
X-Google-Smtp-Source: ABdhPJykwIAUVmO5wKdpzX+/iWk6pBH4AnIAWbvXPbs4nxxBZpydFbV5fsYhpk8QZgUr9D29NxqkEQ==
X-Received: by 2002:a2e:361a:: with SMTP id d26mr7788286lja.104.1635459020939; 
 Thu, 28 Oct 2021 15:10:20 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id x26sm406331ljh.24.2021.10.28.15.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 15:10:20 -0700 (PDT)
Subject: Re: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-4-digetx@gmail.com>
 <YXqCz/utp2DFJJ45@smile.fi.intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ba9d1a3f-c3e4-7060-9859-97014aa633b4@gmail.com>
Date: Fri, 29 Oct 2021 01:10:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXqCz/utp2DFJJ45@smile.fi.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_151022_693619_F126BBE7 
X-CRM114-Status: GOOD (  12.89  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MjguMTAuMjAyMSAxNDowMCwgQW5keSBTaGV2Y2hlbmtvINC/0LjRiNC10YI6Cj4+ICsJd2hpbGUg
KCgqbmwpICE9IE5VTEwgJiYgKCpubCktPnByaW9yaXR5ID49IG4tPnByaW9yaXR5KSB7Cj4gJyAh
PSBOVUxMJyBpcyBub3QgbmVlZGVkLgo+IAoKSSdsbCBjaGFuZ2UgaXQgaW4gdjMsIHRoYW5rcy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
