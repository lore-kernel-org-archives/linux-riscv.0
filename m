Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE73C5AD05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 23:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWxGMbmXDEodF1XvrlIqc8LnfZAbuHS7HAMdLe418XE=; b=q67UYWEK90KgeWpQK73Ay1zW0l
	iWwcdA1AbKcC5I2LTuM7g+21r/9lF9YZHu2b6+0NpAm0DntKG0wVOyWiihwWQTitKTHom9p30Syvr
	ql+NxqQusf84cYBQd4qOhjokCg8ctTCas4/mvnK9gn4XwpwDQLEw/OsQp754/hneFXKirdQ1uHLyw
	lZM7RWG94mepSVI0ttYCFQcr63nRBnJpznkh+U5ERVr9Yw8Qb2QBqSW2hVbRcdyvZK5wvi9HSUTAh
	EwBVKHU4mOrUdfUe1HtC5EW0ESrJXSlmzKOFPETKXzz2aacSn8vhA/2bcyhdy6xNGL11tDL4GEPfs
	j/0gRVZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUMB-00000008tEK-2hAn;
	Fri, 07 Aug 2026 23:52:07 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUM9-00000008tDl-21mT
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 23:52:06 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so30575a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 16:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786146724; x=1786751524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwprOu2PVhMpOrehyusrpzxDAhj1sLK/5uM1aU7zbd4=;
        b=gmUt/NovYUgi/HbvfN9N/BaaP3RbFfQ/oLY8AaqmbBn6XWXnBGGDxhlJlt4g7fhg2M
         YtoOokDh1JkIU9pOQ6tZNiUh7FNmN9f482DtZmPrq/WvcZ+Ki5tdpl7kVlNiZXfZkAl7
         W0UM+AFIUpZTO7ZvGcNufOe9eQctNXKzQDLt9s7cHQGecvbKDkdM+cNCyGc/gMF4fycV
         eQRqYonYZP2PWYwIQ56JC5ziRw+k9DNYfP9830mBU8SpM8Tm8Q1VIWTmrTs1ZtDuqyc9
         6Kl0ZBgDBvvpgPB4hG/zM+s6QQvOYef7fi5QujbbJU9DelVC+WAW86R1G/0iQb2DGyZR
         nscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786146724; x=1786751524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwprOu2PVhMpOrehyusrpzxDAhj1sLK/5uM1aU7zbd4=;
        b=ZvXU8yFc2o9L+PCyIButnPqGzIqUvxhG3FRktPqP3WShLmPc06OKsPN7cqh6wkrui0
         k0zUwukKoCa6Wr/KvxMl4DYsVh2eH+tXNxHe+LvNxzDRSWU/nsUljutCvfSWnLMrAwgb
         30i17cQzlu5PBwWOOEmx8i/rSGxGEeci4x1HdS8okz0nP74ondCoYkAoXr1LlQK26PWF
         T2ap/Rfq8mBmYVgIbekoluAn3lTtNg5quZf9jbZreEwsI7e0zvtcuKYkbbplbpJB16z6
         idUkrH6hTIEEUqyoDoIRvY6Y5icDz1uf2erBcz5HDJY83ndnwuGmNlLWDb9tVIdyY1Q9
         E0pw==
X-Forwarded-Encrypted: i=1; AHgh+RoOs2qvAML9Rp33XeIDg/4uBlxB5YcyOFn1Whbaqi2gDtxexecsUlAPUHeOrcO1rGhh+pz4gzc1E3i4oQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOqY4ktbzULOyV9W+LZ8211jF6eKP0iZzvbMigMON6s/35fXHg
	x1MouarBAatf5GLi+z9b5FoIxEbLYE80oDCBSIKQ3yPw+Kmge52eR5YZXzjHhA==
X-Gm-Gg: AR+sD12J0N+hpG5QMDjmzMiqFQSZlz0nJkOCAlk4MwqfRnby204YHN1t+ojRkXBQ6+L
	At6FePfn93u865m0IYVYBpArbJoK7140HwAdCE6IH4GjJ5FjUOyZ/xRSvcJEcKWq1jv7rw+4JNX
	jYhfVK95XshQoAmC8XCruCLta+gsk+64PgDEYTKjI3aO1CJowF38JA0ndy56o7o1YyPfBg7hH+j
	qCGKI0FUmcEdoT1A2o/q6tbgw2FfhaFjEfXnY/HCeIwboCaeYfy1bLPCsdJ8SYrftATbpbgDchk
	Irp9baApH55/JupoJM/u0httFn9Zpl+B+vDiyOcKaFX/mBXx8zUvHIkTw15jfm4z3UqjplkKyM3
	cdbAdCtI/c7y2inxB390/6evd4gzZ8zxnNUU0O6zkc11SE+uiOYt7oD3MH97myAu2zqNEbTPw28
	t+myA7hu3TYSXyEIwQvE5rsMU8emJd2f4ckQ==
X-Received: by 2002:a05:6a20:e290:b0:3c4:3112:33 with SMTP id adf61e73a8af0-3cb85de7c9bmr30699536637.6.1786146724017;
        Fri, 07 Aug 2026 16:52:04 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f198d44sm1318623a12.5.2026.08.07.16.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 16:52:03 -0700 (PDT)
Date: Fri, 7 Aug 2026 19:51:46 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Message-ID: <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
 <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_165205_518329_96B9C122 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Philipp,

On 2026-06-03 09:34, Philipp Zabel wrote:
>On Mi, 2026-06-03 at 06:26 -0400, Guodong Xu wrote:
>> Add a MAINTAINERS entry for the SpacemiT reset controller driver
>> (drivers/reset/spacemit/) and its reset-ID header. I intend to
>> maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
>> that reuse the common code.
>>
>> Link: https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
>> Acked-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>
>Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

Gentle ping. All tags on this one are collected:

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Alex Elder <elder@riscstar.com>

Could you take it through the reset tree when convenient?

Thanks,
Guodong

>regards
>Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
