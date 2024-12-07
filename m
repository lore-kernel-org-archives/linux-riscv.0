Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC53BE7717D
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Dec 2024 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvjs8vJwzc22NAHaMm/uueSW8BWzkfupjyLkXL/4eu0=; b=sxccSRjj9v+O0K
	3IlK8xZECeZTnd7sdENRs/bysD2apXzE6ccCRxJpOWS2KPA6V1YgtGNQn11WPVtswxl7iZwZIAfTy
	LceQx3183dq3GYv/Jqmb1Nc+jINBSVpv1cjaw9PyUGXlicUH5+bo2RxoAvGkWZsqzLoj5upOj07cP
	L5RxGZeN/rdeoGRPN3N/2WKJ0HtrojEjcGVPb54TlxfV8nXitxy5cbxb34IEkQMDpXDlX4hRY2pMk
	X6tks8WMvOJvL82UdKeaPnCJSQcyXLrMRSYJ9lD3B1ksPOq74em9HWoPDhPgJ5+CXB9/bETcxUm9I
	hHXFj/bvcyBZJfPKm8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJwr1-000000045jw-2tFx;
	Sat, 07 Dec 2024 15:36:23 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJwqz-000000045jc-0OuL
	for linux-riscv@lists.infradead.org;
	Sat, 07 Dec 2024 15:36:22 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so3456646a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Dec 2024 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733585779; x=1734190579; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zHshuIbQ0xcfAgQEwx29QMAXvcTcz+8gOhp7tdrMGD4=;
        b=YxWycZeTUspVxu/dDnNVzJr0DlDYD28/jSGr7UxGzNv/2kewRwmQ+u9BGp7kFDCEw3
         h9rI70FltIAoRkrW3eJ6Hj+K3m9SR01A+HBP7Lh8fQbsBUz6uaRVS2/voXQ/2utIJjuI
         WEg2o5nUhfM+mHh8ksOCIP6CgqmQCtlCC2iC7lAUSHgk8AdZOat6YwenFx3D+9mw77Jv
         hSlosQSFPKeHMumvJJfJbFKnhKLV1AfiRpk/EVm/kfxu+p8ZlbkuyJkNEaO+75Xurkyy
         pHmJQi8NqdMgbLEiB2KUrceJPD7Ugkpu51Zaci/JQVbs3TiNDwPfR1TKOscPZ2W65Tty
         75Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733585779; x=1734190579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHshuIbQ0xcfAgQEwx29QMAXvcTcz+8gOhp7tdrMGD4=;
        b=iYHxMBYSWW4df9xfOyFCzOwWWZnMXmy824QZfXtkY955GlDF2awywt3/wIMxWxfUaJ
         ed6m5YVqnh69H2tQBpj9ti1kJe45K5emheiIlL99US6Dsd3JDq2Q1uCV8Rhlj+bOcJh9
         53Oc85+YA2+1GXVUs+7pwAtyOZ858rhiCiYKC02U2Liv8c9KxWp7yNiX5TqU3/A89zuX
         MguviKjQ/EEEchXuR7UkNLVOYXiLBlHeTacBG0tx9cUSsnLZxGKoy3hQUTh8jzIjJGV/
         rCir+YgFNQzTVyAqEmL2AOkKd1xw/468jbN8/JBy+lHcj77y5P/DaOXYPqhsHLDBuzeM
         I68w==
X-Forwarded-Encrypted: i=1; AJvYcCXXIwXsoIlETfk0wqLUuov4mplCvzaXA2TyZWzHpi2lLVq2xmFjpuZ1hYiPU+RXoyKBdpA0HNjctKFFLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8A0z7q8o4fRyzaybDetP07g6K6tRRqw3vWaBHd4jI9ws2j3Hn
	V1rngFoh+CRmIk41f40jfmBBO12EU1351HlbVwVoswMBtg3NTX5OkC5QZcds5Q0suG6H18Dfewn
	2R6bbEaXbvgaLZp9sLAhdhbILfY0=
X-Gm-Gg: ASbGncugQzdefTm9njfFHwBwfrbCWN9163AFwHgGWoR5Zvcg1II6TbR31SkcwInCokU
	Dzig/laSpBa8Tep9tkmCQIwBGDjpbT7dTPcB/YA==
X-Google-Smtp-Source: AGHT+IHoE7hywdceZP0ecmajv5RJm+ghgmXaAnuTlzMBTgY9GRfcN1HHtpkho9YdPt49H//MD+lGW3RvLAllEHGkS/Q=
X-Received: by 2002:a17:906:4ca:b0:aa6:2d86:bd2c with SMTP id
 a640c23a62f3a-aa63a0ed36cmr473776266b.21.1733585778375; Sat, 07 Dec 2024
 07:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20241204111424.263055-1-bigunclemax@gmail.com>
 <CAJM55Z-YAMtRN=K5KxCH1+++Xw4uMM_c49z8tGzi3snU+-KrYA@mail.gmail.com> <Z1Hs5smgFV4C6c90@x1>
In-Reply-To: <Z1Hs5smgFV4C6c90@x1>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 7 Dec 2024 18:36:06 +0300
Message-ID: <CALHCpMg_CEUKGVXnkJbwcDEUNzq_N1Cac=Umjra=KL6vEpLcsg@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: thead: Fix TH1520 emmc and shdci clock rate
To: Drew Fustini <drew@pdp7.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_073621_213531_64989CAA 
X-CRM114-Status: UNSURE (   5.32  )
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

Hi Emil, Drew

> Did you look into the documentation

Yes, I looked into th1520 user manual but found only
mention of emmc sdio ref clk which is 792Mhz.

> That is a good point about checking the thead vendor kernel.

Drew, thanks for the suggestion to look at Revy's BSP.
I'll make a patch for the clk controller in v2.

Best wishes,
Maksim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
