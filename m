Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C979C982DE
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 17:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbR782XgEjzjJDr49U5PWeTWa+QrSPqbRpmXVwaKZog=; b=OjLNqHO90WH6vk
	QRkDMXHQWxLrp5ZLgaEiFyvW5MTuduATdJIl5vKDBHklX6FjxFkRzEwgnvnAeaWHKh11d3TjJZ1Zu
	iOuw2hq37IiF9XLyZOaDaIYlShUctM5uhidCloXQmYDuy6vGHeM4XbAIcHnEf+MGwTe3EI7zqsvHd
	bPzI22R8GcsrPhSWXRZiSQORlPcusd8ruyuJpxJlI/CaDkwpnePdddLZ/2fC6y8AFEN2LHncuXEiz
	m0DnIt/h17HclOHlEtFSeggJNqxpl6mkx5OfvZZBYozjvXhYm+qrkpjhp7De7/ipA0M1fwvPU56+j
	TfprJpU+clyy7znTS1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnaD-0000000EZhf-2C0A;
	Fri, 16 Jan 2026 17:26:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnaA-0000000EZhB-2Gm9
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 17:25:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1310426f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 09:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768584356; x=1769189156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guLdPSMspTYOQSTOoD0vgqQiAA/YDtF0X8jjlbY9les=;
        b=Y+hYTWXPsAUM2Hbs/N2FAgANxtPMHeWJO4FqiC6zRTj+Auyl4gy7T2tmSibLrL+HpS
         oW/O7q6eHj2Rt8BB7OguSqobN054Am5wZcSwaGIGWLSAmdj0JAxXO13DMfFVJFZ6jgYT
         5dYOWn8xA4m8APvvttCHJVrL+rAS/B+B5BUyA0QkEJkh+X0eC5rDjC2nGUMjeAykFraF
         x/kw2RGCjnSt0bNGSWu87AX3i2iH7LqlI8TIJpiUTSqHukLqxHVXyr5P/FYx08MurCbU
         p26F0ggSVBWKuc18VIdI8lv+1pSY5EZbB9XL+LmWgLzvPFfpMNPglpW1GjrXv92sktYL
         3P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584356; x=1769189156;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guLdPSMspTYOQSTOoD0vgqQiAA/YDtF0X8jjlbY9les=;
        b=FZ8EAkcrVrI24DYqQ7Z6CDjzmWY5qiwR+kfcLcBmHJrwjjoEdp0URWigtjea9qV1MK
         1h5MClIlj+3DtG7n8WHO5/XsMhXY7K1ywtnWF2oVZ98Z4J1NUiExK7HpLlPJmhH8/jK7
         R5kk3AX89QAneKjseSgpW4/3RWa9petxGT6Jlb6RVH7e4UIWK7WiTRANJhNI1SapZU6P
         +iKZ5HlFMU6GdlL0+sdvdiJB0u/gTf6UcZdgUhbr1dUtjAuW2lV40j3z3ypobG0WawBs
         +yKErSrc+HW0ofgzZkOI9rUkvrfOi38dg2yAnUGyFeMZ9Y10paXdkE7ROUk7QBG8REaY
         WMqg==
X-Forwarded-Encrypted: i=1; AJvYcCXZCSfe0joUkZwagq3bdxHvk8lNd7FYH7P/yUgtd/9YP4Zu+UC6T+hHW8NUFgX8IukD19Jum6rdX/MdQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxehHkqa7m3otavFnHMPXnM7Vif0zpzD4v5+RqXr1d3M+q9r6tB
	cmJvTVkG+eBlVlfBUkbL3orwCDPgOwz05w+xjxSODPny8BXcOE5IDvFm
X-Gm-Gg: AY/fxX4lp8NrHyvetOJNpDIu6rIczsgUhUvAIwPfjO4H3AlaPNXY9xCdg2/XeBsScf1
	+/q97IkNiPfHcyUOw8Y1WTaG8UHwbRcqvKUQri+DNtHNYhdDsFw16jZibVc1NjgH/s8woG6zOjo
	x21ENb3Z8klkunU6fv39uzcRl/6V8F0NkHqes2K3q6m7KRKputzSXP6aQHqbZAnyn9FkLWeqcEK
	zTZIDZSUPQWd7sFhLKOO/cUFcV4QvY3uSUNLrj91vFu9m6EWdJ0bJJgzCaPnuN0j6znbp2tZICk
	VmEA+fivib6b8JU7KGhXeh4WBbtxdHOIswGBVLQaX4sLQzCim9/KA8l6C+uUx3+2eafT/QLdKs8
	ehKOaoKRpn7RPf1V+rp3MknIAqARg5SuQR0wjWAOr2d0p1vl5w6eG7c84BKRJ+QLkoPxYC3Mibe
	NVpip2SNEthO+DQCnkiqb5/TJ0bEh/sfuj+f2lGaJjWrh9t6c3z1ZyYG0=
X-Received: by 2002:a05:6000:3105:b0:430:f622:8cca with SMTP id ffacd0b85a97d-43569bd2aa3mr4952607f8f.56.1768584356323;
        Fri, 16 Jan 2026 09:25:56 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569998240sm6098837f8f.43.2026.01.16.09.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:25:56 -0800 (PST)
Date: Fri, 16 Jan 2026 21:25:51 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/8] ASoC: sophgo: add CV1800 AIAO mux and I2S support
Message-ID: <aWpyLQ6FR8_RsD1n@anton.local>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <aWl4fvKsUZDg9dwj@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWl4fvKsUZDg9dwj@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_092558_598600_107B9EEC 
X-CRM114-Status: GOOD (  18.09  )
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

> On Thu, Jan 15, 2026 at 11:17:37PM +0400, Anton D. Stavinskii wrote:
> > This patch series adds basic audio support for Sophgo CV1800B, 
> > as used on boards such as the Milk-V Duo. 
> > The series introduces an AIAO audio mux driver, 
> > an I2S controller driver, corresponding DT bindings, 
> > and DTS updates to wire the components together.
> > 
> 
> I haven't see your mux driver, is it missed?

That was bad copy paste from original version. 
Thanks for noticing this. Will update the cover letter.
I want to not overcomplicate already big patch series.
So multiplexing will be done later. 
> 

> Thanks for your patch, for all the patchs, I hope you write a
> meaningful comment for the patch, at least for now I found it
> is nothing in your comment.

Thank you for a great help with that series. Do you mean
I need to add more meaningful comments for each commit or the 
cover letter is not describing everything clear enough? 
Anyway will do my best in the second version. 
> 
> Also, the patch 8 should not in this patch and should be a
> separate patch.

Yes I've missed this thing. I will remove the last commit 
and move codecs nodes to the base dtsi file. 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
