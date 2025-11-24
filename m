Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9C9CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iudgFSS0uGEOl5Qk4ZUrE/va2YiCqUwfoteId6EmYDc=; b=TbBMD7Ff4xkXB4
	bM9iN5KUbtOFixs51hRbcYcfrwFPTO4JKY0Db03GgGojOqGKLU2BptOnqJFUt6zFLCKdjK1L2LOCq
	vxhwjuV8htFkLMC9rcfRfCkO40g6FcNSacG4/e/5QRpTRhce7jrb7hvJhcv0PmKn6dgqTVgMuo1ZP
	ms14Ns1vZs7Y4pyCdNLHCJ4PflLqcdUpUTHdIjMSVUsVeYbOy1h0zNVmrbONE6BNSkh0GgG9+0sWo
	6TbVxhOwbDMg1aaPQloyHuFnlYz0YLRt9LG1zlWGwv9Lxsd8YSOjGwBGuh0e7ZDpY/mIVS7YbUUIM
	tbSu7zjAJBWqb3R2EcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVXZ-0000000Bdtg-2f8v;
	Mon, 24 Nov 2025 12:19:33 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVXV-0000000Bdt9-3eOc
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 12:19:32 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 497433F59A
	for <linux-riscv@lists.infradead.org>; Mon, 24 Nov 2025 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763986763;
	bh=bCRLZifp4rTECd0rvH9pvqGqlkqO8pNJxlD0CHTlV8k=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Sh+WcqQScQeURg2UlZg13QMR80LgU3P/cL/JkuPIYiwC6ypeK6kVJfPSUVDtp/UZ9
	 hdaqYnH8fBfsQ+dCy1rSs1iJrzut/9B5pZY4hNTIAUqxwpFFx2V4WeFPPDcpBS84Vr
	 gyYrYiPXSXg4/t9yvIGctphffvw8cr7bsnhJPVcVAQv8YDB9q80iz5K/WD4zV8XGPa
	 qzqYsuxhFcr2QYHupOOGegGqswF65NWCUsyE2W3BU+bfoS0YYPtuRNJ6jBsuPQu1+t
	 1vs2f92gQkNtIDDm70nx/SdhXCY7cOJ1ZW9yol2RCCyeZhAEhN1UGEdIXAvd/bV7aT
	 Ahjm6ibQvcvOqG1D/ZAx1U0gduOa5ds0z5n+Gxig/ZVmS4hpRQt8IBA63YSfuJAJl4
	 X9l1Y0q0S+bz848CFOvRyoq0KJxJkw/Fo46DFtg+w75jVA1xQSQV41vMqJmybIXh/C
	 MErtKJAU1utFo2A0lqicfkPrP51VS2e6qoBDDjv3Oijgb2r6glx5ooUrDC72Nos6RY
	 rh54e5rxjBRcMhIh/5lEUZoAxEq9YpyyBkORVWZcXPt7CQ84uy7RjGBNNzCNCN61Xw
	 SFtQ+PcJRi6pc06Vhvk+DVG/eD9wyCJU3RGSQa/ajVJvcS+8aKJVOL+wSN29/CP4+U
	 Ew45qWa3zvrynpXgkPVURi4Q=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b736eca894fso328068866b.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Nov 2025 04:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763986761; x=1764591561;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCRLZifp4rTECd0rvH9pvqGqlkqO8pNJxlD0CHTlV8k=;
        b=RorpLQXmvTcy7OUAQnKtDCyjgRWPu6DLPPsy5+R9T45JqCO9cssyk2XCcUu47pLD4A
         FzdBf/74hrVF5jR8VGotNWqyvn4OgFIRgeDWor9IfsX2y65RIqP9cnI8D7GB69Uq70Q+
         /25ga2I+mCptE3HTh0Y1BXQdDgzGZxFHM8aC4/YjpIWOOAqYzMnS4ml2tGcjjs6shJiC
         0PSKyoILP2y7UBddhyFCHV442hvpeo7/mCBiiKsHTT/YclyzW3UKifls+78qlhdTwZp1
         1hk3GQ3goFpskPFam5yPYEI6uTPKZrDJ9KWvxmlWz2JRqAU8DoX5KY0pngymBr7s33bQ
         TDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3vy97W6O5caA9q8AQWZ6QgMZuiUGACwkMqWW99I96RQujfiUQ6ZqpdqQvoOM2V672buCqYAm4lI1+Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/AJRZ/Sn0JVR1NtPeKT39jGdKnnGT/OHpXoVvEpn9/VekqCah
	w8jRrU9po83j9PfyxUzY5jLClBK/SvelcM/zVUYGCeFU/vG8PR30LFQJoxFs6lj4XNATc1lGBlg
	ULCggBPXJrz6NSnLpFRvg97VIOdqbbY1vLlFQcB29KBDj12UNpWj/KIT/LxoIRihRsbENdZCE0V
	ZZGFaElG8LG7gq8vwtiYUHPKbMWYYNs027qRmHM2FTHOUlHDpeLN9CjJpOLaLE1yBSgEqg
X-Gm-Gg: ASbGncsWcCD5bchvpuJoTFjVGqqpgivjo7YPEcwAX4O+AGshun2ZyoPLYbRz6wZx5N7
	wXCEnaKyIAtx67q8O7oBYLXYEg6M7a9QsRqZGb/zm+AEsxaM9k52cWlxrCo+XnOPGgkI3aF6Gbh
	nhoHc715MvHEG1qrNdL96CI1+N3IlS01q8H2HbGa/sVTrQdhMfRIjzNMpRu5ikYM8F
X-Received: by 2002:a17:907:6eaa:b0:b72:e158:8234 with SMTP id a640c23a62f3a-b7671558169mr1195243166b.3.1763986761149;
        Mon, 24 Nov 2025 04:19:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWpvA5AZsU9hd0FhbQhD6jmXvVQ3XWcRt42zqy7pGEVPOKqtKoLyqFA+m4JfhLtz3/uVzmsQLU/40dOSJ6M7s=
X-Received: by 2002:a17:907:6eaa:b0:b72:e158:8234 with SMTP id
 a640c23a62f3a-b7671558169mr1195240566b.3.1763986760732; Mon, 24 Nov 2025
 04:19:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Nov 2025 04:19:19 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Nov 2025 04:19:19 -0800
MIME-Version: 1.0
In-Reply-To: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
References: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Mon, 24 Nov 2025 04:19:19 -0800
X-Gm-Features: AWmQ_bmtNan9T1eukBSF652dUFMoGNOaNEsLx1nZSY1JC3kM7j9cXMs0IKvAZbQ
Message-ID: <CAJM55Z8q6YvVPHDmZtATW0eB=uuWz8=kiR0CDS6RJSM8Qz79Sg@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] MAINTAINERS: add Conor to StarFive entry
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041930_299059_C8B60F3A 
X-CRM114-Status: UNSURE (   6.90  )
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

Quoting Conor Dooley (2025-11-23 19:53:40)
> From: Conor Dooley <conor.dooley@microchip.com>
>
> I apply the patches for StarFive devicetrees, add me to the entry along
> with my tree location etc. This is not a functional change, as this info
> was in the "RISC-V MISC" entry but I'd rather not have the duplication
> of entries covering the StarFive directory.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for updating this to match the actual workflow.

Acked-by: Emil Renner Berthing <kernel@esmil.dk>

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
