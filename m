Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A6DC6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3689OT4IxGwAXwFQsnql8AomONXt8L1e9micykHUrQ=; b=UHHn5FkXAZQvdU
	tHDfzKRoAuIPyDMfLN9AigVSCkr3p9jc4o8CCahQn2VO89n6obOZMvBKdiwm7IQ+FzAovocsRbdlY
	S0fjeCdTQfVDo9M8A9xkvLkQ5sSaFtA2IRz+URqRnEvaOcWtrxgG5qFWx2LcfiVabyHotOD+8sgJT
	WNRblxV+UsSvKNjgL5QSHrblWuhlepNOX/dKxtPFVOgyym3CeAHCt2z1B40DFN1dkaDW97n8yuZ7F
	HLEnh/CUuiyEifpp9KMcsE9+fzqrLccb58ygQoLoaKHJ7H2z4FhVBY9SdLDnSUXdBYxBjkmZaXVaK
	mN6JRzKUKmKC2zZ33ZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhLq-004TUr-1R;
	Fri, 24 Mar 2023 13:21:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhLk-004TTW-0E
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 13:21:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E077AB822D8
	for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 13:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4D8C433D2
	for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 13:20:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UcaD22D1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1679664051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vh+MpBmDcTqJR8bkipH3xoGChH7Ag1enS9/gWacPJ1k=;
	b=UcaD22D1xyBs/YD56414QQHY+lLm6AyAbPmWOp9ozuvaMub/ujDD3ybm9egBVkT6AxHd9z
	JR3MalB7XqWRkhbz4dESz+TUYkG66za6zHKyTRyyacy0g2n65oxef0VLrI19ZcakJRI9m2
	dhX9A1j3QNmywzVgEpv6RbRg1oqwdko=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d4c5f058 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-riscv@lists.infradead.org>;
	Fri, 24 Mar 2023 13:20:50 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id s23so1375604uae.5
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 06:20:50 -0700 (PDT)
X-Gm-Message-State: AAQBX9d9ITpbQOIql7aM5sMwyNCBuZuJy3aqtqpTJjbIsh9FYkzKqiG0
	2bXHC/p8kswgpWM6KQmCUOnPFk0ERbiPhb2LkqQ=
X-Google-Smtp-Source: AKy350b1md9rigPAnpbhwmFCMweNJSrwFYI/hWGjwWc5fHcz5EcX48KZGgbC9py4QNmzptwva3DmNM5WCw5Be/H0FIM=
X-Received: by 2002:a1f:2997:0:b0:432:8b30:81b7 with SMTP id
 p145-20020a1f2997000000b004328b3081b7mr1695217vkp.2.1679664049753; Fri, 24
 Mar 2023 06:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230324100538.3514663-1-conor.dooley@microchip.com>
In-Reply-To: <20230324100538.3514663-1-conor.dooley@microchip.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Mar 2023 14:20:38 +0100
X-Gmail-Original-Message-ID: <CAHmME9p4LAY5XLLU+A6qtnHHDT_sZ4=D=VJCj6qs5_kmx61Tcg@mail.gmail.com>
Message-ID: <CAHmME9p4LAY5XLLU+A6qtnHHDT_sZ4=D=VJCj6qs5_kmx61Tcg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: Fixes for riscv_has_extension[un]likely()'s
 alternative dependency
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, conor@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_062056_520267_9FC698FD 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Seems like a good approach to me. I'm not a RISC-V maintainer or
reviewer, but in case it helps,

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
