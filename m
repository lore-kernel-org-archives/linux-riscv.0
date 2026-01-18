Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CECC9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXbOCKDLcj5btbwgITlt1xn0IMq1VQU54jh1ScpHueM=; b=2Noe097Z6bsW16
	jPODpQtDmnV1fccB1ePxucnrKREusBpyqT7nc6Xa41OAoucWsNlI2TvawP5EI77O2FjlooXYFk4dR
	Gnjjxfhdb3JB4nanHOKRrlDHocgyRDbrcarNsmbefOxCMjwthRhQwzvcg1Kjy4OMLjRgO1+0UM3kE
	IMe/cHosVoHS/rGW5eVuIGebE/KdRKCAVK+96Nq7MoaoC6bGmfWcg74kL1gC5XNNBTL/vEs74CUuZ
	3+ywy0+vKbskwRxCorBY0nTESejg+bYLefD8Y0B+7V3VlHfRGtn5k6kygRGPWK+qDN8+tA4WheGkT
	vHummC3043xXyY00/RQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWFt-00000000Y6Z-2YZG;
	Sun, 18 Jan 2026 17:08:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWFq-00000000Y5s-3WK6
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 17:08:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so40861595e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 09:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768756077; x=1769360877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzZkrvjzl8CZXzuYp4FhKjj0g1M3FRzGDlc7LV5XfLI=;
        b=aFoPRmwiUaMs3hm4NjXsurE9adIZ5CcYTtYfBk1Ue6S4ZmOv00Yu9V60ij4UC+yBAs
         xDZiWHCpcDwXpcL5dooTWhtw2As99m3aGwnkZDgxovaCbGRlds0IblG/w85Az/1g7DzI
         IjLuF2xGrMZkepSZ62W4k1uy9lCflSoIVdoDW/eKe6KJZDCfnjlAFdjnOD6cLfrKrCSS
         oJ1TNXpUZXASyyfVt9UVOladKKjIca7ez9eE/X+C/uKCo7j6ol6uI1dpQu0wn2oWkQGL
         sHpra3p3X1qoQkvRVta1S5YYgKNJjUqjX8sf+e4hWjJ0+MmnwufChcYGu/xTJDYYhNjk
         CvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768756077; x=1769360877;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LzZkrvjzl8CZXzuYp4FhKjj0g1M3FRzGDlc7LV5XfLI=;
        b=cVCL3+2KZ5MirNqWt0B/VTt0tSqiwD4U47BwafVE+K9UBVs/HQNq5zEoqFddHHq0/R
         nK7m7z/HRtiv9JihBcWiu37VaW8iZsoRav/P8sI/JBdAEwWEq3/RW5usdCZJAmOiZjcN
         SEEKIjLiw0d4vjk6ijqeUlq+OzH6k9Xl6PKEHRR3t3C/u5q15QhFUWLfaN5S51AuEHCR
         YXLbvQHfoeWdzCgziyQmrZ2zPwNtdqUYqJ2mF2nshOlRD1lUHfH4WmiAKOzxhtaQS7JX
         7ZO4IN4uNCasPM0esc5HBxm3mF6l3fJt9NUvzk3z4x1/fXwoLYGaA1zHul0fTk/OGoWU
         fmqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv5mjuEw+QrSDgkGmrlerC7Fa2HZPgz+8ifaN65g6yMYRduaXtAv85TMSQQcSZlQdxOSD+6wWpLZmzzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIn2nv1bCab/ATVCr8O07bNXc7AHutMy3JJh5qPUv1RXQSZIl3
	E6sGBMQmpKDEr5UlhzNa5pBNGOHU2iyZtNlDkCr5Nc6LUb/coAZ/0fkt
X-Gm-Gg: AY/fxX4vs+eBsEcMu8FeKa9g5ejtGZL+NSNhnkyW3on08IKNn8muSb4fXwAaQUdbwcR
	640XZAg80V5ZD9V+hqVy9nf710/cq67beM8a5qXpCg6PVJoLMq8njN9Tpqqo6jWndQ7xXc0fxjO
	arqEYEvzkWU2MO6+aER7HazIuYfNLl1AGbqbc+dYCfe84PDV7GkcmB4l+1qtjgYAW+k2Ne9kvcB
	fRcqXBts+3/RbugszoIWI69FKxbG+pQofkePqe2HpZUGl680MhEWkAKVJQFPERM3sfepoOtM/TW
	ej1HzivpaAXAAAEoeoL8UPSbJ2GFk96XWgQQgmH6b+A+4tBIIOTFVCHZ0YiFARb5QcvW/+bMEoH
	EQlUwdX7PpcIG4i2Me6YmVdfZsRJ4znDVlFGjdQYbqAcwRHJzC1e06LPFOAgw/econcHEW9E5aN
	G/VRboYgeNvCjNdG2jBEOMQ0/KFCJs+FOcNjvWsY5o6i0=
X-Received: by 2002:a05:600c:4e93:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-4801e30b737mr113177375e9.12.1768756076408;
        Sun, 18 Jan 2026 09:07:56 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe03b56sm66590995e9.4.2026.01.18.09.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 09:07:56 -0800 (PST)
Date: Sun, 18 Jan 2026 21:07:51 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aW0SikDtd0HIrT4v@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
 <20260118-famous-magnificent-peccary-474ba8@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-famous-magnificent-peccary-474ba8@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_090758_908105_5674A042 
X-CRM114-Status: UNSURE (   9.05  )
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

On Sun, Jan 18, 2026 at 11:14:34AM +0400, Krzysztof Kozlowski wrote:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

dt-bindings: sound: sophgo,cv1800b: add I2S/TDM controller

Is this anyhow better? Also in the documentation directory should go
first but I didn't find such examples in git follow. 

Thanks. 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
