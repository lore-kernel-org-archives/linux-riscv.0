Return-Path: <SRS0=1KMB=TN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB423C04AA7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 20:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D47A208CA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 20:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dhZwnOxP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2f3v4+R1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D47A208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNa0LY26mYAeLtqpP615fWqbIo6TmXhjxlqjpNc1G0Y=; b=dhZwnOxPD4owfZ
	vNI5GzP6YtN1d4ZdJ/1JhjPE+tq57rIEB8JQDO4fLbbv3ZrD7/wZJlCniU8PF2UGKViuoBlaz5Uq0
	yOVS8LTdVIPuMzc7Jmy61LOwwWlqCwEBlgI4DacMKG/pjQmeUCbT9fKlxiPcXAEr8C2REA+FHTO8S
	B/ANl6iPOrpEEMlHHzQS9LwUw0gf054VR9OuXBy8QSiD3xeqQxdGUAQ0byv3J6A1gyZMyHe76w/Ng
	MaFv7GilKuUvDtMEEt2F8nQNLtsfpEZugA+EoQdUZ2PY1/cWM60ydamcFDHlNFOEuSXiVoLAfhYKu
	WHuE95DfdfBUTFKw076Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQHrL-0000kS-Hq; Mon, 13 May 2019 20:47:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQHrI-0000jh-5p
 for linux-riscv@lists.infradead.org; Mon, 13 May 2019 20:47:42 +0000
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFC0B21537
 for <linux-riscv@lists.infradead.org>; Mon, 13 May 2019 20:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557780459;
 bh=A0UdYxon8ghsPmLDQj5qZFdVwXsJWqeY9Whr7tFjVDI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2f3v4+R1IeE1rUFpgvOkVrF4S6OmzkYbX8kYvOSidD6Lt59JijaSSajYcsIPPrwQc
 SutE3iblzEFuZ8ox1YQHkH6ZLqWtx1HM8gRGqPL85jKHeqp2CRtW4vsIGI/7JHK+wT
 XX4qOANt3agrHlRSjl7PxC84XVvOinVPSyOZht+c=
Received: by mail-qt1-f173.google.com with SMTP id a17so15201827qth.3
 for <linux-riscv@lists.infradead.org>; Mon, 13 May 2019 13:47:39 -0700 (PDT)
X-Gm-Message-State: APjAAAWdS8VZBLHXHGEElGZM7IZclEhX6XEkzwxk+RJQVvz7qQ/FNApY
 LP35IoABeOcWVugdDl49Z5Eb6hl5IxDokDszHg==
X-Google-Smtp-Source: APXvYqzfpMaBz4WEUO6c/TBlbpArvkHgdVN7DB72QJ7ClwTzINXTCFbJH7nNJY5gdTbVCw+RqbSsGRaTRgk6zSVsNg4=
X-Received: by 2002:a0c:932e:: with SMTP id d43mr18277565qvd.77.1557780458893; 
 Mon, 13 May 2019 13:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 13 May 2019 15:47:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJRdjoTo2hGrKWvcyer18wt9N6w0nkfa9xx_e2xJ6pkYg@mail.gmail.com>
Message-ID: <CAL_JsqJRdjoTo2hGrKWvcyer18wt9N6w0nkfa9xx_e2xJ6pkYg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_134740_646999_C47CEB6B 
X-CRM114-Status: GOOD (  12.93  )
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
 Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Megan Wachs <megan@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 21, 2018 at 7:06 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> For IP blocks that are generated from the public, open-source
> sifive-blocks repository, describe the version numbering policy
> that its maintainers intend to use, upon request from Rob
> Herring <robh@kernel.org>.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>
> Hi Rob, please let me know if this document works with your
> requirements, or if some changes are needed.  - Paul
>
>  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt

I just noticed this was never re-spun and applied. We now have
bindings in tree referring to it though.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
