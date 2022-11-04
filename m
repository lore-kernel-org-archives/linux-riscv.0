Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D20C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 18:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twBMVKi2IY9kegZvIS2s0qxDdZaXIjkBzLhx+BSpOrQ=; b=l9UQF0ECckx8O5
	it3cgjJZAlJrgrK+zY8cEEAKqKgmjv/QyWqPoAk5i/NssvB6vWA+iiGEYsIbC7Fw3jviCS0vCds45
	v7gdSfjZS6dOSxfKMQJEeQAa+36fLw0F3nQWaNMmE7immE6W5BzsQHLVJxKKyc2rJhUYFInimhIHy
	CkUTDhbk6UqIIf091ypdWaoJeow0c6OaWvEE5ivdjQJPrnhdQl5iKY0p78DoxGG9EiPAdH9Dk6kEd
	TBfoOb1G38biAKyh4YzQLT0jkp0V0DWJ+0cRlPNcxrX6fWev61XikbJ2qeujHY13vlC8ue/5g75tH
	hbI2+hMO2fIvAI84YNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or13g-004jhm-HH; Fri, 04 Nov 2022 18:04:48 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or13d-004jhN-RJ
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 18:04:47 +0000
Received: by mail-pf1-x432.google.com with SMTP id b29so5141002pfp.13
        for <linux-riscv@lists.infradead.org>; Fri, 04 Nov 2022 11:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YezMuQaIQH41ykAkwuSnF1ocnQj8hXJ/jI68kjH22+0=;
        b=1rRsnDJojy49uBr6O8zYdPExsVyjYrG7uaBispEL49gocXluuqM2iupcjbuIth2ySm
         UW3qLBB7KOoKUxk3DrLngMxkrBWjMUUEa6gf2voaXA4imbxnN2v3n4im+eZT/CYO8Iu9
         TUmCE9o430OesWJiIqk0Sumvy/VhkH6NjRC6WRQrgxr1QHdJ9zXVd2YwJ2Nryt6rr7YT
         QUr5KY5zUVU0snR3NxvlTyla96QsrDQ/iF+4Iyy4oPJopTZaiZHVQu7ylp29rQHDSu33
         7V2qdePGZjvCOiaUYsME2kADHaj6K8ppIpwQLo+D8JfkssN2I9cGAtvxdXYyFxiLlkn+
         RvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YezMuQaIQH41ykAkwuSnF1ocnQj8hXJ/jI68kjH22+0=;
        b=CixWj5kKKDYyHccqmUMaGfzLNiZsvlrmQi/A9UwU2vDmox/xcKD6xD73u3I9P/wDhO
         1FPxvGSJxv0eS5m/48isNlkMl3llEVGCoZJ1jgxHFVjz7PLNWpmXsAXow3nfJmLCkCny
         ax6N+0mTIxkXrqdMy5xjlR/VyQs37EjX8pMfjg27X1HAMsO3HCv+iV9JibK8My+K05e6
         6MLvJMMlYM6pL7NacQbPNEPqYw3wpHtqPnBh22XAhwVFI6aUCOXLT7mieL/9MHiFdxrJ
         BXFqVOVqwyLfExZEALEVT/SLWe08Tgn+7Taf9xuE/tBvhhg0LSvEb2//DK2V6TW4T6OR
         h2Ew==
X-Gm-Message-State: ACrzQf17TuWMtVVP2goiwgScmec3TDZa/dHioeFqVS3Hjwr89rQQXUiD
	EYZpe1yOeO3c92yJ1I2CSJYpYA==
X-Google-Smtp-Source: AMsMyM603N7YhowbV/mLngbMcMpi7ANtrcHEqI8K1TbcndHigBKo0X7hCkUeyO/qs/+b+VkW3Oj79Q==
X-Received: by 2002:a63:5f15:0:b0:46f:f26f:21e4 with SMTP id t21-20020a635f15000000b0046ff26f21e4mr16076149pgb.24.1667585084516;
        Fri, 04 Nov 2022 11:04:44 -0700 (PDT)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b00174c1855cd9sm30881pli.267.2022.11.04.11.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 11:04:44 -0700 (PDT)
Message-ID: <14155b9e-817c-8e1e-bc91-fbf902b4125e@rivosinc.com>
Date: Fri, 4 Nov 2022 11:04:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v12 02/17] riscv: Extending cpufeature.c to detect
 V-extension
Content-Language: en-US
To: Conor.Dooley@microchip.com, guoren@kernel.org, vineetg@rivosinc.com,
 andy.chiu@sifive.com
Cc: stillson@rivosinc.com, ren_guo@c-sky.com, guoren@linux.alibaba.com,
 anup@brainfault.org, greentime.hu@sifive.com, palmer@rivosinc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ebiederm@xmission.com, keescook@chromium.org, atishp@atishpatra.org,
 oleg@redhat.com, heinrich.schuchardt@canonical.com,
 mchitale@ventanamicro.com, pbonzini@redhat.com, panqinglin2020@iscas.ac.cn,
 alexandre.ghiti@canonical.com, arnd@arndb.de, vincent.chen@sifive.com,
 linux-riscv@lists.infradead.org
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-2-stillson@rivosinc.com>
 <4b6e20fb-d013-0a09-0b74-b6c46e045af3@rivosinc.com>
 <CAJF2gTSPoKu_owEb6+MLhAgK5nz2FTRDkTn4qfXF4KyA-XTwvw@mail.gmail.com>
 <CAJF2gTT_z96V3kjPtr9hpTq8XRn0x=91wFNPYFFdetAA2u-01Q@mail.gmail.com>
 <3cf13920-b2f4-670e-1f28-70940862c0cd@microchip.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <3cf13920-b2f4-670e-1f28-70940862c0cd@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_110446_118348_B1DBE7D6 
X-CRM114-Status: UNSURE (   5.81  )
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

T24gMTEvNC8yMiAwMjoxMywgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gK0ND
IGxpbnV4LXJpc2N2PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gCj4gSSdtIG5v
dCBzdXJlIHdobyBkcm9wcGVkIGl0LCBidXQgcGxlYXNlIGRvbid0IPCfmYEKClNvcnJ5IHRoYXQg
d2FzIG1lIHVuaW50ZW5kZWQgYXMgVGh1bmRlcmJpcmQgd2FzIHNlbmRpbmcgaXQgdG8gCiJOZXdz
Z3JvdXAiIGluc3RlYWQgb2YgIkNDIi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
