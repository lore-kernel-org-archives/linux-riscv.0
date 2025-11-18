Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BC7CED63A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hdvozNrFNj/IBOqBmdnqKN1kntM0PSgtKachFkCD//M=; b=hkElPunytk/01e
	LJxW7kNPwBc4XoSFGx3FHu6Tv/k0Mxt0efgJdSryaIcPLWjpuZxuEUhKeS/pkIcJPJZH02Q+foqlb
	V6+FHljyRVle/TfsMWyuuqTqSvC87kdOYbspGHvVY3ST+m7BZ14vTgShNWJ2RkAkmAne85DvS9eS6
	FQe+uGRDY27DZWJ/ikJy9dPziml0/W3+4M61t0c+RKwUonpVpZ2NTTemfxoNvECPqlxY1Ww6Ng9Yj
	CSNOeGa7Cir1YTGVU1nhCA6vIMuKH0XcOphplKfnumxtGxqMlw6yg0TnJk8M9gTiQb84WqcdYsqwk
	AEgjoz3KkeyX+5KOXzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKoV-00000000PpR-0hvM;
	Tue, 18 Nov 2025 12:28:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKoS-00000000Pp7-13og
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 12:28:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477549b3082so44695555e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 04:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763468878; x=1764073678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTg/zFhYq07dRdInsaNPTNhQ1s1RrOcCC4Ij7Sv6vBk=;
        b=UzZRildcEqFUpPLK5KYSQtjcR455WF0x1s8ZwtwfYkRCj2NI30jkeytbU3HjhbHRVD
         6i7UQosMhTQH6M5uktEkzxjC9zi7CPzWj2pNHNiza7xZ68aQ9KRj8+osp8s5nfqCFeKF
         280nYKHJlCR0YSFbYCsqCJr/MrMkWo6LiDtJHiUkKHKYrZZK4GXU4N1cknyTJQG9traV
         5lXKAbUMrh0tY15TvCpZLyI8l5Pcf6KifxQ6sdlJ/rGEmVlmxmrdi2jS4kAOTf9bAr75
         3ee7glMi3OzEHDl+HHWz1rv51Wf6a4ChlqeXGIFxk7M+Fcjf6+6uSANIsABXIFJxNyrH
         IxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468878; x=1764073678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tTg/zFhYq07dRdInsaNPTNhQ1s1RrOcCC4Ij7Sv6vBk=;
        b=buRNwS1XKASPRVBGu9L/kcU0HGsX3+YBrqYfvXLvTD96fAWo5N9/QPge4981gJl5r/
         5lTtPwzZw6eT+rEYr+FBKFSm95gphR7i+TsaTPxQoNyxkuZw8/mIMy7CYemou84U6nY0
         c+8FRC/AjqyOlFdkW4uzwQQUB/Fh0HQLhAmERbimS3tOsNNu4HSrRFVYSJ8zRNby+w+M
         PiKGj6vMwlRyUkbygnBhPLYud1262cfgfF78YLlyiLpWVnK0+u27Kpicvxx+4Lovfo4M
         e+HqkAScygpq43GtvUzIFZuisNQgKeQKptUCulfq3hvBYzCHSee4PSanpax8GZIAD3kh
         tDQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoDVHeqd+9FBc54a/pdbIbqFuJmeVbXEOB//dZtllm0Rk2EkqRhsuC+mZP3v4jLJqBUTi0sLKoC77s/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3torReoOCymr+5CNNFJ1Nz3dg75bn11dYmYWy1vRamTNvIyNH
	d1HMbgEejoO1YKTO35Iwl+x3FBxE46AT6qF6qWsJ3gce83nqlryjTW+M/Sn2HP210WY=
X-Gm-Gg: ASbGncs6eoK4LCXg0CcGPLjjlz9T0Jp3y1TZ40DT+uyzqtRfSqgBWRa5hfr7LwZ01uD
	aa4tpf3dPNMdGzs41n3uQTTAZ0t1ER/RcsUy44Wc4dm3UNDf1iU2VClRKhQ6e+xZjTI52FHdWoS
	wx2BG+GDFdgRR47wGwOi6EIkEEnGHFZS38DHRc4ubnDZEUIgoeMo+dz1qlEjvmb1cP8kgTISl6d
	Gs3WB+PC4llLtG7LbwTH9q2i9kDuVh7fNlLERtFUfFq6LjnYtrMUZwmdtM374A4eddKmz6WSLGc
	aNFVAGyhcjyqgTlwyO2q3vOnAVPZqx6eMHu9P5a4SzLw3LT/hKITJmstN2HZpbVbBSylCzUwtUm
	NcbXinioAVLHVKH8lLh2Bkd34PbHpSHOP+Pamku7plKzOslR7kKU+OuRPCc0g4WkpH3l30o6WCC
	ISkzc=
X-Google-Smtp-Source: AGHT+IGwGnIyZlfEO6CUHM/fTs2swA6eepL0DvcJAV4a92k35zE3cM2txOp8KWawxG5WDghBOM9Y7Q==
X-Received: by 2002:a05:600c:35d6:b0:477:ae31:1311 with SMTP id 5b1f17b1804b1-477ae3116a6mr9228035e9.13.1763468878245;
        Tue, 18 Nov 2025 04:27:58 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:c283:3472:316:988d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477952823d3sm216032355e9.11.2025.11.18.04.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 04:27:57 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: mpfs-gpio: Add pic64gx GPIO compatibility
Date: Tue, 18 Nov 2025 13:27:56 +0100
Message-ID: <176346886857.23977.6496336184922024881.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-grumbly-oversized-2215fe887181@spud>
References: <20251117-grumbly-oversized-2215fe887181@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_042800_300105_B4B1B81C 
X-CRM114-Status: UNSURE (   6.84  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 17 Nov 2025 15:59:18 +0000, Conor Dooley wrote:
> pic64gx GPIO is compatible with mpfs-gpio controller, add it with a
> fallback.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: mpfs-gpio: Add pic64gx GPIO compatibility
      https://git.kernel.org/brgl/linux/c/bb7c963d0008f6d652ca7c7aa1aedae3d03425c7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
