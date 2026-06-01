Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35F7CD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4i3grd1Aal/7mSYcso2j1hNQ/yZ9Nubx5LThWkBkhKc=; b=SFTzUD/sepsG+p
	rzsbPzbdyiXdaT0Xvz/exg1kNcCu+rYWXGZGOJCqasZNQCWiXVS3aSyoqr4cZ9JBWmejr0Gidhx4Y
	cSBt4hPLpDx6ldnZDHT3tjyHIGEb/NzG07ZpzYLnUSMG7fZSOg7pm84HTHVvlCgwKq7auhDxnchX7
	QMi4m6/jgJd5NIqmIP7ylZ5V4/qY01as7nus+O2aehKu4e2ZGRJ5MpS3zRjmipJH4mrEC5IzvnQn3
	CNBmXtmBp3+LbkacPQJoVwgynwLVCQMW70WM0btyLoBL0yv2v2/3WzRDtj1rwzFIUmAOheu48F3cO
	vfewi4EG1oOYHYfDrlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTy10-0000000AMHe-2mGU;
	Mon, 01 Jun 2026 08:28:54 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTy0y-0000000AMGX-0Sob
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:28:53 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-69d96e2d14eso2826976eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302531; cv=none;
        d=google.com; s=arc-20240605;
        b=LOGINx9lkgnmyHSHiFPx51zlHaWX8A/7eMPdLOgdH9fE2u8yertg9pWLv4/qStmbQb
         aYEEIQU1KWrBV2VVo+CocCpyamFRsQZ8qxHoSal4SwcbjpexmCMh4KKlkm61DtJOTsYM
         PHSAtt0Q1kmIdpUqn7275rtzQW7dP+OwenRhqjPD4zKn/zcn1h1juIKLNeXxG9I5jCmo
         lFGZxGIYLJz+abQ+mXGaY1VWWFrFQWrp6KZXakRCnw/b9ByieINuCk69iJ0xO26iql+C
         PSbhErxXZ9CF9MSAKr7dy3lr4AIQo5Ey9i+utOumbUadyAE7EA/zEEjkp41cyZ6lqRQj
         B/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ESq39BgNzEi4Yu/c7RvuT+HDwB/a0FKWuDwlbw5nEw=;
        fh=MW2QLZiiIYTJBAo6cxwC/IAmoYH1+nGsLc8ykP/DCu4=;
        b=jPNijh3VNFMZwnlSfOX2ucXR6megK6C9Lpt4OgpcOcmQ2uVIbCZ2dE/+u5VVCipDtF
         MPzWdFcuBffLq8XxmniBduwRyGUjgNwVbOfaU/Gm94Fpu23M0iWLATOHAOHmKAi7fLu0
         vomeH4/uOUI7Xa1SbVpCEs8pnsFRWDKh0M4obGz+W8CV/rmOigmdA0eBBE6VT6QjRVZq
         LBPLadFp2a7ALbYWv7Mhn47gNOa7LLzGygnpftW44ZFIpK0yd8s0d92HvzT+vFX6lTYQ
         cVNY9NQu2j52HogTW3Kh3j9nv6i7vOr7HrJ/XVTapBS7d/Qzv8GuJoQXZ7gDG6vU3h5Y
         ve0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780302531; x=1780907331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ESq39BgNzEi4Yu/c7RvuT+HDwB/a0FKWuDwlbw5nEw=;
        b=LOggm9bAVLtTaXuMmoZgoUfUS1sTuk606+0G6xyEjkje/8P76YJGHSETUVLKI4rUPj
         kZW3Rl59aWGLFr66UiadffvN9yM7uakPujqP8uP5yhR+bbvIwk93wFssXqtANj6I1UE0
         8jSWxQRbL6QdAO2eRZDLND+3bZG8mJqjlvX3sNWzzUHpiEpoZaeqqoxyoNy5ZWEeRRcH
         bGHROy/uCFe8DsrIpTZXZjIBPmxHeKpjHbxsyqQ/Oj23ZuNnt9NgDiqdOZw9Q+zBZnHi
         QYcKsXnYR874jGF96o3EMiiF5I44O5jx2ZEVHf8jhfBfR+AvI+T7BWM9amzMc959Yxy0
         bDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302531; x=1780907331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ESq39BgNzEi4Yu/c7RvuT+HDwB/a0FKWuDwlbw5nEw=;
        b=LyzuMZekSHMUfrFRZZ7ufM/HeEz0a37MU7ASqJAblEXGMSJLeRgevVll+N9DFb9fAd
         OjhHTM2TBfPxIlc5T3rKHM9v0rNlVWZY+2AcOuBdYX5AVPIVG6qe3PmIhkXRC8TVkuIk
         b4mdU6WcNXmd0FaGXYStJ2tYge86RO7TQXDtG/dgJJwSvw6W1dVoFJmYegVh7wXBsMcg
         KgpLmcbqOSWkAqmu7WOsvsm5W7pOZOIo8vBLQdJPyVxQg9lPh5EMrhBrv/b1l6awgokH
         LaDXda671FiKqc8MavAu4LC0iYqctjX9axI5xEGVt6Pel5EXGVSy3K8kgRIR/TT54CvJ
         2BXg==
X-Gm-Message-State: AOJu0YyhJQqv7OSFraaUb7Cf+pr3jFHm/EjTchp7w6MjAAmrpX6kM4Sl
	9lQC3xdyz8rm3PFmFuTZVknGNQPtH93n9kHF8l9TM/zHIbr//6ku97Xi2kd7hQzrdWV426JAvJs
	ZxTdLSIYfLpo077V3qsLhoBGVxUuAu6iyz6dlN9Nl+A==
X-Gm-Gg: Acq92OG4dIH2arfIjr7J0LH+fD4iqDOF3x0KtA0ziCIKysLzI52/K3cUyVGyR0RIfxq
	4Ob2l/wwc/8lgMc6hbys8YIk5fdU0C3+7cgy2tI2jgoSjsy+l+r8NPXe5t+Gy8qJa/3INzLbjjo
	+7Diqz53QNleNcGjJToUQuGqywe0Bq1+ShmxUWn7I4VxficLyP3iH/0LyjHW+2TWQZZrzf8nKty
	E87RDEFguU2hb1dCpzLxW5qWcycF4wFgeHlYBQ7VYzZUMxljtqpab3tiuhmFmLByAmu7DTcRtgC
	BiU59h0AgBSM8Cz05lhd939yteheTGEjGCLO5DbaGa6oG95exwmTV6fHRsgCTZDA0XbLd97WSNt
	F/C1piV8oJtswWon2bv9DFpe/lJ1nBZ41RPWpWQ==
X-Received: by 2002:a05:6820:6ac2:b0:69d:79ff:d3b4 with SMTP id
 006d021491bc7-69e10403a78mr4828258eaf.7.1780302530944; Mon, 01 Jun 2026
 01:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260511032144.361520-1-rosenp@gmail.com>
In-Reply-To: <20260511032144.361520-1-rosenp@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 13:58:38 +0530
X-Gm-Features: AVHnY4IF73bShScS20qflmRSB7AeBeAPcEqSmcKeX3spZ09pNG9KxLbJgNe5j3s
Message-ID: <CAAhSdy34CXr4cky4cpg6eVV3FdwHvnR=pJqK=Y+ZsLLx0jL1_g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use flexible array for APLIC IRQ state
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-riscv@lists.infradead.org, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_012852_288979_C9FD1FF1 
X-CRM114-Status: GOOD (  19.22  )
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

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgODo1MuKAr0FNIFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21h
aWwuY29tPiB3cm90ZToKPgo+IFN0b3JlIHRoZSBwZXItc291cmNlIEFQTElDIElSUSBzdGF0ZSBp
biB0aGUgQVBMSUMgYWxsb2NhdGlvbiBpbnN0ZWFkCj4gb2YgYWxsb2NhdGluZyBpdCBzZXBhcmF0
ZWx5Lgo+Cj4gVGhpcyB0aWVzIHRoZSBJUlEgc3RhdGUgbGlmZXRpbWUgZGlyZWN0bHkgdG8gdGhl
IEFQTElDIHN0YXRlLCByZW1vdmVzIGEKPiBzZXBhcmF0ZSBhbGxvY2F0aW9uIGZhaWx1cmUgcGF0
aCwgYW5kIGxldHMgX19jb3VudGVkX2J5KCkgZGVzY3JpYmUgdGhlCj4gYXJyYXkgYm91bmRzLgo+
Cj4gQXNzaXN0ZWQtYnk6IENvZGV4OkdQVC01LjUKPiBTaWduZWQtb2ZmLWJ5OiBSb3NlbiBQZW5l
diA8cm9zZW5wQGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjIKClRoYW5r
cywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jIHwgMTUgKysrLS0t
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jIGIvYXJjaC9y
aXNjdi9rdm0vYWlhX2FwbGljLmMKPiBpbmRleCAzNDY0ZjMzNTFkZjcuLjc0ODEwN2MzNDdkOSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva3ZtL2FpYV9hcGxpYy5jCj4gQEAgLTM1LDcgKzM1LDcgQEAgc3RydWN0IGFwbGljIHsKPgo+
ICAgICAgICAgdTMyIG5yX2lycXM7Cj4gICAgICAgICB1MzIgbnJfd29yZHM7Cj4gLSAgICAgICBz
dHJ1Y3QgYXBsaWNfaXJxICppcnFzOwo+ICsgICAgICAgc3RydWN0IGFwbGljX2lycSBpcnFzW10g
X19jb3VudGVkX2J5KG5yX2lycXMpOwo+ICB9Owo+Cj4gIHN0YXRpYyB1MzIgYXBsaWNfcmVhZF9z
b3VyY2VjZmcoc3RydWN0IGFwbGljICphcGxpYywgdTMyIGlycSkKPiBAQCAtNTgxLDcgKzU4MSw3
IEBAIGludCBrdm1fcmlzY3ZfYWlhX2FwbGljX2luaXQoc3RydWN0IGt2bSAqa3ZtKQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPgo+ICAgICAgICAgLyogQWxsb2NhdGUgQVBMSUMgZ2xvYmFs
IHN0YXRlICovCj4gLSAgICAgICBhcGxpYyA9IGt6YWxsb2Nfb2JqKCphcGxpYyk7Cj4gKyAgICAg
ICBhcGxpYyA9IGt6YWxsb2NfZmxleCgqYXBsaWMsIGlycXMsIGt2bS0+YXJjaC5haWEubnJfc291
cmNlcyArIDEpOwo+ICAgICAgICAgaWYgKCFhcGxpYykKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07Cj4gICAgICAgICBrdm0tPmFyY2guYWlhLmFwbGljX3N0YXRlID0gYXBsaWM7Cj4g
QEAgLTU4OSwxMSArNTg5LDYgQEAgaW50IGt2bV9yaXNjdl9haWFfYXBsaWNfaW5pdChzdHJ1Y3Qg
a3ZtICprdm0pCj4gICAgICAgICAvKiBTZXR1cCBBUExJQyBJUlFzICovCj4gICAgICAgICBhcGxp
Yy0+bnJfaXJxcyA9IGt2bS0+YXJjaC5haWEubnJfc291cmNlcyArIDE7Cj4gICAgICAgICBhcGxp
Yy0+bnJfd29yZHMgPSBESVZfUk9VTkRfVVAoYXBsaWMtPm5yX2lycXMsIDMyKTsKPiAtICAgICAg
IGFwbGljLT5pcnFzID0ga3phbGxvY19vYmpzKCphcGxpYy0+aXJxcywgYXBsaWMtPm5yX2lycXMp
Owo+IC0gICAgICAgaWYgKCFhcGxpYy0+aXJxcykgewo+IC0gICAgICAgICAgICAgICByZXQgPSAt
RU5PTUVNOwo+IC0gICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9hcGxpYzsKPiAtICAgICAg
IH0KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBhcGxpYy0+bnJfaXJxczsgaSsrKQo+ICAgICAg
ICAgICAgICAgICByYXdfc3Bpbl9sb2NrX2luaXQoJmFwbGljLT5pcnFzW2ldLmxvY2spOwo+Cj4g
QEAgLTYwNiw3ICs2MDEsNyBAQCBpbnQga3ZtX3Jpc2N2X2FpYV9hcGxpY19pbml0KHN0cnVjdCBr
dm0gKmt2bSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhcGxpYy0+
aW9kZXYpOwo+ICAgICAgICAgbXV0ZXhfdW5sb2NrKCZrdm0tPnNsb3RzX2xvY2spOwo+ICAgICAg
ICAgaWYgKHJldCkKPiAtICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfYXBsaWNfaXJxczsK
PiArICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfYXBsaWM7Cj4KPiAgICAgICAgIC8qIFNl
dHVwIGRlZmF1bHQgSVJRIHJvdXRpbmcgKi8KPiAgICAgICAgIHJldCA9IGt2bV9yaXNjdl9zZXR1
cF9kZWZhdWx0X2lycV9yb3V0aW5nKGt2bSwgYXBsaWMtPm5yX2lycXMpOwo+IEBAIC02MTksOCAr
NjE0LDYgQEAgaW50IGt2bV9yaXNjdl9haWFfYXBsaWNfaW5pdChzdHJ1Y3Qga3ZtICprdm0pCj4g
ICAgICAgICBtdXRleF9sb2NrKCZrdm0tPnNsb3RzX2xvY2spOwo+ICAgICAgICAga3ZtX2lvX2J1
c191bnJlZ2lzdGVyX2Rldihrdm0sIEtWTV9NTUlPX0JVUywgJmFwbGljLT5pb2Rldik7Cj4gICAg
ICAgICBtdXRleF91bmxvY2soJmt2bS0+c2xvdHNfbG9jayk7Cj4gLWZhaWxfZnJlZV9hcGxpY19p
cnFzOgo+IC0gICAgICAga2ZyZWUoYXBsaWMtPmlycXMpOwo+ICBmYWlsX2ZyZWVfYXBsaWM6Cj4g
ICAgICAgICBrdm0tPmFyY2guYWlhLmFwbGljX3N0YXRlID0gTlVMTDsKPiAgICAgICAgIGtmcmVl
KGFwbGljKTsKPiBAQCAtNjM4LDggKzYzMSw2IEBAIHZvaWQga3ZtX3Jpc2N2X2FpYV9hcGxpY19j
bGVhbnVwKHN0cnVjdCBrdm0gKmt2bSkKPiAgICAgICAgIGt2bV9pb19idXNfdW5yZWdpc3Rlcl9k
ZXYoa3ZtLCBLVk1fTU1JT19CVVMsICZhcGxpYy0+aW9kZXYpOwo+ICAgICAgICAgbXV0ZXhfdW5s
b2NrKCZrdm0tPnNsb3RzX2xvY2spOwo+Cj4gLSAgICAgICBrZnJlZShhcGxpYy0+aXJxcyk7Cj4g
LQo+ICAgICAgICAga3ZtLT5hcmNoLmFpYS5hcGxpY19zdGF0ZSA9IE5VTEw7Cj4gICAgICAgICBr
ZnJlZShhcGxpYyk7Cj4gIH0KPiAtLQo+IDIuNTQuMAo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
