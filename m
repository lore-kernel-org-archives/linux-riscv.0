Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2237C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:14:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16772245E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFcsCdBl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTUdkwgS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16772245E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3znYuMZUxZ0gC0i4ZdGOMwHQQ7MHRhFnhKcOsXwso/c=; b=gFcsCdBlcZkReR
	lRe5Xze1+vydgH4slLPoMfe3TjbtL+EctEoHabyctG6aoVLG/FQ0YNfxig7+/ZeBjvGKcxdYD9ip9
	xTkpA3vaKeNuYtcJLWv/vfj9/f7WLBKJWD+hvS0fr5EDkUuTIU06KVkhJQCvpkAPTqHnN/rvsD19B
	p4MotVw4Syut4RK2xpMdvR9K2FOAA3hwpOxZGXsKK4KLU4WQYOooNiPIGrlqhHShz8FU/2b/Ciz51
	UpoihRjpe4jDkDaXn4UsRfyZnL2XOdYBkkHPlmhg9hyEctofDji7tLFb+UdpJVmfpLwsXl4Ktw3pz
	1Z9dv0VOqpIpD52yE1xA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMODZ-0003Rv-3L; Tue, 13 Nov 2018 02:14:17 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMODS-00034G-W6
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 02:14:12 +0000
Received: by mail-yw1-xc41.google.com with SMTP id t13so992828ywe.13
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 18:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=woqON29sDppaFa7PHsMdLKhOo9G+cuc/+i8sqgC63/4=;
 b=aTUdkwgSmSjE9qcgRTjRfpDzQBhQ8uesbOQjNfzpjY+xLxH+2lo/lzdU0U4MAbFmkI
 5/aI2z3Ehf4Yz4L42xS2cyxI71kC1qxPFut3vrcWTKkALuxlEvqOY+GAW0s8j6YohK7V
 BJqU0MH6fqYt3IgL1N6yNbKC6MPIT2Phw/WqZsBoIVvP9yvkKBqft1dKs2bGx1RGKhru
 i4+gcOX4nR5s4itFYfjfbD5mF+iIthWHl3UTUbOLP9X1xC/9t4U06kGvGHVl5sxVGZ8p
 x2TQE5xggqf3UBeqyAiNvzP5zIYKrBsi/5DdY8GHmHL3S2Af7JuCJBkeW8vyRpEMJjXh
 7GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=woqON29sDppaFa7PHsMdLKhOo9G+cuc/+i8sqgC63/4=;
 b=EzuR4Bn61CbkX2T6qX8JuFnFrVORAZW/piByR9X7jlTKxyYkEl4ufodIn1enLBUqsB
 j2UbYq1DztCwBLK1dmIcKU5anxxoOa6Y1Gxw5LCh415Jj7y1jLCE9qtSN8/4KL5tEQs9
 1EIskbhHqyqO899je72nlcvaRaLr8wQJtfHfmJcIlBQFb9O8+M0vVXLb8U6yPpkvcoDD
 1YrG1+OD8LzG80ZpGechmH73n1WcNvE/RX3mPSPe+ZqKTU9/e8P/GMt1iXHrzJjFczz9
 vffiCbIMO9iYoI+C0VhfL8w2RUkmcFNo/fZbh9nxCUO1ck+zqNorweo3jL8Ovihw+IFp
 d1WA==
X-Gm-Message-State: AGRZ1gIxJiBB3vaksyi/1VSF7j4B9phXhRZ4lRvRtKHAxru0UN91JSPd
 xlUM+JOGBLYkJ+GX73Q1rKAaKATb4AhAkp5ZUsI=
X-Google-Smtp-Source: AJdET5fbNyLcvl1IZ8mMyx6KwQQOM8BjI7VXaqEkiQAppQy/dk+vzes/LPNrI/CXuYj+w8nDHyVOeJQh08HRniHOExY=
X-Received: by 2002:a0d:f103:: with SMTP id
 a3-v6mr3352562ywf.468.1542075239590; 
 Mon, 12 Nov 2018 18:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20181113020113.29640-1-palmer@sifive.com>
 <20181113020113.29640-5-palmer@sifive.com>
In-Reply-To: <20181113020113.29640-5-palmer@sifive.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 12 Nov 2018 18:13:48 -0800
Message-ID:
 <CAMo8BfJWaO6vyikaTRurX3wsMneBr0wWuq+eCgutOAG-Uv8EDw@mail.gmail.com>
Subject: Re: [PATCH 4/7] doc: Indicate that xtensa supports sg-chain
To: palmer@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_181411_040044_7BE74254 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrea.parri@amarulasolutions.com, aou@eecs.berkeley.edu,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, James Hogan <jhogan@kernel.org>,
 linux-doc@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, david.abdurachmanov@gmail.com,
 David Howells <dhowells@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, rmk+kernel@armlinux.org.uk,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 ren_guo <ren_guo@c-sky.com>, jglisse@redhat.com,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113021348.S56GfeRY2neKb1_f_hrw5iuihQWoDFpe_JPLZEuPGqk@z>

On Mon, Nov 12, 2018 at 6:03 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> This was suggested by features-refresh.sh
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  Documentation/features/io/sg-chain/arch-support.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
