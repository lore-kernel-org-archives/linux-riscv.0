Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3E0CA6009
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 22:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbA35hTGtMqwewomhAuHCMuhMrK1co9ZyHyGSSTYV6Q=; b=3LlQmBzRzw8FB+
	SqugmZWSRrpbbnEVfoE4Fxc3AeB91Jci+7+IvIuRPGcccS2a1a+NHOuxwbNIhh7/VCMQawn9S8YrF
	7L6qTuGYikTv00OyBwpSwzLeig37vJNO3BbHonyR6E4DSob6G4TW9GsKWLnTACEuNgFWovlX77eko
	7gpNJNkAUR5rO40hdpRGPBF6da5pxqLMzFR854fhfMK7OirpLjUd2agmvp7V0MmjbLGifjftyRgpW
	jQHiHRsyhGbQBcwkxoSZxULazZQXxXHWezQ0emgouU4zjqECHWSkYkbeTzQMjiy0zYE3YxLEiU8uC
	+dmcps01sNqy3taqJfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEaSE-00000003GUa-2UNL;
	Wed, 07 Oct 2026 22:49:42 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEaSC-00000003GUD-1eUF
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 22:49:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a018493d57so24295e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 15:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791413377; cv=none;
        d=google.com; s=arc-20260327;
        b=i0EF1S8GKJP/6C927b5Xw5EK2IEfJ+SQXWf3UvEbjJzY9rFHp9t4B0TLmJOtkpwTgg
         HKS6uyCqIYa4SI97blnrXi/lL/TUITZscqPfCehzIF1PH0o0cHJd7CzxoHxdpRB36UW9
         USkLlTPzlQ64SEUGF6nrXtkFrOT6K6Xf4+FUiXs32IKWHUJ1cavfB1AORKC/6I23WsI7
         lkpzZAuZ3CPrVqmV72JpYDih59rSbB2jH4hejriy7A96tG62dmpabqna0Ia2Kd9Eh34c
         LPnB2SgQG/n3WEVth1Kz//29ITFV+CwGmn1U5g3NPKv78xTfnq2XI1ZozvrTXyF2PGcj
         IgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U16op2Ui0JYvgEISwYX/iyuFKgIG9pLc1vhaX2SV2us=;
        fh=o3XRj6ze2PrNN33D03Nj9PGRiU2l1MRIxe4jFYOni2A=;
        b=lB038+QX2XgPaahm2XpLDqpOUXl6yC+aaySj0IfYZkv+V+e21NE0fOksQACf4HrZ/b
         JOhZiS2QUBd/dSjt5B6avpv7TyNThZnXAVojaDIpQ+/xTXVbzhiRxoPWRbQ7lDc0UVgn
         9jeZDJ6noE3btMdIZU7hDIwNRirwrXm2CMKxgHPxqlTc0R+J3HMRTum92d/lvFaOVSEc
         KE1+1y7Mhd29A0s+vqcHU+qEXGUo969Zvlwmd3w2G2fEZU0JrcJQigwjY1J8Zbspv7SR
         g9qwgiQtrBcX0ELfXR70aoZbW+gFk1Yx8jii/wpVleUltNLTcfVz3jt2/O4KZpXz2aZt
         QWgA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791413377; x=1792018177; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U16op2Ui0JYvgEISwYX/iyuFKgIG9pLc1vhaX2SV2us=;
        b=IeQIK2ymYN7YC7nKtChdFvU3D6/M+9LyRSnsiZM2pvJ/ZNlJcMLEdlnrQTzijGlgoA
         wHuFKTRYwD3LTnOK/dLIurYcRUJ4afNKL4p39FMtm152qfvrjIuEJwaH1W1pQwbLpiOW
         Fx9nqlIOMKWb/q0zdD77j/w01VpUQzOMSVtcrZnpBcpbdO8KyTFlzznl4tE4/2cLQlx4
         UpJWIsUbiKUpBowpSnvd3aDiPottepN6IsD+8HUk92U817i/gLpnLJMie71Rdw+VAoJv
         X1N0wdpDVifaZ+xrQ4CUDJMeOrOtvRetBASWtIyrRiID+3kuW3omPii/DVA1XuWENH30
         0pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791413377; x=1792018177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U16op2Ui0JYvgEISwYX/iyuFKgIG9pLc1vhaX2SV2us=;
        b=rHf6kHoELFvGYYun4zvNivUD42g1b+nU/wmtBA7KB4SEhvJGKTtVFboS03OUNe9oxI
         x4tGRU3HoPXYdHT6jiIFWacCRasU6OCw0Bh5knEeFIBJ86dgZMuZkvxkzB3V6j6UGx8G
         JykrVdt0Km7YCgdB9uZPSzoQT7IxxeU9psUDuj+PF607yjQLag/9fpwBGhL9IiM4voaZ
         9t0noLZxtr8M2RflRS7UvRlriIHJAAr0Ve/Kdv1gLEwYwkN1ifpcqXKNEd3WGRvSpw3t
         Y5fwlWLWF9JgtuuZVQ6YfzRh9NrF1uitXFnghpq2lNWTXmqbFeC/V1Jb2kxXAlCFTuos
         QqcA==
X-Forwarded-Encrypted: i=1; AKwUvBxslV46HEaiR2EHtUrQLLaExaCuV6D+AnobAtVrVx8a1RIpDFr7z4QxyV6JUQFNui+I8hgkuKqHS4ZnwQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ncsRaLICR2O5zP9AE+VKbaWLP4TIMAw6OvNIA/D8FyQk8I/mm3
	3B1tXrBdBhozZTPAIz94k+Hax7+MJD4pL5FE19yQ4uCk3eLn7h+Ln7JxnU03SQqKNquloiuCs0a
	untj7+Kllcxve4jIzzEhlI8KW2rCvvkrbkZxsWDYQ
X-Gm-Gg: AYBFou0N38bAbkOrG9jqQrTsE1/JxiJUWWeTkdho+DvNKK+hF99pTzPJXIbvdAzIdy7
	2YFv4WcTAp36yOREwzaIV1SFbFYqmIuH9//TrZvDZ3vPCmd4Pu6dGymNS2wR7cJHXs7bICC8rFY
	l9+4rNZ7O/5kn7jeBCzf0/RVcGqm4G9XbaBVBci8x7b9c27bo+V1HJVgPRE265jHmRiwhNW5+u7
	843UbZyn3EBLhxkIeb/gc+pqt87MRwo3pK4XBgUy2BE//NWBTFN743h9Uu1WSed/CSfIdh5868m
	hHgpqICEDVqiQSyXR5VLTL/nMHEF9s5z2BdTGknHJ15GVwIk6i45
X-Received: by 2002:a05:600c:2154:b0:49c:ff18:79bd with SMTP id
 5b1f17b1804b1-4a18591a665mr105865e9.9.1791413376953; Wed, 07 Oct 2026
 15:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20261001135711.934152-1-guoziyi114@gmail.com>
In-Reply-To: <20261001135711.934152-1-guoziyi114@gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 7 Oct 2026 15:48:59 -0700
X-Gm-Features: AclHuK-OHjmAc40mDjPz8eYhHrh9Q8RxrfmmtdzMZsmdMbZL56s7kGmmUzZWIM8
Message-ID: <CABCJKuf=ExB_=Qwowtx-jtiKG_ZXyqPkxK09maGjReUZs6EP_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: gate shadow call stack reload on
 sstatus.SPP, not tp
To: Ziyi Guo <guoziyi114@gmail.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	wangruikang@iscas.ac.cn, debug@rivosinc.com, conor.dooley@microchip.com, 
	namcao@linutronix.de, zong.li@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_154940_453107_076445C8 
X-CRM114-Status: GOOD (  13.31  )
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCA2OjU34oCvQU0gWml5aSBHdW8gPGd1b3ppeWkxMTRAZ21h
aWwuY29tPiB3cm90ZToKPgo+IFVuZGVyIENPTkZJR19TSEFET1dfQ0FMTF9TVEFDSywgaGFuZGxl
X2V4Y2VwdGlvbigpIHJlbG9hZHMgdGhlIGtlcm5lbAo+IHNoYWRvdyBjYWxsIHN0YWNrIHBvaW50
ZXIgKGdwKSBvbmx5IHdoZW4gdGhlIHRyYXAgY2FtZSBmcm9tIHVzZXJzcGFjZS4KPiBJdCBtYWRl
IHRoYXQgZGVjaXNpb24gd2l0aCBzY3NfbG9hZF9jdXJyZW50X2lmX3Rhc2tfY2hhbmdlZCwgd2hp
Y2gKPiBjb21wYXJlcyB0aGUgdHJhcC10aW1lIHRwIChyZWFkIGJhY2sgZnJvbSBzc2NyYXRjaCBp
bnRvIHM1KSBhZ2FpbnN0IHRoZQo+IGN1cnJlbnQgdHA6Cj4KPiAgICAgICAgIGJlcSAgICAgXHBy
ZXYsIHRwLCBfc2tpcF9zY3MKPiAgICAgICAgIHNjc19sb2FkX2N1cnJlbnQKPiBfc2tpcF9zY3M6
Cj4KPiB0cCBpcyBhIHVzZXItd3JpdGFibGUgcmVnaXN0ZXIuICBBIHVzZXIgdGFzayB0aGF0IHNl
dHMgdHAgdG8gdGhlCj4gbGluZWFyLW1hcCBhZGRyZXNzIG9mIGl0cyBvd24gdGFza19zdHJ1Y3Qg
KCZjdXJyZW50KSBiZWZvcmUgdHJhcHBpbmcKPiBtYWtlcyB0aGUgY29tcGFyaXNvbiBzdWNjZWVk
IChjYW4gYWNoaWV2ZSBieSBicnV0ZSBmb3JjZSB3aXRoIEtBU0xSCj4gZW5hYmxlIHVuZGVyIG91
ciB0ZXN0KSwgc28gdGhlIGtlcm5lbCBza2lwcyBzY3NfbG9hZF9jdXJyZW50IGFuZAo+IGtlZXBz
IHJ1bm5pbmcgd2l0aCB0aGUgZ3AgdGhhdCB1c2Vyc3BhY2UgbGVmdCBpbiBwbGFjZS4gIFVuZGVy
Cj4gQ09ORklHX1NIQURPV19DQUxMX1NUQUNLIGdwIGlzIHRoZSBzaGFkb3cgY2FsbCBzdGFjayBw
b2ludGVyIGFuZAo+IGxvYWRfZ2xvYmFsX3BvaW50ZXIgaXMgYSBuby1vcCwgc28gdGhlIGNvbXBp
bGVyLWVtaXR0ZWQKPiAic2QgcmEsIC04KGdwKSIgLyAibGQgcmEsIC04KGdwKSIgaW4gZXZlcnkg
bm9uLWxlYWYgZnVuY3Rpb24gdGhlbiB3cml0ZQo+IHRvLCBhbmQgcmV0dXJuIHRocm91Z2gsIGFu
IGF0dGFja2VyLWNvbnRyb2xsZWQgYWRkcmVzcyAtLSBhbgo+IHVucHJpdmlsZWdlZCBrZXJuZWwg
YXJiaXRyYXJ5LXdyaXRlIGFuZCBjb250cm9sLWZsb3ctaGlqYWNrIHByaW1pdGl2ZS4KPiBUaGUg
cG9pc29uZWQgZ3AgaXMgc2F2ZWQgdG8gdGFza19zdHJ1Y3Quc2NzX3NwIG9uIHJldHVybiwgc28g
dGhlIHJlbG9hZAo+IGlzIHNraXBwZWQgb24gZXZlcnkgc3Vic2VxdWVudCBlbnRyeSBhcyB3ZWxs
Lgo+Cj4gRGVjaWRlICJjYW1lIGZyb20gdXNlcnNwYWNlIiBmcm9tIHRoZSBoYXJkd2FyZSBzc3Rh
dHVzLlNQUCBiaXQgKGFscmVhZHkKPiBpbiBzMSBhdCB0aGlzIHBvaW50KSBpbnN0ZWFkIG9mIGZy
b20gdHAsIG1pcnJvcmluZyB0aGUgY2hlY2sgdGhhdAo+IHJldF9mcm9tX2V4Y2VwdGlvbiBhbHJl
YWR5IHVzZXMgYSBmZXcgaW5zdHJ1Y3Rpb25zIGxhdGVyLiAgU1BQIGlzCj4gd3JpdHRlbiBieSBo
YXJkd2FyZSBvbiB0cmFwIGVudHJ5IGFuZCBjYW5ub3QgYmUgZm9yZ2VkIGZyb20gVS1tb2RlLgo+
IExlZ2l0aW1hdGUgYmVoYXZpb3VyIGlzIHVuY2hhbmdlZDogdXNlciBlbnRyaWVzIChTUFA9MCkg
cmVsb2FkIHRoZSB0YXNrCj4gc2hhZG93IGNhbGwgc3RhY2ssIG5lc3RlZCBrZXJuZWwgZW50cmll
cyAoU1BQPTEpIHNraXAgaXQuCj4KPiBGaXhlczogZDE1ODRkNzkxYTI5ICgicmlzY3Y6IEltcGxl
bWVudCBTaGFkb3cgQ2FsbCBTdGFjayIpCj4gU2lnbmVkLW9mZi1ieTogWml5aSBHdW8gPGd1b3pp
eWkxMTRAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2YW5l
bkBnb29nbGUuY29tPgoKU2FtaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
