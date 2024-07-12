Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64CBC2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xMu83i4m46GDAZd0fLewi5j5039UAzHYm/K2YNj0RM=; b=KTxBCkrtToIwos
	K9GBfyBAU6R9Yixxp4yFlSmREJyvHXoJgk6Y3pAfWMJ1dyqL6P25W/gM/PI05w2dm7xJCZQ8KBZWT
	7SNf61G8zaBGgTQ8elVaRA9F34n0QFDpCpXgMieJB0IbBNLntWfS7mHvgGtyrn5Ryaez1vq16LOUP
	yFe3XG/XvMFpVIhWcluBIlz9dg/6q4jsbUXg0a2A4aygZcjCXyasuLvPPeJVCm7Cyd0DvNZ63q5SF
	FSTygcpfoROFjM8eDZ88tz7Egh65a2ANKn253/oxntMJV6jMSI2cuL+LZzasxBzOFca1uz6ZWO80G
	AVEcKSzPoPmz6P0ZXlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSImd-00000000ckS-0yyb;
	Fri, 12 Jul 2024 16:06:07 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSImK-00000000cdD-265v
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 16:05:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-70b1808dee9so1750980b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720800347; x=1721405147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tVEDV1iMAAfIFvW/+wvdACc3/PqlD9+6N+4kH9hopjA=;
        b=1OeSgyXEAqlfgSpdhSUw9TXoJR2nUrZLSHTIHzvpuJ0sOIdPDU27WpuZ30LTRhfx9Y
         o5djAjjYwPluxXKDmr9oZb2MKHjA83/bH6t/he4O1reJpP1Mt5rueismHe0LjBe28oOo
         wC4LjUXSuFUZhZ9LENTjU7b8VRCVcoMEcmLPTj7DKKysQunEHr69+6qQWpocKLtaLTNQ
         XBfb/oL2Tf/Vm3T9k1QIXUIMS0NFKEUkxEmXycSuVJ2jedPWVvmMRO7hE+82ydPYkKFn
         2pN46nMfMwmq8POF1xPl2p3i/fZvzDEa/RvVmvps6BCwyEOkpegsT/Elcv+BKSDt35+o
         kZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800347; x=1721405147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVEDV1iMAAfIFvW/+wvdACc3/PqlD9+6N+4kH9hopjA=;
        b=PLtCYenU43SVw681xHURohU9jx39tKirk3ph7/oQcw8nfJvSJbuV848ATJW987O8It
         KQwDgv8oubVitjbGwzisaLqEctWQNO2NHrNqKdN7xi7NEfKZJLC8adFpccdwG5TXc8rm
         Vs+IR1KEY1F7AWBVcjd12Kaqc33HEkedfgFiRu3M9SW0H9pIqlXYPJfec30Ez4omXJg3
         hxIvKxl0R28Zf8BtDi/H1bimjhqmtnfDAsNQYKlXl5uJZxauG9SdSrq1uDg4aPnNImgJ
         oiUQ7JNCGi3vNfBDYbYExb/7wiceqNpGTpwFJQsgdnea4HwiMlgEPmhg0NQfKU53BONI
         LAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+V0GXp2b2PQxGjrAvxMn2uPDsWkmioh4iRQfXcIxDZzBlQllNPtbr6blVCsxGVQfPc4rnH8GyTmhhSLFDpkFpmmMu2t+a8AOdydVp77nN
X-Gm-Message-State: AOJu0YzP+cgw/565wz55bm4N/zgz8uqtCHnM1t9xSGu19uRlE8JyMr3K
	AA5+ZaLpKcD38IIOfypr7ysgrfhsEpYYW7FJeX0VqFkY7f27dGhBkY5vA3cPTWc=
X-Google-Smtp-Source: AGHT+IGKYJDZpE2qytnY2B2zgOVQ0LmknywmMQBDC+167zUbGSI4bhyIw6ryHaK7vauAHXZnTY8yLA==
X-Received: by 2002:a05:6a21:99a1:b0:1c2:8e77:a825 with SMTP id adf61e73a8af0-1c29820ed74mr14226594637.3.1720800346753;
        Fri, 12 Jul 2024 09:05:46 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:c949:fd63:7988:f01f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad55b4sm68571125ad.293.2024.07.12.09.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:05:46 -0700 (PDT)
Date: Fri, 12 Jul 2024 09:05:44 -0700
From: Drew Fustini <drew@pdp7.com>
To: Conor Dooley <conor@kernel.org>
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] riscv: dts: thead: add basic spi node
Message-ID: <ZpFUWJ9ujDyeGORh@x1>
References: <20240705093503.215787-1-kanakshilledar@gmail.com>
 <20240705093503.215787-2-kanakshilledar@gmail.com>
 <CAGLn_=tT08KUX0J+WURq=EXKDPj=--Wg3qmCjnzGxNeMcz3NOg@mail.gmail.com>
 <20240712-denote-disprove-ce271b70c78c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240712-denote-disprove-ce271b70c78c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_090548_662473_08CFFD8A 
X-CRM114-Status: GOOD (  11.99  )
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

On Fri, Jul 12, 2024 at 02:48:46PM +0100, Conor Dooley wrote:
> On Fri, Jul 12, 2024 at 02:11:18PM +0530, Kanak Shilledar wrote:
> > Hi,
> > Any updates on this patch?
> 
> It's too late for 6.11, it'll have to wait until 6.12. If Drew has his
> tree set up already, he can at least queue it.
> 
> Cheers,
> Conor.

Yes, I'm in the process of setting up the appropriate branches in my
tree [1] and then I can send an applied to for-next email. The plan is
that I will send PR to Arnd starting with the 6.12 merge window.

Thanks,
Drew

[1] https://github.com/pdp7/linux

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
