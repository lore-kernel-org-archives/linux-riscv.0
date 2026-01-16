Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C60C982C0
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsFrWyc74/2X+wTEnGNooPSVwyBjVG8tyhPY1VGbe8s=; b=MMcPjsJxzDm6gb
	VuU9GC4npfKjFLpCr00RU9GUF621Oght5eo2zGPDMORgcK2OyO2d1KIFqHvqoW9b69IStZIPGVMQ1
	hbf5w13hbf7UlRJX8qIX5EUnetS/5+KN++UqV8bpwqvoxn2+V8rIjliACVqm118HQ6lAa0uOPbhXa
	YSkOyqUGG6HFaAObo0gJxjKZNrFhoFYv67qmPEUwzQ+uxt5+n8RvDNe4Crji0Ee7o8l6W9NJM9CDd
	z++0bSc7bAKSLZH3ZNXMG0wzCucSxB+/p8oFIdk3su6HE450rXi+JrhlklWEg9fklS6g15ZFh+uWG
	ca/EddI3KARHq6CQ1mWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrSb-0000000Ew16-0o1Z;
	Fri, 16 Jan 2026 21:34:25 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrSY-0000000Ew0l-3sC3
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 21:34:24 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-6481bd173c0so2324324d50.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 13:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768599261; x=1769204061; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YluS4VvGiisnpPBIbnWwZ0yy7fsXjBMmbe0uAp7E52Q=;
        b=I3OWsSlGVBCnq34vIpL3gM4fhjPBSgdDAj0EPLA6DBC+8WuSICvZMJdsMFce4yFEL+
         6482c7aiq/lq6LewM878adpxqHQ68CLqb3Ht/g+/1VBBUfzfxyY86GWhwmdBspRrjRto
         A4A0eUHU3ULwLFrcJgUpZiYHNjzLHzDS7cOFR9XyUbiQBPIyTfoUihFZbC8UjcPc2VxR
         JzCaJuL2Ndz2DDYrSIjtYfkz2M/3qqYm1zvBw9CuXS42Gp2+odFGOdaxQRRxh6mmWOL2
         gC5PyKMf3Y0DrnCt+9CGwK7NPho8xL3V8vJBbseL/pP+XnBxi9PMxd2wymyIWpfUoTYX
         Yc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768599261; x=1769204061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YluS4VvGiisnpPBIbnWwZ0yy7fsXjBMmbe0uAp7E52Q=;
        b=Ui2BHehITyCCuk+ZiIGEJrMMz55cvL/P5W+/nar+rOdml0VXvgVXMeqR0Hawg923Zr
         rZrDCheQOPVOwIVdj84F+ZOHzoHqK/SIW/ICHs8BUDz7dMD6EXnM+a+PzM8eYnrcTlj7
         qJZ5oPQYDw5uBWkQYJ+o/yDr5DeyEdJWcRkrClGEm7HKKwyrorg+dHHuzzP2XDe92+Ja
         8XVpxHmphVPOwWfqLaFHNVEa6j3o89u/37/37BPSo2ktOCr7vRBPQItL1vBrT0214UK3
         JNc8ykeDZ5i7GN+opURp4eBVX3EQ0kHULDz5xFiFcVuishBhmAbUuDcNl9K1+blGxuw+
         Jgiw==
X-Forwarded-Encrypted: i=1; AJvYcCW8sKeGxIpWMeLDC117MIFxPyZyt/jTvTROwQ4Wk0iT4IUFR2wtTq5XsKF1rFNAbOlS/BVQXsTrqJkdSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQxy9EpF+WSOnap5T8ZVbgF2useKpKBriqvoWbh0kMhmitgP4t
	Tne18N5fHmKfw1Si9yvqCHunwp/OLt7vC7naN2/DUe/HRUrUILZ4c8u6Wvamjm7AlYeFUAmonaL
	Q844b1e8RnJyYa4Fz5cpBHnDxZgA+Za3p0+je3Xqrew==
X-Gm-Gg: AY/fxX5SrUhMvk36zM72baUG1Q3XLWFnGZspiYJxacUZzmab7lWTVUdypKGw9Iw2NV7
	tPzknogIP6Z/KTzF3lVmd5iRK8Ghb0Yt3Xiuena+l5mvbgAPEJ+tLzJxtjHn3Wq1tIrZbPzHggt
	W6dkbAcCiHr/7Fy3/nt41jHkSRsPe19iVaZmV8A8IHbwuumWyjLwoTD7vCWr6iPgKU3vpf3z41v
	u3pIq5W9PUyqTvHUOwpN/B4llVu5BqJPUcIa9FocKeRugDvoRwoA16xDv2D6iUMGvceXy/mgPtI
	H8U9116sYpdTjH3zzujfdFmDTPTo+eIunZHU/JuXszpuRmBhmw3Ya/vaoQGx
X-Received: by 2002:a05:690e:4087:b0:640:c9c1:a347 with SMTP id
 956f58d0204a3-649176f1f15mr3163766d50.7.1768599261541; Fri, 16 Jan 2026
 13:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-2-7356e671f28b@oss.tenstorrent.com> <20260116-debonair-tangible-reindeer-debcee@quoll>
In-Reply-To: <20260116-debonair-tangible-reindeer-debcee@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:34:10 -0600
X-Gm-Features: AZwV_QgvIVsYMJGT1-ENcxm0LkH6MNSbRl3fGJNIA3UmwlJBoY9B1QGuQ1fIBc0
Message-ID: <CAEev2e-iAN+br0wa8dXSyjTgh=vNCyqwxo42EaksCjXOdzeFWw@mail.gmail.com>
Subject: Re: [PATCH 2/8] soc: tenstorrent: Add header with Atlantis syscon
 register offsets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_133422_966415_977D94EF 
X-CRM114-Status: UNSURE (   9.48  )
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

SGkgS3J6eXN6dG9mLAoKT24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMzowNuKAr0FNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPgo+IFRoZXJlIGlzIG5vIHVz
ZXIgb2YgdGhpcy4gU3BsaXQgeW91ciB3b3JrIGluIGxvZ2ljYWwgcGF0Y2hlcy4gQWRkaW5nCj4g
dW51c2VkIGhlYWRlciBpcyBub3QgYSBtZWFuaW5nZnVsIGxvZ2ljYWwgc3BsaXQgYmVjYXVzZSBp
dCBpcyB1bnVzZWQuCgpVbmRlcnN0b29kCgo+Cj4gQ29tcGxldGVseSB1bnJlYWRhYmxlOiBtaXNz
aW5nIGFueSBzb3J0IG9mIHJlYXNvbmFibGUgaW5kZW50IGJldHdlZW4KPiB2YWx1ZXMuCgpJIGhh
ZCBmb3JtYXR0ZWQgdGhlc2Ugd2l0aCBjbGFuZy1mb3JtYXQsIGJ1dCBpdCBkb2Vzbid0IGxvb2sg
Z29vZC4gSQpjYW4gbWFrZSBpdCBhIGJpdCBiZXR0ZXIuCgo+Cj4gV2h5IGRvIHlvdSBuZWVkIHRv
IGRvaWN1bWVudCByZWdpc3RlciB2YWx1ZXMgYW5kIHByb3ZpZGUgdGhlbSB0byBhbGwKPiBrZXJu
ZWwgZHJpdmVycz8KCihJbmNsdWRpbmcgdGhlIHN1YnNlcXVlbnQgY29tbWl0cyksIHRoZXNlIHJl
Z2lzdGVycyBkb2N1bWVudGVkIGluIHRoaXMKZmlsZSBhcmUgc2hhcmVkIGFjcm9zcyB0aGUgY2xv
Y2sgYW5kIHJlc2V0IGNvbnRyb2xsZXIsIHNvIHRoZXkncmUKYWRkZWQgaGVyZSAoc29jL3RlbnN0
b3JyZW50KS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
