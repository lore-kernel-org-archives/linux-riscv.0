Return-Path: <SRS0=U2Mo=NA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D0AECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 14:22:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5502021534
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 14:22:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OWTJJcH4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0H+dFP/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5502021534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oO1QfdRdzBRJrltIgjTmaGaZ6zOhYyhojCO1AVTCO8g=; b=OWTJJcH43iDdx/
	hodbTt1VWBqlhznLZE4RAP+l4YvLoJOP3GzcYWaWmOxmzpwupdnXMdfCY7gBG1z1khjMqgYorPqbO
	Q6mprBeEvVy1O6aD9A4F9KDBbYXdUPeMeublzOEjgaSB01aEVnZY3JBxARBPYwv/OKohhaYbKJyzQ
	jcvNyOGm+lN8I4/M5bG4MP7PfAJQcNrAC0THqowphbEMbDrAshHpJf52EbwASD+hPRiv3SwfCAVqZ
	kI1dyblSUt3OEDjch1W2bKdTQwA7lEMqNCeMYZc9eq21KeqlB0LXijuMmVw0SfN1xAtakIsbDND4W
	lQ3G433lRqbqt2EPoriQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDs8m-000375-LL; Sat, 20 Oct 2018 14:22:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDs8j-00036E-7w
 for linux-riscv@lists.infradead.org; Sat, 20 Oct 2018 14:22:07 +0000
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7ED792154C
 for <linux-riscv@lists.infradead.org>; Sat, 20 Oct 2018 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1540045314;
 bh=+40t+JokEkPKqjA0ZzxhopmJPSulcQLzupa1A3k6mn4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j0H+dFP/92P57M9unZq3GMC4bFqGbY3BJzIsL/pIq8AL02ZmLry9U8Lr+tX8UMJCO
 0YddfIRN9VSjXCjN3ilhx2oLHmlOD0PEqoDVy2gT8GV1XfRTnNGEklE4GBRHZtoJ05
 6GRGrW9SINyVZTHdUit0ZPeLvp37xpsuPs+3FvV8=
Received: by mail-qt1-f178.google.com with SMTP id k3-v6so5706949qth.2
 for <linux-riscv@lists.infradead.org>; Sat, 20 Oct 2018 07:21:54 -0700 (PDT)
X-Gm-Message-State: ABuFfohVIL8Xtr0Q+Yr78e3du8uuXeP7b6Wy6pZ8UH8nczg4qGwPJnrz
 w4qsXaAr1aztn4GrWFr/qa62NoSSdeXaxFXeIA==
X-Google-Smtp-Source: ACcGV61df+RWMC8bsOb3xGtJVPKx/CBY/H1zZXHSGDssuM6/+Bm1ERhEOT+HlpvxupU4JSClLLL3ussaiaMgroDiV10=
X-Received: by 2002:ac8:1701:: with SMTP id w1-v6mr4831981qtj.76.1540045313584; 
 Sat, 20 Oct 2018 07:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20181019184827.12351-1-paul.walmsley@sifive.com>
 <20181019184827.12351-2-paul.walmsley@sifive.com>
 <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
 <4317548d-f831-29ba-3be9-35f080587db9@sifive.com>
In-Reply-To: <4317548d-f831-29ba-3be9-35f080587db9@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Sat, 20 Oct 2018 09:21:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLagTgjDhZ02X=wPFDB4WF2bR7=LyzSW9D=ooo_XB_zOg@mail.gmail.com>
Message-ID:
 <CAL_JsqLagTgjDhZ02X=wPFDB4WF2bR7=LyzSW9D=ooo_XB_zOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181020_072205_319665_E856A939 
X-CRM114-Status: GOOD (  25.43  )
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
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181020142142.7qHm63BhOlYIciZkT2zji1pWKL35gxOs_Xn9gQj1MG0@z>

On Fri, Oct 19, 2018 at 5:06 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> On 10/19/18 1:45 PM, Rob Herring wrote:
> > On Fri, Oct 19, 2018 at 1:48 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >> Add DT binding documentation for the Linux driver for the SiFive
> >> asynchronous serial IP block.  Nothing too exotic.
> >>
> >> Cc: linux-serial@vger.kernel.org
> >> Cc: devicetree@vger.kernel.org
> >> Cc: linux-riscv@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Palmer Dabbelt <palmer@sifive.com>
> >> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> >> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> >> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> >> ---
> >>   .../bindings/serial/sifive-serial.txt         | 21 +++++++++++++++++++
> >>   1 file changed, 21 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
> >> new file mode 100644
> >> index 000000000000..8982338512f5
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
> >> @@ -0,0 +1,21 @@
> >> +SiFive asynchronous serial interface (UART)
> >> +
> >> +Required properties:
> >> +
> >> +- compatible: should be "sifive,fu540-c000-uart0" or "sifive,uart0"
> > I assume once again, the last '0' is a version?
>
>
> Yes.
>
>
> > Palmer mentioned the
> > compatible string is part of the IP block repository?
>
>
> It is, but there's no guarantee that the compatible string from the RTL
> will make it into a ROM for any given chip.  For example, a customer may
> want the UART, but not want to take the DT ROM to keep area down.

Optional? Well, that's pointless to have then.

> This is one of the reasons why we'll likely switch to the usual
> software-maintained DTS files for Linux, just like the rest of arch/arm,
> arch/powerpc, etc.

Then you should probably just follow normal conventions.

I don't think DT in the h/w is the best strategy anyways. Ideally,
what the h/w should have are version and capabilities (assuming there
are configuration options) registers which aren't optional and can't
be forgotten to be updated. The version should probably have a vendor
too.

> > As I mentioned for the
> > intc and now the pwm block bindings, if you are going to do version
> > numbers please document the versioning scheme.
>
>
> Will add that to the binding document.

I don't seem to be making my point clear. I don't want any of this
added to a binding doc for particular IP blocks. Write a common doc
that explains the scheme and addresses the questions I asked. Then
just reference that doc here.

Maybe this is documented somewhere already? Otherwise, if one is
creating a new IP block, how do they know what the versioning scheme
is or what goes in the DT ROM?

>
>
> >   Where does the
> > number come from?
>
>
> It comes from the RTL, which is public:
>
> https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43

I'm not going to go read your RTL, sorry.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
