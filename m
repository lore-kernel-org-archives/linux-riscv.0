Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58434CA1009
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51CHL1SjFJNp3XQnYMwAyeaCmyab42v17p0EG0udwqE=; b=Z/K4TXjPfYHikA
	/XnkVI3A9IE/yDjqbdCR65qPBDzgRcgy8p7W3CfDGHtFVXBgIijiQxuJlCsqfAkhXRy+LgmSJwD02
	gH8JFoF+D3HTKxZI7ev3dFFepvO53mCwW85GwOoGF8Wx2YlisL0PZiKirS3OMWoJeMMq1gvBPqTal
	9Bk9elI8MmL4pDZMKEKRBt92h1c7oF1RuxK+keZybQRVQVjLQ+2AZXTZnOsJT5XVkcHPCNBKCzvCB
	AYEb2GpQR9z+pNubh6Nle1BcSP3kueIkxGc0R7mYRLzqa2PprQBqzbBirukHEW5m6pcG+htChJzPx
	tCuD/sdRfnCKh9W5B61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpbi-00000006x3a-440P;
	Wed, 03 Sep 2025 15:41:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utn7a-00000006VDX-0K9Y;
	Wed, 03 Sep 2025 13:01:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso2539480f8f.0;
        Wed, 03 Sep 2025 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756904512; x=1757509312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxOgjN7WdDoAv2rvG3Wc6cb+dOveWBvcqA5WgB2sqzo=;
        b=XFIDqcEqw2iJ8qUHXtEBZY5aEQ38RHHD9P9+KUDGUiRM3yXvSAN5OkqQWbq0h4eDdF
         51uiNJ9C5BKrHlh3izcAC9hJ8fUbdww51WqAxjevnRETmK8Mcgh0gg/pSuwkUcg0XSoT
         ly9pOPAL+UFZSUf8AEDvTmC7ttBFUxO10wfU2rTKFXk7HU9B/RhIDtOObKp9wZZwvzIt
         jcCucd7GNDT0HTdzWTyDCD6qguOsLVNnG7w3RH25ksElBRVv7WqQkWv3LGrp3sLpfwmQ
         Nq+DYbtnAUUF2ktkzIDFqpmQoyxUUf7ye9akWaO6rp4q4ZIhLTL4pf5UZz3FXTPSi8WU
         X0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904512; x=1757509312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxOgjN7WdDoAv2rvG3Wc6cb+dOveWBvcqA5WgB2sqzo=;
        b=WgXXQs1BOQiC910z26ZblWTRZXksMPKEcpmTS96v6iDI4uPMNHWAjC8QqxewXVE6HQ
         MWbaQNXD+/nQzHSwgj7ca5A4LnJ2FJNdPA4VoN7QhJvrEY5o3zdyLikcKJ7TVwhJ1TTf
         LQinWTdzdSLZrxRc1T1njnoiqnzTZ7CUMs9dnabF2IEHwr8lIK4SEAuPcotkYGPHf6t7
         DSVPugC86+1f541sb1wLEV7REZ5it5+ZJEn7oGe8f+iX1H3UopuYtJrSMqU37DrQMKiL
         TMKmADutp7C1kzySkf861Oa3xLmeck0BkREYs1miCrHKbxY4gJs4icRJ7QUUq0s7tGoy
         JHpw==
X-Forwarded-Encrypted: i=1; AJvYcCUIYJgcpJ+SK1l6hlDdmv3SBWOJE8NCvn/7n7Rg4SQt6nALJuqbRiYnP9ZcQFAfM72IXc+0N25c/Fs=@lists.infradead.org, AJvYcCWlRVKxl3qOmflFJHniF1xlHwU4F0Dh9W9Rcq483kunKOk/Q91pfV6wZ/VVMid8FUJvP+cvskemOdU0XttqVifx@lists.infradead.org, AJvYcCXtUh+vxI35JVfEKCxCPkgn28gEsiLLBUhrFwabefEaNBYquiPfm36O6s42QzNXKEiw4EjvZjyqoi+5p9Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YzveT6HAxZITpS8+K0zyjG8lv7R1xbqY9vr2lmP/f63jOVC/fFF
	cgr6r68L32EFeujM9/3CvMhAa1eEX3I7h7agwv+6KBIxMRMA3bdfTlUuvHqi/hHL0b6jmCF6g2w
	hUneI4rDsn4IN4lHAunCzFy5s2lk4xuM=
X-Gm-Gg: ASbGncuG7eogbsIZzq1VfeS7NCs3W67orWNuulrotSh6kBCIS8wJ/U/UYPx1/JjQz5W
	mKZ/zV3fPOU9e/NBG6NxRIQJJiVz2AXDyQckxKft0Hs/tOL5/x7I1clneetwwiQcwoNuMDftFMQ
	U2mRzEunYKRLZxTZpMcAIsb2DSGTphS/nMidlV1AwKy1pfKhwzHG/86XyIwnEjXe30BmmjoWx4e
	guzJ2aQ
X-Google-Smtp-Source: AGHT+IHaI9QHXphQW4NL4BWXS0uWqM/wJHgXqqOYeELhPBU/zEzYKTUTZN/+1NM3wCGA2AyzOKaLxaL5ucEtc3zspBA=
X-Received: by 2002:a5d:5d0a:0:b0:3dc:3b91:6231 with SMTP id
 ffacd0b85a97d-3dc3b916271mr3074458f8f.12.1756904512228; Wed, 03 Sep 2025
 06:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com>
In-Reply-To: <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 3 Sep 2025 15:01:40 +0200
X-Gm-Features: Ac12FXxqG38KSSLGvfY5HirQQyjqsvLS5blUVLw1nroWjuASE3O6kwm-RqaVNbQ
Message-ID: <CA+fCnZdkHATBYG4RJ8rR8MciKmeV4QGwVwoQjkhc-O_igpUBTQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.com, glider@google.com, 
	dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_060154_112790_2D54C6F8 
X-CRM114-Status: GOOD (  14.38  )
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

T24gV2VkLCBTZXAgMywgMjAyNSBhdCAzOjAw4oCvUE0gQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5
a252bEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiArdm9pZCBfX2thc2FuX3NhdmVfZnJlZV9pbmZv
KHN0cnVjdCBrbWVtX2NhY2hlICpjYWNoZSwgdm9pZCAqb2JqZWN0KTsKPiA+ICtzdGF0aWMgaW5s
aW5lIHZvaWQga2FzYW5fc2F2ZV9mcmVlX2luZm8oc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLCB2
b2lkICpvYmplY3QpCj4gPiArewo+ID4gKyAgICAgICBpZiAoa2FzYW5fZW5hYmxlZCgpKQo+ID4g
KyAgICAgICAgICAgICAgIF9fa2FzYW5fc2F2ZV9mcmVlX2luZm8oY2FjaGUsIG9iamVjdCk7Cj4g
PiArfQo+Cj4gV2hhdCBJIG1lYW50IHdpdGggdGhlc2UgX193cmFwcGVycyB3YXMgdGhhdCB3ZSBz
aG91bGQgYWRkIHRoZW0gZm9yIHRoZQo+IEtBU0FOIGhvb2tzIHRoYXQgYXJlIGNhbGxlZCBmcm9t
IG5vbi1LQVNBTiBjb2RlIChpLmUuIGZvciB0aGUgaG9va3MKPiBkZWZpbmVkIGluIGluY2x1ZGUv
bGludXgva2FzYW4uaCkuIEFuZCB0aGVuIG1vdmUgYWxsIHRoZQo+IGthc2FuX2VuYWJsZWQoKSBj
aGVja3MgZnJvbSBtbS9rYXNhbi8qIHRvIHdoZXJlIHRoZSB3cmFwcGVycyBhcmUKPiBkZWZpbmVk
IGluIGluY2x1ZGUvbGludXgva2FzYW4uaCAoc2VlIGthc2FuX3VucG9pc29uX3JhbmdlKCkgYXMg
YW4KPiBleGFtcGxlKS4KPgo+IGthc2FuX3NhdmVfZnJlZV9pbmZvIGlzIGEgS0FTQU4gaW50ZXJu
YWwgZnVuY3Rpb24gdGhhdCBzaG91bGQgbmVlZAo+IHN1Y2ggYSB3cmFwcGVyLgoKLi4uIHNob3Vs
ZCBfbm90XyBuZWVkIC4uLgoKPgo+IEZvciBub3csIHRvIG1ha2UgdGhlc2UgcGF0Y2hlcyBzaW1w
bGVyLCB5b3UgY2FuIGtlZXAga2FzYW5fZW5hYmxlZCgpCj4gY2hlY2tzIGluIG1tL2thc2FuLyos
IHdoZXJlIHRoZXkgYXJlIG5vdy4gTGF0ZXIgd2UgY2FuIG1vdmUgdGhlbSB0bwo+IGluY2x1ZGUv
bGludXgva2FzYW4uaCB3aXRoIGEgc2VwYXJhdGUgcGF0Y2guCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
