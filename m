Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D040E606D83E
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BHCmyHf1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYTsxh8A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BhDl3n9NDOB4Fq0uTlW9SQg0exdYXKHAmk/MSbRE2E8=; b=BHCmyHf1rzQ5zjgKy1ngenfU3a
	yPfJWMsh5YLXF5WoBrGnFM6j1vY7kYMAlWbqwwVZS5V/wIR5GU/r4VAv/H6LbccFDgUnNCTX7pZfG
	ApLTRftBuHYiQHMOFHDriVJ4INli0HiNxFVv4B5EHyZUmwfgQ9JvLW2Y4DYWWV4Xr2JC/2EM71L8S
	Topa1RIxBu9Yw98IiXFHNH1BftXITgogZEL4d77RR+MI1NNUT+B7eB2edurI8608SU93eoLgGBx69
	fioe8xHQwWEKPHRiZWUklwSpC4P5zKpE5ttYEHD7Cx50atEfZSnst+tPK/Cyq4iBxm7chg0YL2OA4
	JebS5LZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfp1-00000006Pd4-150y;
	Wed, 04 Nov 2026 18:34:55 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfoy-00000006Pc1-3Lml
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 18:34:53 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6767d92cde6so1274379d50.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 10:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817291; cv=none;
        d=google.com; s=arc-20260327;
        b=RDJ60fqVpOgxLsicDv45nN9xiNBOIB17eblrto6TQd5Eh+BltkXKbwZ2cqEIi3VOLz
         +Wdw/5qBBOb3F4WewPySuGez/z0FxqfprtHFTyIGYDprjD5NRiU7yd3Nt4mjppEplZtp
         owIhRNo2w21fspKBN4fQq3Oyt+O5hF4ZKox4pa3kBh2baZV5tbTaOTWUIyeNM2eBmJsN
         mAc2VckonW90ISvfSSjGE/Rc1mSXCI8lICUZU8YCoOKKjsv+ITr4NEkhddypJcYSk9dT
         WhpwpX9p+r1Xzt7y/N45AhPwsvCreGU4o8WK9S3t6WuPwSbTgPWmsLyX4VfyKFrqKNdG
         3SQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        fh=YMzddskMbJFVzzqPFBs2+nFRTuXjlgjD6O45Zxw3GOM=;
        b=FQS3jAuwUb4KJ596KNk9et5SauM2/ySNWUzlgXnBPFuEQEQ4e3LmzKVE4uVvwOBckW
         7V7tiT09CWLR3LFH+fA3N55hUvygZ7ENM1G60t0Epbm5Csa/aw2jzp38QvhbI2elliBB
         37sOpyWl+NdBR9hGPMpJM6R10hju6pCG98gOIttGFJlUGS20K8QrLkwHr0EKuhJpF2kq
         etDj+fAGQKT4bUcPWyXtcFP8UvavIAVZ6zvsFc0Mvd6gE6OijO7Em5nt4DIBcctTh2tc
         T149eImBrBjaemSblIRFKgM3DaTXqi1Frd2dm+o6EP4Di2axkH1Hw4b6ff1s6nKffOBq
         3crg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817291; x=1794422091; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        b=wYTsxh8AQFiGLSovCuQfzYSekxhgNzkNpEP/yqgrgcxcSxjS8RwWkefgFPm+X1WRip
         OA2FSxUFJ52Q50yy1wdDpX8jR7B1sunSGlCjTo0xDbIdPAVoTKBc0u7QLIo1pjxunyYl
         Qq7jr3bVUuOAHPbwqRQ1fyITu+SnOQ0GmyYABzyENmOThtQP9EVtSenCrBFnuSKhPv65
         W9sC1zZyB+Jcx3EQ4tCVS/DTVBbrvRyPh7xQqIMpRGBnLuSRVn07MBbI5jc8xyv6byTt
         0t9A6ZfIccL+K/yVjO9P/d0cMcDUhCzGhdK2TDi/X3cjmj7w3ZIPlmk45exat7UNRxSF
         hJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817291; x=1794422091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        b=y7wGTDjZgy+UggCpmnMzG+4iN/BveYZOtOgPAX//kiajVBrC4wpch+wUfuNNoNO9GT
         WaoWPdM6ZUsxKo5M/Z2OmSvjrMNHIad2HW+hiXcKtszo9WCh9MNQtn5SuX6gGzpWsrPu
         UelQFIdNoL7OMHdHuDKi0U61+eedH6rRbmTPQgPIBYesisn0RcCPhln86y7hnU9gvJFh
         +fdvG9CXfnAToM0pmT/OrIaLHmTb1XCBF3k7pQ8EHEXfhwApOfJNPcn+z1ZAolP2VMeF
         xEYTCms0OJgdyb159vaO4JN/ihfH+hsfNTLX4CINzxlYlhtz+xOa7ZQ39AIy9zOyyFG9
         HxCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGv0D1jFl9+J+NmnGV9ZtEKT9uh+Xr+epnWENx4uYmqZWUVgZTSjUhN5SYFMPoj/4C0OI/ZsKIj3JLPA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Mxi50LKBGw6Po3RoBe3ox75ryCejMq8fhRpsQ3g0E6DbwsmLU
	feCeaRe+e3FfHomeJyvSArxkuWkSU+3XNApBuSbrTUvGeIAh4XYF+pgAto+pLFP9cJFS2IULeoA
	pQc8Bwm1/GxBEuQ4KEOGEcX6V+X9gE6w=
X-Gm-Gg: AYBFou0fsrmKjEKJ4nHnTfH+bJ2PYhvPsa+DLXJIkW6/eV+sYt9V4bB8hIvBtEdj8jv
	Gbg3Cryc3806pkD18POSRROQ2ZhO8F3flLXbEY7HSjZyE86aBt4m4wZLNSOhO0amv/q2PyJIG3+
	k+xCWw78hH3oU2Qxrmj5c/fjpPChdI63H7tju9hPRdUeianpJ6wFQSCrtRGTAPsbznWu9tFSK8g
	mKhGDoU507+76YQfZoqjopXWbw2HI7R7JAQ9otdLB23hRfo1vI/75UQD4YBF6gOLoC1u+Emsv2m
	jEhjoYcdAJvZPIAiDXYL9bAvLucEPIK/wEs6CveOiyka4NDL5FV/kUyazcggD4P7tI45jJH1Cme
	jjRjA1mX/DPfC+X/KIG86F1xUHD5NQ4h/uWqO5Q==
X-Received: by 2002:a05:690e:1183:b0:677:d419:8a27 with SMTP id
 956f58d0204a3-67ba501b9c2mr13354407d50.51.1793817291284; Wed, 04 Nov 2026
 10:34:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Nov 2026 19:34:00 +0100
X-Gm-Features: AclHuK_BL_NkBC94LItzmxoqmdRwZHsCG21WJll4bbRrLdBM3Wvnf0wDs-TvvBg
Message-ID: <CABdCQ=M_FwJOEG9Lhzahk=qA-qmqMH1QeGg7dfFPWdwT=4J63Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: Add the K1 APB timer
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_103452_844893_55F0887D 
X-CRM114-Status: UNSURE (   5.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RWwgbWFyLCAzIG5vdiAyMDI2IGEgbGFzIDk6NTYsIFRyb3kgTWl0Y2hlbGwKKDx0cm95Lm1pdGNo
ZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4pIGVzY3JpYmnDszoKPiBbLi4uXQo+ICsgICAgICAgICAg
ICAgICB0aW1lcjA6IHRpbWVyQGQ0MDE0MDAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInNwYWNlbWl0LGsxLXRpbWVyIjsKPiArICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSA8MHgwIDB4ZDQwMTQwMDAgMHgwIDB4MTAwPjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHRzID0gPDIzPjsKCgpLMSB0aW1lciBzcGVjaWZpZXMgaW50ZXJydXB0IGFz
IDwyMz4sIGJ1dCBLMyB1c2VzIDwyNgpJUlFfVFlQRV9MRVZFTF9ISUdIPi4gVGhlIElSUSB0eXBl
IHNob3VsZCBiZSBjb25zaXN0ZW50LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
