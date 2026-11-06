Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFC1606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KkIAJKoh;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kd5p9nZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=peRpjWWDB8PD2WqSQ+7/2WBHtXVnnr+ouSQKADrct4U=; b=KkIAJKohKxjf9+bcEbOPpNEXHQ
	v+ofDofqQfkwgoOxJM6TRxPpX9KDyE7V4hmDEGmc7jtAq+IlS07VxobQYKfOgPnTjt5Gp8h0GDM8X
	adCd/AlTnoKUfK3+FRGFW4wc9XDDwOTGv8AGE0R2JX4izZKGU2EDsbQo+2GJ0Y5K1eSgJpMkHEqOk
	tZSzQioW+fydFRZE1LTQBcRULJYWCXEbABS1ZlT5nHDN+4xv+/W+M2RsmRBecirQJxYkujGbWSTCV
	ACiByjvOQHHryj8xaFTrZ+a0GbojbGsKEgdiiFDQPLf0On7NQlqrNAkiUl1bgEwNzUQxNtZ/HHsLr
	NkYANQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMlL-0000000D2z4-0ltv;
	Fri, 06 Nov 2026 16:25:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMlI-0000000D2yM-03jB
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 16:25:58 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0E9353FEEE
	for <linux-riscv@lists.infradead.org>; Fri,  6 Nov 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793982352;
	bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=kd5p9nZS6m9QXbQsCgnbeR3HTP9si0Xc3gxnPyaFx3ySWcliQs6Fjiy8C0achSLqa
	 /U6XYYnlIzrRXBkvKUWLMlTqJ4MYl9MK89jKcoJqhwW3SkW6y5DzSSng4RRK3DyCjS
	 +qyYRDy0O8jZC6lhhEObm3bnFBNOVHLCPIiZlvlShvNZdb0PljY60dfgRqWfAX8pN2
	 kOXbB5cSkZF3/CrT/emgPZHmPUH2V4z1nKHxNyvy3NVx+Dn9uZJVTjX2OhV+B/P02U
	 WSDHWtHhEN2jOt7XnI8sRzKW9ZonuzBZxeFr0PRqAr5b2W1BdJ2e6dSczSoU9QaraT
	 BtG6ZRI/o2o0QiFe8hA3QrhN/hFmt0rYJ0NV6yCg6O3UtD9icr1+dixDWaHrEP1i/H
	 Q61xtgm4biH4cpKJIG20ezn2N3Uj5OeTa4qL/yDuPbU+6A/NwGzoOuT4zw5FJmygEC
	 7+3juWsSn0IQ0yelMFLAhteGX7lkJqs3PaVi1VnYh6vsoY7nimnx/puuD8mAfejKPw
	 De5UW6ryHuZRVVyMDmNM8JVnu3AInjDQK76yhxp+eZGuB24BOhD9Vc1+bSguuJuu5J
	 lW9998owwbfmGrdbcnTcPyOUWyFhfuJuFkLhHPoV8Fuau9wdT2UCdE+HtTrfyhRJOX
	 UhevWA6OviFhwEOZkQW5cVkM=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso5124385e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 08:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982351; x=1794587151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbAdv7MCz2zJUTUDv7FqKwfaz+r2S2sDxgej+VGMxoc=;
        b=H7PnlDyPDLHKgFrlB14ROMnwladr2+vBKgdNWQ/Fnkmf24i9DNoy9osLFlz2gXuIXg
         iyNuMOQk56aajN8Jh00va3U6c3lHHBnv6g7q86vbZiGLsQnx+C731nh/rAyPff7kaU1F
         Zk2/E+7Hfv155E3lbWMaRONLF9oZIru9OvKgzrPkmY+AN0y2xdx2PcwbtN1o9b+rfioL
         ps6rV9otY9GWrTq8xowXPFqnY63dXUXJv1NJbei+3uwL9mssoBLsjpAh70WswVNv2TbK
         01P5j3OtxRo2mCfhehaRswheKoPBAzzWPcDt774LAa/MRHK+9x14b+CPXY15e0sK6abI
         NVPQ==
X-Forwarded-Encrypted: i=1; AKwUvByYAZMjEYOOG78W0HbDQ/X4anlbaakzhMZiyB/AWuj0MkPiVIYszHVnyDiQXUoaNU0EOHIQwszTrLV7pQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+4ob92vKabsYKkTGc0QDm3JBHm/01E3mbmpc99+EHxPRMDNJUc
	kSSu+mvYmsCPf50RaebOG1za3LUu/B2KD5tOXgIba44x4Zdmo2uH6uehFgXtWaDQFapS/lkrg1i
	YdidD+Vlwfz7y3sSLpmCffcdw7dgLbG6ZQQ9RDtxhJTIyUX4TzEHWEhCFqfrsqjF3zYvMsnSUYw
	nQDV5SNtgmZg==
X-Gm-Gg: AYBFou1Fa88U1wb+OdroJ8gzdlnrF+B7pKleBfMb3xEVuCs7mcQ6r26dA2JJLSAVVFs
	BTQDUJ6NTrMRKyhXq/yxyK+5bgyssTiE2zR6g1uk6dy8gMOSeAujBiQTiUkYqsb//Vej8yYSgSI
	uRQKvU9J7OBcmMSEUCYjh/c/XQRkbMLrCYtRDwbH+wbTsQixwTei/UHYju1a03HaSUvmdih4rIa
	V3H5ExCYemgFrY4OiVWXKVaxYjdAxYjJHdDqxjp3YyZYc0U0nuFolOPdwhMyToRBGSFy712G7qe
	XPFUb6FwFBspHSMYiJbvp8Neg0XWa8CnknuDD8SLu42pxOWYpOb06jXxrd5G2O+dNWiUCSoJYo4
	kra6pV0V3zVPh/Zp6Xdc2yn7qY6fKKiGVXtX/gqAg26gzFkmU3fg/9yfWs6SFmoPmfDfSPQe/Is
	Hm
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4b6dc6df61amr54605785e9.4.1793982351633;
        Fri, 06 Nov 2026 08:25:51 -0800 (PST)
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4b6dc6df61amr54605455e9.4.1793982351340;
        Fri, 06 Nov 2026 08:25:51 -0800 (PST)
Received: from ?IPV6:2001:67c:1560:8007::aac:cab2? ([2001:67c:1560:8007::aac:cab2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm82686435e9.15.2026.11.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 08:25:50 -0800 (PST)
Message-ID: <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
Date: Fri, 6 Nov 2026 17:25:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_082556_444663_A44183A1 
X-CRM114-Status: GOOD (  10.75  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy,

 > +			uboot@210000 {
 > +				reg = <0x210000 0x5f0000>;
 > +			};

This partition ends at 0x800000. On the CoM260 with EDK2, 0x700000 to
0x7c0000 holds the variable store (NVRAM and FTW), so reflashing this
partition from Linux would erase it.

I think we could split it like this:

    uboot@210000 {
       reg = <0x210000 0x4f0000>;
    };

    var@700000 {
       reg = <0x700000 0xc0000>;
       read-only;
    };

What do you think?

The Pico-ITX node also uses 0x5f0000, but I think it should be modified 
to split out the var part too if it makes sense here.

The Pico-ITX flash node also has vcc-supply = <&aldo2>.
Shouldn't this be present here as well?

The rest of the patch LGTM and matches what we have already tested in 
the Ubuntu kernel.

Thanks,
Sarah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
