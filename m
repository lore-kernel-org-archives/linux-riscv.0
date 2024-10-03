Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7206ECF34A9
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXMhz+B4JSiEOWDpg9WUJUdkqnxw6ZcJ4gc2yhB6Cp0=; b=W8IZJvlAJzC8O1
	4MsdBzEcymV4Jmbg9jT5r3kKxUljcda/gsTfk3nRarppwMAa6bXD7zWKPDQajSThVkG0pYO/0E6yJ
	2h49xqeZRw5WyeD0DjYTr34WFWT6Ys1cgqy1RYXe7R3gCw0FgLhSpmgV+vY03Y2cEmRwAnZ9N4Agr
	PeyvHp1qJWMRWhiQTpgeYH7UDr44ukjb5SYbeyN9Wf2Q/2Ar8CHBU3VHvc4oOhm0fARH4pPphHZjL
	6kg9ggDHei/6P810FbwGH3lZnsEP7lZoKWpL57LSYyHeJZ1w+OKDxyH1qmOtBDElIZjwxH/rraUkc
	fVgbp00GgZ31S8GJ0Q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swMVe-00000009K9F-3l7q;
	Thu, 03 Oct 2024 14:08:50 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swMVb-00000009K8Q-17o8
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 14:08:49 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so15393591fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Oct 2024 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727964524; x=1728569324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmBAw90LcE/efXuNJODHttzykTK2TqESk97mzA79OYI=;
        b=EQgEVpLG26z1Y2ml1DsJrkVruxARM7vmSnElEvrgnQiwaM3y3KmilCAXQlozG0RfOX
         BECiC0kUdbyhaI18O5AhH5zA13PlGUu+4rdjM/btzCaknbsARDD+SkOpuqZ8SPS/JarO
         Pz14/DdOfINbJjHEW0fUuNzHtKbFHBbRl/UOOiAIa+z5MmPe8jBWeLG1TNlgHH9JoRme
         cQZoZstDez9taHoJLe573XTipfr6g6VJ9rTIL4EPKquyWMutt9H6lRptOygbit2lIevs
         +pana2jWP2hCvFtdDw1ST6B/DQEkk8id7v2yFyfHM4VzvsJDInd1ydwv9oOE0ZWcm+xH
         6Djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727964524; x=1728569324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmBAw90LcE/efXuNJODHttzykTK2TqESk97mzA79OYI=;
        b=kS1wkxbbmzswvBvIdtfvEsYD6ENw1mbIh2KWQQjHfON14yt0uy8iTNXTWd1CfrhpGQ
         EHm0s8DuLNdjg2OOs12J94a3E/B5/E2qFzuqdPjXU/F1MzhzBDoGHwVvma6/FQgLDTkK
         1dx+t57F74WwXV4cNj0FL16vKB58UnkZmbaN11ezKJjr7KWAxjJ+/NbOhxLGLBrtFWdT
         PpJZT/j+FFsvx71804IlGUURoOUOTQdcGes3YzZe3qeDID0lWHzMuolJNl0+Q609T7mo
         wJNxiESNBL/9exkh+gS5l+I/R4rp71ZITBee5/X58ilKwQ2AwgFc3Lbxkdy3MYBPLNt/
         aIGw==
X-Forwarded-Encrypted: i=1; AJvYcCWbNT4WqQ3U8MNWdK5RMd+EIxuIJrSgc/JL6XUBUISL1ovXqgqljuhRvYCxYaEYbtyEe8AN/n7JY1CCWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYa+Euc4SlP9CyRd2byZfsC/l8ko2cgUC+RnC7poeiCH1/Hi6k
	bM3fOT3jngGifWobY2f0wlx0RIuQ19gRgDGmv0Nrbi9G7IU0S2jaQL5hFNC3KfHoLGG1aPBFH0P
	uqp6KLqhi+HGUDqeF/lwE3s8JURo2O2oewNcM+w==
X-Google-Smtp-Source: AGHT+IE4Yzk+gQd7NYEAkgJXljIayhLrOVUv/EmJ0SEtev6CljYTU6L1jsmlcpNqMNvW7F73TN7QNRiYQA7SGD6cUZQ=
X-Received: by 2002:a2e:9907:0:b0:2fa:bd56:98c5 with SMTP id
 38308e7fff4ca-2fae10a628cmr53731641fa.33.1727964524094; Thu, 03 Oct 2024
 07:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241003023307.2138695-1-clf700383@gmail.com>
In-Reply-To: <20241003023307.2138695-1-clf700383@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Oct 2024 16:08:31 +0200
Message-ID: <CACRpkdb2LE1qTe8jrY=pBt2JKxMvQu-b=znjLUAMWv56jkuhSw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix Null pointer dereference
To: clingfei <clf700383@gmail.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_070847_348154_B1AB0852 
X-CRM114-Status: UNSURE (   6.59  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgMywgMjAyNCBhdCA0OjMz4oCvQU0gY2xpbmdmZWkgPGNsZjcwMDM4M0BnbWFp
bC5jb20+IHdyb3RlOgoKPiBwaW5tdXhfZ2VuZXJpY19nZXRfZnVuY3Rpb24gbWF5IHJldHVybnMg
TlVMTCwgYW5kIGl0cyByZXR2YWwgaXMKPiBkZXJlZmVyZW5jZWQgd2l0aG91dCBjaGVjaywgd2hp
Y2ggd2lsbCBjYXVzZSBhIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IGNsaW5nZmVpIDxjbGY3MDAzODNAZ21haWwuY29tPgoKRml4ZWQgdXAgdG9waWMsIGFkZGVk
IERyZXcncyB0YWcgYW5kIGFwcGxpZWQsIHRoYW5rcyEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
