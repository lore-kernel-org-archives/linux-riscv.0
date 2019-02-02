Return-Path: <SRS0=4/Si=QJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6595DC282D7
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 Feb 2019 18:49:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E9BE2084C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 Feb 2019 18:49:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EU/6cVoy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FJt2jgSD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E9BE2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFka9WyikS/RxanSh0qQf8ed+TKXePiLXGZ4awzp17Y=; b=EU/6cVoynTCEKK
	ys+eA7MVPQsN1uSgTG86HPR7BvGfZ5f9RbmnRaDARKnLGP+8lRwQCdIPZF6DY0se33McALuNrKNPU
	ZzoLk6IwmaxkgtTd7Dvhcj1HLigL02yT/Ws0v7CzglklWhCa0Sq2bxk7h/XszfmjxAxlmOB6oUAo2
	FVlkOAkUET2IYZWjyq2NV/V0Dkm8IkegVuIGqNj9w+/I0h0kHa3ZDLxY5RYDDqJPSfbenGgeG1UkM
	pmiuamJZOjmYiWsbx4qQquvVBS6AhA2Q6W5hLPXO+XWT6MpBwm17WjOzknvGEfRQgDbQjWcuVINCs
	ADJJ6X29uYZLgNuItyaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gq0Lv-0005DL-F6; Sat, 02 Feb 2019 18:49:19 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gq0Lt-0005Cx-0k
 for linux-riscv@lists.infradead.org; Sat, 02 Feb 2019 18:49:18 +0000
Received: by mail-lj1-x244.google.com with SMTP id v1-v6so8571043ljd.0
 for <linux-riscv@lists.infradead.org>; Sat, 02 Feb 2019 10:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HABwQduxLJa0gtSqZODHg6YMx4Tuy2X7MDBmpDNStJw=;
 b=FJt2jgSDSL2zLaG93YQhqh26f/HF3jBSiYuTItBW70m7GVhwZ8+kXsyW3Idx80xKfT
 93O6qEO4L/9RDasBj41QBm4y2u4oEGuCDrIw/tHTebkdc1GwG2DZEJspVX8USZWtyr3N
 8r9SJ+qQ8aJFf5vwPr+z6khusX0kmVqDMZmXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HABwQduxLJa0gtSqZODHg6YMx4Tuy2X7MDBmpDNStJw=;
 b=K3QviQ+VPyru0ixs417D3S2cENeWWB9x+PUyTv7Ig3lov1wi70XNXuIatS6FsWN91H
 NusGSxKRmRFxU/R9qXAJcQdW2ilcVpBvrzAF/57b3pveuQLdzQQmyLUD8E0G351pQw5l
 E8V8Nsohqm6hP9RyXIb7GRsAybCoD2wp2dIDw7VZqsx6il3Amyp3F8FGYvLNtU+4rPPG
 hahqwUus0r05ydo/sdBV8niKfkyrj59A043zZ5WT5NSNWNbjpU9Zp2vnsDbVjYbRdflb
 C2DgznXxRdN+0HtVf7jAXyrD7RaVBnVc/ILA5Gfy355OawA4r55UwU8X+YGnnYyrdnoC
 Lvkw==
X-Gm-Message-State: AJcUukduvU3/KAp5VGTk5MWUTUXvcmIGt1YyW0DLtZ6ODC+9tRHoBsX3
 /inYAZQyBj25QvSwPYeyXJrpvwOEWbk=
X-Google-Smtp-Source: ALg8bN7JW3Be4ftMEVMpXjeIbE69CO2NGsj/97pS4h2bfUuCCUxhRdPjCBs9ss5v7oXxBWyXoDdDCw==
X-Received: by 2002:a2e:9a16:: with SMTP id
 o22-v6mr35318519lji.112.1549133353839; 
 Sat, 02 Feb 2019 10:49:13 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id b25sm2057367lfa.96.2019.02.02.10.49.12
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 02 Feb 2019 10:49:12 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id a16so7479551lfg.3
 for <linux-riscv@lists.infradead.org>; Sat, 02 Feb 2019 10:49:12 -0800 (PST)
X-Received: by 2002:ac2:510d:: with SMTP id q13mr2047701lfb.78.1549133352024; 
 Sat, 02 Feb 2019 10:49:12 -0800 (PST)
MIME-Version: 1.0
References: <mhng-e49bbf7a-76b1-4eda-a715-f5791b80197f@palmer-si-x1c4>
In-Reply-To: <mhng-e49bbf7a-76b1-4eda-a715-f5791b80197f@palmer-si-x1c4>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 2 Feb 2019 10:48:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgY_pN59-b9Whk47CaA21ktGEfYAfJL192g6i6SWxdoYA@mail.gmail.com>
Message-ID: <CAHk-=wgY_pN59-b9Whk47CaA21ktGEfYAfJL192g6i6SWxdoYA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Fixes for 5.0-rc5
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_104917_063902_D67805C6 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Feb 2, 2019 at 1:43 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> RISC-V Fixes for 5.0-rc5

Just a note: your pull requests don't get the automated pr-tracker-bot
emails about having been pulled, because you only cc the linux-riscv
mailing list.

If you want notification when I've pulled and pushed out, you should
consider just cc'ing lkml too, and then the automation will pick up
your pull requests, and do the "it has been merged" email thing when
it notices.

                   Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
