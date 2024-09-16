Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3A4C3ABCB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 22:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8QAsDdGFtoVsikQumWMgKHgWhBTktHeYTvxz2PyT4o=; b=np2NAjKmIkLbOl
	wQzJUBGhbk0kebEHYdzEPVouGO6OdxqTHkqGkk89HWeZERHMDRVspsepG4KxX6msZrLzK3WxR+GsW
	4vvy3EdvugZbWG0R/Dr/I3EYnxWO6u486NR/oY5ll1gUP1dlbZDZQoXhc3HPUUgxDS21gL/yQyO21
	DAS2Il6T1lB/3M1gVg+meOt4X0evKdQWBqKCJdjUVwdHFeWHDlUBTvEwdec71UB9TznJAhXoqdzAS
	WglLYABDB+SzscYTo+QV7y+WJnCkSvuj7rhDM+GLfRayZoATISrntra2v0GLUI/RRtW/oZ0vpvasT
	DVDYuMUH4InXBvVIZ9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqKC6-00000004zz0-3P1u;
	Mon, 16 Sep 2024 22:27:42 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqKC3-00000004zyG-0ERh
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 22:27:40 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7db299608e7so2330374a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 15:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726525658; x=1727130458; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p871//Fs+/qO7+7cwFPvh1c0mSeuK8ASkkcU0dmqUPs=;
        b=XrSlVGLud/MiF/wWcZsVNODSw6xHKY0akYLwhu08V15DqTKHbczhmxf6/ujc4JjkGm
         NeCh7zb5ThN/4W9ZWbGy+Yh24RE6KCa3T2jqQGZhRIGyNI9CVaFYmxcabKrEzNhlIyKp
         nMiGJ1WmEFipE9ExKixzhBqID45zAd0xNUekr6+BYaLZybSszvboV/4lBfpMdoZDN32n
         eajOV08HSd8yyjomuExb3mkqLrER5KtTwz84Yq2k2Ls1po7ORb2e2Ik8BJIvP1dcQGa3
         a3VBKv3+ntxLxZndwTr5Fm58yprLeZla6jBWQ26HBTmzfX43WmFzzZlRScp5qbhfJH98
         YCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726525658; x=1727130458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p871//Fs+/qO7+7cwFPvh1c0mSeuK8ASkkcU0dmqUPs=;
        b=FjBNpxss+TQHm0Epbp6ldIcHERAMMidNFw9kryVjwsn+YScGsHQnshMhEtd9qlEuoP
         6dHFeDPQ8IUdQSGJrhri3+TqPipEi7z/Q3fzwh/REYDDGVCou3PwcuM/DzJPx9/z3Aam
         M9GIyQqMerQkr50UcTqXyVwdMW8KrJTMIemVl+E5iejuB1PqOif4XP7HG15BrPjluJ3k
         LXbDFyLt7gdBSSfOuoYOVzgNwwGIffqnl2gee88wUqmlE1VC7kDMkHYq6lvpP8T+SyEl
         bEwy5sLnnvbuDZAuADObUuCLX9yR3R62afUd2+Jnnp7eQieIyF2KDwtxOL5iCzwVCwW4
         v83A==
X-Gm-Message-State: AOJu0YwF/gxEHjzKWuc2vIRZwKzMEZBZoHM6Dp3qu7A18G9EqICsGjnN
	siOdA39zyiLeecfd58e+MgmyGGmR5xSL3GizJWK9ZgMOChYbbI+hskZ8caF5
X-Google-Smtp-Source: AGHT+IHOIOa4uoJrvmJHVtqFy1kUCeyLXVe0HcxyEv6ClDTP9rAgSTpgUwY80v38ijtmEJ/ROq/SPg==
X-Received: by 2002:a17:90b:2344:b0:2d8:816a:69c5 with SMTP id 98e67ed59e1d1-2dbb9e1ed42mr16825361a91.23.1726525656975;
        Mon, 16 Sep 2024 15:27:36 -0700 (PDT)
Received: from [0.0.0.0] (ec2-54-193-105-225.us-west-1.compute.amazonaws.com. [54.193.105.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9caafc4sm8017188a91.30.2024.09.16.15.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 15:27:36 -0700 (PDT)
Message-ID: <fe87c66d-e5f6-46bd-828a-6fac2b0aa0ac@gmail.com>
Date: Mon, 16 Sep 2024 15:28:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterlin@andestech.com, dminus@andestech.com, conor.dooley@microchip.com,
 conor+dt@kernel.org, ycliang@andestech.com, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_152739_131274_9E57C013 
X-CRM114-Status: GOOD (  12.77  )
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

Hi Valentina,

On 9/12/24 10:00, Valentina Fernandez wrote:
> Additional details on the Microchip vendor extension and the IPC
> function IDs described in the driver can be found in the following
> documentation:
> 
> https://github.com/linux4microchip/microchip-sbi-ecall-extension
> 
> The IPC remoteproc platform driver allows for starting and stopping
> firmware on the remote cluster(s) and facilitates RPMsg communication.
> The remoteproc attach/detach operations are also supported for use cases
> where the firmware is loaded by the Hart Software Services
> (zero-stage bootloader) before Linux boots.

Would you mind help clarifying the need for SBI_EXT_RPROC_STATE/STOP/...?
If I'm not mistaken, the HW you are targeting is described in
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU64/ProductDocuments/SupportingCollateral/Asymmetric_Multi-Processing_on_PIC64GX_White_Paper.pdf
(typo in the page 4, U51 -> E51)
In SBI, do you put hart1-3 and hart4 into 2 separate domains? If not,
I don't see why you can't just use HSM extension from SBI to kick rproc.
Also, how stable is this microchip-sbi-ecall-extension? Is it subject
to changes down the road? I don't see a probe() like SBI function, so
the kernel kind of assume it can call those microchip extensions without
causing unintended effects. This means those extension FIDs must be
stable and can no longer change once this code is in. Perhaps checking-in
the microchip SBI extensions to major SBI implementations such as openSBI
first would be better?

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
