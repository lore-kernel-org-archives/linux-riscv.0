Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A3BC44536
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aix8eWlvh4SLxJT8lDKekAANvS6Zr/16jKf1nfuZYY=; b=MOMwAPoYqVsjEk
	VvFFo3kf4pf61E/1BjjSMVh+LiKoGDTWgD6Xw9vM5wpslPq4iSFR42fCd8t8fRXkKWH83uPZV3w3x
	1ZOxRttliLmNLicsbNQNTw30NecsLQw1LGjd5EKAJI3/jY7y9C2vwc1eU/0OtoyD6Zgk3zrOzOtW2
	dYsSAyLuCNPWQFH0Ktflk+RRP+3bBo/gxpt7tOiC+4mta+Zkjxp6C0xt/UuOBRwl1gC5ActRqmtGG
	TG805ao1nOatF8FqnokHW2jS5fLCiULDpiS3I54mgMLFih3CT6wiK4PJqQyEFz3P2SumqogeA0Fmj
	uRgMJSu2q6XTomDyvxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibRC-00000005pXc-1PWW;
	Wed, 21 Jan 2026 16:52:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibR9-00000005pWr-207m
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 16:52:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-435903c4040so14556f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 08:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769014325; x=1769619125; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihhUfgSz7A2yaxp14lt5kXBlvsJX0TtPumRcsY55W6Y=;
        b=VRuWjZH9AVxCgsICjeLGCm4yYU3UgcI+r6Viz4vGhzfHXUPuImbkvZwyThgBHyz8X+
         maAXvv30xCcuec/Yuh68TiGGm0pp4GY+9PulQTY8812ziI5nvLrjo/5T8YnzJiUJZsV9
         ZOtKdnfZ2v68TwqankIv+I6qoF5YJARJHrej5FRuh/167P76/n26u3UeT3j7dFhpFkKz
         9+RRdu/DB2qioJcR+1QmdBmFXShLIpD9iXXvPrzFaZGoMxoNQpYfOUBctI2Bf1/Z0l5Z
         xf826bRiFPqNrspq+wlfH7Ey7b86qF3Et7G5W0PmnDHMma9ol3XkZoD7fGpUkfB2i4dO
         R4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014325; x=1769619125;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihhUfgSz7A2yaxp14lt5kXBlvsJX0TtPumRcsY55W6Y=;
        b=Sfn8k9OtJXOKI+Yt1dJgDs+ya8OCSr9x4YI85TVCeovQd08Cu6hxF1PeA/s9l3c2JJ
         xxQTd9CUe/v59lkPWbTKPr2U7rWi66r4oFZIMhptK5jDxFzLplTQHPyRJp+5Wn4CirTH
         6qxlKo43ONLqpagfCDU2NIj7qpkvC/SGRRYEiW9oHDiLSH1IDZ/lVnLzbr7BApsXl+kw
         ah9Jd3MsC+zHjrHI+T+h9TmZBhAhtFci/yZNTFJ9A+/T7ULO6AxXJrIPRLT0wsn8FvfQ
         vYJ6fKicv8QwMCgxlOjjTkrVAJXFz8HlYHW2gQcwy9VU9Yp29PBOweC9D2cfhlhHNR5W
         olYg==
X-Forwarded-Encrypted: i=1; AJvYcCVMpJWqkZfjttNjfvjOCqgvaBJJXzpewDww831Fne8rPcItZQYLVZq+2qy+quw4lQwRsRzuP5vwVvCZFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI1cJOJBCkK/qJ5qxL1xhf69JcoH7/M7E9OJKr82vle0c6nvHr
	Zrl2aM+IxB23zFNtrxB0oU/ZU2Jui5GI9Y6+4fOxiw+GDBSCC9u65CTQ
X-Gm-Gg: AZuq6aLKzrNUobT5UV5Ew9/9HfyIUpKRxfK+FLdJTv7rEg7SVW+MFgLn6BQ7GsjloFp
	AVoAWKkQyt+TMRKg6NSrra3WEVrlDNqgt003OU6A7iS+zBLy64qDHS9L3RMlG3PxzIdGB0G+AE/
	NkpzKH8+RABA+hABv+oKZQc687ipW1QDK4xgRDPEfjtFcRO5J4zcSyWIEiZXkeVFYlPNDUCJga1
	ez+qzfhVumRkqIQt8sEkU9csTxV0q72BBL/8xocrLsgrpBou+LDuKi0XOZu1YJx5c4x+xlmcUfI
	RsF66smBRtZkPjnqbdaHyXCWIfJ8iPbHr/7paQ/XEedf9AZV8unikowZIYQ1u91WJLckzMXr6OT
	76JBWE76xlxF//NsV+MzawitjIGff3LDyf9ad290PauSdvbuecFP0WvSwhYpywfR2ixqBZuoB13
	lKpo37ZneeaQZuw2rbYLQ0VoUI6gFpkNm9eBG1gXdyFV6IkjDkKvK7cd0=
X-Received: by 2002:a5d:4a88:0:b0:431:764:c25d with SMTP id ffacd0b85a97d-4356a053cc5mr22591618f8f.35.1769014324966;
        Wed, 21 Jan 2026 08:52:04 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435924ae723sm11119706f8f.41.2026.01.21.08.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:52:04 -0800 (PST)
Date: Wed, 21 Jan 2026 20:52:00 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aXEC1f0gy64FY_Pl@anton.local>
Mail-Followup-To: Rob Herring <robh@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <20260115-cv1800b-i2s-driver-v1-1-e8b22b8578ab@gmail.com>
 <20260121163213.GA3413426-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121163213.GA3413426-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_085207_538725_993E235F 
X-CRM114-Status: GOOD (  10.77  )
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

On Wed, Jan 21, 2026 at 10:32:13AM +0400, Rob Herring wrote:
> On Thu, Jan 15, 2026 at 11:17:38PM +0400, Anton D. Stavinskii wrote:
> > Purpose: introduce DT schema for the CPU driver
> 
> Please write a better commit msg. Use complete sentences for starters.

Thank you for the review. But I'm afraid this is initial version of the
file. The current version 4 is here
https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-1-6ef787dc6426@gmail.com/
Hope everything from what you said is already fixed. Big thanks to
Krzysztof for reviewing, help and patience.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
