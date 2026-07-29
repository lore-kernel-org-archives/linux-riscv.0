Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A00C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QX9cLgq4AYpiFXU23FdzS7mefpd8e84AJXDBx7Sm+8=; b=r/QgD9/M1BiiKL
	44en4Eead/nPpNW3yeyR4k1GCDqDR3f9V05ok2n76YGKgfim9n/sFdbR/yJH1q47FJVb4oO793zl/
	UZpBAcYNxpcS+f2yBFNfg+LQ8bcTXqs6ImA5lawAx5ZGI/5qvo5cSrZi+bN7KW5/LW/P67akHEpTu
	Xo0LU2hCf22OZ8czRWQa6XfKpYrUm6c1SCylUbcvEsVMp0MOKjRoFR3FGRwxbnleSXu1emxn+97EH
	GUATvhcwpipB2yKPGm2eBxVXmzyxhvxofM9sgYhqcDvQiKCCsjQLDWbF5/zys7Kzta58BlXUnoPJS
	kycCvfqoly1fCB0X6b5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3vw-000000080Bb-10SK;
	Wed, 29 Jul 2026 13:02:52 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3vt-000000080Aw-2edp
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 13:02:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-472326ca506so691452f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 06:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785330167; cv=none;
        d=google.com; s=arc-20260327;
        b=L4kGVO7smx927UqkvPIin3g07527NJMI00+crT1VDV7LEUNGUiGCMNfQVFPu0ucevk
         RIO/aJMT6zCFuH0bRvYbJWfxysS7toGkzxQDvSKTyxBfYR8Ffp0CHqi27J3G4j5blv5i
         epbawEv7A0BuXs7bRAzt1eIdZvrWrKencNV6sDO6y1pGHNAqhLsM6JD2sZFwGGGBf8kE
         cAm0Nlmt+kpqmHhy/V5nDh9ZnwfNk1qoFREFBCKRSs9QVUoFJOyBweo12q0zYRrDLC9j
         yUAH1ke2uW1vFSQaBKGbjfQVUZ7Yei9JoLt7AYmtaYq7DzNJiZ9sIrFYLTNF+jnZV8PL
         saig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwG4KZ8DundkT4/gQU792HRUkxOVMwanRijYp1dPzBA=;
        fh=ofjQlhrC4RcUlM2Qq74dWP3uRiCFSm+4rJlutv+2nKk=;
        b=GZ2/840UnuFsnOrr/j624qLu1/g43rtGeG7M3pOw8N2LfjVKPYGsbnaz9yWRlVs0Es
         BHuoFnn3PpvGs44CkwzeY4aE6ETvrSkAwFV78WEKg94B5rQZ2zVL3qqjCqs//g4dDP5Z
         nCmEXnm365hz7j3UuigCjeU8a94KHDMd6HYhajR9wYX6TMjgXHs7A5jzMMHQNrlQmZcu
         CuaQ/sPAmLQHqhglByMXKuy0OOYqC25f+iuarAu89Svkro4XkcWqhEQg+cbMcRck50jh
         9gvkIQY0o+S5jCnEwJ+4EQoD5cFaSb2JjG9k/IaKH9XITw7Dc6d96DI1F5msAvXAHOka
         z35Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785330167; x=1785934967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwG4KZ8DundkT4/gQU792HRUkxOVMwanRijYp1dPzBA=;
        b=jgiheH/HIBpRUR2Yl2vzDiTAZ6Q7iq2z9zVTd1zngUIu9zvVr6eGEgVd71pfwJlKi7
         wXc5i3QoYjRKkZ+9KnaGmiw7Zeq9Cz3ZtbHWCW+eJSB+NW1D03CoNZsECLCtPuXEOEP5
         93C4XzLKw4xz7lc7yLjyOHt3YU+zhS4QPTWAa7ITYkjpHsOAvL9JmwOlz9cozmozYqo9
         ePlkCRNxrTLO4i5XKeKRYN96N/QGxcC7hjVDRXkSB23bnfiOYE13jKMttE2PJ0gmfEy7
         3QjtG8czYh33V6TGz6U0mPkDhIzSqSSl1Wl3xwYySlHXsP/dnmBdRhyWh3hgdvBxq0iB
         726Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330167; x=1785934967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwG4KZ8DundkT4/gQU792HRUkxOVMwanRijYp1dPzBA=;
        b=VgOXMYenB4Dkz38GqKCVRgi3yPg6ckwZf65UdFH2c5UAou+r2TdrTDpt3d0dpOWH5F
         nrYmrVNYQu5mQ2QOqrInrwMFunEUbqQ/nqEIBhn1X9bssvPKrXdrhDNsa1RRx62EwXdB
         JnrPVzoOaaL6pV9Bfs1A8pvJzm6QfTFXft8RTjt5S2KtPgb+9wnUI2/OuXx8mjnbCZBL
         tO7gxTFuB5NoEv5ve8zn9Rvq6LJXLFUCTkfBrJjF1aBJEfbksMpq4+YVpx6IdZGydNuT
         8MAki7jD/uvFTTcMzzJUhisVuwp4FjuBEG+p0chscRsOFEX0Ai+dmXeof45b0HP9pcwC
         Rv6w==
X-Forwarded-Encrypted: i=1; AHgh+RpUcnqSiqTowScLqVhsgftLIYhD7rja2yOLi1hTjRZtUraHDATclSGrDmNnViTJdPcRgqqFUtfStkzDbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDxGdSw60xuLUsANLoQGt6xx6Db4PjG06NIDqLUBen3U0JUORd
	IWT7AYrx/Vaq7XTbu7zYokQqVMxSHyF08M6cdcQS6B1YN1Dhe3YmxyKaLRNGSrp+4S69wEe7XiQ
	pV0XGTJkwgsuBJ05Q1Wdb8zm714bBb5PM2r5B9W/lAw==
X-Gm-Gg: AR+sD105P+KYcy51c3JCv2+hRhFBL7+gG5vtZc0gmppd+X3KXBbfys3cQSfJz8gNfGS
	Q1tkKUqCygIp2H7Vc9D/CSK5VMWHCX+FXOLBi57DDs6AYdNGsZ8NwuV2mx3GDxWjQ1w3AGJ/w/m
	wxM+oaT4EinRcapAB9Xwab/eRMHrmGC/X/kuB4cwPiW+1989qNaSHPJywhnnl08+Dbi3AaBnVDf
	QlpwJ1zgA5xUlHkwgmwoYD+6QFWp3h/9P4ZyA7UR06YMxrW4cn0f2hsiepTri+8Ude9nf6DydsN
	UpQlQlVRNjNagFfkAOfm7eoRjEEzxdh5AkyGVMg169HKkfJF7ARLSu8aAnP1Zl6XMsSfDV57eaG
	WDPjPwCDkXUmRvWxy6L+vmBBbeL0TCY92Fgkpn/4Nj/5+93n5HI0bexTc41ubSSE=
X-Received: by 2002:a05:6000:2905:b0:47f:87f5:ed32 with SMTP id
 ffacd0b85a97d-47fb1f1ee67mr8269589f8f.46.1785330167110; Wed, 29 Jul 2026
 06:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-6-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-6-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:32:35 +0530
X-Gm-Features: AUfX_mwE8ZwJxVamoxay-s7b9HbXLhua7tMXOSg40tFpb0mLvfWDnTva0izJLrg
Message-ID: <CAAhSdy2Eg3H73At808Bq8yXv64j+nowRXzHZfMBsC=MDke7Bzg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] RISC-V: KVM: Handle software-check exits for VCPU
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_060249_689699_134487E6 
X-CRM114-Status: GOOD (  15.22  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNjozNOKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIGV4dGVuc2lvbiBaaWNmaXNzL1ppY2ZpbHAgaW50
cm9kdWNlcyBhIHNvZnR3YXJlLWNoZWNrIGV4Y2VwdGlvbgo+IHRvIHRoZSBwcml2aWxlZ2UgYXJj
aGl0ZWN0dXJlLiBEZWxlZ2F0ZSB0aGlzIGV4Y2VwdGlvbiB0byBWUyBtb2RlCj4gd2hlbiB2Q1BV
IGVuYWJsZSBaaWNmaXNzL1ppY2ZpbHAgc28gdGhlIENGSSB2aW9sYXRpb25zIGluIFZVL1ZTIGNv
dWxkCj4gYmUgcmVwb3J0ZWQuCgpUaGUgcGF0Y2g2IG11c3QgYmUgc3F1YXNoZWQgaW50byB0aGlz
IHBhdGNoLgoKUmVnYXJkcywKQW51cAoKPgo+IEFzc2lzdGVkLWJ5OiBZdWFuU2hlbmc6Y2xhdWRl
LTQuNy1vcHVzCj4gQ28tZGV2ZWxvcGVkLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFj
LmNuPgo+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4g
U2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPiAtLS0K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X2V4aXQuYyAgIHwgNCArKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRleCAzMWI4OTg4ZjQ0ODguLjIyNGFmOWZhY2YxZiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBAIC0xMTcsNiArMTE3LDcgQEAKPiAgI2RlZmluZSBF
WENfSU5TVF9QQUdFX0ZBVUxUICAgIDEyCj4gICNkZWZpbmUgRVhDX0xPQURfUEFHRV9GQVVMVCAg
ICAxMwo+ICAjZGVmaW5lIEVYQ19TVE9SRV9QQUdFX0ZBVUxUICAgMTUKPiArI2RlZmluZSBFWENf
U09GVFdBUkVfQ0hFQ0sgICAgICAgICAgICAgMTgKPiAgI2RlZmluZSBFWENfSU5TVF9HVUVTVF9Q
QUdFX0ZBVUxUICAgICAgMjAKPiAgI2RlZmluZSBFWENfTE9BRF9HVUVTVF9QQUdFX0ZBVUxUICAg
ICAgMjEKPiAgI2RlZmluZSBFWENfVklSVFVBTF9JTlNUX0ZBVUxUICAgICAgICAgMjIKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X2V4aXQuYwo+IGluZGV4IDBiYjBjNTFlM2M4OS4uMTJlZWJlYWJkZjE0IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9l
eGl0LmMKPiBAQCAtMjQzLDYgKzI0MywxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfZXhpdChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gICAgICAgICAgICAgICAg
IHJ1bi0+ZXhpdF9yZWFzb24gPSBLVk1fRVhJVF9ERUJVRzsKPiAgICAgICAgICAgICAgICAgcmV0
ID0gMDsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEVYQ19TT0ZUV0FS
RV9DSEVDSzoKPiArICAgICAgICAgICAgICAgaWYgKHZjcHUtPmFyY2guY2ZnLmhlbnZjZmcgJiAo
RU5WQ0ZHX0xQRSB8IEVOVkNGR19TU0UpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IHZjcHVfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAg
ICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICB9Cj4gLS0K
PiAyLjU1LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
