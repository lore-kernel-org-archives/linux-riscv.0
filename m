Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F97FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 04:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uy/PSXSL6essq2/snUk18kEKZXT+S8YINlt/rukd7gg=; b=cghXlTtCRN5JqU
	/2DjTVF1yx5/ZlhrEp7iGsMl0/nWQFAJtlQzKM8v4ZXmP0sIslX4Fm+gMYkvxojokXiDi/aia6p+q
	tVjeRx8WtY0dqvCf4hr7GNVr5Xf5S6pLGvOlIj+iIX3ZkjoCVokKXCV+IAqhKZFvH/xsoNNsW+YO7
	t5PVPqz02Wb1lIQM74pwZ6SnHCP3WWx8Yj8eUTLCqSKi6niFqKc2g6UPbvu4ggv5wyx9D4dR90q3i
	Id8MNnjOQO1ao4zXvtL/GpewsGY0S95N9VOn5JbO2H+1TQo17LLkOobPe5Pxc5akYy78HwE7b5QLN
	LnhWnjnX+gEfjwclvoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHeEe-00GBN5-49; Wed, 09 Feb 2022 04:05:40 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHeEc-00GBMc-71
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 04:05:39 +0000
Received: by mail-oo1-f50.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso1125646oon.5
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 20:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6YJEp1y8iCJ2S4WFtcvM5uy6fuG8c3Ku48eFSnwsHWA=;
 b=awJ5T7dW7Vtsq3U+IpYxSGUcKIijXwFVmVbbSyf4LsyYP3LslDrSW1j/J6hkL0U1w3
 t23QRlZYhevyAnadXqO5CpkXo43dLarlwHAfv5IYXO7MPLP/YLo4l/B4qJJ8Wj/w2Etm
 jAtf9ugzBz2QrZwFytOUHBWE7TUwXbKg0Y/iha4Y5DpPHE1gw6pAHqWCQ+6WcsLak3/H
 E1XONVnHy4V1UDZBYzSak5NF0bTIfIDjya2lL8bg31vOHCzhN1CYLGyuUJ1UrGiySxku
 sndeCM9NsIqKbUuU7j3Fky0QFdy8kh+nWvC0R5vXjDZmSQvNCdYhnYIqHNfE60REid8k
 b2EA==
X-Gm-Message-State: AOAM530qUunH08HqRjkYAZwYINRkgtWE2Q1dW502MswA/HxibN4TSzJa
 OcY479SxREAC0bWRnv6Y1EypjNOoLg==
X-Google-Smtp-Source: ABdhPJxtfxlnaGd0pCly9Xm4mmWh9iuw4ZqsWb6mTNbxfLnoSwVVtfymonRJeYWvvV7WHMD1SK6z/A==
X-Received: by 2002:a05:6870:5311:: with SMTP id
 j17mr158071oan.143.1644379537255; 
 Tue, 08 Feb 2022 20:05:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v26sm6086382ooq.20.2022.02.08.20.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 20:05:36 -0800 (PST)
Received: (nullmailer pid 3633873 invoked by uid 1000);
 Wed, 09 Feb 2022 04:05:35 -0000
Date: Tue, 8 Feb 2022 22:05:35 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@nucleisys.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH 04/12] dt-bindings: timer: add compatible for Nuclei
 UX600 CLINT-compat timer
Message-ID: <YgM9j99CBBaB+CRT@robh.at.kernel.org>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
 <20220127151647.2375449-5-icenowy@nucleisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127151647.2375449-5-icenowy@nucleisys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_200538_280694_10744614 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, 27 Jan 2022 23:16:39 +0800, Icenowy Zheng wrote:
> Nuclei UX600's timer has a part which is compatible with CLINT.
> 
> Add a DT compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
