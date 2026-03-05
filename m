Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DA1F47CDB
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 21:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UA/tMzXRLzwxXTHzu5b6Ic6Ztv+Qg2pY4SUFVKTJOoE=; b=2tjj2/IguAv6IN
	13vAM/919zqo3ui38zOdqAy1pEnybsb2r/z9j++M9+zyJLKm3J1wUErbJtB0pqhHag4ZTgYEzrEFu
	96LpIV8OnzgJZZlE+bQM0nsbM9geWw3+7i4LRvKR74CMqJQfeKB6nr4UUExVC4toUI+qVysBPTHb3
	cubmXNEKZuX2uDz/AGef1aKBJpLeymGrhvVxIvPDdPIvcCjPUT35ZaHXk49uCwF+fzN6MV0dRo0dX
	tpy6fbXST+5pnTL0lYcAd9pZCxT0ok10ir112CbWraMsEtLs8n/fiSzKozWoEbNJdDEkYOIRRQJsv
	A+MSsAMvWS8vPqZopwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGLN-00000002aez-11Qo;
	Thu, 05 Mar 2026 21:34:53 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGLK-00000002aeN-3Rr5
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 21:34:52 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2be27fa54feso4528807eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 13:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772746490; x=1773351290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSsd5bKDZzrvqGFN4Dck6xWTQJmjnOdB6I5ka+LcKGg=;
        b=JqI0TAENNGRT56xb1U4c67FhberD1uDIBDitSHHktxVmVYNuXVkT+UB52w3D4Whm+M
         rqw98WukpXTkSkleHsjK5y+GVi+ARrIT4gvRXhb3EMhezTy1cE1tlUgMb8ZjIG+aQ7YM
         faRS3Y2DtqfM7DqYV/AkEYhJcxr3LlZgU8IkyWBLN5gUhlYTfSY7JX1UbJZq6HK+DeN1
         LPDhu2BD2q9hDiZYG+P5VAF0+oSULVFbP4+/K+VH0TykanYnrHLGh/bd4rBT9bEuBy+W
         HLWpH60MHSnHWJc9v1zrEjOB6HQ3Dlgp5wrVZgL6I7FtC5xfLTRJtDVyAt3ZHeI8NNiv
         ELWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772746490; x=1773351290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pSsd5bKDZzrvqGFN4Dck6xWTQJmjnOdB6I5ka+LcKGg=;
        b=ikpGFVyqYIsfUvO1RmD9ifUAYhO+vWidkjPxaOAGGx/XF4Q2YWPspcbgQnQLcTKBlX
         lLTWxquq5iv1uGmNJ3DeWliCIF70AHo4fxb1Vbqotk9bYfdIk8FVOo8rbISM5q3O46Pk
         YBSNew1TiB8TSOHgJrWialh+oexSDvBpm4PfBxgzRWUA6IbVh3d4bRNPDDNiuO/kH3qi
         yiw1xBF0ZL2aN3wyCAIbt9BXRi1nDSPnvARm0Rrxlz6J6y67dyEgSB39SKmysKCe9c4x
         O/QdIJe/i3nNf+2kFK+GcexotvVnQ3L8hPvbja76sVU+0+ryJFbY9HBR/NgKvURy4PN0
         BVMA==
X-Forwarded-Encrypted: i=1; AJvYcCVVkpPRkuP3axCctSHr+Bq9tXGDq3ZaHeZdn9R2Z3y5JH5NcUwOu7+UtM69/oapSJ1wp3OZ36H4j4evjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmDNY0eHjRYW/7hMzvLKQqV4DZb+8Ln+t/Kh85/AJIoUbt/qam
	aXyG4BgJYOJmSMFYZp2s6TIbGUutaQ6f1aSFhzjyWURTA0V0XS4rSLjd
X-Gm-Gg: ATEYQzwg5xOP7Od8KBttpVtVadAb5OHFjvvI3PxQ7f2RXtYmocpn/CIlFJx7UL1VRac
	IyGsJdVWf28N/U7aF+lVxRR+T+6J3Yp38Xts1tpTM5JmVPtfqy5d3RSFjb9ZUJEd/bFsL7/nIHJ
	sPNVjoWQUbvysRN9+hf0c/NVWHtfX4L6Oh2FffHuhpqjji86EhLx081D9KcyExP7QgzJ+Hmt9JW
	6DdSC9azN0JcWZo+le2Zjf1GwsRjNxmXHpmd2mNS+lEUIClTWXN44txrv6/g2ziqkYwf4Z5lTG5
	XbGlyTbAHMAP45mvoaSMbRP8sjiwVuw9gPRVEaR1ovtLYxnE12A3jWkiCHwHLZod/3aoH2uckcD
	iYk1msEfEF76yj8umScK+T0lcF/lmohtkDxRf0Dlji3cykS6dHypfMD4mopmgPRFv3I94SkJGgb
	/wX9cXo/yPWdS1u3DAzTbO4msto4HQlYeCxfZS
X-Received: by 2002:a05:7300:148a:b0:2ba:75f5:72a2 with SMTP id 5a478bee46e88-2be30fcf975mr3249419eec.2.1772746489738;
        Thu, 05 Mar 2026 13:34:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfba0df2fsm14573249eec.7.2026.03.05.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:34:49 -0800 (PST)
Date: Thu, 5 Mar 2026 13:34:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <de1e20d8-2d0c-4eec-978f-2293c1ebac8e@roeck-us.net>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
 <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_133450_866726_71096ABD 
X-CRM114-Status: UNSURE (   8.71  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 05, 2026 at 10:40:43PM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> has the 1/100 degree Celsius bit (the values are 42.74 and -0.16
> correspondingly), however the binding currently only allows cofficients
> as precise as 100 milli-Celsius (1/10 degree Celsius).
> 
> Change the multipleOf value of these two cofficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
> 
AI feedback:

This isn't a bug, but there are a few typos in the commit message:
- "cofficients" should be "coefficients"
- "correspondingly" should be "respectively"
- "has" should be "have" (referring to "The G and J coefficients")
Additionally, "has the 1/100 degree Celsius bit" is slightly confusing and
might be clearer as "have 1/100 degree Celsius precision".

Please fix.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
