Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D40C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SQ7dVFaRRrEfssYt97WLh5+Jlrrsuu9o9k9tHDCGxY=; b=EXKq14H0cyaYFb
	iYslNmR/0z11yLwUdMR3ENfoYYWxQx4Ih1VSTOBJkn8sfaRyn9KDap9GnnPRYbdFKpiw11GKs3gwh
	bBqtid1zVnhTjTNJ0Mx+yz+I9HWVv0LDnLf/YA93cIX+/K696Lx43xinVxYwvP5FGgbOYdGTdYr53
	IfH8VEzoT+pihvAE+Scy7BUiX30ZCMqeSgCFAZFAu2otwmPowQZWOLMJIE1sDzCFE1JZtl6f8zJj1
	gn/If0Xa7iFBhrqKOiUXEawW0rUq+6uTFk08W6O32Z0WnSdBcNEoip/2QS/nbI09Pn7JH00A1/gbI
	5IhuR7uoyZ2iOM8pWzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCx8l-00AvS7-1w;
	Tue, 12 Dec 2023 07:25:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCx8i-00AvQO-0N
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 07:25:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-336221efdceso1399722f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 23:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702365906; x=1702970706; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B27xiFe5ZInauBvN5IV6bsU1xf8ZxSkrwGh2mtgiMg=;
        b=Vjn9Z7th7XAZKZ99l3iG6K3MQCvy39a8g1xD410CI9c1iPgXuniouMO6oEjUKNsV8d
         Jl6M1F0hMMlH1cH/3ZRZgYEjueMQtDu63QCU35KKfp0W0kTWnLVVSX9tb/KgO+ZqQlNb
         WIcwJpaTzRZw2JK3E43MBqC709AuH6ohZCNkmV7ORkIa+ejbsUQr5Zv0KwgPbHbbGiLY
         3YysvQxe17KOHqTz0wjsTPxko1IbCsLaubEjU1WvnGu7WlZtYbe2w3ensxXneXId3aOc
         djN6q6fTLybFMxKrsmh5pHyshHyld9ucfhrENQs5CCoMfokRYUkg9EDqvjM8lFP6ELh/
         FSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702365906; x=1702970706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/B27xiFe5ZInauBvN5IV6bsU1xf8ZxSkrwGh2mtgiMg=;
        b=BZH2/jfoIuDUQdyXyXruILiH/QR3k7twHBY8AWl61DHf5axBnlyoImCqr3c1NrIbd0
         xY+5nLmqSa2VBJlOX2mcmOkAL8UJZjSofpElG9IHEFPjIXjxAr4vAAFk8DYJ6J14zThi
         /jbmgrhdpfYKzvQIei/qUEvEQIoJBxahob4QL3EQJFdIfgG4evSMRGyDKu4VSDFzgMDn
         w6ch0PIuXkWKdfAaFCiHyR0JO9LBndL2AnFoJQDqNosnuiTXqQs/6L/4RYL/1YLoJf4V
         FO2NYKvgC4HLB5StR1RzG5lk16wQ9O7lt1FB7dYT3RojOn9z5UNPsaA6l6NAQMwtVeeZ
         B8PA==
X-Gm-Message-State: AOJu0YyUnf+u0f17m1Gi0bBoAf8s9z+GbELGihSZYUyHjowLrR+mW3Y/
	ksZPz7uDvUiFM6tYmgFiwul+0fT2JV7Pi30dRMJ8jA==
X-Google-Smtp-Source: AGHT+IH1Fb9rddRA5/WR8NmRfrJizAad5afbmusjY3Kdfxu/oah8d3lJ45zcFFksR2gvQqvOR8i0RRi3MOJa5cw/QqE=
X-Received: by 2002:a5d:6205:0:b0:333:2fd2:7678 with SMTP id
 y5-20020a5d6205000000b003332fd27678mr1229203wru.105.1702365905783; Mon, 11
 Dec 2023 23:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20231211172504.058ad6b6@canb.auug.org.au> <846f4d8a-16ad-4ce2-9bcc-34e03f057421@infradead.org>
In-Reply-To: <846f4d8a-16ad-4ce2-9bcc-34e03f057421@infradead.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 12 Dec 2023 08:24:54 +0100
Message-ID: <CAHVXubitXvkWmvHd7JXs5kTZC4L2VvOD2B_ue3D5hUhevOpwfA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 11 (drivers/perf/riscv_pmu_sbi.c)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_232512_352520_C38740C7 
X-CRM114-Status: UNSURE (   9.76  )
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

SGkgUmFuZHksCgpPbiBNb24sIERlYyAxMSwgMjAyMyBhdCAxMDoyMuKAr1BNIFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPgo+Cj4KPiBPbiAxMi8xMC8yMyAyMjoy
NSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToKPiA+IEhpIGFsbCwKPiA+Cj4gPiBDaGFuZ2VzIHNp
bmNlIDIwMjMxMjA4Ogo+ID4KPgo+IG9uIHJpc2N2MzI6Cj4KPiAuLi9kcml2ZXJzL3BlcmYvcmlz
Y3ZfcG11X3NiaS5jOjEwMTU6MzU6IGVycm9yOiBpbml0aWFsaXphdGlvbiBvZiAnaW50ICgqKShj
b25zdCBzdHJ1Y3QgY3RsX3RhYmxlICosIGludCwgIHZvaWQgKiwgc2l6ZV90ICosIGxvZmZfdCAq
KScge2FrYSAnaW50ICgqKShjb25zdCBzdHJ1Y3QgY3RsX3RhYmxlICosIGludCwgIHZvaWQgKiwg
dW5zaWduZWQgaW50ICosIGxvbmcgbG9uZyBpbnQgKiknfSBmcm9tIGluY29tcGF0aWJsZSBwb2lu
dGVyIHR5cGUgJ2ludCAoKikoc3RydWN0IGN0bF90YWJsZSAqLCBpbnQsICB2b2lkICosIHNpemVf
dCAqLCBsb2ZmX3QgKiknIHtha2EgJ2ludCAoKikoc3RydWN0IGN0bF90YWJsZSAqLCBpbnQsICB2
b2lkICosIHVuc2lnbmVkIGludCAqLCBsb25nIGxvbmcgaW50ICopJ30gWy1XZXJyb3I9aW5jb21w
YXRpYmxlLXBvaW50ZXItdHlwZXNdCj4gIDEwMTUgfCAgICAgICAgICAgICAgICAgLnByb2NfaGFu
ZGxlciAgID0gcmlzY3ZfcG11X3Byb2NfdXNlcl9hY2Nlc3NfaGFuZGxlciwKPiAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+Cj4gLi4vZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYzoxMDE1OjM1OiBub3Rl
OiAobmVhciBpbml0aWFsaXphdGlvbiBmb3IgJ3NiaV9wbXVfc3lzY3RsX3RhYmxlWzBdLnByb2Nf
aGFuZGxlcicpCj4KPgo+Cj4gRnVsbCByYW5kY29uZmlnIGZpbGUgaXMgYXR0YWNoZWQuCgpJIGFs
cmVhZHkgc2VudCBhIGZpeCBmb3IgdGhhdCBoZXJlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMzEyMDcwODM1MTIuNTE3OTItMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwoKVGhhbmtz
IQoKQWxleAoKPgo+Cj4gLS0KPiAjUmFuZHkKPiBodHRwczovL3Blb3BsZS5rZXJuZWwub3JnL3Rn
bHgvbm90ZXMtYWJvdXQtbmV0aXF1ZXR0ZQo+IGh0dHBzOi8vc3Vic3BhY2Uua2VybmVsLm9yZy9l
dGlxdWV0dGUuaHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
