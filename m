Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46002CA0EFB
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ldgn40Ogt3gsFsnuUw4NE9Ms3VXt9L42MlFeo09hCls=; b=2NkHxA+nQ5tauN
	o/K4VJGIuzitUy6lZbmYOEzdRG/Ol+lBv/X7aJErmhCvNuHLwe4fdgvr9aR1HkKXSXYeMQz1Qj67O
	3/12UJ6+KjGUmlQGQKkUzOQDbuhyns+gSrHct8W0LdrB6mTGBdLfnrgi1RJgzYf3tY90tIPd3jMwz
	sW+WysHzK9xept0dQ16lFfb1LqU+TS/knM8zBeCuLdRBSEX5ZcjshZtGx0ULtCGSIJNZft5ZOiRi5
	MNZflZqJbqcovBlJCQCWw28XYp8SSWKF5QWb0g0amFKPQwGSU1EJLEPO+o5Wffij9/EV26BFwbVvi
	trj2e+LzaP0BKQUcwv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyVA-00000005htv-1qqj;
	Fri, 30 Aug 2024 10:05:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyS6-00000005gmT-0Ei0
	for linux-riscv@bombadil.infradead.org;
	Fri, 30 Aug 2024 10:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TGh6tOVfT3AGgZmYj7CotHEnsUZ6hNFR9Fk9bpSkfUo=; b=QBwPjupuaP/yKSMs0zqPO1Pnb3
	kryyePuMxWnlFFb5Eo1OuSz1LswIrGxCCqN6UEBv34DETWRC8DTeXyzzpfuRajg/b3E6PKsYlINrE
	sPJhM9LJwSYnos6BL8Hs9VSRmFDeL8qZ9BZTON1fYa6V5XZ4N5kBxEptTKBhAvCLINeRIkE/6+t4Y
	2s2E+w7Wjy6XulV/ht8SuUR9XweWBhODG+uuzNw3ELIFhhMrmLDB0yzJn1Up6cVuhMrmQSjmbj5v+
	xTWdaz/BsI4lBlHy5Kuwkmvu77uF+cChpS1c/fhiVdMiI7FCmRwrH0/zDEIYkU62zxAXHHvC5kFf0
	7YL27JFg==;
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyRy-0000000Be0I-2PgB
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 10:01:55 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2700d796019so872223fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725012103; x=1725616903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGh6tOVfT3AGgZmYj7CotHEnsUZ6hNFR9Fk9bpSkfUo=;
        b=W1FIeX1pJOV2Vi0A5e/B94ICsnqYpK8BwtevoYJySf3sY10bo57Fee8E6cTQRWddqo
         T/BZuYR6bYoOO8lUMxuAg5azlUEoAQs2NKA8VaMmO/thaLZ2dFlPkBIJYuheFZQYrE6U
         IT6KhE9LTxn2reyrBjhUnwE3xHi42UBIWmO5vrK/sQ2c68irVLgkYemkZv+Pid3M7mqS
         +lii/yQ02cIl4Bfwt8CeUAoYQvKKQhYlPzL0r7z66HWND7xTRchW4RwVwKudsFIpL+SH
         4R+Oa0AeafbWqHa8zWZ+rq8gjrAYFtHxcfYGB0WxH/J9wy1GLPS9sH5WwHz307+IPDrw
         uyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725012103; x=1725616903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGh6tOVfT3AGgZmYj7CotHEnsUZ6hNFR9Fk9bpSkfUo=;
        b=PvapMC/V8h4y94geWXPb53ttraOTk8baUSsTw2//ePsVMmceNvlH0lc3qqSFjw5NxH
         4ET1PZKt80wFXofK31y/sWi9oyl5tAyKB8oe0l0VKSIxr/xT3EPT2o/jcLePGAn2YGAb
         xcnMaIvTmi/ymEydHjvhz0pU4xxj8ZKtEzSbWGDuX6RNcnf87L6DwpFNYzGOlL/pUNW9
         BA7re7HOnesOzupu7hISW7hNnvDROJ0DUVIDf5Gqgoo+CxL5dOgzrY/ITUumymNkgarr
         MCxkusJU8i/6MIPIQ0WOYDn6YQBSXEYOWCDBS6TDut2ghW0ToW1R8e8l8Bc5cvJujlta
         8oiA==
X-Forwarded-Encrypted: i=1; AJvYcCUdmRP1vbiTRUnEhnTMIqlhr5Z5nA50UoSaORm4HbbwlchnQwyKFvFrwwR3FKOuG+fCtt3d6mZ+quHVvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4pEMVWRLregiyQ+Yz1m2/Rp4Rx9wzvaCp+ySCtzHSZ87+b2LU
	L0BDi4MhxO3JwroD/qEkotaCzWm/7n6MOavYLIUAYTjvtCN4htkjd3KjIvUa9M9gdqokyV1EHDO
	JUy8P0+4yuz8IFF7lP1yeBKZ4HK+bqw865wGlFQ==
X-Google-Smtp-Source: AGHT+IGgJq/nQWVrLteUCrCDYkCkCI+cLIsJ8x+FujDVpbUmLezFx0No7xlEbHjnEnq9yqlFxxMSaWSfJiKh7JuD0qo=
X-Received: by 2002:a05:6870:9121:b0:261:2357:5a29 with SMTP id
 586e51a60fabf-277902f60bamr6302103fac.46.1725012102541; Fri, 30 Aug 2024
 03:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240824004920.35877-1-cuiyunhui@bytedance.com> <e06a3bd9-6378-2d4b-b06d-cc2d58776eca@gentwo.org>
In-Reply-To: <e06a3bd9-6378-2d4b-b06d-cc2d58776eca@gentwo.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 30 Aug 2024 18:01:31 +0800
Message-ID: <CAEEQ3w=PsM5T+yMrEGdWZ2nm7m7SX3vzscLtWpOPVu1zpfm3YQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RFC] riscv: use gp to save percpu offset
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, dennis@kernel.org, tj@kernel.org, 
	samitolvanen@google.com, guoren@kernel.org, debug@rivosinc.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, puranjay@kernel.org, 
	antonb@tenstorrent.com, namcaov@gmail.com, andy.chiu@sifive.com, 
	ajones@ventanamicro.com, samuel.holland@sifive.com, haxel@fzi.de, 
	yang.zhang@hexintek.com, conor.dooley@microchip.com, evan@rivosinc.com, 
	yang.lee@linux.alibaba.com, tglx@linutronix.de, haibo1.xu@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_110153_900819_27940F0F 
X-CRM114-Status: GOOD (  10.38  )
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

SGkgQ2hyaXN0b3BoLAoKCk9uIFNhdCwgQXVnIDI0LCAyMDI0IGF0IDk6NTfigK9BTSBDaHJpc3Rv
cGggTGFtZXRlciAoQW1wZXJlKQo8Y2xAZ2VudHdvLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIDI0
IEF1ZyAyMDI0LCBZdW5odWkgQ3VpIHdyb3RlOgo+Cj4gPiBDb21wYXJlZCB0byBkaXJlY3RseSBm
ZXRjaGluZyB0aGUgcGVyLUNQVSBvZmZzZXQgZnJvbSBtZW1vcnkgKG9yIGNhY2hlKSwKPiA+IHVz
aW5nIHRoZSBnbG9iYWwgcG9pbnRlciAoZ3ApIHRvIHN0b3JlIHRoZSBwZXItQ1BVIG9mZnNldCBj
YW4gc2F2ZSBvbmUKPiA+IG1lbW9yeSBhY2Nlc3MuCj4KPiBZZXMhIFRoYXQgaXMgYSBzdGVwIGlu
IHRoZSByaWdodCBkaXJlY3Rpb24uCj4KPiBJcyB0aGVyZSBzb21ldGhpbmcgbGlrZSBncCByZWxh
dGl2ZSBhZGRyZXNzaW5nIHNvIHRoYXQgd2UgY2FuIGRvIGxvYWRzCj4gYW5kIHN0b3JlcyByZWxh
dGl2ZSB0byBncCBhcyB3ZWxsPwo+Cj4gQXJlIHRoZXJlIGF0b21pY3MgdGhhdCBjYW4gZG8gcmVh
ZCBtb2RpZnkgd3JpdGUgcmVsYXRpdmUgdG8gR1A/IFRoYXQgd291bGQKPiBnZXQgIHlvdSB0byBj
b21wYXJhYmxlIHBlciBjcHUgZWZmaWNpZW5jeSB0byB4ODYuIHg4NiBjYW4gZG8gcmVsYXRpdmUK
PiBhZGRyZXNzaW5nIGFuZCBSTVYgaW4gb25lIGluc3RydWN0aW9uIHdoaWNoIGFsbG93cyBvbmUg
dG8gZHJvcCB0aGUgcHJlZW1wdAo+IGVuYWJsZS9kaXNhYmxlIHNpbmNlIG9uZSBpbnN0cnVjdGlv
biBjYW5ub3QgYmUgaW50ZXJydXB0ZWQuCgpZb3VyIHN1Z2dlc3Rpb24gaXMgZXhjZWxsZW50LiBJ
ZiBjb25kaXRpb25zIHBlcm1pdCwgd2UgY2FuIGluZGVlZCBtb3ZlCmNsb3NlciB0byB0aGUgeDg2
IGFyY2hpdGVjdHVyZS4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
