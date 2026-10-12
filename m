Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7E4CA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XC4nsDggEKCtgLxOM/rPnTP4pFL/2aNGOnhWqP0l1wc=; b=i/8WpbRdNZ4OYB
	qZSjAYlOvMfpmZtvneEgQApwlvkGzFYIgDbLxyXmJ0h6BNyakmWNUWuVU5aQ/JcTaqU/wSSC2lPRs
	5/eNkrOs0+GUvP+PboBq9whZple/7ho56QVhThjP9vBCk4XqzE3uQeenj1/IwQ30jD2HoB/8dq4p3
	hii74o2KPEsUTYsGdOJ9XgmKb64nuO1L8FadCMxYBwUOiihlLRxztIs4eMKQ/zdblK6rTPo1ssuEP
	NmPOic+YFiQgJRWbOmfiQ9prj1C+fMONn67qLqD1j3Jq8hPGuI927FPLRhtZrVNFa66xvER+9H11r
	JTjfkiHA0frtZgkEMoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAL-0000000ACqU-2A0C;
	Mon, 12 Oct 2026 10:21:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAI-0000000ACmg-3fMS
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 10:21:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so11205075e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800513; x=1792405313; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J/fGl7AngFu8xJcaPBlF37wwBTAGepjU2CFhZRheH0Y=;
        b=NZMQSrjKpxt8axLmACAyHgwRovKSaYD2tp008pb/4r7/btNKUrj7zVY0OZm5sMhzkO
         kyMuIuUrBpg+NZzD3RSQXzogBndbbXvIm6RSL6a9I7Enp6jwpXKAt0Cm+LcSNPgoofbq
         uUGb4XmiqEAK7M8cfF/k8wNNWanGjfIMQQ/HTMw+Mxs7lX4+81iCPI6Hes+8VdyZQ8rr
         wei1ivpXza12jh/lYA4wIWJ3wnOCQzyoCSm/Z076w0i/4BXj4dO8q0AvZbt1ZRSRI1On
         QS0EoNrtYMVaoXFJVw3XHGkzWsMw28SVSdlMTsFx19zR98iLfazjPGtLY6cXjsLBs0xx
         jaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800513; x=1792405313;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/fGl7AngFu8xJcaPBlF37wwBTAGepjU2CFhZRheH0Y=;
        b=cKtHQPOJp7Gz3zF/A7O5qf25p1nX3PhCLq1ylQUeeahmSl2oj5fUHcuqDV/ikdQ4hm
         HUaqZRN7k+hFX5i/y8G9L3cuSX6uAiWOBFN/hf9/TraftDw3bjzaF1LOnwr5yqW0Eylm
         m+24vDs4UJ1GiNtEQ29143Ynjk+3XjxHgkCD20BH4c5+YDI7Hvukw2fLsM8qRsfSe5bl
         qGlfwauYFf9XI0dJhVAdEdPATDP+6+eivioFxQ3vhzeUJO2MJB7/Qfm5+aLMepo5PQyG
         1NjWa2mkdP0yTH86ZzG8djSIsoyS1Jc9eKIGS8S2zNsuNZ1MH87gSa3GN636VeDBel6i
         wtEA==
X-Forwarded-Encrypted: i=1; AKwUvBxSiLLImZE2hacRjg+8OWvE+nHs4YuhmAeIav+cnfqRcfi9I9J2oIrmk+vD4oVjEdITDwrR6Q7HsFK/zA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJjUtaeocHH60jVJMQkJ6ZjTZPSFSLY1ajbTeWSreD8E2ufyhb5
	igzwFT7UB7lMnRKLtFQHzgkfNzj85K7Q4cFyT6qXsCIrwBcwMg3JvCEfAE186uWxHbk=
X-Gm-Gg: AYBFou0EJA//MP1JnZoFJ+lMkESX+YmfEDhJfdnvleXT+j1T7SzkorMbK7yM2MSJo4m
	QQ3sc1FrToVhepZHVY8lf+G+2K/FfW1xEuXYP8njpu/tyho/9Lhjp1QiIlu8WKB3VTAHgQdAJyW
	1VMv2QuwT+8Tr8BI7WF0lh4HEAllC0t3PiUdpCS8b5cCUVJa0tehAMorSVNgowk1tYYDiOfVTDb
	XlU9utwCIOKeV+Q7zyV5gboRBZ3ySv5PRhAM/ZUe+SxYuMf1Z62R1XAhkL92mjXGoepayHrCbJ4
	VLVW3XHlt0iz12u0VNwnsKfqK5dxIXVAxUt52iJGJc4WKwslAdzinPKPzK9uck6wXcq0liItmeF
	3S5TYYJOY1dvv7w9fBLMo4H98gsSQZcGxJaCVKIgO3aUG50SCn81U0gWn+FIA2Gl7svZJkrZQ5A
	R61MaKbiCfpmuivfKpBW39Ue7kb82ybl1Vudw1QMfZEkyYWZfE4ZduWnEUmPxzzI2x4hHaWauEB
	THWDJaQb+s6DRjIrw==
X-Received: by 2002:a05:600c:3b08:b0:4a0:da23:e06d with SMTP id 5b1f17b1804b1-4a18e4a380bmr173177745e9.10.1791800512977;
        Mon, 12 Oct 2026 03:21:52 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18dd15659sm184807835e9.4.2026.10.12.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:52 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050741.66744.3459927533880490879.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nbmzk645K2Au1Vo+vbmjqut/AfbSCiLc8qQw/5saqHM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuwvSIosDtrlc1xK6mV2g+n6gmepGRNYf61rumds7
 tB3utKuo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPRymH4Z/RhEnNj7FvtSQbP
 mZs2dG3k5Q4K5X7qHdzINI+9vMr1LCPDW97JkxguTwtoivefJlDweaXjmrAbkR7PGc2V/qdefHC
 GAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032154_958059_F05A7C95 
X-CRM114-Status: GOOD (  10.02  )
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

> The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> subsystems:

Nothing really forces you to send them all together.

In the future, could you try to send one CRG driver at a time ?

It is fine to send big RFC to give context but after that, if you
can make you series smaller, it is generally a good idea to do so.

This helps us iterate on the series faster and then you can fold our
feedback in following series (instead of repeating the same comments
on multiple instances of the same thing) Thanks.

Also your series does not apply on clk-next or -rc1 and no pre-requisite
are mentioned in this cover letter. Consider using b4 to point out
your pre-requisite if any

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
