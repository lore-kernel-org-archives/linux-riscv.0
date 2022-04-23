Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDFEC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcIXlwqTmSv3niHHKzXe2KW5jQ2cPjmQSBm8ye8bF9k=; b=vNTbNFEK9DM7fZ
	qxOLWmUJuRjInGvhEEC/meeImPdwXSaZ8haDKKC2QS95rlquATkN6fivafTFTdWvHyBkmoSRdFxtJ
	HphciRZf3w9iVGFNOhVgQZG7ZujuhMUr56oYn5RtceoLebk90/FIyoPPnLu9oauolGkovb9mLSacU
	7m0+sTTMIPWDIWfq6/lLB+fLEDDvPahpgsmCj8+O/BBtFlwLk8+9C7nxH7VvkYgBA7QCKQQXJSzGc
	vh4AyA+xbGbc6cS4NErAASek2gy3jkh1ksWdnFanmCsb62SyAf7d7vDv/GSk3aZPQV4mv6CQfqQ2A
	TuPtFqzzzMIwd3c4B3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niK29-004oTm-By; Sat, 23 Apr 2022 17:59:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niK26-004oTJ-QJ
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 17:59:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id s21so586530wrb.8
 for <linux-riscv@lists.infradead.org>; Sat, 23 Apr 2022 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8Kp5Q1vS0qC7/glbftIgd1JyC43ZLOUVon+K5fIPn5o=;
 b=kdFHFAQI714HGQRNu3HLEzwruvNHj2VG2kP5gN91fvdPuj5IQKcwIQ2h9B6TZe9++t
 LRqVj6ve0sVqn92288cEAFhgJZ+5OEBGqs7KSN6IHMmpA4yOS8ByPlLU71u8VssdxID5
 L1Ab5WnwFlgN3YJfk6UT7bXMX/d9APnKhinl0YiP0TGliMEvtrEVsDn7696t54iIo5Hk
 dJXNS1B8jOE4XUs3e2686L7vXwB8zwVUYFWd/NbTl6bAlGuy7RwONIS2OCfJkp/k/Vbr
 QzoZ1IUAufWjVmT4dp9rNQjWYP/XNO2Gz9ubSQo1xH80juy9eJfNFs3hdc2y0TarnAPe
 pvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Kp5Q1vS0qC7/glbftIgd1JyC43ZLOUVon+K5fIPn5o=;
 b=bO5EZOh6ihj6rS3cCaAsOgVJ5c2pxAUEzXglEV6Q5zFBbitWXIhwYGb+ItG8CVI0bW
 31ZCGlmbzo1uRC/IE6sCvqThpKollbzDYHgcolV4N8133UlK1/zkFCuUZb/UQVo1YHYz
 R/qga0uvka7cp4Xt9BzDRF2daAGi0REH4T0iWHi2v9iHixm26LJ+///5TZI9hFUmMTBi
 3ulXVRPt00vSJHDPq8O1ve7PBLXT693QxDCshlAky80JIeV81MopsxTPwD8VtStSDc9P
 Yq8mFYnc5+hCrxAMZHS3Vbc1s+r67zmKNIAe4FGJBppFI6NxUnt7kji3IX3y6A8zAGwe
 2MxA==
X-Gm-Message-State: AOAM5309+SsRqZpTjkxbNw8rWnpMcSXyNiFyRiEk+Dy13LmjH6bvawUh
 E5pf9bx9IHulOmT/M6POrNoPRA==
X-Google-Smtp-Source: ABdhPJy4qom34eZ6mVdIY8SbAZlO8Hyobh8HVWgZA+5RgKrP5ipkq5Vn3x0OnSwah/JrOmbFwKj6pQ==
X-Received: by 2002:a05:6000:1864:b0:20a:9ac6:b166 with SMTP id
 d4-20020a056000186400b0020a9ac6b166mr8334383wri.354.1650736736178; 
 Sat, 23 Apr 2022 10:58:56 -0700 (PDT)
Received: from [192.168.2.116] ([109.76.213.55])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b00392951086efsm7744297wmq.34.2022.04.23.10.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 10:58:55 -0700 (PDT)
Message-ID: <207bacb2-40a3-49e9-e766-433d152149c4@conchuod.ie>
Date: Sat, 23 Apr 2022 18:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/9] clk: microchip: mpfs: fix parents for FIC clocks
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, krzk+dt@kernel.org,
 mturquette@baylibre.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-2-conor.dooley@microchip.com>
 <20220423014103.8574CC385A0@smtp.kernel.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220423014103.8574CC385A0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_105859_121419_61974024 
X-CRM114-Status: UNSURE (   4.76  )
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

On 23/04/2022 02:41, Stephen Boyd wrote:
> Quoting Conor Dooley (2022-04-13 00:58:28)
>> The fabric interconnects are on the AXI bus not AHB.
>> Update their parent clocks to fix this.
>>
>> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
>> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
> 
> Applied to clk-fixes

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
