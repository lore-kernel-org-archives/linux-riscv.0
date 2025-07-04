Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EF6C83F05
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 06:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBzAvmGAHvPJslP6Y7jzTNeZyYYYUTAKdyD/HJo3b5g=; b=T4TUw3lHZhkyGA
	laP2qZrwgvwCySc+Q3Tc1OyzrYotpEJfBVfGtSgstkcCpY1kIr0TPZF3VAZG0pRVSf6I+V41XFHnZ
	L2/a8NS9B7in5t2v3C7baiuBxG2OMKHB2qF0ItZUnLr0Cf04GwEAQrrwx541E9dqrJVYRVrGXWyY+
	5lRhTjo3U9BaWj8gP6rTLCuFVnoSxv16iVjpegvMYOMsl2ipON2riOPrwoLH01NEPbzJD9+o9n7A2
	FQFolz3wXF+D7sPwgKz3RzyeAXedaQ7mQm5KXtDHahXzvkhmtlPDk9RoANPDcXLv/zHI/50vNMXD+
	cyOCIGxEhe6f9j7EQR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXa0R-0000000DQiM-41Xb;
	Fri, 04 Jul 2025 06:34:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXa0P-0000000DQh5-3mWg
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 06:34:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so533252a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751610881; x=1752215681; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYiCNFfJqMeO2073S6siJ3ufZ/e3IN78WfGZjIKg56I=;
        b=j9cteF4Z46KI9m1PeZTNj9GfNozBMJo8WKtBUqp+UTdH+O6CMwwvEVeY1qwZ1Bq1r3
         P9ZmjUFmAnijjAe+JbGoR9U/0LlhFsW+zxp39PrvUCgpZzQCX2AdyQLgTdd4uA0WhQ7U
         4S9Qs0+gNcNsyZUh2XHfYzYx1nkP/VX5twjJHV4XwIpvHnGN9Nx6eHECAkTHXndy7lNB
         p/gv+ghKs+7vZSx2H7bL9LPG2MCdpbnIk57QX+0j5PtgoB52/9EP4Dv83Kr757hCAjKr
         juMvL5ypqtecC3LDcstaqPR5ZKaQbpjaaJTs5ZJ4UjjX2ODnwfNVdff1NnZLfzC0AX7F
         4/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610881; x=1752215681;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYiCNFfJqMeO2073S6siJ3ufZ/e3IN78WfGZjIKg56I=;
        b=FSFw80jDGvSE16+nqYatoGEoNve5EgQCJ+6VfKY1qTthBs6xoss3WVBXviG/XE6iyv
         UMhhX1lv06bSu1teF6pRTXSekx8o6GdaDgaJFGcP91zTaDVDH5sQTyrmOAu7mX0R35lX
         1XBTYPTCsNQQR/U9ZKHT1kiH/HHf4zMrNOwVPxUg9cDo5YfY+tQaNEYOyiV+dopvMyZs
         XFB4Dv0Dvp3N1OCMvAXaMjx/mKdHhRh7ByXaASAax0Db8rreg7fzfrKJuNAYijDbxdsW
         CwA+Qgtr5uq75J9fLfCxStofalYtPu+5nAYoJbPYpurmQSQZomnlniO38tqHh8Z8HbLP
         vHBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7KGlfkM9Y2Pt/cKHAaYrrdH68HHeXyOkP4O8D9V1Zs8PErObSdGIN/Dg8L578VNJUz0Ar5l00KE97Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxZMUXUDIXiEcd3nKqcrTs4dpi5x7H1mkBqKOaLES09roOt3xL
	qfyJzylmNN/UASrp4ci+YZ/JH/509dViizQXhvSBSnBb4HhXLJ/CyYjK
X-Gm-Gg: ASbGncv1bb+plX9gNPX6iDldid68l0vsrgaiiphrb3wg/KNSSNmQbmrw3TNKl6ML+R1
	qPmhpCiBUWPqNPlf3tUQCKuRGu7nI5DNzVzaaRIDsZfEIM4ow3uJm4qxVpxI4QqhmrdcrUKePNk
	Kw5eAjLZ26tW9L+vnhswB+Ils49UxFyrfC3GykC8IPiLri70FUydlNWjrbYf1Ic3vV9UzM3d92I
	TDuidCK54LUyuNeSRPa/zm3JF2vGJygwt7yCMnn2FW0t4uXn1TwrqxJRW5ql6P21d+elO8TApEI
	MPJKnFu/dciJKeJS/943zqwt/KM2nINGYViiH71ngNKvsDWcdOujkTMADnDpJP1MGxV0juTdpDr
	0bgRo
X-Google-Smtp-Source: AGHT+IHEHJgrSAlf4QtYjnnpQojHpV64nqFJPISlrnqx4qrKwtRHYPIo6YcfJzG+LY6E90mpEFUBOA==
X-Received: by 2002:a17:90b:1c07:b0:313:2f45:2fc8 with SMTP id 98e67ed59e1d1-31aac4cf19dmr2508356a91.18.1751610880251;
        Thu, 03 Jul 2025 23:34:40 -0700 (PDT)
Received: from smtpclient.apple ([206.83.106.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc4ca0bsm4159360a91.4.2025.07.03.23.34.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 23:34:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20250703004024.85221-1-inochiama@gmail.com>
Date: Fri, 4 Jul 2025 14:34:22 +0800
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>,
 Longbin Li <looong.bin@gmail.com>,
 devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>
Message-Id: <C7422FE9-1DAF-405C-99B1-1838F2ECE6C1@gmail.com>
References: <20250703004024.85221-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_233441_937244_6E9061E4 
X-CRM114-Status: GOOD (  16.94  )
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



> On Jul 3, 2025, at 08:40, Inochi Amaoto <inochiama@gmail.com> wrote:
> 
> As the uart0 is already occupied by the firmware, reserve it
> to avoid this port is used by mistake.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
> arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 5 +++++
> 1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> index 96ccb6120114..1b506972d465 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> @@ -113,6 +113,11 @@ &sd {
> 	status = "okay";
> };
> 
> +&uart0 {
> +	/* for firmware */
> +	status = "reserved";
> +};
> +
> &uart1 {
> 	status = "okay";
> };
> -- 
> 2.50.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
