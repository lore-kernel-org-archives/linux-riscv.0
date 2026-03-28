Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3628910F3DDF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 09:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:Cc:
	Message-Id:Date:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1nVRnlRVHxdYKz1kRF4PYbQtmHg6yZ/n1x+LTQmQLc=; b=aYO2+LQEbrpb5/
	5WIAgZg7hu+0HXsmlryDU30AxtPDTHbSnu4es6jL2X1lgtmCIaj4lrv2Oh3uB/Sv47oXmTYBCJUjp
	X+zROa3ABOMytD/fjcA/+19PC/N6x9vDw7A0lrPWDYSxGpXSrvo3eqO2kkzjjKjiM9r+Jm8N9evjI
	h/haMfYBI5PEATwhY36Qq6lRcZmyyuwve4qaLAHmFOQcgfJRJspkIZx73irxWbt5DX8+/uTkgx3xY
	FZJoNcPAJz/S+krWyVJ1o3WUtn+wb6z9NzGCgD5koIZbjEmaO3s4trkbKIjxq1nlAuUPf+Bk6AODo
	wk33P2VVaXOGno4dcUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QRK-00000008nhR-4BhM;
	Sat, 28 Mar 2026 09:58:47 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QRH-00000008nh5-3cI3
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 09:58:45 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-128ebee22caso1366641c88.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 02:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691923; x=1775296723; darn=lists.infradead.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPZRgmhGXKGLV4+N3md+ZOqvfZ5oB0BV4k3AKJQbhLw=;
        b=cuwvahQqakYd9bk9e/cVbGAhHWV7pSHl4uWwuwxo6IeJHuxEVZGS85A6qjZMvSj1tF
         z1rpilXRcq5SwTp6fVEfhFiu0MRcSg5unMhzoBYK/zmR8Ej3hefqLWUi9DFfekzGqhQK
         dgsACABuTzJM9mi0rtKaPbpF5Vemyll2udtMiQpFvknt+4zm/hw8eTTUKQzqGB/z7b26
         UJxtN4oQn4bdRPqhm2Sv9AVtAE3fP7LR1IR7O1HDKF+HY1TkCfTkVBLPNhOMGeAdNdxq
         WqfAtzmPThZ/GZfZ2WenURlZhPFkLXv+oKe/DllLm+QLRNXLs5Yjbc3NgJNi+jduGJ4N
         csRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691923; x=1775296723;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPZRgmhGXKGLV4+N3md+ZOqvfZ5oB0BV4k3AKJQbhLw=;
        b=j+eqi72QZcLBxpdKitNk/5VInFZvWr6iAC/zrB/qY9zpLv8ayz2NnyqDTBHnqNmu/l
         4xjHdn6lJunh6o63sBBNm6E/Hbaa5CqOZpWUyENJ0ALNOsaF8ydg5C/m3p0q6KUCBRqd
         Mi3XiVt++8ibQ0qi30IATbGTV6Kt2O5MRqR2MioBNO2JLTl0eClQau2Dp9+zt7V5izli
         CQyrC21lBk5T9xiQH5fAIsh6YbKBdRnJTEn9fiKOhjQvhe6l7vYRXMZIShtQEtcyK6ZI
         crmLH69FF4ZSD2HTByoQtGBID3IbFLRA5SREwk390e/p5/dHk80UEbBDgQ5OLjsNf98G
         hSvg==
X-Forwarded-Encrypted: i=1; AJvYcCUW6PVXAQGVT0BxN+SkXn+3LxmfScAVDqKWla0+VJNxzQgh+0QWkK7jeq96K/gioruncy4hrQJPJdRUaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9HGI93WgitTOpyBix1rF1h/ODDp2era2DVb4zSQ7ZVDHTYyzP
	nSSj8t1VMbiQ35mO7KrwMNvvknDIu53H/+nptQcVqURW5/Sy5Dcu8yDH
X-Gm-Gg: ATEYQzy1Gnv57XklLsCROWVWrdalClAOjBbYDKecHXpBj/7pxgE6W2hUEZ+zFMbhYlk
	nyvBglFtCxQEeMEV60kSbTgdCuDYowzUW5Bw/5mxnqUVKETOO+VJPlB/JSZZwmcJEthRpjCKAmf
	P2UMKKjJZ37t+tBYKIbtBm3fGRcN6vXfFlceTnjFz+9yqeAID0QZWJo7ahhcClbyKF+JlZjpTNn
	3VMGKtx+BcMoQk8uJKlyG8JSWu6RKabCFwrJJlK900Hz4M20pLKYU93HpOc52s3qNV+pYJEgfmY
	2NiXNM6WicfZh47cJ7eWhd9sBQP6AreExviarLdNA2A4zVlpi2ab361xaLREGVUqD4AN103WzmQ
	6kxlT/tLt465ZRWyPAvDLz5GDBuhovutxhLuvei5ppx0tK2ssaWBZmG2cE63yQ/YK0MjJcWHkFx
	SI//z+LBxEd2go6kePRgVRbagpOGg=
X-Received: by 2002:a05:7022:b98:b0:127:33e0:ea33 with SMTP id a92af1059eb24-12ab28e4da2mr3105409c88.22.1774691922629;
        Sat, 28 Mar 2026 02:58:42 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c79722e0sm1866524eec.31.2026.03.28.02.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:58:42 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Mime-Version: 1.0
Date: Sat, 28 Mar 2026 17:58:39 +0800
Message-Id: <DHEBS4TLJV5W.3AO0UY2JXWAFE@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>, "liyeshan"
 <yeshan.li@spacemit.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-3-ca94ca7bb595@linux.spacemit.com>
 <20260327-granite-giraffe-of-infinity-ff49a3@quoll>
In-Reply-To: <20260327-granite-giraffe-of-infinity-ff49a3@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_025843_926995_CD040DA7 
X-CRM114-Status: GOOD (  12.60  )
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

On Fri Mar 27, 2026 at 3:30 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:18PM +0800, Troy Mitchell wrote:
>> From: liyeshan <yeshan.li@spacemit.com>
>> 
>> Add device tree binding header for SpacemiT k3 DMA request numbers. This
>
> Why?
The DMA request mappings are hardware-hardwired and differ between the K1 and K3 SoCs.
Therefore, separate header files are required to define these unique constants for each
platform to ensure correct DMA channel allocation in the device tree.
>
>> defines the DMA request mapping for non-secure peripherals including UART,
>> I2C, SSP/SPI, CAN, and QSPI.
>> 
>> Signed-off-by: liyeshan <yeshan.li@spacemit.com>
>
> Name looks close to login name?
I will contact her and confirm.
>
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  include/dt-bindings/dma/k3-pdma.h | 83 +++++++++++++++++++++++++++++++++++++++
>
> I am already confused what is happening in this patchset - so which
> device are you adding? K1 or K3?
Aside from this K1-related patch, the rest of the series focuses on adding support for
the K3 SoC. I included the K1 header because I noticed it was missing in the upstream
tree while working on the K3 support.

It seems my attempt to 'clean up' K1 while adding K3 has caused unnecessary confusion.
Would you prefer me to remove the K1 patch from this series and submit it as a separate
patch?

                                    - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
