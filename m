Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583D6E99056
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iymYNogD7lJSC8ZLICVB+JwJKirY5AvL4k5RPL01jUY=; b=J1Ed/FLTRMMYsb
	ZpCv688EPz98D87RzFnDJitJ/mnao15HUxLIc4mD4g/esLMEvcUXpSa/UOTKJrsxqHnj4JMVSmnI0
	cTiXo7Hd/mLeMXUf4kaQXj7DPnobe48bJ8F2nVhT2zviG7ugHB2ZHSrj2l1rfMzT/3sH2fDhQqYJt
	1UA6BZGGCdM4QGbcU4Ye2uvxmGPeZNQT5M6TAgRQQ2qU04QR3v6AmLbCLWkzNjDZM0HxJ5I3zPTIb
	cqTl2dseIchqe4Qbh7I5YxIDdWRSsYmWSxfwEQzm0BcunfSrNo9FUZTkXumR5gbuGLBZKpgSdzAfY
	Np+apBpxjS9KRZBUFxVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7es-0000000Brrr-3r7R;
	Fri, 10 Apr 2026 08:56:10 +0000
Received: from mail-yx1-f51.google.com ([74.125.224.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7ep-0000000BrqV-39Fj
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 08:56:09 +0000
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64937edbc9eso1717625d50.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 01:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775811365; cv=none;
        d=google.com; s=arc-20240605;
        b=RQxO7RMibQTvSqVUW0/qCT9hERS+dTYjba2Oe9pwjXs553V2rC1TNgf0U9XCDL25va
         2CPgmR6Uo0pob8lBQWL+zE36NakrWzUS8zSiH+6ZFEtSPV5Cxu9tXyVlDpb9JI4Umvy3
         hJW4hnRgNTfDtPB8pq/kP05lOHwsL7xHufJUkeYjduqfvymZJcCIFoa5NLxk81tq24PQ
         JhSEVA5oQsEU0+g0INJR28zgpJmNDchE8zMAf6YHQoMv1dWxd7hiGaDSXazLnuX01fIu
         Yt45LfmTVxGvA+E63lvPvQALOGgImfo/y+Mk1TM5A3GjAzuxwKRa182Zhq+G+4Jtk9l3
         ra6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=3KAh6lwIOjsU1XZI9AtaEthJQQVMuTum+SSM5m5Dpp4=;
        fh=S4bESKTQjdLazUccjMtLsFhTyPdh02EM5CsTXp9YNDM=;
        b=S3uLTHI3ygTsepvT3uQRMQjdEtZ7BDOuc5wEIYQEe4H0ahvpyRGLTzkWZNPRd5ehVj
         0DQGQZjXNyrKP8PtkSpKK+Ul7GmpOMsFf97jeUdvYOx3KgjxIi8uYFurHGv4g+wTrFmu
         50BQhx00RzZsUSPtd3a63uqRaDPVvbVJtgICoUMlXy0u71Oa/cIzZikyWPz1785patAZ
         q4X4g0dQGYHgJeqiPn73fc93g90ROrdr2q0G5KgAle3mjFIOVgDpkNDprawe3EAeqooP
         R0TkJyHSvBRhqeHzd0fRZx1kWP+QKUc8iJC3c+7gg2xzSbwcA9dZSBHj7fQR4vQzFBPs
         whOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811365; x=1776416165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3KAh6lwIOjsU1XZI9AtaEthJQQVMuTum+SSM5m5Dpp4=;
        b=MvucYXPudxjjXE7yRGaU9RW5tVQx9kf2sLMe69iCLiI/iBtjrfJXqQRvYXthhywVBH
         u1ITJWGtmO2MmssK/OZCoTEOTxXpyDJax6de2BtXFrtib/sdfwO6fzrENlhnwTOkMMqn
         Ji59quxa/kqH2noig5crbLjtTy8ERyKOGWOwxQ44eKxf3T2eR5dVo3prHu47JoX13Iyn
         9o7ViTcCHKmwU7+vSzHWAhjYjpgTVGm/Bl+6sR4/irFjYHIt9j/otBLXN9ToThRNF+zn
         WAUO3bXcAOz3blKY9DFcHI4vwcxKIPjD2nzkzPJ4PPbgMbWc9xjGh7//XRx9SwbSAxR6
         /9Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWfA+Nfo1xpfn872aSSXf0liAr+syfGbFcKKiAvQffyhOUr3uV5fS/znVLWsz8aHJRcdwOJHkWZaCfTDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLlVL7mMrGWE1XJZi/jOqqR7npfp7yRipNU/dZRlGTKJoDJ070
	Jy3zRd4DsQ0DVYR1usDKtMWHAEjvRa3TXG9OtKoC5Aqckr/KjQZlECQTBbeapCzOet/gduN8Tph
	6uf7sqsUoJa7zSHybASzdO4CKsh3PuMg=
X-Gm-Gg: AeBDiettGpAQYn90nZ510k6AwDqjkK8znCakO1cCIdqf/+fEi+jsvcwBoSiGyp1dtA5
	eLdkKYZIdMe/tnUaH/GuObmZln9FAVhx3tPIPfNFhcf17DPWGc49i9Asv4UDnVa8CrOkA1PRTIw
	RBBzdOYyyJ9I1JINLItS6ENtl4TV+TfwZkuxmhtocvPkmkvrJUCME7O2mYmqosrBzy0i3Lem1LD
	9YkWHt7AYypq+KyFOnjYDFrlS5YvHm8EZYYEbwbMMdo20Il2zu4ILhD3LbE5jhGlPeujJEU+tqb
	c+Rjwas=
X-Received: by 2002:a53:b166:0:b0:650:3e1f:907c with SMTP id
 956f58d0204a3-6519885e270mr1637211d50.0.1775811365143; Fri, 10 Apr 2026
 01:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260409091143.1348853-1-mikey@neuling.org> <20260409091143.1348853-4-mikey@neuling.org>
 <b3466f28-0d0f-4ff8-8542-e53216cf3667@kernel.org> <CAEjGV6yKKtN3kGeQ+tdz1xy-DDS2FD0C0X4qm-iZ3zq7LEyhHQ@mail.gmail.com>
 <c390be36-ac4a-4964-9072-7ccf074d2f7f@kernel.org> <adislUQ_dddOZZlW@kernel.org>
 <aff1c335-bd02-449e-8791-eb7050ec982d@kernel.org>
In-Reply-To: <aff1c335-bd02-449e-8791-eb7050ec982d@kernel.org>
From: Michael Neuling <mikey@neuling.org>
Date: Fri, 10 Apr 2026 18:55:52 +1000
X-Gm-Features: AQROBzD9bLD-qJ56IfBOL7VcbClzJTEf71b_NvT0VpHRlAnniIQNsVbi2HJI2P8
Message-ID: <CAEjGV6yQCLbTfHivAKJo7DDoa25N8W14nQ+5YVxUfRLzU62-UA@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: mm: Fix NULL pointer dereference in __set_memory
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Guo Ren <guoren@kernel.org>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Nam Cao <namcao@linutronix.de>, Oleg Nesterov <oleg@redhat.com>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Qinglin Pan <panqinglin2020@iscas.ac.cn>, Raj Vishwanathan4 <rvishwanathan@mips.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_015607_812785_30001E0D 
X-CRM114-Status: GOOD (  14.47  )
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

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgNTo1OeKAr1BNIERhdmlkIEhpbGRlbmJyYW5kIChBcm0p
CjxkYXZpZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDQvMTAvMjYgMDk6NTMsIE1pa2UgUmFw
b3BvcnQgd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAxMCwgMjAyNiBhdCAwOTo0MjoyNkFNICswMjAw
LCBEYXZpZCBIaWxkZW5icmFuZCAoQXJtKSB3cm90ZToKPiA+PiBPbiA0LzEwLzI2IDA4OjIzLCBN
aWNoYWVsIE5ldWxpbmcgd3JvdGU6Cj4gPj4+Cj4gPj4+IEl0IHdvdWxkbid0LiBZb3UncmUgcmln
aHQgb24gdGhpcyBhbmQgdGhlIG90aGVyIHR3by4gU29ycnkgZm9yIHRoZSBub2lzZS4KPiA+Pgo+
ID4+IFNsb3BwZWQtYnk6IEN1cnNvcjpjbGF1ZGUtNC42LW9wdXMtaGlnaC10aGlua2luZwo+ID4+
Cj4gPj4gOikKPiA+Cj4gPiBJdCdzIGEgZ2VuZXJhbCB0ZW5kZW5jeSBvZiBMTE1zIHRvIGdlbmVy
YXRlIG92ZXJseSBkZWZlbnNpdmUgY29kZSBhbmQgcmFpc2UKPiA+IGNvbmNlcm5zIGFib3V0IHRo
ZW9yZXRpY2FsIGlzc3Vlcy4KPiA+IE1heWJlIGl0J3Mgd29ydGggdGFraW5nIGludG8gYWNjb3Vu
dCB3aGVuIHdyaXRpbmcgcHJvbXB0cyBzcGVjaWZpYyB0bwo+ID4ga2VybmVsIGRldmVsb3BtZW50
LgoKV2UndmUgaGFkIHNvbWUgc3VjY2VzcyB1c2luZyBpdCB0byByZXZpZXcgc29tZSBwYXRjaGVz
IGZvciBtYWludGFpbmVycy4KCkkgd2FzIGF0dGVtcHRpbmcgdG8gdXNlIGl0IG9uIGV4aXN0aW5n
IGNvZGUgYnV0IEkgYWdyZWUgdGhpcyB3YXMKb3Zlcmx5IGRlZmVuc2l2ZQphbmQgZGlkbid0IGNv
bnNpZGVyIHRoZSBicm9hZGVyIGNvbnRleHQuCgo+IFllcywgYW5kIEkgY2FuIG9ubHkgdXJnZSBw
ZW9wbGUgdG8gYWN0dWFsbHkgY2hlY2sgd2hhdCB0aGUgTExNIHNwaXRzCj4gb3V0LCBzbyB0aGV5
IHdvbid0IGxvc2UgdGhlaXIgY3JlZGliaWxpdHkgd2l0aCBtYWludGFpbmVycyA7KQoKSSBkaWQg
YWN0dWFsbHkgZGlzbWlzcyBtb3JlIHRoYW4gaGFsZiBvZiB3aGF0IGl0IHByb2R1Y2VkLiBNYXli
ZSB0aGF0IG1ha2VzCml0IHdvcnNlIDotKQoKSSdtIG5vdCBhcyBmYW1pbGlhciB3aXRoIG1tIHNv
IGl0IHdhcyBhIG1pc3Rha2Ugb24gbXkgcGFydCB0byBzZW5kIHRoZXNlLgoKTWlrZXkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
