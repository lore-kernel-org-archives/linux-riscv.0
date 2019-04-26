Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CFFC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 14:09:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F31206C1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 14:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P6DK7p2L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rw62xWhm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F31206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufaEpj+gAS53udlqpCDHBqm5KJMQ5U9bKdfN91/8oWE=; b=P6DK7p2L9Zjz4n
	MffFcaGmJdj+xVjMZuFL+DEvH6SGFjySFMdiG0HOk+h+0aMANGTqaoV6GqIdQ7C7rHGVdkEiwCLKS
	Ay797M9G0lH6kaS4DM1s6RsN2PsKCZbrGBx8E2MYDUl6vcUIbgLOfvsmdrBvXGs3yfnZ6QaC67qHz
	7dLXEMggxHHyJNK1QHa9xnYB0mLL6WTTNtg3wFvP2GpQ66u/iC/EwwlamEPdiJe2WcLnPoGsKSA3L
	WfRUOIuZIK2IXoqqFiCEdwCJowxwnEUZpMIy3KRkbX/Ziezq2XoqvclG1ONXcfgabO74zhCHNAutN
	70mMkQmmVYWObvklEtLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK1XF-00017z-B7; Fri, 26 Apr 2019 14:09:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK1XC-00017c-RO
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 14:09:04 +0000
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 163CE208CA
 for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2019 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556287742;
 bh=Ky5AC051wlkEfcHF2s4LkIQB5jAFFHWvQUVc5iMChdQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rw62xWhmnWw52i+gJoQMW5cDmhHBDYmKyxldlnb87q3EMb619NbWeXRB6GbXdXoqR
 kuJkdArt90UQpMo69XlTp1bbHeXT0laj0nA77Yqve6x4DWS2oNxKilQLZb8esejydX
 NMq6hqzn3n7cV8Yui8VZiHCBIdfb6gL9HaFgZ6/I=
Received: by mail-qk1-f179.google.com with SMTP id l199so1928478qke.8
 for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2019 07:09:02 -0700 (PDT)
X-Gm-Message-State: APjAAAWm5JMpP1WKoSOTXEkmp4C9aCmUrubDUFTPvC8VETGKltayTlCy
 AXYHGNyVE623bU/+X90fTWnFOBY1uZsvxT+lkg==
X-Google-Smtp-Source: APXvYqzVddOPT+S6uvLGhEq/5k9ww5fHVcqGq3bG0Teml+vSRDhuS84AuGDcICBEzrZ3ByklBKgSQxKaTLMfxHs2QQY=
X-Received: by 2002:a37:ad14:: with SMTP id f20mr700993qkm.147.1556287741285; 
 Fri, 26 Apr 2019 07:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
 <20190413020111.23400-2-paul.walmsley@sifive.com>
In-Reply-To: <20190413020111.23400-2-paul.walmsley@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Apr 2019 09:08:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLMFmkM3YHS3BK9LBdidmqRMZn0w+_WUGg7zZvyv3g=sw@mail.gmail.com>
Message-ID: <CAL_JsqLMFmkM3YHS3BK9LBdidmqRMZn0w+_WUGg7zZvyv3g=sw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_070902_904183_62275A5C 
X-CRM114-Status: GOOD (  12.71  )
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

On Fri, Apr 12, 2019 at 9:01 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Add DT binding documentation for the Linux driver for the SiFive
> asynchronous serial IP block.
>
> This revision incorporates changes based on feedback from Rob
> Herring <robh@kernel.org>.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: linux-serial@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> ---
>  .../bindings/serial/sifive-serial.txt         | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt

Reviewed-by: Rob Herring <robh@kernel.org>

However, what about flow-control configuration? You'd better think now
about what the default is and overriding that.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
