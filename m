Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5954C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 21:33:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8403660FE3
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 21:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8403660FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1oM8lS5YMedVTH3tkjTn/tuGzASAAL0RWiQDg4g0YVU=; b=U06QGexFpMvMysnRCAbF4JN4bn
	dWx9RqkJQrMsGaMeCZ8zRTS9SlFaHiVuTN5+J4j659wpHCFKor2nqC2EkliB/S6vX+lubY+nPmv+m
	3LN77HA5ySzxGR7Pw7b03GX+TiD31OExkcqELHZ1Hw4SfNqpSfbc/VttBLGslv3JhFVgIab5YwqEV
	hyf+JfzFWjOQdaljUpmubyWSA2r8Lmaji+NlOxHMaX1LnpqAKDOgStRKQU4Ry33qu5xRcETrxea+D
	6un35K/CqHCjdxNEkSQYPSZqKTPfhx9YvDEX4IIC8NRFzFTO8uHPeKWUsvuWJUv4D+CMG1LMAxz5e
	pdt6aUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgD0w-009923-MC; Thu, 28 Oct 2021 21:32:46 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgD0s-00990S-QV; Thu, 28 Oct 2021 21:32:44 +0000
Received: by mail-lj1-x236.google.com with SMTP id s19so12998155ljj.11;
 Thu, 28 Oct 2021 14:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FNhb8m0Up8WrlODFU5XusWNjgw7FYM5tGcizMhHIPzY=;
 b=USVIOuLFNftY9TSlAv8GQB7acWI1sWWXinRBTyt58drm2RaLh5La11nG4ixMTMewfR
 mX32BgQ2N30EhppM8q0HGzyhqJFMUCJMnblCfs4t5KonQ44KE0wlYv2W8rFYqs4V2koj
 XX371v1ONZUx01vnBeB6kBqd5XtkGxjVTj1e6iP0L3n7qnRFNsZrpRBj/O9TAqf3J13f
 DVFT1FMABW5ltJOUpFKPkQHX+APbXjkM1X+NMw4LCmok7h64fUY8hoIatZpEbYmauo9R
 3tzIe6iUnZRzMnNPnMBZ+KjZo2BGgmZ8KUvvaXZMV9Llm3C259zfQ4YRn+8CQPkkCOFN
 RJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FNhb8m0Up8WrlODFU5XusWNjgw7FYM5tGcizMhHIPzY=;
 b=Rp8nyYgFBBml26WhW7CUSMf+k3pM/ixGHq1xY5cykLcRlREE2Mzbim2JCUYV+EYxeQ
 oPG12ox4uNVscRzF3Pk7eUT5do4GLrxbctn1GRFm3M7Kwo+kI/QvguDQK0/A34Ep5jbF
 VuHUx5o4tMGXlZ1aShJsHDhsucANsom1oC4fw9l7Sj+tGCNrLkiWfA5+DVwldgiUI0Dc
 gQ3+XrBBgB0JfE3OZw6/siOaoaeSH16tOFe/kyMpW3W9kVyasbxL9SpwlBWuljjKN4FW
 HkVTOnF+efaEzv+570CUYR5bUdVtiY/UtLXPFNAXTkIVpUZ6XXQGwVHobGVCF5gEnW0U
 LK8w==
X-Gm-Message-State: AOAM532niEkKPXRPbccST70ljcJE9y8kc5kPK5IuVTz95A8x2BUMrsjI
 DSDBKhMFbGlTIoi1UCA96lY=
X-Google-Smtp-Source: ABdhPJwcWGds1J/UVngHunSwfN7ztb9W9OVxlAX827dktWLGe1JrS01AY9nWnDg96vqg3wWMmL+l6Q==
X-Received: by 2002:a2e:9b0e:: with SMTP id u14mr7220400lji.247.1635456760396; 
 Thu, 28 Oct 2021 14:32:40 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id bi14sm474384lfb.290.2021.10.28.14.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:32:39 -0700 (PDT)
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
Message-ID: <c5fb7590-03a7-0eea-4040-07472a5c9710@gmail.com>
Date: Fri, 29 Oct 2021 00:32:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXqCz/utp2DFJJ45@smile.fi.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_143242_951382_B6941120 
X-CRM114-Status: GOOD (  19.78  )
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

MjguMTAuMjAyMSAxNDowMCwgQW5keSBTaGV2Y2hlbmtvINC/0LjRiNC10YI6Cj4gT24gVGh1LCBP
Y3QgMjgsIDIwMjEgYXQgMTI6MTY6MzNBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
PiBBZGQgYXRvbWljL2Jsb2NraW5nX25vdGlmaWVyX2hhc191bmlxdWVfcHJpb3JpdHkoKSBoZWxw
ZXJzIHdoaWNoIHJldHVybgo+PiB0cnVlIGlmIGdpdmVuIGhhbmRsZXIgaGFzIHVuaXF1ZSBwcmlv
cml0eS4KPiAKPiAuLi4KPiAKPj4gKy8qKgo+PiArICoJYXRvbWljX25vdGlmaWVyX2hhc191bmlx
dWVfcHJpb3JpdHkgLSBDaGVja3Mgd2hldGhlciBub3RpZmllcidzIHByaW9yaXR5IGlzIHVuaXF1
ZQo+PiArICoJQG5oOiBQb2ludGVyIHRvIGhlYWQgb2YgdGhlIGF0b21pYyBub3RpZmllciBjaGFp
bgo+PiArICoJQG46IEVudHJ5IGluIG5vdGlmaWVyIGNoYWluIHRvIGNoZWNrCj4+ICsgKgo+PiAr
ICoJQ2hlY2tzIHdoZXRoZXIgdGhlcmUgaXMgYW5vdGhlciBub3RpZmllciBpbiB0aGUgY2hhaW4g
d2l0aCB0aGUgc2FtZSBwcmlvcml0eS4KPj4gKyAqCU11c3QgYmUgY2FsbGVkIGluIHByb2Nlc3Mg
Y29udGV4dC4KPj4gKyAqCj4+ICsgKglSZXR1cm5zIHRydWUgaWYgcHJpb3JpdHkgaXMgdW5pcXVl
LCBmYWxzZSBvdGhlcndpc2UuCj4gCj4gV2h5IHRoaXMgaW5kZW50YXRpb24/CgpUaGlzIGlzIHRo
ZSBzYW1lIGRvYy1jb21tZW50IHN0eWxlIHVzZWQgYnkgdGhpcyBmaWxlIGluIGdlbmVyYWwuIEkK
aGF2ZW4ndCB0cmllZCB0byBpbnZlbnQgYW55dGhpbmcgbmV3LgoKCj4gLi4uCj4gCj4+ICsJLyoK
Pj4gKwkgKiBUaGlzIGNvZGUgZ2V0cyB1c2VkIGR1cmluZyBib290LXVwLCB3aGVuIHRhc2sgc3dp
dGNoaW5nIGlzCj4+ICsJICogbm90IHlldCB3b3JraW5nIGFuZCBpbnRlcnJ1cHRzIG11c3QgcmVt
YWluIGRpc2FibGVkLiAgQXQKPiAKPiBPbmUgc3BhY2UgaXMgZW5vdWdoLgoKVGhpcyBjb21tZW50
IGlzIHJlcGxpY2F0ZWQgbXVsdGlwbGUgdGltZXMgb3ZlciB0aGlzIHNvdXJjZSBmaWxlLiBZb3Ug
Y2FuCmZpbmQgaXQgYmVmb3JlIGVhY2ggZG93bl93cml0ZSgpLiBJIGJvcnJvd2VkIHRoZSB0ZXh0
IGFzLWlzLCBmb3IKY29uc2lzdGVuY3kuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
