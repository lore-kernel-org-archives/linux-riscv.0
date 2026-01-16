Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F4BC982C0
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29LSZR2R1aT0icXf8OmoyJo/rVUFGP5ehfd2fKHbLok=; b=CNJ6fs6uOSlabM
	0X73kEtVDNnxYpJ+zms+UYZPwt0QPNrMj6PcXQ+tLfk3engV/JcUQZVVkiCc9MBDZHMMSq6y9Ybhy
	743f0PvXMvZM5100T1Kiz9iQQM0uG7WD3SJ1dPnYWuHa3jJAZ10DTAikXm+Bcpxz5IPItfdCKwuuq
	xSbx1dmXPkMBC2VJinCp3o8eynBcNU24qdfXsqLTXHgKXRy5Cy1JmivNTDnURvefZqToyYP3Ie1h+
	5qM6F4Tc8ruK2T1A//lc2+L5XHFdBRUN7G4913WQZUo3ZSKIpqN6GPv8DZU94xMvY88STAFw9v3jk
	1534hnbGN7K1iCCOxA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrJk-0000000ErpZ-1a9Z;
	Fri, 16 Jan 2026 21:25:16 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrJi-0000000Erp4-0V4Z
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 21:25:15 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6446d7a8eadso2339671d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 13:25:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768598713; cv=none;
        d=google.com; s=arc-20240605;
        b=B/qNucoXlpv5KuePqOr908fu9Ahq7xMZt6BX2RJQw5ZY8juW0ynZZqMOQeKPul2o/h
         RtK8hIiMhvCg3IjyjWDdBtpaxoe89Yu8U4JjVAX5Vo0WXDfxdaeyaXSssC4Lnio7RYph
         tQ6xcsVcxVtBa+U6OoQs1KkQQGaqnv2bjqquJlTSvflcSqOd+RVudXL4EyJyiqkAXhJy
         C0L8AB+Muh+uz3z5jQvBSSmaq9U24UOPhOpoZ6CW6ND0P7TQhjhz/NcPqWPfFw64Jf71
         09LOtK799vyKVwImG44av2ZZloFMCCcEg4spY9uWJyyNy2z8Hx9KnfbRkyLaNVkm2+sK
         88Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mxbIo9HjWFsmyBKBsroE0HUQk3fFrXYb/WE89O0U/gI=;
        fh=cyIwa30zH6PH3Y1eC0zdU4inP/mP6GpK07wlxs36858=;
        b=bcf5ukycxja7Nc/dv20+YNgwk5GOpPD4zZagMt8eQGCNPX8yXQjIWuz0qwdSAobdZw
         FmwXDN7UORtxU41pDC5J7nfNN5ZBjl2r1txNtyGPQxbwVa3Gt6lXoVCU2x3vaRve+klj
         BFJUjRQpHVCP8rLKBVyqX7m8sOuObxc3uJ8kCoDVJcCpENZpkKansHbPQyZ82gt8fHgk
         GkmJ0IbFYpMnLaRnBHsLBA7MzNYFcv4iP4SJzfQpe6FQ5n+mcBo1ZeiASVExjwbYq+ks
         ECvM0C4z3wVZVWCTJHqXMsJVJF/vqyMMogQ2oB5KkfH0I86r7L1kMNqUPYVWt7bImjoa
         4lbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768598713; x=1769203513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxbIo9HjWFsmyBKBsroE0HUQk3fFrXYb/WE89O0U/gI=;
        b=ZPHaMDMeSvKJHLUsgmmcAAkp5FIVcEFImDwL690LIDoUqw4XudtxQlTuYelCP1LJUC
         tRbo42LV5Y3XpgOByt4eh5MGZDabzt/EalTZ2G9ZqwhXG5KWCrSS4i45TpgUJsapLDd0
         hH1pmGCmPccJBjpTNmViCvZ6tCdBGrZWVVR85JK7h86vBmgot32Fg5XZf3B6k20NFvh8
         E3fCMt5riTXcbtPGAvjKOczr92kwPKufr5F72H04mUbTN4aaALcDa9W7th/oRZIffDgB
         z3TUllDXHgvbyMWWPF5GM2OYfzh/QnO+HRklaz0/Lk9AxVmwmfLkAh/YO+bADyYQOAxN
         gwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768598713; x=1769203513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxbIo9HjWFsmyBKBsroE0HUQk3fFrXYb/WE89O0U/gI=;
        b=GxfO+M0O9hRw+yWmhqWQ+SqEfCNrWZ8rlBVf9MERphHk/8pw8fYjEoKrOU/JBzkeET
         bQ5xUWZ0rFKQp2JWsFcUU4SNBQU5y/K+y/1YRP1D8G/FysFuornxLLcnWSLk1c6EjjzI
         iZkDGrj337mjX4bp21mdtBTrbRBOzi0suRKjltpW3MuUHfXKnhXCIJQ28dJhLSgcBuYr
         Dfa+T5h2DS4L8cW8YDCZpZBT/y7XkEdGXBicpZ+WkU42tERphPrS+aeX7tOijuciYPgn
         MFtSWcyx+PZf5gw7Pe18ccH9/+MXO9DKucYeImCfP9x8uqOsjDT/iheh5WPSeqvWBJv6
         xSeg==
X-Forwarded-Encrypted: i=1; AJvYcCUugefcju+tKOUghGFRTzVDrELIEeWxITnUwJ78lgeeYhP4fC/C3MuVVURw2Pdd7k0dm9tUK3Vkh1+AYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJR1l5CmN+W1LJzQvJACkURCD5tOYI0e4mnRyl3lKDO0atBPN
	U1k+++jDmLbnY5m/+QGOllA+zjgEQDzga8615NUnR+nPuhCjgvC7b1oQ+DYdZRmFyqkmGaRnTzP
	q1YqNOXBQ3cq8kr4G1+oSIBDAQoWcznxf/55RNZBCjw==
X-Gm-Gg: AY/fxX7XiGCVcZISMe6QWRJcbVh0UCeXfP7qWyaGKur5Wzdfpnk6wlreGszO27Uy5Fd
	mR14f5IxlkYxwiDhRsGoqvSRlGJ2QQN79q+Bh2QboVP3L8yEbcHw96cNOGD/oGdv9jxNTuOJ7BQ
	hbcQLgr66m4mPWewjxjlgu9902wcKECBGlTs+eGe8sCA2k75ymiGbqsZWzgjGVwS9KcAhlcbKEt
	8urpsT7GPmFDawO7MPqHr0IySndSaGAsFpv9rtF6/QcdJid/UXfN19cUJu4bfb3AVkxPuTdounT
	Jd+ZqUTcFQMt5lVqf8z+T26VD5tzX+tnNzGQj03PD4X1A4xgOCLSYBf9x2jp
X-Received: by 2002:a05:690e:1489:b0:644:28d2:a4a6 with SMTP id
 956f58d0204a3-649164f76dbmr3642894d50.47.1768598712888; Fri, 16 Jan 2026
 13:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-4-7356e671f28b@oss.tenstorrent.com>
 <20260116-unique-devious-elephant-e9de6d@quoll> <1ef5317a-93d0-4357-bfc3-ce780002734d@kernel.org>
In-Reply-To: <1ef5317a-93d0-4357-bfc3-ce780002734d@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:25:02 -0600
X-Gm-Features: AZwV_QidPk8Y4W8WRSMZEq2Ai2phZYkmta2y36cESHGQhYtUHli-ToYTUVaqpDk
Message-ID: <CAEev2e8i_4Dud-OdghjN+1Sp7n_9yNThwgDbirkREBJHChwscw@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: soc: tenstorrent: Add atlantis resets
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
X-CRM114-CacheID: sfid-20260116_132514_167289_11507A34 
X-CRM114-Status: UNSURE (   9.11  )
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

SGkgS3J6eXN6dG9mLAoKT24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMzowM+KAr0FNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNi8wMS8yMDI2IDEw
OjAyLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IEFoLCBiZWNhdXNlIHlvdSBqdXN0IGFk
ZGVkIGl0IGluIG90aGVyIHBhdGNoLiBUaGVuIG9idmlvdXNseSB0aGlzIG11c3QKPiBiZSBzcXVh
c2hlZC4gV2h5IHdvdWxkIHlvdSBwb3N0IGFuIGluY29tcGxldGUgcGF0Y2ggYW5kIGZpeCBpdCB1
cAo+IGltbWVkaWF0ZWx5Pwo+Cj4gUGxlYXNlIHJlYWQgd3JpdGluZyBiaW5kaW5ncyBkb2N1bWVu
dCAtIGl0IGNvdmVycyB0aGlzIGNhc2UuCj4gV2h5IGFyZW4ndCB5b3UgcG9zdGluZyBDT01QTEVU
RSBiaW5kaW5ncyBvbiBmaXJzdCBwb3N0aW5nPyBUaGlzIGlzIG5vdwo+IEFCSSBicmVhayBmb3Ig
bm8gZ29vZCByZWFzb25zIC0geW91IGtuZXcgeW91ciBkZXZpY2UgaGFzIHJlc2V0cy4KCkkgd2ls
bCBzcXVhc2ggZG93biB0aGUgY29tbWl0cyBzbyB0aGF0IHRoZXJlIGlzIGp1c3Qgb25lIGNvbW1p
dCB3aXRoIGJpbmRpbmdzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
