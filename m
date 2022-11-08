Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3998CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 00:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpME+wZIFO/QQm8t/D7Qnp/SbCkbmgiilxMxp7qHb5E=; b=vtZPtUphn9Df6c
	BKVvmU8SJ65CXyORgnFarcBi3J/cD+3crqSiwOpMp8lv2849FqxUBkq+my4f9wyU+QcjaApX68/uD
	BohKaKZkbNrIs38iXBJ32/aJjGCFyEdLnSppUzig1PDeCKjx7iz4oUvviKvPfnu0h75/hotipQdE7
	BDLXTJi9E0RidlT0dbfcbC4UrTamxCNczzuT8WW100VJ/Gn9eJv9Nva9EmMpAkY9hqql3Ny3h2IPI
	zK8Y8U2GH6+NfjjaD9zqaBCSX4B3HKI0Yv833gxNkWi8MpHPn2HTOqc+f2GYrVssaktxks0hS6HSD
	wxlYIT7i33LZxTFkqdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osC6Z-001PdK-Kc; Tue, 08 Nov 2022 00:04:39 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osC6W-001PcY-T6
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 00:04:38 +0000
Received: by mail-pg1-x534.google.com with SMTP id f63so11966458pgc.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Nov 2022 16:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oy8ZE1oFJjzlPOX73c8KrSMYviuoLcNPde29QmDF+k=;
        b=53Th6Tie3U03H0RA2dwNH6QKmYrirXYYLIpj9x0vyN7E/1dMmbcUyW5qKnBYTJZLXg
         2KepuHtx4BdPemu/pRjL2wIhAaxf1KG1wUfVkNAE4ejAIQRSvsStXZeEnHTmEI0uTuZL
         wukAbOAGvsOeQRwD1VxI3Jaf5z3e+n3Abxg/h1saSUnEI0ZEMwZL9mfvOUKU62kCbWYU
         L22nzSHi/p+VMwZzk3BDW3AOhOT92tJdZa/WPf7A96j+EzSuzTP1K1y+r88E3CXCpU8T
         Z66DlqlN/HJDue3KkfP/ivmmVQHbvkgJygjBvq/5G/TDu9VJG/jLvfA/DRtkeRi30hjM
         sh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9oy8ZE1oFJjzlPOX73c8KrSMYviuoLcNPde29QmDF+k=;
        b=oN3K+bZEZejN+EZZiKP8iK2+aanw+uYGjVoYYTdH51ehbO5t1hrOXphmFQEr5e9ClI
         yRq8HDeBEn6HqCb8aZf8/CuWbNpKyxs8N/JHk8gc+ERawbwq0qfm8i+QZrGrPaHteGud
         zLpi7BTtmk+U05vAtz9Uy6GUcBzVQgl/ttQ/VROSuXSbuMHFTJUQBlm70GTDP8F9UWKI
         MPc60jhspVn7Ndtl6jcN8OvHjinQ+Oxyo6rK6/CjMIYgDv5gZQvzRkDIjWlrjir1xlZk
         cxFVh5fpuwhwiLwITyGfNbP1kLy98/d01rFrL+l9w2q6nW5430A/PfPMqdqE7tViQpiM
         nq1A==
X-Gm-Message-State: ACrzQf2K5lJ+dN93NW7A5XwKuyNzhfRB2+vNYrqtE0cRl+7m9QmIw3JM
	3ZSQPWNYc3F1BAzlbwNAwGW3ew==
X-Google-Smtp-Source: AMsMyM4n+JMRam57i10ezHi3WCmDHZRD4TqVXA6VO8+qhnux8A9WYkDsNLJIMholOpfSkASb3lCE0w==
X-Received: by 2002:a05:6a00:218a:b0:56d:1bb6:af4f with SMTP id h10-20020a056a00218a00b0056d1bb6af4fmr50780668pfi.11.1667865872854;
        Mon, 07 Nov 2022 16:04:32 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090a384900b001f94d25bfabsm6664728pjf.28.2022.11.07.16.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 16:04:32 -0800 (PST)
Message-ID: <f4887649-3933-0a65-7ed5-1bf6bd842a46@rivosinc.com>
Date: Mon, 7 Nov 2022 16:04:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v12 04/17] riscv: Add vector feature to compile
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Chris Stillson <stillson@rivosinc.com>
Cc: Greentime Hu <greentime.hu@sifive.com>, Guo Ren
 <guoren@linux.alibaba.com>, Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <Conor.Dooley@microchip.com>,
 Andy Chiu <andy.chiu@sifive.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-4-stillson@rivosinc.com>
 <87zgd2d6j1.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <87zgd2d6j1.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_160437_177740_BA9B722D 
X-CRM114-Status: UNSURE (   8.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

K0NDIEFuZHksIENvbm9yCgpPbiAxMS83LzIyIDA5OjIxLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+
PiArY29uZmlnIFZFQ1RPUgo+PiArCWJvb2wgIlZFQ1RPUiBzdXBwb3J0Igo+PiArCWRlcGVuZHMg
b24gR0NDX1ZFUlNJT04gPj0gMTIwMDAwIHx8IENMQU5HX1ZFUlNJT04gPj0gMTMwMDAwCj4+ICsJ
ZGVmYXVsdCBuCj4+ICsJaGVscAo+PiArCSAgU2F5IE4gaGVyZSBpZiB5b3Ugd2FudCB0byBkaXNh
YmxlIGFsbCB2ZWN0b3IgcmVsYXRlZCBwcm9jZWR1cmUKPj4gKwkgIGluIHRoZSBrZXJuZWwuCj4+
ICsKPj4gKwkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4+ICsK
Pj4gK2VuZG1lbnUKPiAiVkVDVE9SIiBpcyBub3QgcmVhbGx5IGNvbnNpc3RlbnQgdG8gaG93IHRo
ZSBvdGhlciBjb25maWdzIGFyZSBuYW1lZDsKPiBSSVNDVl9JU0FfViwgUklTQ1ZfSVNBX1ZFQ1RP
UiwgUklTQ1ZfVkVDVE9SPwoKR29vZCBwb2ludCwgSSd2ZSBjaGFuZ2VkIGl0IHRvIFJJU0NWX0lT
QV9WIHRvIGtlZXAgaXQgY29uc2lzdGVudCB3aXRoIApleGlzdGluZyBSSVNDVl9JU0FfQy4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
