Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050C4F532E9
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 08:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAJQxpuYbGQTD3+RDwF5uGfc2sNAPs9OD6CRlQnnNUQ=; b=Yrrmy2cRAhaMYp
	uQP1Je/bAOhc2M4N4vQ+fkNh0dbPGBKcg4WyssvY+EvRPjN+J5F2ddJ1i72/v15q7nKqp8pI6fvId
	5nmk57nIVwf5CROmRlD9uPeW4jlc7bBX9Wt988SH1yJXgpd3TspETrRobZYxefsq2SKSN7B9guEHh
	toiUdkAP4AbLQpIyuyHVyhXaj/nQs9uxRm43CZdOTaHzaTuukQuolrxMvr4XKQND4v+0+zouBcQLS
	eyQsjggRpdWzvUjXDcQQ0PPW0x75xSy23vWUSydJ9EuD/1yT6gnnsevh0JUWITEohDeu/rDRsr85I
	LgVVNPiSdZIC7KNdubvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wik-00000000wof-16kA;
	Tue, 24 Mar 2026 08:02:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wih-00000000wne-1GoY
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 08:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774339354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZkji+aeo/J3L7vBsxBs/MQaHOamVQrNiki5qdjf+wY=;
	b=fT7zaNj1M0Od/gk3bNPpl3Vbhm3G2O1ANXoxrFvaxvUQ8KGR/E1A+ONp+P0FQcjbBMQSyv
	g8qh3qxvR5eTSfIy3PdBP/oOeHbhEIljYYAJtBzjlC4JkPNXxOLWfNjld5P6Es92LV0F29
	wg9Y94ByhtFHchL9mlknG4nJGHBZWao=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-JTHDNdYAMvKn2rW3zzFftA-1; Tue, 24 Mar 2026 04:02:33 -0400
X-MC-Unique: JTHDNdYAMvKn2rW3zzFftA-1
X-Mimecast-MFC-AGG-ID: JTHDNdYAMvKn2rW3zzFftA_1774339352
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-486fa07f2bbso20508775e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 01:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339352; x=1774944152;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZkji+aeo/J3L7vBsxBs/MQaHOamVQrNiki5qdjf+wY=;
        b=mg55XLRLkaTLG3oGabp4o8OOHGfmAlX3HD/Fg26Lz5Iih2QrsKy+CKNvU9YLAvkxtd
         imJ8av0xwPdiqLDajGQ4R27EnxSopmm76tZW0wqqcH4cmPz+RiBKK+xYBuiDE+20vCLw
         yzAvipcxHUCkNMGHbj667XnnecGOD5uQrqnBWc9vGM+btZjxkEuwliFEvP4ZuYcOeQnN
         ChmXlSUi7EmkeI+V39CDZyKFREA7oHy5x9oPZXWFki9Gv72objxxRhlEBCRCj1IixIlN
         rl8srgqjHhaVLE8d52p2barmfYI7UepJAdFaFyydXmjAt2t3VJVXRnP6XimWgz0LpK82
         gbyg==
X-Forwarded-Encrypted: i=1; AJvYcCWrPCNoG89rTTcRZmzHxy1xo3xkkt/LtRoR5UuOmI+fRmlk0ijAah7gTxhrtWw2kZZKCN4TFJALmcz/mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMLPxILrwhdjCcpOdynrbuUTFsicJFejzR+411todIRiHVRs2s
	GfApzaNGhObiHhfJD/aAwqq4SER7VZE5qOljH61ww38LC6UdxcAoKtfuQsdYXsxHdY6RuQHt5Nn
	bKdRvnzvVRppLFhHdatpDM3hsWeVdIwnL5CWlPNWL/5raXrCwlhzWbyxDUqqzKUg5uivqLQ==
X-Gm-Gg: ATEYQzwK0G7ua6203eF35ytW2SQjPxX5PDFrq7ZofLO5iwUN3YTfYnKau/sO9ZRIfvw
	vF0B60qrGOOxMbUWExToXXfyKr1lLC6Cv8HCJKKBFmkpoZWQuVenQBGaYAu6EtTkfU717l+P5fl
	mbgPEsmRcJa5cqdn8hUdaBBgm7d3YDTN1W6wGnFJb5D4XPONM92k6kG8TRPSbQb3xq7kJCP2nxt
	f3rpbSENkyCrks6DOyl7ry5ahO+aeLl9mTHBNBmerfwN8rr9vlKhOl6UMUYFaSsccc+dYNvwx9n
	PIgBqklZNF4E9AdAnm0yuDdG9xgNbS9A8OWMcDik35BBLXxPIj+qzKBgrweNTSACJ3NlFmZ0xG+
	2r3Nt4A0jdjOLqEqiy9Qc34NNAcUeYPAXGJddYRpYoTaBvJjkTftW0Dx5iyWBEcHBYaaMbEG4bw
	wO1CHF
X-Received: by 2002:a05:600c:8b32:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-486fedbad16mr202978755e9.12.1774339350318;
        Tue, 24 Mar 2026 01:02:30 -0700 (PDT)
X-Received: by 2002:a05:600c:8b32:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-486fedbad16mr202978115e9.12.1774339349760;
        Tue, 24 Mar 2026 01:02:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm36915974f8f.17.2026.03.24.01.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:02:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-7-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-7-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 09:02:28 +0100
Message-ID: <87341p8xkb.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jqDwRHMdr39F36S_ncmbL7w8BNHY5gtxaOBF4Z2XaxU_1774339352
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_010235_427686_2275C61F 
X-CRM114-Status: UNSURE (   6.93  )
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

Aurelien Jarno <aurelien@aurel32.net> writes:

> Enable the two PCIe controller along with and their associated PHY. They
> are routed to the M.2 M-key connector and to the the PCIe x8 slot.
>
> Add an always-on regulator sourcing 3.3V from the DC-IN input, to power
> the PCIe ports.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
