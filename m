Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE9CCD5BD2
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZD8qYzFQ9M6rham5MPcLTKfJJ7gNV0efnmmEsjtQ7jE=; b=ljKW80QYcVMYxr
	65SQupailzR3Gc7XgpD//EgC8Z0a5w/6Rav3zM9IhM2Ti01MfNdh2aBFM3Ly1flbRzaWZpWQ59RfX
	Cgj+K97vNUHcsmDr/firXGPBuZ5FSS5LwPjM1rPL4ymLrm3ZazyWrmn4IhkQNF3VPDxggslmgrt66
	pGX3WxbUcNh8mEVFwJPhpwgKNZcqT4nDcGYa3mv3gI0ePxZr8Uv9W7vvpM4LwaYLc/4xgaj/Izeif
	+OkK3vMfKP7+ucG54bcDafOAwVRR1RBV9PwsAgUnuQ7b0NxoCzbc3LHZ3fwcb9XbiTpbAU8eGrBVR
	xE4ENm3wd995s34hAZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVEH-0000000HIas-071O;
	Mon, 25 May 2026 13:20:25 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVEE-0000000HIaL-36KE
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 13:20:23 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-63169437ac7so7419380137.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 06:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779715221; cv=none;
        d=google.com; s=arc-20240605;
        b=LVYE82e8g2Vww1wK3GbWqmm7BP/wA7oRXX9KqEYVIvy4KtRIHX2ScfZwifWzEvccUY
         bPniwp4mY2+V99iqGGVPDWs5DaeVXOXz3EZsND2B8tmeZlfYuCMbLrHzaz2/z+gR3LB+
         aYjE770inaMFohxAS8C4DYlmKxCdzBv1ap3WGPMhrWPr6c4+zrjeoRzvP2sY85A2KlMg
         sgyEuC1yhzuiDKQRqaUCclQewmRT1H2gwgHygkShLVhs0zHIoQ/bgiibC65zMsxmLHA2
         iwiHEzGDpxmFMR3rMO9L2FX5CHKjO5+sE2+FtHPpwf7Av2uInqzPVZ7ANDoZ9XkAeY2L
         WcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H8N2CcqFztQXQLLOBJwOEfb4d77XDsLqWr4GU9jN4dQ=;
        fh=Sd9UUomxKRIUJ2vmq75YURZyOFJhiHt9sB0O96Ez0sY=;
        b=CprGEy3CH8Y4oYNXT4JsMJ7XCuNL7T7CkjHxob6YACPz5uwlI2NoXBN6/DwbW2Jap+
         quuUDFPcUAG5PRTl9lvltk1B0J3pf8o7ZxPHN6h9/9yXJm7YRhgG1z2dfdkKsCgrGwSb
         MC5hZwB0GcZyzc9HiqyPdvwo0XrMIw/DdbMVE/mAWgzCQjNe7E50gfaKR/U/e97nBbjB
         wQxcZTMyGzXO7upBABDQ4WkrHB25OJiaoJeiygSLeg4OWRtJENueeSZ4KkLDa+evkYEe
         ug/qDsKJTeZjZWWQAuCINUyYaZvIZEsgXuzjvAyPgENxo2iVqxYIRk8Qf9xtW/HPCw1l
         LzaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779715221; x=1780320021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8N2CcqFztQXQLLOBJwOEfb4d77XDsLqWr4GU9jN4dQ=;
        b=G2sUKdJyC1Fdo7nF/nFmgSJOru1mAihSi5oZvhgaQU/+c1uEmzCkU/1IjsTh/aGYA8
         /MpQvyUjLdebrcoYGdGBnP/zcm1Lmmg747hN1ToH2y6X5gm1cZ0m2Smf4EZMrJj1ZQRE
         ZSvmi4U3JfvhMQSMWy3uyaLTEWRioHDI0ZiyOg5V6XrDA5mBw1VhkzATzkBDzebuZy+g
         DymC85rA22xPYGDtp9f9sq7a0VSq88+mO0d0uAztgBSsQn13zkUqVIQAti8Wq8vFBf9m
         SUjb7h4IdQsFxnkeR8FP6m9iH0R3sd6iNutei3jB7h9kMQ6Jz2UQjJ5ZvGG6tWtsbffI
         eVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715221; x=1780320021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H8N2CcqFztQXQLLOBJwOEfb4d77XDsLqWr4GU9jN4dQ=;
        b=scwDObB1cxUMrv74yBZedeIfthybiHGUJtQpuR7mus4GY5SYBppb/uJ/rl/6ee6mip
         I6MU32SFodpWSRvTcN0ApTQ3+4PrA4vthjaTNWQJ44fcaSZ5dD85/dkezNF7YroTUSQu
         kpAAg7e356V4hnYzpLl1nuOQ68jjw/SeJUh2wKWOdP+zuKFp/cZJgIfX3YJkjVjWvRE+
         d62Xso+ZzGMUJt/x9aKdVgqnBIcPOhOfI2282ogT+dRlWy0EQRiKkjjFTyX2SRkExMFZ
         GfHTrhmgTdTy2KlBaf7Kcv+5HYmI22EW+QR91/GrT7z/wdhv0YACjak9vxhwCA0Lx+yO
         tv0w==
X-Forwarded-Encrypted: i=1; AFNElJ+dUvb23Q+tqJKOYPd8ZEgDO24mlV3wfC9PGkdAd0Ud5ZOoCXf3s/tUFjj7kDc0dix9hUgF75hu4uAaFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbAwfrEu+TpG+nM63eZHOdI5Pv0m5bOEdGWB3ktHj92ZKqtpXW
	2ViVC9mZBzJZmVul2EXEY6Y2dazpvTpy1KZXNZmoYLI+jkYmTdbSGhVujm9V4mMS6HgPQS/Sq1h
	uQfk+Hy5PO3b49o7CkOBKPWc4RFjb3TQ=
X-Gm-Gg: Acq92OElvew+wVvMbL1Yx1AXqMKGGHlCn0p9Oc1tzKFVpUf9WCcVtyJvhhmEkDL724b
	jCPMdBkTby8ycwS9sAfZ1HdErQPY3mYxpNnloqROANNw8Iee+Iglkp5VSFJ+pg19oT3G6t6Fo+I
	2hvnH4Xs3Q+zkQiGfAme9XYOvRFTW++ITVa6iLJJQIniydmGMpEyNJ8JX5yKaTsoD7P2J9uB+W2
	hcfCuMG4Am474k+QTPe3SaMJlhJgjPHHBHPPzExyNhFUEd6Nc088F4Gm4QtlCOESwy1Hr7nhKNi
	kFsnL4kqWt4+gIKG1ECwetoizueikanrBx+uSanMz7ma0kTrfMTy11UyOEUhqJ32PZXDiYJv27W
	WCKFIiHVsIfiWxGqqeA==
X-Received: by 2002:a05:6102:5a89:b0:631:5ef5:8324 with SMTP id
 ada2fe7eead31-67c8d07131cmr7308717137.23.1779715220158; Mon, 25 May 2026
 06:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260519165546.123105-1-gaohan@iscas.ac.cn> <b06ac7de-6c91-4536-1f06-56fb782150d4@kernel.org>
In-Reply-To: <b06ac7de-6c91-4536-1f06-56fb782150d4@kernel.org>
From: Han Gao <rabenda.cn@gmail.com>
Date: Mon, 25 May 2026 21:20:08 +0800
X-Gm-Features: AVHnY4LtIFm9Dl4e8fCotrudD8IzLPIzDyiqD-pLfxWsjlREmZ7t1ckcXG7XFXo
Message-ID: <CAAT7Ki-WDPpfdvB6MHdJW9Uas_jKVGeNjaOPvvpsPkO2wG-9oQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: unconditionally select ARCH_KEEP_MEMBLOCK
To: Paul Walmsley <pjw@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_062022_787564_B1EA3CD6 
X-CRM114-Status: GOOD (  11.67  )
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgNjowNOKAr0FNIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgMjAgTWF5IDIwMjYsIEhhbiBHYW8gd3JvdGU6Cj4K
PiA+IFNlbGVjdCBBUkNIX0tFRVBfTUVNQkxPQ0sgdW5jb25kaXRpb25hbGx5LiBrZXhlYyByZXF1
aXJlcyBtZW1ibG9jawo+ID4gdG8gYmUga2VwdCBhZnRlciBib290IHRvIGluaXRpYWxpemUgdGhl
IHNlY29uZGFyeSBrZXJuZWwuIERldmljZQo+ID4gVHJlZSBwbGF0Zm9ybXMgYWxzbyBuZWVkIHRo
aXMgZm9yIGtleGVjIHN1cHBvcnQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8Z2Fv
aGFuQGlzY2FzLmFjLmNuPgo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guICBJZiB0aGlzIHBhdGNo
IGlzIGp1c3QgYWJvdXQga2V4ZWMsIHNob3VsZG4ndAo+IEFSQ0hfU0VMRUNUU19LRVhFQyBqdXN0
IGJlIGNoYW5nZWQgdG8gc2VsZWN0IEFSQ0hfS0VFUF9NRU1CTE9DSz8KSXQncyBjdXJyZW50bHkg
YWxpZ25lZCB3aXRoIHRoZSBhcm02NCBhcmNoaXRlY3R1cmUuIElmIHNvLCBzaG91bGQgd2UKbW9k
aWZ5IGl0IGFjY29yZGluZ2x5PwoKPgo+Cj4gLSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
