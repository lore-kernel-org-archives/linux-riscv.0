Return-Path: <SRS0=cAep=XA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4C1C3A5A5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 08:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E097221743
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 08:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aJiVjLeq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Hm7d0pRG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E097221743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mrGbDmuMdUaGKsG3WY12yOC1AgOKoSfLD/NdT+Jv/8=; b=aJiVjLeqNJym1Y
	HoVaxVmH+TCWnh+h/o0D9E4BkaLulxAaM3eKdZt2H+ezEvDy4T6cGlYOdZLHEz1QsjpFWAe+UG08k
	LswhZ9J1z6i/21yN0s8VnpCFQw0s89xm2flMLqXWDmfSmjOkpvcMhy2TjsXn2mjbFG9ReWEsuEihi
	BlMhd2T/OyrBdScTDb44SuGTh5tRAV+YnDlAJqAmWirigTYDIu1ZhQSTeOcVzp8jZSwMXldCxv4Yx
	RFCTCBjtr0pLwsIBPmB7AQOo7BlGrOQEHlMzeE8XjXkbKiNu6hxZ+dn/wPnPCdy3Xo6qolbdizfhb
	mz38gpoZ3wwMByV5yBAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5nTJ-0007Dh-Ev; Thu, 05 Sep 2019 08:50:29 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5nTH-0007Ck-4L
 for linux-riscv@lists.infradead.org; Thu, 05 Sep 2019 08:50:28 +0000
Received: by mail-io1-xd41.google.com with SMTP id s21so3069629ioa.1
 for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2019 01:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=5mgDQuc/xe+2hAcaAh/QAJnxEKTuP6eOhVW+pkKT0/w=;
 b=Hm7d0pRGh8oXSI0va5tgE0x4lwskTVj7C/+k4MnnN8oStWlqacA+wJxpKS6YOfAl9E
 n6zzhaM99OfeS2mZrhaXHN1b+fkZzKedWl3lvnXvR0hQc81x+D91yUZSHqA/Pn5SnT1w
 ud1nnrfUszlZTg+k6MCEsIQJs0ZRsdJ/yhXZtjcRTmyQPNDxSDUxP9zScIsdVvX30FWT
 ks+ICB/adSI3NQsBUSYdvSUNwXl167a7wt3B3EA/ueKm7ZcL1xrAsoB17dQJnAmVqk8F
 NVtPCyRJ33TJVmXUOaGNLK9u0rpYGLZy4cCky8lhQXWLtXe5CVr8SWZccqQOHNnWq+ZR
 Fxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=5mgDQuc/xe+2hAcaAh/QAJnxEKTuP6eOhVW+pkKT0/w=;
 b=Lr4ObDcYn+hzzMAMj5QeTvDGEqaygjhn2fyhsNgA1elJKLw3AaCfCVcA79ul/32G4W
 6d8BsGuGS43JvCy41H4xMrX8q2ti4IP2S07xCP9vgFVR0f+KBdi2GA5P7AgWVoMEeA3+
 cY0o1dReKuTCwnUyZ9M1tbj2z5W4YOJq9bl1BYZLDVRV9d23q1nvFxiCnAUy58QFFXZT
 3wCHxDz01yNQo8kU76RccXoQb+x+Xs3cAyhK9HZdTttmIV7v95zCqnRIoN372Djc9N2D
 mfOCvoMLprZ/Eo+YMS7/HNFo7E0rr/07Pq4uuxrG9uxqv2cE709IzBpLj/ALQmNsCXts
 QX0A==
X-Gm-Message-State: APjAAAV1IQE5H+i5iw1sJnKC8cKcBB6B+njmUjHG4kuJXxtJGDU/pSti
 +eUEUS34DRjFY5nx539n7RE/Vg==
X-Google-Smtp-Source: APXvYqx5NREdggbbp7h/XpuL79xJzdlAiUap4PxL6rZEVVZtlKNRoUqzvI5s0wDQ94xNjHFTtHG9dQ==
X-Received: by 2002:a02:608:: with SMTP id 8mr2902283jav.88.1567673426202;
 Thu, 05 Sep 2019 01:50:26 -0700 (PDT)
Received: from localhost ([2601:8c4:0:9294:cb6f:4cf:b239:2fee])
 by smtp.gmail.com with ESMTPSA id v3sm1234072iol.3.2019.09.05.01.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 01:50:25 -0700 (PDT)
Date: Thu, 5 Sep 2019 01:50:24 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/6] riscv: cleanup riscv_cpuid_to_hartid_mask
In-Reply-To: <20190821145837.3686-5-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1909050150070.27305@viisi.sifive.com>
References: <20190821145837.3686-1-hch@lst.de>
 <20190821145837.3686-5-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_015027_179779_D3EABD44 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 21 Aug 2019, Christoph Hellwig wrote:

> Move the initial clearing of the mask from the callers to
> riscv_cpuid_to_hartid_mask, and remove the unused !CONFIG_SMP stub.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks, queued for v5.4-rc1 with Atish's Reviewed-by:.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
