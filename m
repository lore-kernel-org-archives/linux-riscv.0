Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB074C4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 16:36:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B0721479
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 16:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oul6I3s2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bT7vNF0U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B0721479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFn46yaKHv3rPp3UniHFr9xbouzzSxVE1cq+1KXhH5I=; b=Oul6I3s28m27dB
	DvubRUU9AkCyopw3MtQT0xndSBVPmCOB9LtpYKFp04zSSV+1ClNv/t62qMs40dXBuO3HQhTJSiBKF
	vQlXpgseRBYNXvhTlgbsFmYWj2dUREj97njfjNZ1Fb3hdEsgjKlIyxJhd5XpuKQnbL3AG6WYdYgUj
	fpdKDDz22sJAyPt4cdLvMD9AeIC3L9F+qd4JCCi4/P4Koe24vzMlPLHe0MoVpD30zPufuU2iMJnig
	TUwHRHKTbpWwIBQRx501MIcoIomlnGvqfK7RlyAR2XH2uHuuV4kk7IF/59GZq1RAWfSxVfwWJo/N1
	xbQf56zzFD8uqwnGTMTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK3q5-0001Eq-8U; Fri, 26 Apr 2019 16:36:41 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK3q2-0001E8-C8
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 16:36:40 +0000
Received: by mail-io1-xd44.google.com with SMTP id m188so3425376ioa.9
 for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2019 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8YFSmy43A9WMb2hFNjp4Kp0KhLiSpFsnJWtqoKhqoqA=;
 b=bT7vNF0U7/w5duxS4o8nuiZVTUZeAM6utJZ09nU3kylt4YIKd4F6jX2Od9xtBrbyJ+
 VRI67rUBd+c518GnVHEG8GqqefgWdVV6cMjJFAwF2nLhfbXGqMxA1kxUFHPm9IIsdKib
 EeoSqOYxko/GDwpqDO0vcRltwGTMJKZ/GRfW8y1YvQLNK6naJlA7fj9vJ87nwuTtIW6b
 jbXkm5G7tjU2s/IM6K5TKB5YQIA+k81nDJetHN3OPe+vaWNvuy4cFMw660MxIY5brVBy
 Rwxl5jJ7j9oNNmb9AbmB4lDK2MEZAFkEpCjMdTr0DhSCuaGUGjBluDQR0Vr1vlV3P343
 RVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8YFSmy43A9WMb2hFNjp4Kp0KhLiSpFsnJWtqoKhqoqA=;
 b=SLuKJP/rWJpr/CNXSSRsef5n3zOv9MpFq4ExrzyAeAGBO0w/h8RNOKpKYtMCCiiZMj
 ClJKkXxVSJSX/MJFNIpci9f5CrprJKO0cS2DOieAfbpHTzZZYmxvAH3YT/b5rHwYfypn
 xJ0la42sadA2X3W+Z65UoYrx3kZLRPa3FnqoZRaAZ4360vgmmp6SFos73mZqaBVzD4fZ
 NRCHPGG3rWuJaqfAi71ROLmsSIlxcXJoj7wihf8VES8DBbDD11Ilt1mnWX9rMWE+BudD
 FR8Crc3nYsFgZKp3vNr6JUVwmMRnZjIzvo2h0coOrPMxifvZp7P2/Uy5XlvnkfU0adI2
 dVGA==
X-Gm-Message-State: APjAAAU5kbV/WImX4wCNBD1i55ZwMxTLr7bTwwMYst2oCvkU1Eiywp7s
 6qU+3reyDVbKn/sXMFKWLoTbTQ==
X-Google-Smtp-Source: APXvYqxKBSi+Pat5Kmulifsj2VZcOqjDA96kFYBbMSOjTmeOaripioncPr3pfaotvQ8HYmrODuppVA==
X-Received: by 2002:a6b:ee02:: with SMTP id i2mr4720621ioh.219.1556296596458; 
 Fri, 26 Apr 2019 09:36:36 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 l68sm11566550itb.29.2019.04.26.09.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 09:36:35 -0700 (PDT)
Date: Fri, 26 Apr 2019 09:36:34 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
In-Reply-To: <CAL_JsqLMFmkM3YHS3BK9LBdidmqRMZn0w+_WUGg7zZvyv3g=sw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1904260931310.28496@viisi.sifive.com>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
 <20190413020111.23400-2-paul.walmsley@sifive.com>
 <CAL_JsqLMFmkM3YHS3BK9LBdidmqRMZn0w+_WUGg7zZvyv3g=sw@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_093638_442741_0C18C10C 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 26 Apr 2019, Rob Herring wrote:

> On Fri, Apr 12, 2019 at 9:01 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >
> > Add DT binding documentation for the Linux driver for the SiFive
> > asynchronous serial IP block.
> >
> > This revision incorporates changes based on feedback from Rob
> > Herring <robh@kernel.org>.
> >
> > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > Signed-off-by: Paul Walmsley <paul@pwsan.com>
> > Cc: linux-serial@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> > ---
> >  .../bindings/serial/sifive-serial.txt         | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Rob.

> However, what about flow-control configuration? You'd better think now
> about what the default is and overriding that.

The underlying IP doesn't support it.

https://github.com/sifive/riscv-linux/blob/dev/paulw/dts-v5.1-rc6-experimental/drivers/tty/serial/sifive.c#L30


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
