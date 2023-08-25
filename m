Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDA1C3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCA9luAhWfcX8N3zjnRahuOLAJQjSO7gJSdsxn9g3Bw=; b=02BEHEQDYzU31h
	0Gbtfei/UwGmwfXxMgS7nl+houAAVxnhjUG3udQ+tDWDf2LvaGBUa05aXJIkIv5eIB9Sz8ifSrzso
	/NID2fr1RHaQd0S1L4kxDGjOwVV39X243z31ZqoKp8fHFPmd+1tIZ/70MPBUByW7802WPfpSFVD6W
	DWfL+RkWIrRwV5YtNZb0Wf/zl1etnUVOLJ8LcPeWfwTg1uk09fCOMddlCv75cL7uct/TMJ1nEEVME
	5sWRzb8TPEKLGUjpyzW8GL/Fhs/K6yfxRo3eWyj5mtn6yE410+BLhP7T9V5r/da9xTy86kMZEuSZR
	x0ByZbph6jXHrzHA20lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbQp-005rCz-1b;
	Fri, 25 Aug 2023 18:21:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbQn-005rBb-29
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 18:21:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bdbf10333bso10528545ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692987672; x=1693592472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cd1paIDws1ExLMgJh/WiTiPNEsGUGwcEQ17xiLulNdo=;
        b=nhk5Ko+OG/2Q2+PvkEDtXdRrk3or+134Updyqdlu1P6XQCscy7egtl8AziCQjtc+Bn
         zp65RvpL7MR7vfIQJtiyZ3WEwZ2/AOZJxGZQ4mDRGInpxpoBv+UhEk0r9hCNWL5bYNqC
         5O0xNrQMLaQBipxQ7a78YEG4PHOgm1S3/j8H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987672; x=1693592472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cd1paIDws1ExLMgJh/WiTiPNEsGUGwcEQ17xiLulNdo=;
        b=gzYkqJxFT3TE+kE3ux0/TNgQ7h7XLU+TaLLV8eYmrktKbUgfVXoe/Ps2blnjHpvClY
         iXwO3SXy3QM0pasys3zBrn0MRq0azxfi5aDHa+TXWPoIud9U3eE+qRN8e/6J0hdG/P9W
         cWAxcg0HT/3Cr5FxoggnaK7Kt0EpARXfi9Z7Ymrx60BUjnSDmuuzyzaUCaKFG+zZuWxG
         FwGh/e6OiTXwa1w7CWr7idtkMskf1Qeeq2lLH34qbdOZMkCUckoKRRcbqody8MBwR2wc
         NY/cVV8G096PumtT8oZ4p5QkmZE8K/3JuOWFtdaXlRY4NFqJNMnFA3AHahEvR8l+Rp4/
         5ZYA==
X-Gm-Message-State: AOJu0Yx0hk2TS7erIvlme8uKtgku51TzsMvIVjGlaYNpF46ZDHzaEAx6
	2oun9XU3NJh1EyZnD6Zxg9dWcw==
X-Google-Smtp-Source: AGHT+IHIDQ9FIJyjliN/xDw65w9ny7WQFMwwk363Mwv+Ejm+xJkfXuvIT+Ox7t86mTNHW1gFw7K36Q==
X-Received: by 2002:a17:902:ec87:b0:1bb:9f07:5e0 with SMTP id x7-20020a170902ec8700b001bb9f0705e0mr21488860plg.60.1692987671857;
        Fri, 25 Aug 2023 11:21:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001bbb598b8bbsm2056354pli.41.2023.08.25.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:21:11 -0700 (PDT)
Date: Fri, 25 Aug 2023 11:21:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308251120.159800A@keescook>
References: <20230824223606.never.762-kees@kernel.org>
 <42174d5e-59f0-4612-d7a1-11e830d0a044@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42174d5e-59f0-4612-d7a1-11e830d0a044@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_112113_701464_F8A424A5 
X-CRM114-Status: UNSURE (   8.00  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 25, 2023 at 04:56:54AM +0000, Christophe Leroy wrote:
> Le 25/08/2023 =E0 00:36, Kees Cook a =E9crit=A0:
> > +# Base hardware support for 86xx
> =

> s/86xx/85xx
> [...]

Thanks for the typo fixes! I'll get these all fixed up. :)

-- =

Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
