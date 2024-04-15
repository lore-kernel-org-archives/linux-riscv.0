Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBD5C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2t+k2WLzfetiTvUMLvHwOA4/ojV4ZNhYX+50NWhihvk=; b=dNfsHdVqkfFxHeR+dYAWzQmjqn
	XpiflEP097pn2k1ETC/Fb2OFAeOryG41LiBrRLoWgyjBogZKG+TP1uz8sBL6tgV70+ZUDClo3Yyec
	0rVeR46yC9yti7x1INwFTMvr9oyoT09i0cndZMmHobjes6LVW5TzV/H402JMTDywsefOkpPFc+cy5
	9E3osHgroVWSh+zAWqs9OmhyzhvMc33SVIocgOwSPoUsxWhIlGHrvy130cMjQeEVS2qWBVVZ+5Yn8
	vFJBBo0ez5DWya952ZFxs0dE/gxUa0aY5JKOq29Mh1JS5aUHZesRW5C+Ttz2HtvY02trIGhbY4MVK
	3+Y69Ejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHH1-00000007RoT-2V77;
	Mon, 15 Apr 2024 08:01:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHGo-00000007Rhp-3BY1
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 08:01:04 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1715B3FB6E
	for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 08:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713168050;
	bh=xQJUV7ouw3gjxC/4QwGtHq89DL7N6AhWEQMEzK3rXTI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=YXdHTUoCIYyk1TYyWeW+gfEhNhfIOmfT4Qrg2bm31ezDZ405wtDTSakuATPOGUG5o
	 eP/nLJVozBLlm+ry5z9tw18rm62mXaF0MYoHnSEqpuCcG42pI8Yi8ysYmoU+t/feZC
	 e7KDbrZIjO+8Ix4DQQOrivmlL5lqNjlUcPwDpCL/UsSmi98XA+ZblaiFfahb0UB4Da
	 HJwKuKzYuvWn7DCIf0/69xVG0tq+7KfjYuV6S13jb5zEl5lmIku8WFCL4R4ObGAhBO
	 p/QCLE91pkeIoejZVGNRweYy5zdap/0d6aDPLUYnsbhJhaV5hzfQ1BvZQ5y9WeHzVy
	 uieuQMrHV/tjA==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-43654b951e9so25071021cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 01:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713168048; x=1713772848;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQJUV7ouw3gjxC/4QwGtHq89DL7N6AhWEQMEzK3rXTI=;
        b=uKMf02pj5CCl07YzKP1JjjH4brK/3DB7el0tyormMAZ/BqU65NkfspzEIMFuH/qU6Z
         oI30hj+pgK8r3JfQrP7lKMnMW2uLPKbBRn17ldA3wELJghRRLDLTT7EkxRp4zhy+yjDT
         7sCMkdyvNwz6yJ91/arMRvn+sUFJX2nUV587CHzPCmdud2pHn5MvKh5y4PlTTkbuX7aQ
         Cd9eazMVV178P6K0EifXEPeoNi2SFhq/TtUzGlDzSx9teiN7/vCQ/pK0vW+rel0LQCyx
         FsytUqBce/DNNeYUzl3qyPJ4dd5wbqJjF2iioxwmKDqVZs3Nb9w3iLDfCYIlgk0NMUKh
         mUEg==
X-Gm-Message-State: AOJu0YwfQuku7tlkQ/+mLEZGDb5fq2U77smtw8bNDweCUfBEk5MJWguL
	MTotRgWqUsZYJSjp1RfpGt9GURR+L7XjdpgS7CGEEQuUwUgysFVbs3yXCBceCpjlgfsW+rh0N0p
	I3H+rJxAVB1TbrlsWozQgLuLyXI5ot9dLxBYyti2AJcOR6Zj2splt7zi+y2Xie0EZOTW29R0Dy5
	O4/XbqkyX5Wpbr3lpPRtI3qv1L7whoZ/hktxKitBWQsQotbrAwBSfZ+n1AuafNa2Jq
X-Received: by 2002:ac8:590b:0:b0:434:cfe4:90fe with SMTP id 11-20020ac8590b000000b00434cfe490femr13506885qty.38.1713168048306;
        Mon, 15 Apr 2024 01:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe+pXzPvCiZ+lTe389fZeXkgPACzxirDALyNBrs+DqUNrezRiMsLv0X/YjDVvPM8e3scKEkXUoepA/ETssmCc=
X-Received: by 2002:ac8:590b:0:b0:434:cfe4:90fe with SMTP id
 11-20020ac8590b000000b00434cfe490femr13506867qty.38.1713168047975; Mon, 15
 Apr 2024 01:00:47 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Apr 2024 01:00:47 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240414163606.2598-1-jszhang@kernel.org>
References: <20240414163606.2598-1-jszhang@kernel.org>
Mime-Version: 1.0
Date: Mon, 15 Apr 2024 01:00:47 -0700
Message-ID: <CAJM55Z-C_9gsMJCAEVgMjDLCjw2=ArAMHQELqVXAaFSu-GdwLg@mail.gmail.com>
Subject: Re: [PATCH] riscv: boot: remove duplicated targets line
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_010055_143875_F23FDF2B 
X-CRM114-Status: UNSURE (   4.17  )
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

Jisheng Zhang wrote:
> The "targets:" is duplicated in another line, remove the one with less
> targets.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Thanks,

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
