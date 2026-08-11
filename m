Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6579DC5CFCF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsKHyPiyFLW7FfFUok4fYicYhiUB6SoxpzY+Fxey8l4=; b=bWBj7V3NZQcejd
	krcZPKfRZVoPqynB/738Ua5MuO9tbHHkVBqtmhGT5Lz2AMcRBdwpldWvmZp/pUO+saj1lZr92oAMT
	cZLnDS7TY+vUy3uAdQF5VtWE5pk4wZZGCoQCRxS7neWhUjdtVIaVyD8JpXHIhEqKy4ftSpW7afQKv
	/NM9QWISW3RxRKCOdhwxhBcUek5UNe7xeW0dhU7HFUlxkXnXOAbUQZmZJJeb5Fr7mXzArbIymm1Az
	nWk8VY5TFs4ucs8BOWRNQtEKu3cG1L++Th0Q3q4oxiL4eDmpFa7xA8PZtpKzqPM6MRBh0v2s4fVZD
	a1WWf/76yRcQFqpIj30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtj0N-0000000DlxA-3wfD;
	Tue, 11 Aug 2026 09:42:43 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtj0L-0000000DlwP-3Lwp
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 09:42:42 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8453427d3f4so2910716b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 02:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786441361; x=1787046161; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwCGNXF+KD6Hu7nTlnEWpPtpXjP+niM518rfogM0Juw=;
        b=aDxc/zFBanaSJFw3k7SzL1W/Y+2GR6pvs6OUUpjt5iKtnvJSanuPUUTk6/i9W9p166
         nY9ZBrbK8f/KDE5PPeriEsmioSIaToBiEfvQwBdt0rRc912U9G1NKzhewo//g8RzO/Ky
         yF+1lkXJD/xd4YvDThQcgahXvmZeuG2qOYZD2JyaQHMX2jQXq29wshtn8BuJTm63qNg0
         DvAwcunpWXU7ABqfmJlvGxkXaDqVnIUuVJPE7GcarkOyiNmGuBz6LCWvdPYyLBxbQUJA
         AaiWAIHP/KiZNng4gLIbPCoTJ6yeOSpQfLBPYLN2zc+kvXV8pQgnfW2neaBWx5tgR+oV
         X7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441361; x=1787046161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwCGNXF+KD6Hu7nTlnEWpPtpXjP+niM518rfogM0Juw=;
        b=pYfe5Rw5vEKtW3nzbW/+/uQ9mFIb3YBd5pLP0+jXYe0FmraVU0K2RJF6YX617QblT+
         M1q3g/avBCfDith/h8IoLqOVuTu98eF7Igm4yYH2EB64/HfHppqU5COiHY33yMeHajzr
         Btl5wsByCEfh7Gt6doX7rkWAhYRI4RgZBtOXrYx2Baw3E1jpBrd7Y9KkQ2W/1AKgvoTK
         0BRyZK79RrxArgf6gTQjQW/bGPTzfbzpTIfUcTc3swd+dWgNUpMSGbsEr0eZrrDUd8Un
         0jptUMJbloS8TIJRuZciL7D8N/S6I0nD7kQYaBUnRtEsyaMbse6baum3W4w21JCW2W/Y
         WYnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/Gh2r6mC/m+/KJ64uo6wEPz6kqThxc6sQS6kCnxuGYc5UdoI/DN0KOwHQ6rEmZK34gJvWq57sWyzgeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6k3bpeRm5mD15fZe6lDyJlBUXvte5wIhotcSOULp3B6Sb/Qik
	VeGgnPJXRyLroICGcgkSs8wmCdxv3FJnPor+2ioqdXLSswWAcpDVY1xPjjsBHvekQOs=
X-Gm-Gg: AR+sD137W7M0IDB6jBVBAo4fqVPczYbWjxFPn8X1h52qySPQxQnDDYGN8WGfPTKKAhw
	sWRVwLEDmrbBQpEd/g36h9dVbO91lgqdbv/Ozxv0rRZrAMXwFM1HMerwoszaIpkiTt4kUe9pfdg
	JMNtNa5G5TxrsbLfJGu5Zx1zlYJKlPlfcRHU3eByW/zBVjNrspeSzBgY2ARI+X7+mEb9+RFMgFO
	muiG29cvkKy5PmjnTjCvEGGGJ/C1eqmoyR8ir1wpSpW7brsrgNnf0cqbjkzT3El3EtQGUKtdMle
	b9KZMZUpjQKCSYoQxlKerDYSZlcRiYVzGiRYUU5uEHmRggHX3lrYb+8qw8P7hPV7A8FK8VnRduh
	5g/70eeMXsy9+HG6pFZQSTthT/5B/pGWT5PoK9e6ANb1HTqcGPdJ+qZYUi5nr3F5qeEHPTP5gWZ
	b4Vj3s7A3eN1t/SVDqPGgMGtcqiXdY8F827uIhbAC17UgGEOXscblOWQ+1ZFI=
X-Received: by 2002:a05:6a00:4b15:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-84fa8694cb3mr1704052b3a.11.1786441360746;
        Tue, 11 Aug 2026 02:42:40 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa91cdd4fsm428022b3a.23.2026.08.11.02.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:42:40 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:42:29 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <anruhbTLRRMVa4Ia@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
 <20260730-towering-modest-horse-ccbdcc@quoll>
 <20019441-9ebe-4a13-9bb5-fe1beea386ae@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20019441-9ebe-4a13-9bb5-fe1beea386ae@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_024241_859353_36625034 
X-CRM114-Status: GOOD (  11.95  )
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

On Thu, Jul 30, 2026 at 09:37:11AM +0200, Krzysztof Kozlowski wrote:
> On 30/07/2026 09:35, Krzysztof Kozlowski wrote:
> >> +allOf:
> >> +  - $ref: /schemas/access-controllers/access-controllers.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - const: qemu,wgchecker2
> >> +          - const: sifive,wgchecker2
> >> +      - const: sifive,wgchecker2
> > 
> > You need soc specific compatibles.
> > 
> > I do not believe the two review tags did any actual real review. They
> > would tell you to read writing bindings document, wouldn't they?
> 
> 
> And you WERE TOLD this already at v1 - missing device specific compatibles.
> 
> Drop all review tags here, they did not happen.

Understood.

Best regards,
Peter Lin

> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
