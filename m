Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795F0C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty8fKAAvLisglhZuV8odsgLpdUjANzduu8qE60mIAck=; b=gA7EANkgvVwAd4
	SfXLeWRFzgbCOPyQQ33LbP5XtRV5fD7KTvhokrWViZHvj8fApWDEUzhujbiaGN2OQKl6PbDayXrSl
	fDjeU5aApawozbA/5YqFi3wOQ8H7lJg+Px8uYOcI2KlxAOqT+XLqNCpmAZtkjyluH+WsThD9DGk/j
	4269JMdbmw88ySjI4wq/d1Po0vYLjxT3S+JCiGBfedzA05iGhzqpnL8b8L7A2hZg2aej77G3P8vGN
	fHaFzmuQ3tBtGiiB6REPMOLc4YxK7opGQw/cigAyuJEoynRZcg263sI4n3Grdqoj4t6yEsF00VLqo
	D2aizFdNRn+MKUfAFVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2FE-000Y4K-HS; Thu, 09 Feb 2023 08:25:28 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2FB-000Y3N-4n
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 08:25:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id sa10so3994120ejc.9
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 00:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GU78AT4n7kDFxKHZzo9IaZ7F4p9Xxe8hUFOTKp9kpB4=;
        b=SVKBYou6NW91MaPHF7P3e/iytp+4yGy/jutT9kqWLTfx6GDqKMmJ+mfPrMg5/bo+6n
         1GJp2ZcdMK82kU8Gr9ecKePCU7y/F0waPDaBVOxMWfkhKjzHStzqhipbzD+Qid9Rs0F8
         PaezREMnQOX51UpRUW2JOTRBfemic5LKSqgbatYp9bi+9shpwJH9dlHYTHSDcLEYSvuX
         ShgdaCAUYxSDbwYzfBSEfykT8TUe2iyef/0fzE6twWfNvf9AWI59lo5W2547eEAEZ5Z3
         dNa3iU/DptSsdNC21ti8+RB4gQJ0yx/okunwL8D89H7T6t1WX3FU0KnxxXXoGRQjnUFO
         xgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU78AT4n7kDFxKHZzo9IaZ7F4p9Xxe8hUFOTKp9kpB4=;
        b=zbltfJTDObjlPdwzNU+9n2/EP98OHHf4684tU3AJVgWUC27nDt5maabxx/QJwGm0pD
         9gOyr8XaAyK3wrf4QJpR2OptTPM+FrFzS48h++MurHy3ApQcjYCCEec+ojYjZdEK1P3D
         WkBr1LaR9FegLBdLd8z3ZtR9Ei3JoY2Blam3gUwgVWYr8XmjsnSCnZFbRPu9485Qb34E
         R424recKnMVkpVZh8T2RCwicFj1R3GeExMeayEi+GxoDL42377ohpfZ13kehNxQCw0OX
         f0VgnJGc4TLKFsCYmkilfWHR9SrCroBBEw6jKap4bK9/zK6Ikb/ORc+TkN3phJR/7Su5
         s8xg==
X-Gm-Message-State: AO0yUKWSmXkY84Uvkf3FkvhvX6edvsKzFMwIw+AhWE0isCbjdPsfmTXp
	bGbZTw4zf2PjkXIxkyQdQk7OPA==
X-Google-Smtp-Source: AK7set9aY/xPOLlwLfYkbN9QbBoTYGoYABPbfJLyKcL8lnHclFz8WmS/2yGuLyJwlVX6bytWL0Pgbg==
X-Received: by 2002:a17:907:8b94:b0:87b:d402:95ac with SMTP id tb20-20020a1709078b9400b0087bd40295acmr7151059ejc.27.1675931122287;
        Thu, 09 Feb 2023 00:25:22 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906c08d00b00878003adeeesm576373ejz.23.2023.02.09.00.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 00:25:21 -0800 (PST)
Date: Thu, 9 Feb 2023 09:25:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@rivosinc.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/2] RISC-V: fix ordering of Zbb extension
Message-ID: <20230209082520.solukez3jrshv3qo@orel>
References: <20230208225328.1636017-1-heiko@sntech.de>
 <20230208225328.1636017-2-heiko@sntech.de>
 <C32D5495-F772-4887-9CAD-66206ECCFC3F@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C32D5495-F772-4887-9CAD-66206ECCFC3F@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_002525_198524_F285359E 
X-CRM114-Status: UNSURE (   9.25  )
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

On Wed, Feb 08, 2023 at 11:20:10PM +0000, Conor Dooley wrote:
> Hey Heiko,
> 
> On 8 February 2023 22:53:27 GMT, Heiko Stuebner <heiko@sntech.de> wrote:
> >From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >
> >As Andrew reported,
> >    Zb* comes after Zi* according 27.11 "Subset Naming Convention"
> >so fix the ordering accordingly.
> >
> >Reported-by: Andrew Jones <ajones@ventanamicro.com>
> >Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> The whole "getting it wrong immediately after fixing it up" ;)

Hi Conor,

Do you know any patchwork savvy people that could whip up a check
for this array? :-)

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
