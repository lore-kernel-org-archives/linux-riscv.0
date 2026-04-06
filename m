Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCFBF46C71
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKBngCaKdAPdIK+NEoGb0f0C1WxL9EJPKFzgsh/5b+M=; b=iMBSJsc9ARScZW
	oQr4Cl1Pvlv7I6S3kIPKLa4z2ydoEeH6jVQ/LdcjWgneyaCqT5Cg/Wtox/l2yzJsBgH25GsVdfLHw
	9vYSw5jnB8GMEhXbjF8Fk87fE9Dol8/OFa926fWRzqUkjeZdZ3vHT2/hgqS53RYcdR8TxPqUGcFSH
	KBBCE7mzkQWbhS57uofujLiKHOwLJGBf2T06wQ3yTCO+RgGNZOhhk0Mwy7DlEnaDR2scLHOnhVzSb
	uXPwBzH/SNW+Q8OPRx7ktwl5XrSZISvLSwxCWHqfNxRLgEbJpwHYM42dYwU+Nkr4iF0WozJOdvp2d
	HONeDdcBakLycz+rdvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9oxI-00000005P8a-3Olr;
	Mon, 06 Apr 2026 18:45:48 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9oxG-00000005P87-08xs
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 18:45:47 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-66f1ef0e1a8so1532340a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 11:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775501143; cv=none;
        d=google.com; s=arc-20240605;
        b=C9Q2lImzgjzdMLOjiLF0Him29IBu2Ib+uPPizWUwkT34RhwWMrSh4kNCinG08wS/x2
         xdpCb87jlBbVLGnTtmphiEEpwBXNg1ya6Tp7ktNKLvfk/tUcGWXAj1vAiO2mncMLW8WG
         m4UWlR0r41h/2WQgh074hfcCCXg1KUn9+td6IXKaGZAJib6okxXbwst4vLy7sGiVre06
         w7f3pOOPKoPr9JFzOluhU2PvvaxaxiwbhLIKrTWNB8KvBmmAE/bVYwx8QErOFviFoPjl
         7kZpJbI2QDspAB/phezwVrN1SlyDXH7rBRbMyrXFbGzCB5MWV3fW5GYHRH9imqxwCFFa
         G8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
        fh=b/zVSOLqPrOS3AuS4R+IfCFhbK83jqJ0ybrodoeWCCo=;
        b=A9koIE/6ulKFv5slBP7igf9RHRCk3E8W6oPOos5z2eMJ5ZA9sDmIDT8QtDXfvw848+
         z8kNq2eA3Fo/yWg7Lpe3vqOHC30m8BM/K6b1/ar4k7pfteH+gqTj+NWvCmwvDvAA/ZK/
         aE1xkZVTDLnGNrB+2NfEHdlTZ6jMRREyMJh0Z8dkP82zKeSw2Sh9/Hsz8ike23qn20oh
         0AKT7sYGoiYmzklFM4CydtLoK8EmWf8+n8OHa3cZq1mnk/tL+97yK/pf3yuB2Co6nVmd
         yum/mEj14L1Tu9UbjpvTG6bXPZkK8L+P+tmtkMmCsu4V2ESbATujfa9LB1mxsOGr4v+u
         EM4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775501143; x=1776105943; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
        b=DGtgZoIdZjq4JpUeOeh8bbBqm4c1sn5uBqsTcgAoxMqYt1BqBD3QPTmz6zMPuV0bIw
         ZRU/FbzJOJlRT/RIFRu0WlYtY597QiSd0svtBdZgSHo/+vrUAC93a93scdUX1R+NiFmS
         oqKGkgDAUqxg4sWiOdfnPia2nrNw0dzGKqepELhaZ3nF7NG4d0oldhvGaErUtAdIbVcw
         sYcYPM0DEpJChC2U3j3KLlV6VxoyDvGbHcQzRhrSq6KY7s8VnexK/+HTuzicHKAW6deS
         VEIlGglRd1erFu5RB6Iv+TdyvYY6rt+XMjoS3VLNo2RH+vrMcxIPzAgRRO5c9me7cOLt
         GvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501143; x=1776105943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pmHTV4TADk0gWWUpG8M/E5ZGSDVjZD7cI5hHNpdlIc=;
        b=Es4M2b1m863iSFv5bn7eai9Rbvq5Y9L6wOeJKL+ZNMGIA5Nn6MXYe+Mh0xJ7njT5uj
         18e8Oh9I2LpeORxVd4YvfYmOuop/NGam5fmu1ZYdyx4md9y6BgvHkmsW73Inibr5Hvsr
         3RwtBvTDntyBHkzGQmq7qU3swDoJWBhgxhzrGF9YVmyb04yJxUrHUC1C+ir1zOvN5Inh
         3Ot1EI5t1RMEdJFXyhho3UxpXyET9dbmZKVO8vEWlvSjba8bEo7TIURdi6uJJozzaPGr
         X1KEKStPn0vA+js31EO41YB0keH0RigLOG0YJhjH3t3fkafFHbi/kmaTSQlj8AMcOrNF
         MhzA==
X-Forwarded-Encrypted: i=1; AJvYcCWjX1mW9quhF5FadEuY+RVXT/w1o8qiU3hU/KaXCWlsqx80oVg4zZqM6TQFDOZmDYdKjuROSyoB6xOWwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHLl+lav5SYIzgyTokk7PAiFW8qfbF6obcUa+y46mjhiza466f
	cEIAgtjuryS/uavivFmGzxYMGul5Url9VUrYGaQqXNAbek7+/Q2YBPShYfTIvL0xgv/bGWSOPm8
	JCMKWNtmpj14UIndvbjhD4tRS7zdU8BI=
X-Gm-Gg: AeBDiet79nqykzccAkcK+rQnQ3OK0Ao+iBYQc5g7z/iBp2vIYohRc9lBN0R4vrUHjNw
	Y2ICIKEfJqw8YG9VnALkLFLrM7bO1qtJzhRyK9I6GEZ/wUuNOI/M9jXXNcWSXjxiBabKcRXX2RD
	AtCvgEjkUiTkIIcEFKBl3TfjCQh1nf4RcVff261oQ3K21mFceitS7yP26b94wi8Mg8YBOrnGfQm
	KheEvHAQWK83EJ3DwEhmLo12dExXkJRAyF3DLBB+D0O2w+GYM8f1kt1xrYud/A1D3+r5Hrd205x
	va7ZGg==
X-Received: by 2002:a05:6402:a215:20b0:66e:4372:73e9 with SMTP id
 4fb4d7f45d1cf-66e4372747bmr4169926a12.1.1775501143298; Mon, 06 Apr 2026
 11:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com> <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
In-Reply-To: <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 7 Apr 2026 00:15:26 +0530
X-Gm-Features: AQROBzAP5CclShOimKNLKPr2Da3Hb2vm1DFd1fAAdE9Rewzt50idvfVsjIHzHvI
Message-ID: <CANAwSgRUM0HJSKr2zLYkv=LnWv85gvbc0_WD9gXywQqHcU=EaA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] thermal: spacemit: k1: Add thermal sensor support
To: Shuwei Wu <shuweiwoo@163.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_114546_112768_A753FC17 
X-CRM114-Status: UNSURE (   8.46  )
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

Hi Shuwei,

On Mon, 19 Jan 2026 at 08:13, Shuwei Wu <shuweiwoo@163.com> wrote:
>
> The thermal sensor on K1 supports monitoring five temperature zones.
> The driver registers these sensors with the thermal framework
> and supports standard operations:
> - Reading temperature (millidegree Celsius)
> - Setting high/low thresholds for interrupts
>
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
